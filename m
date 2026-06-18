Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D98ACD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sq4El98wnh8qrxhMmGg1ffHC+PqDPrmH7Id6X2+o93c=; b=UxH1xqFD2yFEXpmLLkOyD+n9N6
	Mzd3dXpkXWGJaan2kiZnCUdjzhgHyq0gzqWo0K777sbuPKb+3vQxbOxOTidyueSwyRaUDilrAFiDP
	O0k5cu9/UQS87Nqh/tPNL74UwjlDokYIQlJPRIcvabwG/f4JHdLR4X0IaYEyAiyLz8w3mO7O8cryT
	9qNaUVcrKzpDdd+Tm+RXMXtiV4Xt7W6BsiFon1ediz8Nvmkgd5fn0cUGJkE+2VpIhFl602Aosyzr8
	OyZmBveQxWM0uPebP/OnH4TCr0HLl35oatqGnDZxrMKzlIVxM5/44KPFJWdlXRs+uKVo+x6poUQms
	g91mlWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCtE-00000001MsA-1oJF;
	Thu, 18 Jun 2026 13:34:40 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCtB-00000001Mrp-3ovw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781789678; x=1813325678;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4zXhhm0BMBSqPgGZ9yuBsjcuWV090RtcZX76rGBraw4=;
  b=OZf5UhcAI91l32f3qzjUa90eUENpGhoCh1uQz8L97Rm3BvvP0laKeJSj
   fv/CApW2eGvV+HAYSYh8vLd9Q2rSkCKI/7gI5p8dVpdv1YcRzhcOW5IyP
   I81dErwNRCJpj6VpqzeYexEcwa16KjoMOfForNejCxaQ9oLeRnO/qf+nX
   o6e61PDHlH8hbzlZYdM4Oj4ilBvOgNam6ACzx5JSQDtZg0RPLEa18E32n
   qJPp7F33AiYew05cDD36RknEALX1S4wLu8aM1dNHn6Kr2C2r6abNoM17h
   hsLtsWeUFK62q3X3khoVOeV6rvqLxDa7hIhPhdAKbNjvrmKepDjNkE7Gf
   w==;
X-CSE-ConnectionGUID: YP3nnO1fTHGC+KDN6nVLaA==
X-CSE-MsgGUID: YvNiLug2Tr6o3aSXk6cV2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82716098"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82716098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:34:34 -0700
X-CSE-ConnectionGUID: pHU/5p0vRMKdambu0Cr6tw==
X-CSE-MsgGUID: Yqj+Sly2Q4ad5VFHaVCn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="244010617"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jun 2026 06:34:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9A12E98; Thu, 18 Jun 2026 15:34:31 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: davinci: Use generic definitions for bus frequencies
Date: Thu, 18 Jun 2026 15:34:29 +0200
Message-ID: <20260618133429.3214475-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_063438_039007_F89E0316 
X-CRM114-Status: GOOD (  11.34  )
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

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-davinci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 66c23535656b..67ce39cb000d 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -760,7 +758,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
 	dev->bus_freq = prop / 1000;
 
-- 
2.50.1


