Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2AC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF0u3rKr9M74KSQg7RCN0+aCxKJVpc+VR+Lv57tnGPo=; b=R27bSDPpJU5qJGTeebTVyZ8SFB
	ds8tYfHfbG5kRQaJAddY9GHrcNciiDuRZ1khu/Jflcs3KbZfaixukVYxNKIYDON4lWClyH8rthN2o
	Eh1yeeuaA6TrbtrnuIsyzoVPuOtBRYMzS354CY4wv8NUNPRKv6df3emRzia0Jz6Cy2U1LCMkJmbew
	MragTdr28iuqDl+C0u3ysTcg6j4Ye2fhBKrw+5aiQn+Oqe7hR0JDd6DnjDw0c1vJPYZsL6bG7kxhU
	u9yua7ZicuVpg899b4+guUENa8OPyBq02PIGdtDmXFP/FP8Vypwaod9rUK6M8dPmSLepaqHbx9VzG
	fXmvGgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Ru-0000000HPDU-171a;
	Mon, 28 Sep 2026 06:02:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Rq-0000000HPD1-3R66;
	Mon, 28 Sep 2026 06:02:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B983C5CD48;
	Mon, 28 Sep 2026 06:03:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EE59601BD;
	Mon, 28 Sep 2026 06:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 353C3102F1E25;
	Mon, 28 Sep 2026 08:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790575360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xF0u3rKr9M74KSQg7RCN0+aCxKJVpc+VR+Lv57tnGPo=;
	b=DwnDxrhJiBekhijz8hvJwq2H5uJBe+71MSerGIeHFlNj1FyvCJM3zsKuJZtAS4uLHpS8zU
	NaH9eDdxyMGrKJH7HZXeO7DuvstXSJREBq8UGNp5VtQ3ncJNZ5npcvSMRrgBWzyo2LhSnc
	Pd6w6b8d/lykJZWInmOsxR6v8qtSqJGOKXc5hPkRDnj+56EK7ICiRX1MfHxf8TMsLMRe81
	7eBh5sOd0VMg4cjFp5yYFa1iYXMLN8oovltBRUi/6jjU1Vow2R9QJwSJpXNUQKLD/gUWP8
	ZkjNGHhoj2Pk/5ieIlarpZzksdICG53fDIC+obBNiq1TN/79cGTkyv2vyPPi0w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Christopher Vollo <chris@renewoutreach.org>, 
 Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, 
 Tony Lindgren <tony@atomide.com>, Michael Walle <mwalle@kernel.org>, 
 Vinay Simha BN <simhavcs@gmail.com>, Maoyi Xie <maoyixie.tju@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 sashiko-bot@kernel.org
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
Subject: Re: [PATCH v4 0/9] drm/bridge: Kconfig: cleanup DRM_PANEL usage
Message-Id: <179057534751.224803.9257678806193592731.b4-ty@b4>
Date: Mon, 28 Sep 2026 08:02:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_230247_029181_0E763E9A 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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


On Tue, 15 Sep 2026 18:46:13 +0200, Luca Ceresoli wrote:
> As a cleanup in preparation for making every drm_panel embed a drm_bridge,
> fix missing or unnecessary usage of DRM_PANEL and DRM_PANEL_BRIDGE in
> drivers/gpu/drm/bridge/Kconfig.
> 
> == Grand plan
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[1/9] drm/bridge: tc358764: don't select unused DRM_PANEL
      commit: 8ea0903c62e1fd2d53f68af671635a532bd7dbac
[2/9] drm/bridge: ti-dlpc3433: don't depend on DRM_PANEL, select DRM_PANEL_BRIDGE
      commit: 184046c9f35222fa3784f960ed3780b2793d62ea
[3/9] drm/bridge: nxp-ptn3460: select DRM_PANEL_BRIDGE, not DRM_PANEL
      commit: 7dda59aea6288025fd861cd8467af456f9dc26ae
[4/9] drm/bridge: parade-ps8622: select DRM_PANEL_BRIDGE, not DRM_PANEL
      commit: f378fbe78e6e87a3657f1e6286ea3964b99f30cf
[5/9] drm/bridge: tc358775: select DRM_PANEL_BRIDGE, not DRM_PANEL
      commit: c76257183d3d20ce4986d86814676ff2377c24a8
[6/9] drm/bridge: tc358767: select DRM_PANEL_BRIDGE
      commit: 65a55bb11116c080ed8e408ef95706a9c8bb393f
[7/9] drm/bridge: tc358768: select DRM_PANEL_BRIDGE
      commit: a269221bf5c304d64d6a6aceded710f8c737113c
[8/9] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
      commit: 9e0156ff263020fd4a10d5b6bc5ee550a7837c2c
[9/9] drm/bridge: tc358764: select DRM_PANEL_BRIDGE
      commit: 6095cb1190585793055953d5ee76ff3871681c6e

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



