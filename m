Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AD7CFD317
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuCwsDcDNZ9bywv5VXHss+jPjIS8IoB2eVQNBHUsfJI=; b=eBUyeIZNSy72JztkDeft2ufWGJ
	/kFExTDXAW4eJfqFeyvaz1NiUZ8T8NuHTGEMJy6yQBk5blfMCVFEIVn4z4PYwxwqfn4i885wHOcZ3
	N7cFt2yo6pcEoXO8pseNAZYpl1VeEg4tpvn+Ex0gPRrMo3Y/ZA7mlVQiQsvkl74j0HwB9Cfsr7Wom
	XTdWprvEZGhigd9irHmf3nc4eZgmJU5DI7YoeVcoQucMDo1are5CbxMW7fCrKZ1jQmbHHfEyDr5yB
	YocBY089XQ6u9EwUEeJdQ05vLlzEovx5U16MBnWI5EQ//hig9UlM5Zkywa3WCr0TLilgrFobPOD7P
	0mBUXZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQY-0000000BcU2-29n4;
	Mon, 24 Nov 2025 12:12:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQR-0000000BcP4-24OY;
	Mon, 24 Nov 2025 12:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986331; x=1795522331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=trxP5p0DPdBeRi5vhwLDZx5PvWwqNzPStkGF5be32MQ=;
  b=cYbNYBTAcXN4EMyeFtwSjRxSuEbDpjLz6B35bMpI5pHgJRRMVNILSGpk
   9X7Wj3cEaKnI4xgZhLc5BgE20qwVMnRHugOIWmg7JCDI8UNitw/KA+QWU
   BQxidiEnyWuTEvySN/m9wPo+VZgEryCI4/Ai8mqgZN90V39o70Y2iv8me
   oRWtdCICgqRLT/mg8Zkc2tEwPD0q6kQXMSXl7UMy9YHNbV8TO67FIahqS
   EQoHmxBArYmZDnkTQA3BSQEpAOsu/UbcgcZY1/jJf2Yc/pGx4/uY+Yp3P
   bdbxCVfRFZRdESxqU6NZ2f+/OF3+3LHSUk9krGQg7+9GgHLKn/7xO//eF
   w==;
X-CSE-ConnectionGUID: kbWBjhzeRSaOPaRqNKozXg==
X-CSE-MsgGUID: j+1su3zDQvqp7GU2j05QMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91467923"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="91467923"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:09 -0800
X-CSE-ConnectionGUID: 3opyCmUeRgyXZLeN0a8A3A==
X-CSE-MsgGUID: ZpvOF1xUTt2GcGUO71jbBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192559539"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 04:12:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4E189A2; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v4 02/13] dmaengine: altera-msgdma: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:20 +0100
Message-ID: <20251124121202.424072-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041211_542757_FB4283E9 
X-CRM114-Status: UNSURE (   9.76  )
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

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
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


