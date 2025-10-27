Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183B1CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PuYiANs1AmCRU8MYggoHiBCZRFbrH3KvVKX2HTi5tkg=; b=haTfyr91t/BwH7qqVm41J4Ca2u
	7nt9eM2UabAhrqqcgLt5+aQA22wx81sG6Tw86PmNFcZkpPF7ULeB/5II1rDnRBVDnxBQJKFxAdth3
	KhoQbVUWwf9z+RlnMA2a5vTp//1QboP4GORRR6qW8EmovKRxBrcZVMcnX1IvXx33x3AjHSK49GsOq
	CrWhuuSH0bEk5T1fF2SgGcfIAwo/G2Ep7C5VKELauWrHYU7iHXo+TO+GV1ZzecSLlCVvDWqv3O+Kb
	2wa6qcFwqIbIUIZw2e5fH8v1Rv29ScjsY68Mkcjia6intpeLIqeyHGPA/qj/DgIqWywjAFshCue+I
	V9xgcVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLA-0000000E2zk-3WLH;
	Mon, 27 Oct 2025 13:32:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNL8-0000000E2ym-1xK8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PuYiANs1AmCRU8MYggoHiBCZRFbrH3KvVKX2HTi5tkg=; b=ZLNN7Q+eG8H79OTA63fNsYFnpO
	jCDilgzugb5PJsdkKUcjCWRZryOQDQsjUcJFlxWMoCo28aHqZeJMJ8d6kFDQSZqAlVQL746M/5VRB
	RMIR3vujg8hZef3hhnUMu8nHEqQMCBai+RF0R241thMHJ37yXkzXb1rAXWc3MjleO2IMlHe+ItvWr
	rnXSgQ6hhxL0Ib44+BZ+gtsBpchbqKlg8eSmyJOfaCQk7Hkw5l0HGxaIS6RKAjKuA2Z3QehsC95r2
	mLrVq72S1o8hYhow0UiwGzGLWeVRIDXJjrFMkuWT2/0Gbc5fY4AKedon6Vu1M54HyOUfsL3XP2hC0
	oYjVeoRQ==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMTL-00000002Bcn-1hWE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571968; x=1793107968;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AZN7S6QCt7r5m/F5D5zkopp7+Wbsjp/4T46MA6TqB7c=;
  b=VsC6nsnPFoM7OMG+QgYtxWHxkY2KxRTA9yWpnKiXCuJ01vHlnz5dRVTq
   lAZJYD998dkLa6gBQiLqANA6Fsuqc+IbGXM5kxJTwZRCCbWfQ5qrcmBaC
   ty6MYm+JaeT/RYSf//X3GJV5o9L4Vi8QDobRH2Uj2Ue4MZNStk4nVqP8B
   edWfmqvqxlcomV1rTRgbvfjtprk/orzjn4vCYoR3jPtRPoA0TZMmtr7EV
   2cGe+WGLox13XVleNv6+Bv8G00pi63IS5YM/v8s7LYnK9BPHiNy3mtuHm
   Z2B/JszLDGT+s0aqDUeboVMX0y6WEXGn2soE6XZ9nv0eiLo7pjQNvAWAQ
   A==;
X-CSE-ConnectionGUID: hb2E0h0rSEC0/UFAMqLJRQ==
X-CSE-MsgGUID: i0bK2TqGQ9CTxFwybJf+uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63799551"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63799551"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:43 -0700
X-CSE-ConnectionGUID: WRh17/xzRBiIO1cTreqlKQ==
X-CSE-MsgGUID: 3+bCGemdTLKjv6J+Nb+LFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185391823"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9E2C3121EC5;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDQ-2TIh;
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
Subject: [PATCH 1/6] dmaengine: at_xdmac: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:27 +0200
Message-ID: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123715_817957_BEDE10E6 
X-CRM114-Status: UNSURE (   8.99  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/dma/at_xdmac.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 3fbc74710a13..ada96d490847 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -379,7 +379,6 @@ static void at_xdmac_runtime_suspend_descriptors(struct at_xdmac_chan *atchan)
 		if (!desc->active_xfer)
 			continue;
 
-		pm_runtime_mark_last_busy(atxdmac->dev);
 		pm_runtime_put_autosuspend(atxdmac->dev);
 	}
 }
@@ -413,7 +412,6 @@ static bool at_xdmac_chan_is_enabled(struct at_xdmac_chan *atchan)
 
 	ret = !!(at_xdmac_chan_read(atchan, AT_XDMAC_GS) & atchan->mask);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return ret;
@@ -446,7 +444,6 @@ static void at_xdmac_off(struct at_xdmac *atxdmac, bool suspend_descriptors)
 		}
 	}
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 }
 
@@ -1676,7 +1673,6 @@ at_xdmac_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 
 spin_unlock:
 	spin_unlock_irqrestore(&atchan->lock, flags);
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 	return ret;
 }
@@ -1758,7 +1754,6 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 		__func__, &bad_desc->lld.mbr_sa, &bad_desc->lld.mbr_da,
 		bad_desc->lld.mbr_ubc);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	/* Then continue with usual descriptor management */
@@ -1822,7 +1817,6 @@ static void at_xdmac_tasklet(struct tasklet_struct *t)
 	 * Decrement runtime PM ref counter incremented in
 	 * at_xdmac_start_xfer().
 	 */
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 }
 
@@ -1954,7 +1948,6 @@ static int at_xdmac_device_pause(struct dma_chan *chan)
 
 	spin_unlock_irqrestore(&atchan->lock, flags);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -1998,7 +1991,6 @@ static int at_xdmac_device_resume(struct dma_chan *chan)
 
 unlock:
 	spin_unlock_irqrestore(&atchan->lock, flags);
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return ret;
@@ -2041,7 +2033,6 @@ static int at_xdmac_device_terminate_all(struct dma_chan *chan)
 	clear_bit(AT_XDMAC_CHAN_IS_CYCLIC, &atchan->status);
 	spin_unlock_irqrestore(&atchan->lock, flags);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -2235,7 +2226,6 @@ static int __maybe_unused atmel_xdmac_resume(struct device *dev)
 		}
 	}
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -2412,7 +2402,6 @@ static int at_xdmac_probe(struct platform_device *pdev)
 
 	at_xdmac_axi_config(pdev);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-- 
2.47.3


