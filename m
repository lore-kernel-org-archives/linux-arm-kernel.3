Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356FDCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=; b=j+NfOLi9o2OMNP6MFG8gCDrncZ
	Gq4fT24lkRKUPYnrUw5jL3fnDw0oW/iYOI3VDP2SLv9bqsx+YyOw7/QTrqNsbHwa4V+FOFDpr8+kn
	Zrs/N8fcNugQnS33YlmZE2WbgZeo3z3/9D1Iu1hOlt+GdaKwVaetZ9tNu26wajhQTYnjFbdGJ93ZP
	xkZD8joOIbp75zSf9WhEvCscwQ8av5VUr0xpTJMMUBQ1pQv28+kafhgcxhrlgGRa+xKNOPfArvlGU
	kUvpQ/8sidXtLac1DD4lm/KCoTQNwWiaVh8cDMdAXPpuD+5Hlu4e+56jEbOhwx228WsgI1ywwQVNV
	uom1gX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzUW-0000000Fezo-3Gru;
	Wed, 14 Oct 2026 13:58:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzUV-0000000FezX-1nc2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=; b=c2ozmQ5zPzOCt6CHLsfG4krvtw
	3aWm9gG2lVUbkYVcsfOYjj/iqrCkBTQWWWW234y4uyojc4RO6+fX4YltjC6f86oyUpDIWAYAir2Vi
	nLtu0CojsMEAXKad5/+Js0VFKtpNp2PbzYvfXnY92K9wubci3pppsgYBg3CofVraYzkYl5Qof1Xhw
	1CvxDv3u01yabZo+j79kbh0pcKVs9RetVYewxO39MPKtbOJZ8nmvRQGDNplsCwjqP1mk0kVQy44hy
	7uybijivqkPYV9nBcGLtdeNVocguOXquugTWBjQn1s1XwP5/qXXZEHC7OQPS1rfoRc6qndv2ugV5p
	ALw+shtA==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGzUS-0000000GqmT-2XaB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:57:58 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7fccba9c675so7404759a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791986274; x=1792591074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=;
        b=FRAyXHYes8yNcZn3JR3f97wpw7asNGB640xOG/uRM5dC0E6CA+sVpagKZtic5i/YH7
         n4z4+4Ah2eCah46EGd7WFpDP2vi3Px+RL3pwz0r0Umksnenvp6iDwyx6HYCF+81p/LUf
         /bBbXrjKltqjUb8MXJVgveHcoVrrKDLw4wwPsL5YdOk20w/c37opRXoG5juF9coB4f89
         obDodvdBTN7/vKcd7ANGNk1pBf3oNkVlJ1KcaxAeL+8iMUMvRlAuTdqobH9ne+gM6B5J
         5xjJE7axi1zURLY19FL5CUFajXLXHx1ZeTO5oEMjTF24ElmKjV53TQT9yR2j4r5dC9IZ
         L8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986274; x=1792591074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e0ci0C74qh1IaIQAQj4oYwASorhtlXqumTlEsvUPK0=;
        b=0sK4e7NMF8N0QSDb9yLooPbeA3XrVOLV4fcEFlE/EXdUBSU0JfRKekJUAhGkP4C57R
         hlsUTPQmehY7VSEQT4VSGJt/5PuIuSa2nKeRkY4wh+WUit5+YwZ7snEySepN/1Bj83ZX
         Ufot6PPL10m1bxu8lqURmgjUXjrgOvx0y6obNcqJMQ72WDNfUgu05oheWks5269xUtDp
         Yi7n6tBOcraP0IRvSrMe7dEZlXV1Uz3oCmu7G3il2oh0asRoOONoICPxJW6mOhU8YtTo
         jVtx138KbH3rz5BWcEuu+CGxI/vyVXutR6bNDWXJmbm3D2PLfj4j6KY793niowxQeC9S
         4eZA==
X-Forwarded-Encrypted: i=1; AKwUvByJEDYoYf9pzjRFEwLhZr908kCCcIz07Ok440EDabTQP9vCG4WfDwvdGa3AzRfNNDK9WtqrIIknjjw8AN7Q6qXC@lists.infradead.org
X-Gm-Message-State: AFq9FYJVA8UKUI7ydHXPf7svzWtJcqchrcqI/HgrLRWVRBSJbNhvIb2Z
	ORNGHQlaRsEOgSJgyPNYYAxxlsvydtb4HToTs3gLHWaw2B2DT9dR9nP/
X-Gm-Gg: AYBFou0BMCgku9fZF36A+KqVj/TtL80aQrko9PSbgjKUujr5NWwSIOw9Z48d5UyIai+
	bKRX29dCR/yCqK62Hx/Va88PLMN3/Steez4mDee+ebm8iS3FWIC9gS8oXQQ/6lh2/mj5rUx5Zbs
	FsFmYoVMOZ4VZsgTRpJgW7IQ9BrVl5gk28mg46P9Qqt/xbajCeErEqo4n3nAwPUMMRgn3nFAHFT
	Ys1VQxihyxHwfe+ihNYtaHNBKG5gRTJI58DW090pO9Bbszc4O1yEF9cg0hZV6w8GZik+KWkvBkS
	oyPRqi6t9hEjmpxqbejd7rsfhLvXnoz/qz2bXscq/YOHumokwKyZ1eOKAPRB7WIaAUnv6mlakcD
	pKWmu8fJEq0jQqPd6qoJNM+CmrXZi+tPLZ4sBSK+/ioaS9BF0Kmw1SmdMt0BdgdW5u0vzSA5Lvf
	3gngYJyOQVdrpIvEYODgspImyzcdhV1DXjktI6hhlzMys3PmxSbWorsE9jEEYEfnX9wvMcuIuXn
	ofAwL6z7NPTOnU=
X-Received: by 2002:a05:6808:1a19:b0:4f3:28f7:dfb with SMTP id 5614622812f47-50c516e42fcmr11298620b6e.14.1791986273875;
        Wed, 14 Oct 2026 06:57:53 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1815fd26sm17891866b6e.10.2026.10.14.06.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:57:51 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:57:40 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add VGA support for Apalis iMX6
Message-ID: <druavdvcgm3rljk3mhano3o424xyelupmcz7kbzguuljdsungx@xuj2ovbvz654>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
 <20261013090631.GA33628@francesco-nb>
 <20261013111158.GG56180@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111158.GG56180@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_145756_789148_278E2671 
X-CRM114-Status: GOOD (  33.20  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Laurent,

On Tue, Oct 13, 2026 at 01:11:58PM +0200, Laurent Pinchart wrote:
> Hi Francesco,
> 
> On Tue, Oct 13, 2026 at 11:06:31AM +0200, Francesco Dolcini wrote:
> > On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > > > This series adds a device tree overlay that enables the VGA output on Apalis
> > > > iMX6, which is driven from a parallel RGB interface passing through a
> > > > non-programmable video DAC.
> > > > 
> > > > The video DAC is a simple resistor network gated by an active-low
> > > > data-enable signal. For the bridge to work properly, this series also
> > > > changes the following in the dt-bindings and simple-bridge driver:
> > > > 
> > > > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> > > >   binding. This is necessary because the existing dumb-vga-dac compatible
> > > >   doesn't describe a data-enable signal polarity.
> > > > 
> > > > - simple-bridge: Add the VGA bridge match-table entry and timings
> > > >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> > > 
> > > Is there schematics available anywhere ? That would help reviewing the
> > > series ?
> > 
> > This circuit is on the SoM, and the SoM schematics are
> > confidential and not generally available.
> > 
> > I tried to extract as ascii art the relevant circuit, hope it helps
> 
> Thank you, it makes things clearer.
> 
> The circuit seems fairly generic. Wouldn't it be better to add an
> optional property ot the dumb-vga-dac instead of a new compatible string
> specific to Apalis ?

See the diff below, this was the initial idea we had when working on
this. On one hand, at least to me it seems like something that other
bridges could use, and a new property seems reasonable. On the other,
since we don't know exactly how much configuration is expected from a
bridge in the simple-bridge driver, we weren't sure if this would be
accepted, and went with the simpler solution of creating a new binding
for our bridge, which also seemed less intrusive.

What are your thoughts about a change like this?

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3fba7002322e..41b00a44983a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -171,6 +171,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -212,6 +213,19 @@ static int simple_bridge_probe(struct platform_device *pdev)
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	if (!sbridge->bridge.timings &&
+	    !of_property_read_u32(pdev->dev.of_node, "data-enable-active", &de)) {
+		struct drm_bridge_timings *timings;
+
+		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
+		if (!timings)
+			return -ENOMEM;
+
+		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
+						DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = timings;
+	}
+
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }

