Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98BEC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJK7fOiDsEdgNBqnNoS+yYdJDypAt+EMWhvumKttT4E=; b=spWohzFNtxke004z3rl+40SllH
	UI5QxeqxzoV+j+XjLFGsCnCI8sMNBj21D4oCi7dozSmAUgzrhATkuM6eaPd9UQqHL64uxBdPmWoyx
	FEUrhLSHk5NoUf/XQ+tGv2OIWwPwgs3Y1TPltGGUiXemUIdaLB4o7MVTRWGWPjRXmxO4fToYJZIro
	wygz0RSgCBnar+VMMV041rNx5qwUUPjUBUOOyOMzbLpcKXF3N7wGpvwkWsbPkL8whtoBoAOrapBtG
	s/KWCjhmajGPIZ2sVhAVsxQJJ2Dez/7sCgL9diK975T8TsveGLhJkafdTy5iZXCHDQnzKVILVNCAf
	dphAS/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkI2f-0000000C6xN-2WNg;
	Mon, 26 Jan 2026 08:33:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkI2c-0000000C6wo-3Z2Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:33:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6344F1A2A4C;
	Mon, 26 Jan 2026 08:33:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38E5160717;
	Mon, 26 Jan 2026 08:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03EA9119A8627;
	Mon, 26 Jan 2026 09:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769416423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RJK7fOiDsEdgNBqnNoS+yYdJDypAt+EMWhvumKttT4E=;
	b=Fsb1J3qvjFPYKpqKT4SHNAESEhf7nPztjLnFyLagSKCwsa1713E4v1ETHBP6De6EQjhfBz
	bTDB6V2ZzGu07c8qC4A/3bV2FhiefVDVHd5DXwNGsaRaoqE3tcbD6wyio42eoySeaEfgbC
	PYUrlI3WItjj4OmIpsZnN/kyTCWXRQMnixXi6x+eDcAH3ekZcme+Sb3u/4C1WYTEl5gLiZ
	HufcOTboaCfYDAMo5lXEQ5ORz/XzGPObLonHwdYe493pLtPX5skKDm1Dh18fTteGFD07A0
	bMGrGjxg5nBiP1da2oaXmGsgpMzUBO0vOXrqhIFNcgWUfO8efTCK37RZC1iHNA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:33:38 +0100
Message-Id: <DFYDRSZBQBND.QSY119QND1GE@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_003347_158673_6DDA6DD7 
X-CRM114-Status: GOOD (  10.61  )
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

On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
> In case the channel0 is unavailable and bailing out from free_child is
> needed when we fail to add a DRM bridge for the available channel1,
> pointer pc->ch[0] in the bailout path would be NULL and it would be
> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
> pc->ch[0] before dereferencing it.

Thanks for checking this code and providing fixes! These drivers have a
complex code path so I had a hard time in following the logic without neing
able to test on hardware. Apologies for the issues emerged.

> Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the nex=
t bridge")
> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm=
_drm_bridge_alloc() API")

The bug was introduced by 99764593528f, while ae754f049ce1 is not changing
the bug, so for the sake of precision we can remove the first 'Fixes:'
line.

With that:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

