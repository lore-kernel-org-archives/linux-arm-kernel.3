Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C53CD6E78
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2hI/4dowBRGpaKHG6snEbJMYWAUf1IL+KFnXhHfRdE=; b=GmI1bYfXepIgXBT8FPZyfIClLQ
	vL/WdnabW5ZH+Enf1qWXFouKMSmG0qKrTiU7k7hbviCVPgrfeyGMLS6f2HvFmgNKnBZU8hHjCz9hm
	jVU1QmdeyCNFGr7PXVoddM3btHYX/TVLIqiosn6iZj5RZajM9EF/XB8bGWdRlnqxWV0amx0nbRFRq
	/7+4KYi/oUR618O7cnwTNWfsRnxnePHybDAxFSsYkaSyGEQ0fGTBGU3pJA6RTaMV4oxuDw8kobQ6z
	yH9QMpW/1/VVrF64l/+eRjsGwZnTAyeJf3LhmpvWKaYbRl2mpjGu3kKoydzuiNP/2LfvbaNph0lHf
	sTgEBCIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ40-0000000AhBa-15Mm;
	Thu, 13 Nov 2025 15:16:44 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3d-0000000AgpU-2bPO;
	Thu, 13 Nov 2025 15:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046981; x=1794582981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Su3S1OYlS3Av5yiXyt302P5FfhwZUhZFXIJtWLZ5yY=;
  b=Us91XfC3vX9z6gHfO2dpYMOAzCF5os5b0ztf21feBh/KjX0RjA6DdkZq
   Bbs7PzLDHmqEJkIQvDGZD9yWaiXu1unKl/o3L0MOUI+L5zLLddFoLPVF0
   6fei8+Zszevc8E9J+3ynhWrfPUM9/gOly3fYTQFjgubbF2fVtmzYvbqXX
   VX1kkn2CbDfGPwZVtHKimmTHW29j1oOs+QWhD7fhq0y9Pwn9AmFi2XA74
   YuD85Hv1V023apmwHKzOYCBsDwEU7MD37m0xNLIiPvwX/B3X89wI5i/mt
   ty8ddI1Gqst8neCy9fx+lMVqxZYBifnkAQlI2KMQxGPWT21XYr/n/MunX
   A==;
X-CSE-ConnectionGUID: /P2FzOGHQwab28R9aCHG8g==
X-CSE-MsgGUID: 5vnn/B1eQMqyMveF0K3pCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75809667"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75809667"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:16:11 -0800
X-CSE-ConnectionGUID: ZrcshzK7Rmen4NdOTdDGrg==
X-CSE-MsgGUID: armfIibfREi1XvODTfMFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194684641"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 07:16:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C12E09A; Thu, 13 Nov 2025 16:16:04 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Subject: [PATCH v3 04/13] dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
Date: Thu, 13 Nov 2025 16:13:00 +0100
Message-ID: <20251113151603.3031717-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071621_685909_94BD1A5E 
X-CRM114-Status: GOOD (  10.45  )
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
index 0117bb2e8591..802b23be2fd8 100644
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


