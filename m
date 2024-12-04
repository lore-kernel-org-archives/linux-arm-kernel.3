Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32353E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAGpmxsl+d+H/7+gkMd8OdgRJdVcKYVUKMv38o7TjGs=; b=PrHDcUc5rXCih4sCQDMcBmn5+b
	kEjVRhZE7PfcPCTywenB2SfDVFnWw6A7QICG8DiZCrtEdQm55cortsvkuA+uZNaksMav1omUX12Fc
	vyxZVrVT5ios60chgHo24RujIB/NZEmAYCslNXBjaQkN9IQx/H177hvxLO4dg9RUtHiiTSEAR+PDa
	opNTZ42aFjktmQzX0XJVY8ZqCcn80B7E8TPQihwz6NQZlfVI4xhSjAmsTEg00/OfBz3Xzczn5ubw6
	op4hGzkNlOn21fQRzCJPCKXWVDVTrWRHMdq33Wz9gvIjthBmdPLZmk1+94EZDPTZhXPgZlRtQGcCN
	D39LHvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImpF-0000000CFKy-3f6y;
	Wed, 04 Dec 2024 10:41:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImeC-0000000CChR-3sL2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E621A40F00;
	Wed,  4 Dec 2024 10:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED752C4CEDD;
	Wed,  4 Dec 2024 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308219;
	bh=eRwTJcvOcBqsfk9RyLjladsqQIYfI5C2P8yvjI+Gx9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/0ypPQHv+d2jQnT4vdgXOJNqtZHM0ljsbE2j2WV0KOPE/FHAUmBkh01/WGiayGoK
	 +LfgJfSLQ9lCz2wwxgK/FaEVVxlsmTdqjedoZGi85iTK5rjvPPwl//ACBARKX8eVWH
	 YqsbfyTDh7ythCMywUvXqVEqeZpxd9J3/LSz9vUI+ueEuBXOfeAyt5ZqJbOjRdFR8q
	 ttqaf8EpEeSuURf+8V1NKM8XDMRtUIqPEa9BQfsvzUzo1Wx6kczSSQ/1sp57c0NWDh
	 khFErVCgfprDp8IERcIcFadxh2V+YOwqymPGCdgKuPEycgWekSRUSggjEZwVcJesna
	 3B+CgfCD9UFfA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH 11/15] ARM: PXA: deprecate remaining board file support
Date: Wed,  4 Dec 2024 11:29:00 +0100
Message-Id: <20241204102904.1863796-12-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023021_086973_4C88096B 
X-CRM114-Status: GOOD (  19.00  )
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

In the 2021 board file removal, the gumstix and sharpsl
support was left around in order to make it easier to convert
more of the PXA platform to device tree, given that both
platforms had some level of support in qemu.

As far as I can tell, nobody has worked on additional DT
conversion in that time, and qemu has in turn deprecated
the entire PXA platform.

Schedule the remaining board files for removal now, as they
are unlikely to be of any help in the future. If anyone
wants to revive support for these machines, they can
obviously still contribute device tree based code and
work on updating the corresponding drivers.

Any drivers that are only usable on legacy PXA board files
can also get removed along with the boards, or saved by
adding devicetree support.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/pxa_defconfig |  4 ----
 arch/arm/mach-pxa/Kconfig      | 10 ++++++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 3b9e67546f8c..96cef84dbb8e 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -16,10 +16,6 @@ CONFIG_PROFILING=y
 CONFIG_KEXEC=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
-CONFIG_ARCH_GUMSTIX=y
-CONFIG_PXA_SHARPSL=y
-CONFIG_MACH_AKITA=y
-CONFIG_MACH_BORZOI=y
 CONFIG_ARCH_FORCE_MAX_ORDER=8
 CONFIG_CMDLINE="root=/dev/ram0 ro"
 CONFIG_CPU_FREQ=y
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 10e472f4fa43..79d9785453c9 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -57,12 +57,15 @@ if ATAGS
 comment "Legacy board files"
 
 config ARCH_GUMSTIX
-	bool "Gumstix XScale 255 boards"
+	bool "Gumstix XScale 255 boards (DEPRECATED)"
 	select PXA25x
 	help
 	  Say Y here if you intend to run this kernel on
 	  Basix, Connex, ws-200ax, ws-400ax systems
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 choice
 	prompt "Gumstix Carrier/Expansion Board"
 	depends on ARCH_GUMSTIX
@@ -76,7 +79,7 @@ config GUMSTIX_AM300EPD
 endchoice
 
 config PXA_SHARPSL
-	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models"
+	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models (DEPRECATED)"
 	select SHARP_PARAM
 	select SHARP_SCOOP
 	help
@@ -86,6 +89,9 @@ config PXA_SHARPSL
 	  SL-C3000 (Spitz), SL-C3100 (Borzoi) or SL-C6000x (Tosa)
 	  handheld computer.
 
+	  Support for these machines will go away in early 2025,
+	  unless they get converted to device tree.
+
 config PXA_SHARPSL_DETECT_MACH_ID
 	bool "Detect machine ID at run-time in the decompressor"
 	depends on PXA_SHARPSL
-- 
2.39.5


