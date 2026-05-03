Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34273CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 21:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ylGhPogPdvQ9Ms4MmL9aBfryjCEpoixYIBwvNlno5/s=; b=v1/4lvWTlbfQOJKccEFKgXvGRw
	6YRk/T8Sxs+fYxHyKXCYsx9HQ7SBEhdNr/AaV4IDITbDxFYTSFd+nQWoYxK01oFoYnkOV8P1OETPB
	KZ3z6zMdcyfAejI5BU1fDJPDZGJIvMutI3CGVOnuIJM/ws+kf41qRPIFZ1+xCJPvn5WcSJRsfMv8a
	LTS+P4q4rlFDKh61YYygGam0QL81/vD/0GmQDEGrlvl8vzz21+zMZMK4qtQsm+HAP0ck8/sRC4k9C
	auJFn+61crdxH1o0dz0FUdC3HN8UDn9SEuLZPJZhlXPlDMQcX7zwUgT9W3lRtcj4ryX74ZwG2edhS
	gj8a3PRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJeZu-0000000Bn31-34PO;
	Sun, 03 May 2026 21:42:18 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJeZq-0000000Bn2Q-2iOs;
	Sun, 03 May 2026 21:42:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] printk: remove BOOT_PRINTK_DELAY config
Date: Sun,  3 May 2026 14:42:14 -0700
Message-ID: <20260503214214.3475670-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
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

This boot option is ancient and probably not being used.
Dave Jones used it successfully maybe 15 years ago...
AFAIK it doesn't work reliably, especially on SMP.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

 Documentation/admin-guide/kernel-parameters.txt |    8 -
 arch/arm/configs/bcm2835_defconfig              |    1 
 kernel/printk/printk.c                          |   57 --------------
 lib/Kconfig.debug                               |   18 ----
 4 files changed, 84 deletions(-)

--- linux-next-20260429.orig/kernel/printk/printk.c
+++ linux-next-20260429/kernel/printk/printk.c
@@ -1289,61 +1289,6 @@ static bool suppress_message_printing(in
 	return (level >= console_loglevel && !ignore_loglevel);
 }
 
-#ifdef CONFIG_BOOT_PRINTK_DELAY
-
-static int boot_delay; /* msecs delay after each printk during bootup */
-static unsigned long long loops_per_msec;	/* based on boot_delay */
-
-static int __init boot_delay_setup(char *str)
-{
-	unsigned long lpj;
-
-	lpj = preset_lpj ? preset_lpj : 1000000;	/* some guess */
-	loops_per_msec = (unsigned long long)lpj / 1000 * HZ;
-
-	get_option(&str, &boot_delay);
-	if (boot_delay > 10 * 1000)
-		boot_delay = 0;
-
-	pr_debug("boot_delay: %u, preset_lpj: %ld, lpj: %lu, "
-		"HZ: %d, loops_per_msec: %llu\n",
-		boot_delay, preset_lpj, lpj, HZ, loops_per_msec);
-	return 0;
-}
-early_param("boot_delay", boot_delay_setup);
-
-static void boot_delay_msec(int level)
-{
-	unsigned long long k;
-	unsigned long timeout;
-	bool suppress = !is_printk_force_console() &&
-			suppress_message_printing(level);
-
-	if ((boot_delay == 0 || system_state >= SYSTEM_RUNNING) || suppress)
-		return;
-
-	k = (unsigned long long)loops_per_msec * boot_delay;
-
-	timeout = jiffies + msecs_to_jiffies(boot_delay);
-	while (k) {
-		k--;
-		cpu_relax();
-		/*
-		 * use (volatile) jiffies to prevent
-		 * compiler reduction; loop termination via jiffies
-		 * is secondary and may or may not happen.
-		 */
-		if (time_after(jiffies, timeout))
-			break;
-		touch_nmi_watchdog();
-	}
-}
-#else
-static inline void boot_delay_msec(int level)
-{
-}
-#endif
-
 static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
 module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
 
@@ -2121,8 +2066,6 @@ int printk_delay_msec __read_mostly;
 
 static inline void printk_delay(int level)
 {
-	boot_delay_msec(level);
-
 	if (unlikely(printk_delay_msec)) {
 		int m = printk_delay_msec;
 
--- linux-next-20260429.orig/lib/Kconfig.debug
+++ linux-next-20260429/lib/Kconfig.debug
@@ -99,24 +99,6 @@ config MESSAGE_LOGLEVEL_DEFAULT
 	  by default. To change that, use loglevel=<x> in the kernel bootargs,
 	  or pick a different CONSOLE_LOGLEVEL_DEFAULT configuration value.
 
-config BOOT_PRINTK_DELAY
-	bool "Delay each boot printk message by N milliseconds"
-	depends on DEBUG_KERNEL && PRINTK && GENERIC_CALIBRATE_DELAY
-	help
-	  This build option allows you to read kernel boot messages
-	  by inserting a short delay after each one.  The delay is
-	  specified in milliseconds on the kernel command line,
-	  using "boot_delay=N".
-
-	  It is likely that you would also need to use "lpj=M" to preset
-	  the "loops per jiffy" value.
-	  See a previous boot log for the "lpj" value to use for your
-	  system, and then set "lpj=M" before setting "boot_delay=N".
-	  NOTE:  Using this option may adversely affect SMP systems.
-	  I.e., processors other than the first one may not boot up.
-	  BOOT_PRINTK_DELAY also may cause LOCKUP_DETECTOR to detect
-	  what it believes to be lockup conditions.
-
 config DYNAMIC_DEBUG
 	bool "Enable dynamic printk() support"
 	default n
--- linux-next-20260429.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20260429/Documentation/admin-guide/kernel-parameters.txt
@@ -654,14 +654,6 @@ Kernel parameters
 			embedded devices based on command line input.
 			See Documentation/block/cmdline-partition.rst
 
-	boot_delay=	[KNL,EARLY]
-			Milliseconds to delay each printk during boot.
-			Only works if CONFIG_BOOT_PRINTK_DELAY is enabled,
-			and you may also have to specify "lpj=".  Boot_delay
-			values larger than 10 seconds (10000) are assumed
-			erroneous and ignored.
-			Format: integer
-
 	bootconfig	[KNL,EARLY]
 			Extended command line options can be added to an initrd
 			and this will cause the kernel to look for it.
--- linux-next-20260429.orig/arch/arm/configs/bcm2835_defconfig
+++ linux-next-20260429/arch/arm/configs/bcm2835_defconfig
@@ -174,7 +174,6 @@ CONFIG_NLS_UTF8=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=32
 CONFIG_PRINTK_TIME=y
-CONFIG_BOOT_PRINTK_DELAY=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 # CONFIG_ENABLE_MUST_CHECK is not set

