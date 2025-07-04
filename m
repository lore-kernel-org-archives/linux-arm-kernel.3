Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEA7C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jhteaPxkeh/lToKaJ+oiqW0UNLmPiClOT/eQQC8YwY=; b=HkA+feyRKqhLvZQgWk8cyvhQE5
	eC2Reo8XJgyY6MBGjujXchguHoKtRSsM6b6CSB++qpMGWqFnjl1BFqlOjjKag2Gwfe4nO5Z2aPTyS
	k33cKxQfIOYeggJkTqlL5F+P+NejWQxJ5ltM8d7sC19ZW1uKcHGPmNI7miKV1IA6B3K417+ypRDHc
	lyeVB6JjhzMl3lHGwlsSR3Jk/zYLRo+uCwqYUhvpNnvCExUPxFirSzjEDb30RFPpOZakGN4ocnBIh
	VJjo7evb+rRcq+ww5yd+zPbJcrYgHfmlWEDDa/Nx0hV++XkKs+o1uFrlPOOhjmWq7HMESRLAHexBT
	VyGpaTEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXblf-0000000Djjv-40lf;
	Fri, 04 Jul 2025 08:27:35 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFt-0000000Dd8m-2xhj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615686; x=1783151686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bnuZewOjDRj5uj/Q1wY38bM+p730Axef1k5VeKg2H+A=;
  b=MYksyaX0zjlGlJ20VcrWcwxoAB69F0Il8BxI9neaVQx37fvGs6vhybHO
   8AMi7PKBHupfEnhIW33e76Cv70KWjrWXIWH52UuCk83qhgPQWBiv0ZFft
   xyLk/IRFbyGA1LMxYZUmYqFW+YuNzWx4Hkjrk7dX6SYD+dvGxXesZkOcn
   smvyn9VRYCWLFl/CQ0Eqowy43mFM7zT/YZh9/oIhNTC0ZuLXVElu3cfxy
   D0qRhb+PjkkQ49y6poImjzc8eTlblkQxSE8HkFMGPggWQeHhXUTrI66lw
   32jOtWn30KOXgaZLAKQ9iCPOSkKF25kJTHEJiRf+amGk4XC0gA+27fR17
   w==;
X-CSE-ConnectionGUID: L8Me20d3StyEaNWioRyTWA==
X-CSE-MsgGUID: HzPrVm3aSUGdL/6fk3yUVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194141"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:45 -0700
X-CSE-ConnectionGUID: vHcFFC2QSWGmYwlOvBh9Cw==
X-CSE-MsgGUID: zaZUVbpaQBiQnQCYrl+S7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616609"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:36 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 66F5344419;
	Fri,  4 Jul 2025 10:54:34 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Aubin Constans <aubin.constans@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 44/80] mmc: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:34 +0300
Message-Id: <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005445_790711_3F10BAD1 
X-CRM114-Status: GOOD (  14.89  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/mmc/core/core.c            | 1 -
 drivers/mmc/host/atmel-mci.c       | 2 --
 drivers/mmc/host/mmci.c            | 1 -
 drivers/mmc/host/omap_hsmmc.c      | 3 ---
 drivers/mmc/host/sdhci-esdhc-imx.c | 1 -
 drivers/mmc/host/sdhci-msm.c       | 1 -
 drivers/mmc/host/sdhci-omap.c      | 2 --
 drivers/mmc/host/sdhci-pxav3.c     | 2 --
 drivers/mmc/host/sdhci-sprd.c      | 1 -
 drivers/mmc/host/sdhci_am654.c     | 1 -
 drivers/mmc/host/tmio_mmc_core.c   | 1 -
 11 files changed, 16 deletions(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index a0e2dce70434..874c6fe92855 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -882,7 +882,6 @@ void mmc_put_card(struct mmc_card *card, struct mmc_ctx *ctx)
 	WARN_ON(ctx && host->claimer != ctx);
 
 	mmc_release_host(host);
-	pm_runtime_mark_last_busy(&card->dev);
 	pm_runtime_put_autosuspend(&card->dev);
 }
 EXPORT_SYMBOL(mmc_put_card);
diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index c885c04e938a..43f92f48590f 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -541,7 +541,6 @@ static int atmci_regs_show(struct seq_file *s, void *v)
 	memcpy_fromio(buf, host->regs, ATMCI_REGS_SIZE);
 	spin_unlock_bh(&host->lock);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	seq_printf(s, "MR:\t0x%08x%s%s ",
@@ -2567,7 +2566,6 @@ static int atmci_probe(struct platform_device *pdev)
 	dev_info(dev, "Atmel MCI controller at 0x%08lx irq %d, %u slots\n",
 		 host->mapbase, irq, nr_slots);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index c70c64f8adc4..8367283647a9 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -2082,7 +2082,6 @@ static void mmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
 	spin_unlock_irqrestore(&host->lock, flags);
 
 	if (!enable) {
-		pm_runtime_mark_last_busy(mmc_dev(mmc));
 		pm_runtime_put_autosuspend(mmc_dev(mmc));
 	}
 }
diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index bf3b9f5b067c..adc0d0b6ae37 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -1663,7 +1663,6 @@ static int mmc_regs_show(struct seq_file *s, void *data)
 	seq_printf(s, "CAPA:\t\t0x%08x\n",
 			OMAP_HSMMC_READ(host->base, CAPA));
 
-	pm_runtime_mark_last_busy(host->dev);
 	pm_runtime_put_autosuspend(host->dev);
 
 	return 0;
@@ -1954,7 +1953,6 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
 	}
 
 	omap_hsmmc_debugfs(mmc);
-	pm_runtime_mark_last_busy(host->dev);
 	pm_runtime_put_autosuspend(host->dev);
 
 	return 0;
@@ -2031,7 +2029,6 @@ static int omap_hsmmc_resume(struct device *dev)
 	if (!(host->mmc->pm_flags & MMC_PM_KEEP_POWER))
 		omap_hsmmc_conf_bus_power(host);
 
-	pm_runtime_mark_last_busy(host->dev);
 	pm_runtime_put_autosuspend(host->dev);
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 64c27349d79f..a040c0896a7b 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2108,7 +2108,6 @@ static int sdhci_esdhc_resume(struct device *dev)
 	    esdhc_is_usdhc(imx_data))
 		sdhc_esdhc_tuning_restore(host);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 732b65d4b61a..68e56251d5e8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2750,7 +2750,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (ret)
 		goto pm_runtime_disable;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 429d8a517fb6..cdb09605e009 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1370,7 +1370,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 		host->mmc->pm_caps |= MMC_PM_KEEP_POWER | MMC_PM_WAKE_SDIO_IRQ;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -1379,7 +1378,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
 	sdhci_cleanup_host(host);
 
 err_rpm_put:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 err_rpm_disable:
 	pm_runtime_dont_use_autosuspend(dev);
diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
index 34abf986573f..1371960e34eb 100644
--- a/drivers/mmc/host/sdhci-pxav3.c
+++ b/drivers/mmc/host/sdhci-pxav3.c
@@ -494,7 +494,6 @@ static int sdhci_pxav3_suspend(struct device *dev)
 	if (host->tuning_mode != SDHCI_TUNING_MODE_3)
 		mmc_retune_needed(host->mmc);
 	ret = sdhci_suspend_host(host);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -507,7 +506,6 @@ static int sdhci_pxav3_resume(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 	ret = sdhci_resume_host(host);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
index a5dec1a0e934..fe2fe52b23b2 100644
--- a/drivers/mmc/host/sdhci-sprd.c
+++ b/drivers/mmc/host/sdhci-sprd.c
@@ -863,7 +863,6 @@ static int sdhci_sprd_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_host;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index ea14d56558c4..e2c4a0049d61 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -986,7 +986,6 @@ static int sdhci_am654_probe(struct platform_device *pdev)
 	/* Setting up autosuspend */
 	pm_runtime_set_autosuspend_delay(dev, SDHCI_AM654_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return 0;
 
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 2cec463b5e00..21c2f9095bac 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -160,7 +160,6 @@ static void tmio_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
 		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
 
 		host->sdio_irq_enabled = false;
-		pm_runtime_mark_last_busy(mmc_dev(mmc));
 		pm_runtime_put_autosuspend(mmc_dev(mmc));
 	}
 }
-- 
2.39.5


