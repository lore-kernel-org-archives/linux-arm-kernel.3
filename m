Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6817CD8C87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBrcLNK2f4oHT4S63vlKaLvf/r/Hu0nN/iP/LTtqCcg=; b=RJ4Emsf56hPyHLTGkAE/L8cTJq
	95PzaxuL2AWAauVDVgGNIbgh6FqCEkznX0YKed5RLPne72He+tokQ2D3hrR8VUkJYGM0gx0K35L0G
	Bkaqtpan70YYqDghKYNoVkYpcWuKS509XrnJkQvYhDUaSCo8u6I+jFhR/5aCEq/At/jjjM39LobD9
	4TdPLmjMMYx+5jVkUK2oL3S/dGFGP6TYJK08uE/g5WlpI3aE65jZSgH+xzxxnW4IAAcKqlXQ6TAXb
	ZacCYnplfnt1fQXh/P5jpjfEYtbMB9znuc8ifoPOXpGqoNaLE5HMvbDDll/P4IvV4kSGidMEJWPTP
	1QrHBxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3b-0000000Agok-2mQY;
	Thu, 13 Nov 2025 15:16:19 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3Y-0000000Agj7-3Tyj;
	Thu, 13 Nov 2025 15:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046977; x=1794582977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AVsEaLmI7GtsoKPxvWrWR94lD6aGbAJMgKiJV4Biyag=;
  b=HQ8VZ//Y9tQKrm/FQqh+y1lpv/yIDTKoyJZV9eUu4XBhTSSVTVdrFvxf
   Y+EECi94S26Xfi5D4xRMUnhIpUmcFn0m+W4iT2WKK3SZ9nlwTvdoJTX8C
   UdLHEUf+1liIstYVdM3uh6jDW5HkGNNh2N6EKpVm0k4lFHZANVch+sIU2
   JF4kxdRuQcuQ3enJZhwJbiXqOL1EedYZKrl13yl/1SOOAd9gQQ2iuxjbl
   1mvdxEr+1U1j7Gg4P3UmJ+aArO2eu/n4Jmw/vlWN0zefBo1pcQA+dQsnr
   FZSWPecRTAHSRguNojKW8GI21eoFnB8OOyFhNnDCG8axAHoudVDgOhPAJ
   w==;
X-CSE-ConnectionGUID: Xv5TD5QTRqGsKESBwXZrqw==
X-CSE-MsgGUID: TcrFCJN/QtCgHocY8809qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75740516"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75740516"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:16:16 -0800
X-CSE-ConnectionGUID: 8fOr48mIQVSV0TE5NSz8zA==
X-CSE-MsgGUID: VKEtdWfcQCuSxGIeHiOwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="189792121"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 07:16:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C62359B; Thu, 13 Nov 2025 16:16:04 +0100 (CET)
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
Subject: [PATCH v3 05/13] dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
Date: Thu, 13 Nov 2025 16:13:01 +0100
Message-ID: <20251113151603.3031717-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071616_879539_B1D696E9 
X-CRM114-Status: UNSURE (   9.95  )
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


