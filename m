Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A04D185CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0RfDaoWZJygaq2CrGfYewmBk+fUp0xrVuy5WBQDboA=; b=kk2adak6TjCsMA5eGu/LjuDGPU
	VJzPqA+BQvwDMjmAR+gVh8pVBAt5H3usC0BH8W3WF9H+bFLzx8J00Q4yv7uJh2/WM2qKBNQefQ/9+
	Kq3N/vVfE8uYxKJsb6OlmToJN+P/Tbh1xb/WN7ZOzqd5yJGdaJXZ7eRr+68FhzVwc4HsjYQ97EKg1
	Kl0UufnFxQousSD019RsGgYemk4iq+8Z5L2UfF5YLQdcdlpOGvQEVhvWproCIDF2L3Hr+W4OSB7Iu
	52E/vMTiPa5p9IOcwbBdJxT826k5Y0oS48aH+/T2XUhUzQofh0VP4vzuq6w2WecXi9eO2BA4RweAo
	NnnXYDhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngx-0000000GkNN-3lDZ;
	Thu, 08 Jan 2026 10:56:35 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngr-0000000GkHx-44aO;
	Thu, 08 Jan 2026 10:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869790; x=1799405790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QsLTBFLRSsqzKbhE6ZxuHj1l34g02g1XFbZdK2cy1fs=;
  b=JKR32xNRm12RxQVndwPn9+Ur3MEGJa3o4UETqwyGsGEREd1g4ZGnjTwW
   KUcB519QmaMfs8FQyhCTliBqqviPm9wOrOJlhExmDnDZNG7gfOTGI8aTg
   1Ue0x3fdf2BhfeCOha52xGa78E9LUvaoZsBjYDbffzjcyP2GfkRYS1WWX
   pSCSptBnFzyP/wTnaJpzXA6TIoOR6xpr/WDXuiRosq8ktigM2tD20IIKW
   XpjBBJjQB61AWMC2T05I0pCc/vW0/H4f/DFBU7fZVbSydh1ZvnsLd/PJX
   nkAKngmjVRaUqETdfAff1g49CdlfQS62QAJRtpEpARuahKuqn+BSHFD2i
   Q==;
X-CSE-ConnectionGUID: gRbspansRmaJfyFJ+UinOw==
X-CSE-MsgGUID: 8pR2B4mAS1KFUgTu2pj03g==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80354532"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80354532"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:27 -0800
X-CSE-ConnectionGUID: iy3iIMreQ6a/mDhF/dca9g==
X-CSE-MsgGUID: wlX6BSnmRU22UNKliXDG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203615535"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 02:56:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4FFB19E; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
Subject: [PATCH v5 04/13] dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
Date: Thu,  8 Jan 2026 11:50:15 +0100
Message-ID: <20260108105619.3513561-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025630_052538_21B25491 
X-CRM114-Status: GOOD (  10.24  )
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

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/bcm2835-dma.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 321748e2983e..3f638c3e81cd 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -260,23 +260,6 @@ static void bcm2835_dma_create_cb_set_length(
 	control_block->info |= finalextrainfo;
 }
 
-static inline size_t bcm2835_dma_count_frames_for_sg(
-	struct bcm2835_chan *c,
-	struct scatterlist *sgl,
-	unsigned int sg_len)
-{
-	size_t frames = 0;
-	struct scatterlist *sgent;
-	unsigned int i;
-	size_t plength = bcm2835_dma_max_frame_length(c);
-
-	for_each_sg(sgl, sgent, sg_len, i)
-		frames += bcm2835_dma_frames_for_length(
-			sg_dma_len(sgent), plength);
-
-	return frames;
-}
-
 /**
  * bcm2835_dma_create_cb_chain - create a control block and fills data in
  *
@@ -672,7 +655,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	}
 
 	/* count frames in sg list */
-	frames = bcm2835_dma_count_frames_for_sg(c, sgl, sg_len);
+	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
 	d = bcm2835_dma_create_cb_chain(chan, direction, false,
-- 
2.50.1


