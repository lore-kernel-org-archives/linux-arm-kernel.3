Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000A5CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b8jFrKfRx4ipfCPfX5aq84hRP0+B67EcAHf3pzQ4YTw=; b=ebMqK8WxH1QrkIRqAup6DgZgXE
	oRKkzFGqg8KddvVRv2XHwjUPnw6TmNV0zZ6PqjWRsaYSReKyR4Gl6YBAekh92v8bE+chIZkqSlKIG
	iNF0L3Tmn8NnH/SK4jXL10hOcxfHPrh8ZxK6UmerKJozr6MqNOrWVj0nGBjJs9v5A6IzZmMdK2xOO
	uQCUdrZP2v0TiQw1Lm+sYCu9lwDcCtDACEqCvXtsiHZq2TB4Rr+RB/JXNqkyT786YNEOpZz7SCG6e
	WDvO81IV+C6ToABCA0PkXXXYuK86K756IspE+UHA0ZrGeJYDEVvlaLh40XxkM7yqmAG3kr/nCuhWc
	NSSni71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTFm-000000024Dr-0oAW;
	Fri, 19 Jun 2026 07:03:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTFi-000000024DO-1B5z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:03:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EAB091A3A25;
	Fri, 19 Jun 2026 07:02:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC442601AD;
	Fri, 19 Jun 2026 07:02:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D28A106C81C6;
	Fri, 19 Jun 2026 09:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781852573; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=b8jFrKfRx4ipfCPfX5aq84hRP0+B67EcAHf3pzQ4YTw=;
	b=dCwaUDkrLLIcRV9ZmJaM9t/39llO++sqZWMDkYbTebHJLvAiHWAwxTRbNOA3ozF8fjpduT
	sPwIxiNXrxztG8vW3HxN79sBPJUp2HUWJNfe7fF0uZ07Y5RIj+TmORxGI8GiBVYANoHqSS
	P7p4TR+V66s2VWZWiLQfGMS4h45NrkY/Z6+DcEYYOh8cE97qZ9pQn6SwLvy5BwLZA4/fKw
	ALR8pRpQFMaFAgyuYUoUf9ZpIdbJbUcmxLCp9V7mn8gOoKgZQC1tXtckx7+uQuEqlU3N0i
	l1fJp+0eWnCfiMr3KOkZiXuYahPtSiTDLc75nuiUT0Ty84SzYaHU3IEkNMKogg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 19 Jun 2026 09:02:13 +0200
Subject: [PATCH] drm/mxsfb/lcdif: don't hide lcdif_attach_bridge() deferral
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-lcdif-deferral-msg-v1-1-ce2392dca985@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdtkgziCr2I8sLWDEkDTojEhv
 LtTj9/h/3cwVmGDS7WD8ktM7muBP1WQxn4dGIWKoXZ1cMF3SLrgnEgyEmdW7WdcbEBum0DnHBv
 nI5T4oZzl/Rtfb3/bM06ctu8NjuMDqM9MLnoAAAA=
X-Change-ID: 20260619-drm-lcdif-deferral-msg-e736d5fb301b
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000259_183774_F8576755 
X-CRM114-Status: GOOD (  10.27  )
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

lcdif_attach_bridge() uses dev_err_probe() on all its error returns to
store a specific deferral message.

However its caller lcdif_load() calls dev_err_probe() again on error,
overwriting the specific deferral messages with a unique, unavoidably
generic, message.

Make the specific deferral message visible by using a plain 'return ret' on
the caller.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index f5bb59cd5028..e2173c4d6fc2 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -186,7 +186,7 @@ static int lcdif_load(struct drm_device *drm)
 
 	ret = lcdif_attach_bridge(lcdif);
 	if (ret)
-		return dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
+		return ret;
 
 	drm->mode_config.min_width	= LCDIF_MIN_XRES;
 	drm->mode_config.min_height	= LCDIF_MIN_YRES;

---
base-commit: 98b46e693b912eef0e6d497327489113845cbd15
change-id: 20260619-drm-lcdif-deferral-msg-e736d5fb301b

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


