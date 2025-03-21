Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889C7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+aW3YqrWtyb+HJrv0NdBuH13F+b2T4tSgjYxeo3bk0=; b=ZAuKhweFJtnKViGIKm0eOE6eO+
	JUoynbmhTBgKgCAzCiv5KUyjOM8gBTXkrRk3BKwqjzxzMD5WAiydjmZZrvIQNm38lJfV+b7xzYS+n
	DCzoMqQFdVkI4ngtHnxCCSwCk/02eIH44oh55Tsvo1G5wGLQZB3YB80BbehrAXxhdmCqFKdSFs/48
	PnjHIENvEuKu2Fg4dCL+x/w+CSTutcEj+DJFGcPLbb8y6cNVz2fXQI62TbednaX/zmyHE66kFujgq
	GDcIFHnXDtAsoDK8Mu+mLgYX88yFVuGnS3mYo9ovkO56s6i8wFoQyCI15q+N3JAIN/1t9IznW/44g
	x6c/1v8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviyz-0000000GAIh-0HCg;
	Fri, 21 Mar 2025 20:28:45 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvie5-0000000G7Sc-2zJi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:07:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9E98101E8FE7;
	Fri, 21 Mar 2025 21:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587628; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=T+aW3YqrWtyb+HJrv0NdBuH13F+b2T4tSgjYxeo3bk0=;
	b=HPjNgGMIOobFRLkbtZOxz8dZlyaVxNxU64iSONjzGGOv7RG5JKJnnmnov6KAqY69h9uPII
	M23mjnU2HDHEQRcchu/mGaePSbsLWE31IykDvLPiW4v2UrRdL40KVLDSqPWl2vev9IwruW
	5qR0dIDDjk9NYET/N9rMl/YeoVmuKZqc/+RZGvrOpZabzECShlg/fTL2Yp/eVdxG26rB99
	3gHUPXDBygq08VWoOmoSnKuDoFpAJT+QFvRGIWgDeymj5WvN3jov+3IgUqZOupfSYxRx6z
	OsV9AY94J053dyoBoEm9c0gtozsCtTrcOWSyMSlm7Ylr1L1eAWLY/AnaAS7Ojw==
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
Subject: [PATCH v2 2/9] reset: simple: Add support for Freescale i.MX95 GPU reset
Date: Fri, 21 Mar 2025 21:05:52 +0100
Message-ID: <20250321200625.132494-3-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_130709_891722_32D11CD9 
X-CRM114-Status: GOOD (  13.76  )
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
V2: - Set nr_resets=1 to limit the amount of resets to single bit
    - Switch from fsl, to nxp, vendor prefix
    - Add RESET_IMX95_GPU Kconfig symbol to select this reset driver
      on MX9
---
 drivers/reset/Kconfig        | 8 ++++++++
 drivers/reset/reset-simple.c | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 99f6f9784e686..0b48e76fd0aab 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -249,12 +249,20 @@ config RESET_SIMPLE
 	   - Altera SoCFPGAs
 	   - ASPEED BMC SoCs
 	   - Bitmain BM1880 SoC
+	   - NXP i.MX95 GPU
 	   - Realtek SoCs
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - SiFive FU740 SoCs
 	   - Sophgo SoCs
 
+config RESET_IMX95_GPU
+	bool "NXP i.MX95 GPU Reset Driver" if COMPILE_TEST && !SOC_IMX9
+	default SOC_IMX9
+	select RESET_SIMPLE
+	help
+	  This enables the reset driver for i.MX95 GPU.
+
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
 	default ARM && ARCH_INTEL_SOCFPGA
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 2760678398308..64aeda8f76b75 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -133,9 +133,18 @@ static const struct reset_simple_devdata reset_simple_active_low = {
 	.status_active_low = true,
 };
 
+static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
+	.reg_offset = 0x8,
+	.active_low = true,
+	.nr_resets = 1,
+	.status_active_low = true,
+};
+
 static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "altr,stratix10-rst-mgr",
 		.data = &reset_simple_socfpga },
+	{ .compatible = "nxp,imx95-gpu-blk-ctrl",
+		.data = &reset_simple_fsl_imx95_gpu_blk_ctrl },
 	{ .compatible = "st,stm32-rcc", },
 	{ .compatible = "allwinner,sun6i-a31-clock-reset",
 		.data = &reset_simple_active_low },
-- 
2.47.2


