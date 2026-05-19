Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27868CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkkSgAlsYDBwnM9XbAsNnjeyIYKliFTEgCHfK5ghURg=; b=wuby+LayfYSwe9n1XdpuHkq3+H
	0RNppGVkkfBc38UGu9ZFNTdzkuPX59FMn4jav5VTTAfhLV7YXx1fREaY6RuheOPoUBzbvH1FJ4Yi2
	Tp/8a+ZioK5QnRoqKDIps7lvjRFtO35s8G+C7XRO1Tdusna1SMBpfq+Gf1Z8sa7tpydNV3+s+Nuwq
	ZBCX70mXaHYAAzHirx4F/L7DeGNVoCAY8DF2rD+xGjLXmNL85DEoms33l+HBRh0ZvaMXC8dWtWK/I
	Cw35PqeK6vlIt4+An+Woa3W1MBVTnPaJHh+6URWYmqorTIHa6qWTN9qCE5KwDkfOM/J7UNKweEFkT
	fSspvi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHs1-000000019QE-4B5m;
	Tue, 19 May 2026 10:40:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHru-000000019Hd-2740
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:40:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 186781A3628;
	Tue, 19 May 2026 10:40:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0E04606E9;
	Tue, 19 May 2026 10:40:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 743AB107E8AF0;
	Tue, 19 May 2026 12:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OkkSgAlsYDBwnM9XbAsNnjeyIYKliFTEgCHfK5ghURg=;
	b=UOqU8kAK9WxaW6HsbFf7Iu6VMHr0gE6JJl8KL5x+H925gM5Qkoe2N35zaGxbWXcMmHpLNm
	oTzpgVU0Zli9HL3Vb9i8GGhHrnWBQ8UG0MW+4jcN96Cha8vogUrF7oEEL9jyMJMhGdIaYC
	zvpnpakc05AMeWd8EWVISs1q/7k96ytRPHfgeAldfdBXVUgD7nhpNuwhYDd/JhzJnAzHEP
	NQtcYPGW9hAcgTn2MioQuJo9k3fbz4Y0T/qjl2wfjmWVAmLRF1BmJ7hMK8vFWBhTfJPTb3
	v4c64Op4MOy6+EKWEwt+5XpJ6DiOEyOWtAA1UPrlXPLABB9wGkbb2ZepDYWl1w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:45 +0200
Subject: [PATCH 28/37] drm/mipi-dsi: turn DRM_MIPI_DSI into a tristate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-28-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_034010_696876_13C74E8A 
X-CRM114-Status: GOOD (  10.93  )
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

DRM_MIPI_DSI is currently a bool, but there's no reason to not be allowed
to build it as a loadable module.

Moreover being a bool prevents DRM_MIPI_DSI to depend on a tristate module
that is configured as 'm'.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 081660f3a0f2..3093d5f30724 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -43,7 +43,7 @@ config DRM_MIPI_DBI
 	select DRM_KMS_HELPER
 
 config DRM_MIPI_DSI
-	bool
+	tristate
 	depends on DRM
 
 config DRM_KMS_HELPER

-- 
2.54.0


