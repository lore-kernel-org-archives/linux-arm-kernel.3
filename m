Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A10CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANKj4jp6I7cTqtYGjCbyOmjH5fDakme+oSUms68uteg=; b=VmMgcUiwA+tJvR4X6znPxFqDZV
	c27B1eFl12Vh/ANQt6jDUSrHK+JQExIvYcHRY3UfgdXwKD4R+3sYt1uaC3j8HjUnQiz61RAMXBaA9
	LIqwj81Eb1UxhdepcnaHecDQr1SnfJyrXQI3Dldp8uP1AyRCkulw5Vl2kp40oibOPd4B+IIWkyKjt
	jIJFMRoNtZz+g9FSanNRSmdyqnsoE4G8ZhOxdS+RFoneMXWDARzjJgl2sCcmj8IpSB9d7QHiaOpBc
	Kg74sqziH8EovwpjnM4h4uNwcfaT2fk9NnFuW634r09viSG0+yb8OhHSCCrKftLRQR+R9Ia7g22Od
	oOt2av9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQm-0000000BccQ-40BJ;
	Mon, 24 Nov 2025 12:12:32 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQV-0000000BcRO-3KEG;
	Mon, 24 Nov 2025 12:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986335; x=1795522335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yN+ecYcYKcZKT4gWNmRCDsdhTOBiye6jHzywdjrd5sk=;
  b=W05PbiSXQsav2rqzXVMEYHa/0kRmi45IgHfmEg8sGaCIrSgvBHB6EF/e
   QesCKnLUqMNnPUGVj82OzUudBiczPgI7SHUyRpNoyB+wxuJXIkuGAo2rQ
   +uy+4GKplLV/ENddEPRhj0kr0gbh1tHrUAx0l+IDW3oIjHROVGjjGou/6
   jhYpjpS9yXMV6DXH9Qc+jHA5JYgEiy+yv9TfFrrezzt30t0+BSB2xsgRz
   mD8M7KyyZyEZuQvXte5hH3FySF1bm+4G7OSYDWmtQGmAxec2xPklvFtkb
   EJl5IsJkYUz8SYNUjkD/TTxrdwrLS0sRsldhfucxoFAar+ZFos3s+8+BU
   Q==;
X-CSE-ConnectionGUID: xdR6/NyXRBi5rlUmYAl22Q==
X-CSE-MsgGUID: Fim7RX2CTFy84dIxTKNBYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91467958"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="91467958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:15 -0800
X-CSE-ConnectionGUID: J8Apy+NdRdG8m6rJd8K6Ig==
X-CSE-MsgGUID: jcpL5DqWTwKaU8kaKNBkiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192559570"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 04:12:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6077AA6; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 06/13] dmaengine: k3dma: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:24 +0100
Message-ID: <20251124121202.424072-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041215_868286_3083494B 
X-CRM114-Status: GOOD (  10.46  )
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
 drivers/dma/k3dma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index acc2983e28e0..88f9a2952edc 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -536,19 +536,14 @@ static struct dma_async_tx_descriptor *k3_dma_prep_slave_sg(
 	size_t len, avail, total = 0;
 	struct scatterlist *sg;
 	dma_addr_t addr, src = 0, dst = 0;
-	int num = sglen, i;
+	int num, i;
 
 	if (sgl == NULL)
 		return NULL;
 
 	c->cyclic = 0;
 
-	for_each_sg(sgl, sg, sglen, i) {
-		avail = sg_dma_len(sg);
-		if (avail > DMA_MAX_SIZE)
-			num += DIV_ROUND_UP(avail, DMA_MAX_SIZE) - 1;
-	}
-
+	num = sg_nents_for_dma(sgl, sglen, DMA_MAX_SIZE);
 	ds = k3_dma_alloc_desc_resource(num, chan);
 	if (!ds)
 		return NULL;
-- 
2.50.1


