Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F352F46C75
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdqPVoHRwnHco6kAfBJ1zgi0YfCPZYijdJUSHSI46+Y=; b=qbGKZtjDMe/CXLTYZRKozgSGOk
	PWu2yg0yRX6mgDFVyNDpIsgb8AKnkphy5LUZ5NbHmxB8ZB+Z0dfGHqMipadj2PsRio+tgVcXph1P/
	4cGAnP+fe/YDQ1IBmmJQn2RvtyWcLIXOc7U7fAU9Rmj+/cVtdbNJNpIs3a/Joes+5nW5FE3xo3FOX
	6jAUSebyCqpzgwngOLQpsjeCte/IpD3Ihn+qlgp16Lv6Z1RaUQzWbGfaXQyD10FRYyEfda3chaHYM
	vTSpk/W82N2N/kgJWiao3CrTh6b/rI/A12HfPVo3670ilic6FqBBRsp9LOmfj5av9uCaLwjSRH0Xp
	0nWdI5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1o-00000005PQw-0qbE;
	Mon, 06 Apr 2026 18:50:28 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1m-00000005PPL-3928
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:50:27 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c76b6db8bb2so1805621a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775501425; x=1776106225; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdqPVoHRwnHco6kAfBJ1zgi0YfCPZYijdJUSHSI46+Y=;
        b=FnC/9PUAUYSPBln7oVbs+WUlpKZdM+FlfBCpaP9TIWWTELL/WjJMIIKn/0Y6xeTviK
         +FY2XqHIYgCwGDS2w/yDUYnJUg99MJbVu04RTqSz/WlCBF48viOi4bO4QwSfz5meCmcL
         hOElxpdRcwPwCBx9YtjvJOTg1J+ZbPJ0bS2nnPTqT/+wiO941sI/fV/cuXiBTrzzhm54
         gO2ygUz/dg3NrUSP4Sq4P0f6hiaLOxbd9GhT9krbTqF0lr88awAjIcgluysm/E+vNAv9
         +0BKaNWwJiD/74o6juS/zqLlkOlv1q9qF7+Fqg6uOHydtZnH8sBnjA3r/NkochnmM4yu
         pgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501425; x=1776106225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdqPVoHRwnHco6kAfBJ1zgi0YfCPZYijdJUSHSI46+Y=;
        b=lMRCOBD52G1j7dz2g7SAQNHc1VZQhASmbnAOIS5U5APqtGrX4xdGxFXtIgncn8JUNK
         dTFJyZWgZWlbUYU/5dZ1O04dp+kN9kV02ngP3RWiRhFo8KDl+Y1LTNm2b5aQ2S8z0n+P
         v63O6N3pM/FvJiUayGS47DvEjyVX6kMPJFWmhRKf6POGypjTsBDEOKQYr5xxvlmoFJma
         unx73wgzbyYiNXVD/pbc79PKdH8YofO66Po+R//XKNVrBrxBMglVsjoeed9wWgndtdst
         ajw0a59b2S8zgniotNQGi0+ydunKfvW+vb2VZ5s8Sqmn60NV7Te8cTGqyWLdtTlPHBsV
         RfMw==
X-Forwarded-Encrypted: i=1; AJvYcCWyagISPK7TJ2ZwWnCLCffArWJuwyDzUAazOWh8ya7GEEP34LZQKAVVY1VIY2FaOGdthYgckoKOEsXLkmBbBiat@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7QSfx/e5AkCNHJjpMQraIH5NeL/eFVqNqAOIGFwp3HGMcVO3p
	FWvOWKYpgSQ4ZPxVDEAf3MvOauzU9IiPiunE0988q/rcViSGJVRO+JIpGMaCKTcZyeaH7npvB7b
	ESSJr223x6ye7oFl31KrichQBJw==
X-Received: from pfo22.prod.google.com ([2002:a05:6a00:2f6:b0:829:a228:6330])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a0f:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-82d0da33e8fmr12546186b3a.8.1775501425116;
 Mon, 06 Apr 2026 11:50:25 -0700 (PDT)
Date: Mon,  6 Apr 2026 18:49:56 +0000
In-Reply-To: <20260406185000.1378082-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260406185000.1378082-5-dylanbhatch@google.com>
Subject: [PATCH v3 4/8] sframe: Provide PC lookup for vmlinux .sframe section.
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
X-CRM114-CacheID: sfid-20260406_115026_803047_71DEF50D 
X-CRM114-Status: GOOD (  15.32  )
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

With SFRAME_UNWINDER, read in the .sframe section at boot. This provides
unwind data as an alternative/supplement to frame pointer-based
unwinding.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/setup.c |  2 ++
 include/linux/sframe.h    | 14 ++++++++++++++
 kernel/unwind/sframe.c    | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 23c05dc7a8f2..4a633bc7aefb 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -32,6 +32,7 @@
 #include <linux/sched/task.h>
 #include <linux/scs.h>
 #include <linux/mm.h>
+#include <linux/sframe.h>
 
 #include <asm/acpi.h>
 #include <asm/fixmap.h>
@@ -375,6 +376,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 			"This indicates a broken bootloader or old kernel\n",
 			boot_args[1], boot_args[2], boot_args[3]);
 	}
+	init_sframe_table();
 }
 
 static inline bool cpu_can_disable(unsigned int cpu)
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index 673b9edfc921..905775c3fde2 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -109,4 +109,18 @@ static inline int sframe_find_user(unsigned long ip, struct unwind_frame *frame)
 
 #endif /* CONFIG_HAVE_UNWIND_USER_SFRAME */
 
+#ifdef CONFIG_SFRAME_UNWINDER
+
+void __init init_sframe_table(void);
+void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
+			void *text, size_t text_size);
+
+extern int sframe_find_kernel(unsigned long ip, struct unwind_frame *frame);
+
+#else
+
+static inline void __init init_sframe_table(void) {}
+
+#endif /* CONFIG_SFRAME_UNWINDER */
+
 #endif /* _LINUX_SFRAME_H */
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index cad4384dfb4f..321d0615aec7 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -13,10 +13,23 @@
 #include <linux/string_helpers.h>
 #include <linux/sframe.h>
 #include <asm/unwind_sframe.h>
+#ifdef CONFIG_SFRAME_UNWINDER
+#include <linux/kallsyms.h>
+#endif
 
 #include "sframe.h"
 #include "sframe_debug.h"
 
+#ifdef CONFIG_SFRAME_UNWINDER
+
+extern char __start_sframe_header[];
+extern char __stop_sframe_header[];
+
+static bool sframe_init __ro_after_init;
+static struct sframe_section kernel_sfsec __ro_after_init;
+
+#endif /* CONFIG_SFRAME_UNWINDER */
+
 struct sframe_fde_internal {
 	unsigned long	func_addr;
 	u32		func_size;
@@ -930,3 +943,29 @@ void sframe_free_mm(struct mm_struct *mm)
 }
 
 #endif /* CONFIG_HAVE_UNWIND_USER_SFRAME */
+
+#ifdef CONFIG_SFRAME_UNWINDER
+
+int sframe_find_kernel(unsigned long ip, struct unwind_frame *frame)
+{
+	if (!frame || !sframe_init)
+		return -EINVAL;
+
+	return  __sframe_find(&kernel_sfsec, ip, frame);
+}
+
+void __init init_sframe_table(void)
+{
+	kernel_sfsec.sec_type		= SFRAME_KERNEL;
+	kernel_sfsec.sframe_start	= (unsigned long)__start_sframe_header;
+	kernel_sfsec.sframe_end		= (unsigned long)__stop_sframe_header;
+	kernel_sfsec.text_start		= (unsigned long)_stext;
+	kernel_sfsec.text_end		= (unsigned long)_etext;
+
+	if (WARN_ON(sframe_read_header(&kernel_sfsec)))
+		return;
+
+	sframe_init = true;
+}
+
+#endif /* CONFIG_SFRAME_UNWINDER */
-- 
2.53.0.1213.gd9a14994de-goog


