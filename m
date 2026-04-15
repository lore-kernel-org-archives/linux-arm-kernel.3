Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6503BF43841
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I5SYHccg3xEGfzR/KqSPOJF543/cK71eScdbAvMHgRU=; b=PSjN0o2iPPIBHxakjf9BYBHNSP
	5gwT2TGlOzZk6StumyrEEExJAm46nQdV8g9ykSdgMmIhYT77rd37zx8nlve70bpZhXhU/Dd0Ja6qj
	zC+vV033kGd45/jsxSInUQhOqIbG6YZ//sAYRW4rRJyRiHdesXKJNsrT6QHIb/CmIuNcrqfQBI6xt
	2qsJPdHdHvoPh2S/On+XJDroZEJftiBv0hNLuLzQEJn6gDS0xjdYbXKs48yaW5oeFpBmTakCjBdA/
	iUcusJf+0LIePGoYcYi5vIz7CF7wgABuvli1UDmwJD2muRuWqKffEhi+dH/thM2cAVvlytIHEqYzU
	YRbwX8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1mv-00000001HSq-3nBk;
	Wed, 15 Apr 2026 15:04:21 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1mt-00000001HRo-21FI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776265459; x=1807801459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BM8qgB6lWhS0NOLxgV5xCucJJwUqPX+tF4iKGroq+Fs=;
  b=YReDU6LrDsfnTUPOHiRLfxtLk7umFYP+9cO4r21mZt58XZnZV3QrP92u
   qFxRK1I3qRy9l2LIg2OtyWL0Jjhf3e8eclS46CTTpdtwp25jPXERKz02j
   YbCcLFymPYrtZpMedQmM+Rd8yU2nD8hoxIfYyypeFzZBlh39JoJMyNoHd
   LQO2gsYCAvgVIMUYLwii66TqRa9hqCgiAmHutvfv8YbKbxs9z/z8zHUuu
   ngWKMwvVqm70N/Pn4CY6XqBqC24Dvoxpcof9UVithDajWgmO69yXGxYmi
   EwOsP22toDDh+9rkFvC56M8aBatM4X8Vyfwrlvqu5S/JFg8uihc4SAB3Z
   Q==;
X-CSE-ConnectionGUID: GBDHRr2QTDOtou6wdJWCsw==
X-CSE-MsgGUID: w3lu3r8pS+qjwEgmZoC/Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94815857"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94815857"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 08:04:17 -0700
X-CSE-ConnectionGUID: 3hLKX1BQRKaEOGATyUnNEQ==
X-CSE-MsgGUID: ZANtQXLDSAu4vsXaECGXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253678781"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2026 08:04:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E1B7095; Wed, 15 Apr 2026 17:04:13 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Date: Wed, 15 Apr 2026 17:03:36 +0200
Message-ID: <20260415150412.365989-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_080419_532045_A1616F69 
X-CRM114-Status: GOOD (  12.62  )
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

No need to open code the devm_gpiod_get_optional() wrapper.
Instead of checking for a certain error code, check for NULL.
This improves readability of the code.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v3: rebased on top of the latest changes to the driver
v2: added tag (Peng), rebased on top of latest ASoC tree

 sound/arm/pxa2xx-ac97-lib.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 79eb557d4942..47889f6003c1 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -330,16 +330,12 @@ int pxa2xx_ac97_hw_probe(struct platform_device *dev)
 
 	if (dev->dev.of_node) {
 		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
-		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
-		if (IS_ERR(rst_gpio)) {
-			ret = PTR_ERR(rst_gpio);
-			if (ret == -ENOENT)
-				reset_gpio = -1;
-			else if (ret)
-				return ret;
-		} else {
-			reset_gpio = desc_to_gpio(rst_gpio);
-		}
+		rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset", GPIOD_OUT_HIGH);
+		ret = PTR_ERR(rst_gpio);
+		if (ret)
+			return ret;
+
+		reset_gpio = rst_gpio ? desc_to_gpio(rst_gpio) : -1;
 	} else {
 		if (cpu_is_pxa27x())
 			reset_gpio = 113;
-- 
2.50.1


