Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFD3D185D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/XJlvL/4oEQLDSrb+Y41/GOKukWl6G0DTOUVgov9KY=; b=kmZhsFrvuH4X0guuKdDulaJu/8
	mwvxWVg9sbdN6iRRCbzH+clZTmPOI3feTdO3ln697fYBfdraymPGvYm9PONF9Jki2zg9uIENTkklS
	riNN46M6A483v+pDZ00qsoa91le2AwkKCh3HhWWU37gj8xfnRJ64n923hLVTbfFzG4rxuCDXrNaD2
	qOpzbgJ97F+YZjZJSJXR8Wewx8OVxObXvk9zoEzU809+6b6YXpjAbnHhQjF5ZARIAek2ekNGrv3Ej
	/rfPYgOm04jZ6z/NqpEFmNTs+9ky40aWe3cXqu/HMU1c47PjlwYvApu+GAlM631zjCXqCK1Uws2xR
	1T9AoSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnhD-0000000GkeT-1Xmw;
	Thu, 08 Jan 2026 10:56:51 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngx-0000000GkJh-0uXH;
	Thu, 08 Jan 2026 10:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869796; x=1799405796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=in8YVWOx7X3+N9u8C3YWLE2bz3o7s3AEf77KzqE5x8M=;
  b=PJZetI1z+ksQGtPlX1PtzGZ5R2K31GjDm7H1On20edlkqXW1CJxjIQkD
   yZxUOKudstaOC+UBqFlMwJXPvySMFSgpFh6iGa3aXbaiosJCh6mVCpxbK
   8BUKVQirTfuBDSQUFC3n38KDMn2MhsrAnSQ59YMoGeLQlzFPZ2baR6/sd
   wS5zlYOve4D8P1xok+zuJ6Z4yffr6iYHAAmhgepkwPCP84Aw9zb53f0UZ
   4qWMSURmrVu6RIJ+0pME7pdqKCHaq9JQrHlg6GrY6SD6u0OslrfsacruT
   DnyI4rBzifQjEiz0COJev3Sdjgj0UhOT1sEXjsukRv0spDvUKdfR/HcX9
   w==;
X-CSE-ConnectionGUID: nGWJg16/R4mHODeVAP/sTg==
X-CSE-MsgGUID: ALoQPTwMSTm0mzxZr4Jx8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80354648"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="80354648"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:34 -0800
X-CSE-ConnectionGUID: fAZd+NvLR9yHxXM1xEdoug==
X-CSE-MsgGUID: KPnd7k64TXKfbXL285H4kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203615548"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 02:56:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7632BA9; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
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
Subject: [PATCH v5 12/13] dmaengine: sh: use sg_nents_for_dma() helper
Date: Thu,  8 Jan 2026 11:50:23 +0100
Message-ID: <20260108105619.3513561-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025635_310649_549F8AE0 
X-CRM114-Status: GOOD (  10.34  )
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
 drivers/dma/sh/shdma-base.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
index 1e4b4d6069c0..3ff2a8be8faa 100644
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


