Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C16F44847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=g9ALE2yJnCpZX5YqdQYfLWAUyNKeE/FQChcdbmzeb0E=; b=FQa0fZ7mGePEKk
	3K1E+41XqsvOIys4V7ZJ4/MU9Dpzv+9dY2wMtSyyPGy+UlvaK9NqZ0YpLIK/HiZdk3HpMISssoe1N
	tc3dOk6xukJf7XOfiLj7VWLRj3CZfv+VNKuK9eXK7zSKSQ3Ri0EEFkXDqNsZMz4ZbJFV27wUAKEvO
	uJt+fHhaG8+b+odA5IvitBK8pNApPjjQfMUJMch/NegQHq4kkwAy/EsSaF1hxfDdN1pFp1Q1euOaf
	tA+YLT2q7wFObOQ8DIGL5zzuTGE1rBJS+sYKWkFdV8BENEog4C5xWLNIbFS7wxhfg6iBr8thBxZjo
	nBOdtCg/iDRi0aGyNccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArm-0000000CDOE-2Brt;
	Fri, 10 Apr 2026 12:21:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArc-0000000CD1S-1TOf;
	Fri, 10 Apr 2026 12:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D91761119;
	Fri, 10 Apr 2026 12:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A92C19421;
	Fri, 10 Apr 2026 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823691;
	bh=Q+IGONPkRqfayguG6Txkx/mXXA1oIi3CJxpKCndboyw=;
	h=Date:From:To:Cc:Subject:References:From;
	b=jCHje7Cbtua5yolIUEErxzzrufBxMW0LYt1Kl8DVF/tR3HVJLQOi/32jC1MsFj4sU
	 FuxQN5MUq6aUGx6W7VIPg9yzFSdqaZMbr1tHN5zCNxM830u3a1p54HzWCg2l8d0SzU
	 xyIH4nNx8yib1hODU1iz6RiEcKM7mp5gg40/5f4Y1z++7yY40Cew7vRxlBQZnDz2BW
	 SRGp9xUTNtuoCzThvYns7ndknYQX1oh8mSimdrkytbEv0fT97jYIikQFCA2/G5YDNs
	 jkUQfDUfGpJwZkehI6Gounl+WGkLz5eknKnsUFvTrSUQCfxc7Qg1pWGasV1G+9O2Ak
	 9A3OklGLFCHng==
Date: Fri, 10 Apr 2026 14:21:28 +0200
Message-ID: <20260410120320.081003009@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
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
Subject: [patch 37/38] x86: Select ARCH_HAS_RANDOM_ENTROPY
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

The only remaining usage of get_cycles() is to provide random_get_entropy().

Switch x86 over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
providing random_get_entropy() in asm/random.h.

Remove asm/timex.h as it has no functionality anymore.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: x86@kernel.org
---
 arch/x86/Kconfig              |    1 +
 arch/x86/include/asm/random.h |   16 ++++++++++++++++
 arch/x86/include/asm/timex.h  |   17 -----------------
 arch/x86/include/asm/tsc.h    |    9 ---------
 4 files changed, 17 insertions(+), 26 deletions(-)

--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -101,6 +101,7 @@ config X86
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_NONLEAF_PMD_YOUNG	if PGTABLE_LEVELS > 2
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if X86_64
--- /dev/null
+++ b/arch/x86/include/asm/random.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_RANDOM_H
+#define _ASM_X86_RANDOM_H
+
+#include <asm/processor.h>
+#include <asm/tsc.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	if (!IS_ENABLED(CONFIG_X86_TSC) &&
+	    !cpu_feature_enabled(X86_FEATURE_TSC))
+		return random_get_entropy_fallback();
+	return rdtsc();
+}
+
+#endif /* _ASM_X86_RANDOM_H */
--- a/arch/x86/include/asm/timex.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_X86_TIMEX_H
-#define _ASM_X86_TIMEX_H
-
-#include <asm/processor.h>
-#include <asm/tsc.h>
-
-static inline unsigned long random_get_entropy(void)
-{
-	if (!IS_ENABLED(CONFIG_X86_TSC) &&
-	    !cpu_feature_enabled(X86_FEATURE_TSC))
-		return random_get_entropy_fallback();
-	return rdtsc();
-}
-#define random_get_entropy random_get_entropy
-
-#endif /* _ASM_X86_TIMEX_H */
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -72,15 +72,6 @@ extern unsigned int tsc_khz;
 
 extern void disable_TSC(void);
 
-static inline cycles_t get_cycles(void)
-{
-	if (!IS_ENABLED(CONFIG_X86_TSC) &&
-	    !cpu_feature_enabled(X86_FEATURE_TSC))
-		return 0;
-	return rdtsc();
-}
-#define get_cycles get_cycles
-
 extern void tsc_early_init(void);
 extern void tsc_init(void);
 extern void mark_tsc_unstable(char *reason);


