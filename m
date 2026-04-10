Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2FFF44851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=8zvdRD2p6/HZ8oXsfe5lXlcag4dZNqBBcODU4ow/RYc=; b=gbGKNVTvI4+kCo
	GP1HkuVxqtvpNkYWZ8fZ0lRdTicLfxiX4g/QrpYuVrYt2YRPFheZP9krMQQTzGqt3apbRGmZlNaDl
	rmVHoa/dInKA+Zt324sQMINm2yjwzbE8AGO/23y432theOdd/3kb4SRoF/WZmgWEMvBfHIX7J8SnW
	OUZV0r8S06OUBCZkvdwTGjbPNcEP/budI+DlVo4lOgt1Iq5SZ1zcdvQ04gbY4tKCP4eMWDnVpjwdx
	EXre6Z9krdQd9YoNnMoHEr+E1o9JekvuN7CbrFDG32dZ11OkuI/p/Wd4YqKChqTTG7jDtQuDEh0sG
	o5UdczXlI8pLXypKPa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArl-0000000CDLl-2N9S;
	Fri, 10 Apr 2026 12:21:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAra-0000000CCxQ-1HFv;
	Fri, 10 Apr 2026 12:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=8zvdRD2p6/HZ8oXsfe5lXlcag4dZNqBBcODU4ow/RYc=; b=ltZiENAiuDeA0DtfgrPTX4UhrA
	mPSdhRbc4CR3M7xt9DwnxpG9/MmJg5eO6DQ38sFppshbE0AWGHjCxR3F5ECvSbshap6qg522wz80e
	7CLeZDsHZefpgn9hM256k9+19QciKJgdQppgFYEU8wzouCneEEiKbuh9vcgmale2JfAM6dz60BqJ0
	+AfWZA+RX4URqYiDSyfMeayYKVAPvMeUgi1kv/11vCzwRP0QKvpy/gtT2j9l9x4ImDlsM+F14mYvn
	syiwTKSM50g6MhiPpjV0J+ZVfdXI9OiKj+quh88aK+G2gXaJJ8yHkZhLVzL3dm7LR3O/XeRGfPTqm
	LVlyhgzA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArU-0000000DRWv-0WYn;
	Fri, 10 Apr 2026 12:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0543642A47;
	Fri, 10 Apr 2026 12:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC20C2BCAF;
	Fri, 10 Apr 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823681;
	bh=OPcZi/R5r87GvmWT5SIJxVBbPPoFFtvzuT/73U4xw6M=;
	h=Date:From:To:Cc:Subject:References:From;
	b=nXK4IjIIYC4xFxjX1itXAh56E7vQfZ/FFg1BbCs9BTXZuysjAps9x9bTN1xwZq3nZ
	 nGcIQtUczMHcNVAOXl3hUPdL+RNfqdz89/sEUMpghyMK10SkqIQqjoKkLYlZIDgGQg
	 6k/60XarMgLYO/edAAklc4cY8bckLykp1FNwUtHWQrXz6RHvG4M2KbuAE5KrJ4anwq
	 KM/F3nJU8E8F/VqEi0tPDyEpicMuyuDi9K4xS5dK75o3zu+aRbSw7hWtA0AaEaHPPT
	 N9wVjGhL4hXB+rfUE/x4Qggo67acuAQqBh4RtUYL+MOxGvNcfvlrnmgwbgp5vSVReB
	 QZ733oHdFO0vw==
Date: Fri, 10 Apr 2026 14:21:19 +0200
Message-ID: <20260410120319.924028412@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
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
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 35/38] s390: Select ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_132124_542213_84617DEB 
X-CRM114-Status: GOOD (  11.60  )
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

The only remaining non-architecture usage of get_cycles() is to provide
random_get_entropy().

Switch s390 over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
providing random_get_entropy() in asm/random.h.

Add 'asm/timex.h' includes to the relevant files, so the global include can
be removed once all architectures are converted over.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/Kconfig              |    1 +
 arch/s390/include/asm/random.h |   12 ++++++++++++
 arch/s390/include/asm/timex.h  |    6 ------
 arch/s390/kernel/time.c        |    1 +
 arch/s390/kernel/vtime.c       |    1 +
 5 files changed, 15 insertions(+), 6 deletions(-)

--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -108,6 +108,7 @@ config S390
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_RANDOM_ENTROPY
 	select ARCH_HAS_SCALED_CPUTIME
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
--- /dev/null
+++ b/arch/s390/include/asm/random.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_S390_RANDOM_H
+#define _ASM_S390_RANDOM_H
+
+#include <asm/timex.h>
+
+static inline unsigned long random_get_entropy(void)
+{
+	return (unsigned long)get_tod_clock_monotonic() >> 2;
+}
+
+#endif
--- a/arch/s390/include/asm/timex.h
+++ b/arch/s390/include/asm/timex.h
@@ -219,12 +219,6 @@ static inline unsigned long get_tod_cloc
 	return tod;
 }
 
-static inline cycles_t get_cycles(void)
-{
-	return (cycles_t)get_tod_clock_monotonic() >> 2;
-}
-#define get_cycles get_cycles
-
 /**
  * tod_to_ns - convert a TOD format value to nanoseconds
  * @todval: to be converted TOD format value
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -50,6 +50,7 @@
 #include <asm/irq_regs.h>
 #include <asm/vtimer.h>
 #include <asm/stp.h>
+#include <asm/timex.h>
 #include <asm/cio.h>
 #include "entry.h"
 
--- a/arch/s390/kernel/vtime.c
+++ b/arch/s390/kernel/vtime.c
@@ -14,6 +14,7 @@
 #include <linux/time.h>
 #include <asm/alternative.h>
 #include <asm/cputime.h>
+#include <asm/timex.h>
 #include <asm/vtimer.h>
 #include <asm/vtime.h>
 #include <asm/cpu_mf.h>


