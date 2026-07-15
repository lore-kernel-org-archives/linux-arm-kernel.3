Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB0C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bY20WfOts1c8bynpgrcE6o3Ax7xrarEwOH83HkRSi98=; b=JAiY+WpvXUiQUQ6NagJaqgsD99
	8HHfNTD+2T5ejyR2ds6m7CmpWd63GVvrkJ+bLyq4qlu1XprYv1GwAgadxoY9kiK7NczyrO1xhF0LR
	dtRSd8HETTdI3AAMrrxRREj5rf7pOT/kpxLxmxd7A7Zz3dAmUzFVYK80SKK/caIXkWI5rpemSQJPH
	+WUsFyj5WTUSRKNwvMbVI/eq9K1ZhV+6237GhoSkIbepBERLDBeeiYmtJZ3gOJFAmBJdlz0zEkTkL
	jzAK7T94ejUE3BwmDcK8FJGdJN6XlDCi13tszGT5vF52k0acqzbvBDzG6xSDzFPSDlI8o/kAP99rR
	0+qYHebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hw-0000000Fisj-41p2;
	Wed, 15 Jul 2026 18:51:49 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4hb-0000000Fib0-49cS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784141488; x=1815677488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vqPRf1eRLI2wPMZNTTk55tYgoCASIBKcTfPQxTtD05k=;
  b=eD4YU3Kal9sn0fXRNTttQcBxvRdB8xeIHX5//MD0bh3w3oMKS3+3XpzD
   uP+5hfETNCC8Dw4YzrOMLXQ+e10GooGUC8O6YeLEWMob2diRKOoaN7Zml
   WguBMbcC94C0pARMHIzN4Y8bg/ZAPh1olmeHih2ejjiL/MWmncTNb53Ey
   xaGe85ww73UzeeC89ouwJVfra0cmDcX0ON0t0jUSrtcy/w9VK64dN2IXY
   k/HZ39AEgoc3fFjivhbzhjd8BkE3ZNDdqyhbYovUzAmeW8/JUUsB2bTSp
   N6Kn5rIQSGuVVRCRIsDi+3iXiwdHXZxj+5uQPudHlKXM7AJDfzIOcWjJH
   w==;
X-CSE-ConnectionGUID: A6fCTDvRRS6YL9WuoiOLpw==
X-CSE-MsgGUID: 4YVLpyuBTM6D/1f0W0U8hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84887521"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84887521"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:51:25 -0700
X-CSE-ConnectionGUID: 0sRMWxKpQ8aMtUHksXYmvQ==
X-CSE-MsgGUID: XwfBQ5UwRna3c2sKskrJyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="280700299"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2026 11:51:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0811F9E; Wed, 15 Jul 2026 20:51:16 +0200 (CEST)
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
Subject: [PATCH v1 5/7] MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
Date: Wed, 15 Jul 2026 20:46:45 +0200
Message-ID: <20260715185112.1323510-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_115128_074285_A15ADBF2 
X-CRM114-Status: GOOD (  14.08  )
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

ephy_reset_gpio_flags exists solely to supply polarity to the reset GPIO.
But in practice it's kept all the same and currently only a single user
present. Drop the member and use hard coded GPIO flags instead.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c           | 7 +++----
 arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 3 ---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index c5617b889b1c..57e916c06792 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -42,7 +42,7 @@ static struct board_info __initdata board_cvg834g = {
 	.expected_cpu_id = 0x3368,
 
 	.ephy_reset_gpio = 36,
-	.ephy_reset_gpio_flags = GPIOF_OUT_INIT_HIGH,
+
 	.has_pci = 1,
 	.has_uart0 = 1,
 	.has_uart1 = 1,
@@ -903,9 +903,8 @@ int __init board_register_devices(void)
 
 	platform_device_register(&bcm63xx_gpio_leds);
 
-	if (board.ephy_reset_gpio && board.ephy_reset_gpio_flags)
-		gpio_request_one(board.ephy_reset_gpio,
-				board.ephy_reset_gpio_flags, "ephy-reset");
+	if (board.ephy_reset_gpio)
+		gpio_request_one(board.ephy_reset_gpio, GPIOF_OUT_INIT_HIGH, "ephy-reset");
 
 	return 0;
 }
diff --git a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
index 830f53f28e3f..018a56cbc328 100644
--- a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
+++ b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
@@ -46,9 +46,6 @@ struct board_info {
 
 	/* External PHY reset GPIO */
 	unsigned int ephy_reset_gpio;
-
-	/* External PHY reset GPIO flags from gpio.h */
-	unsigned long ephy_reset_gpio_flags;
 };
 
 #endif /* ! BOARD_BCM963XX_H_ */
-- 
2.50.1


