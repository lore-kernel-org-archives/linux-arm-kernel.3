Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AC4C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 20:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xq89ZDZ3XSjLOgqzAruvm/e9be5zlQizsUsTM9YMFd4=; b=w7ThK1I6KATFSREEHUDiIO3Jwy
	CcRUWCkpq5x+mvRseOpmLXebyqEgt6mCEnIm8mHsSTW/xrWxmnH3HM9GsIB9cqjd4QAL3/CaHW3i8
	hManRb759MneJ+mlW1bS1dKutT0EHeS5CLNSJgo78InM8isA3Lwf2LdV0xNGpMMI9KvSTvmxcaog9
	wXWOsfMbZZ50QXi1eoWUTEdWw4zO6XNy2cl0eeQIn3XRn8q571C3r+aCavEAGIbwRj+w+O0Ec4pOu
	GCfXbIs6M6SDiZDOA9XTGiK/OnlYHdqs1mlT5MVknnOWE177n9cNN85yEU3YjUj2SS2KgEn6DG7fF
	PDzOLYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7Za-00000001jT7-0IHY;
	Thu, 08 May 2025 20:10:26 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7Xd-00000001jNV-06vV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 20:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746734905; x=1778270905;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ojYjwhOLOLZviFfBkcdSnQqT1nII+khrxJF96hfNsns=;
  b=RHSCD86UgrUIne+fo4lEBr3A4iuo9iAjZTUKEM4kB8p3MbOHZaBXFs+C
   lX2TccbXc/7Us2d/Utnz6igVVvzwgC5sylyRBF0UM+bwDxZnl3n+zIdtD
   /vV9jzJnTympLhjHuQi7CgcclZfMhtYd0IaSC1bCHAFRyvfusTxGVdPSb
   9137hUwQPBEIBDFKPh2xXU6QVpO7hWcSAXeA16w4BQk9Z4iTABQqON6uz
   7CbemNWeFy+6WKKDKloTko9eNA0WEY/2xEoO7d+/Towx9VXAbs9kW/vOx
   XFZMM3vnwMxjaUO4LgVlRu+wPPVs8dDNoWyLOlLdk1clpd99EZ0KQDCNW
   A==;
X-CSE-ConnectionGUID: SPctObrjTvC7WSD6wQvFbQ==
X-CSE-MsgGUID: b1LE5aLWQQScgIHhLzCrXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59885496"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59885496"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 13:08:20 -0700
X-CSE-ConnectionGUID: rb6gG6rWSKuJIC2WZRv6gw==
X-CSE-MsgGUID: qX3cjfo4RcWnQJoo2a0Feg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136283622"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 13:08:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 887A813B; Thu, 08 May 2025 23:08:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: at91: Fix possible out-of-boundary access
Date: Thu,  8 May 2025 23:08:07 +0300
Message-ID: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_130825_076950_1C704CCB 
X-CRM114-Status: GOOD (  12.45  )
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

at91_gpio_probe() doesn't check that given OF alias is not available or
something went wrong when trying to get it. This might have consequences
when accessing gpio_chips array with that value as an index. Note, that
BUG() can be compiled out and hence won't actually perform the required
checks.

Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-at91.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 442dd8c80b65..6c2727bd55bc 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1822,12 +1822,16 @@ static int at91_gpio_probe(struct platform_device *pdev)
 	struct at91_gpio_chip *at91_chip = NULL;
 	struct gpio_chip *chip;
 	struct pinctrl_gpio_range *range;
+	int alias_idx;
 	int ret = 0;
 	int irq, i;
-	int alias_idx = of_alias_get_id(np, "gpio");
 	uint32_t ngpio;
 	char **names;
 
+	alias_idx = of_alias_get_id(np, "gpio");
+	if (alias_idx < 0)
+		return alias_idx;
+
 	BUG_ON(alias_idx >= ARRAY_SIZE(gpio_chips));
 	if (gpio_chips[alias_idx])
 		return dev_err_probe(dev, -EBUSY, "%d slot is occupied.\n", alias_idx);
-- 
2.47.2


