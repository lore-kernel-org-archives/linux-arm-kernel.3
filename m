Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50495C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 16:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciTMixDWtrmvfuyXx2qtE4AIaIJcXyTH+sbQarjhKAM=; b=n/UJh5glKGnLAkvjlau5sSVVIM
	CQAkdoGtvWBuWpw8AVEFHot+dytS44RhlVONO2T5aY7WG2+miywboq3OrC+AnaT8zP1GEcuGenJ0F
	zJ4awZmm1p0N6tfaexc8H8ZN+J/mRmaEMyxv5mWdnyOjQJl1lXYlDJ1+Enc0JlwO7E2hRAByVr9i8
	b3K6eTtDGyWyRigZDUI8ykJnqSJT+IGIv6tl+WmnoHmh9TpciGbTuTaMEtyFdjqm5X2ETtK4PIMi8
	x96eeHWwdfEj3K1YsrXJ1H62KTzq7rwDSg9xbQMsKWHYrDFcEUSqczU7N5+OtLUxWkBjDOrPUZIA/
	OFBZEY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ucw-0000000B9dj-2kqE;
	Thu, 10 Apr 2025 16:19:42 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tk3-0000000AzqS-1wde;
	Thu, 10 Apr 2025 15:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298579; x=1775834579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rmJxpqqkGXBWjcPvpAAKCZLWRdEQASHVQu+D1tpj9E=;
  b=kdBlDrvyZwO8F5UloXKzgDVyOHzcbGBxmP+Q6e0rCiTPWxe7T6dT9Cd1
   BT5KW/1OtJ81P7Xokby6Hf3pl9Aw7iorc6+jNK0h4KETp5M0hptI5a+q7
   j8+tru5pI0cDqMeteE2z1mtjELVbo5/oGDHjSPvUlv2G5ELa4AgHDIqhm
   GfJWuWwHAbTMlwG5jgG9/wH9tTrk83stwXGnbkiprCvUcjuiTLC69Jjnh
   Pk9ze628R6/4F2gYJmglQfPhRgrb9B0N8XOpFVrU15GW8joVxfxWDjvx/
   79HnJuWjgVJ5hy5ep+cwAS6AIWe/X0113k1VpISA6W3dCVcb5G0qs9zK0
   g==;
X-CSE-ConnectionGUID: j+F1L8vXQ56eAxxpq+8BkA==
X-CSE-MsgGUID: J/FkM/L/Tpak3tLNfnci+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716297"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716297"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:56 -0700
X-CSE-ConnectionGUID: bC5JV7arSSy41yOILBG4rA==
X-CSE-MsgGUID: VvkIrii3SNinWOPC6+RzqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108199"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E87D411FB1F;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HOc3-30;
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
Subject: [PATCH v2 2/3] hwrng: mtk - Add struct device pointer to device context struct
Date: Thu, 10 Apr 2025 18:22:38 +0300
Message-Id: <20250410152239.4146166-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
References: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082259_515373_CD65436B 
X-CRM114-Status: GOOD (  13.14  )
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
 drivers/char/hw_random/mtk-rng.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 1e3048f2bb38..b7fa1bc1122b 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -36,6 +36,7 @@ struct mtk_rng {
 	void __iomem *base;
 	struct clk *clk;
 	struct hwrng rng;
+	struct device *dev;
 };
 
 static int mtk_rng_init(struct hwrng *rng)
@@ -85,7 +86,7 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	struct mtk_rng *priv = to_mtk_rng(rng);
 	int retval = 0;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(priv->dev);
 
 	while (max >= sizeof(u32)) {
 		if (!mtk_rng_wait_ready(rng, wait))
@@ -97,8 +98,8 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max -= sizeof(u32);
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(priv->dev);
+	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
 }
@@ -112,13 +113,13 @@ static int mtk_rng_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = &pdev->dev;
 	priv->rng.name = pdev->name;
 #ifndef CONFIG_PM
 	priv->rng.init = mtk_rng_init;
 	priv->rng.cleanup = mtk_rng_cleanup;
 #endif
 	priv->rng.read = mtk_rng_read;
-	priv->rng.priv = (unsigned long)&pdev->dev;
 	priv->rng.quality = 900;
 
 	priv->clk = devm_clk_get(&pdev->dev, "rng");
-- 
2.39.5


