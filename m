Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ECBCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBrcLNK2f4oHT4S63vlKaLvf/r/Hu0nN/iP/LTtqCcg=; b=LLERpJw91ZrpSIcoz6CGTB0QUH
	hkRmDamE/hKESz/IAxKlzs9ktCdT4EM+weTdMjiOjQvEERaqaWyaQW8/Dg28SAmMfk4FqEnWvLmE/
	tciob5HDWDepOKcJI/OI3rGG9lhFGWL4U5aq82vdUTu719gs5XwwEdVqbwQnmoc6WzTslWUA1Wgzt
	E/CLA8dEF/jtJSjESjtWM7zb9MQYp7BpDcA4bQPmTVyh5T1hqPQvxbV2ct47bStfK8TV5U1Z1c6HL
	ehPQlWRP3a4Sxk3o+8hclh7MI89025XVH7uoOTbWAh3VTVNMSlNE+gY71WPCTkIDn+03F1zspIsBW
	odCWUKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQv-0000000BciX-2Pq8;
	Mon, 24 Nov 2025 12:12:41 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQW-0000000BcPH-2Ufk;
	Mon, 24 Nov 2025 12:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986336; x=1795522336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AVsEaLmI7GtsoKPxvWrWR94lD6aGbAJMgKiJV4Biyag=;
  b=gv7Alp2MwwY/YENQnxlAqwX4Jb66BADPHpn9PlFx01QK6QAObrLeVYMt
   +Tzqsb5oj3B9pzqbcgL2ntI0ElSXS66Mx5lPTb6V1MF+57aNd3a+vg9Yt
   nRHIQuIa13OvptDTfQ2CdcgHzFPc3u51438QYpCimDGy0UsqFv2CYv9Y6
   PT06pJ+78w8VbWgj3z78iK2amsXl8NYXFfeHqRlBDHu8BFjQmf/AgPTri
   iwC/B1I+bHwIsjV2vrgLcXTxVJsIF/hcIrmCp/kYeAAKIgs9dDAsezg7x
   tY0vgUT5LWkNgJdbdJ/VttuQXQ6eXwZcTXfdINs5DN7bHrVRhIcydlTI8
   Q==;
X-CSE-ConnectionGUID: pKoC58ygSXG3XDro6Rn4cw==
X-CSE-MsgGUID: 7TYTLbfKRZaBxrM2YOtvBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69847582"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69847582"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:15 -0800
X-CSE-ConnectionGUID: spmCwM9MRQqA5SvF0Vzuuw==
X-CSE-MsgGUID: TZzaWKrJQOSEKD51KOqVAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="222970343"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2025 04:12:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5B4BCA5; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 05/13] dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:23 +0100
Message-ID: <20251124121202.424072-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041216_641580_B9AF1EE6 
X-CRM114-Status: GOOD (  10.38  )
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
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index b23536645ff7..493c2a32b0fe 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -850,7 +850,7 @@ dw_axi_dma_chan_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	unsigned int loop = 0;
 	struct scatterlist *sg;
 	size_t axi_block_len;
-	u32 len, num_sgs = 0;
+	u32 len, num_sgs;
 	unsigned int i;
 	dma_addr_t mem;
 	int status;
@@ -867,9 +867,7 @@ dw_axi_dma_chan_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	if (axi_block_len == 0)
 		return NULL;
 
-	for_each_sg(sgl, sg, sg_len, i)
-		num_sgs += DIV_ROUND_UP(sg_dma_len(sg), axi_block_len);
-
+	num_sgs = sg_nents_for_dma(sgl, sg_len, axi_block_len);
 	desc = axi_desc_alloc(num_sgs);
 	if (unlikely(!desc))
 		goto err_desc_get;
-- 
2.50.1


