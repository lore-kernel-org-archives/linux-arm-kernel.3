Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF22C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RL12cC9qRX/ILoBDTmW2NvbjM3xBeSvvr6O9KVeZoZg=; b=x8h9l6yDIFUsJwO8rgv98AcjBF
	HR334Rnhsu9KLJrRnx5cjm5tH2FsVVIs2sJEUSdUUdLuemxPGni0zZ9S0zHab7TTU4SHFtlHM9zrD
	SRPohRgjFLO6G52HmsnEHR++bGTWsVah6EHM5R/ZlwQ3KVrGJYH1Qh/6i0GlXcClnkdAQAHKhGxe5
	EEZHMVFkELZ7M0cQIZuFVpknH5IhBNVbmASl8NhElg06AHIqHSywxcx3POTRC5DFSz+mhXwV6MpVW
	p7Gq/ERp05/djFGd8yzUypmQWUawxk02FwyGTk3I2w4jYNxke159ePBmFwZgeNSSHk+fOoiadz/zg
	mtdR79fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHzJ-0000000C6Wk-1tTz;
	Mon, 26 Jan 2026 08:30:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHzF-0000000C6Vd-3bYZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:30:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 36AD94E42295;
	Mon, 26 Jan 2026 08:30:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0368160717;
	Mon, 26 Jan 2026 08:30:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5AE2119A80E2;
	Mon, 26 Jan 2026 09:30:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769416212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RL12cC9qRX/ILoBDTmW2NvbjM3xBeSvvr6O9KVeZoZg=;
	b=om7p5rE3iiSwBy9bPPxolkQYErQW/3CDgztw9hO1NsSOzcCt3Au/qjDso2nw8w+QNQWbUk
	UkEzPTb9UlKqYKAvpL9GsVOaEJmKX2fEFmk+4Ee3r8C+8TIZEGPOtwQUjQCU5IUuIMxRJn
	z6LJUNbgR9DXE2ijEVLiBnIy0QbeaKf0++EC+uEC2SyurJMh42AV9e19mKvUjmD8jYiJu+
	+Q+RIwCS/Ip57PyXQdLH/RRv5vnsFKJciIh9RqI4MJYsAnXAeMe5kl8E5oUOUyopCRJ0M4
	/b2bLgC1Qg7JGb+y/8Fu4jrnUwmNHgxUTudw3edMKm+7ysEjJO71Xx6dKBOslg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:30:09 +0100
Message-Id: <DFYDP4W448IT.144L31296M4LG@bootlin.com>
Subject: Re: [PATCH 2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer
 dereference in imx8qxp_pxl2dpi_bridge_destroy()
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
 <20260123-imx8qxp-drm-bridge-fixes-v1-2-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-2-8bb85ada5866@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_003018_052938_4C5D0E08 
X-CRM114-Status: UNSURE (   8.15  )
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

On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
> Pointer bridge->driver_private in imx8qxp_pxl2dpi_bridge_destroy()
> is NULL when imx8qxp_pxl2dpi_bridge_probe() returns error, because
> the pointer is initialized only when imx8qxp_pxl2dpi_bridge_probe()
> returns 0.  The NULL pointer would be set to pointer p2d and then
> NULL pointer p2d would be dereferenced.  Fix this by returning early
> from imx8qxp_pxl2dpi_bridge_destroy() if !p2d is true.
>
> Fixes: 900699ba830f ("drm/bridge: imx8qxp-pxl2dpi: get/put the companion =
bridge")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

