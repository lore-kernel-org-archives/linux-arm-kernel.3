Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC96E8784B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibDtmuQVA6j42GniTwjElTySRXx2PReTUkYFO0TEtzU=; b=C6lOUcX/3cHCdYxMh31CKyDz2X
	H270WPsJxtc9PkL0Nz+he+hiVKRTWDyXFnW+AzU/U9sx+WkuYh+UExnI+wwPW+UoCf5WUcJj9LqDJ
	yGXsMqDCNm08QstYqihIJtx/iLYYWcrnR+NX+8YfxDoY0DejjqSM6il+kIkqAZdAz5JEhm1hzLLs1
	pffcVKz6nNVwdmddptpOd/KBS/unZz7dP5fou7lSfGKkB6SCcZ1/7QJRKPyPv6K37gsXf6BoVT19P
	09JxYF/ZhPRo/akrXm5ywlwwUWMTopKMKNsAxK3quFoo2uGemPYURFK6MdTGiTqy7DW0XKKY9zbte
	InUsGBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJed-00000006zQl-3huH;
	Tue, 03 Feb 2026 16:53:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJea-00000006zQH-3URQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:53:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D9331A2BC2;
	Tue,  3 Feb 2026 16:53:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E421360728;
	Tue,  3 Feb 2026 16:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C51D119A8888;
	Tue,  3 Feb 2026 17:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770137604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ibDtmuQVA6j42GniTwjElTySRXx2PReTUkYFO0TEtzU=;
	b=ngK5+YA89MEKf5Lyg9woI6zPXYK9jjhjeZMvfbGl3WkeDkJoKZn+MQsoOBUBLX3nGbPaPJ
	0ZuOnvRYmiH/E0y0mLOUrs1zcE8NQKeT4fEn7E8OYOMtf0amDNRuU/WNJoGWYxNRnzgXpp
	B8GD9ZGDIA4PleR9M3jPMfUnIfH6LrYDQPt4A1wQLvWAi7yhnyyOpnhJ9aUOHgrGqX+P9M
	zCT8cMcPOK8i3EBk2JeWQrGkdgobXxUsbTxsanIa9dI6EIClTz/6xlGkG7qHBdD4reiC0+
	ddP8UeAQ1v7TZ5K/stnV0oGgeG1ukjAlHqqd6lXftbS6farrYxI6Ofk5JqVavA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
Subject: Re: [PATCH 0/3] drm/bridge: imx: A few fixes
Message-Id: <177013759713.1993107.17429169659147772176.b4-ty@bootlin.com>
Date: Tue, 03 Feb 2026 17:53:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_085329_007603_53913CC0 
X-CRM114-Status: UNSURE (   7.69  )
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


On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
> Each patch fixes a NULL pointer dereference issue and stands alone.
> 
> 

Applied, thanks!

[1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      (no commit info)
[2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
      (no commit info)
[3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()
      commit: fe6d29b082d49df336ebb92226a3c004ae9e3222

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


