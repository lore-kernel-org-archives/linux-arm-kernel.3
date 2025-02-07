Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECFBC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJp8akIRBnsrkrhCErMN+Bwkc1U7UHfMk23gxodu8m8=; b=JWJ0N/oz3P+pmI
	h5ma/5mq9ymrLzVqFM+2OSfmODTOV5MtQFPgbvkzA+w3A9Oo5ZXvVWiYROav9E2lYEW5/9MF1jctT
	FiLDUchTawGCWumcsWFGGGxYTsI+8Zdu+qso2HDKGH5gkEocp+jcx/9S4Cer5+q+CARQEewFBTZtR
	hqWH+bwiQpDfA7kSdCqN2Sio/Zn+guLDDhfKRSVnW1CtTs8kqeKjCv2jmBNyiIwbTTzA7FguDLrxg
	Mt3mZmqG8y5W7qR7Cy2Qx8NHExEvyWEl32flza5rBKkGp9Y2zFBIQhDaNZ4R4IPIBT46j2Ig8lU58
	w6F5gtBh2ILk4GB+c6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKGz-00000008vuM-19BJ;
	Fri, 07 Feb 2025 09:03:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK86-00000008tWH-0zcA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:54:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AADEC44305;
	Fri,  7 Feb 2025 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJp8akIRBnsrkrhCErMN+Bwkc1U7UHfMk23gxodu8m8=;
	b=fOFUp/jSh0EYlB3qkd71M2qBKu5E+E7/dC5n6KDisJA/4r2WsT3y17QPWZpgasZFqy2giq
	Vnqk2jP450DBAItyENx5W/qlOVvqiPbIaacUCJxc0w600A5K4e1k74Bo4WS8SMztjRz68y
	8ePiLneGfj4VrhE1mW0bXTRnm1dMML1bbYU4fOjmX4uivdD68YP5zcylOeZxUeawMiAgZf
	3io4ZInlrDiN+3gaXfsXPSB/EWFByv5TBXd08LfP0iB7bQ6QxngClkPsPHU9M+DLc4fb06
	b82of3CZ778gVzQBEvu5hU08wDK0/Lj4VcwgrhRKH9XK6Z+1EoekoZfpVk/2EA==
Date: Fri, 7 Feb 2025 09:54:21 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 09/26] drm/bridge: move devm_drm_of_get_bridge and
 drmm_of_get_bridge to drm_bridge.c
Message-ID: <20250207095421.07ca853f@booty>
In-Reply-To: <aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-9-9d6f2c9c3058@bootlin.com>
	<aayr7q6i3x34xw7ivvapnk6h6mgx67qhpv2rqk2gotejyjetwy@olb5lbwxd5e3>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrt
 ghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_005430_412525_1E087F7E 
X-CRM114-Status: GOOD (  32.63  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Herv?= =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 7 Feb 2025 04:52:20 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:24PM +0100, Luca Ceresoli wrote:
> > devm_drm_of_get_bridge() and drmm_of_get_bridge() do not have anything to
> > do with struct drm_panel anymore, they just manage bridges. So move them
> > from bridge/panel.c to drm_bridge.c.
> > 
> > Move also of_drm_find_bridge_by_endpoint() which is used only by
> > devm_drm_of_get_bridge() and drmm_of_get_bridge().
> > 
> > No code changes, only move functions to a different file within the same
> > module and add an #include as needed.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 102 -----------------------------------------
> >  drivers/gpu/drm/drm_bridge.c   | 100 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 100 insertions(+), 102 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index 6995de605e7317dd1eb153afd475746ced764712..1230ae50b2020e7a9306cac83009dd600dd61d26 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -418,49 +418,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> >  
> > -/**
> > - * of_drm_find_bridge_by_endpoint - return drm_bridge connected to an endpoint
> > - * @np: device tree node containing encoder output ports
> > - * @port: port in the device tree node
> > - * @endpoint: endpoint in the device tree node
> > - * @bridge: pointer to hold returned drm_bridge (must not be NULL)
> > - *
> > - * Given a DT node's port and endpoint number, find the connected node and
> > - * return the associated struct drm_bridge.
> > - *
> > - * Returns zero if successful, or one of the standard error codes if it fails.
> > - */
> > -static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
> > -					  int port, int endpoint,
> > -					  struct drm_bridge **bridge)  
> 
> I'd say make this function the main API instead (and name it drm_of
> rather than of_drm, this can happen in the previous patch).

I agree there should be a small number of APIs for the foreseeable
future (and any number of, hopefully decreasing-at-some-point,
deprecated ones).

And I agree this one ^ and the devm_drm_of_get_bridge() below are
equivalent, despite having different signatures, and so one should
disappear.

So, time to think about what APIs we want. Some thoughts of mine:

 * I prefer "get" over "find", looks more intuitive as these functions
   will drm_bridge_get()
 * Is there a logic between of_drm_ and drm_of_? Just "the former is
   old and deprecated"?
 * Since getting bridges via the endpoint is the preferred way, I'd
   like this function to have a shorter name than its variants
 * Returning a struct drm_bridge err_ptr looks better to me than
   returning an error and the bridge via a ptr-to-ptr, especially as we
   don't have anymore the case of returning a panel or a bridge from
   the same function

So, bottom line, we'd have:

 - struct drm_bridge *drm_of_get_bridge(np, port, endpoint)
 - struct drm_bridge *drm_of_get_bridge_by_node(bridge_np)
 - devm_ and drmm_ variants of the above

or a subset of these, in case some is not needed.

What are your opinions?

> > -struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> > -					  struct device_node *np,
> > -					  u32 port, u32 endpoint)

^ kept for reference

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

