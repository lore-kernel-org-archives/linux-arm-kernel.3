Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20A1C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTb/bQrCRYnLoC7JXti+nF/OM9r1CuOvnuv+yzx0Eyg=; b=SzcgUQCuezH37Q4iVFdv5wM+XQ
	icv74NCt/THB97AyLBdwzICJLRh9WqJ9PzRoeM5f76+HaDGAfUOHpraNaLrRj2PmVaVspUIp91r6Q
	gvbb/lGQVJnVWD5I562wZfeNG6XYNH5QBdieHM3YHWgDStfQrzHQ0JDIS6lsn045sZ7QZC4QcBIld
	qPqM3aBJnB/OToTinpzxXaU7lG8D/WQaRqmB5nAcWgJnrQMBflgJgj689Gl4u2jQ8VcQRLgOUelGB
	T2R5SXe1pP5Bn95s8H7nGU0L1N+v7lPbb5hr1E0JKJZ93usznAhSZAi6Kq+iVvDVY/PmzNskqlm/M
	+cgUi58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHt-0000000FeEE-36zl;
	Fri, 18 Sep 2026 22:42:33 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHZ-0000000FdyQ-3A59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:15 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2cfa4e4684bso28200045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771333; x=1790376133; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTb/bQrCRYnLoC7JXti+nF/OM9r1CuOvnuv+yzx0Eyg=;
        b=eDmpwrlX1vxHVSRv4N1vE43jsXXJQ74+sytaQLkBknh5Wzi3HQ7FkqLchaICYkxcQN
         WFASM0jCbmdWcAhOCky8iTKwSK94nSMGk9OZfKvh8zU/xbzA20d9PNxv1TLIos8Cnp65
         /F9TpketTE+NMaqMva+DUaOKKxX5/2EC8WIfbMNkkxq7ziMZCS94V1jIP1/sqIWdpb8f
         Mo55yv2qzHbqwTVpRvaILLQ8MkD0Rb91gTO8+iqkOtiGUC4iIoAxjUm+FbaIHaBYpR7X
         Sz95IiE/FnIcCNM/qmm1cULKB/9W4BKc6d2OntRvfVqX+n7ncTOjBK/GNEMu2SyOcyTU
         JEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771333; x=1790376133;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTb/bQrCRYnLoC7JXti+nF/OM9r1CuOvnuv+yzx0Eyg=;
        b=q58kjzZJ5A4Qqb8ku2b3Y+ZIAO6RCK5P96d9j5hikizNZQkWeTJyJ9M/aoWLHMtx5b
         0mtuxjIbqYlNsKNyR0Vf20WDdsQYbVILo38B+ZVkMsALyInaNdc/exz1Cu6jbZVNj0s+
         F4ZmrRFbwlwGHgsbMgtlNuoUflUUi/RnQF4+vq0ghnkyQ3kgUg5DtVZmNKRhXo5z+Khf
         wdcouqzzoPXeGdSUBvmoWMeVoR5RQ4S9RubyErt+RujPRt7AQCu4664lm7RfsOBih1Ql
         ysegQsGcGlsWE/RAa04fmYu/cZaCy8UnjDv9nfC5iB+i7SJb4327MXjmtYiiLxCJgvQ9
         osPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNBdUCAj3XipFUQHsZel43letjkClZ2b13OiXRlsivekgyW8pm+jQmk+ane+5PxK5b81OGehHMcOj+ohoi3ldk@lists.infradead.org
X-Gm-Message-State: AFuF++kyoModlTfRPRaQ1fQrUpbxBY/GPsUPH/Az1A/H2UjIuuxZw7xY
	c/+thO/IXxpwYJvH7JbpLGMkUch9AmAp3C85H0lKkjbH27wLnskOTlQVoGitwEAgOCVpzsaepaT
	IJ7hfgoSC+unlXBkq7tbCgljNRg==
X-Received: from pldy4.prod.google.com ([2002:a17:902:cac4:b0:2dc:ff56:3f4c])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c944:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2ddb1adf381mr78672525ad.7.1789771332693;
 Fri, 18 Sep 2026 15:42:12 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:51 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-6-dylanbhatch@google.com>
Subject: [PATCH v7 05/11] arm64/module, sframe: Add sframe support for modules
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
X-CRM114-CacheID: sfid-20260918_154213_799407_8625BE53 
X-CRM114-Status: GOOD (  23.56  )
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
is not set for module .sframe, so FDEs are sorted right after the sframe
header is read.

Co-developed-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v6:
 - (sashiko) Check section flag SHF_ALLOC before reading in module
   .sframe.
 - (sashiko) Use READ_ONCE/WRITE_ONCE to enforce memory barrier when
   checking mod->arch.sframe_init.
 - Change IP range checks to strictly check text sections of
   vmlinux/module (instead of is_ksym_addr(ip) / __module_address(ip)).
 - (sashiko) Check kernel_sfsec.fdes_sorted during init, since
   SFRAME_F_FDE_SORTED is no longer required (in order to support
   modules).
 - (sashiko) Drop WARN_ON to pr_warn() when module sframe header read
   fails.
 - Drop sec->sec_type check in sframe_sort_fdes(), return void.
---
 arch/arm64/include/asm/module.h |   6 ++
 arch/arm64/kernel/module.c      |   5 ++
 include/linux/sframe.h          |   7 +++
 kernel/unwind/sframe.c          | 105 ++++++++++++++++++++++++++++++--
 4 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb15..07f309c51eee6 100644
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
index 24adb581af0eb..69334e22be34e 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -18,6 +18,7 @@
 #include <linux/moduleloader.h>
 #include <linux/random.h>
 #include <linux/scs.h>
+#include <linux/sframe.h>
 
 #include <asm/alternative.h>
 #include <asm/insn.h>
@@ -515,5 +516,9 @@ int module_finalize(const Elf_Ehdr *hdr,
 		}
 	}
 
+	s = find_section(hdr, sechdrs, ".sframe");
+	if (s && (s->sh_flags & SHF_ALLOC))
+		sframe_module_init(me, (void *)s->sh_addr, s->sh_size);
+
 	return module_init_ftrace_plt(hdr, sechdrs, me);
 }
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index c1fe8ac7df7b3..58a68de1396af 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -15,6 +15,7 @@ struct sframe_section {
 	unsigned long	fres_start;
 	unsigned long	fres_end;
 	unsigned int	num_fdes;
+	bool		fdes_sorted;
 
 	signed char	ra_off;
 	signed char	fp_off;
@@ -23,12 +24,18 @@ struct sframe_section {
 extern struct sframe_section kernel_sfsec __ro_after_init;
 
 void __init init_sframe_table(void);
+void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size);
+
 extern int sframe_find(unsigned long ip, struct unwind_frame *frame);
 
 #else /* !CONFIG_UNWIND_SFRAME_LOOKUP */
 
 static inline void __init init_sframe_table(void) {}
+static inline void sframe_module_init(struct module *mod, void *sframe,
+				      size_t sframe_size) {}
+
 static inline int sframe_find(unsigned long ip, struct unwind_frame *frame) { return -EINVAL; }
+
 #endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
 
 #endif /* _LINUX_SFRAME_H */
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 9aac703f7ce6e..503d4a2beb50e 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -8,6 +8,7 @@
 #include <linux/mm.h>
 #include <linux/string_helpers.h>
 #include <linux/sframe.h>
+#include <linux/sort.h>
 #include <linux/unaligned.h>
 #include <linux/unwind_types.h>
 #include <linux/kallsyms.h>
@@ -94,6 +95,9 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 	struct sframe_fde_v3 *first, *low, *high, *found = NULL;
 	int ret;
 
+	if (!sec->fdes_sorted)
+		return -EINVAL;
+
 	first = (void *)sec->fdes_start;
 	low = first;
 	high = first + sec->num_fdes - 1;
@@ -405,12 +409,43 @@ static __always_inline int __sframe_find(struct sframe_section *sec,
 	return __find_fre(sec, &fde, ip, frame);
 }
 
+#ifdef CONFIG_MODULES
+
+static __always_inline int __sframe_find_module(unsigned long ip,
+						struct unwind_frame *frame)
+{
+	struct module *mod;
+
+	mod = __module_text_address(ip);
+	if (!mod || !READ_ONCE(mod->arch.sframe_init))
+		return -EINVAL;
+
+	return  __sframe_find(&mod->arch.sframe_sec, ip, frame);
+}
+
+#else
+
+static __always_inline int __sframe_find_module(unsigned long ip,
+						struct unwind_frame *frame)
+{
+	return -EINVAL;
+}
+
+#endif
+
 int sframe_find(unsigned long ip, struct unwind_frame *frame)
 {
-	if (!frame || !sframe_init)
+	if (!frame)
 		return -EINVAL;
 
-	return  __sframe_find(&kernel_sfsec, ip, frame);
+	if (is_kernel_text(ip) || is_kernel_inittext(ip)) {
+		if (!sframe_init)
+			return -EINVAL;
+
+		return __sframe_find(&kernel_sfsec, ip, frame);
+	}
+
+	return  __sframe_find_module(ip, frame);
 }
 
 static int sframe_read_header(struct sframe_section *sec)
@@ -429,7 +464,6 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (shdr->preamble.magic != SFRAME_MAGIC ||
 	    shdr->preamble.version != SFRAME_VERSION_3 ||
-	    !(shdr->preamble.flags & SFRAME_F_FDE_SORTED) ||
 	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr->auxhdr_len) {
 		pr_debug("bad/unsupported sframe header\n");
@@ -453,6 +487,7 @@ static int sframe_read_header(struct sframe_section *sec)
 		return -EINVAL;
 	}
 
+	sec->fdes_sorted	= shdr->preamble.flags & SFRAME_F_FDE_SORTED;
 	sec->num_fdes		= num_fdes;
 	sec->fdes_start		= fdes_start;
 	sec->fres_start		= fres_start;
@@ -469,10 +504,72 @@ void __init init_sframe_table(void)
 	kernel_sfsec.sframe_start	= (unsigned long)__start_sframe;
 	kernel_sfsec.sframe_end		= (unsigned long)__end_sframe;
 
-	if (sframe_read_header(&kernel_sfsec)) {
+	if (sframe_read_header(&kernel_sfsec) || !kernel_sfsec.fdes_sorted) {
 		pr_warn("invalid vmlinux SFrame header\n");
 		return;
 	}
 
 	sframe_init = true;
 }
+
+#ifdef CONFIG_MODULES
+
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
+static void sframe_sort_fdes(struct sframe_section *sec)
+{
+	void *fdes = (void *)sec->fdes_start;
+	size_t num_fdes = sec->num_fdes;
+
+	if (sec->fdes_sorted)
+		return;
+
+	sort(fdes, num_fdes, sizeof(struct sframe_fde_v3),
+	     sframe_sort_cmp_fde, sframe_sort_swap_fde);
+	sec->fdes_sorted = true;
+}
+
+void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size)
+{
+	struct sframe_section *sec = &mod->arch.sframe_sec;
+
+	sec->sframe_start = (unsigned long)sframe;
+	sec->sframe_end   = (unsigned long)sframe + sframe_size;
+
+	if (sframe_read_header(sec)) {
+		pr_warn("invalid SFrame header in module %s\n", mod->name);
+		return;
+	}
+	sframe_sort_fdes(sec);
+
+	/* Ensure SFrame is initialized when sframe_find() happens */
+	WRITE_ONCE(mod->arch.sframe_init, true);
+}
+
+#endif
-- 
2.55.0.1082.g2b9226bbc0-goog


