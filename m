Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13B0D185D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dutg+xR65A8+J7zNehygnmeyh8Gbf6HX8aeVw7VcDE=; b=i3U9IrDGCfOOwFtrj62Eu3g9Yq
	ZUANJyiNA8k3b4CAhtznfao6S0jZQauCIcPi1IjHGfUNBeBwg7qmxT6stH3iJRiCPWQx9EG4wAc3O
	KeieYwMDGd0ADcvTwrLL0g8WSra14hoM8vFHNeqat0y0/Panmd8TZsIByFe3SKOHaKUZB5cr5fSkg
	0VKuRM8Q7ZKC6MxNS9hSjALP5WRfDS1+HS8b9stFsBtJYRDnh0YRZRxTwfAw/1Wp03t3eVO5SWJ9h
	xDn9qNdoMv8y2bxTsgtfH3jkV7I+LBKpcjd7X52AE9s9d6csHwTXsUPljrf/kqx6sBkcVa1yxISmP
	+oK9QRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnhF-0000000Gkhx-3PJb;
	Thu, 08 Jan 2026 10:56:53 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdngw-0000000GkLc-2Ue8;
	Thu, 08 Jan 2026 10:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767869794; x=1799405794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iHVq+79pb8Yq4SdLxvoeSS6py1B5FyegYsoIgEHQMaA=;
  b=Z8aU9cBMPZf4Jem91my7c+vD1I5Xno4Uk4jHzxKxkZTCrsQ2iKIIzKuZ
   fP4WT+gyAlcGRVii8UBFgM/aHimrbqVgV4/4si0/ZlYquOXUzIuYnahto
   YHFlGm8ezor0hIDp4GkJfWy4wQszA9m8+40fEeWdi8XOnjDtpLCnAmKhf
   otThXCqMbaJu+QuDrIU9Xqkr2WCdMbU3hNVLDq/9vz/Mw7CLC34Hh3cC3
   s/8Gpg/06XUUwSG1ehfMbmWshHvCLH44Z+U2fl9fDjpKpL7yMNJFZhX0b
   sONs93PXaklEq2sk96ZO44OMF1bkU93I4p80tQ5qtzzMGewPN3S6bhy2Z
   A==;
X-CSE-ConnectionGUID: GKX2XmJSSoWXuA9HwFdYhw==
X-CSE-MsgGUID: Lix3Ia9yQWmRDlacq3JCPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79886166"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79886166"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:56:33 -0800
X-CSE-ConnectionGUID: qwS2kr8bSuOOdOFkEdNwNg==
X-CSE-MsgGUID: hHkm5BXrQlOpnfQ0U7iDZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="203091232"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2026 02:56:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5977FA2; Thu, 08 Jan 2026 11:56:20 +0100 (CET)
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
Subject: [PATCH v5 06/13] dmaengine: k3dma: use sg_nents_for_dma() helper
Date: Thu,  8 Jan 2026 11:50:17 +0100
Message-ID: <20260108105619.3513561-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
References: <20260108105619.3513561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_025634_688326_811860FE 
X-CRM114-Status: UNSURE (   9.92  )
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
 drivers/dma/k3dma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index 0f9cd7815f88..63677c0b6f18 100644
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


