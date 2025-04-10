Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8441EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7hmDPcJtVnNvWJU40XvuloBaC9FfHDf4pXbcMxM9Jo=; b=CSvdXbcG22YmvQvQAc6lMXspQa
	B9LquXkaDOI0SoUCrKaL9K8UzWKWjB1tx8KBUMK4vCBY6eMjxKeUQQfTmAbudvGx8OgnyKLvi+Sp9
	LGJ1WoPYXsZENMXGK/VCrbWZ6X4ou8WwDxjO2Z9MeKMLSAOb407ku4DLbX4fffJWHkkZIGDDzQcYG
	WipJkibVO17dulwloARICl9cfB19lJnp2v3jvFsP4XvNpLPm2b/bB8GBEmv3XGGRoCU+/Yyj9yXN/
	8dOfEaNiRZpTG5BGQPaM8tY5skAlu/yGILbFOYS9aRnXauGdRjcg1U37tQJtJ3AFG8jvcW/6cJ/5I
	dlfO8k7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uZB-0000000B9AS-0uNu;
	Thu, 10 Apr 2025 16:15:49 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tk2-0000000AzqS-0ZFV;
	Thu, 10 Apr 2025 15:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298578; x=1775834578;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Y6uk1OKDMurXHr6lYHInLtlxGOoJuYbcOgABgCGhk4=;
  b=KpVFjx9ANyh/czonxRULI8IQYE386GcEVkTQJ1Kq6gIZZ3HXX/dgayxl
   I1z64GsBzwiozfDRJfoHUt/FCaujKklvEdZxyd3j8+15BEUEy+MczO2K3
   sBC3MPe5DZt3pmukdRiwXQGxO2eobayLVsePGtMOvOrZWALLzkLcrhSQh
   C3x2vpizIRSirvFYRRmYRj0neWXamcrmtftg2ndNfF0Ewclup1jOY5MP0
   kq3GAmM5lpULBuZyE63HJaegbh9Pkfr7LuzHVopuv3yP6GDYWraptzbQI
   RYwO2JC4Zk0xjDloCUCJ9z9eRvuYC4zcW1AQejxjyrmlFZi38CeYs+24d
   A==;
X-CSE-ConnectionGUID: d8mGH3UxRQqjfL6+dBdGrA==
X-CSE-MsgGUID: EwO+QhP5RQqckbreAbP3aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716275"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:56 -0700
X-CSE-ConnectionGUID: lXZBb65zRtqhhZOoXu2Bbg==
X-CSE-MsgGUID: EKcd0ndITDqagjO31fW8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108197"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EC2AF1203B9;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HOc9-35;
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
Subject: [PATCH v2 3/3] hwrng: npcm - Add struct device pointer to device context struct
Date: Thu, 10 Apr 2025 18:22:39 +0300
Message-Id: <20250410152239.4146166-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
References: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082258_187216_F49A6307 
X-CRM114-Status: GOOD (  12.61  )
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
 drivers/char/hw_random/npcm-rng.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 9ff00f096f38..3e308c890bd2 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -32,6 +32,7 @@
 struct npcm_rng {
 	void __iomem *base;
 	struct hwrng rng;
+	struct device *dev;
 	u32 clkp;
 };
 
@@ -57,7 +58,7 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	int retval = 0;
 	int ready;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(priv->dev);
 
 	while (max) {
 		if (wait) {
@@ -79,8 +80,8 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max--;
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(priv->dev);
+	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
 }
@@ -109,7 +110,7 @@ static int npcm_rng_probe(struct platform_device *pdev)
 #endif
 	priv->rng.name = pdev->name;
 	priv->rng.read = npcm_rng_read;
-	priv->rng.priv = (unsigned long)&pdev->dev;
+	priv->dev = &pdev->dev;
 	priv->clkp = (u32)(uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
-- 
2.39.5


