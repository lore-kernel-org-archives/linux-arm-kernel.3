Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB1C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RxSL7sO0mSmrsVKQtf57zdwtPlrFPOSYVggMm2nO2A4=; b=IJKSu5W1d7i6q+dMocZneDpWXB
	Yx9YCEot7b2afeHt6gGG1YzceqCugjYuEF+kKY6+Q4UkqN4jnJEWmL6WDZHEAyj6TS4iH2bXlqFYM
	gV7rMWqTgtgxDwlMcTTMkxDGYuMolJ8Ev+g/XZSeDKrxkmfAY8F6p32qBZRsuQuQKHNyrVJEK08ux
	7orL5/QBD3zj0+n+BhM9HfzUL/2dwDjcrMGbkJkDPlgqfwkmcnMRWtTXPNAEzF4o1wQBgnr9/vDT/
	audoekMs/kdSD1a1Cr5yRcqt3g8SXtwHwZIwo9g1Wdfh/XYmaCwsE8WDkM8G8EynSeSe8Gupr+cEe
	5/Rsid+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mSd-00000009aIR-2x6P;
	Thu, 10 Apr 2025 07:36:31 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lrg-00000009S04-3kiO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268300; x=1775804300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yRup8yibl6uLLdPCoiEJjhkU8noSkNl6uy6KgrPhJRk=;
  b=OBxJqzUhbNcfU5ZJY4oWuOu21oMkvKgeyLmkzRsMCV7vHHt+iUnK9ga8
   s2wjtv4LZgOxqL54jWO91x493ouYcQmdtkuuHGT7KkXxa5Eqc5I6qFLfL
   uDgenmYKcSgdsQHv21sxbCkxuWsraGSEszyVx3+hj+AVoHQq5GF4uhWEn
   PWkeZRh8uKpG96iyYFCGFwYBHdzLpxOR0B2AKg7x/PdT0KXDcO35tLsaQ
   VIy2wrue24oXX1LIabT+e/CBi5aFnqIQON3my1gUzqzVHSIKXPnPgZ1dx
   s0oKbWcdkto8Cq4RBeqzQa747MLePqwXpQBzzf4B2Wig7L8ZGqse3m3I0
   g==;
X-CSE-ConnectionGUID: QRvcWNrZSkymK9twj7GNfQ==
X-CSE-MsgGUID: 2XieTeLcQbGVgmwngEBRgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="63162731"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="63162731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 23:58:18 -0700
X-CSE-ConnectionGUID: JJFylNiyScO3cB55fAI/0w==
X-CSE-MsgGUID: GShB2DsDRPa5EBIKUCnejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133928762"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 23:58:17 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DBC9711FA2C;
	Thu, 10 Apr 2025 09:58:14 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lra-00FQRu-2k;
	Thu, 10 Apr 2025 09:58:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org
Subject: [PATCH 1/1] dmaengine: at_xdmac: Use pm_runtime_put_noidle() with many usage_counts
Date: Thu, 10 Apr 2025 09:58:04 +0300
Message-Id: <20250410065804.3676582-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_235820_970999_612511BB 
X-CRM114-Status: UNSURE (   9.96  )
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

We're holding more than one Runtime PM usage_counts in
at_xdmac_device_terminate_all(). This makes pm_runtime_mark_last_busy()
redundant and pm_runtime_put_autosuspend() misleading. Drop
pm_runtime_mark_last_busy() and use pm_runtime_put_noidle() to decrement
the usage_count, except in the case it may be the last.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/dma/at_xdmac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index ba25c23164e7..3fbc74710a13 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2033,10 +2033,8 @@ static int at_xdmac_device_terminate_all(struct dma_chan *chan)
 		 * at_xdmac_start_xfer() for this descriptor. Now it's time
 		 * to release it.
 		 */
-		if (desc->active_xfer) {
-			pm_runtime_put_autosuspend(atxdmac->dev);
-			pm_runtime_mark_last_busy(atxdmac->dev);
-		}
+		if (desc->active_xfer)
+			pm_runtime_put_noidle(atxdmac->dev);
 	}
 
 	clear_bit(AT_XDMAC_CHAN_IS_PAUSED, &atchan->status);
-- 
2.39.5


