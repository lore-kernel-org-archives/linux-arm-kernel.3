Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A72BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xveyd8/HwodqN9fSoBacmuoCFJZxCpxHtYAyGYvEh+c=; b=grp4oO6E5A4SThnnnzgpScGW1V
	WIoMyyO3uLVO5hG50ZEAo3lPnmiG2l6FUqF2W4Bt7KGM08xcu5XjptBQCJzPz92bMMdxz4x0Bj0yx
	//BfMiYManYLJp2sNsacuT6BpyU+rbMGbwgJGU6c1t5hUX218rQScd45Q0fHWdAuY5kDon8mKOaBN
	BQaiIy6kZEia6GkU1Y9WYDWFEh8tEh4CjWMbjyKy5Ik63lAUWHXtFMExh7oB58jDE96jfq+uuLEKv
	AC9NCMBiVIth7aifDqV30KrQVjhO4npH4tAgtwxG+/kFHa8xkpPtRSPKoo8mtk95w9sotYY0HNXu4
	7hXJ8qdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPID-00000005CnC-2t48;
	Mon, 10 Nov 2025 10:38:37 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHr-00000005CQd-2w8q;
	Mon, 10 Nov 2025 10:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771095; x=1794307095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ux3YDPxRIRJcqm5FybObKjKYtBEmPBVV9iloQuSAsH0=;
  b=jOA0LAxHGBw0fo0dFKIrjVkjGjsoXz3TEGq+7AkKlPmd+PaCUC5NFS5f
   uBLqd0Bpi/AsSwAYx0NwrWVheYf+2uuZHz242Ej4XnMKm6gjy6vRy89et
   TaQXL16S9w78/BYIi3iE46fQ5x2SA9cox/ULZKg91lqmvtrTo4qrvwOwV
   502eNa79dJFhDDGYD87JFBWG7aQjS63IVegkikVK5MEIaPSwv0zd8MLf7
   XDZNNcBL5BneyMEsYDG1wXMT5j8RLfAor0ASZlDvZSU/L184A/sRk3PLY
   RNS49HDtTCb06td3yFiM9ryTXhlLsobeVsQLBY4BKAUo7FGvS4ddguwNc
   A==;
X-CSE-ConnectionGUID: uGojpnkES6i5J15hpkVEsA==
X-CSE-MsgGUID: bVkowcmuRjG4HYQCPmi99g==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82445578"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="82445578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:13 -0800
X-CSE-ConnectionGUID: LIP04zOORreySQZMlK9cMg==
X-CSE-MsgGUID: ybY7gYwFRaiOboFvVla2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219369242"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2025 02:38:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6FA7397; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 02/13] dmaengine: altera-msgdma: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:29 +0100
Message-ID: <20251110103805.3562136-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_023815_816444_61C2C837 
X-CRM114-Status: UNSURE (   9.87  )
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

Instead of open coded variant let's use recently introduced helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/altera-msgdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index a203fdd84950..48d2a0e638bb 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -396,13 +396,12 @@ msgdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	void *desc = NULL;
 	size_t len, avail;
 	dma_addr_t dma_dst, dma_src;
-	u32 desc_cnt = 0, i;
 	struct scatterlist *sg;
+	u32 desc_cnt;
 	u32 stride;
 	unsigned long irqflags;
 
-	for_each_sg(sgl, sg, sg_len, i)
-		desc_cnt += DIV_ROUND_UP(sg_dma_len(sg), MSGDMA_MAX_TRANS_LEN);
+	desc_cnt = sg_nents_for_dma(sgl, sg_len, MSGDMA_MAX_TRANS_LEN);
 
 	spin_lock_irqsave(&mdev->lock, irqflags);
 	if (desc_cnt > mdev->desc_free_cnt) {
-- 
2.50.1


