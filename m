Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F2CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXwNDC94q6nMzpTBQtXXzXZoPx3alKi0zHfqXlCxtzE=; b=qtJhMQwAL4yyLiEQx8gmmE0RIY
	de9hzXFy894EVD3hCpZQBM3n6bGpMAYIwllcYMbwbcRWuZ9X/pXnlbYLCMNlCiSHVwKj+UlGexmrC
	mN1hAFP5q16SOQ8rzqrgJWxNZZKI6tpN4fPGUGoUkJ54wMrMeevexskt0e3iL1Oh90jRA42cr1R3E
	6zIQrIAKEkHh31He47rcbHrNIFmffI7WBQx+dopHtQ4bF9N0NAdHjnoRpGaSu8GO+BrKss3n/zflE
	itMWWug+eUc5GkhL6uG0eVd/IOPE3gaKs9jTMqPa0eJnO8PfXNPIpmZeSfwR1NY32TM7pHu99eHOy
	nhlSAnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIn-00000005DEp-2PpE;
	Mon, 10 Nov 2025 10:39:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPI6-00000005Cdx-2PUC;
	Mon, 10 Nov 2025 10:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SXwNDC94q6nMzpTBQtXXzXZoPx3alKi0zHfqXlCxtzE=; b=SIEON0iJO6GkidYCvHEk2utSh0
	O3ArZJNK9kmCF2K0I/L4yei00uLsRZ6kMzZV44lcXsqB/NkhdG1bSdev2GmzvXQFyv/A3LhiqnV7x
	C+5NdnDz9HU6Xgns1VSyKnMhqQdUXyUeAQhtl9RaGLO29MCvWImIsU7+lRRTME4dzVp88PvHLgpHr
	XqamFVvsNjirnV5e6yEsSihDEfYm+bkoQsnE5YrcCoM1yikp14bSDiHQudzKkiWBPuwl21EIivrRe
	uJkhL/Rz5WhpUZ0ZLvnnDWflxaw/I1VrCXMJI3pWm8QBlGw9lhJbQo6tjqpGvs3EOxcX6ef4R4uI5
	xgc6Ylyg==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOQN-0000000AP8C-2TUd;
	Mon, 10 Nov 2025 09:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771107; x=1794307107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=90DBnN1DGQYnGUgwfmS95iw+ByD4MmosW5yY9D3pBv0=;
  b=Zp6eQt+LqMWH7oRvaPe9o91WEtXktcF7A+2hR/DZ99I3LDZRe4aOz+lH
   Qxy3jxRez7LefLP9jMyPHAaWDiZs5BcYEWAQY/C5epQEdQxWxW3F9NZsL
   YOowIrn8+sFkqMUALLbo1kj929sj9eDZ2Ef7v/dyUuHu8jWy2NNM0Xlex
   +NayKByNm5jhLp3erThBUV75IZO5vcCvlv1SDVI9lLvBIM+yRcAkwb0c1
   HLvwK3c/BY2dO2m2awnD03ygrUEPj4I30hU6cAs1AUejGZ19H5aI7jzn2
   QmWDizl4JvZAe0+ndpzEtlorhuE6RvLLAAF5VWiHLUsoCvFVrYGAWAggt
   Q==;
X-CSE-ConnectionGUID: VJ0OKhneRgOvNCeJT1Y76w==
X-CSE-MsgGUID: grJQD5M2SWic6yJLzIGi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64728175"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64728175"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:18 -0800
X-CSE-ConnectionGUID: QkmrFVSsSRGnEf/YxIPPiA==
X-CSE-MsgGUID: np91THmSSw2v20kIwbQ+dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188891261"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2025 02:38:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8CC869D; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Vinod Koul <vkoul@kernel.org>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 08/13] dmaengine: pxa-dma: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:35 +0100
Message-ID: <20251110103805.3562136-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094300_089688_B4A82BFD 
X-CRM114-Status: GOOD (  10.60  )
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

Instead of open coded variant let's use recently introduced helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/pxa_dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index 249296389771..b639c8b51e87 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -970,7 +970,7 @@ pxad_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	struct scatterlist *sg;
 	dma_addr_t dma;
 	u32 dcmd, dsadr = 0, dtadr = 0;
-	unsigned int nb_desc = 0, i, j = 0;
+	unsigned int nb_desc, i, j = 0;
 
 	if ((sgl == NULL) || (sg_len == 0))
 		return NULL;
@@ -979,8 +979,7 @@ pxad_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	dev_dbg(&chan->vc.chan.dev->device,
 		"%s(): dir=%d flags=%lx\n", __func__, dir, flags);
 
-	for_each_sg(sgl, sg, sg_len, i)
-		nb_desc += DIV_ROUND_UP(sg_dma_len(sg), PDMA_MAX_DESC_BYTES);
+	nb_desc = sg_nents_for_dma(sgl, sg_len, PDMA_MAX_DESC_BYTES);
 	sw_desc = pxad_alloc_desc(chan, nb_desc + 1);
 	if (!sw_desc)
 		return NULL;
-- 
2.50.1


