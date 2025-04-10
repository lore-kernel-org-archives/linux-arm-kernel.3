Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49220C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hfVBN0wzaSeUQg5uDnoDTlQwoorDCBq715xUx2HVbo=; b=LyzpqvZe1pYcLZSuydKmJKn3Jq
	NlMRhCTpXob16M/Zlxe8qqoB/4TMBU6OZEGMJxBVdHyaneO57aeE9b/FEzh/BT1zKZx7kxt2TP/wX
	pFzKep8mYaYljakwxDn5FQQrnqt+wRUfZjjLtpR8HZU0nASU70DLiQyGW5aEcW/m8fPcz5Y8vgaHC
	5aZMDW0s7kyepHElGJf7Kh0a8u1D8xJlwLJmbJTMdzewhgEbbfyF4iJXioVdXmvURX9clLY3FZeT3
	CJk2m+9mwSv9uFrm5f2n89/OY2yuo2zFy+3YIPV+fpN1gcDURTrqZYbhnYPfTiNJZWzIxW/FyD4KI
	ridOF1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ub3-0000000B9R6-1BLL;
	Thu, 10 Apr 2025 16:17:45 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tk2-0000000AzqA-2Zv8;
	Thu, 10 Apr 2025 15:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298578; x=1775834578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2nEmXOWj61EFby8lltYJVgmKKKLIgiCDNpDNWcMK21o=;
  b=QCTUip+4XHMHqyTOLfYZWewRao0QsrGzciVsiDkIsK5d15YBgN4xF1Wp
   oJ3rulOuthz3Olk0HMkKOXvIxlvyECBRfxwLSgkWf4oiCSva9UwpCWJW5
   tx6UZBnZFjhgAQHNXF/IeWEUaeLYTP8VuzIQVh+5ONQvI+GplY9D+Q0/R
   N2/ibxBI8ULnxjMgwfePW79WdYex4IPkX/NMMeY6UFK9l+BzkLDL9MZ9h
   yAIcCTP1Brn+wZLrhme1vVBUjCc1zXy2BmeiHmUo5fBjapoJHZuDJcZc6
   oEbHF5KULdGGSFvfSWA4lNuIdaGcpT8sO/wv88IzDhHj9n4nozBtta/Fd
   w==;
X-CSE-ConnectionGUID: rFn+g8GCT4yyjQBW87zGvQ==
X-CSE-MsgGUID: ZQ7DQ3TxSCi21ViyIblMtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716286"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:56 -0700
X-CSE-ConnectionGUID: xwrGhn4bQV2XQcBYOS31NQ==
X-CSE-MsgGUID: 7SLwaDhESOSRn2bA8q196Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108201"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E27B411FA2F;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HObz-2s;
	Thu, 10 Apr 2025 18:22:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 1/3] hwrng: atmel - Add struct device pointer to device context struct
Date: Thu, 10 Apr 2025 18:22:37 +0300
Message-Id: <20250410152239.4146166-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
References: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082258_667533_430F4DCF 
X-CRM114-Status: GOOD (  13.12  )
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

Add a struct device pointer field to the device's context struct. This
makes using the unsigned long priv pointer in struct hwrng unnecessary, so
remove that one as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/char/hw_random/atmel-rng.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 143406bc6939..d2b00458761e 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -37,6 +37,7 @@ struct atmel_trng {
 	struct clk *clk;
 	void __iomem *base;
 	struct hwrng rng;
+	struct device *dev;
 	bool has_half_rate;
 };
 
@@ -59,9 +60,9 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 	u32 *data = buf;
 	int ret;
 
-	ret = pm_runtime_get_sync((struct device *)trng->rng.priv);
+	ret = pm_runtime_get_sync(trng->dev);
 	if (ret < 0) {
-		pm_runtime_put_sync((struct device *)trng->rng.priv);
+		pm_runtime_put_sync(trng->dev);
 		return ret;
 	}
 
@@ -79,8 +80,8 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 	ret = 4;
 
 out:
-	pm_runtime_mark_last_busy((struct device *)trng->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)trng->rng.priv);
+	pm_runtime_mark_last_busy(trng->dev);
+	pm_runtime_put_sync_autosuspend(trng->dev);
 	return ret;
 }
 
@@ -134,9 +135,9 @@ static int atmel_trng_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	trng->has_half_rate = data->has_half_rate;
+	trng->dev = &pdev->dev;
 	trng->rng.name = pdev->name;
 	trng->rng.read = atmel_trng_read;
-	trng->rng.priv = (unsigned long)&pdev->dev;
 	platform_set_drvdata(pdev, trng);
 
 #ifndef CONFIG_PM
-- 
2.39.5


