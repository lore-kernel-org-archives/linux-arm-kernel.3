Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF09C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0Gr+nS5mCCQMtHO6PX506rXj22uuIPGttVk73FvkJ0=; b=FEqMMXH34ftdNoXtr/6VtVElV0
	wNIvIcClP5hk04tvJhks4eMW+uBk6e8qeESYCTcobwB4Qr5/PiCFYafw1sQ5oxB50EFHJlWjklKUe
	d1vES53+KrFYnB1+KtJowkERKlBbMf0whKUwrbxamjVSujZB02l7prGJ+ZNeO0MgC6lp4FDVCBmCq
	eB3I5vphDLGbXUf5ArL0Ggdw8tHFe+Z9kga+am6QS7T+9xvoJ8RBY8xcb3Owo00hNddcFhIDRrkD+
	hqXJKm3iVQ90IxnAnkZjY3t7VDnE6OrYzJbQ5o0S902I8tjEh4L0YxyYYMVUR6U+eYRn7PiZO89ok
	uJ5mVm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2RJ-000000032fs-41QE;
	Wed, 01 Jul 2026 21:25:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2RI-000000032et-0mQC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81688600D8;
	Wed,  1 Jul 2026 21:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A6F1F000E9;
	Wed,  1 Jul 2026 21:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941147;
	bh=g0Gr+nS5mCCQMtHO6PX506rXj22uuIPGttVk73FvkJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aGuO26phr8PkWfQc53Z8FnkPJK/4L/Noq7AKU3jcM/lvzw/RXgctcm0Nq9SLyYBuj
	 ujFJEGG8lRONAlHWG+JZqm0OWqjBk8nav5y1iM56Nn6lf8FlLnpUiItnjUfZeJe8O8
	 poVjtL8VSDOQCd+gLtXQbTdzbrI4qsSWzP5oN6Dzib7Vw4JanIceDvQ+cUXyLEBc+8
	 AjrZEo2J1DUV6qWzyqMKSDU7RXgVWoWuc+3DKFN43HtNrFwLRKuI+vmPzmc61B+H1n
	 dCoKYfAFRXRY2sI6FqjIurIkovRzxDxlWLFWJbL/KjEX3Dx0gL69SI8aYoa7TydxRL
	 7wAo14QV/Bcuw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 12/19] ARM: PXA: mark remaining board files as deprecated
Date: Wed,  1 Jul 2026 23:23:46 +0200
Message-Id: <20260701212353.2196041-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260701212353.2196041-1-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
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
index 396680975506..e7a7ed2b7ef7 100644
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
index 66e26990e2c8..1fa282a9ef38 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -58,12 +58,15 @@ if ATAGS
 comment "Legacy board files"
 
 config ARCH_GUMSTIX
-	bool "Gumstix XScale 255 boards"
+	bool "Gumstix XScale 255 boards (DEPRECATED)"
 	select PXA25x
 	help
 	  Say Y here if you intend to run this kernel on
 	  Basix, Connex, ws-200ax, ws-400ax systems
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 choice
 	prompt "Gumstix Carrier/Expansion Board"
 	depends on ARCH_GUMSTIX
@@ -77,7 +80,7 @@ config GUMSTIX_AM300EPD
 endchoice
 
 config PXA_SHARPSL
-	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models"
+	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models (DEPRECATED)"
 	select SHARP_PARAM
 	select SHARP_SCOOP
 	help
@@ -87,6 +90,9 @@ config PXA_SHARPSL
 	  SL-C3000 (Spitz), SL-C3100 (Borzoi) or SL-C6000x (Tosa)
 	  handheld computer.
 
+	  Support for these machines will go away in early 2027,
+	  unless they get converted to device tree.
+
 config PXA_SHARPSL_DETECT_MACH_ID
 	bool "Detect machine ID at run-time in the decompressor"
 	depends on PXA_SHARPSL
-- 
2.39.5


