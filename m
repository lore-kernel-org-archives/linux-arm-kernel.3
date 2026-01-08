Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10824D185D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqsAGmvrT+RP/IY99VEMwYi0/a49IR5aMlu9+7wZVXg=; b=lhHafvDAHsaaNtxgln5mO+wBgs
	M94NOBcyUV5SXK5d3abiUNbipEfw+ryQKxVoHfLpA/6/r/Z0GmATNiavFKkJNldAXzf6yQcEyH38N
	P1jCnO2giwgo8xvVF8bo5XoFJ9NzGxazT9+cmeVRhZOBr7vAp5i33pCa9RvbhY8W39KoTI5ozgHE2
	dzsVrc+TK2fpA6X69gJR+/M2zuw88qXZDqURkwcdnCfi1LZVCyJNLjQz9YypjAMzv/SBEcvs+E+Qg
	kpaBgsC6hPH/cll4jluXfapdkqOAN8fT56M6EYYfInwDkHbnWKdfTIZLoAXdm8zx/39HCwE1q7cOE
	7PGjOtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnhO-0000000GktA-0CjG;
	Thu, 08 Jan 2026 10:57:02 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngz-0000000GkLc-07fH;
	Thu, 08 Jan 2026 10:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869797; x=1799405797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z4cy+2HbiLCLWtcSsLcUwBV59DreBfM5HrektthG6GQ=;
  b=TLc9HJLdpjFv4O7VXIPJkUeOdekHQVVOSPOCXVnHhh7Iu0rzMxdtaZeq
   KcCXrWst3A+2yokPt+rKjoF42JBpmymHLJH6rnDnn9Pt/WkBZgtlROyL4
   Yw3qyYUGPs/yraybx8AcQgyA26bUbkLS4SFVhBDBGeJ3JHIB/Gj+8aF6f
   MHzenFB8Ysb0OlLe+sdapUcjyTREbbXj47A9Zeq1xmik+FSOGUr4QucdM
   ig0mLw3vaX0dBnhjSgqK2fRPjLQaOUgLkJ//K/91RyIMx7G33qEW1EYPg
   VvY4icsaW8DvrH1iBbiGYC9iiPJPDhBAXEGUqnGPkbKtiHgHLNcjW2e0b
   g==;
X-CSE-ConnectionGUID: 1HcfwhBTQJKCXCSc68hSQw==
X-CSE-MsgGUID: PfU0b9CiQLGocBJBpZwZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79886211"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79886211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:33 -0800
X-CSE-ConnectionGUID: 8fRwqfVTRe2a9DqevNcPnQ==
X-CSE-MsgGUID: eE/+G/dISeaAahWWkG5tmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203091231"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2026 02:56:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5E7A7A4; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
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
Subject: [PATCH v5 07/13] dmaengine: lgm: use sg_nents_for_dma() helper
Date: Thu,  8 Jan 2026 11:50:18 +0100
Message-ID: <20260108105619.3513561-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025637_121345_82FE5DA3 
X-CRM114-Status: UNSURE (   9.24  )
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
 drivers/dma/lgm/lgm-dma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/lgm/lgm-dma.c b/drivers/dma/lgm/lgm-dma.c
index 8173c3f1075a..a7b9cf30f6ad 100644
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
+	num = sg_nents_for_dma(sgl, sglen, DMA_MAX_SIZE);
 	ds = dma_alloc_desc_resource(num, c);
 	if (!ds)
 		return NULL;
-- 
2.50.1


