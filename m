Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44489CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OKDn3irXxkoNpNbFP+MgIX3i55bASKNugifIVvfI/8=; b=o+0VnrHPf074A6ZqifN8eYJScJ
	aH58QyVyrYDhlG6z5VDA4IdJFHj5XJxFl/1IY3Nf1cKY/XtA2lDscr9XmdSo4xICtZPuK8m7fdHHS
	1sGlW9DcabmWXXfkAtSiyTODtspNZUpjC9/IhOA1RnI2ZDB/His1mjTnC3NfTnyPrp0/OZ9n01skY
	9SBZkxgP6e92ihXBVTU8ofkxVQVlzWCkZCmRLrZoYSN5Ap6qKqqmOPTctslJq6/1Vu2zQzXqGWukO
	wQEHqGULbTfp/2ZhFjpD1iEjaQvl/pos+ViijQVN1R7P4rLDkTdzPZv8SOLBbMktb0pD4/fpXFFpw
	ejuh3OTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHV-00000000Oan-3NRc;
	Tue, 19 May 2026 06:50:21 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHP-00000000OWt-3gBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:50:16 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso2048660b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779173415; x=1779778215; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3OKDn3irXxkoNpNbFP+MgIX3i55bASKNugifIVvfI/8=;
        b=PwnEZI66JgtvvQ/lLP0NTv7HDe5gt2G+9uFNclj8VXnvqMQgmTjFSXVayxJUIgk/lg
         xcvCwWU77leVTIduZT/8vgn1ALuyyzI2l8Ehg3PvhSOJmE0wxME8TjjvwPUZ8uKcz37k
         GMle6x3JsHiETbo77R0VU+W9Wcvp2Z5vhsHhrltPPqXYIcudu2saFhsPzTZumvIneuNV
         DkJRwIMcEQApZq3fp4CtYc37+fYE486YrO6bUXWlR3lbvlCGvqveHmn8UFZEjjsllepX
         iSIOHPkobcSEfXlG2KkO4EA1q7MP5uvjThxhZhJ7BztSslzwK4iijUaTx9gg63KuChXk
         vf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173415; x=1779778215;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OKDn3irXxkoNpNbFP+MgIX3i55bASKNugifIVvfI/8=;
        b=R8yVJheIXatExyiygdUizUU2hwZnxuz91yniTIpkoYIiPzzgqb8P8+qQw+4LQoWvC0
         2r0Gm3hNawAD0oZDXoJmuwiT4z8H6B3Kknn4oI76C7jp2HFHl/VcctAn5MTiZ+8loe3/
         GvEIgnGwG9rIRb65L36nWUwUJI18x1GQQhR6CHQPixNn1LV7TLAIVtuecMFaqOun013P
         oYNitTibmc3qHrv/Qz3x6feRQELO4g7vwNEZp8k1XiUr6KQ5OV8ey9IhH4mKQ9ruQKZf
         k0bVzV/QUGzmFXbg3qBf2J1dgNUUna6BNwI3G6aq7nKzU32myGpKKDAXQ0GaVFuUIOqp
         /2Lw==
X-Forwarded-Encrypted: i=1; AFNElJ9zcPPCiakshmdxXTZXcGtm+4f39YulYBiyVjE4rlgkMXLyvlTeqOepLbzAmEOfw5qNQMLRuGrSovjyfTo1tcdV@lists.infradead.org
X-Gm-Message-State: AOJu0YwulpHQ+Sf7TuVZmkywRYg8INIRdNiJ0eQTVhCk5zqLsqobPLnS
	qAwX5pKTJTpO7LuYOrojHuxBvXDhrcqBp2wtaN4DAZgTsgtHh3Xi1BGuWzaElZTPpmN5iCn4njv
	cei8Xa9GfQG7+e6ycAEW5vP7lSQ==
X-Received: from pfbcm24.prod.google.com ([2002:a05:6a00:3398:b0:82f:a139:b084])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:98d:b0:835:4447:69cf with SMTP id d2e1a72fcca58-83f33d27819mr18277938b3a.27.1779173414630;
 Mon, 18 May 2026 23:50:14 -0700 (PDT)
Date: Tue, 19 May 2026 06:49:46 +0000
In-Reply-To: <20260519064950.493949-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260519064950.493949-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519064950.493949-6-dylanbhatch@google.com>
Subject: [PATCH v6 5/9] sframe: Provide PC lookup for vmlinux .sframe section
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
X-CRM114-CacheID: sfid-20260518_235015_920745_804B38F3 
X-CRM114-Status: GOOD (  15.44  )
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

With HAVE_UNWIND_KERNEL_SFRAME, read in the .sframe section at boot.
This provides unwind data as an alternative/supplement to frame pointer
based unwinding.

Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/kernel/setup.c |  2 ++
 include/linux/sframe.h    | 14 ++++++++++++++
 kernel/unwind/sframe.c    | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

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
index 0cb2924367bc..5b7341b61a7c 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -69,4 +69,18 @@ static inline int sframe_find_user(unsigned long ip, struct unwind_frame *frame)
 
 #endif /* CONFIG_HAVE_UNWIND_USER_SFRAME */
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
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
+#endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
+
 #endif /* _LINUX_SFRAME_H */
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index a2ab9a3e07b4..c8ec1e9989fc 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -16,10 +16,20 @@
 #include <linux/unwind_types.h>
 #include <asm/unwind_sframe.h>
 #include <uapi/linux/stacktrace.h>
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+#include <linux/kallsyms.h>
+#endif
 
 #include "sframe.h"
 #include "sframe_debug.h"
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+
+static bool sframe_init __ro_after_init;
+static struct sframe_section kernel_sfsec __ro_after_init;
+
+#endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
+
 struct sframe_fde_internal {
 	unsigned long	func_addr;
 	u32		func_size;
@@ -969,3 +979,29 @@ SYSCALL_DEFINE5(stacktrace_setup, int, op, unsigned long, addr_start,
 }
 
 #endif /* CONFIG_HAVE_UNWIND_USER_SFRAME */
+
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
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
+	kernel_sfsec.sframe_start	= (unsigned long)__start_sframe;
+	kernel_sfsec.sframe_end		= (unsigned long)__end_sframe;
+	kernel_sfsec.text_start		= (unsigned long)_stext;
+	kernel_sfsec.text_end		= (unsigned long)_etext;
+
+	if (WARN_ON(sframe_read_header(&kernel_sfsec)))
+		return;
+
+	sframe_init = true;
+}
+
+#endif /* CONFIG_HAVE_UNWIND_KERNEL_SFRAME */
-- 
2.54.0.563.g4f69b47b94-goog


