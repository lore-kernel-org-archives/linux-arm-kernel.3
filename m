Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA2CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk8/5nWBofggtO4HKczYMg6PfcYGq3JDVme1biZjuQk=; b=PDl+t/Q+YcvHQcAeCJ9z7t09Xy
	AVsAr01mjsOFjAs1H2S32rloJKbqdkGfu3oLSMfwLHVluUK890v+YVEkUZ1O5ch1vgnMkjaedxDja
	Pdi8gLCbvVKwasE8gSi/kGw9Bx8ly5514ZcDvmIuDMvguRC7E6bpV9OM80xot5HGIWg+zlIr+DjFx
	VfHmC41Xb2pFKd7HTiWHHJhT4Goc7h2H6QBw75ye2sY38eyYjaOb3tUQfDdPds7T1oCG2EUK9wIQM
	DJ/XDY6qHZcRzo3labK/Cw10ljXMaQKPzjqLgc11U3JrGCNZNCboy6VI9N0Q63ZKO13QqBI3zafR3
	0UQZ/JxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQY-0000000BcTI-0EH6;
	Mon, 24 Nov 2025 12:12:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQQ-0000000BcPH-2zFs;
	Mon, 24 Nov 2025 12:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986330; x=1795522330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nUvI1SoM4FGg3QQHNwgNidRdOH1tF5MQSJvXCQ4IzUg=;
  b=eTax8LoCRsWvbyFRvTwNFsHYf0BY/tYwiZxMDeCPUFL9JOxuVSrnDQU2
   0LNi2CIqdAYxOE/loPLsoTDmRrlWSeCNp/5MDXYyQWKxYJk7Op137pKkx
   oUYWqwaqzVsZm4u8O7cc4ic6OWjPutJKQYEevylBy72RVVZNsM91ks/FE
   uUmXF48pHYI4KUjKqp4iQZ+eFYfJlwCUn2TxhquHCaap87hn+XSYhzgGF
   Y4BFes0xPYlgfM9lMUeeZ5Sz4CRf2ro71U6kJg2WK3RUmVxXWr7NyKG9c
   XVE8j9IGzp/twKe5Q4QXLQJhSY6hC15cAAhrirwFMWCEm4qPZmXUd4v9v
   g==;
X-CSE-ConnectionGUID: 5u13NA4MRZSrrgDf5zyyPg==
X-CSE-MsgGUID: A3bkHbbmS3i06khxYtR5SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69847544"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69847544"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:10 -0800
X-CSE-ConnectionGUID: O5zO3YrlQIGH3jGTtG1/RQ==
X-CSE-MsgGUID: FlLlvMcMQWWorE6BXZ13rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="222970324"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2025 04:12:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 52C24A3; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 03/13] dmaengine: axi-dmac: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:21 +0100
Message-ID: <20251124121202.424072-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041210_763345_FBC17EAB 
X-CRM114-Status: UNSURE (   9.91  )
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
 drivers/dma/dma-axi-dmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 5b06b0dc67ee..5d4436e7d2ee 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -674,10 +674,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_slave_sg(
 	if (direction != chan->direction)
 		return NULL;
 
-	num_sgs = 0;
-	for_each_sg(sgl, sg, sg_len, i)
-		num_sgs += DIV_ROUND_UP(sg_dma_len(sg), chan->max_length);
-
+	num_sgs = sg_nents_for_dma(sgl, sg_len, chan->max_length);
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
 	if (!desc)
 		return NULL;
-- 
2.50.1


