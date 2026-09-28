Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7398BCA5FA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvWsjS4kJdvoXcVGD6geTFWpf+d6azd0mBr60JzC1QM=; b=L5zKf/ee+nQfFd13q2I/qNtAke
	jozKXyHroqkIxZ1HyxEXDavUA/lXZ1kYm91wyT+MwsYiST6DE55EVYp3mikYJQXUjo88GpvT89KBe
	qVQEx1MjDgEO9FMwFeQlHAPeFrJWCiH7otzjLcc2h65eNNUon0/uCtaxacjF8zQWKOYzNDPJlmtTP
	5tTdUT+KyVio2DXsKfYuYMSbv+lZiMNTaEL6fbSTtQidAuTsed3bTYx/SXwY8d+Zm6itvjkFXTk/r
	4v5XreuG4/wXP819RrMjubHN3lkcjfkF5TEpzzug7bneRhEonCHCDkg7vQuiBogkcRjJlIhJiLzKN
	BdbrgNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFNh-00000001DNu-1mEo;
	Mon, 28 Sep 2026 17:43:13 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMf-00000001Cnm-2LkG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:42:11 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so50955945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617327; x=1791222127; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvWsjS4kJdvoXcVGD6geTFWpf+d6azd0mBr60JzC1QM=;
        b=UEvK1gb8CFguAsIcrH+Dl6UR8TzzVfNBvol2qvyMgH97eCSZ+TcFyTv85RFG7BzHKA
         KLz6GtsQYWU3UmUG03qas01HQsr0140KsI6L+aiamuu1QMS5h1ksq2H2FT3tDxcrqq0X
         3KTFDrpBWez0e4z9DLvqJB0KlCYdvG2XeYv2ZkNG7pAouw6a+5SwRNHALxZkvhiwL150
         llL46sYSz9veAQM5j6GSwoRRJLXUoTy1AFSW15por5ju5CBp7JYtj/C05sCA/agV85MT
         tAo3uUzIdS2FnniHukORoEpfMK8H3HI964LtmuTqfz68LtGmbyFpBeHDXosgzPrombAc
         g3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617327; x=1791222127;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GvWsjS4kJdvoXcVGD6geTFWpf+d6azd0mBr60JzC1QM=;
        b=rVaz+1PZlf6mVNWNo8b0UPXYcU5B6YzA8hm+drUTwyQVk0Au+dACw3SkZqAQfKJGSJ
         3ju9kWyqjuJg2Vjvj/6n8mmUlpuqWSsTn1I58YE6SukpgPVf9XpSEJlac89yPvPevq/K
         AvT5pksnv9laia5e7nSuE2595Abb02yvuBYkPH9iqOBt9YY/C5qkz1c9rRwCw6aos2wO
         rwfKwHfQJ/GuOrZ1F1ONptMXgZpLMUPzy6oP6faQAXYS50iIIMLKqFqAUJBYWnmD5uNZ
         LaWb2gg9/mEKDP8mcjRDAKWYhWXFn9TZMUEZYzjR5fxElya2iRsnEtUlSFdDLMkwgQbp
         CpFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzghgYcEui7fSiMTguGqlOZn7Svwro+3qPTDGxyZGldkYOTFruj5pxFNTnJqFLh/Aj5hZHI8qguvJUmX25nDhaL@lists.infradead.org
X-Gm-Message-State: AFuF++nxGAB17TBWayn7ZG+6LTSeEG9yccjnxQmZQyoW+hnzp2QjsvJu
	GT0Z+jvznsXB3LwoY+7KELyd4oC9uNJooXIoKAVeIzrRWTDWQ4vUO98Lk6VTjwNGhaFYnwKiUmG
	DwRuzFn5KudYSqg==
X-Received: from wmpr40.prod.google.com ([2002:a05:600c:3228:b0:49f:fde6:649f])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6287:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fe7babaadmr223084505e9.20.1790617327143;
 Mon, 28 Sep 2026 10:42:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:22 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-16-smostafa@google.com>
Subject: [RFC PATCH 15/15] arm64: mm: Set stack size from the kernel command line
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104209_638153_39B22ADB 
X-CRM114-Status: GOOD (  18.67  )
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

Select CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE for arm64 and override
arch_vm_stack_pages() to a value set from the command line, this
value have the following properties:
- Aligned to page size (doesn't need to be a power of 2), so it can
  be 12kB for example
- Min value is chosen to be 8kB
- Max value will be the default stack size on arm64 which is used to
  allocate the VA range for the kernel stack.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  7 ++++++
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/memory.h               | 12 ++++++++++
 arch/arm64/kernel/entry.S                     | 10 +++++---
 arch/arm64/kernel/setup.c                     | 24 +++++++++++++++++++
 5 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..e6ef22f01e01 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2920,6 +2920,13 @@ Kernel parameters
 
 	keepinitrd	[HW,ARM] See retain_initrd.
 
+	kernel_stack_pages=
+			[ARM64,EARLY]
+			Format: <integer>
+			Number of pages mapped for each task kernel stack.
+			The virtual area stays THREAD_SIZE and only its top
+			pages are mapped.
+
 	kernelcore=	[KNL,X86,PPC,EARLY]
 			Format: nn[KMGTPE] | nn% | "mirror"
 			This parameter specifies the amount of memory usable by
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 020fcaf36b1b..5e09ae904e34 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -58,6 +58,7 @@ config ARM64
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
+	select ARCH_HAS_VARIABLE_STACK_SIZE
 	select ARCH_HAVE_ELF_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_HAVE_TRACE_MMIO_ACCESS
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 4545d9b39bd5..1d300b16032d 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -113,6 +113,13 @@
 #define DIRECT_MAP_PHYSMEM_END	__pa(PAGE_END - 1)
 
 #define MIN_THREAD_SHIFT	(14 + KASAN_THREAD_SHIFT)
+#define MIN_KERNEL_STACK_SHIFT	(13 + KASAN_THREAD_SHIFT)
+
+#if (MIN_KERNEL_STACK_SHIFT < PAGE_SHIFT)
+#define MIN_KERNEL_STACK_SIZE	PAGE_SIZE
+#else
+#define MIN_KERNEL_STACK_SIZE	(UL(1) << MIN_KERNEL_STACK_SHIFT)
+#endif
 
 /*
  * VMAP'd stacks are allocated at page granularity, so we must ensure that such
@@ -130,6 +137,11 @@
 
 #define THREAD_SIZE		(UL(1) << THREAD_SHIFT)
 
+#ifndef __ASSEMBLY__
+extern unsigned long kernel_stack_pages;
+#define arch_vm_stack_pages()	(kernel_stack_pages)
+#endif
+
 #define THREAD_ALIGN		THREAD_SIZE
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index ea733b673970..39e68aace0a6 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -76,9 +76,13 @@
 	msr	spsel, #0
 	mov	x1, sp
 	msr	spsel, #1
-	sub	x1, x1, x0
-	cmp	x1, #THREAD_SIZE
-	b.lo	.Lstack_ok\@
+
+	add	x0, x0, #THREAD_SIZE
+	sub	x1, x0, x1
+	adr_l	x0, kernel_stack_pages
+	ldr	x0, [x0]
+	cmp	x1, x0, lsl #PAGE_SHIFT
+	b.ls	.Lstack_ok\@
 
 	/* Check whether we are on the IRQ, SDEI or EFI stacks. */
 	stp	x2, x30, [sp, #-16]!
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 29c6100f0c50..34559048dcca 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -278,6 +278,30 @@ u64 cpu_logical_map(unsigned int cpu)
 	return __cpu_logical_map[cpu];
 }
 
+unsigned long kernel_stack_pages __ro_after_init = THREAD_SIZE / PAGE_SIZE;
+
+static int __init setup_kernel_stack_pages(char *str)
+{
+	unsigned long min = MIN_KERNEL_STACK_SIZE / PAGE_SIZE;
+	unsigned long max = THREAD_SIZE / PAGE_SIZE;
+	unsigned long val;
+
+	if (!str)
+		return -EINVAL;
+
+	if (kstrtoul(str, 10, &val) || val < min || val > max) {
+		pr_err("Invalid kernel_stack_pages=%s, should be between %lu and %lu\n",
+		       str, min, max);
+		return 0;
+	}
+
+	kernel_stack_pages = val;
+	pr_info("Kernel stack size set to %lu KiB\n", (val * PAGE_SIZE) / SZ_1K);
+
+	return 0;
+}
+early_param("kernel_stack_pages", setup_kernel_stack_pages);
+
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
 {
 	setup_initial_init_mm(_text, _etext, _edata, _end);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


