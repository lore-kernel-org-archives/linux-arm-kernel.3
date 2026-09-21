Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A33AC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS32Dx5IynGZ/Y/2aGGAGztAdcoBdPlUNApcd4RXZUY=; b=xwoCtfXFgfuf9bR6vZ8jl5OKof
	W2QM+LSJlK97dhXEtIsCH+iYejPFY+Q0ArXPFeyPPPLSzEdvaB13ex1JhLptZmaHLVY4Jmb64kbV1
	ZFoj9W8DgKAkZkW+23FMx3L+SXHAAGMxt+CpNraCz9NaQe2V/CjptJnU8kstA9iWp2pwSMYthxcf2
	p4ik88X8QWDIijUxmjiVImr6njJnb6/57FmOPyOyvUHfKBKN2bBPBh6OiIbikgyXheKbvwF0YHPpC
	jnz9fJ6bBFUFCTAB8ww8BvNITcatgJP0mnritUnc3vnlN6AIOJzgn4/m4xVRQkAAurlBqyCIZEFlr
	WzL8VK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c2A-00000001s5c-1kGy;
	Mon, 21 Sep 2026 11:18:06 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8c24-00000001s1y-2a0t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:18:05 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed1368so33830565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989480; x=1790594280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS32Dx5IynGZ/Y/2aGGAGztAdcoBdPlUNApcd4RXZUY=;
        b=gOZQDFRFBmThMNgg5jFBbBXh70sifPG090Ie6w2JMSUWbUIQA24i0F8hWq9mWlLp7f
         C2RSZHfHsPL5BiOY5DeEdjqsvew7cOEllec2Dn9G3u9ukesUDZpT2cnrr3+Bu291edxN
         dmhTIwfPb4In41Hc3TrugoLqS17OmifGKMvvo5e83ukt4X9FUHdbP8htyHoxB2YCAvH6
         cWJJOPRuEZPvULsysJCuK7Wr2rVWMk8VNSc6QfZO7O7MMKOc+yne1jZTyig6ueZlWLXW
         EbCYrh1hFzwOeYEp3eUlvEaIKxaPRpCErLzKyUtWCeXdLnDQ2LGO+UnruWzKPIPgaBij
         kX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989480; x=1790594280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jS32Dx5IynGZ/Y/2aGGAGztAdcoBdPlUNApcd4RXZUY=;
        b=ouAg5ub7EL8eSZWjfr3qlyP+AMJnKuHCOggEmAOjubkrfo52jAKYgdECZhHlLVTAaN
         JXPG1zgOqLMQPkigLL4lgugaikHrBYdocNumbV9Elc6mct0fwoW1u7FHXkt5znw5LJDs
         i7Jnf8lf7/RFlFhhMYG6rtZlFeTdA/wPxuE3EpZt2NSrwmkF36c8vrawy4NkcqeW/B/B
         QFCAf7+BhxrnNeq0zpvbFGodiRAG0tlbLbo9VIunA566tOW70SkJ355G16SICvio+5gq
         Wdcff++3eF0w55s2GDITJCq47ZP60TlSNHYv/WJv5gRe8DJL3zSlP6boEfXZU4ebsBLv
         5GnQ==
X-Forwarded-Encrypted: i=1; AKwUvByK3h8QdiLi9pmx6VhQuyP57pjx+6hDCKOS5EFXoauqJsTmk63RIZUlH4ag/yfCAm0HSV3Vmt1Jz0qGyCo4zI0n@lists.infradead.org
X-Gm-Message-State: AFuF++koWT3t+xrb9iKx99dea6NCnebzySsUNlyFU+qTjR/kv8O4yUNR
	zPDzJgV9HIEFBn8Eh1I9oISC6LK8P53s+JdCf3QhphoXpvEv/CZiRu+jEbJEMMWXntg=
X-Gm-Gg: AYBFou11XRu9Tv3nD+FD/eJjwaeCRnd/6tIRcdckIfg7zmbtY9Q8rgHpjSnwzwxbUV1
	tQetTgNkGK6j3ihQHQmSFflb7kPZ3Fp14MmFnL6/OApLDU+b3BxzWU0Xc/Z9P5zG66EzT5f1dRT
	sGS78KUuoneJMss2toG/Oy8tlcV3HnHDEDD986gpP5zp9n5H05/JnDWGhZhI3HwEtO5tGuyd2ZN
	khJRE5Jm6l0LMypXQmpEDtW5ozDTbM+NQVOVqk7XtdXcKVZ20ci5usRLqgjx6Ig4jzl3KMpBbD8
	EUYx6nTVTFRxlgLV2wJ6ZZFqhZjYQGKdBO76WhBtubiZzlMfWpfPZkVvmFDQ1Y4yJc0h9OgGz0b
	1yNImIT9x5SQxyYWZYakYxXKgLgOSbUIpAFCDGmfVzla5x1Su/FAF4xaFuHNk8Vea9nDwNB0lws
	IRWLNDm/WVZUM6vH8tTlSlyZoCe4ofDVzRRNeupy0xyVWikdbvLjrV6Zch+ge/WUPXOcyZlUF/H
	449U8uos4cVmQ4Lq7zrGS14aM+yptNWQ5Q=
X-Received: by 2002:a17:903:1112:b0:2dd:c053:c20a with SMTP id d9443c01a7336-2ddc053c2a1mr103690755ad.38.1789989479599;
        Mon, 21 Sep 2026 04:17:59 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.17.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:17:59 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 RESEND 6/9] perf: RISC-V: support callchains with SSE delivery
Date: Mon, 21 Sep 2026 19:15:03 +0800
Message-ID: <270f3bcd3a9933c8be59492ae4d7c6ff2414d7d7.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_041801_592878_BBBC0E15 
X-CRM114-Status: GOOD (  23.43  )
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

PMU overflow delivery through SSE enters Linux with a synthetic supervisor
context on a dedicated event stack. The perf unwinder must use the context
interrupted by the overflow rather than treating the SSE handler frame as
the sampled frame.

Use the interrupted pt_regs published by the RISC-V SSE entry path. Walk a
kernel callchain only when the interrupted PC, SP, and frame pointer are
consistent with the current task stack. For sensitive entry windows and
IRQ stacks whose bounds cannot be proven, retain the interrupted PC without
following an unsafe frame chain.

User callchains continue through the existing nofault RISC-V user unwinder.
If hstatus.SPV says the interrupted context was a guest, do not interpret
the guest stack through the host address space.

DWARF callchains additionally copy a raw user stack. The generic
arch_perf_out_copy_user() implementation can take an exception-table
handled fault when a source page is not resident. Repeated nested faults
from the SSE handler can corrupt the interrupted kernel context under load.

Provide an SSE-specific RISC-V copy path. Verify that the active page table
belongs to current, use fast-only GUP to acquire each resident source page
without falling back to a faulting slow path, and copy through the kernel
mapping while holding the page reference. Stop at the first unavailable
page and preserve perf's existing truncated-user-stack semantics. Keep the
generic in-atomic user copy unchanged outside an SSE handler.

Susheng Yang reported this failure with perf callchain workloads.

Reported-by: Susheng Yang <yang.susheng@zte.com.cn>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/perf_event.h |  10 ++
 arch/riscv/kernel/perf_callchain.c  | 142 ++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index bcc928fd3785..ddc404794751 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -18,6 +18,16 @@
 	(regs)->sp = current_stack_pointer; \
 	(regs)->status = SR_PP; \
 }
+
+#ifdef CONFIG_RISCV_SBI_SSE
+/*
+ * Raw user-stack sampling can run in the NMI-like SSE context. Route it
+ * through an implementation that does not fault on a non-resident page.
+ */
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n);
+#define arch_perf_out_copy_user riscv_perf_out_copy_user
+#endif
 #endif
 
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..ec75689c7aec 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
+#include <linux/kallsyms.h>
+#include <linux/mm.h>
 #include <linux/perf_event.h>
+#include <linux/sched/task_stack.h>
+#include <linux/thread_info.h>
 #include <linux/uaccess.h>
 
+#include <asm/csr.h>
+#include <asm/sse.h>
 #include <asm/stacktrace.h>
 
 static bool fill_callchain(void *entry, unsigned long pc)
@@ -11,6 +17,128 @@ static bool fill_callchain(void *entry, unsigned long pc)
 	return perf_callchain_store(entry, pc) == 0;
 }
 
+#ifdef CONFIG_RISCV_SBI_SSE
+static bool sse_addr_on_task_stack(unsigned long addr, unsigned long size)
+{
+	unsigned long end = addr + size;
+	unsigned long stack;
+
+	if (end < addr)
+		return false;
+
+	stack = (unsigned long)task_stack_page(current);
+	if (addr >= stack && end <= stack + THREAD_SIZE)
+		return true;
+
+	return false;
+}
+
+static bool sse_kernel_regs_safe(struct pt_regs *regs)
+{
+	unsigned long fp = frame_pointer(regs);
+	unsigned long pc = instruction_pointer(regs);
+	unsigned long sp = user_stack_pointer(regs);
+
+	if (!__kernel_text_address(pc))
+		return false;
+	if (!sse_addr_on_task_stack(sp, sizeof(unsigned long)))
+		return false;
+	if (fp < sizeof(struct stackframe))
+		return false;
+
+	return sse_addr_on_task_stack(fp - sizeof(struct stackframe),
+				      sizeof(struct stackframe));
+}
+
+static bool sse_callchain_is_guest(const struct riscv_sse_interrupted_context *context)
+{
+	return context && (context->hstatus & HSTATUS_SPV);
+}
+
+static bool sse_callchain_kernel(struct perf_callchain_entry_ctx *entry,
+				 struct pt_regs *regs)
+{
+	const struct riscv_sse_interrupted_context *context;
+	unsigned long pc;
+
+	context = riscv_sse_get_interrupted_context();
+	if (!context || context->regs != regs)
+		return false;
+
+	/* A guest stack cannot be walked using the host kernel address space. */
+	if (sse_callchain_is_guest(context))
+		return true;
+
+	if (user_mode(regs))
+		return true;
+
+	if (sse_kernel_regs_safe(regs)) {
+		walk_stackframe(NULL, regs, fill_callchain, entry);
+		return true;
+	}
+
+	/*
+	 * Keep the sample useful for sensitive entry paths and IRQ stacks. The
+	 * generic walker does not take explicit IRQ stack bounds, and its
+	 * THREAD_SIZE alignment assumption fails for non-vmapped IRQ stacks.
+	 * Conservatively avoid walking IRQ stacks in every configuration.
+	 */
+	pc = instruction_pointer(regs);
+	if (__kernel_text_address(pc))
+		perf_callchain_store(entry, pc);
+
+	return true;
+}
+
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n)
+{
+	unsigned long addr = (unsigned long)src;
+	unsigned long copied = 0;
+
+	/* Keep the generic fast path unchanged outside an SSE handler. */
+	if (!riscv_sse_get_interrupted_context()) {
+		unsigned long ret;
+
+		pagefault_disable();
+		ret = __copy_from_user_inatomic(dst, src, n);
+		pagefault_enable();
+		return ret;
+	}
+
+	if (!access_ok(src, n))
+		return n;
+
+	/* Do not sample user memory through an unrelated active page table. */
+	if (!current->mm ||
+	    (csr_read(CSR_SATP) & SATP_PPN) != virt_to_pfn(current->mm->pgd))
+		return n;
+
+	while (copied < n) {
+		unsigned long offset = offset_in_page(addr);
+		unsigned long chunk = min(n - copied, PAGE_SIZE - offset);
+		struct page *page;
+
+		/*
+		 * Fast-only GUP cannot fault. This follows perf_virt_to_phys():
+		 * local interrupts remain disabled throughout SSE processing, so a
+		 * concurrent unmap cannot complete its TLB teardown before this
+		 * temporary reference is put.
+		 */
+		if (!get_user_page_fast_only(addr, 0, &page))
+			break;
+
+		memcpy((char *)dst + copied,
+		       (char *)page_address(page) + offset, chunk);
+		put_page(page);
+		addr += chunk;
+		copied += chunk;
+	}
+
+	return n - copied;
+}
+#endif
+
 /*
  * This will be called when the target is in user mode
  * This function will only be called when we use
@@ -28,6 +156,15 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	const struct riscv_sse_interrupted_context *context;
+
+	context = riscv_sse_get_interrupted_context();
+	/* A guest stack cannot be walked using the host address space. */
+	if (sse_callchain_is_guest(context))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
@@ -39,6 +176,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	if (sse_callchain_kernel(entry, regs))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
-- 
2.50.1 (Apple Git-155)


