Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F8EF4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=xygFk++4Dzn0dankGqOQGxF6Nzu0dNNvlma/WvdOwrA=; b=IRlhU585PBZhQS
	CYsDqBFTpqIoOqjMFDG4fLIHBBJcI5B3eFWksQvGArdxFgT4AGXRdu+lS8/ajZsOeNw0VfVs39F8t
	U9wYByqXTIvOhNU2e0HsPt4ELlzWSW4b4UxLzmc31PJUQWLATsc/GTIrb7suBAWZQpOM4ly7r4wzT
	dmsHU4ADrgl1PxicVZWZqQgjGjY+3Ej0ljf038aPUrqE3QroIkXT1mFWIHIWz22LC2CHe5nucFx+s
	2b3IQW2VCczpF7KQZIUg5JK1cUv3JyARpJbchj56vDaYPKy3Epa07FUiPoLnZF9gG9duOYxaLWHhy
	xKxDm6BOko7BnnhWw6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApw-0000000CANF-0aVb;
	Fri, 10 Apr 2026 12:19:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApu-0000000CAKh-26iS;
	Fri, 10 Apr 2026 12:19:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE51161119;
	Fri, 10 Apr 2026 12:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F75AC2BC9E;
	Fri, 10 Apr 2026 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823585;
	bh=QeSclCuMiRAS5wk6lWoviUdmtawCgYPJK7955XSCrpk=;
	h=Date:From:To:Cc:Subject:References:From;
	b=lx7PSe/PjadVTpIMwJdhAJBLt/wkFkRfbRhizAqdCmT18BPcbSlnMFeRTECetW5Mz
	 e18kIbNIOdNmzSRNcljN5MiUEDzdauvDtZpRrKPYAQq6HuU0ixY90WW/AT9/9BP1TE
	 G0pmyVH8DHnvheD/Jtznb1TEyB0LG5ezsRLYR23JSrj8T1XCNh6BmAZvkaj4VTBCOk
	 FjtLvndHPm1jEFcE8PqfK7D9YifyYmXQkYky/wPITICuSdRrICGnLkZ3jZxe25sBaP
	 q8ggvP1HMAsaRRMlhxP+iwStOOzZHUsvv+/U0DMMTE0lc38vp99aMg2cqhdxuGrXAu
	 mqm2UYpSfgZaw==
Date: Fri, 10 Apr 2026 14:19:42 +0200
Message-ID: <20260410120318.592237447@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 15/38] ptp: ptp_vmclock: Replace get_cycles() usage
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

get_cycles() is not really well defined and similar to other usaage of the
underlying hardware CPU counters the PTP vmclock should use an explicit
interface as well.

Implement ptp_vmclock_read_cpu_counter() in arm64 and x86 and simplify the
Kconfig selection while at it.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 arch/arm64/Kconfig                   |    1 +
 arch/arm64/include/asm/ptp_vmclock.h |   12 ++++++++++++
 arch/x86/Kconfig                     |    1 +
 arch/x86/include/asm/ptp_vmclock.h   |   12 ++++++++++++
 drivers/ptp/Kconfig                  |    6 ++++--
 drivers/ptp/ptp_vmclock.c            |    6 ++++--
 6 files changed, 34 insertions(+), 4 deletions(-)

--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -112,6 +112,7 @@ config ARM64
 	select ARCH_SUPPORTS_SCHED_SMT
 	select ARCH_SUPPORTS_SCHED_CLUSTER
 	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_PTP_VMCLOCK if ARCH_SUPPORTS_INT128
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
--- /dev/null
+++ b/arch/arm64/include/asm/ptp_vmclock.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_PTP_VMCLOCK_H
+#define __ASM_PTP_VMCLOCK_H
+
+#include <asm/arch_timer.h>
+
+static inline u64 ptp_vmclock_read_cpu_counter(void)
+{
+	return arch_timer_read_counter();
+}
+
+#endif
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -135,6 +135,7 @@ config X86
 	select ARCH_SUPPORTS_RT
 	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_SUPPORTS_PROPELLER_CLANG    if X86_64
+	select ARCH_SUPPORTS_PTP_VMCLOCK	if X86_TSC
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if X86_CX8
 	select ARCH_USE_MEMTEST
--- /dev/null
+++ b/arch/x86/include/asm/ptp_vmclock.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_PTP_VMCLOCK_H
+#define __ASM_PTP_VMCLOCK_H
+
+#include <asm/tsc.h>
+
+static inline u64 ptp_vmclock_read_cpu_counter(void)
+{
+	return cpu_feature_enabled(X86_FEATURE_TSC) ? rdtsc() : 0;
+}
+
+#endif
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -131,10 +131,12 @@ config PTP_1588_CLOCK_KVM
 	  To compile this driver as a module, choose M here: the module
 	  will be called ptp_kvm.
 
+config ARCH_SUPPORTS_PTP_VMCLOCK
+	bool
+
 config PTP_1588_CLOCK_VMCLOCK
 	tristate "Virtual machine PTP clock"
-	depends on X86_TSC || ARM_ARCH_TIMER
-	depends on PTP_1588_CLOCK && ARCH_SUPPORTS_INT128
+	depends on PTP_1588_CLOCK && ARCH_SUPPORTS_PTP_VMCLOCK
 	default PTP_1588_CLOCK_KVM
 	help
 	  This driver adds support for using a virtual precision clock
--- a/drivers/ptp/ptp_vmclock.c
+++ b/drivers/ptp/ptp_vmclock.c
@@ -28,6 +28,8 @@
 
 #include <linux/ptp_clock_kernel.h>
 
+#include <asm/ptp_vmclock.h>
+
 #ifdef CONFIG_X86
 #include <asm/pvclock.h>
 #include <asm/kvmclock.h>
@@ -144,11 +146,11 @@ static int vmclock_get_crosststamp(struc
 			if (systime_snapshot.cs_id == st->cs_id) {
 				cycle = systime_snapshot.cycles;
 			} else {
-				cycle = get_cycles();
+				cycle = ptp_vmclock_read_cpu_counter();
 				ptp_read_system_postts(sts);
 			}
 		} else {
-			cycle = get_cycles();
+			cycle = ptp_vmclock_read_cpu_counter();
 		}
 
 		delta = cycle - le64_to_cpu(st->clk->counter_value);


