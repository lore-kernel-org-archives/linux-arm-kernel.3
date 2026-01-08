Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9ECD185D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ux+b4WIwHzhNTcqVcgIiHvwPV9UZJGhYPXMGEntPDIM=; b=3JSN9tSxKuE/fd5QS2tg/nxcfi
	W3+aD4x3UsyxtQoitw07/CUsmuKqykoNyC3S/dIVK/yMd7W4tUNifcsZLBQLKEFy0sN0p/rf3sIGj
	TkzpyyEJG5H7se+sq0gmTtSg8Xgu/jdhx62XBj6MxRkoUGhdcBYeSfTLSZj1xV9DPR6Gc1UC73Zkc
	8KtFvndogZ08zJ26CE0qmDyLs03pIavl4hICkiBHvcJD5r9tXJdw8Mdy95vGSFa2J1bJxEleJO66o
	LkXxBjI0+H87r9QsTAVc0rezm/N32yIwi+r0VRgzQ4Vd+2zdfe+ElHfuk+GAvgafoRVX39dbzmgkV
	4Y8TALhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnh0-0000000GkRp-3nkT;
	Thu, 08 Jan 2026 10:56:38 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngt-0000000GkHx-0wYS;
	Thu, 08 Jan 2026 10:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869792; x=1799405792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0PKa+x5gXv92s+9IcYHn+CLocgSZP4a9Z3TXr15mqo=;
  b=ZDt/bF+L+fVkU5k+QlmavnGt1s1vjA/rs1wGh4ygTDPwKv9CtvZHKdbH
   /rHHgdXrHwL9VdmFvJDfCKzzQfWuuYLcQQ13nA3oXnfgqys0uhb0EReu/
   uN8yO7hvPZ6pneFECrCc0OucKkn3W9ucOs5D4aHPeObzEokK/yWjemChR
   Wsay4IQf9ZsZrL2QiA7EGcDhIKPQz8I+6uP6JOzI3ur+vIEO4z3g3ZjUI
   yeqTqA0R5O/vaaQzG83q6bQ3NgrHpI12BCDcZcFq09C/8phQYbMolic1h
   jHF4BEspb5+5ui96VSWHW0e71Hdeg3K3NSvv34c1t4sVBOM9TbrnvUhSr
   w==;
X-CSE-ConnectionGUID: ETsO68doRPqSVs4G1t83dg==
X-CSE-MsgGUID: zKBCr5aGSXSsfgKV0L+WaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80354574"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80354574"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:28 -0800
X-CSE-ConnectionGUID: dXQieIjVTd2WGJm8g7WiPQ==
X-CSE-MsgGUID: mheJh/SfRpuKhuDOeynzPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203615539"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 02:56:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4675E9B; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
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
Subject: [PATCH v5 02/13] dmaengine: altera-msgdma: use sg_nents_for_dma() helper
Date: Thu,  8 Jan 2026 11:50:13 +0100
Message-ID: <20260108105619.3513561-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025631_342613_2D6B34B8 
X-CRM114-Status: UNSURE (   8.89  )
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
 drivers/dma/altera-msgdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index a203fdd84950..50534a6045a0 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -396,13 +396,11 @@ msgdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	void *desc = NULL;
 	size_t len, avail;
 	dma_addr_t dma_dst, dma_src;
-	u32 desc_cnt = 0, i;
-	struct scatterlist *sg;
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


