Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D730CCCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35SrgZnHFX1vRzyi3jCYLBXUdmq2O38EKOtwO1FCpWA=; b=scSr5yJQPnpRZCi8oi0YURCINa
	llJPmWO4I2SCHEMWpNvXGWQ7XmYK7iZkNAUUReG34eZWkLJVByUxhIX5J7yOweCN2OLjaO/27nF7Z
	300JStoPZjHvzyamHCum95dVqjQR9WLdsvfiIsEtP2J5+Y2V2VETPtH/2mecyFfXZqL7OSM/H+lIJ
	pNKzQMslPKw91bNEvz1pSD/q+sMH1c5taEIQ/ELOsG6It6GIsXTw1nYvxbVjw4C4idUMSxS+5rDiB
	Wz9VdHmB/Kc5SIjdJWkhZTDEniUFGP4ci+JX+ESC+iAwVG+n+PDj3StMgxr33JNUl9+sRExNZJYbq
	gAg9szAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLK-0000000E351-2f6P;
	Mon, 27 Oct 2025 13:33:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLB-0000000E2ze-0phW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=35SrgZnHFX1vRzyi3jCYLBXUdmq2O38EKOtwO1FCpWA=; b=m/nbvIDDqJTF6y/fs4ySwn2VeF
	1bKKYV7X/dcKiKICQfsVfryzPrnITRwNGxJFePiSeRG+oA0QVC+ODiKz/81+iFAPCJuh1xjrlyZa4
	o1J2Gsbpz9XJrAfRRW3s0eAUI8/oRT1a7XjjetbMNoHEjOu2C8cMfwm+fmT6s0ta+mINcGa5AcCPQ
	Bx+ncCGbju1ygMtyc4WW4R+5XOlBPRgsB1o+0aaptxFixzpj7htk2qR7WodVWeucRCzrHoLxt8cjR
	sLvrrOn8Ug4FEHm1rmoiCUf1FMOjI4tU2witq8vR21/HlD6tbk3IMJy8VIbX4fWfTZ0NsjECC7kLj
	ooPyefEQ==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMTO-00000002Bd1-1JFU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571970; x=1793107970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0RB24Z84JeEf7VVDDPkK0XKQmyXud+9FqvOEeyo4+Sw=;
  b=hsy61UfLL57ob3HZJsb9JQ/pA4n6ujWiVQ5L83ubRdjNeaauJKpILpcm
   lH9OcWdkFFL9gm9LvbXB6fkvNl9ucacQu/eyf0jGA2PnIO6HJpI72Xc2O
   qRyBJDxjWNyionsdv5w1AOTXLnwAKzKEDuNik2P2XDrveU7CitifVv5x2
   ll5XeviX3tyq0b/dry3v+QydIWKujTwyh0F1Dwgig6ivaLzxi7jF2JRzc
   7PySbIflOCo6QujH/doJfC4+MuVDNFN5SHvQsVN+IWM2CJrg7uzV+Idg3
   0sgvL/5p2rhsbEs2k9wCX8vVRbPLR2SV0p5iW/cPkknsnwFWfUBYJw+2c
   g==;
X-CSE-ConnectionGUID: xYnOwCjZS+O5avIh4Ccahg==
X-CSE-MsgGUID: BPdRwr8mShyFJk7/FC9aHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63555410"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63555410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:43 -0700
X-CSE-ConnectionGUID: y3+lhkq2Qx+7tX89UJbzUg==
X-CSE-MsgGUID: QdHuXiBtSFmDIUYkyUQygA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184666869"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9EF5C121EF1;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDX-2aKc;
	Mon, 27 Oct 2025 15:32:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/6] dmaengine: qcom: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:29 +0200
Message-ID: <20251027133232.392898-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123718_692346_051A0C2F 
X-CRM114-Status: GOOD (  12.39  )
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
 drivers/dma/qcom/bam_dma.c    |  5 -----
 drivers/dma/qcom/hidma.c      | 12 +-----------
 drivers/dma/qcom/hidma_dbg.c  |  1 -
 drivers/dma/qcom/hidma_mgmt.c |  2 --
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795..efeb229652e6 100644
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
index c2b3e4452e71..1639d82778fd 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -184,10 +184,8 @@ static void hidma_callback(void *data)
 
 	hidma_process_completed(mchan);
 
-	if (queued) {
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
+	if (queued)
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
-	}
 }
 
 static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
@@ -316,11 +314,9 @@ static dma_cookie_t hidma_tx_submit(struct dma_async_tx_descriptor *txd)
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	if (!hidma_ll_isenabled(dmadev->lldev)) {
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 		return -ENODEV;
 	}
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 
 	mdesc = container_of(txd, struct hidma_desc, desc);
@@ -507,7 +503,6 @@ static int hidma_terminate_channel(struct dma_chan *chan)
 
 	rc = hidma_ll_enable(dmadev->lldev);
 out:
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return rc;
 }
@@ -525,7 +520,6 @@ static int hidma_terminate_all(struct dma_chan *chan)
 	/* reinitialize the hardware */
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	rc = hidma_ll_setup(dmadev->lldev);
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return rc;
 }
@@ -569,7 +563,6 @@ static int hidma_pause(struct dma_chan *chan)
 		if (hidma_ll_disable(dmadev->lldev))
 			dev_warn(dmadev->ddev.dev, "channel did not stop\n");
 		mchan->paused = true;
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	}
 	return 0;
@@ -591,7 +584,6 @@ static int hidma_resume(struct dma_chan *chan)
 		else
 			dev_err(dmadev->ddev.dev,
 				"failed to resume the channel");
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	}
 	return rc;
@@ -882,7 +874,6 @@ static int hidma_probe(struct platform_device *pdev)
 	hidma_debug_init(dmadev);
 	hidma_sysfs_init(dmadev);
 	dev_info(&pdev->dev, "HI-DMA engine driver registration complete\n");
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return 0;
 
@@ -909,7 +900,6 @@ static void hidma_shutdown(struct platform_device *pdev)
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
2.47.3


