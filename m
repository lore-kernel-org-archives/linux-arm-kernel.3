Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36769CD8C87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0klxwcKWUYHSA4kxl13krbz0QWO2FaVr0hd82C2DJkc=; b=YF9iBF9vsxsr4hNqlSXL0/V6pA
	SFYOm1v8Ct8an6SICim0tjrR1W8LY2+UXHt4q795rv8qYsYRh84gZoBTKM7k1IKYKbd1mToZCdkWf
	Cj/8lla739xnj8isHGg0SsyQ2I51bOIO9gwQSW3DcOLrm7rsVqqW50+mnI5nQwh/KCanJf74avXxe
	dmDeg2uh2PbpTuv//b3knswH/Xfp91yruzQM02Ofb6x+xF7AnvWT8EjHboEgQdg9nYbW97uQX9Woo
	t/sCfoXmmwZrPV504/PYjkc2pkV7DT8//kW86bHS8lf0qXKejQjlrfjk5Qj41ixMBRlR1U+XutQ2n
	uQDkehNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ4C-0000000AhO6-0JDj;
	Thu, 13 Nov 2025 15:16:56 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3e-0000000AgpU-3fVm;
	Thu, 13 Nov 2025 15:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046983; x=1794582983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WtcwbhDFfrQdZOzgChF1SRUOy+m0/hJ81tJ/Ve8zpzc=;
  b=b0CJ2EwjEbHRofUW17Vs7eMgKKvLeHSBYEh+5E0E8wNmacAezHnPlhSD
   HWvlsG7NsB6vmrTcWQfDDrD79kMr56SDo8bUqqzeEamPFCEP/YdLLksGx
   HL5zboBqOVR41vNCj1ClnPOAWnsvQLvDQZMEAfV5j/PrmtSelb4J7KwHx
   fcpASQgKgBN97jlXhDYl6Zw6dlNYBKzYvW/cgQ8M2LSvYF6/+VEHnjVlz
   ogzJxGtrF9C6YHJzjewGQnTe4DcPpfRt8UA3EoKpWZRID12P8Zz//OuWI
   7l1XHHE5qem6NfqsxmzasLwv5zXj+GqvYM/voPlhKfQM4VbLQT1UI6J39
   w==;
X-CSE-ConnectionGUID: gq2k344QRPat0laFqNoU2A==
X-CSE-MsgGUID: cSniuppqTDKxEBzRMtEKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75809727"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75809727"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:16:18 -0800
X-CSE-ConnectionGUID: HLpBtDzUSvGWaDkTYlJYkw==
X-CSE-MsgGUID: 13s146MAS46konZFIvPn3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194684673"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 07:16:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E2822A1; Thu, 13 Nov 2025 16:16:04 +0100 (CET)
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
Subject: [PATCH v3 11/13] dmaengine: sa11x0: use sg_nents_for_dma() helper
Date: Thu, 13 Nov 2025 16:13:07 +0100
Message-ID: <20251113151603.3031717-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071622_935289_17AE6850 
X-CRM114-Status: GOOD (  10.76  )
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
 drivers/dma/sa11x0-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index dc1a9a05252e..3dd33d3f7987 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -526,7 +526,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 	struct sa11x0_dma_chan *c = to_sa11x0_dma_chan(chan);
 	struct sa11x0_dma_desc *txd;
 	struct scatterlist *sgent;
-	unsigned i, j = sglen;
+	unsigned int i, j;
 	size_t size = 0;
 
 	/* SA11x0 channels can only operate in their native direction */
@@ -542,10 +542,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 
 	for_each_sg(sg, sgent, sglen, i) {
 		dma_addr_t addr = sg_dma_address(sgent);
-		unsigned int len = sg_dma_len(sgent);
 
-		if (len > DMA_MAX_SIZE)
-			j += DIV_ROUND_UP(len, DMA_MAX_SIZE & ~DMA_ALIGN) - 1;
 		if (addr & DMA_ALIGN) {
 			dev_dbg(chan->device->dev, "vchan %p: bad buffer alignment: %pad\n",
 				&c->vc, &addr);
@@ -553,6 +550,7 @@ static struct dma_async_tx_descriptor *sa11x0_dma_prep_slave_sg(
 		}
 	}
 
+	j = sg_nents_for_dma(sgl, sg_len, DMA_MAX_SIZE & ~DMA_ALIGN);
 	txd = kzalloc(struct_size(txd, sg, j), GFP_ATOMIC);
 	if (!txd) {
 		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
-- 
2.50.1


