Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C9FC982E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc716TApKQEJSK6qhR6cXCUJJx/CKA0S6sBYjQMPGMw=; b=uIWCX8G52diYLPWKdOPi2IAqID
	NIZTpGavSJ+L0PvgbOBmOkDXqQ3TAU+z/sqHOlXEvEamFO8w7BEhzm3JjARSR16au1kI9wU5REkcD
	thLjeIzNXAbGKGEoKuYa8Xo7JcPaDjN8uybwlivpJw2rhICw5Go+x2HQip+gQMzzYApU9MOnT5erd
	Ewj91BOvCkfPNLZKnaHSzUjZuGJeRAOykLXaHkJ0+nuAbKql/nl4V7khH5r9VZhmwio3aM5CPwPCy
	OvBgIbyeUriZMu1zmmTHaJX9yjHSdr7vutzlBqoUmSTYpEWaCr+ZMPjjbl1qpafyTVXIozjZj/CE/
	/QwIU03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHt-0000000FeEZ-3XuP;
	Fri, 18 Sep 2026 22:42:33 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hHc-0000000Fe09-0N2f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 22:42:17 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-8710450f731so1405895b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771334; x=1790376134; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tc716TApKQEJSK6qhR6cXCUJJx/CKA0S6sBYjQMPGMw=;
        b=SkoVK7kuqpVwUJpksTqa/dyXIQ19CVPtA9Y1AdvmFnD0gprG8f6QkFddV8No9jb9AY
         GyY3O2PBKAmlM4/XKBAuKi0zDaq9sA5p8Fxa111y2uW+ovFYR8/qqqpkfzux1EAKAYzC
         3gj4voWvKYDbqHfusrlJS3cPknrk2pDKGsAfCuKr5ZV1BaJk0seM9kxTZnSpDJKdgMHk
         6vFn/F/bBuwU5d5eWI9zAnVRq2HVuBjr9AuNYpQsxpcPMbhDjYjSbL8qWer7GzrFxBkO
         x6a/iY8TBMh4UgljxFDK3A1TOzfQdBeRlSLYMiU49z3fnY77CueTbHXKPpBMQf5KlJId
         +Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771334; x=1790376134;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc716TApKQEJSK6qhR6cXCUJJx/CKA0S6sBYjQMPGMw=;
        b=X62SBPzF6pNW8x6Eyt4MaVXc+XlUHxCxVuT4VUFaYnUpFFoLp81AD4kkQOgrZ04jGe
         NCa3xivYQhmS898UdMU6EoQVvr4MHY4HEDJ3WB0xz6cbFFYKzPhobQdGE+D479v+qwzh
         8awgWrFv/1m/yPMI9G+Dv1h7F2rxqSkSwUJj22C7zAxqYaXVtQnw9Yoy4xmLDxU6wINw
         PtxeA11Ktfusj2JKIlzdXyIZ57XCykSrhVCLvGSKjamwoan3sxG9pdvvWdVt16dMwEAP
         MpDkTnLNreI9JO4OIpSaTG0V7VWo2ezVpt+fA6QO5Dsi+rEERHGx6IJ5n1WsqWoP5/tl
         QFOw==
X-Forwarded-Encrypted: i=1; AKwUvBz6kbwWS++iF64e2fPaQ2dY3VmxhxO2EoY+t365/3aslw0Of87O6wmwgf18TRWvWqQsrIEG0bwnc52W2CJkaK/S@lists.infradead.org
X-Gm-Message-State: AFuF++lz5486MerenqMu9srqhk4+SaYMk1BFpQaVbEzMpQejhFhe3wz2
	fMT5fKUDL5moVtojGtalpZ2xbKIGzp+yD2c+Fymh+vFpHlwEmsrZLLRuGaM5cyOmpu4RpwyQoCq
	cUeWAZTJkfvE/VRkrqntCviR2tA==
X-Received: from pgcfm15.prod.google.com ([2002:a05:6a02:672f:b0:c96:6f3e:49c9])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:798c:b0:3dd:a009:3189 with SMTP id adf61e73a8af0-3dda0093253mr1525130637.49.1789771334228;
 Fri, 18 Sep 2026 15:42:14 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:52 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-7-dylanbhatch@google.com>
Subject: [PATCH v7 06/11] arm64/sframe: Validate IP addresses
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
X-CRM114-CacheID: sfid-20260918_154216_199504_3BF7C763 
X-CRM114-Status: GOOD (  22.04  )
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

Validate the given IP and computed function start address against the
known vmlinux and module text address ranges.

This requires arch-specific validation for vmlinux. This is because
arm64 keeps .exit.text (normally discarded) and .rodata.text, both of
both of which lie outside the bounds of .text and .init.text. Note that
.rodata.text contains code that is never executed by the kernel mapping,
but for which the toolchain nonetheless generates sframe data, and needs
to be considered valid at lookup time.

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

This patch is split out from v6 patch "sframe: Introduce in-kernel
SFRAME_VALIDATION", and includes just the IP validation logic without
the SFRAME_VALIDATION option.
---
 arch/arm64/include/asm/sections.h      |  1 +
 arch/arm64/include/asm/unwind_sframe.h | 32 +++++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S        |  2 ++
 kernel/unwind/sframe.c                 | 43 +++++++++++++++++++++++++-
 4 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h

diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239eb..5edb4304f661e 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char _srodatatext[], _erodatatext[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/asm/unwind_sframe.h
new file mode 100644
index 0000000000000..8eb720f59434c
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_UNWIND_SFRAME_H
+#define _ASM_ARM64_UNWIND_SFRAME_H
+
+#include <linux/module.h>
+#include <linux/sframe.h>
+#include <asm/sections.h>
+
+static inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	if (is_kernel_text(ip) || is_kernel_inittext(ip))
+		return true;
+
+	/* .exit.text is retained in vmlinux on arm64. */
+	if (ip >= (unsigned long)__exittext_begin &&
+	    ip < (unsigned long)__exittext_end)
+		return true;
+
+	/*
+	 * .rodata.text is never executed from the kernel mapping, but
+	 * still has sframe data
+	 */
+	if (ip >= (unsigned long)_srodatatext &&
+	    ip < (unsigned long)_erodatatext)
+		return true;
+
+	return false;
+}
+
+#define sframe_is_kernel_ip_valid sframe_is_kernel_ip_valid
+
+#endif /* _ASM_ARM64_UNWIND_SFRAME_H */
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index eb1f54829503c..82fd20ccb7c43 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -237,12 +237,14 @@ SECTIONS
 
 	/* code sections that are never executed via the kernel mapping */
 	.rodata.text : {
+		_srodatatext = .;
 		TRAMP_TEXT
 		HIBERNATE_TEXT
 		KEXEC_TEXT
 		IDMAP_TEXT
 		. = ALIGN(PAGE_SIZE);
 	}
+	_erodatatext = .;
 
 	idmap_pg_dir = .;
 	. += PAGE_SIZE;
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 503d4a2beb50e..e6542bb678585 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -42,6 +42,45 @@ struct sframe_fre_internal {
 	unsigned char	dw_size;
 };
 
+#ifndef sframe_is_kernel_ip_valid
+
+static __always_inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	return is_kernel_text(ip) || is_kernel_inittext(ip);
+}
+
+#endif
+
+#ifdef CONFIG_MODULES
+
+static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_section *sec,
+							  unsigned long ip)
+{
+	struct module *mod = container_of(sec, struct module, arch.sframe_sec);
+
+	return within_module_mem_type(ip, mod, MOD_TEXT) ||
+		within_module_mem_type(ip, mod, MOD_INIT_TEXT);
+}
+
+#else
+
+static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_section *sec,
+							  unsigned long ip)
+{
+	return false;
+}
+
+#endif
+
+static __always_inline bool is_sec_ip_valid(struct sframe_section *sec,
+					    unsigned long ip)
+{
+	if (sec == &kernel_sfsec)
+		return sframe_is_kernel_ip_valid(ip);
+
+	return sframe_is_sec_module_ip_valid(sec, ip);
+}
+
 static __always_inline unsigned char fre_type_to_size(unsigned char fre_type)
 {
 	if (fre_type > 2)
@@ -68,6 +107,8 @@ static __always_inline int __read_fde(struct sframe_section *sec,
 	_fde = (struct sframe_fde_v3 *)fde_addr;
 
 	func_addr = fde_addr + _fde->func_start_off;
+	if (!is_sec_ip_valid(sec, func_addr))
+		return -EINVAL;
 
 	fda_addr = sec->fres_start + _fde->fres_off;
 	if (fda_addr + sizeof(struct sframe_fda_v3) > sec->fres_end ||
@@ -438,7 +479,7 @@ int sframe_find(unsigned long ip, struct unwind_frame *frame)
 	if (!frame)
 		return -EINVAL;
 
-	if (is_kernel_text(ip) || is_kernel_inittext(ip)) {
+	if (sframe_is_kernel_ip_valid(ip)) {
 		if (!sframe_init)
 			return -EINVAL;
 
-- 
2.55.0.1082.g2b9226bbc0-goog


