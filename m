Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532A1D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sjV4jKZbmaCgDV+GkMaLzLnPZD2hmO2N+9AYVVEwgo=; b=sgnNCLUS3dPd0mXGJFr/ia/Izo
	Razt+ORIpQAjjnaLnIDcVl/keurC9MBAwR4e32ilv9L3wtbphfvW8FBuCR9fE/fAG/PjFAo/ZrnK3
	i/0tgMgPsSTUqWJO8rJ43nHJlUHDAhciE82CpfXLUE/O9lec//PacX+1MyjlUASpg2rs2hGtAfCL2
	qfYQYWd+3bSWZifT7rugFL4HbLQHYrokFoAJhk1tct2VvxN1o3agfDcXDh1Z1hIuquSv7XQSKOaIA
	K7S2mCMTI5ZV6U9h+EOoC9aI21XmQP1U09uWu4h+Nqri+kIH5LbBttoV2A+5QubiSTrLFu04ajxKQ
	vmUTVN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCWh-00000003xjF-1UQE;
	Tue, 20 Jan 2026 14:16:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCWd-00000003xir-1JGf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:16:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A69444E421AB;
	Tue, 20 Jan 2026 14:16:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75FC1606AB;
	Tue, 20 Jan 2026 14:16:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B5010B698AE;
	Tue, 20 Jan 2026 15:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768918562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+sjV4jKZbmaCgDV+GkMaLzLnPZD2hmO2N+9AYVVEwgo=;
	b=jWxVCnbCkzG1ahCUoIe6zWU7LBpBHB9DhliiM0lM8yu2Jq6FBVXrGVmvXCS3nMRLdeGeyC
	dhWRn6K1Rh+vjBnUoWUnJXUf4WRGtEXrsg7JshFYDmafpl8SIJdpySEakihoFFiDEqMngi
	iAmQzHGDrXCnxIn0Kyr75uMDpgbg2kBSbohOpxxCRM7qunkgrmR88S1QiUrDxqGpQDNc0/
	8Kr47qQmMW4s++eN70Y8Bug/+6qGCFfEInYJEtufQPtVVPjSs8Eio488J11LDjS0NqdlI+
	oyxbmSmIfSAnD2FxMebS1yS4b5RWHr5imr2k3tGt+6EBj/9wi2F6EtA93teD7Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
Subject: Re: [PATCH v2 00/12] drm/bridge: convert users of
 of_drm_find_bridge(), part 2
Message-Id: <176891855295.598401.9824700731247929118.b4-ty@bootlin.com>
Date: Tue, 20 Jan 2026 15:15:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_061608_530551_10350F78 
X-CRM114-Status: UNSURE (   9.62  )
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


On Fri, 09 Jan 2026 08:31:31 +0100, Luca Ceresoli wrote:
> This series converts all DRM bridge drivers (*) from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting. It also converts per-driver
> "next_bridge" pointers to the unified drm_bridge::next_bridge which puts
> the reference automatically on bridge deallocation.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[01/12] drm: of: drm_of_panel_bridge_remove(): fix device_node leak
        commit: a4b4385d0523e39a7c058cb5a6c8269e513126ca
[02/12] drm: of: drm_of_panel_bridge_remove(): convert to of_drm_find_and_get_bridge()
        commit: f675a276b84488e78287dd22c2e9461e4c008c66
[03/12] drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
        commit: d07490fb23958006bcecd6f2ba411571c099d104
[04/12] drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
        commit: 9d34e1a8cf7b643bca058a65f3441d90099b297f
[05/12] drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
        commit: 35dd5e1c089b6fd9f503bb15ebc1138d5a3f887e
[06/12] drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
        commit: 0bbca46cd50a527bded903ffe7f32e3761e825bd
[07/12] drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
        commit: 31cb3cd7e7149983e279f3d6da3ae5757a965ea5
[08/12] drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
        commit: 7654c807f20701ebd1dc7e967270d017dcc36730
[09/12] drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
        commit: 32529d384cea3a9b939ff1b56aa30a13f8370129
[10/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary variable for the next bridge
        commit: e5e1a0000746ded4d9fa16fceda0748aec2b6e6a
[11/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
        commit: 33f86ac63031d0593e48eb0a738f2d1b1ee29879
[12/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
        commit: 685d0dfc37d081e56374852165afc8ab3b3e8d5b

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


