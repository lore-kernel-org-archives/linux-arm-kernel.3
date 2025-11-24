Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEACCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7VLJ0qsYizCH4nUj5cUjJTNxSK7nDD/+BXYqhfrIWQ=; b=ixEgzZUo0HWi4s7/boNOZj2Zh5
	LFxcM/+wLtPYkJ1yKWRTpm8yVaMWG7MW9S4CyqAj7jLvQrECiNBZe9G/mI18vR2zxsPUv7br3LB76
	E9KCx5WIY4fk2KbA6uYzT/kIHY4UtBb794o8a17jo7Hocbl9qoYaNUQOJXKEBv840Kqg8L7imSk6W
	+8fiknCoavLTN8aYWvBKwfw2I5upLORbED6KV+TfWFucK0gNB6UMOT4ibFfEgruXO9kdrKPWRdjaT
	KzZThTE4eUeabi+EP8eAG7zcWmeu10W2F8CdMsxvl1g7ij041mb2+ZqhkYy/uRYOlGh8MT2eogIC1
	7muJlKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVRV-0000000BdEE-1piO;
	Mon, 24 Nov 2025 12:13:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQg-0000000BcXz-2yCG;
	Mon, 24 Nov 2025 12:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=g7VLJ0qsYizCH4nUj5cUjJTNxSK7nDD/+BXYqhfrIWQ=; b=M9i4YQmPNJ5XdSJw4SjWZeLwqB
	luTN0HIc/uHLJC0ulC/RVMRc4yHV6SLZs+Qwr236jHTpN5yypS+efvhytroDRdd0bKHPzLPYGAyj3
	I88wExM1+eLVs9dSD4C62OeAaTqgFzXzoqXZER2l7al8zyc69SPWNmezmjelGldZ035D0ib8Rrm9x
	f6ZeyzHHw+4iZywS4kCGB8YCgIRX3+ZWvfqOpvrTUGxr+vXNbRGmrJGhE7Fi1fIuwBHNRbrYMi+aQ
	OMzPkyW0sHQPtHf27QJCxUXayE/phLWIKQlduG0/J5cS75VyW7VPkfxgW+Po/VtvQGJ6kM+J5hEJ8
	zRLhKgvA==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUZ2-00000003cFT-0uHZ;
	Mon, 24 Nov 2025 11:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986343; x=1795522343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G7V9+SrifDGfqxju25Hp/oyxgo/fWf9zfXipYvZQzAU=;
  b=eBO5ns4WSzDJMm0GujgNzDkARwX7kpdP5sDHqpCLnj9gw46v1d8bGbGP
   Hg6D8E69nnSv3GetFPnXQHoZAAhGOAps7En8UD2EBlgxQM4vhxmowZ6GO
   bqaatm5D2dZtf7F/wkuGFquOSebzcuttutdQxboDf19zcoaP5qrTH7I4a
   8si7zFxcBuV99fxjWIKsgbPqUwa9Z5L5fEOxlN2bgNzkPj8OrvhnO5SpM
   WDaf3JoTSTld7qnWb9G4ocxUOtyv9TkV3n3qhDoSctdSiQJVtAEiciEiK
   BpLIfYs0e2VqdHHFNyyIaylF3yKsVyS/aY7BEexNMvbyPfcFW41B7YRdL
   g==;
X-CSE-ConnectionGUID: 25Dpdd4WSNmhl7UEDAeDog==
X-CSE-MsgGUID: iDuUw326QY6PqMZdZUy18w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91467988"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="91467988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:15 -0800
X-CSE-ConnectionGUID: lJ4Ysb5USrGqJ9huUsuiUg==
X-CSE-MsgGUID: 0wSONVK7THiwWxrHksVtVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192559575"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 04:12:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 78832AB; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 11/13] dmaengine: sa11x0: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:29 +0100
Message-ID: <20251124121202.424072-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_111700_651423_73608F53 
X-CRM114-Status: GOOD (  11.15  )
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
index dc1a9a05252e..86f1d7461f56 100644
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
 
+	j = sg_nents_for_dma(sg, sglen, DMA_MAX_SIZE & ~DMA_ALIGN);
 	txd = kzalloc(struct_size(txd, sg, j), GFP_ATOMIC);
 	if (!txd) {
 		dev_dbg(chan->device->dev, "vchan %p: kzalloc failed\n", &c->vc);
-- 
2.50.1


