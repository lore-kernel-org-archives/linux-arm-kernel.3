Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68372FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7EyQfNtegfTWEfYy8kG9xX+fYrEWmDcicnmg1Ulors=; b=dqbqaCYsxhK4/1vKIODYJZ3ZI+
	fYEczNk544PlHZ7XGq+cXrQZAZ2iglwtDEfKjET/nZhu6uUpAsRV7yxO5mcq51x8ZT6iULEhHwy45
	eAtoVglcn9SBeK9bxGV42JYg4vm1pTOr5YqZOQBWJ2Wu9uXqJXHlj7qbXBOKY6Wgvgi2HjMLMYs3u
	XE1eDBfLsALnPMc1IQxEEi/h7lsAQuAfEXYCX5ycCt/8Z7FDQzjNysPL1gSMJLxp+Fv/fO0/86A+T
	AaV1dMu6DtUcqTjYNnM5UKcEtkeBQdSddq825Kns59r7Tby2ISulBbKs6qFir60At9MTR7pykhH3A
	HrI12+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJM-000000026Vg-3urW;
	Tue, 28 Apr 2026 18:37:32 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJH-000000026QY-1gwn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:28 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c798fc1a426so4585317a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401446; x=1778006246; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7EyQfNtegfTWEfYy8kG9xX+fYrEWmDcicnmg1Ulors=;
        b=pV3x07N5ZvSLmc2Q5p8L8Xc4AJ+8I542kSM0W1ikor4t25ZM/Ur+FfSaGr4yFZP//d
         ekC9+7tZo2EwdF6FxIGFxetmYXZMEufrDa4xRI8mbNUa9rc35njynv8Aad13KpgqAjNU
         Std7Yxtsq0BCFFQ3LtDmJw0OCcsG4Wkf8wx6oQ9o7ociO1lNiJP78R0yjqBW+bLDpJmZ
         NQ2U679IqJWzSoj6Z+uEm45BONB9vgtnNbrgY8rR0lbzdjP+5NACZLRnYajC08nee9zv
         OFE6vOOuiclyT8d5Ok+VTx/sl/nU3rpO4KgOTiu4DIUPRRBovaujTeitKkZNEt0eKeGm
         AK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401446; x=1778006246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7EyQfNtegfTWEfYy8kG9xX+fYrEWmDcicnmg1Ulors=;
        b=JcXNFWgMQ5t97xHnOwxkVEPXm5nI9PJTc26DRWG+nS2q//Z762MBzSY/crGSYkOKt9
         +taMRlaetQ1hZdutc4pK/7zcQqGMTwQiAB0rwWvnaC0G7tcaIF+6baKBAN8wCT7ZGyKZ
         DcIzbLRpjtrNH3WYd0zKAPh6Bdy8WU8GrRxJRjWPiJcwNNvzqdRS5kyovaTmTVntvWd1
         6PPmDafF4V3ws4r2huuzp/+eA/SHFyIv3IjBFPnLvF7PZdiPdKEAbfUziYe6kpcvubF9
         Au2az35uHVqRYUashec6YcMU9vvCXDOi1VJzedjinkESSGAx0H869C/OfpVvFhwv9TuZ
         Vx+w==
X-Forwarded-Encrypted: i=1; AFNElJ+io02oKpd5X+GhfNwW/bieZN9SsCE4M6t99ekqg3zenGn3Lw2KIey4vRoKMYrFoYFfmHItGOaNFktGMAKceXrk@lists.infradead.org
X-Gm-Message-State: AOJu0YxDaNUEOtxw2U6H9jipnR5YXzmaLp2FVbPBQCdmcqCN+JzNhiQw
	bTkRAbAhCJ7hpd/k+c8Owf/RYIAGgM6TIRDYUUnmz1/YMmKm1VkWnJiTq3zsmXPZ8w2Vt+W6jYl
	Y8DdxTtBKwM3yxfMvAoQcfwMDXg==
X-Received: from pgbdp11.prod.google.com ([2002:a05:6a02:f0b:b0:c6d:caaa:3364])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7286:b0:3a2:d629:16a2 with SMTP id adf61e73a8af0-3a39bfc6a83mr4727109637.10.1777401445332;
 Tue, 28 Apr 2026 11:37:25 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:41 +0000
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-7-dylanbhatch@google.com>
Subject: [PATCH v5 6/8] arm64/module, sframe: Add sframe support for modules
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
X-CRM114-CacheID: sfid-20260428_113727_454769_4176D674 
X-CRM114-Status: GOOD (  18.49  )
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
index dcf4deb378dc..70001c8e586d 100644
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
2.54.0.545.g6539524ca2-goog


