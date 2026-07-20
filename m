Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B64FC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agggjMeWOCHZp5peunlNPyTIEns3XzYOIFzREAaYZuY=; b=bqveGe5PzjPJXGB85poEna4Kn3
	Bza7AfQy1bvkvUMKSfozqJImMXV+pvf52QepWYsO5lQRPjaQ+2Aq4dzsX/DmDRbSSrkwSL5ef2ze9
	ApfpRyl7dZldVHd/f+FgzqvSfdGrs0BjmJn1Df/zdP7SHUOjdYHDWh2gVfvR/gSAs6tJYYqpPqbsF
	DwvxBaWNWkqlGrstyH+abiW6gGOEe24MSzxPO3xGTg/F7BDqfPv+cGayft3YC6gUX8HQ50clokzuY
	zAGPHwBUUX0kSsaB3Erfw03DhhrzRSi43pcd85rmEIRunQey94TZW4tbmoigMD4XbuIOj227G249R
	B/MbjEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqke-00000007MY6-2XLv;
	Mon, 20 Jul 2026 16:21:56 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkN-00000007MLr-1Wp2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:21:40 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so105306915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564499; x=1785169299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agggjMeWOCHZp5peunlNPyTIEns3XzYOIFzREAaYZuY=;
        b=NjhwbM0HVrqO9eUrm2I0RhQYnJf8WQA2hVbudos2NVXmFtIaEhDQ0HihVNA9FFStRN
         tC1QPwkZ0i1wsoNgiF3FgVcspi7G3hpT9suNDDS9DbtPAm48PMzGemMPzhNjZeY7f3zQ
         NrwdvIWgxO5sN+n20SfjqOeeZOqmNoKPyUoWowXwRjavfF00yTJPpXFJcw6MH0m+e7mi
         Ldju4qpeD30i2tYdV+uhXq1DjWMUs4Dll3BTwHUjFkn7S47AmiYpj1FePTxUqi1QCwNc
         JHvW/K+IecQjc7iqvZ/J5YO3q3YOETTfD0FtpO6AqRzrx5GAQ2av4WIMfPhMNMwbD3nT
         z7Cw==
X-Forwarded-Encrypted: i=1; AHgh+RqSKPrwAsE7+A8ot4HV3yMHIFRwHGA63Ibb+sGWPjjjG7JQbZqkUH0i0s6MgU2gV1jaPDnHqAUUgLzMtbVmUH5f@lists.infradead.org
X-Gm-Message-State: AOJu0YzqMw6pNk6+03CWA/e9UeY2rzHHVtsmUcFEh6QdZBlGkB8rJCfW
	h0iUF4YskeEkYwrUuGxyEMUOoDj0pi/gt7p74SEG8EUrqouFW+0ma169qZ8lBcqfvA==
X-Gm-Gg: AR+sD11yECwR3Vb02eVuUDgwGkGCONMQqUKGRn3DZO3i0k/ahA2kcD9ibvcidJNnuQQ
	N30wRRl6ITCb3V/VfoOAqFBQ2hyrtJjY5g1YJKiHtTkbmg6JGSOHj+JPN327PGO8YljWqSrMyFd
	NBfphG53guzJ1bwkbKG+Hduzol82+M9qunquzZmFlL7qHcgCEyqgf8q374InxOD0F713pWWF5sW
	bUbDHsi9XWoCUyJjQ/PkpaAqrer8jiIx6Z6/UQPxuTjGmNRn25OzF1GQq1qXFOMg+Yd7n9o4kD1
	FWYcHPQa/FHL9ltKMgG+xhg2pPZ8CHKuCEn8ZPKVzD5DWWmr+fcKQUUL4llsFJMilBGmOgFZT3+
	3zEMDaIKrEcxIzLPdXzmzbVCQUs+TLF8sd9I+nSROLbBaLNmD2UTQ9DHD8dycvnA+yBrG3gsNXI
	F0pSe3Ko/sjTBjFs2qWmObT+6rL2vZlaBiMrVw3iGUP7VlhLEkxWxIeTn7MtAiPqCrI1pV+9YPK
	zxkokR8ELDVKj6CgQ652XsTUVCU
X-Received: by 2002:a17:903:2c05:b0:2ca:ec6f:aeca with SMTP id d9443c01a7336-2cf3481b670mr163970705ad.8.1784564498470;
        Mon, 20 Jul 2026 09:21:38 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm58467385ad.80.2026.07.20.09.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:21:38 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v16 6/7] spi: pxa2xx: restore LPSS private register state on S3 resume
Date: Tue, 21 Jul 2026 00:21:15 +0800
Message-Id: <20260720162117.32304-7-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720162117.32304-1-fourdollars@debian.org>
References: <20260720162117.32304-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092139_413579_BF484ECE 
X-CRM114-Status: GOOD (  25.68  )
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
  pm_runtime_put_noidle() to guarantee active clocks during MMIO
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
- On the resume error path, call pm_runtime_set_suspended() before
  pm_runtime_put_noidle() to align the PM runtime state with the
  already-disabled hardware clock, preventing pxa2xx_spi_runtime_suspend()
  from attempting unclocked MMIO via pxa2xx_spi_off().

Link: https://bugzilla.kernel.org/show_bug.cgi?id=108331
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx.c | 105 +++++++++++++++++++++++++++++++++++++--
 drivers/spi/spi-pxa2xx.h |   1 +
 2 files changed, 102 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 34241a6742eb..851626ead25e 100644
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
@@ -1532,17 +1549,44 @@ static int pxa2xx_spi_suspend(struct device *dev)
 	struct ssp_device *ssp = drv_data->ssp;
 	int status;
 
+	status = pm_runtime_resume_and_get(dev);
+	if (status < 0)
+		return status;
+
+
 	status = spi_controller_suspend(drv_data->controller);
 	if (status)
-		return status;
+		goto out_put;
 
+	/* Disable SSP interrupt generation on hardware level while clock is active */
 	drv_data->suspended = true;
 	pxa2xx_spi_off(drv_data);
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
@@ -1555,9 +1599,47 @@ static int pxa2xx_spi_resume(struct device *dev)
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
@@ -1566,10 +1648,25 @@ static int pxa2xx_spi_resume(struct device *dev)
 		drv_data->suspended = true;
 		synchronize_irq(ssp->irq);
 		pxa2xx_spi_clk_disable(drv_data);
-		return status;
+		goto out_put;
 	}
 
-	return 0;
+out_put:
+	if (!pm_runtime_suspended(dev)) {
+		if (status)
+			/*
+			 * Clock is already disabled on the error path; align
+			 * the PM runtime state with hardware reality before
+			 * releasing the reference so the PM core does not
+			 * later invoke pxa2xx_spi_runtime_suspend() and attempt
+			 * unclocked MMIO via pxa2xx_spi_off().
+			 */
+			pm_runtime_set_suspended(dev);
+		pm_runtime_put_noidle(dev);
+	}
+
+	return status;
+
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


