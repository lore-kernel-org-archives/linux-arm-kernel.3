Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD7F46C71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yhzt+2m7KvQldPypN2XKP0c6VTxJwPXKSi6TvYWyEKw=; b=kvm4it01Y7cKL7mOUTZahziKpM
	xqEBgmJswe82Nc99ljb6FibIs+NImUWZG7Mi0sYgJXVQ3RqMOxLI3yh4f3Mq0h9I2/dFyDZ+7d4rY
	bXFhGRkxEwrO/0ljNVksL3OsKsPIEPxAd6zsk3zaSNK3Pu6gJktTh8fzMOQPzZQdheTU7kATwmBbt
	1CLMPVmRk2QquCWj+ZL7D5f01n05bXixpd+8XV4Nr64ma2wDgpNizIJyGBzRro2RrLHs7S3b4QK6y
	zI89pWEFrMq2V3loEkKiISWMw/Aou1FknQbzblFS5l/maIhpMTico6RZToKXKMw3pRxGasbgf7mok
	gBHiiP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1u-00000005PWV-0u8S;
	Mon, 06 Apr 2026 18:50:34 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1s-00000005PTd-0eoo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:50:33 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-c70dd30025fso7280144a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775501431; x=1776106231; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yhzt+2m7KvQldPypN2XKP0c6VTxJwPXKSi6TvYWyEKw=;
        b=wjXpI/cWbUqvccDcaiqUVzDzZAd2TuevR9KmShThXa8gpccX9pkBS9OUPz+OsxvbbB
         RQSC6MQbfQOezhq+r58QHrnEZkm5Ji6cR+G/W/tAyxPYYmpo7rEpeQDOL6Jf7YNHgWha
         Nh/6IbCEka80j3j2ad8+EDKEC+EeJ01vz6rwzrrQdkof6oFdrsdWWpYi/tBHo/HrNtsX
         aYVF9p/hQn4J4GndQeDWSMPXPxwTu3pibXEupKeq+IOKJt2dB2qqfKaExdeHm6yKEq9k
         ABtCnV1CO2gicEWo3dfmfpeZZ/opkP5heD+AHmsS2CkfIgmZNLBTIwM1o6uAa5pwFSPr
         Wwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501431; x=1776106231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yhzt+2m7KvQldPypN2XKP0c6VTxJwPXKSi6TvYWyEKw=;
        b=O2VApN0AThz3Evl/5D5lbeeWa9iUxSQ8IMV94SDi1DxfbsRvesWYtSXR8KlU6VpU4Z
         fb1rXgE8kLPJ1klJs6h8UFd1RxrfGPZoRA9xgB5A5ljajnSiW5rz5Dklb1g7Ku8fu8n8
         HMoEWqRvftMrz3D0F48GEErhIYmcdoVJRi+VDlvI02508VoP8vP+HV3fbAVBWZdO8mUc
         5SmfgeAtJS4it76q7zEvIbWkrQvDEQi3IdgJcHIe150t1QYd8sP8z/1VA/oscgiV4mm+
         98JHKl9oIp5cXb2eh8DN3e3fyLg43D7SN2NJuXgxgP0q5lkNMbEGvNcv6uOOeNk978pf
         0T9g==
X-Forwarded-Encrypted: i=1; AJvYcCVpfQVOX1wBXYQKn9985NHjhPeAY01KT0C6aHctxFqdQlAAPqofgVA8PVsy+zkeAFzwsOh2xz4hS7c+FuPV97OJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp0gLhQ3rllBUAKS+doKZ1E82DSXGW1vUkyRtPfmlwDHC9jCWD
	XFCUnIIJrLuwpoEVBzEj+eJ7hoD5WwsFjfA4BhHrtcTLiEnzalrTW4EUTyVp2dtOQbv4daBCG0n
	hH8vzhJYU/C/owfq/vhHv1BmlXw==
X-Received: from pfmu23.prod.google.com ([2002:aa7:8397:0:b0:829:7ce4:7fcc])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ab84:b0:82a:8865:6fe6 with SMTP id d2e1a72fcca58-82d0db6ab99mr12608374b3a.28.1775501430507;
 Mon, 06 Apr 2026 11:50:30 -0700 (PDT)
Date: Mon,  6 Apr 2026 18:49:58 +0000
In-Reply-To: <20260406185000.1378082-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260406185000.1378082-7-dylanbhatch@google.com>
Subject: [PATCH v3 6/8] arm64/module, sframe: Add sframe support for modules.
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_115032_523150_E18D442E 
X-CRM114-Status: GOOD (  18.40  )
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

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
---
 arch/arm64/include/asm/module.h |  6 +++++
 arch/arm64/kernel/module.c      |  8 +++++++
 include/linux/sframe.h          |  2 ++
 kernel/unwind/sframe.c          | 39 +++++++++++++++++++++++++++++++--
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb1..59fb6fba88d0 100644
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
 
+#ifdef CONFIG_SFRAME_UNWINDER
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
index 593b60715cd6..06fdda1dd116 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -121,6 +121,8 @@ extern int sframe_find_kernel(unsigned long ip, struct unwind_frame *frame);
 #else
 
 static inline void __init init_sframe_table(void) {}
+static inline void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
+				      void *text, size_t text_size) {}
 
 #endif /* CONFIG_SFRAME_UNWINDER */
 
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 4dd3612f9e7a..180f64040846 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -982,10 +982,27 @@ void sframe_free_mm(struct mm_struct *mm)
 
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
@@ -1002,4 +1019,22 @@ void __init init_sframe_table(void)
 	sframe_init = true;
 }
 
+void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
+			void *text, size_t text_size)
+{
+	struct sframe_section sec;
+
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
 #endif /* CONFIG_SFRAME_UNWINDER */
-- 
2.53.0.1213.gd9a14994de-goog


