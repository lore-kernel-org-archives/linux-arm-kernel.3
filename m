Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10644C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9brc5/hXSFxCLqLhod+s3L0vQ8dKG9uN0kNshSyZdI=; b=UrpkwHGK1kJgV/rJlYnFpjxh9t
	WSVA5xkwn7DyC94jTWoTeHmCWS4wilql+PRHyARw/uc68WCJaXphJfPusSwlrQRMFaA49fpkEriYz
	fRjIKLXhaEVkwpgmR4dKU7B9wUEV3a8mLHKkpXolM1XuVVxyCScoKPYJuz+Tnyy4fEKee4bp4fdvn
	h9LLGSlz1oos9Tg4FoZkJlk+5Iad+/vdBc32M/Jhq4Ykw8gT8Qfe3uVlYb554RRoWO/s7NcaAv278
	49SPRWdU3Fch+Dq8fRGsQKJy5yYXKQNTo16q1CtLbeYYNq5pwZH4t4HZ5QF6D11JpT4NxV1iA5417
	uAufQdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXba4-0000000Dgx7-3stE;
	Fri, 04 Jul 2025 08:15:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFR-0000000Dd1d-2Ksx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R9brc5/hXSFxCLqLhod+s3L0vQ8dKG9uN0kNshSyZdI=; b=h/Af5cE7rJWFppkHldZCNvKmJW
	0qTAvIdeI5IYR8MdyICUdEbKaGVg3hg201qcPUdRQXQBc9OUfeYBiCr8+I8309Ru2B3g3bEjS1g0M
	k3IlfO3WYAkioBc2SenniQYCmuyUL7zUMvortIB2iMqoCyoJYI7ME93+D2IA/XvgCNAg6Ly9LdupS
	ELNI1f9rWdnH9QYh5wEor2hz6gG97hUb7Nf8HYqi3dpq1HtXGNCy4Z2J6w9P/ZzrHJd0TYZOGp1kQ
	bn8lC8cRIiY/p2CKdmlMBE4yA1bUIKDMMg0DO9fqRUmXtm/1dhplGf824bQYuSWSotFqcXJqz2QJ+
	CMGEi0ZQ==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFO-00000007pdW-0c8w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615654; x=1783151654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKaWU9wHcesffH7yU2Bgh0fMlpDg7JRl+pUzHVYytWk=;
  b=lryyueAkJ88M4fi4grO7wp3mux/nagw8Vtve2BO/sY9UWApN4VOXLVur
   Q3+jr8l6wgoTkCJAz1b5eK0hxDVxcsriN909lxx6U93/g3oqfKoTwpPgZ
   HtllB3cSmbIFITzJNZJ/gQH1h1uxxI7pO5xd5CYsiAeAE1vnMeGXvsBYx
   NMRM6uMhOxuyB9GYosGfQ2LBvb1oc9RJGTEoH1Otff25vdh0R4iKWySUz
   FpI6+sCvkn2ghzZkpS71vJ/yv/bZq6NC4IXc+oLiL4+ttSgNon5uLaZuX
   N23bssMuYJPDvVM+l2oSi1YUapu6PHJpWVI0bdHHtc3ZKY0KucH3mGjiI
   Q==;
X-CSE-ConnectionGUID: fkmj7ACNQE6xgUZjFS7/9A==
X-CSE-MsgGUID: AT4iDuzHQvm5EB+bDB3NcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494506"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:11 -0700
X-CSE-ConnectionGUID: sTvQMPl5RuODWcA7j2/V8w==
X-CSE-MsgGUID: yf8ICMQNQIyWACxGNAWhRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924202"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:07 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 5D66B44433;
	Fri,  4 Jul 2025 10:54:05 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Amit Vadhavana <av2082000@gmail.com>,
	Casey Connolly <casey.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/80] dmaengine: qcom: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:05 +0300
Message-Id: <20250704075405.3217439-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085414_611513_333BB232 
X-CRM114-Status: GOOD (  13.30  )
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

 drivers/dma/qcom/bam_dma.c    | 5 -----
 drivers/dma/qcom/hidma.c      | 9 ---------
 drivers/dma/qcom/hidma_dbg.c  | 1 -
 drivers/dma/qcom/hidma_mgmt.c | 2 --
 4 files changed, 17 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bbc3276992bb..e6f642e8c731 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -608,7 +608,6 @@ static void bam_free_chan(struct dma_chan *chan)
 	}
 
 err:
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 }
 
@@ -784,7 +783,6 @@ static int bam_pause(struct dma_chan *chan)
 	writel_relaxed(1, bam_addr(bdev, bchan->id, BAM_P_HALT));
 	bchan->paused = 1;
 	spin_unlock_irqrestore(&bchan->vc.lock, flag);
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
 	return 0;
@@ -810,7 +808,6 @@ static int bam_resume(struct dma_chan *chan)
 	writel_relaxed(0, bam_addr(bdev, bchan->id, BAM_P_HALT));
 	bchan->paused = 0;
 	spin_unlock_irqrestore(&bchan->vc.lock, flag);
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
 	return 0;
@@ -927,7 +924,6 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 		writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
 	}
 
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
 	return IRQ_HANDLED;
@@ -1102,7 +1098,6 @@ static void bam_start_dma(struct bam_chan *bchan)
 	writel_relaxed(bchan->tail * sizeof(struct bam_desc_hw),
 			bam_addr(bdev, bchan->id, BAM_P_EVNT_REG));
 
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 }
 
diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c2b3e4452e71..ded27a674e5f 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -185,7 +185,6 @@ static void hidma_callback(void *data)
 	hidma_process_completed(mchan);
 
 	if (queued) {
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	}
 }
@@ -316,11 +315,9 @@ static dma_cookie_t hidma_tx_submit(struct dma_async_tx_descriptor *txd)
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	if (!hidma_ll_isenabled(dmadev->lldev)) {
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 		return -ENODEV;
 	}
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 
 	mdesc = container_of(txd, struct hidma_desc, desc);
@@ -507,7 +504,6 @@ static int hidma_terminate_channel(struct dma_chan *chan)
 
 	rc = hidma_ll_enable(dmadev->lldev);
 out:
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return rc;
 }
@@ -525,7 +521,6 @@ static int hidma_terminate_all(struct dma_chan *chan)
 	/* reinitialize the hardware */
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	rc = hidma_ll_setup(dmadev->lldev);
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return rc;
 }
@@ -569,7 +564,6 @@ static int hidma_pause(struct dma_chan *chan)
 		if (hidma_ll_disable(dmadev->lldev))
 			dev_warn(dmadev->ddev.dev, "channel did not stop\n");
 		mchan->paused = true;
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	}
 	return 0;
@@ -591,7 +585,6 @@ static int hidma_resume(struct dma_chan *chan)
 		else
 			dev_err(dmadev->ddev.dev,
 				"failed to resume the channel");
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	}
 	return rc;
@@ -882,7 +875,6 @@ static int hidma_probe(struct platform_device *pdev)
 	hidma_debug_init(dmadev);
 	hidma_sysfs_init(dmadev);
 	dev_info(&pdev->dev, "HI-DMA engine driver registration complete\n");
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return 0;
 
@@ -909,7 +901,6 @@ static void hidma_shutdown(struct platform_device *pdev)
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	if (hidma_ll_disable(dmadev->lldev))
 		dev_warn(dmadev->ddev.dev, "channel did not stop\n");
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 
 }
diff --git a/drivers/dma/qcom/hidma_dbg.c b/drivers/dma/qcom/hidma_dbg.c
index ce87c7937a0e..7d7594da084c 100644
--- a/drivers/dma/qcom/hidma_dbg.c
+++ b/drivers/dma/qcom/hidma_dbg.c
@@ -103,7 +103,6 @@ static int hidma_chan_show(struct seq_file *s, void *unused)
 		hidma_ll_chstats(s, mchan->dmadev->lldev, mdesc->tre_ch);
 
 	hidma_ll_devstats(s, mchan->dmadev->lldev);
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return 0;
 }
diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..8442082bde23 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -150,7 +150,6 @@ int hidma_mgmt_setup(struct hidma_mgmt_dev *mgmtdev)
 	val |= mgmtdev->chreset_timeout_cycles & HIDMA_CHRESET_TIMEOUT_MASK;
 	writel(val, mgmtdev->virtaddr + HIDMA_CHRESET_TIMEOUT_OFFSET);
 
-	pm_runtime_mark_last_busy(&mgmtdev->pdev->dev);
 	pm_runtime_put_autosuspend(&mgmtdev->pdev->dev);
 	return 0;
 }
@@ -305,7 +304,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 		 &res->start, mgmtdev->dma_channels);
 
 	platform_set_drvdata(pdev, mgmtdev);
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 	return 0;
 out:
-- 
2.39.5


