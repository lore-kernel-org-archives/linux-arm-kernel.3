Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E446CFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Wl/B8fbSsvCfixVFK7Rix7p3PWbNeNh13jd47m49Cs=; b=jkgPhFHZHyUtiBq38aTy7nVgmv
	MuWi0JrcPYWYeIfR7Bp54xR2W+oFZJ8DutD3OeXQsvq+PrSbjYP2VzwRTgCfmJ6VoDPhHxxs6DZSs
	N6BryfhGl80dgdA4OSVMQkN3rSfZfOI7R5s6isXfslrSatSiW7onoJNZw6m8SmpAfCjII7r6N+KPy
	Gz4GFadrIrRvyGBEj5W3+uMape4J6mq47P2U468tg0F0mE5f4rW9F2n9UJaJ68j29PdlJtESDPP8k
	hoe49+DN7ftk/jAjQjHAoFpQ5AkgD3MCxXowM/6926V+q8U27DkcvbV2yg76vS+wSSEltJN5jlDmK
	R+X/D6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCMD-00000007TNi-46u9;
	Thu, 20 Nov 2025 21:38:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCM1-00000007THq-0SQX;
	Thu, 20 Nov 2025 21:38:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38D27601D3;
	Thu, 20 Nov 2025 21:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC3AC116B1;
	Thu, 20 Nov 2025 21:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763674691;
	bh=Cguyb6qhnCh7Fzl+WJWPnEA/oYhtORJ4ebfdxQdOqcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eEpbI1U2W4WXM51ycPTgdnoHrzq+1MV2SnKxBcRcKks72S+BM700hMgM7+OIO2etq
	 U4oxsl163wCbabLy5hhZYYMFNRIoQRPZR747Dq1nO5lowbS87VTUDQ7/8mE5ZWoueU
	 dsw28hTT092seMXttB1icy51ivaDlzcLklwhJ5VB5XBhDUNgimvmKKNK7GTp3GBj68
	 xHjyIzMojTmPChg8yq2XhUzEITSLRUC7hDNa1AFELcWA/I3LqDg94I0DDP21vpf35H
	 eDpBruNQyo1vPTfX5r4Zuo3yK7EAnxwKlFZGqDSZmf7a31r/ufLP+RNyFEsTFUZfrH
	 n0zMX20ZKe4ew==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 20 Nov 2025 15:37:52 -0600
Subject: [PATCH v2 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-at91-probe-v2-3-8c8592f02e8e@kernel.org>
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
In-Reply-To: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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

The DT core will call of_platform_default_populate, so it is not
necessary for machine specific code to call it unless there are custom
match entries, auxdata or parent device. Neither of those apply here, so
remove the call.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Dust off and rebase to 6.18-rc1
 - Add new platforms added since v1
---
 arch/arm/mach-at91/at91rm9200.c |  9 ---------
 arch/arm/mach-at91/at91sam9.c   |  9 ---------
 arch/arm/mach-at91/sam9x60.c    |  9 ---------
 arch/arm/mach-at91/sam9x7.c     |  9 ---------
 arch/arm/mach-at91/sama5.c      | 19 ++-----------------
 arch/arm/mach-at91/sama7.c      |  8 --------
 6 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/arch/arm/mach-at91/at91rm9200.c b/arch/arm/mach-at91/at91rm9200.c
index 2ac564eb8bbb..d15997fff5d7 100644
--- a/arch/arm/mach-at91/at91rm9200.c
+++ b/arch/arm/mach-at91/at91rm9200.c
@@ -7,18 +7,10 @@
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
-}
-
 static const char *const at91rm9200_dt_board_compat[] __initconst = {
 	"atmel,at91rm9200",
 	NULL
@@ -26,6 +18,5 @@ static const char *const at91rm9200_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(at91rm9200_dt, "Atmel AT91RM9200")
 	.init_late	= at91rm9200_pm_init,
-	.init_machine	= at91rm9200_dt_device_init,
 	.dt_compat	= at91rm9200_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
index cf07cba4ee5d..b9d2909d1b65 100644
--- a/arch/arm/mach-at91/at91sam9.c
+++ b/arch/arm/mach-at91/at91sam9.c
@@ -6,19 +6,11 @@
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
-}
-
 static const char *const at91_dt_board_compat[] __initconst = {
 	"atmel,at91sam9",
 	NULL
@@ -27,6 +19,5 @@ static const char *const at91_dt_board_compat[] __initconst = {
 DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
 	/* Maintainer: Atmel */
 	.init_late	= at91sam9_pm_init,
-	.init_machine	= at91sam9_init,
 	.dt_compat	= at91_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x60.c b/arch/arm/mach-at91/sam9x60.c
index a31beaaeffcd..744bab2cbb92 100644
--- a/arch/arm/mach-at91/sam9x60.c
+++ b/arch/arm/mach-at91/sam9x60.c
@@ -7,19 +7,11 @@
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
-}
-
 static const char *const sam9x60_dt_board_compat[] __initconst = {
 	"microchip,sam9x60",
 	NULL
@@ -28,6 +20,5 @@ static const char *const sam9x60_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
 	/* Maintainer: Microchip */
 	.init_late	= sam9x60_pm_init,
-	.init_machine	= sam9x60_init,
 	.dt_compat	= sam9x60_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x7.c b/arch/arm/mach-at91/sam9x7.c
index 0c73f7fefd4f..166c8625509d 100644
--- a/arch/arm/mach-at91/sam9x7.c
+++ b/arch/arm/mach-at91/sam9x7.c
@@ -7,18 +7,10 @@
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
-}
-
 static const char * const sam9x7_dt_board_compat[] __initconst = {
 	"microchip,sam9x7",
 	NULL
@@ -27,6 +19,5 @@ static const char * const sam9x7_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sam9x7_dt, "Microchip SAM9X7")
 	/* Maintainer: Microchip */
 	.init_late	= sam9x7_pm_init,
-	.init_machine	= sam9x7_init,
 	.dt_compat	= sam9x7_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
index efae697ce29c..e56022f00800 100644
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
@@ -30,11 +27,6 @@ static void __init sama5_secure_cache_init(void)
 		outer_cache.write_sec = sama5_l2c310_write_sec;
 }
 
-static void __init sama5_dt_device_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char *const sama5_dt_board_compat[] __initconst = {
 	"atmel,sama5",
 	NULL
@@ -43,7 +35,6 @@ static const char *const sama5_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
 	/* Maintainer: Atmel */
 	.init_late	= sama5_pm_init,
-	.init_machine	= sama5_dt_device_init,
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
index 3e28727f2a8e..f56828d61199 100644
--- a/arch/arm/mach-at91/sama7.c
+++ b/arch/arm/mach-at91/sama7.c
@@ -6,18 +6,11 @@
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
-
 static const char *const sama7_dt_board_compat[] __initconst = {
 	"microchip,sama7",
 	NULL
@@ -26,7 +19,6 @@ static const char *const sama7_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sama7_dt, "Microchip SAMA7")
 	/* Maintainer: Microchip */
 	.init_late	= sama7_pm_init,
-	.init_machine	= sama7_dt_device_init,
 	.dt_compat	= sama7_dt_board_compat,
 MACHINE_END
 

-- 
2.51.0


