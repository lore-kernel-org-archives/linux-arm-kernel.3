Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8670ACA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0/74qP1zUPw49XwhZiSOI/DchmHGSPag2WK4nHiIiQ=; b=xqvuQpZonkxZ4uqVKBqx7qs2aJ
	onIbDMT1dPEXTirlEA/vGWvIVROAkglp3o8MxD/OoSM+84kzQKkURcoA40bFwyJ2xsDX9jxEWKXRO
	J14ZXtqM51edWxlQ6biISCCeDFcRjo7xwgzuuEb5DcKc9LSaxQDbKRsuivHHXhIdFaI7SKyAMIGZv
	kJyuY5SLfn89Q5UhWOrrEKyqwtb5uVIVRP8eYUvaruNiq0+P2NPW1Knd767A8k9Ej0mNJEBRCtO/a
	6LC5WUGvpwmNhRHBhJyaNWhfao9bk2yCz+/06VZDrlsEVQD1B85Qps8WSgSj4hCn1YVsxkavQ0DmV
	/Or9ISJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ40-00000002Mqf-0ZrK;
	Wed, 07 Oct 2026 11:44:00 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3x-00000002Mlz-03J9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:43:58 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so2407622a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373435; x=1791978235; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0/74qP1zUPw49XwhZiSOI/DchmHGSPag2WK4nHiIiQ=;
        b=h9bamp1Cv/GlKMx8iLpTObf2smdoUGNCy0fx1p4WD6ztIJ1x88h9f+n9vMHdek8lWp
         RrIzcWO5Zx/C51c1bYmQCw0PhrBtMu5u1Gug1kAjauJW7OrKLKAxVhcZgAVctoInLiHB
         RawYwPM5afj53pccxHTnlFhHMMHmjMUAP8CTKgrNdGdPbhiyxZd5jZQ5E45mj+qRPALv
         RF79Wf0tTsvMOwrs4xdXMPgFNnlbn0pPAiS2SyNvXoMhFnrNXeevQkPjyEvaSFZd32tv
         Bz192vsOOYmNdbBKsqevVS4cWszFcqtyUd13wXPhd8n6H//9OEtvONfJmqV7W9b/+CbT
         l06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373435; x=1791978235;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0/74qP1zUPw49XwhZiSOI/DchmHGSPag2WK4nHiIiQ=;
        b=mKPc7fV6YPrxLg5NysjeQlIGcZtWk33ZCmcUAW/P+SKOJpBMCoqjCOajoezM+HMH8I
         TGNZ1j4OH4GJb5BXohsjUcekmqGxkWZFY4Y4HwRgGHoiFdG15WC292993q0cAe49W8Mv
         yVXL+Ifc/rGq9eyB8GD5PXr9G+HfIEjmkhXHeAL5PKKL1o9XzAgfd3bsnY2hkaVyJYC8
         5dt1L2S7oXLdEq/dq7M2ghGFQ23YsASBds78Bo0eLwDSUtdltjVLAM/Z2nGJjYIbXVjX
         GJZ3x0YZKIFpjr3yTtA752QzOxJIZORmPiQioJBkWRzGCNOgfyp8El82dGwTgzMrqQfa
         LYvw==
X-Forwarded-Encrypted: i=1; AKwUvBxL6GgpTBSKdAb7ECOZ3NV/E6rqAyuWv/K7ZDd4hSQbG9+hJ2+JqJTozkr0nN4GxaP6QRlV58SwAJuxBunyY4bD@lists.infradead.org
X-Gm-Message-State: AFuF++kHD+bK1mZDC+GyeyKc4mceHtIBIUirCvbt16zCC3lPsYIHDNCA
	H8cTNR2ugWG5p3nGc2TI09aJdWhojEH0ASl0dToiTekQ6kkALOXf6C1jvGPwB6ucEQbwv6IW9II
	p3R6wJR3FyCLQBqoT6P67Xp6qdA==
X-Received: from pfcg21.prod.google.com ([2002:a05:6a00:23d5:b0:890:4202:a41d])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3995:b0:3e0:b937:8849 with SMTP id adf61e73a8af0-3e13403b4e6mr1538070637.29.1791373435257;
 Wed, 07 Oct 2026 04:43:55 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:29 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-6-dylanbhatch@google.com>
Subject: [PATCH v8 05/11] module, sframe: Add sframe support for modules
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
X-CRM114-CacheID: sfid-20261007_044357_072901_6A20D76D 
X-CRM114-Status: GOOD (  24.45  )
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

Add sframe table to struct module and support sframe PC lookups when an
.sframe section can be found on incoming modules. SFRAME_F_FDE_SORTED is
not set for module .sframe, so FDEs are sorted right after the sframe
header is read.

Co-developed-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v7:
- (sashiko) Move .sframe module init and sframe section fields to arch
  generic code.
- (sashiko) Make sframe_find() noinstr.
- (sashiko) Add preempt_notrace and instrumentation to
  __sframe_module_find() code path.
---
 arch/arm64/include/asm/module.h |   1 +
 include/linux/module.h          |   5 ++
 include/linux/sframe.h          |   9 +++
 kernel/module/main.c            |  21 ++++++
 kernel/unwind/Makefile          |   4 --
 kernel/unwind/sframe.c          | 118 ++++++++++++++++++++++++++++++--
 6 files changed, 149 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb15..51a8891c24e88 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -6,6 +6,7 @@
 #define __ASM_MODULE_H
 
 #include <asm-generic/module.h>
+#include <linux/sframe.h>
 
 struct mod_plt_sec {
 	int			plt_shndx;
diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea5..6b3f3d3cb3e8d 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -26,6 +26,7 @@
 #include <linux/rbtree_latch.h>
 #include <linux/error-injection.h>
 #include <linux/tracepoint-defs.h>
+#include <linux/sframe.h>
 #include <linux/srcu.h>
 #include <linux/static_call_types.h>
 #include <linux/dynamic_debug.h>
@@ -577,6 +578,10 @@ struct module {
 #ifdef CONFIG_DYNAMIC_DEBUG_CORE
 	struct _ddebug_info dyndbg_info;
 #endif
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	struct sframe_section sframe_sec;
+	bool sframe_init;
+#endif
 } ____cacheline_aligned __randomize_layout;
 #ifndef MODULE_ARCH_INIT
 #define MODULE_ARCH_INIT {}
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index c1fe8ac7df7b3..1aa3e07725f4d 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -2,9 +2,12 @@
 #ifndef _LINUX_SFRAME_H
 #define _LINUX_SFRAME_H
 
+#include <linux/elf.h>
 #include <linux/init.h>
 #include <linux/unwind_types.h>
 
+#include <asm-generic/module.h>
+
 #ifdef CONFIG_UNWIND_SFRAME_LOOKUP
 
 struct sframe_section {
@@ -15,6 +18,7 @@ struct sframe_section {
 	unsigned long	fres_start;
 	unsigned long	fres_end;
 	unsigned int	num_fdes;
+	bool		fdes_sorted;
 
 	signed char	ra_off;
 	signed char	fp_off;
@@ -23,12 +27,17 @@ struct sframe_section {
 extern struct sframe_section kernel_sfsec __ro_after_init;
 
 void __init init_sframe_table(void);
+void sframe_module_init(struct module *mod, void *addr, unsigned int size);
+
 extern int sframe_find(unsigned long ip, struct unwind_frame *frame);
 
 #else /* !CONFIG_UNWIND_SFRAME_LOOKUP */
 
 static inline void __init init_sframe_table(void) {}
+static inline void sframe_module_init(struct module *mod, void *addr, unsigned int size) {}
+
 static inline int sframe_find(unsigned long ip, struct unwind_frame *frame) { return -EINVAL; }
+
 #endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
 
 #endif /* _LINUX_SFRAME_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index c1b34dc1e89ac..8a4542b7e4a70 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -7,6 +7,7 @@
 
 #define INCLUDE_VERMAGIC
 
+#include <linux/elf.h>
 #include <linux/export.h>
 #include <linux/extable.h>
 #include <linux/moduleloader.h>
@@ -3008,6 +3009,23 @@ static void module_deallocate(struct module *mod, struct load_info *info)
 	free_mod_mem(mod);
 }
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+
+static void setup_sframe(struct module *mod, const struct load_info *info)
+{
+	unsigned int sframe_size;
+	void *sframe = section_objs(info, ".sframe", 1, &sframe_size);
+
+	if (sframe)
+		sframe_module_init(mod, sframe, sframe_size);
+}
+
+#else
+
+static void setup_sframe(struct module *mod, const struct load_info *info) {}
+
+#endif
+
 int __weak module_finalize(const Elf_Ehdr *hdr,
 			   const Elf_Shdr *sechdrs,
 			   struct module *me)
@@ -3027,6 +3045,9 @@ static int post_relocation(struct module *mod, const struct load_info *info)
 	/* Setup kallsyms-specific fields. */
 	add_kallsyms(mod, info);
 
+	/* Initialize sframe metadata. */
+	setup_sframe(mod, info);
+
 	/* Arch-specific module finalizing. */
 	return module_finalize(info->hdr, info->sechdrs, mod);
 }
diff --git a/kernel/unwind/Makefile b/kernel/unwind/Makefile
index c5d953e48fe82..13254e6a7bb6d 100644
--- a/kernel/unwind/Makefile
+++ b/kernel/unwind/Makefile
@@ -1,8 +1,4 @@
  obj-$(CONFIG_UNWIND_USER)		+= user.o deferred.o
 
  KCOV_INSTRUMENT_sframe.o	:= n
- KASAN_SANITIZE_sframe.o	:= n
- KCSAN_SANITIZE_sframe.o	:= n
-
- CFLAGS_REMOVE_sframe.o = $(CC_FLAGS_FTRACE)
  obj-$(CONFIG_UNWIND_SFRAME_LOOKUP)	+= sframe.o
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index ec81110a36796..33883408581da 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -6,8 +6,10 @@
 #define pr_fmt(fmt)	"sframe: " fmt
 
 #include <linux/mm.h>
+#include <linux/rcupdate.h>
 #include <linux/string_helpers.h>
 #include <linux/sframe.h>
+#include <linux/sort.h>
 #include <linux/unaligned.h>
 #include <linux/unwind_types.h>
 #include <linux/kallsyms.h>
@@ -95,6 +97,9 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 	struct sframe_fde_v3 *first, *low, *high, *found = NULL;
 	int ret;
 
+	if (!sec->fdes_sorted)
+		return -EINVAL;
+
 	first = (void *)sec->fdes_start;
 	low = first;
 	high = first + sec->num_fdes - 1;
@@ -406,12 +411,53 @@ static __always_inline int __sframe_find(struct sframe_section *sec,
 	return __find_fre(sec, &fde, ip, frame);
 }
 
-notrace int sframe_find(unsigned long ip, struct unwind_frame *frame)
+#ifdef CONFIG_MODULES
+
+static __always_inline int __sframe_find_module(unsigned long ip,
+						struct unwind_frame *frame)
+{
+	struct module *mod;
+	int ret;
+
+	if (!rcu_is_watching())
+		return -EINVAL;
+
+	instrumentation_begin();
+	scoped_guard(preempt_notrace) {
+		mod = __module_text_address(ip);
+		if (mod && smp_load_acquire(&mod->sframe_init))
+			ret = __sframe_find(&mod->sframe_sec, ip, frame);
+		else
+			ret = -EINVAL;
+	}
+	instrumentation_end();
+
+	return ret;
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
+noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 {
-	if (!frame || !sframe_init)
+	if (!frame)
 		return -EINVAL;
 
-	return  __sframe_find(&kernel_sfsec, ip, frame);
+	if (__is_kernel_text(ip) || is_kernel_inittext(ip)) {
+		if (!sframe_init)
+			return -EINVAL;
+
+		return __sframe_find(&kernel_sfsec, ip, frame);
+	}
+
+	return  __sframe_find_module(ip, frame);
 }
 NOKPROBE_SYMBOL(sframe_find);
 
@@ -431,7 +477,6 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (shdr->preamble.magic != SFRAME_MAGIC ||
 	    shdr->preamble.version != SFRAME_VERSION_3 ||
-	    !(shdr->preamble.flags & SFRAME_F_FDE_SORTED) ||
 	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr->auxhdr_len) {
 		pr_debug("bad/unsupported sframe header\n");
@@ -455,6 +500,7 @@ static int sframe_read_header(struct sframe_section *sec)
 		return -EINVAL;
 	}
 
+	sec->fdes_sorted	= shdr->preamble.flags & SFRAME_F_FDE_SORTED;
 	sec->num_fdes		= num_fdes;
 	sec->fdes_start		= fdes_start;
 	sec->fres_start		= fres_start;
@@ -471,10 +517,72 @@ void __init init_sframe_table(void)
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
+void sframe_module_init(struct module *mod, void *addr, unsigned int size)
+{
+	struct sframe_section *sec = &mod->sframe_sec;
+
+	sec->sframe_start = (unsigned long)addr;
+	sec->sframe_end   = (unsigned long)addr + size;
+
+	if (sframe_read_header(sec)) {
+		pr_warn("invalid SFrame header in module %s\n", mod->name);
+		return;
+	}
+	sframe_sort_fdes(sec);
+
+	/* Ensure SFrame is initialized when sframe_find() happens */
+	smp_store_release(&mod->sframe_init, true);
+}
+
+#endif
-- 
2.56.0.360.g66cac248cb-goog


