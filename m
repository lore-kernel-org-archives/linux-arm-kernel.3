Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF59ECD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIbLYIR4qOinVPSLahPalENeT18/s9zq2XWQrVCVaRU=; b=AV64+ap6oHEydSnN+bMFRR2f6H
	+kS/oBemO1I8Gqf3kjUg4Z1EPK56cTGpjxNkXhsYmWCbLdcN6kD62zhVDksB2zaex3Y20/V3ATk/m
	/iRA/Ti6bNthde0MWF8Iyj1VUhm40G9LCsS3RwhrI4kGmZAzw+cAcPBtfCpB0YhlmHtH2Jld39qV0
	aziuB+FA0Baz96orL4HhooIaR81pGNYA1wrh8slpf+ptLlkDelFH/YjqaIxPr19TOLuyeYtLlKBc0
	EqoQuT4QzJHdgN46tJsgbGRjxph5aah/0NYTKxaCVGNXhXvcCOb8+S0utVvAGjjzXu/d+n0Q0hMkz
	DvVKPsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpl-00000005V8b-0bLQ;
	Wed, 20 May 2026 18:39:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlp7-00000005Tw2-0GeW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:39:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7372960220;
	Wed, 20 May 2026 18:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2541F00896;
	Wed, 20 May 2026 18:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779302356;
	bh=mIbLYIR4qOinVPSLahPalENeT18/s9zq2XWQrVCVaRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CqMa3b0K6yilhMP8W6/z8wMrypYc8Bx3ZdaOFKtCffLHlXg6yDY4Uf4N9Yh4Otc+r
	 0czwFzNB+xyJSwDOfoq+kfnNnGx/6SFS4Y5+Y0oB65KBe4R4XoROpy/hzeSI1r+Or7
	 h4ZQ7eGVSNOfAPhXVrjb2Urbghf/Whrbl26oESPLWHlpgZY5fPPR5fDcuzZw56Jph3
	 eap+xYP1AcFJy7mrot9mcJs/Pn48b4MD6EZdOYZuUhPv1zVMgxk1m8HdZssHE6fLJG
	 f5GuqEvoG+Vt0o/Fv8y5DwaW9MdkgLlRlaEGURyv7e2LXyJZqY+D4TdACo+R4aYlUZ
	 ZW3tF7mNaDaUA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 04/10] [v2] sh: select legacy gpiolib interface
Date: Wed, 20 May 2026 20:38:09 +0200
Message-Id: <20260520183815.2510387-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
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

Many board files on sh reference the legacy gpiolib interfaces that
are becoming optional. To ensure the boards can keep building, select
CONFIG_GPIOLIB_LEGACY on each of the boards that have one of the
hardcoded calls.

Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: no changes. Adrian said he'll pick it up for 7.2, but so
    far the patch is not in linux-next yet, so I'm including it
    for completeness here.
---
 arch/sh/Kconfig                        | 1 +
 arch/sh/boards/Kconfig                 | 8 ++++++++
 arch/sh/boards/mach-highlander/Kconfig | 1 +
 arch/sh/boards/mach-rsk/Kconfig        | 3 +++
 4 files changed, 13 insertions(+)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d5795067befa..d60f1d5a94c0 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -462,6 +462,7 @@ config CPU_SUBTYPE_SHX3
 	select CPU_SHX3
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select PINCTRL
 
 # SH4AL-DSP Processor Support
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index 1af93be61b1f..d89b74177233 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -80,6 +80,7 @@ config SH_7724_SOLUTION_ENGINE
 	select SOLUTION_ENGINE
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	imply SND_SOC_AK4642 if SND_SIMPLE_CARD
 	help
@@ -199,6 +200,7 @@ config SH_SH7757LCR
 	bool "SH7757LCR"
 	depends on CPU_SUBTYPE_SH7757
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 
 config SH_SH7785LCR
@@ -226,6 +228,7 @@ config SH_URQUELL
 	bool "Urquell"
 	depends on CPU_SUBTYPE_SH7786
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select HAVE_PCI
 	select NO_IOPORT_MAP if !PCI
 
@@ -233,6 +236,7 @@ config SH_MIGOR
 	bool "Migo-R"
 	depends on CPU_SUBTYPE_SH7722
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  Select Migo-R if configuring for the SH7722 Migo-R platform
@@ -242,6 +246,7 @@ config SH_AP325RXA
 	bool "AP-325RXA"
 	depends on CPU_SUBTYPE_SH7723
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  Renesas "AP-325RXA" support.
@@ -251,6 +256,7 @@ config SH_KFR2R09
 	bool "KFR2R09"
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  "Kit For R2R for 2009" support.
@@ -259,6 +265,7 @@ config SH_ECOVEC
 	bool "EcoVec"
 	depends on CPU_SUBTYPE_SH7724
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	imply SND_SOC_DA7210 if SND_SIMPLE_CARD
 	help
@@ -329,6 +336,7 @@ config SH_MAGIC_PANEL_R2
 	bool "Magic Panel R2"
 	depends on CPU_SUBTYPE_SH7720
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select REGULATOR_FIXED_VOLTAGE if REGULATOR
 	help
 	  Select Magic Panel R2 if configuring for Magic Panel R2.
diff --git a/arch/sh/boards/mach-highlander/Kconfig b/arch/sh/boards/mach-highlander/Kconfig
index b0abd03cac4e..cd3a553ce30c 100644
--- a/arch/sh/boards/mach-highlander/Kconfig
+++ b/arch/sh/boards/mach-highlander/Kconfig
@@ -20,6 +20,7 @@ config SH_R7785RP
 	bool "R7785RP board support"
 	depends on CPU_SUBTYPE_SH7785
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 
 endchoice
 
diff --git a/arch/sh/boards/mach-rsk/Kconfig b/arch/sh/boards/mach-rsk/Kconfig
index f0299bc4416f..3810937aa5d4 100644
--- a/arch/sh/boards/mach-rsk/Kconfig
+++ b/arch/sh/boards/mach-rsk/Kconfig
@@ -12,16 +12,19 @@ config SH_RSK7201
 config SH_RSK7203
 	bool "RSK7203"
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	depends on CPU_SUBTYPE_SH7203
 
 config SH_RSK7264
 	bool "RSK2+SH7264"
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	depends on CPU_SUBTYPE_SH7264
 
 config SH_RSK7269
 	bool "RSK2+SH7269"
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	depends on CPU_SUBTYPE_SH7269
 
 endchoice
-- 
2.39.5


