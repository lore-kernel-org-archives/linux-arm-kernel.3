Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55918CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PrQOqlxk6DSKO1Tt00IzLpJWRysN3sGJnFtngaPo2F0=; b=YMDMMaFnWm4xvFTDBJf+xlDfMt
	oOGsQ6biNXNqGipsZQwi0y6sTa949uLwtWE0xtGAv+Xl5ogf9qLv8gJltFKv5PmEdtzD23quKZNh6
	LSIJ9OHrlCJkA74mn82C+kDulLMUdd8AtrXC+gUQMI7cC8egokIvWov9GFEjXg0PxaUc10AAP7on/
	xWpjIne8IuTkdjg7U3/AGYAZCT7YEXqwpG0erhQGO8TW3PdqUVjgy2UKYRHz9BhpcG7gTjRjNxdXI
	R8s8h96wQ+T/fC/f1/Y2yyKo/OWaZVGZU65icoJOlRbmxk4hlTPpX92JmlB9zAuUqCN+DLu55muUg
	zX3vJDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIS-00000005D0f-1pel;
	Mon, 10 Nov 2025 10:38:52 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPI1-00000005CU4-0Spc;
	Mon, 10 Nov 2025 10:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771105; x=1794307105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kkqrRlJJXqaQ9jwjs0WWeFbHH6xsAR9/+T+ChQxdAVw=;
  b=YuDLkw0+srxEbxHfTQYr3ImoT+fA3mm/7NlKR5KmIAfgvN12wlk5/qq+
   loEehT/v0QU4443l7JM6AZJVwOMBHI9DFNZ6vG8yhqokyhA8jB1gK52Np
   MaliSKySQGZ/TfgrgTZj8F3HX4hZrUoi0OWoT3xsmw0CakF7fhOR7jSYC
   45RVmlooFs9PmaEks04NIZHFR18N2aUMbQA/L6YLtANuKjXBCgGq1jlvJ
   17jCLfQi2HVxTRb7gezFwcV+SjJNAkX3l6Al2AdbhILzKwQO8zr06MI+n
   4I2t26Vq2Bx8lyxF5pdzwHSss7GSlmXotqlo3SaZuRArz6QCeXheF4zkW
   w==;
X-CSE-ConnectionGUID: IgPo+kvrQlOdxaqojL0R1g==
X-CSE-MsgGUID: gPRAQwGjQGWrtsgdFQkaDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64728173"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64728173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:18 -0800
X-CSE-ConnectionGUID: PdOXYKXLT5KWq9LVRRqvJw==
X-CSE-MsgGUID: naXh+AdZSgGcfLiJyiM+rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188891262"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2025 02:38:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 967D19F; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 10/13] dmaengine: qcom: bam_dma: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:37 +0100
Message-ID: <20251110103805.3562136-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_023825_201530_153C2018 
X-CRM114-Status: GOOD (  11.00  )
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
 drivers/dma/qcom/bam_dma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795..62b3921f0d11 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -655,22 +655,17 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	struct scatterlist *sg;
 	u32 i;
 	struct bam_desc_hw *desc;
-	unsigned int num_alloc = 0;
-
+	unsigned int num_alloc;
 
 	if (!is_slave_direction(direction)) {
 		dev_err(bdev->dev, "invalid dma direction\n");
 		return NULL;
 	}
 
-	/* calculate number of required entries */
-	for_each_sg(sgl, sg, sg_len, i)
-		num_alloc += DIV_ROUND_UP(sg_dma_len(sg), BAM_FIFO_SIZE);
-
 	/* allocate enough room to accommodate the number of entries */
+	num_alloc = sg_nents_for_dma(sgl, sg_len, BAM_FIFO_SIZE);
 	async_desc = kzalloc(struct_size(async_desc, desc, num_alloc),
 			     GFP_NOWAIT);
-
 	if (!async_desc)
 		return NULL;
 
-- 
2.50.1


