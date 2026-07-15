Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BCDC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JUnyILCuCHm9xif9x0aTG1ELA/JAcvGAudj2v68t74=; b=g9ZOxevaWuJKc+qlgnRU1VOFOI
	7bFdTEShqEwdSrGbtkfJusvaFLPcLtr5aUVwoXCZ45ULzpGWC0ui0YGmzGO7SJlr77awZwae129u0
	23LyLfFJYplAgny3Wo1cAL+q/sBj4MVXuKzi0AisTKYcOh+Q4gcc/d2LgSUEcn/5oecghFZfqzh/2
	/ZXEFR3nrgWxn4TlqAlCTZ+u1WQ8zqfJIOz2cxWn/9KfGDjxMU7a54/OquxykpL+doOVT7Bcxt5jJ
	huiHylJOLHelXECfNZoxCbqhK87/b7UIzzsz2k8/2GsT+u9QDKMm0DMI8H1Jz9ijt0fZ76Np4xTuX
	vXKf3B+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hd-0000000Fiej-3wvf;
	Wed, 15 Jul 2026 18:51:29 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hZ-0000000FiaH-2Dv3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141486; x=1815677486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3RT0bvr0YlMj/g53DZqvYLkN+FeBp21Hqe9FY6G7j0c=;
  b=hQHPGyWimJmdUqJN5rPbb5OT3AXeuM/0pF8cgqyK2uhkrAz9tkUNP3hn
   b65TM/OySS/1DyFfLFOCio+FzP/ono9brvXKHEKsfX70m2qu18g2bA9C6
   eRFwt6ZX+YLdMBSuMVqz18leJiNcCO+dklUB5qom1acN8TTn69hbqUApF
   gSeL3/QNhc4QUoq4tr79mXKDu7z0rUoj8ZER59KWyOkiQFOtB0cw9dy4u
   AMi49E7L/EboxEY6P+L4gqSnYZ8oXxDDf+hsIaAGQru/ir9gtyonumlVc
   +FzWu7x7bUjDe+13X+BJXKcZqXwt/1ckDtRuNjvIjLqZPJNYsqtg9qSZl
   w==;
X-CSE-ConnectionGUID: Nr9S+eW6R56EHBf+G6L+fw==
X-CSE-MsgGUID: 5M2//yWNTuO/3MK+pZhbUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96308579"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="96308579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:25 -0700
X-CSE-ConnectionGUID: lMLnisCeQDm4TCWmtpr1gw==
X-CSE-MsgGUID: IPOQ6sDsQcmUjgaIpa0bmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294491680"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 11:51:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0C37BA1; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bradford Love <brad@nextdimension.cc>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 6/7] MIPS: BCM63XX: Open code gpio_request_one()
Date: Wed, 15 Jul 2026 20:46:46 +0200
Message-ID: <20260715185112.1323510-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115125_685841_F5F5A2E3 
X-CRM114-Status: GOOD (  12.31  )
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

Open code the gpio_request_one() call to be able to kill that API
in the follow changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 57e916c06792..993341604439 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -903,8 +903,11 @@ int __init board_register_devices(void)
 
 	platform_device_register(&bcm63xx_gpio_leds);
 
-	if (board.ephy_reset_gpio)
-		gpio_request_one(board.ephy_reset_gpio, GPIOF_OUT_INIT_HIGH, "ephy-reset");
+	if (board.ephy_reset_gpio) {
+		gpio_request(board.ephy_reset_gpio, "ephy-reset");
+		gpio_direction_output(board.ephy_reset_gpio, 1);
+		gpio_free(board.ephy_reset_gpio);
+	}
 
 	return 0;
 }
-- 
2.50.1


