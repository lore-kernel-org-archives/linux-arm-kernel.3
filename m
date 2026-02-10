Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF0DEB26ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yt7+9/hWhwW7RRIAMqogVfC82dE8WQORTOA0VWGyLk=; b=NZD3YDuoxrVuhqSHMfM/LSId/S
	G8sGN0uiq0JU8WnaLK8WmG+FnnqrJXmlQ2uBJdPlM98uDRkMm9tltZAcXTeSqvPUhZ1hsKj9iLWET
	48gEFaa5DczxabfqPnhfT47Xc6TVVqS7brPgD3s+EN9DeLN/+DkApQ2PbrJmeuvvUQDXpgJcPgeG3
	cBLm6rJ7/gFCHwWSGJD5sf8xu7OImea3SDQtBWZuxQjyeP+j9e2oGDrgb68mVkvgWEs/rsGE8fwBt
	9JP8i0zhASCA2L7maaONxA0wZCJrNxKQR76EtxTm0vBdVYrz2toMpe72WXHDa7x6STGOAoEeWxLMZ
	6eIr1YQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprEX-0000000HJkz-1QAc;
	Tue, 10 Feb 2026 17:09:05 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprET-0000000HJhf-2u57
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:09:03 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EF12F7A00E8;
	Tue, 10 Feb 2026 12:09:00 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 10 Feb 2026 12:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770743340;
	 x=1770829740; bh=1yt7+9/hWhwW7RRIAMqogVfC82dE8WQORTOA0VWGyLk=; b=
	KkEwABZgOj+MemseN5C4rp29Q5JYmSNS5ggCHwUKrhojNq58YAYDtj7IUitGDpn3
	4wLeRatcDY+X6P5itmMwULRMkWo99n7MTWDgqmhRWDpfmK0N7Q2Riix4h7syI/pm
	xPSsp9zx2OvOJge/x0MokaHpDoh76XqPbMh2rWCsohS70l5JyOBPlx0nSt1+AnOg
	s2tJ8LvimKBC5WISrA8N72SVGSiOWIQephr9/kQGpIkWRMAfq1nAmd3PY2+7CvPi
	fKu5lKY9tWlhBUIA1dvXY0Rj4mwYyhSPx19bFQh5f4CLNFOAeYshYZD8+YHZHNF7
	n1+ZLH0Kn+v8u3V2pejrpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770743340; x=
	1770829740; bh=1yt7+9/hWhwW7RRIAMqogVfC82dE8WQORTOA0VWGyLk=; b=t
	7sGMLCcYIjJXKxXCgp4BrumsDzm94qkYJ8lAgK/NUbl2azsmN7CCA7IMzZUO9Sok
	L2GbBjX04YdHW6Q8uwIcoHKKPp0mwd7ynA7J/jGanI1BcuTrr586lS1DRuiXHc4K
	O/EYzjzNJ5D5q6wvg0xGWrKqBzplvsmAS3IS1ikxT62AZQdvuNlgMfOgMzB7xqSG
	yrvMXykM1ZgkYBaubpQDLtv7ZoX4pyyd/5q8boy9HfEjh19MfOVbWAF9kY1Y6UwD
	PsaayCvsWTC+j6vnF6V3j47M92J5mfk0VTEE/EO87Cdp7a6BNkzJy8iwZgDWEIo0
	QuDxNkSPB0p+CaWW9iEXg==
X-ME-Sender: <xms:J2aLaR9A13RquMn6J-iE3Fumpe17Sb-K6QvETm55a0x1XA24EHPEeg>
    <xme:J2aLaQj7ZP0CW_3sOb4i4bf4lbHdmVhdIyILQHNKCZ-fqFLz9MMlq0Clgraga1xdP
    w7bCUNq5eCL7mF1UQlt2z85E27y-w4BnO4L_H5888c6t_r9hYL5JW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtddtvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgush
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:J2aLaTrWdINvJvvvQdBs0cQ0SeAL_IEDt4WMX6avIULLx-4hp9aQnQ>
    <xmx:J2aLaUg53NWH2f-Et9_IwzsPGnhy6R0BYadpC_0OOWR5-t5jgERyTw>
    <xmx:J2aLaYimrctHlD7nlVB6m3G4SRjXmYu-aRj6RLuqk8r-r0GHNC1tNQ>
    <xmx:J2aLaShCj7fxxymLqnodQHYY1qRk8O1cN307hWI0l71CKQHC00gf9g>
    <xmx:LGaLaUwY51lyBV0tB9q9uMdtE1Zxmy1SRsZLZe_CpqXO2-gD1LKLnNIL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A4673700065; Tue, 10 Feb 2026 12:08:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYfK9ZjhzOaF
Date: Tue, 10 Feb 2026 18:08:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <8964e89c-0cf1-4184-920f-5cd852ba782a@app.fastmail.com>
In-Reply-To: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: arm platform code changes for 7.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_090901_805466_97172356 
X-CRM114-Status: GOOD (  15.44  )
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

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.0

for you to fetch changes up to 16868b35b915a8a0fc810cd14b3b4927a5fb2213:

  Merge tag 'omap-for-v6.20/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm (2026-01-29 10:06:55 +0100)

----------------------------------------------------------------
soc: arm platform code changes for 7.0

These are mainly code cleanups, dropping some unneeded code,
plus a reference counting leak fix.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'at91-soc-6.20' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/arm
      Merge tag 'omap-for-v6.20/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm

Randy Dunlap (1):
      ARM: omap1: drop unused Kconfig symbol

Rob Herring (Arm) (2):
      ARM: at91: Move PM init functions to .init_late hook
      ARM: at91: remove unnecessary of_platform_default_populate calls

Wentao Liang (1):
      ARM: omap2: Fix reference count leaks in omap_control_init()

 arch/arm/mach-at91/at91rm9200.c | 12 +-----------
 arch/arm/mach-at91/at91sam9.c   | 12 +-----------
 arch/arm/mach-at91/sam9x60.c    | 12 +-----------
 arch/arm/mach-at91/sam9x7.c     | 12 +-----------
 arch/arm/mach-at91/sama5.c      | 21 +++------------------
 arch/arm/mach-at91/sama7.c      | 11 +----------
 arch/arm/mach-omap1/Kconfig     |  1 -
 arch/arm/mach-omap2/control.c   | 14 ++++++++++----
 8 files changed, 18 insertions(+), 77 deletions(-)

diff --git a/arch/arm/mach-at91/at91rm9200.c b/arch/arm/mach-at91/at91rm9200.c
index 4f8186211619..d15997fff5d7 100644
--- a/arch/arm/mach-at91/at91rm9200.c
+++ b/arch/arm/mach-at91/at91rm9200.c
@@ -7,26 +7,16 @@
  *                2012 Joachim Eastwood <manabian@gmail.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 
 #include "generic.h"
 
-static void __init at91rm9200_dt_device_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-
-	at91rm9200_pm_init();
-}
-
 static const char *const at91rm9200_dt_board_compat[] __initconst = {
 	"atmel,at91rm9200",
 	NULL
 };
 
 DT_MACHINE_START(at91rm9200_dt, "Atmel AT91RM9200")
-	.init_machine	= at91rm9200_dt_device_init,
+	.init_late	= at91rm9200_pm_init,
 	.dt_compat	= at91rm9200_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
index 7e572189a5eb..b9d2909d1b65 100644
--- a/arch/arm/mach-at91/at91sam9.c
+++ b/arch/arm/mach-at91/at91sam9.c
@@ -6,21 +6,11 @@
  *                2011 Nicolas Ferre <nicolas.ferre@atmel.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 #include <asm/system_misc.h>
 
 #include "generic.h"
 
-static void __init at91sam9_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-
-	at91sam9_pm_init();
-}
-
 static const char *const at91_dt_board_compat[] __initconst = {
 	"atmel,at91sam9",
 	NULL
@@ -28,6 +18,6 @@ static const char *const at91_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
 	/* Maintainer: Atmel */
-	.init_machine	= at91sam9_init,
+	.init_late	= at91sam9_pm_init,
 	.dt_compat	= at91_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x60.c b/arch/arm/mach-at91/sam9x60.c
index d8c739d25458..744bab2cbb92 100644
--- a/arch/arm/mach-at91/sam9x60.c
+++ b/arch/arm/mach-at91/sam9x60.c
@@ -7,21 +7,11 @@
  * Author: Claudiu Beznea <claudiu.beznea@microchip.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 #include <asm/system_misc.h>
 
 #include "generic.h"
 
-static void __init sam9x60_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-
-	sam9x60_pm_init();
-}
-
 static const char *const sam9x60_dt_board_compat[] __initconst = {
 	"microchip,sam9x60",
 	NULL
@@ -29,6 +19,6 @@ static const char *const sam9x60_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
 	/* Maintainer: Microchip */
-	.init_machine	= sam9x60_init,
+	.init_late	= sam9x60_pm_init,
 	.dt_compat	= sam9x60_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x7.c b/arch/arm/mach-at91/sam9x7.c
index e1ff30b5b09b..166c8625509d 100644
--- a/arch/arm/mach-at91/sam9x7.c
+++ b/arch/arm/mach-at91/sam9x7.c
@@ -7,20 +7,10 @@
  * Author: Varshini Rajendran <varshini.rajendran@microchip.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 
 #include "generic.h"
 
-static void __init sam9x7_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-
-	sam9x7_pm_init();
-}
-
 static const char * const sam9x7_dt_board_compat[] __initconst = {
 	"microchip,sam9x7",
 	NULL
@@ -28,6 +18,6 @@ static const char * const sam9x7_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sam9x7_dt, "Microchip SAM9X7")
 	/* Maintainer: Microchip */
-	.init_machine	= sam9x7_init,
+	.init_late	= sam9x7_pm_init,
 	.dt_compat	= sam9x7_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
index bf2b5c6a18c6..e56022f00800 100644
--- a/arch/arm/mach-at91/sama5.c
+++ b/arch/arm/mach-at91/sama5.c
@@ -6,9 +6,6 @@
  *                2013 Ludovic Desroches <ludovic.desroches@atmel.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -30,12 +27,6 @@ static void __init sama5_secure_cache_init(void)
 		outer_cache.write_sec = sama5_l2c310_write_sec;
 }
 
-static void __init sama5_dt_device_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-	sama5_pm_init();
-}
-
 static const char *const sama5_dt_board_compat[] __initconst = {
 	"atmel,sama5",
 	NULL
@@ -43,7 +34,7 @@ static const char *const sama5_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
 	/* Maintainer: Atmel */
-	.init_machine	= sama5_dt_device_init,
+	.init_late	= sama5_pm_init,
 	.dt_compat	= sama5_dt_board_compat,
 MACHINE_END
 
@@ -54,17 +45,11 @@ static const char *const sama5_alt_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sama5_alt_dt, "Atmel SAMA5")
 	/* Maintainer: Atmel */
-	.init_machine	= sama5_dt_device_init,
+	.init_late	= sama5_pm_init,
 	.dt_compat	= sama5_alt_dt_board_compat,
 	.l2c_aux_mask	= ~0UL,
 MACHINE_END
 
-static void __init sama5d2_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-	sama5d2_pm_init();
-}
-
 static const char *const sama5d2_compat[] __initconst = {
 	"atmel,sama5d2",
 	NULL
@@ -72,8 +57,8 @@ static const char *const sama5d2_compat[] __initconst = {
 
 DT_MACHINE_START(sama5d2, "Atmel SAMA5")
 	/* Maintainer: Atmel */
-	.init_machine	= sama5d2_init,
 	.init_early	= sama5_secure_cache_init,
+	.init_late	= sama5d2_pm_init,
 	.dt_compat	= sama5d2_compat,
 	.l2c_aux_mask	= ~0UL,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sama7.c b/arch/arm/mach-at91/sama7.c
index bd43733ede18..f56828d61199 100644
--- a/arch/arm/mach-at91/sama7.c
+++ b/arch/arm/mach-at91/sama7.c
@@ -6,20 +6,11 @@
  *
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 #include <asm/system_misc.h>
 
 #include "generic.h"
 
-static void __init sama7_dt_device_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-	sama7_pm_init();
-}
-
 static const char *const sama7_dt_board_compat[] __initconst = {
 	"microchip,sama7",
 	NULL
@@ -27,7 +18,7 @@ static const char *const sama7_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sama7_dt, "Microchip SAMA7")
 	/* Maintainer: Microchip */
-	.init_machine	= sama7_dt_device_init,
+	.init_late	= sama7_pm_init,
 	.dt_compat	= sama7_dt_board_compat,
 MACHINE_END
 
diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 08ec6bd84ada..b114f7ca2173 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -4,7 +4,6 @@ menuconfig ARCH_OMAP1
 	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5
 	depends on CPU_LITTLE_ENDIAN
 	depends on ATAGS
-	select ARCH_HAS_HOLES_MEMORYMODEL
 	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select FORCE_PCI if PCCARD
diff --git a/arch/arm/mach-omap2/control.c b/arch/arm/mach-omap2/control.c
index 79860b23030d..eb6fc7c61b6e 100644
--- a/arch/arm/mach-omap2/control.c
+++ b/arch/arm/mach-omap2/control.c
@@ -732,7 +732,7 @@ int __init omap2_control_base_init(void)
  */
 int __init omap_control_init(void)
 {
-	struct device_node *np, *scm_conf;
+	struct device_node *np, *scm_conf, *clocks_node;
 	const struct of_device_id *match;
 	const struct omap_prcm_init_data *data;
 	int ret;
@@ -753,16 +753,19 @@ int __init omap_control_init(void)
 
 			if (IS_ERR(syscon)) {
 				ret = PTR_ERR(syscon);
-				goto of_node_put;
+				goto err_put_scm_conf;
 			}
 
-			if (of_get_child_by_name(scm_conf, "clocks")) {
+			clocks_node = of_get_child_by_name(scm_conf, "clocks");
+			if (clocks_node) {
+				of_node_put(clocks_node);
 				ret = omap2_clk_provider_init(scm_conf,
 							      data->index,
 							      syscon, NULL);
 				if (ret)
-					goto of_node_put;
+					goto err_put_scm_conf;
 			}
+			of_node_put(scm_conf);
 		} else {
 			/* No scm_conf found, direct access */
 			ret = omap2_clk_provider_init(np, data->index, NULL,
@@ -780,6 +783,9 @@ int __init omap_control_init(void)
 
 	return 0;
 
+err_put_scm_conf:
+	if (scm_conf)
+		of_node_put(scm_conf);
 of_node_put:
 	of_node_put(np);
 	return ret;

