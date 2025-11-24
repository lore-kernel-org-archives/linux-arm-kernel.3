Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A29CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9R2jXj49146KC+5vfWPPVVZwl1JmffLlWfBTYD6OiU=; b=Y2r9FjYUndufpXYaYNYJIg+mBZ
	M4GHIAot2Gz4WthVgS3x1/S5zl5l3llLzIxqTgfHHVKP9VB2vKzwWETDw7N1GLb8bQ+rW6KRBmIIj
	IipHQqgm4wtaSF+8JGA6iZSmahCTSaVJzi8ktBzHn1WUbp+QyOkERUrXuTdm9erYTal0ppoYwKt78
	ONuOCMkl7ODsJqTqKfhetydmeTRlSl87runW9RBnReTaUQrlUMDAJ31S5R3QVbKEtLRUKVJcqo6kp
	WhqfCHgCFrvZcCBgWjo7GfiVTauQw/5q5oUn2vgRojs+o2slyJmG1nZzvV+dcE7ivXoTVyP/bwnfM
	6nEN+s6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVR4-0000000BcqK-3PPd;
	Mon, 24 Nov 2025 12:12:50 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQX-0000000BcRO-0PAe;
	Mon, 24 Nov 2025 12:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986337; x=1795522337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aIZKpp2i1U4bYPp+lJpBExBX9TU2DJpWjDWAz41Iejk=;
  b=RNInwxbSKc2hh5R5seltMket0y7VvNtxNxB4aZtvARZmcuFiPNnvpFIi
   li04AN7lH4V7I9l7z496OR9Nwu9dapVs2cNLoX78ECNkE9RcM+QsBpGAZ
   2MIIDW6JRYj1My01pzkXHS6/CaTRRZ1nz21vkzMYGLdkTWEg1betXS/nT
   Q6O0FE3xfwwEvsJD/x0zX+WRsDmlrHRV+2JqCnCXQBQb7mLLkWVQQg5ET
   ab30dqOZRDA6Sr7ZryCI+BV32AT3FEWQujnvzIZYnLfUigQahNxDuVITd
   IBMR3woL2p8pMHeIMITFLF5BcvmKs8Ci0rxVOMzrGzyB4z/V+BXvnLOea
   Q==;
X-CSE-ConnectionGUID: DC8qUw2iSNeCcf2jjih9hQ==
X-CSE-MsgGUID: XTF0MNMFSzKJfOJCOd6H5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91467971"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="91467971"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:15 -0800
X-CSE-ConnectionGUID: TTvZDXbhSCi3GwHPuB08gg==
X-CSE-MsgGUID: IzSkpYm7TIGtqQIBH5iKGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192559571"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 04:12:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6A35BA8; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 08/13] dmaengine: pxa-dma: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:26 +0100
Message-ID: <20251124121202.424072-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041217_172714_B30ECC42 
X-CRM114-Status: GOOD (  10.54  )
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
 drivers/dma/pxa_dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index 249296389771..b639c8b51e87 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -970,7 +970,7 @@ pxad_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	struct scatterlist *sg;
 	dma_addr_t dma;
 	u32 dcmd, dsadr = 0, dtadr = 0;
-	unsigned int nb_desc = 0, i, j = 0;
+	unsigned int nb_desc, i, j = 0;
 
 	if ((sgl == NULL) || (sg_len == 0))
 		return NULL;
@@ -979,8 +979,7 @@ pxad_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 	dev_dbg(&chan->vc.chan.dev->device,
 		"%s(): dir=%d flags=%lx\n", __func__, dir, flags);
 
-	for_each_sg(sgl, sg, sg_len, i)
-		nb_desc += DIV_ROUND_UP(sg_dma_len(sg), PDMA_MAX_DESC_BYTES);
+	nb_desc = sg_nents_for_dma(sgl, sg_len, PDMA_MAX_DESC_BYTES);
 	sw_desc = pxad_alloc_desc(chan, nb_desc + 1);
 	if (!sw_desc)
 		return NULL;
-- 
2.50.1


