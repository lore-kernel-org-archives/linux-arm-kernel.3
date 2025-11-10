Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE69CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1sJNE2Nf8lh/Cklix1U3cAUGCJy//mQiYaVe3vP2kA=; b=2SiaqcspEiJmLtgOfI/1E0uvi/
	jSO1fex+rqhlXRkZQ7AbvZUlalCEDCK4o3Vm4/3f/GID1y8GaxiYV3/NVVrDIb2gYiW8sKNlahk1h
	v23qN+rDPfJIzkZtnJvNa0owJvj9mGJrsDg5ZVxrEQ+u9VNmRdI+zNChZTASPsrfTJ2g/4JByKOzv
	QMa5uEhnb1+U89dbtOUpoLB8tKVikCQCjLxAVMzkXaCXcjW0kFJ2my+JHfe79l9kGBkFWME/gwipY
	noEx6Bc9HTyiH7CsCbPmssCbaxA6ZeiQ8ZbbsjDnB0waDipmhrQwH/XLw8fCyP0Ces+W/JuLiDQGk
	Nz1cIb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIC-00000005ClV-1PCa;
	Mon, 10 Nov 2025 10:38:36 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHu-00000005CU4-3aFz;
	Mon, 10 Nov 2025 10:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771098; x=1794307098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ombQ+TjdDEAj78/NTyf/ofAiLx+opvwgbqhYEgolUs4=;
  b=mPmaBPQS46snotA8wyTIYoHvkfE8CPdtlNLK+SaeevHIzcfF6++y/WN0
   h+cd54WOmR6x/zXo74r/M37ZgLI1Xqub1IEqDsJBSR7FGzoc3tm4P8HUl
   PWgtuM9V7x3ViUA6/hhqPpNx6+9A3QVXTp4n2cWdpyqAX6Q6IhTzEjRZ/
   XPPqL87mX08rSgxFH75i3GL5ioFjFcMOJ9GNlU7isz8nvnA6/4Qgt7j8D
   DI5wQi+gwoS52qSnQOIzVietB+WK9i4pZ7YEGvj0HiSgIQagalX+fTVDR
   sXS8tFYj/28bCLJgBoZp1f7swGGxpl/K0V+0nnDiXpwT1wqdBmpsspsld
   w==;
X-CSE-ConnectionGUID: imT4uutPQYOyflW12ced8A==
X-CSE-MsgGUID: LOTbf2dySEq33CHkbdCr1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64728171"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64728171"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:18 -0800
X-CSE-ConnectionGUID: 8gMHequCQ6++saJZYLHcRg==
X-CSE-MsgGUID: rtvwXY83S9uj4lNHRZygjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188284740"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2025 02:38:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 87BB79C; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 07/13] dmaengine: lgm: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:34 +0100
Message-ID: <20251110103805.3562136-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_023819_128120_3E62074C 
X-CRM114-Status: UNSURE (   9.89  )
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
 drivers/dma/lgm/lgm-dma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/lgm/lgm-dma.c b/drivers/dma/lgm/lgm-dma.c
index 8173c3f1075a..7d4d3dde6d88 100644
--- a/drivers/dma/lgm/lgm-dma.c
+++ b/drivers/dma/lgm/lgm-dma.c
@@ -1164,8 +1164,8 @@ ldma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	struct dw2_desc *hw_ds;
 	struct dw2_desc_sw *ds;
 	struct scatterlist *sg;
-	int num = sglen, i;
 	dma_addr_t addr;
+	int num, i;
 
 	if (!sgl)
 		return NULL;
@@ -1173,12 +1173,7 @@ ldma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	if (d->ver > DMA_VER22)
 		return ldma_chan_desc_cfg(chan, sgl->dma_address, sglen);
 
-	for_each_sg(sgl, sg, sglen, i) {
-		avail = sg_dma_len(sg);
-		if (avail > DMA_MAX_SIZE)
-			num += DIV_ROUND_UP(avail, DMA_MAX_SIZE) - 1;
-	}
-
+	num = sg_nents_for_dma(sgl, sg_len, DMA_MAX_SIZE);
 	ds = dma_alloc_desc_resource(num, c);
 	if (!ds)
 		return NULL;
-- 
2.50.1


