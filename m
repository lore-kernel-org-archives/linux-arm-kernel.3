Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA7DCD6E78
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwi5dnF3dpek4jXJULnJfgIW6KK1KnHzUaqp6GzvFq4=; b=z+QztmtgUa+wCJeMwSObwtDEny
	ms7/Wt8g2ll3MgUHbug2lKmNILlplfZ1ZBqSCf79NoegvEKHRp6y7nuwZgUO8uhya01Y+hYgQs9pe
	U8mvTwYl4HM0QDgzfhMpGecZiRAiW7/fva7eFPhxNP44J9ZY0uQ/qxMHNF7k90C4u/W4sYy7qOC7J
	Vpl/xiip2zCyQct28P6CnuWIVqOWYZnXRDssfz/eGv3v+MhOe3y6EDfV5wLuSnxMUtdpeOkUzJV8W
	uUbdjJAOo7rc+tFWwNDJRFg5UYuaQKjhsEee6CbmZB27CodPd+El3nj5h4vGgleEmGtaCG5oEkBZQ
	tBYMJDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ4C-0000000AhOp-1sTo;
	Thu, 13 Nov 2025 15:16:56 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3f-0000000AgrT-01Gv;
	Thu, 13 Nov 2025 15:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046983; x=1794582983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rUyODX56g/0PVw4q9uoPm3QtJgx5W1kE7M9udwy7iHM=;
  b=S8susTRh5Kjl/3F+sqz1PD8aubanPiUgpq78Bjkx7LQQBNvXHLMdczC/
   6nMSAhqdcJLP2zr8/HF2cw1skLgLUZY5lf61tLnGHfmdNiiv82JBWpevV
   dX+glLE9tCbKeI5ZHg/1XzYIpMF5mCbITyVBJ7cKEiuyPZYO4qYatTF5F
   vI1lAQk93fDH7RRVSFIGcIpmV7KkW5L86vCHbhIAdTjTp4Faybcwq08Zy
   JS6R0/UJl2NdyhdCqoOjrlzLQ+PRhrRCU/ZROh2CYXgSvWzQPOeGvAw6d
   /jN+u/wjXWXAeN80OVEtxA+jK617cTDumrANItefsWd1Oz7wpYYx8vaZA
   A==;
X-CSE-ConnectionGUID: OUnaItVLRri/Habs5Vq0Qg==
X-CSE-MsgGUID: x58G6QxuTJqKPNfjblAbyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75809738"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75809738"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:16:18 -0800
X-CSE-ConnectionGUID: iGFORkBsT1q09zPLIJz6sA==
X-CSE-MsgGUID: NxFEkON2TuaiO/tQvDyscw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194684676"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 07:16:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EC114A3; Thu, 13 Nov 2025 16:16:04 +0100 (CET)
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
Subject: [PATCH v3 13/13] dmaengine: xilinx: xdma: use sg_nents_for_dma() helper
Date: Thu, 13 Nov 2025 16:13:09 +0100
Message-ID: <20251113151603.3031717-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071623_070338_EDC39E1E 
X-CRM114-Status: UNSURE (   9.13  )
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
 drivers/dma/xilinx/xdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 5ecf8223c112..118199a04902 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -605,13 +605,11 @@ xdma_prep_device_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	struct xdma_chan *xdma_chan = to_xdma_chan(chan);
 	struct dma_async_tx_descriptor *tx_desc;
 	struct xdma_desc *sw_desc;
-	u32 desc_num = 0, i;
 	u64 addr, dev_addr, *src, *dst;
+	u32 desc_num, i;
 	struct scatterlist *sg;
 
-	for_each_sg(sgl, sg, sg_len, i)
-		desc_num += DIV_ROUND_UP(sg_dma_len(sg), XDMA_DESC_BLEN_MAX);
-
+	desc_num = sg_nents_for_dma(sgl, sg_len, XDMA_DESC_BLEN_MAX);
 	sw_desc = xdma_alloc_desc(xdma_chan, desc_num, false);
 	if (!sw_desc)
 		return NULL;
-- 
2.50.1


