Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD9CF94CB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFJJ7xjnagN752ApaKO1ffV+VO/ox5jo3HxnwGPNp0Q=; b=IHku8ocLBWk7OFVq34iLDVgFDz
	xwVzFKW5HlFnDRLP58fUm4XP7qBOCDN/+9uh8w9zNq/YpvZLzcVwI0jhFdRetcfOJHQWQXntk8NO9
	rLCq+uzk7Y0Dczj4C1Bam1olGMDvIKX+Pk8vURv3cTuitVNr5KQ3NizvkNVJib4UA7iw8nDzFvxZb
	4oU4G5IPsD7pMHd474BVYJWfR1vtmzMo2oOHL5sm6GaWOuAMlpAXxXRzVfbykkV2OrCshCzLiCgN0
	2PbilR4uUHKvQuHZ5ag0X+PfBvsxHX3ga7fCMbjUVZPl5iMAkWjENg7QeHU30Pa8jrYWHT+Jp3ZlI
	01R4Zu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJxH-00000009NZO-454B;
	Tue, 21 Apr 2026 22:52:31 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJxC-00000009NTA-2nl9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:52:27 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so3097611b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776811945; x=1777416745; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFJJ7xjnagN752ApaKO1ffV+VO/ox5jo3HxnwGPNp0Q=;
        b=GfylAKBCnGTpJ+BntYEpZ+33t03MeaNMfv55yGVf6GBCI3eelYiJoLZ1kj2nvE4ksz
         t3pvU70/qrKi4xPGeZA15x0qP3hXe/LE7ydvHhSQ7IIgswpbvfaglyY79MnknM+XI6gD
         zOA0smaiPcvlkkbnDI+JaWNKGYqROVP8gvn105FM0w6saWZel3OdpO5jmQregwNkJO7k
         wCeprhCGSguZy3i5bIn1blh/OZdCfg0A7KFQNTuY0SM8Cp84uCLCqMzjNEJgOLcpmFgC
         xiIBih933q1bx+eujPV9DRCZjVEzTHVyGoj78zaD5fpAll71APRo0z829CiE6sJpLnnO
         4WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811945; x=1777416745;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFJJ7xjnagN752ApaKO1ffV+VO/ox5jo3HxnwGPNp0Q=;
        b=XsQMwmXYdFWO+GpHjD4suPc1u5LFf2z8R15vWqrMoQ8T3rexYib9es11QNQwvyXkTe
         EbwD3nGjZUfc9RumGHiWNbSEXF4QfPxFANwKmw2aUAfxJ20NrGRM8ug8zpJUg6cqDywp
         4J5UQi/i6flJDx0Q37IJvjEOQyMA0i1DZd3BzYp10qSICLBtEVk/vE72vPguj3jUiu9j
         ZbLYWTf6W1kXwqC8LLxDUuLxcvbPyBgSL2ONJiTDGONQz9/tGHB6qavInSQD59r3i0Ur
         jFcqrEQdYIvwizCjzTyT6YsM7fEK7/XSIqhHPAe/AWmBL+9aWrHWjqQGl7UXcWhHJTgH
         5tkg==
X-Forwarded-Encrypted: i=1; AFNElJ8qXjq5Ap3iCoHiaYC5Xq0+pD43ooH91jbZ5GINLbhr4duOR8+2x0tFaGB+Jj/y8JnDfXsazcOEofAN1dZmhM6a@lists.infradead.org
X-Gm-Message-State: AOJu0YwEipg+VPFuaUHhkBSAjBoWwQeKWAdev2BCT+l98OQa2MER2mOm
	+B2yZbGDMh9ngvChax8uXwxXN500YloD7zrK3Oqjtb8SY6YKyMDNRUVQuEo7LAsTZJmDcDHabaj
	TbCG1iulKDfJ4vLsliYGVYRFgWw==
X-Received: from pfbci14.prod.google.com ([2002:a05:6a00:28ce:b0:82f:7242:4cb9])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d1f:b0:82c:e19d:cabd with SMTP id d2e1a72fcca58-82f8c7ee387mr20113311b3a.10.1776811945127;
 Tue, 21 Apr 2026 15:52:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:51:58 +0000
In-Reply-To: <20260421225200.1198447-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421225200.1198447-7-dylanbhatch@google.com>
Subject: [PATCH v4 6/8] arm64/module, sframe: Add sframe support for modules
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_155226_729562_73E2D78A 
X-CRM114-Status: GOOD (  18.14  )
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
an .sframe section can be found on incoming modules.

Signed-off-by: Weinan Liu <wnliu@google.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/module.h |  6 +++++
 arch/arm64/kernel/module.c      |  8 +++++++
 include/linux/sframe.h          |  2 ++
 kernel/unwind/sframe.c          | 40 +++++++++++++++++++++++++++++++--
 4 files changed, 54 insertions(+), 2 deletions(-)

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
index 8ae31ed36226..27f5a66190af 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -81,6 +81,8 @@ extern int sframe_find_kernel(unsigned long ip, struct unwind_frame *frame);
 #else
 
 static inline void __init init_sframe_table(void) {}
+static inline void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
+				      void *text, size_t text_size) {}
 
 #endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
 
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 243027244854..20178e02f428 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -980,10 +980,27 @@ void sframe_free_mm(struct mm_struct *mm)
 
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
@@ -1000,4 +1017,23 @@ void __init init_sframe_table(void)
 	sframe_init = true;
 }
 
+void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
+			void *text, size_t text_size)
+{
+	struct sframe_section sec;
+
+	memset(&sec, 0, sizeof(sec));
+	sec.sec_type	 = SFRAME_KERNEL;
+	sec.sframe_start = (unsigned long)sframe;
+	sec.sframe_end   = (unsigned long)sframe + sframe_size;
+	sec.text_start   = (unsigned long)text;
+	sec.text_end     = (unsigned long)text + text_size;
+
+	if (WARN_ON(sframe_read_header(&sec)))
+		return;
+
+	mod->arch.sframe_sec = sec;
+	mod->arch.sframe_init = true;
+}
+
 #endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
-- 
2.54.0.rc1.555.g9c883467ad-goog


