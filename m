Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290D8CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOynkzgA4bQwckFWzlp5J6fVHPoziG2ITy2iJkH3gtM=; b=o2FUbSaz8a+at5TfF1luVlFDK+
	r1JrvmV5aS9ctM8Fpg2uEKGCwZfm0VIBbpl6RNl2OLbjpK+1IyHaBl2gIsBNROwi+U7jGTutLTDjV
	nbtpSKoWqIU1/DgW9N5hTDI4UznDyVite9ELIxDvCBxyukDqyDR0Et85/7AgOXlNGSaIBswxFlcOj
	Ok6/PjmJ90iQXMPz85TnsMi9fIg4oKeyCoPPpCn+zcU6DAz9GKwnwvso8yg8nl6cdp2gy7SsREwza
	FaRGjTEhrx3LUMtNpj9D3GMob+oEmPpCqPPF+0sE5QkPNe5sc91Fc+BUq3M/pLh14UmWAuD5nton4
	AfZniQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHd-00000000OgU-0Ie5;
	Tue, 19 May 2026 06:50:29 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHS-00000000OXp-0FUI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:50:19 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c81086bf930so2655750a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779173416; x=1779778216; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOynkzgA4bQwckFWzlp5J6fVHPoziG2ITy2iJkH3gtM=;
        b=t1sl4X8u3D0Cgu+r97C7DfBoKRSKQl/2bs6P/K3xJxXxT5DkeVCgGhsebKMlLMVV7k
         w0T7AwedIaIvvI6aS6y4q5Nj2MwLe8EJp2fEhG45uU7BEISYlE8zKDMWcjLDZwz7ErR/
         m0bvKOrzjFiuK9Ll2Rvs0qrdiLkT64v+WXws14nq7pZO93DEiUWU01g5q6mwWb3ZmjG2
         7KbMhsW1nI9XlDhuDz3jF4gZPd7Ni4avcmNs0lJ+82ECihKIBQKNIkDEJ0Crp6bhPYeL
         IB/zXxpWXuc/EI0faHJ9xgs89pf/EYDyG8B9Nz6+8E6JHtPFQg4hnnP0VzktkWH2Lu9i
         bQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173416; x=1779778216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOynkzgA4bQwckFWzlp5J6fVHPoziG2ITy2iJkH3gtM=;
        b=lPbR/+XHjbcoXSmTDVk+qPhCz/58n7IsYzXb45duFxgwiTDmxzoyg+24Y9eVaadOIG
         2oUrzqzOAwAMWPtpKREqdQpz472asbVIP7Sc06vx0XrhA3t7JYEt6InzdCXHBWRHzNiu
         Y5lO2pjZMhn4+vgpVwbgt7wRr1t6BaZSTDOVRBrFNl1RHjWcpWQbIElMh1VkQ0mtrjNf
         ZYG8wKOiaBBI4nAL1z/pWq/7Cz8VmwsdrMPhKnjN08ig1LdvzG4E4n2RmgD0ckbaD3LS
         3CB8zqS2jw7WCKFJIP5IT8Yp3MepN/MVCM6DmwvCPoIf8+SCUSstjfxBFraFbZrA4hbD
         yybg==
X-Forwarded-Encrypted: i=1; AFNElJ/aNKHGBHjj30QRDU90vnGUI9bmk3z1YCc3J2BLjFkC1pcZcxUYWzIoV9eNMct2Lnf6ZnGH3zPg2u+8dS5G8856@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyl3+hm4AJoVtQ1wzGIadGgJ3obaYJ9VxlLjwdq1DJJMa6ODRl
	1JczzOq7fFppCxMBLa7Wv3DCoQT/h6atZUb0dTjIP3PELO7p3Fr0YWyAAV62GWYWPYHIQ7E4fvR
	3dm6eouDFv1pEA+HD/LgC0SXJRA==
X-Received: from pgbcz13.prod.google.com ([2002:a05:6a02:230d:b0:c79:81bb:79ef])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3ca5:b0:399:831:cc29 with SMTP id adf61e73a8af0-3b22d3ecaddmr16431885637.23.1779173416349;
 Mon, 18 May 2026 23:50:16 -0700 (PDT)
Date: Tue, 19 May 2026 06:49:47 +0000
In-Reply-To: <20260519064950.493949-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260519064950.493949-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519064950.493949-7-dylanbhatch@google.com>
Subject: [PATCH v6 6/9] arm64/module, sframe: Add sframe support for modules
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_235018_105773_EE95BA7B 
X-CRM114-Status: GOOD (  22.20  )
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

Add sframe table to mod_arch_specific and support sframe PC lookups when
an .sframe section can be found on incoming modules. SFRAME_F_FDE_SORTED
is not set for module .sframe, so FDES are sorted right after the sframe
header is read.

Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/module.h |  6 +++
 arch/arm64/kernel/module.c      |  8 +++
 include/linux/sframe.h          |  3 ++
 kernel/unwind/sframe.c          | 90 +++++++++++++++++++++++++++++++--
 4 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb1..07f309c51eee 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -6,6 +6,7 @@
 #define __ASM_MODULE_H
 
 #include <asm-generic/module.h>
+#include <linux/sframe.h>
 
 struct mod_plt_sec {
 	int			plt_shndx;
@@ -17,6 +18,11 @@ struct mod_arch_specific {
 	struct mod_plt_sec	core;
 	struct mod_plt_sec	init;
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	struct sframe_section sframe_sec;
+	bool sframe_init;
+#endif
+
 	/* for CONFIG_DYNAMIC_FTRACE */
 	struct plt_entry	*ftrace_trampolines;
 	struct plt_entry	*init_ftrace_trampolines;
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 24adb581af0e..427f187e9531 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -18,6 +18,7 @@
 #include <linux/moduleloader.h>
 #include <linux/random.h>
 #include <linux/scs.h>
+#include <linux/sframe.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
@@ -515,5 +516,12 @@ int module_finalize(const Elf_Ehdr *hdr,
 		}
 	}
 
+	s = find_section(hdr, sechdrs, ".sframe");
+	if (s) {
+		struct module_memory *t = &me->mem[MOD_TEXT];
+
+		sframe_module_init(me, (void *)s->sh_addr, s->sh_size,
+				   t->base, t->size);
+	}
 	return module_init_ftrace_plt(hdr, sechdrs, me);
 }
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index 5b7341b61a7c..27f5a66190af 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -28,6 +28,7 @@ struct sframe_section {
 	unsigned long		fres_start;
 	unsigned long		fres_end;
 	unsigned int		num_fdes;
+	bool			fdes_sorted;
 
 	signed char		ra_off;
 	signed char		fp_off;
@@ -80,6 +81,8 @@ extern int sframe_find_kernel(unsigned long ip, struct unwind_frame *frame);
 #else
 
 static inline void __init init_sframe_table(void) {}
+static inline void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
+				      void *text, size_t text_size) {}
 
 #endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
 
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index c8ec1e9989fc..dfa013450705 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -12,6 +12,7 @@
 #include <linux/mm.h>
 #include <linux/string_helpers.h>
 #include <linux/sframe.h>
+#include <linux/sort.h>
 #include <linux/syscalls.h>
 #include <linux/unwind_types.h>
 #include <asm/unwind_sframe.h>
@@ -186,6 +187,9 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 	struct sframe_fde_v3 *first, *low, *high, *found = NULL;
 	int ret;
 
+	if (!sec->fdes_sorted)
+		return -EINVAL;
+
 	first = (void *)sec->fdes_start;
 	low = first;
 	high = first + sec->num_fdes - 1;
@@ -740,7 +744,6 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (shdr.preamble.magic != SFRAME_MAGIC ||
 	    shdr.preamble.version != SFRAME_VERSION_3 ||
-	    !(shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
 	    !(shdr.preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr.auxhdr_len) {
 		dbg_sec("bad/unsupported sframe header\n");
@@ -770,6 +773,7 @@ static int sframe_read_header(struct sframe_section *sec)
 		return -EINVAL;
 	}
 
+	sec->fdes_sorted	= shdr.preamble.flags & SFRAME_F_FDE_SORTED;
 	sec->num_fdes		= num_fdes;
 	sec->fdes_start		= fdes_start;
 	sec->fres_start		= fres_start;
@@ -984,10 +988,27 @@ SYSCALL_DEFINE5(stacktrace_setup, int, op, unsigned long, addr_start,
 
 int sframe_find_kernel(unsigned long ip, struct unwind_frame *frame)
 {
-	if (!frame || !sframe_init)
+	struct sframe_section *sec;
+
+	if (!frame)
 		return -EINVAL;
 
-	return  __sframe_find(&kernel_sfsec, ip, frame);
+	if (is_ksym_addr(ip)) {
+		if (!sframe_init)
+			return -EINVAL;
+
+		sec = &kernel_sfsec;
+	} else {
+		struct module *mod;
+
+		mod = __module_address(ip);
+		if (!mod || !mod->arch.sframe_init)
+			return -EINVAL;
+
+		sec = &mod->arch.sframe_sec;
+	}
+
+	return  __sframe_find(sec, ip, frame);
 }
 
 void __init init_sframe_table(void)
@@ -1004,4 +1025,67 @@ void __init init_sframe_table(void)
 	sframe_init = true;
 }
 
+static int sframe_sort_cmp_fde(const void *a, const void *b)
+{
+	const struct sframe_fde_v3 *fde_a = a, *fde_b = b;
+	unsigned long func_start_a, func_start_b;
+
+	func_start_a = (unsigned long)fde_a + fde_a->func_start_off;
+	func_start_b = (unsigned long)fde_b + fde_b->func_start_off;
+
+	return cmp_int(func_start_a, func_start_b);
+}
+
+static void sframe_sort_swap_fde(void *a, void *b, int size)
+{
+	struct sframe_fde_v3 *fde_a = a, *fde_b = b;
+	struct sframe_fde_v3 temp;
+	long delta;
+
+	/* Swap potentially unaligned FDE */
+	memcpy(&temp, fde_a, sizeof(struct sframe_fde_v3));
+	memcpy(fde_a, fde_b, sizeof(struct sframe_fde_v3));
+	memcpy(fde_b, &temp, sizeof(struct sframe_fde_v3));
+
+	/* Adjust FDE function start offset from FDE */
+	delta = (long)((unsigned long)fde_b - (unsigned long)fde_a);
+	fde_a->func_start_off += delta;
+	fde_b->func_start_off -= delta;
+}
+
+static int sframe_sort_fdes(struct sframe_section *sec)
+{
+	void *fdes = (void *)sec->fdes_start;
+	size_t num_fdes = sec->num_fdes;
+
+	if (sec->sec_type != SFRAME_KERNEL)
+		return -EINVAL;
+	if (sec->fdes_sorted)
+		return 0;
+
+	sort(fdes, num_fdes, sizeof(struct sframe_fde_v3),
+	     sframe_sort_cmp_fde, sframe_sort_swap_fde);
+	sec->fdes_sorted = true;
+	return 0;
+}
+
+void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
+			void *text, size_t text_size)
+{
+	struct sframe_section *sec = &mod->arch.sframe_sec;
+
+	sec->sec_type	 = SFRAME_KERNEL;
+	sec->sframe_start = (unsigned long)sframe;
+	sec->sframe_end   = (unsigned long)sframe + sframe_size;
+	sec->text_start   = (unsigned long)text;
+	sec->text_end     = (unsigned long)text + text_size;
+
+	if (WARN_ON(sframe_read_header(sec)))
+		return;
+	if (WARN_ON(sframe_sort_fdes(sec)))
+		return;
+
+	mod->arch.sframe_init = true;
+}
+
 #endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
-- 
2.54.0.563.g4f69b47b94-goog


