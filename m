Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7828DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfUlxwjGKe77HUkBbiN8Rkt83wqiY42TkZNrzsfTj9s=; b=P1vZpiSZT5igygs9q8LUPQgTEY
	m4M6s+8zyxT91BEZKygEw06IbY1dcqr7FqS9ZpMUgAVUsencek517Aqi/wRiHxrijdpnpzqCa0TKM
	yBb8B9Z2c+LIuCcirPnW9HBKBt/SAm0GarNYru+KQpRgWo/1ZcmmazuVf9w2uXjUXgmdRA0rCcnJM
	5dQbT/QP60XQTR9yOwSKXD02A9EF9+g8+xECVn6vCUuHOedmtqoiWpeVkEb/8SLi9MO2uNjWqCiIv
	+oPOcVgDLOb4cZ52V6tSDo7BAts4AQMD2NqII8x9oOCprnsw9T4WOUItDxkxhySJSPBfrYx7FLzoh
	IIJiiRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mZl-00000009bwo-3uO4;
	Thu, 10 Apr 2025 07:43:53 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lzl-00000009TPp-2pLn;
	Thu, 10 Apr 2025 07:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268802; x=1775804802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TE7iAMTJLA59sZpWYVqvYbWng+qFOuV9FpYpZVf3SEg=;
  b=n0I/C6tgLWS7kpL9mYduKa7xm7k4/uYtzXjMvIa9hu+kM0fA5mYSatg8
   hU76vhlJGvjaJUNwm6hTAXE/NSaM4l3M2y32OZKsc2f1CDVGeVOIan+ff
   7QAjZQSpO1OYtCgI4bwFojJ3umdiJVr+zrsdvWujBi7bgazB+kVl8umrb
   K23UaTcvjwPsIaivFwd4fPOsL1k0rSfFZHXV08+M7m2jhPAPGJ4W3rzPf
   uMwc06/OX1M7+C88I+5waESEZhi2Abq1CwDHfd8QZb4vO1qNat9pb4tpm
   AdZNnp0EFT/OxnVvbc4E+zQOpy1zrIodt8NcP/ScZLHo9zbF5Kjdasvw7
   g==;
X-CSE-ConnectionGUID: +PUuubYuS/KaQlQ8moEsMg==
X-CSE-MsgGUID: PYJWTwlhTUa36ThyW8x9Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45484797"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45484797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:39 -0700
X-CSE-ConnectionGUID: jcRV1cD5T0GwUaoEVA8YeA==
X-CSE-MsgGUID: RLnB8c7VT5SfdPnsXZyizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128791502"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ACEFF11FB1F;
	Thu, 10 Apr 2025 10:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lzd-00FQTB-2E;
	Thu, 10 Apr 2025 10:06:33 +0300
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
Subject: [PATCH 2/3] hwrng: mtk - Add a local variable for struct device pointer
Date: Thu, 10 Apr 2025 10:06:22 +0300
Message-Id: <20250410070623.3676647-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
References: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000642_099709_8FA38170 
X-CRM114-Status: GOOD (  11.22  )
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

Add a local variable for a struct device pointer instead of obtaining the
hwrng priv field and casting it as a struct device pointer whenever it's
needed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/char/hw_random/mtk-rng.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 1e3048f2bb38..38e57900080a 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -83,9 +83,10 @@ static bool mtk_rng_wait_ready(struct hwrng *rng, bool wait)
 static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 {
 	struct mtk_rng *priv = to_mtk_rng(rng);
+	struct device *dev = (struct device *)priv->rng.priv;
 	int retval = 0;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(dev);
 
 	while (max >= sizeof(u32)) {
 		if (!mtk_rng_wait_ready(rng, wait))
@@ -97,8 +98,8 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max -= sizeof(u32);
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 
 	return retval || !wait ? retval : -EIO;
 }
-- 
2.39.5


