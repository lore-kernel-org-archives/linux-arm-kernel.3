Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B68F94CB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/yLmRqvzN2aFF0ctBbudoPYYemVc0jOSsthBuuHiX4=; b=f5EqZzMdccwbQk0wWDH/9Vs6kR
	5DxjGFxU9ceKX2ng/bh40EeT6UX+E3U1l36IjH7yPNxMEOiPaB0t5lZ9sBDwqYX1T/JhfEYd+oGxC
	L3PnJq0ZKQMt6/WqO3ks7hqNV+95kRk1wepFn6BMBLPBLpto1PuYE12EQRqlMv10uU/nbeMhughR7
	1JWHdocEfyo01W4+TgBmTVRJ1XH+4wDVd3NjwxvviftnGFl6rNt9PMtLn81pwgkYVvl2iyZYybXnp
	wIBXotvkGyoh05jP2GqRAAgXu6rQkMzFl4tkskU4HUDAD/Zoq8fQ21GS1KbHuoPrIvxrpeZM9pTx2
	+yAyPavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJxB-00000009NSu-2Kdy;
	Tue, 21 Apr 2026 22:52:25 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFJx7-00000009NP9-3Hxm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 22:52:22 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82f2138a9e0so2817146b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 15:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776811940; x=1777416740; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r/yLmRqvzN2aFF0ctBbudoPYYemVc0jOSsthBuuHiX4=;
        b=EvwxPnhd+2ATalaBTilL5yMrh5Xe+3iE6bgM6KpBSh4We6lpullTFnDJNkIcYkZqA3
         Xjnx0D9q9pN3k6iCSUzIGjyulPuVTz78aHeN9w1yj1FUElQskRM+mEJYowxQM925lZv+
         SjT9GeaTLBp5qwykAAEUkyhPWRQp5++OU7k1wPJQXOxzoeubnoXstBJsFVxqkt9cEwQi
         RPoDLMMV9JCzBb9tGZLKviDPLyjfxzLBqtqy4tTGpZ/jYRLKxNK1gJmEcQlQBLX5HenP
         FrgV9aP2FKSgsCtkAJKEaz4W5L1jPvQqPSwqLdpC+xTtzzovvuqW6gIYCurABmZX30al
         mvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811940; x=1777416740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/yLmRqvzN2aFF0ctBbudoPYYemVc0jOSsthBuuHiX4=;
        b=G0oeZYBc3rCT9Y0IYQYQriBfHumB1xrOQ+PfY8/XUNGvS57V9bZypbaRcnpj/MF3A5
         Fx4d3q7RomzCK3bI6hEfVVjCd7HhLgINjibgGXEo76z1czsNNaVBVhpR0MrxyLpBkajE
         XJRCkpItaVnjduwqqT7tAup+ln9cPFcVNvUGrM9n/fvP0nscY3U09+oXiypVcMow0keV
         J83TEWU2ON7O1yOV82hXYVwfXVwiijL6fMebjmnpda3+rcyn5+eBLJS9RmU88PIVrBmz
         Nwd/oA9h58x6aOvp0tfmY9uq0D1q2dVX2AYnJO7pgXrT7m0E+cWpMqMfUqnTpkH6Rcgu
         UQiA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ee2ZFyejWo6V2LMTPnRYbWzgQqzLiyr3yNTN+NE4E0VbjgL0OznsKMiNi6NAz1lEh3w5DO4Wa5jb4aQOVEfPm@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZKeKg7ilKUc8ZxajWyqnWJfqPTz9tqGerbUZCYlXOyi6jc60
	BFW0HIr7i4sqeM79AHCrWrs+E6Q295i2J1f2hfB+qWsT8pBjq+XrBe4zFSjgVH3TbIixwpr4JCw
	OpPioV/89i0oFUgYCph0ysr9Hng==
X-Received: from pfbde11.prod.google.com ([2002:a05:6a00:468b:b0:82f:3ec7:cdd])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ae10:b0:82f:9300:cc44 with SMTP id d2e1a72fcca58-82f9300d8d3mr17127125b3a.8.1776811939880;
 Tue, 21 Apr 2026 15:52:19 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:51:56 +0000
In-Reply-To: <20260421225200.1198447-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421225200.1198447-5-dylanbhatch@google.com>
Subject: [PATCH v4 4/8] sframe: Provide PC lookup for vmlinux .sframe section
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
X-CRM114-CacheID: sfid-20260421_155221_830591_6C54E476 
X-CRM114-Status: GOOD (  15.03  )
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
index ae15f5c06939..fb3b6b2d8677 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -14,10 +14,20 @@
 #include <linux/sframe.h>
 #include <linux/unwind_types.h>
 #include <asm/unwind_sframe.h>
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
@@ -930,3 +940,29 @@ void sframe_free_mm(struct mm_struct *mm)
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
2.54.0.rc1.555.g9c883467ad-goog


