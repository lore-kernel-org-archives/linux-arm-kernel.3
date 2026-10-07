Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1801CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgc8jaasabhbUwfJLQvrAFQRGkLXxRtpOJ5ukzG0TY4=; b=Jq1S0IpJvQYQkDjrWzw1qoV5qD
	xzOrEyEF+Gf8/z/Uqxhu8RE4wlfpEYkKXLDLmu2zboaRx3oZXpuS67Z0BL6KVQPSVeS9cqy6MnHGB
	6vcdilovil0cw7+bH4YydYsjltlT61nR3YD65/MqocnHB3ouJwlUO+WgAch1ucKl4P2YhjiNpgqN2
	mXAa3GW7LyfxH33xllC4wqXR9jaReu3lHaaHYXfA9GuekiggRyHV7/AlOCbl540AS2+j7CgFHxIcN
	kNPFtgN5pFhwU0eSdpUli1DSl8nlIM01hoCf8aD6YaAXCtdY7lxVLpOxMPQC+rd2TZ2E+OFVf+Ulm
	pVqCWGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ49-00000002Mzi-1K5K;
	Wed, 07 Oct 2026 11:44:09 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ3z-00000002MoX-1Zc3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:44:00 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2d02df2bf09so33235165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791373437; x=1791978237; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgc8jaasabhbUwfJLQvrAFQRGkLXxRtpOJ5ukzG0TY4=;
        b=sZgOPzifjS8pyrzYssUTw1DIqtfHCXqK/to0CFkIdovngdRdMDrEGAUnMQ364BuH19
         prwcam68hrngQSCh5oECrupqrtglYUWi/k7HwXoPK4Jbk5oEho4erCGEIZbrKd3xCPLo
         2fdypM+/EMMG9Sxd7affiZPgJ7ODZYtCgWmxEdgMqewnONXef43WWMoIz9bpy0H1hc8V
         bfgaGj+A3Hk3j7uceKE0KMClcZmpfxq4xAHJWkzajQJoXYJyk07T4w6QI5LpzvTYJ0Gy
         oTnjmHDAAO0wZvqRMa4Qn8ewg0Hu3mydDyFoH85DovxG91cyGpT3ZlJq+I5fMg/xEbpv
         cvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373437; x=1791978237;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgc8jaasabhbUwfJLQvrAFQRGkLXxRtpOJ5ukzG0TY4=;
        b=pRZd0LpweKf/BnoVTmXJwqAjdSMs/icnoyDjxIG/AzotsA0fi9SuAx0NSslE0COpp4
         k4j0HfTWFBmFJU0rldacB5JWatEJPtl3WK+R8ebZUJUO3AP7Gu7GX5wqAVytnHKVGsPz
         2/eR5g/GkkhgzxJSe0hQRx+HxeXItY6gy+0Aoc80fVhU37nqJ6FpQds+7bG4PPPMgJXL
         vpbkGWu9pIai3BjRzLqQzw6AhGQYRh54VBy8zMn0xwtwmP2YSueW+TN7joT1gtosAuSk
         YPf3AQsE/yW52+sb7JmY69QFer+dwQDu59UXLd/jrAokl2pV6YIfp3Yn1d5UFsZuEXYO
         QA5A==
X-Forwarded-Encrypted: i=1; AKwUvBx4tVpoOcq4S5h0Z2xDu5M3FyRi1GkD59t3EcE7ov6GzQNtbqDlEEvzL2XLq+N6XBV3kWeRCbsuhGIBldwoJC9V@lists.infradead.org
X-Gm-Message-State: AFq9FYJpT+tGo8kwD5HUsfxWESCix8za4sxC8/9pP/sLWZlJK7UZz3pH
	j3OMfPLKpszFh6MP8Kvl8f6hUuepspBNq4s0FEpbL+fchbwky1TpXxZCc4SjTLYPdBcqPH4wTJM
	QN4I267Gu8XvxSK1wfQD/s54mYw==
X-Received: from ploh5.prod.google.com ([2002:a17:902:f705:b0:2e6:14d:bd91])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b24:b0:2dd:c0ff:e72e with SMTP id d9443c01a7336-2e60054be54mr15589775ad.64.1791373437250;
 Wed, 07 Oct 2026 04:43:57 -0700 (PDT)
Date: Wed,  7 Oct 2026 11:43:30 +0000
In-Reply-To: <20261007114335.440322-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20261007114335.440322-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261007114335.440322-7-dylanbhatch@google.com>
Subject: [PATCH v8 06/11] arm64/sframe: Validate IP addresses
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
X-CRM114-CacheID: sfid-20261007_044359_482099_B7940329 
X-CRM114-Status: GOOD (  22.98  )
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

Changes since v7:
 - (sashiko) Use __always_inline for IP validation helper.
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
index 0000000000000..1b45d328c746f
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
+static __always_inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	if (__is_kernel_text(ip) || is_kernel_inittext(ip))
+		return true;
+
+	/* .exit.text is retained in vmlinux on arm64. */
+	if (ip >= (unsigned long)__exittext_begin &&
+	    ip < (unsigned long)__exittext_end)
+		return true;
+
+	/*
+	 * .rodata.text is never executed from the kernel mapping, but it still
+	 * has sframe data.
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
index 33883408581da..c95fcb63e7eaf 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -44,6 +44,45 @@ struct sframe_fre_internal {
 	unsigned char	dw_size;
 };
 
+#ifndef sframe_is_kernel_ip_valid
+
+static __always_inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	return __is_kernel_text(ip) || is_kernel_inittext(ip);
+}
+
+#endif
+
+#ifdef CONFIG_MODULES
+
+static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_section *sec,
+							  unsigned long ip)
+{
+	struct module *mod = container_of(sec, struct module, sframe_sec);
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
@@ -70,6 +109,8 @@ static __always_inline int __read_fde(struct sframe_section *sec,
 	_fde = (struct sframe_fde_v3 *)fde_addr;
 
 	func_addr = fde_addr + _fde->func_start_off;
+	if (!is_sec_ip_valid(sec, func_addr))
+		return -EINVAL;
 
 	fda_addr = sec->fres_start + _fde->fres_off;
 	if (fda_addr + sizeof(struct sframe_fda_v3) > sec->fres_end ||
@@ -450,7 +491,7 @@ noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 	if (!frame)
 		return -EINVAL;
 
-	if (__is_kernel_text(ip) || is_kernel_inittext(ip)) {
+	if (sframe_is_kernel_ip_valid(ip)) {
 		if (!sframe_init)
 			return -EINVAL;
 
-- 
2.56.0.360.g66cac248cb-goog


