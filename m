Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62EFC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iVuupfJxe+koLI0yNqZJPyXcPdbXN4NhcUu5eQOsaOs=; b=i0y1JklBT+p+B6fGSZls5OIB8r
	yXbNe/KKXENfCLDGhfB+uh1gOpHOQWSNOhiJiznTdTxU03qGZeZygFwa4gVNc0HkTMD05Mb7iO0iV
	cKVgGZzlclcrQzQgJAlVr7JdUzP33owuY21CoRoiiy6p9qrwn/LnJvI019pavUlufQDJKUBPx4Y7E
	bSagfJbKKHrF4qhcn5D/kRV53nom5AXjnXBgs2TAn9f/dqqeeOkfHzrAl3gpriUvws/s8rTQQCS9g
	c3HZdXsaVMy0LOdU+URFMgCQcR1HHRCeXYAP+tXIPER7YpTYYaVLmxtefCDw59MLoo+fq4dXgCunr
	ler5JBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjf-00000008Yhr-1dGz;
	Thu, 27 Feb 2025 19:39:55 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhFj-000000089kP-03ak
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:00:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 719C610382F1E;
	Thu, 27 Feb 2025 18:00:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVuupfJxe+koLI0yNqZJPyXcPdbXN4NhcUu5eQOsaOs=;
	b=QkDgSvx6fm0XF7Ki7aCEqP2I1+aCtG49/hYEhC1CvHgsX0b6wEjfnSAqLiKujc9WtcCM0c
	+f8Tx6KiKm0tlUvnY82KovdThYQUmqkmlsjOXaerWv/4ILJvHJ5CtH9N3mW75WSCMDhYpN
	QwK0mbA2ZaE2t+m6K0pG/nLei3HnLEfObNQloNKOg2ETpOlw0JcR23sAdnwkrWDyubd2Il
	WWoo58A1l/qUU+m/zAnKP4oTvBHcxbX7kWmJVHJ2mR83nv9nfvk+zmJrP7PhCCTlVKeJV6
	K5mZRb83fo5mj1OZ+AKKT0K/0W30vx6wWFuZmHXgxFgJ45wXGM8x1gWcLIaDOw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU reset
Date: Thu, 27 Feb 2025 17:58:02 +0100
Message-ID: <20250227170012.124768-3-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090051_207032_072F8343 
X-CRM114-Status: GOOD (  11.74  )
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

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Implement support for this reset register.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/reset/reset-simple.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 2760678398308..1415a941fd6eb 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simple_active_low = {
 	.status_active_low = true,
 };
 
+static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
+	.reg_offset = 0x8,
+	.active_low = true,
+	.status_active_low = true,
+};
+
 static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "altr,stratix10-rst-mgr",
 		.data = &reset_simple_socfpga },
+	{ .compatible = "fsl,imx95-gpu-blk-ctrl",
+		.data = &reset_simple_fsl_imx95_gpu_blk_ctrl },
 	{ .compatible = "st,stm32-rcc", },
 	{ .compatible = "allwinner,sun6i-a31-clock-reset",
 		.data = &reset_simple_active_low },
-- 
2.47.2


