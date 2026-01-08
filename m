Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACD5D185CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwi5dnF3dpek4jXJULnJfgIW6KK1KnHzUaqp6GzvFq4=; b=ng6G3If6rRyZMBXtr8zhw1NVVF
	aUOGZSIZLm0y+xPil8yeGIgOJXD/e4Un+5GRTxSJFk7y3tpWwR0fD1yoog2HSFCijV65wigLLfMe0
	mmiEsWRy0jG9CtYoTKrKf+itB+wCY55p7uJLmqjGZFHjAAPQKC8xH+726AjwVxvHwvT2DBzY1+Tp2
	CXcGoejv1+HMWlqVr2bVE2R49j3W4Jx+fDYkywy3KWDVns7xX7h6KcwKeX/IPOGa/rBmmQH8ii5BR
	UT0PDEnjXRsL4nQNhq0+D3Akv3CsWa3uLyCovUd2EbdxPMg8izG8ZhOOiDFiJxkhCsW2/CHXxtWBa
	wnvnIqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnhJ-0000000GkmH-0M2J;
	Thu, 08 Jan 2026 10:56:57 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngy-0000000GkHx-0Tlg;
	Thu, 08 Jan 2026 10:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869797; x=1799405797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rUyODX56g/0PVw4q9uoPm3QtJgx5W1kE7M9udwy7iHM=;
  b=CqrCaEkDdUlz+kbscR9X0fYZB24fs45WrTeh7uJuik4sZmnk6U2rHSOl
   L13crWpltV+YOgYj6MRapjTofddMI5wysOOlQ2vaHu0r5ZXJcFHa1W/gX
   46AXTThKEX56wQN+D1Z4xWC0iV6Xq/QLRRWPB7Px8VYkXWNiAprMZUx2K
   TgAC/sj9yCDquOLE5BYZa3hYUJceRYzX9HjMXVuJpPXGQXLBmGoe1ArU+
   UAhJxgOBX4s6KtcQVoXwumsdEUS+PQR10xFQasLzG6AkW44lwVkfHfgFZ
   O3asjAO6cvAKNI1tulXsDKvr7vjBjH+SGycp5k2HntT0nidiBWTsEOn6y
   g==;
X-CSE-ConnectionGUID: lSK44i9cQFandqK9FfB4Xg==
X-CSE-MsgGUID: K6amiiueSu+FaD7C0tOLDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80354659"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80354659"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:34 -0800
X-CSE-ConnectionGUID: DgHj2duHTWOGuskfnGCuGg==
X-CSE-MsgGUID: AmxWRW/wSYO52jnqsY6CWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203615550"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 02:56:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7AE09AA; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
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
Subject: [PATCH v5 13/13] dmaengine: xilinx: xdma: use sg_nents_for_dma() helper
Date: Thu,  8 Jan 2026 11:50:24 +0100
Message-ID: <20260108105619.3513561-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025636_223847_E08A68D1 
X-CRM114-Status: UNSURE (   9.02  )
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


