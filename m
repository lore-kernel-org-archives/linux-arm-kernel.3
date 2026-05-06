Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB13CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdPMerPcbtmp8Pvql5y31aO4cPSUN83vlxG881DrKZ4=; b=bjGosxWecqyRjrRcxMdIagXM6o
	p4pSrfBoWgRKMwv6JeQ255p4yDttcDttASimtb12ITuyDnNhGg5zNp8aCQXh6A8GzdmqKNd11bkAG
	ULLfbs+8zUF0Ppibhh6EA/mURPakHaLjJGw135/7XfVnfgsAaD9Gi4BwZYjYhkGrllEhDU89BBb4M
	bc5mq0Gt27PXB62bRLgzsZ7OIIqRryxD24u0fJ5Irrt3i/qi2CbSzQACb7dGlTGnjO26G3MP2zwAj
	RwpyqaGvyk71LVYfQhFSCv9dqgu4JaF+trPxUa0yU2jsaQ6zXCSu6O+d8x4CcwaDCYM7P+dAG9lQP
	PZFcLYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd1e-000000012Pr-3jcl;
	Wed, 06 May 2026 14:14:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd1d-000000012Ok-3jSL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:14:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DFD643C71
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 May 2026 14:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CD8C2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 May 2026 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778076896;
	bh=S/kmyfCtgRcnnR6uKuRsciK1a6EFOEAiOWDDIUPH/n8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P0TWWejFiVyGwBeEGQrswyDGhgdW3tEtXcFMPmnguQ8KcsqeSQOXhsZoC63lqhyb1
	 QmlbF8fsIgMfwR6YxJgd5qY2LHmYtDUROxTPmuthCQPOXlzWT7ZzmrslZSdS40CIYa
	 DfwGCgJlb+o3MaVxHG7+SS0gk9F2yfPPrSRWQLVtGDnAWsMj5Wk7q0qHFt9N/GmUPR
	 xmVXMFYvPwe9jmt/1m46Cgb6S3RYyniJIegzXa4HQ4n2fNZmzDK7g3vZhnCZlRi87C
	 xFfN0ManqEBJD90kQ3GaX5yB9dl1NUv+v+wEObvaHsQ+zcnGyUPMi056dk50UzOwFc
	 ipcCbzgIEgF7g==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba922426c5cso1113792966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ISKbAtw6vuRpiW+vFy5CkhJn2hrgGqf5dz4dkbr1W4UWyWPDXyAJUamw8khjDEHjs4+GiCv5RHwv7VKQbdJk/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6oF5RRwRec2pAAZLOygwleXuiPtTbVXA+hWXWvXfQu6xPtBjK
	wxDGEYeoaQYPx1M0ogWqhdVQGYzxced+h8Umwei2xw/WjDmUAUHIos0vsq6fhVhWPfFuHTpC7BM
	kSaPKtRdkfqRAVPOBTlc9HeM6PQgeHA==
X-Received: by 2002:a17:906:ef02:b0:ba7:b198:7d25 with SMTP id
 a640c23a62f3a-bc56d13529bmr176376066b.21.1778076892767; Wed, 06 May 2026
 07:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org> <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
In-Reply-To: <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 May 2026 09:14:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
X-Gm-Features: AVHnY4JuaUtVhW_AwoHvUdOyEnlQ7azzni1rJEniHezJvRpnnGicHK1-9_FNIHQ
Message-ID: <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_071458_123839_05726C4E 
X-CRM114-Status: GOOD (  35.83  )
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

On Tue, May 5, 2026 at 10:46=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 26-05-05, Rob Herring wrote:
> > On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> > > This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> > >
> > > Remove the 'reg' and 'reg-names' property from the LDB.
> > >
> > > The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> > > (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> > > register ranges with loose register definitions. E.g.
> > >
> > >   - On the i.MX8MP there is one register which controls the AXI
> > >     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP=
2).
> > >   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, P=
XP
> > >     handshake, ...
> > >
> > > In conclusion: it can't be ensured that one register belongs to one
> > > dedicated IP and the LDB is rather an exception than the rule.
> >
> > It is fine if there's a child node for LDB if the LDB registers are
> > consistent, but the other misc things are represented by the parent
> > node. It is certainly not a requirement that either everything be in
> > child nodes or nothing be in child nodes.
> >
> > What I don't see in this series is what problem does this fix? If you
> > are going to break compatibility, then there had better be a good
> > reason.
>
> Hi Rob,
>
> with the upcoming i.MX9x SoCs the parent syscon (BLKCTRL) controlls
> multiple other IPs, e.g. a DPI mux added by commit 3feaa4342637
> ("dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and
> example").
>
> During the discussion of the above commit we agreed that the sub-devices
> of the syscon shall not use the reg property due to the fact that one
> register serves multiple purposes. In the above case the same register
> controlling the dpi-mux also controlls MIPI-DSI bits. The MIPI-DSI bits
> can be abstracted as drm-bridge as well. Two sub-devs using the same
> 'reg' property below the same parent seems odd and I don't know if this
> allowed either.

It's not generally. There are some exceptions to define things at the
bit-offset level rather than byte level.

> Now the LDB is also part of this BLKCTRL syscon device but requires the
> reg property. TBH, I don't know why the reg property was added in the
> first place, due to the above fact (multiple sub-devs - same register).

Probably because we asked for it, but we don't always get a complete
picture of all the h/w functions (though we ask for that too).

But nowhere have you said the LDB registers are mixed with other
functions. If they aren't, then there is absolutely nothing to change
in the binding. If they are, then yes, we shouldn't have 'reg'.

> Of course, we could limit the breakage to i.MX9* SoCs only which is done
> by:
>  - https://lore.kernel.org/all/20260329-fsl_ldb_schema_fix-v1-1-351372754=
bc0@nxp.com/

The rational for that doesn't answer my question either.

>
> but I don't think that this would be nice from user and from maintainer
> perspective, because:
>  1) The same LDB "IP" would have a different dt-binding
>     (user perspective)

It's not the same if the register layout is different. The point of
having sub nodes is because the sub-block is reused. If that's not the
case, then there shouldn't be a sub node in the first place.

>  2) It introduces another dimension drivers need to care about
>     (maintainer perspective)

I thought Linux didn't even look at 'reg' here.

Rob

