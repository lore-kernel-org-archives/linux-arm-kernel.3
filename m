Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21B2CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL4r8T5HCBfVnepkKGXuLZlKoUKMS8/UJfDhOW1jXE8=; b=tbH43kwUJqmml6tAPLPAe1mrX9
	HME3ujZe/Gq59rRI2zQuxv93CLLwX/FtmpLhPE8qmgmoJjKefIrQ3yQxs4LrLlSaAznjGzu4a9cDx
	hYhumKG+5RQz64jmMtpaoG27xyTDf242dytDBQt9O1Fkx616e/O3wDIVRfgE129MFAZriEsUs6wTF
	NHtx+3xEOR+7ffSNICCMxRDiHEu0o+91udj+8DbZVb3zih53zEvDneGOky4VanwzobDX96NwqURJ3
	nlnUv614o2+NKQwNXg27yUkSwkq7P+Qcr4A1FkcNRjyaDc6OnUOv6pq0IzghjAEIZ0dKRURDTMg/D
	yqQNJxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPJ3-00000005DOs-2Ep3;
	Mon, 10 Nov 2025 10:39:29 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHv-00000005CVL-3ygI;
	Mon, 10 Nov 2025 10:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771100; x=1794307100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tuiVzboSHyjf31tCwY25FNJV98tPuA8LcsvcOQFyAoE=;
  b=HUWA0ql/oQd2AHoyWl4oIZnwuIodwPQ3VeBdZSYwEw1NWLcOmCcB7sSf
   essk2QsMH0IgzKweV1VZ2WP6Vgt6YqWwBEvca086wDVkevVRWQjUn8qU3
   ct2rpvapi+o5GQXdxf1v7EsfcQlxtCyEKl54eajerKZ0maL7Olp9erxld
   mSFBA7ow3E4M2AgREmwt4cYPWyID85EpmZtgSMLDO0vwdgqyTFC4Mj3mj
   oj8W9dXRistPStgmGbjmTJnNOxLlGTRI39P8qQWRrIs/YKujbTM/d+dIu
   UbD2/QSI6IUi2WJcohttS5Nu77aXwqV42JmlnpUjZZ1eBnLbpJ2Es3hLb
   w==;
X-CSE-ConnectionGUID: CRGcSsrRT3KFX/6ZHJuqcQ==
X-CSE-MsgGUID: uyLZEKnGQmmN3ImvkQ14Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="87449161"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="87449161"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:20 -0800
X-CSE-ConnectionGUID: W76lnCWyRCGiLpSa+rABMw==
X-CSE-MsgGUID: LhFTpzGVRvW8XVjiIB9cww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188479809"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2025 02:38:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9FCA4A1; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 12/13] dmaengine: sh: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:39 +0100
Message-ID: <20251110103805.3562136-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_023820_055424_0FC17154 
X-CRM114-Status: GOOD (  11.08  )
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
 drivers/dma/sh/shdma-base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
index 834741adadaa..1e1b65e46668 100644
--- a/drivers/dma/sh/shdma-base.c
+++ b/drivers/dma/sh/shdma-base.c
@@ -577,12 +577,11 @@ static struct dma_async_tx_descriptor *shdma_prep_sg(struct shdma_chan *schan,
 	struct scatterlist *sg;
 	struct shdma_desc *first = NULL, *new = NULL /* compiler... */;
 	LIST_HEAD(tx_list);
-	int chunks = 0;
+	int chunks;
 	unsigned long irq_flags;
 	int i;
 
-	for_each_sg(sgl, sg, sg_len, i)
-		chunks += DIV_ROUND_UP(sg_dma_len(sg), schan->max_xfer_len);
+	chunks = sg_nents_for_dma(sgl, sg_len, schan->max_xfer_len);
 
 	/* Have to lock the whole loop to protect against concurrent release */
 	spin_lock_irqsave(&schan->chan_lock, irq_flags);
-- 
2.50.1


