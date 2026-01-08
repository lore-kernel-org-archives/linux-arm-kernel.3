Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BA3D185D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBrcLNK2f4oHT4S63vlKaLvf/r/Hu0nN/iP/LTtqCcg=; b=vCgt0qjNxed7IF4AsRbNIYPZb1
	RGd58YpjZHOUe1BeGiZM3qO4atpUjeEV8WhsdKKYeK7SifFebQytnm4SXDWYLfpcj1gFqNv1vtX/n
	+v+Eo0dcICQSmlrJ5EnCRRgdwh8F9LBoYQlQTHlQ1FBfzQDO6DlZhTIq3ivYOIZNd3a/dmAnMaJLP
	M6o89H8huMU7XmZobJElmUab4OeppukfUSshfPpGf/tBExSb0lwljqEMRedkVui8h11gSbs8Pi1/e
	moInjdxNO+o4GsFqVZ31GDxvfaJzbBn9ZVSIbcFSIgmJFtx2S/PNT8dJcRBAx3ICyYjyF7dOjNjN2
	Q8ffDuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnhK-0000000Gkog-3OYu;
	Thu, 08 Jan 2026 10:56:58 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngx-0000000GkK8-3IY5;
	Thu, 08 Jan 2026 10:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869796; x=1799405796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AVsEaLmI7GtsoKPxvWrWR94lD6aGbAJMgKiJV4Biyag=;
  b=Y20wu63POTqRUHuIFn2mW2DSgAsBbwPVY1MWUcbvEuSZwDSNDryQA9HE
   okdDWnwnooVCiMJsOQ8n6vMqgX8KMjQsx4mY543cQm1tzhDay8kc2X1e8
   o5as/LfedH3bYx6ZDisABKpcEoZNSfyYni/pOcOA6WKwt2YzJinYTOOwP
   2N4XIla0kuqqgNlOQyOGk3j4B22iC+po47GzsKG4raCmwhdaVWzvEkV/k
   zdBv4BRIXMoyI9PSkExL6RENiLcykiOxnUT18P4+WI3MVgQXhkaTSZniW
   T68fwXm1LvOpKR8HqtFrZKp0jMn1GLOZMjoH/7pMHVArfhzn2o8fUUG24
   w==;
X-CSE-ConnectionGUID: pmxnOnCESn6a00cYiMu4DQ==
X-CSE-MsgGUID: 0LzPZMqvQzCY3NKKI4i4sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79886180"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79886180"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:33 -0800
X-CSE-ConnectionGUID: 601UvqCKTx6wLpXwlbDKHQ==
X-CSE-MsgGUID: 9ZAmcWIfTjWGSX4K+MEYhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203091233"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2026 02:56:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 54E70A1; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
Subject: [PATCH v5 05/13] dmaengine: dw-axi-dmac: use sg_nents_for_dma() helper
Date: Thu,  8 Jan 2026 11:50:16 +0100
Message-ID: <20260108105619.3513561-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025635_875733_D0BD4EBE 
X-CRM114-Status: UNSURE (   9.84  )
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


