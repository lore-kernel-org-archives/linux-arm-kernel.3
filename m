Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3EFFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5uXkcN/Wlg83u7HpjR4Y5g/uDpKk3P0HNEY75/ptZgs=; b=gyoVPL/ezXvQO9M/DSwdlK1XQF
	93ir7/HTUEnWDB4JKLgnFvaD6nrmIDytuW5SThMAnhXy229fJI8K9kgp/KeDDI87XkuqcHQ8b3SB+
	gWAUF8Enr0YkgpMj6DzDsCnDqd+DszpGgV4Xi83lbiFLNtMROlXVZTMJDOZxnttwi4WcU3wjX21n0
	2/mOsAhGpuQZKYXMvCZj04s39WbjcXvLvZvHF02/jWkMDO5UR9v7o7jGtEcEljcQrJm7sQ7Cr/jea
	9YHPOd0b+aYSiUMddElUr1AuDhj/cYZvvLC09Qz9X2hTyTrKt5SU/RQnDIst5JoIQLDM0cAJNfZbq
	Zg0lnyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlIA-00000001vry-0PHz;
	Tue, 28 Apr 2026 16:28:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlI5-00000001vps-2g0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 952A543F5B;
	Tue, 28 Apr 2026 16:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEC6C2BCC9;
	Tue, 28 Apr 2026 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777393684;
	bh=olhgGBJthCl0/RuH4VBtKTPTAtlW3mfULTs2uM3D5/c=;
	h=From:To:Cc:Subject:Date:From;
	b=FbnadGdO5BWSHNJwAvwgGku0aAUwyUHTIUbabxyMGpHU4sFL5Ur+EDzx1iwdv9ByF
	 FmnfqLZ3sFDclwk+C4ZtPIEOjdL75kwi07AT+lnudJlJtWovJgTpm8YuTt03E60FSb
	 QrlKHxf+lFZWHEBlte1ur0668dc9eKP2UnLRuIvgFoVc7A0MSyX/JZDr9zRXDFCYSD
	 YZfn3Wi2JSEyPwpVPIM+XpmuNPSdl3RboEFX2Op1V2hyxrfCAGgwfv5CBkPc+g0Vrp
	 L3YKqr+yPSQXaUwFX724ieiIdh28qI3scqKFfMhcZAp5lK8UcZqxWE/F4G+M/Q0M9d
	 Pf0SKvDvOUP5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev,
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
Subject: [PATCH] ARM: select legacy gpiolib interfaces where used
Date: Tue, 28 Apr 2026 18:27:30 +0200
Message-Id: <20260428162757.540823-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_092805_745053_3A5F5E66 
X-CRM114-Status: GOOD (  11.48  )
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

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
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


