Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FDDCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5PyRXg5WMJnRMO6R3xM4L6tyt6gTVG7sGYymD8rtqM=; b=pM6LXm5NTcX5A/D3IPxGaXm9Sj
	LFJkpf7RxBdux2gSIHy6HYD0hc3EYf8thPIsUM4ChnJ7wh+JTa/x56FFKnh6VM8LcC4vGSe7NSX3W
	/P4qIbEbtqWNBaUAv8MRNEfRUjuk8vvvRku2wmIdHa3qwijOaEmkR9llAxhQMvsQMsBElyr3F+aY4
	NE5IbQoexp3+4XIlT4Rcthv6EwHuBJKY8oS/wxYT0BVxYGliIoOD0wy81xq8QQEXYv3IjcVdzJyMQ
	5h2D8s98meex0LFQcegDy6d6l2Zjhq9uTch2fKJcxwgvvrH4P6zivA4RLqm943muTZRqgscKwd1mb
	F1o+XzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVRG-0000000BczY-27Xd;
	Mon, 24 Nov 2025 12:13:02 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQY-0000000BcS9-0ub2;
	Mon, 24 Nov 2025 12:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986338; x=1795522338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=akryAXafWhZQlfplABSdwgarfhhYIf26xngrUAauxhA=;
  b=lYWjQNxcSxnt0YfD68PoEZow45Rpe2zleqomd1/VAUkp/vaIFnWaRny4
   NPeSoLumB8nF2vkF/eLYaS0JMmFeSPVTV9IU5RF3rQky5ajQQda6lzEc+
   lOX8D15TQxHV6zOoLZCp9FCNwjw1a+RuE96kO35fwoeHvW3fEU0dUZtsx
   wTOZfLwQ4tL5TuO9y3yGHUXwTSd9lDPyzpB3Gov8H0VXSfewGB3EXrE/X
   S0lcY99FzPVnm+1pXlOUHOkS5FBhFP/f1l6vg9HqVpNcEfAXBE6fo3pU0
   9rvNmdgHkYxPTE0brwQf7crUJKNYZfAdnEt7FB/s6cmgrQUEnPOaSnb7l
   g==;
X-CSE-ConnectionGUID: GvJdYOtdTAioAtqYRMzNug==
X-CSE-MsgGUID: JMfVykyjTDeJmii22iSZ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69847626"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69847626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:16 -0800
X-CSE-ConnectionGUID: DwbDk/0CSIK5hVBMlgSbzQ==
X-CSE-MsgGUID: 60dj4sW0Rx6N2jQllImwvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="222970346"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2025 04:12:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 73EFAAA; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 10/13] dmaengine: qcom: bam_dma: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:28 +0100
Message-ID: <20251124121202.424072-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041218_276408_D2E7FE2F 
X-CRM114-Status: GOOD (  10.89  )
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


