Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAFBC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZXJbA3WTTH9PC7iAGQFTEEZitLt6uqmDGblrk1/zT0=; b=0NRwYD9nuK5o1ghg9kdLYythaf
	y44yJ7oL5cVNiXF9kVUxezA2oooMLzyvI/0Io3HhugKjsz/nTTSZVdLUAYSU9teUVE/1c6Ps5kAvB
	cn9tJXVcjPG24KXOqljLOUtsMfH6gEXvdTn3JbArhl9uMpsxyz4q/UAwGSEpFHZXaDzVNcYJmVL6G
	YCc6IABpzsvkOAPiPKif6yIgmcAOoG8R6sfIL+1xIacUKdqU1S7oNjd6h94pL23TpsRYK29eUNqnp
	Z6IRnLzhjRRnUxnTjVJ2vD6oZJ977UrfpIEgO73ckPgvNOJNz2SPkyF8Hl1eVhDh9MomdLdmwtGi4
	qNoUJDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOvA-000000039Tm-2bM2;
	Fri, 08 Aug 2025 15:22:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOsZ-000000038v9-3LbZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 15:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5F95601ED;
	Fri,  8 Aug 2025 15:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D830C4CEED;
	Fri,  8 Aug 2025 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754666373;
	bh=Ju9ikKO/kXioH3zFMYDsXK5SYo/GY0u9aYwCAwLDTHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZDkKsGxlo+CoIVF5PBg1RRdrrokNpeq5e8oXCRGfjsa+Me+uZZjrBUefoLz7hUoI
	 cryi7PzlJmQtcEUjFyYcqtxjHCc7nN3EERuy9ejFB8kGqcANuSoTFaDCo8MpbF0orh
	 RpmR9uCBUrNuWRSMuILFdcB7LhWNUQ3s50gYbH6zj2w5W0Y8Z3GAarKNVXxrAapY28
	 x9z17JO+qeVCVkvkeSvGcgi+QhOQNkUpaiQtrAmkuseBXPjNsB4fua6oADqCKxdnZm
	 bZK3MWRz1kPyqB4hus5+KrVE5e/oElqN005mFeTwcwURBmktCR9TpVEnuHS8VzNxJB
	 iciki0XtEglLA==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 01/21] ARM: select legacy gpiolib interfaces where used
Date: Fri,  8 Aug 2025 17:17:45 +0200
Message-Id: <20250808151822.536879-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808151822.536879-1-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

A few old machines have not been converted away from the old-style
gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
symbol so the code still works where it is needed but can be left
out otherwise.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mv78xx0/Kconfig     | 1 +
 arch/arm/mach-orion5x/Kconfig     | 1 +
 arch/arm/mach-pxa/Kconfig         | 1 +
 arch/arm/mach-s3c/Kconfig.s3c64xx | 1 +
 arch/arm/mach-sa1100/Kconfig      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
index 9de3bbc09c3a..670e6587827e 100644
--- a/arch/arm/mach-mv78xx0/Kconfig
+++ b/arch/arm/mach-mv78xx0/Kconfig
@@ -6,6 +6,7 @@ menuconfig ARCH_MV78XX0
 	depends on ATAGS
 	select CPU_FEROCEON
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MVEBU_MBUS
 	select FORCE_PCI
 	select PLAT_ORION_LEGACY
diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
index ee449ca032d2..cef19bea6164 100644
--- a/arch/arm/mach-orion5x/Kconfig
+++ b/arch/arm/mach-orion5x/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_ORION5X
 	depends on CPU_LITTLE_ENDIAN
 	select CPU_FEROCEON
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MVEBU_MBUS
 	select FORCE_PCI
 	select PCI_QUIRKS
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 10e472f4fa43..66e26990e2c8 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -10,6 +10,7 @@ menuconfig ARCH_PXA
 	select CPU_XSCALE if !CPU_XSC3
 	select GPIO_PXA
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select PLAT_PXA
 	help
 	  Support for Intel/Marvell's PXA2xx/PXA3xx processor line.
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 8f40af063ad6..3f97fba8e4f5 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -101,6 +101,7 @@ config MACH_WLF_CRAGG_6410
 	depends on ATAGS
 	depends on I2C=y
 	select CPU_S3C6410
+	select GPIOLIB_LEGACY
 	select LEDS_GPIO_REGISTER
 	select S3C64XX_DEV_SPI0
 	select S3C64XX_SETUP_FB_24BPP
diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index 0fb4c24cfad5..e23700e0d6c8 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -13,6 +13,7 @@ menuconfig ARCH_SA1100
 	select CPU_FREQ
 	select CPU_SA1100
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select IRQ_DOMAIN
 	select ISA
 	select NEED_MACH_MEMORY_H
-- 
2.39.5


