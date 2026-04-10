Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E010FF4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=AqOQD77ovJbDZAalLb7LttNXWfQNwpbHnO0m4lNbaKQ=; b=lV62CT6x0b8u4O
	L71zZVWFMC6CUWMItmbDwq2chbeJaauXTZgqNzi5nq+L4aYRXwgu9oZlXT0EbAwKdpo8AkeeYqCGl
	0T6Ynyn0ReKGGM5kyf8AvXIFi0DoZOE02DJDksuUb9zW9GiyuCjCNOPVqlcTVtu5+iPIzMZIVQNNB
	tMDyYawlZ+1QhAMkl2vAUfHboRCPk2hYtkb9NxBKTBIeHFpA1WdOYPsSBh/GgiTcYUzntciTsn0+c
	i5wgXaWQZwbRHzIPMpMQbVjkbMnq1laOTPy5p+eIkl/RqmVWRnRL0AY17sU3SddG5le2uL6ceSRNE
	vT+zeGdaqEL96HQ5hTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqZ-0000000CBOI-3yNn;
	Fri, 10 Apr 2026 12:20:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqY-0000000CBJd-079Y;
	Fri, 10 Apr 2026 12:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=AqOQD77ovJbDZAalLb7LttNXWfQNwpbHnO0m4lNbaKQ=; b=Hv69XrbVAw7ELfYPhUkH4MJ5Pw
	cD42l2/y6+bFnN2DzvGod29q7qjUQ7nq6wNZBuIcKBzi0PKY2te9bFKWR9WFhf61/+iZDKPzKLt0Y
	tEVGdRAKoj1yzoSxl/Wqde0SMNwMkohihiqyCSNeNlkfwpN6A6d26PwX2QX2gvG1IGgsP3cGqzPKO
	TjUFbPLMlkNd0HUyABKh0C1IM6cLhk554NKdoSLNZaKXAfJic0SuaCQOtFeoOw2qwjmXLNMAv98mP
	qysW/rPhWMJVrTaLVCg7elboSrTXfJ+iAOO/F2WgnK2gWaDf0hY5HAXNaNJeI7MV1E3Y7cYf5TUz/
	UsxYCeAQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqT-0000000DR0a-0yba;
	Fri, 10 Apr 2026 12:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 806A043DD1;
	Fri, 10 Apr 2026 12:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E21BC19421;
	Fri, 10 Apr 2026 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823619;
	bh=qm3xQcBXEr96lL4hegVcj0UIOMtgXH0StGBPsgVLlKQ=;
	h=Date:From:To:Cc:Subject:References:From;
	b=C7az2CYXx68wjErxLRkuWTeHqh2CiNCWSqYoEW7CDASKgYcRJIgZbMFxC0wyGwYuo
	 q2wWS5Il3rSZIvkXMrziJDymJeOKDwzCu+GiLTUQ15ObFw+7EBHLm3ubP5lL1H6hxr
	 ReCtVW/VKZ0Y6HBv+Xxa78vZHjPEyhGg6WzSGQLG1W0Tyuqe7kgGZgc8KKs+JzIX6a
	 qzTQ3qBxeH5MKjO5ANy/+fOcCKNQ7HWyamJ7hE6VNKzzJsl13+xyi236101/gCvlT5
	 hn6GusmLxuTParC929bCg39takaaNPRV5A3bS+11CTndJSbqW1MjcdkxKmUqQfmLua
	 lqUqNEa3EnLWw==
Date: Fri, 10 Apr 2026 14:20:16 +0200
Message-ID: <20260410120319.064561422@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
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
Subject: [patch 22/38] random: Provide CONFIG_ARCH_HAS_RANDOM_ENTROPY
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_132021_668582_A4CD9B01 
X-CRM114-Status: GOOD (  14.50  )
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

Chasing down to what random_get_entropy() resolves is a 'spot the mouse'
game through a maze of #ifdeffery. Also the placement in timex.h is
non-obvious and has just been chosen because it provides conveniant access
to the underlying get_cycles() #ifdeffery.

Provide a config switch which is selectable by the architecture and a
temporary #ifdef guard in timex.h. Architectures which select the config
switch must provide asm/random.h with the architecture specific
implementation.

Update all usage sites to include linux/random.h so that the gradual
conversion does not cause build regressions.

This is part of a larger effort to remove get_cycles() usage from
non-architecture code.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
---
 arch/Kconfig                     |    3 +++
 arch/loongarch/kernel/relocate.c |    1 +
 arch/mips/kernel/relocate.c      |    1 +
 crypto/jitterentropy-kcapi.c     |    1 +
 include/linux/random.h           |   15 +++++++++++++++
 include/linux/timex.h            |    2 ++
 kernel/kcsan/core.c              |    1 +
 7 files changed, 24 insertions(+)

--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -370,6 +370,9 @@ config ARCH_HAS_CPU_FINALIZE_INIT
 config ARCH_HAS_DELAY_TIMER
 	bool
 
+config ARCH_HAS_RANDOM_ENTROPY
+	bool
+
 # The architecture has a per-task state that includes the mm's PASID
 config ARCH_HAS_CPU_PASID
 	bool
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/printk.h>
 #include <linux/panic_notifier.h>
+#include <linux/random.h>
 #include <linux/start_kernel.h>
 #include <asm/bootinfo.h>
 #include <asm/early_ioremap.h>
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -19,6 +19,7 @@
 #include <linux/libfdt.h>
 #include <linux/of_fdt.h>
 #include <linux/panic_notifier.h>
+#include <linux/random.h>
 #include <linux/sched/task.h>
 #include <linux/start_kernel.h>
 #include <linux/string.h>
--- a/crypto/jitterentropy-kcapi.c
+++ b/crypto/jitterentropy-kcapi.c
@@ -42,6 +42,7 @@
 #include <linux/fips.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/time.h>
 #include <crypto/internal/rng.h>
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -139,4 +139,19 @@ int random_online_cpu(unsigned int cpu);
 extern const struct file_operations random_fops, urandom_fops;
 #endif
 
+unsigned long random_get_entropy_fallback(void);
+
+/*
+ * random_get_entropy() is used by the /dev/random driver in order to extract
+ * entropy via the relative unpredictability of when an interrupt takes places
+ * versus a high speed, fine-grained timing source or cycle counter.  Since it
+ * will be occurred on every single interrupt, it must have a very low
+ * cost/overhead.
+ *
+ * If an architecture does not provide it, then use random_get_entropy_fallback().
+ */
+#ifdef CONFIG_ARCH_HAS_RANDOM_ENTROPY
+#include <asm/random.h>
+#endif
+
 #endif /* _LINUX_RANDOM_H */
--- a/include/linux/timex.h
+++ b/include/linux/timex.h
@@ -66,6 +66,7 @@ unsigned long random_get_entropy_fallbac
 
 #include <asm/timex.h>
 
+#ifndef CONFIG_ARCH_HAS_RANDOM_ENTROPY
 #ifndef random_get_entropy
 /*
  * The random_get_entropy() function is used by the /dev/random driver
@@ -85,6 +86,7 @@ unsigned long random_get_entropy_fallbac
 #define random_get_entropy()	random_get_entropy_fallback()
 #endif
 #endif
+#endif
 
 /*
  * SHIFT_PLL is used as a dampening factor to define how much we
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -18,6 +18,7 @@
 #include <linux/moduleparam.h>
 #include <linux/percpu.h>
 #include <linux/preempt.h>
+#include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/string.h>
 #include <linux/uaccess.h>


