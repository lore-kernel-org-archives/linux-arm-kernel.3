Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDFECFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2hI/4dowBRGpaKHG6snEbJMYWAUf1IL+KFnXhHfRdE=; b=TuqeYwK/t1SquIqGabQugcAcMH
	FufU6n0eP5phaGUMmp8uPHiiElP3nyhljampAoYYISKbfEC/owmfVQ5MC7dyzCwCrEjG5FWjB+T13
	UoeZ03J1mJgV1d59Z60c8beWSb7BtIoOGVUwqO5A1k8LlMkptGGupKBbdCe1/mhk6MvSe9KTjni+W
	0I7t3k3CYvsV1xgiLEKM5RH1KB3IDwdXp7qpzwOQkIma8ouCWu2YSIZif8j6aKuy7MGMDZpTwlheN
	BmtkkBkZz3ig7GdyJYZ2GX3KZEd2H7hdeWYXY1Q8uo/rMI4Z1wrtmBsDO7KZmwbFgFqfeQ4rtZ4vm
	yjD22kVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQh-0000000BcYu-2KZy;
	Mon, 24 Nov 2025 12:12:27 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQR-0000000BcPY-2Iw5;
	Mon, 24 Nov 2025 12:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986331; x=1795522331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Su3S1OYlS3Av5yiXyt302P5FfhwZUhZFXIJtWLZ5yY=;
  b=TG0q9onF8QOF0g3vVjFNDxdFc+ATtaFSSTEIYO5UV75+05bpWK7S6E2l
   lKdVf0rsTEZnsqfmvU2BA0K550aIGRNVLZ6H0JmyylySgnmkcDqwdzPF2
   yfQPr4/ctsSVdIoAMJRjqbu+K/qkQDORJp1FOlXxiXGSSCQnBRd/JOpcK
   p73UNFXRo5mvTgsnF4esgp+pIhPB+wmPS3XvL6bGfQhuMawlF6+NVJ+hW
   /hU9ymck12WMQkwBP4ti4vDtvfjfgAimqbskfjIjFEfpG8Wgf2igZRKOk
   77PfF+nUbAKvHuiwDibQfmt7ZzQXlfvrDAIZ99j3oPsMVuLuUMwmiy4Oe
   g==;
X-CSE-ConnectionGUID: 8sZXpxYLTjaewYtWyJUjnQ==
X-CSE-MsgGUID: IrIdVBcdTTOeLT7VgAValQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91467937"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="91467937"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:09 -0800
X-CSE-ConnectionGUID: nCKfT6NBTvG88CwjFB0MBg==
X-CSE-MsgGUID: 6Dk4WXZfS/+KdrHlY06iSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192559538"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 04:12:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 56D2CA4; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 04/13] dmaengine: bcm2835-dma: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:22 +0100
Message-ID: <20251124121202.424072-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041211_615682_290C9538 
X-CRM114-Status: GOOD (  10.78  )
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
 drivers/dma/bcm2835-dma.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 0117bb2e8591..802b23be2fd8 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -260,23 +260,6 @@ static void bcm2835_dma_create_cb_set_length(
 	control_block->info |= finalextrainfo;
 }
 
-static inline size_t bcm2835_dma_count_frames_for_sg(
-	struct bcm2835_chan *c,
-	struct scatterlist *sgl,
-	unsigned int sg_len)
-{
-	size_t frames = 0;
-	struct scatterlist *sgent;
-	unsigned int i;
-	size_t plength = bcm2835_dma_max_frame_length(c);
-
-	for_each_sg(sgl, sgent, sg_len, i)
-		frames += bcm2835_dma_frames_for_length(
-			sg_dma_len(sgent), plength);
-
-	return frames;
-}
-
 /**
  * bcm2835_dma_create_cb_chain - create a control block and fills data in
  *
@@ -672,7 +655,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	}
 
 	/* count frames in sg list */
-	frames = bcm2835_dma_count_frames_for_sg(c, sgl, sg_len);
+	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
 	d = bcm2835_dma_create_cb_chain(chan, direction, false,
-- 
2.50.1


