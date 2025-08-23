Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ACACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KKZnIH6gv75VfTKwVgLDkiUmzBQdoIwEj6j1RUMmWgE=; b=2F0DvBLgDZbLtz9H61cB+15bCE
	chW6k8coIoy9ePvwqShFQ/zha9FklTl6AoGCwRyqsIIUYMYgts1CmYG9xIrKiSMZeozHfP7q6z3SQ
	9M5RETsJ+IkQaOHaAcqwU8eA9nA1O1706u8mFVqpMmZx827dG5X9hxqUcVJN68K7MnYkf8MxRLloL
	nLo+JmosHz4j+cPz20hzw9vNm83MiNZw/cIfmc8RIHBxTwDgACp4Ynr+C1XlDaRr0pw4V4lzy6OUx
	rJ8Y4tAD8EGX1uUU9Wk//ZAknZI/mXUmftgeoI5S2eeQGiPZbIvbKY9DiufLBxBYpA29YT+yV1wM6
	u27nInNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgy-00000004XXS-3lEG;
	Sat, 23 Aug 2025 09:37:44 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upg3x-00000003s9N-3jtV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 04:41:12 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57N4egak864535;
	Fri, 22 Aug 2025 23:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755924042;
	bh=KKZnIH6gv75VfTKwVgLDkiUmzBQdoIwEj6j1RUMmWgE=;
	h=From:To:Subject:Date;
	b=roeSj/PAelxQ4ZiI6ElMnIvvFPyWeag5Fx/u9ZXSSxZzj5F+mup4TrlJY8cpa561x
	 SRwzykAOnhTxQKEt73KY7WPHHd0MgP1uJUAkxiqzxaiuNtgCmXj+YucIdyvm4NMRZN
	 p7nyk0PbdZJhaT2tksKY8ZMi7JrVM/Bqns8RZsFU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57N4ef6t3407323
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 23:40:42 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 23:40:42 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.1748.24; Fri, 22 Aug
 2025 23:40:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 23:40:41 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.68.114])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57N4eYoe357347;
	Fri, 22 Aug 2025 23:40:35 -0500
From: vishnu singh <v-singh1@ti.com>
To: <mark.rutland@arm.com>, <maz@kernel.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <jstultz@google.com>, <sboyd@kernel.org>,
        <akpm@linux-foundation.org>, <chenhuacai@kernel.org>,
        <pmladek@suse.com>, <agordeev@linux.ibm.com>, <bigeasy@linutronix.de>,
        <urezki@gmail.com>, <Llillian@star-ark.net>, <francesco@valla.it>,
        <guoweikang.kernel@gmail.com>, <alexander.shishkin@linux.intel.com>,
        <rrangel@chromium.org>, <kpsingh@kernel.org>,
        <anna-maria@linutronix.de>, <mingo@kernel.org>, <frederic@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot timestamp
Date: Sat, 23 Aug 2025 10:10:34 +0530
Message-ID: <20250823044034.189939-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_214110_063892_E4FDCE00 
X-CRM114-Status: GOOD (  22.49  )
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

From: Vishnu Singh <v-singh1@ti.com>

Part of BOOT SIG Initiative, This patch adds a tiny,opt-in facility to
help measure kernel boot duration without full tracing:

New CONFIG_BOOT_TIME_TRACKER in kernel/time/Kconfig.
When enabled, the kernel logs two boot markers:
    1. kernel entry in start_kernel()
    2. first userspace start in kernel_init() before run_init_process()

These markers are intended for post-boot parsers to compute coarse
kernel boot time and to merge with bootloader/MCU/DSP records into
a unified timeline.

Core helper u64 boot_time_now() in kernel/time/boot_time_now.c,
exporting a counter‑derived timestamp via small per-arch primitives.
This series includes an initial arm64 primitive that uses CNTVCT_EL0
as the source, other architectures can wire up equivalents.

Files touched:
kernel/time/Kconfig, kernel/time/Makefile
kernel/time/boot_time_now.c (new core helper)
arch/arm64/include/asm/boot_time_primitives.h (arm64 primitive)
include/linux/boot_time_now.h (public API + IDs)
init/main.c (print two markers)

This complements U-Boot’s stashed bootstage records so a userspace tool
can build a system-wide boot timeline across SPL, U-Boot, kernel and other
subsystems.

Reference boot-time parser utility:
     https://github.com/v-singh1/boot-time-parser

Sample boot time report:
+--------------------------------------------------------------------+
                 am62xx-evm Boot Time Report
+--------------------------------------------------------------------+
Device Power On         : 0 ms
SPL Time                : 843 ms
U-Boot Time             : 2173 ms
Kernel handoff time     : 462 ms
Kernel Time             : 2522 ms
Total Boot Time         : 6000 ms
+--------------------------------------------------------------------+

+--------------------------------------------------------------------+
                 Bootloader and Kernel Boot Records
+--------------------------------------------------------------------+
BOOTSTAGE_AWAKE                =      0 ms (+  0 ms)
BOOTSTAGE_START_UBOOT_F        =    843 ms (+  0 ms)
BOOTSTAGE_ACCUM_DM_F           =    843 ms (+  0 ms)
BOOTSTAGE_START_UBOOT_R        =   1951 ms (+1108 ms)
BOOTSTAGE_ACCUM_DM_R           =   1951 ms (+  0 ms)
BOOTSTAGE_NET_ETH_START        =   2032 ms (+ 81 ms)
BOOTSTAGE_NET_ETH_INIT         =   2053 ms (+ 21 ms)
BOOTSTAGE_MAIN_LOOP            =   2055 ms (+  2 ms)
BOOTSTAGE_START_MCU            =   2661 ms (+606 ms)
BOOTSTAGE_BOOTM_START          =   2959 ms (+298 ms)
BOOTSTAGE_RUN_OS               =   3016 ms (+ 57 ms)
BOOTSTAGE_BOOTM_HANDOFF        =   3016 ms (+  0 ms)
BOOTSTAGE_KERNEL_START         =   3478 ms (+462 ms)
BOOTSTAGE_KERNEL_END           =   6000 ms (+2522 ms)
+--------------------------------------------------------------------+

+--------------------------------------------------------------------+
                 MCU Boot Records
+--------------------------------------------------------------------+
MCU_AWAKE                      =   2661 ms (+  0 ms)
BOARD_PERIPHERALS_INIT         =   2661 ms (+  0 ms)
MAIN_TASK_CREATE               =   2661 ms (+  0 ms)
FIRST_TASK                     =   2662 ms (+  1 ms)
DRIVERS_OPEN                   =   2662 ms (+  0 ms)
BOARD_DRIVERS_OPEN             =   2662 ms (+  0 ms)
IPC_SYNC_FOR_LINUX             =   6636 ms (+3974 ms)
IPC_REGISTER_CLIENT            =   6636 ms (+  0 ms)
IPC_SUSPEND_TASK               =   6636 ms (+  0 ms)
IPC_RECEIVE_TASK               =   6636 ms (+  0 ms)
IPC_SYNC_ALL                   =   6787 ms (+151 ms)
+--------------------------------------------------------------------+

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 MAINTAINERS                                   |  3 +++
 arch/arm64/include/asm/boot_time_primitives.h | 14 ++++++++++++++
 include/linux/boot_time_now.h                 | 16 ++++++++++++++++
 init/main.c                                   | 13 +++++++++++++
 kernel/time/Kconfig                           | 10 ++++++++++
 kernel/time/Makefile                          |  1 +
 kernel/time/boot_time_now.c                   | 13 +++++++++++++
 7 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/include/asm/boot_time_primitives.h
 create mode 100644 include/linux/boot_time_now.h
 create mode 100644 kernel/time/boot_time_now.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e913c1edd1fd..e5273b338814 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1994,6 +1994,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/include/asm/arch_timer.h
 F:	arch/arm64/include/asm/arch_timer.h
+F:	arch/arm64/include/asm/boot_time_primitives.h
 F:	drivers/clocksource/arm_arch_timer.c
 F:	drivers/clocksource/arm_arch_timer_mmio.c
 
@@ -25466,6 +25467,7 @@ R:	Stephen Boyd <sboyd@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
+F:	include/linux/boot_time_now.h
 F:	include/linux/clocksource.h
 F:	include/linux/time.h
 F:	include/linux/timekeeper_internal.h
@@ -25474,6 +25476,7 @@ F:	include/linux/timex.h
 F:	include/uapi/linux/time.h
 F:	include/uapi/linux/timex.h
 F:	kernel/time/alarmtimer.c
+F:	kernel/time/boot_time_now.c
 F:	kernel/time/clocksource*
 F:	kernel/time/ntp*
 F:	kernel/time/time.c
diff --git a/arch/arm64/include/asm/boot_time_primitives.h b/arch/arm64/include/asm/boot_time_primitives.h
new file mode 100644
index 000000000000..9bbbd500a95d
--- /dev/null
+++ b/arch/arm64/include/asm/boot_time_primitives.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_BOOT_TIME_PRIMITIVES_H
+#define __ASM_BOOT_TIME_PRIMITIVES_H
+
+#include <asm/arch_timer.h>
+#include <linux/math64.h>
+
+static inline u64 arch_boot_counter_now(void)
+{
+	return ((arch_timer_read_cntvct_el0() * 1000000) / arch_timer_get_cntfrq());
+}
+
+#endif
diff --git a/include/linux/boot_time_now.h b/include/linux/boot_time_now.h
new file mode 100644
index 000000000000..a18a1809057f
--- /dev/null
+++ b/include/linux/boot_time_now.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_BOOT_TRACKER_H
+#define _LINUX_BOOT_TRACKER_H
+
+#include <linux/types.h>
+
+enum kernel_bootstage_id {
+	BOOTSTAGE_ID_KERNEL_START = 300,
+	BOOTSTAGE_ID_KERNEL_END = 301,
+};
+
+/* Return boot time in nanoseconds using hardware counter */
+u64 boot_time_now(void);
+
+#endif
diff --git a/init/main.c b/init/main.c
index 9b5150166bcf..76eb8098ab20 100644
--- a/init/main.c
+++ b/init/main.c
@@ -115,6 +115,10 @@
 
 #include <kunit/test.h>
 
+#ifdef CONFIG_BOOT_TIME_TRACKER
+#include <linux/boot_time_now.h>
+#endif
+
 static int kernel_init(void *);
 
 /*
@@ -929,6 +933,11 @@ void start_kernel(void)
 	page_address_init();
 	pr_notice("%s", linux_banner);
 	setup_arch(&command_line);
+
+#ifdef CONFIG_BOOT_TIME_TRACKER
+	pr_info("[BOOT TRACKER] - ID:%d, %s = %llu\n",
+		BOOTSTAGE_ID_KERNEL_START, __func__, boot_time_now());
+#endif
 	/* Static keys and static calls are needed by LSMs */
 	jump_label_init();
 	static_call_init();
@@ -1503,6 +1512,10 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
+#ifdef CONFIG_BOOT_TIME_TRACKER
+	pr_info("[BOOT TRACKER] - ID:%d, %s = %llu\n",
+		BOOTSTAGE_ID_KERNEL_END, __func__, boot_time_now());
+#endif
 	if (ramdisk_execute_command) {
 		ret = run_init_process(ramdisk_execute_command);
 		if (!ret)
diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index 7c6a52f7836c..aadfd66d5d69 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -221,4 +221,14 @@ config POSIX_AUX_CLOCKS
 	  and other clock domains, which are not correlated to the TAI/NTP
 	  notion of time.
 
+config BOOT_TIME_TRACKER
+	bool "boot time tracking support"
+	help
+	  Prints boot timestamps at the beginning of the kernel and when the
+	  first user-space process is launched. This helps measure basic
+	  boot latency for embedded and multi-core systems.
+
+	  The messages appear using printk and can be parsed by boot
+	  instrumentation tools or console logs.
+
 endmenu
diff --git a/kernel/time/Makefile b/kernel/time/Makefile
index e6e9b85d4db5..f7c115a385bb 100644
--- a/kernel/time/Makefile
+++ b/kernel/time/Makefile
@@ -32,3 +32,4 @@ obj-$(CONFIG_TEST_UDELAY)			+= test_udelay.o
 obj-$(CONFIG_TIME_NS)				+= namespace.o
 obj-$(CONFIG_TEST_CLOCKSOURCE_WATCHDOG)		+= clocksource-wdtest.o
 obj-$(CONFIG_TIME_KUNIT_TEST)			+= time_test.o
+obj-$(CONFIG_BOOT_TIME_TRACKER) 		+= boot_time_now.o
diff --git a/kernel/time/boot_time_now.c b/kernel/time/boot_time_now.c
new file mode 100644
index 000000000000..6dc12d454be0
--- /dev/null
+++ b/kernel/time/boot_time_now.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: LGPL-2.0
+
+#include <linux/boot_time_now.h>
+#include <asm/boot_time_primitives.h>
+
+u64 boot_time_now(void)
+{
+	return arch_boot_counter_now();
+}
+EXPORT_SYMBOL_GPL(boot_time_now);
+
+MODULE_DESCRIPTION("boot time tracker");
+MODULE_LICENSE("GPL");
-- 
2.50.1


