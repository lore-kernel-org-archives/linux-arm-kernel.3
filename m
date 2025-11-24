Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C169CCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRRHGwMsAmGqwakbXMot/0P5c2fU8IiHhxA7caxcJhA=; b=Mvp8gXTlUyUFAisg20Kk4MPHsh
	EkIowCr0CAv7PhfxX0zRP5d7jy4JVURrymPbmXJQZIa0c1BYFtR1Ir6owgG2aF8zu1gXduddgyCs+
	1/nvj1WRvNPfxmNRyvcD4vkbvuX7F9PhV+LrrmIb4Nm3BB48aOOJX8DWFzpKuOP7HvU9dEmxs3c7S
	48vNtwoqellK5N+6blZrro/Cb19x43wSG3rbk0JKSygDBbhalj8z/2n8fdOY/kLkuB/K6wPnFb+eA
	vlMMJQhD8leghA+tsxsopy0Zkhy2weyz6jv0qvJgX0zOF5ogW5SjtWd5/H1un4QMwceT8d2XmX1xL
	R+HShu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVRP-0000000Bd7E-1S8o;
	Mon, 24 Nov 2025 12:13:11 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQZ-0000000BcPH-0LXG;
	Mon, 24 Nov 2025 12:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986339; x=1795522339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3FTR/BGUP+Jif1zotbkvzWhNiBsBN/SOnlvS3OB5AC0=;
  b=iYZVPz3FPZtslGGojEe/C1iu4k76UYxbO5YbMi4VLVWtunwo6UBpsEcp
   K/hHx/Y/76Ehdn6MU2F9GhIqLJ+RRZwi5pZKn9/96vf/NKiUPzbiInot+
   DwBjIPY78EDpOHA9+Y0qQ0GaLDisSRg1FWQS/M+tuz0wnoOsTUSTaT27+
   pQ67ATBp6NPHp/3T0mWcDE0i59BmIgdevnW5tRrSod2GGUOv+5foxhZ28
   +hqeVv4ZQ/CfzPVOUebzgqFILggjGZaOwLRS8H/p6WDUxeLROWo22Q4v4
   uaSZf0LadfyP672WojJmJro4dSSiF41sGifYj5/xD32/g43pbKK0WR80A
   w==;
X-CSE-ConnectionGUID: w3ELabawRkKkU86Cc4Az9Q==
X-CSE-MsgGUID: Lvjz/kQhRH2Pic41T9XT8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69847627"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69847627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:17 -0800
X-CSE-ConnectionGUID: wKDEV3l3QqGEpZZVjkvI1A==
X-CSE-MsgGUID: 1/09amQaRCCXpqw5buivZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="222970347"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2025 04:12:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7D9A2AC; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
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
Subject: [PATCH v4 12/13] dmaengine: sh: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:30 +0100
Message-ID: <20251124121202.424072-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041219_152840_76E673E0 
X-CRM114-Status: GOOD (  10.67  )
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
index 834741adadaa..1e1b65e46668 100644
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


