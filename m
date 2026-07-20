Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01EAC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fOErW4W0huqYOzMta6lrgtyUPK1eaYnpCDX3YPECv0=; b=Jl767LVfjB6dxpaLiV9AWPYI2M
	OiiT8Prp5/CfDYeoYL8Xa4KFbsrlt+OThSwSdgfeJ/ghk7pMGmajzHP784boOLVivZzEDZmhSIG2+
	e/Vf7qiBBvx70b9ak+nWSfqd74Wxg1DZFq4gjhRgXWrI8cYoASlDQLeZmkTlnxAzL0R7jD+ONm3m9
	Uc37QIckpzi6k9KnTT/C5Ax2QGfC/QqY93VFJCm0aex7jEav5S7yVcdCqdu1tr632G9fs3R4N8rvp
	GX0iM4yqS7j6r69H9KW9mWCQZGB5UYFmbmjLofmuB/0cG47hOZMlFJbkkUGiMY7gZqUY7ycAvRy+S
	kn6T4iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQc-00000006Vq8-1diE;
	Mon, 20 Jul 2026 10:40:54 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQX-00000006Vmz-1bJ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:40:50 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad8076b01so119826695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544049; x=1785148849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fOErW4W0huqYOzMta6lrgtyUPK1eaYnpCDX3YPECv0=;
        b=ZChhJTXCxa4Ki9NnlsaZUkNMiA+46D822Qu3fiBWPHHogxGSf2oscDLBl7FPKoZhTB
         4BDFaI4fJt7SMQhD5L/vjyGXyhA03TbHR1AkuMKnsvcfXTjExTD0s+S5MBmnuissjV96
         Y4KaABjBGSBJM5HKMuJR83a6EWoQYZ5hZz55eQV0VXhb3yrdt5W6te7by/+JzRWCEHq6
         +2Yws8uag7jPVMXJg57+y4cN3zGcm3uI1kIzyFRlti4Uiyj2uGRP7/z/5WYYYHx1N1Tz
         dwYpJtI8SaN3AuoPI2A5T2Z2vCGgJE7bPkKdtxnBzPw+reDmuE/WuHwZUd+KAR6vM3H7
         cT5w==
X-Forwarded-Encrypted: i=1; AHgh+RpHkBXII8vUkLPJ8VGcG0au2xUHMxQlpZb9mYS38RuUS3albjyEVv1xJOvSNHDQeiSlzOFc5JiSieEyudIbn3Jp@lists.infradead.org
X-Gm-Message-State: AOJu0Yygp7c3pb9VRhyT3dv4ueaX+olCFfMOkMzwcU+X+7j86aRxrv6W
	l6TkrvhMItLXAlvT+t1q5LRPM6lYMibeqC5iXb8nnspa2VUcCLLb/3g=
X-Gm-Gg: AfdE7cn82UWQgE8CB2NToIAsBn8fNT6z5HLOorSJUXg0sX/9zjpyWGG6ruyGV7RIKYR
	+EIadR9oOWG2v6F6hE5pbktECb5VyTvR7yogAK2IvLml9fYy79B/48V/O3jE1Ooo8oROlFtRPy4
	uJqHvYJnxvAIloZ1OpDdE0WQEaXs6iXQEBMZhbbRo6zDnmLnyP1Pnp5rqGACJn/Hb4BFpAiPOiM
	nfdRp6/J9S9PlJH9kQfNzgtu3Z+OgP546B9XZRt8IU/o1Z+uaU4E479sOXeS9uArLbtfbtQW7Ao
	qkRYiENNUvvNEfgufCuhJrZmU2tFIKKomy6nQchit0UqpHLQwxWnHfTRz2C7UnQhQdd9DSSY34n
	lFGBNSlp72JXSAUQ7HvyDh+hHNUYnYltf/GoDrxe/rpHGzm8ewl9jE/yaHkbzC+t900ndLc/RgR
	1hWdE+JJwGrMiRMLCJ6UgCTphohuYw/b6Qp5NnruZhuyQwZlIpZic4cjuH7gSRZ4fDxuZpD784h
	1YpMJSmq6G/mXJk4g==
X-Received: by 2002:a17:902:f688:b0:2ca:5d24:720b with SMTP id d9443c01a7336-2cf349caff7mr152740295ad.39.1784544048693;
        Mon, 20 Jul 2026 03:40:48 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f61ffsm54900325ad.33.2026.07.20.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:40:48 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v15 6/7] spi: pxa2xx: restore LPSS private register state on S3 resume
Date: Mon, 20 Jul 2026 18:40:28 +0800
Message-Id: <20260720104029.13740-7-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720104029.13740-1-fourdollars@debian.org>
References: <20260720104029.13740-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_034049_430996_C5638875 
X-CRM114-Status: GOOD (  24.76  )
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

Intel LPSS SPI controllers lose all private register state across S3
suspend because the LPSS power domain is fully removed. On resume the
driver only re-enables the SSP clock, leaving the LPSS private registers
in their power-on-reset state, which causes two problems:

1. LPSS_PRIV_RESETS (offset 0x04 within the LPSS private space) stays
   zero, keeping the functional block in reset. Any MMIO access while
   the block is held in reset causes a PCIe Completion Timeout and a
   watchdog-triggered system reset. LPSS_PRIV_RESETS_FUNC and
   LPSS_PRIV_RESETS_IDMA must be de-asserted before any other register
   access on resume.

2. The LPSS software chip-select control register must not be blindly
   restored from its suspend-time snapshot: if CS was asserted at the
   moment of suspend, restoring that state corrupts the first
   post-resume SPI transaction. Instead, call lpss_ssp_setup() which
   unconditionally writes SW_MODE | CS_HIGH (idle/deasserted), matching
   the state established at probe time.

To resolve these issues safely:
- Wrap S3 suspend/resume with pm_runtime_resume_and_get() and
  pm_runtime_put_autosuspend() to guarantee active clocks during MMIO
  access and preserve PM reference counting.
- Restrict LPSS private register save/restore to LPT, BYT, and BSW
  platforms via pxa2xx_spi_need_lpss_restore() (newer platforms are
  handled by intel-lpss.c).
- Save only the first 6 LPSS private registers (offsets 0x00..0x14) in
  drv_data during suspend, avoiding reserved offsets beyond 0x14.
- On resume, de-assert resets first, restore saved registers, call
  lpss_ssp_setup(), and clear drv_data->suspended to prevent unclocked
  IRQ access.
- Add error recovery paths for spi_controller_suspend/resume failures.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=108331
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 95 ++++++++++++++++++++++++++++++++++++++--
 drivers/spi/spi-pxa2xx.h |  1 +
 2 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 88ed28096b07..56e434f6e794 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -72,6 +72,11 @@ struct chip_data {
 #define LPSS_CAPS_CS_EN_SHIFT			9
 #define LPSS_CAPS_CS_EN_MASK			(0xf << LPSS_CAPS_CS_EN_SHIFT)
 
+/* Offsets from drv_data->lpss_base */
+#define LPSS_PRIV_RESETS			0x04
+#define LPSS_PRIV_RESETS_IDMA			BIT(2)
+#define LPSS_PRIV_RESETS_FUNC			0x3
+
 #define LPSS_PRIV_CLOCK_GATE 0x38
 #define LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK	0x3
 #define LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON	0x3
@@ -189,6 +194,18 @@ static bool is_lpss_ssp(const struct driver_data *drv_data)
 	}
 }
 
+static bool pxa2xx_spi_need_lpss_restore(const struct driver_data *drv_data)
+{
+	switch (drv_data->ssp_type) {
+	case LPSS_LPT_SSP:
+	case LPSS_BYT_SSP:
+	case LPSS_BSW_SSP:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static bool is_quark_x1000_ssp(const struct driver_data *drv_data)
 {
 	return drv_data->ssp_type == QUARK_X1000_SSP;
@@ -1527,17 +1544,45 @@ static int pxa2xx_spi_suspend(struct device *dev)
 	struct ssp_device *ssp = drv_data->ssp;
 	int status;
 
+	status = pm_runtime_resume_and_get(dev);
+	if (status < 0)
+		return status;
+
 	status = spi_controller_suspend(drv_data->controller);
 	if (status)
-		return status;
+		goto out_put;
 
+	/* Disable SSP interrupt generation on hardware level while clock is active */
 	pxa2xx_spi_off(drv_data);
+
+	/* Mark as suspended and synchronize IRQ before disabling clock */
 	drv_data->suspended = true;
 	synchronize_irq(ssp->irq);
 
+	if (pxa2xx_spi_need_lpss_restore(drv_data)) {
+		unsigned int i;
+
+		/*
+		 * Save the first 6 LPSS private registers (offsets 0x00 to 0x14)
+		 * while the clock is still enabled.  They are lost when the LPSS
+		 * power domain is removed across S3 and must be restored on resume.
+		 * Use drv_data->lpss_base so the correct per-platform offset
+		 * is applied regardless of LPSS IP revision.
+		 * Registers beyond 0x14 (except CS control at 0x18) are reserved
+		 * or unimplemented on LPT, and accessing them triggers a PCIe
+		 * Completion Timeout causing a system halt.
+		 */
+		for (i = 0; i < 6; i++)
+			drv_data->lpss_priv_ctx[i] = readl(drv_data->lpss_base + i * 4);
+	}
+
 	pxa2xx_spi_clk_disable(drv_data);
 
 	return 0;
+
+out_put:
+	pm_runtime_put_noidle(dev);
+	return status;
 }
 
 static int pxa2xx_spi_resume(struct device *dev)
@@ -1550,9 +1595,47 @@ static int pxa2xx_spi_resume(struct device *dev)
 	if (!pm_runtime_suspended(dev)) {
 		status = pxa2xx_spi_clk_enable(drv_data);
 		if (status)
-			return status;
+			goto out_put;
 	}
 
+	if (pxa2xx_spi_need_lpss_restore(drv_data)) {
+		unsigned int i;
+
+		/*
+		 * The LPSS power domain is removed across S3, taking
+		 * all private registers with it.  De-assert the
+		 * functional block and IDMA resets first; any MMIO
+		 * access while the block is held in reset causes a
+		 * PCIe Completion Timeout and a watchdog-triggered
+		 * system reset.
+		 */
+		writel(LPSS_PRIV_RESETS_FUNC | LPSS_PRIV_RESETS_IDMA,
+		       drv_data->lpss_base + LPSS_PRIV_RESETS);
+
+		/* Restore the other 5 saved private registers */
+		for (i = 0; i < 6; i++) {
+			if (i == LPSS_PRIV_RESETS / 4)
+				continue;
+			writel(drv_data->lpss_priv_ctx[i],
+			       drv_data->lpss_base + i * 4);
+		}
+	}
+
+	if (is_lpss_ssp(drv_data)) {
+		/*
+		 * Re-initialise the SW chip-select control register so
+		 * CS starts deasserted (SW_MODE | CS_HIGH), regardless
+		 * of the state it was in at suspend time.  A stale
+		 * asserted CS on the first post-resume transaction
+		 * corrupts the write-status response from the device.
+		 */
+		lpss_ssp_setup(drv_data);
+	}
+
+	/*
+	 * Now that resets are de-asserted and registers are restored,
+	 * it is safe to handle interrupts.
+	 */
 	drv_data->suspended = false;
 
 	/* Start the queue running */
@@ -1561,10 +1644,14 @@ static int pxa2xx_spi_resume(struct device *dev)
 		drv_data->suspended = true;
 		synchronize_irq(ssp->irq);
 		pxa2xx_spi_clk_disable(drv_data);
-		return status;
+		goto out_put;
 	}
 
-	return 0;
+out_put:
+	if (!pm_runtime_suspended(dev))
+		pm_runtime_put_noidle(dev);
+
+	return status;
 }
 
 static int pxa2xx_spi_runtime_suspend(struct device *dev)
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index 44f37bf9c519..48169494f74e 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -71,6 +71,7 @@ struct driver_data {
 	irqreturn_t (*transfer_handler)(struct driver_data *drv_data);
 
 	void __iomem *lpss_base;
+	u32 lpss_priv_ctx[6];
 
 	bool suspended;
 	bool clk_enabled;
-- 
2.39.5


