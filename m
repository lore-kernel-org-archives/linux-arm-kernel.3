Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCCDFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAHjM+ToD9UfswYHel5T1N/OddHAZ2XMTwnzhPtkH7g=; b=KfWm8VOrTJZQJKYUVoxd4OqkjO
	UZXqEuwQHrcL/6ClYATjKo5vgwOcuAr9t7b6XbFkqIwHOP8NYHxbEXpp7UhcP2YEurubWl3QQGWPd
	pDOE3XeTEOykOWOMyW4Ks4fDB2nT5n9tqhcYBBorw1Xmdxxs7SldCa9aUA2NiyYqNvMwp3phMvhV3
	0zrnSsN0W6kcLNNiE4LPWVdVX2npkYCPrI1Gd13cwC+VLvv6UeXZw50yF2NYRu3tSPyHosfFDaTmI
	Wz5UQN4FO64XkWxOcTr1rgvyaegerCA4KgjezT+CEi1zQMhdpRzGaEBUOO4oevWU3UHsnNUMczlts
	AFVrqcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJD-000000026Ol-3DUc;
	Tue, 28 Apr 2026 18:37:23 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJA-000000026Mi-2glK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82f70ae35c0so6078736b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401439; x=1778006239; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uAHjM+ToD9UfswYHel5T1N/OddHAZ2XMTwnzhPtkH7g=;
        b=HbCaf/pZuQ7n+AVtIUkM+NW5q6Zu3tBdjQh4QFTTsC1YuHAyCjWlzZEggwOQe0J9Dd
         XRjJamrWCAifMF/AOk/WcvOWVFs8lXti5+2G1XEKOUvVg1GPzgYHsSlTEToAP7LTKIfz
         B5OHHkbC4KIDB1ufcl2Hl1H9Yj+xYsHKs5bn147s2blAtnTk/Y8hWn1RYOY/kyRg5bDh
         sJ0OVx2acIln0vJqCx/qNDlFwW77OVQNS309LCn7ieB3rZm3jPaWOfyrW4kGKvthsY1b
         285zfH4XzhyIfOusTk1M3Zl4nwHrO4intB0+y/nyCryoxlHkXR4lDEudFKtbnnQipVVc
         Ketg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401439; x=1778006239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAHjM+ToD9UfswYHel5T1N/OddHAZ2XMTwnzhPtkH7g=;
        b=MHwDgKaOgGDrmHZV9ko5YoX2Ke/7PdDHRh9STwrmwlXbCVL1N++yZ0a2aJOAULDJlg
         xmRXje++tsjE3a+K6LaOMdsqjBdp8MMMlgVWKmcIuYANjJa2TIlGT9dINA95l4D6jlBC
         1M5M4Xku3iGz8eWg5RhfqxDZOhz8uyH+ZxbQ+NS0qAoyug7/nZwJR8BYPTSRCF36b1i4
         YGGbCX6XikdTHI9xBnyQZuaUOvLs6HsGh5CBBatTjXWbaFX64CNWBzr5VUaM4feLiecD
         6ZIVDF3GpsSxAA+OErlPp9gbBkXRpw/yhc8GFZq1wJG04Ie4NrJ0pvy0WLrH0Xs6C+rb
         4uig==
X-Forwarded-Encrypted: i=1; AFNElJ9DNx3+fGj6eKmzVsKe9wZlbOO8z/IkxRH/dpt2cQm5lY9le5WUVGGHTPrTuGEgf9qTwgTPyqM14d9j+Yo8FdXC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz06YntMjLLOWjsd6KKNnSfWdr9NepTlXbAvl34CFkRLQEE5rGd
	CrrtiyMSmZcL8eaR2is48oFOH7Q+Nq/ovyN4V6BVcpy7TmPv3Aq+RLUMuUrpIIduvH+57ai7iU0
	KZPsbxrEheRkN8w06grG8UdOmtQ==
X-Received: from pfblh13.prod.google.com ([2002:a05:6a00:710d:b0:82f:b5a0:b27])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1789:b0:82c:9c47:fefb with SMTP id d2e1a72fcca58-834ddad2852mr4478288b3a.20.1777401438937;
 Tue, 28 Apr 2026 11:37:18 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:39 +0000
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-5-dylanbhatch@google.com>
Subject: [PATCH v5 4/8] sframe: Provide PC lookup for vmlinux .sframe section
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
X-CRM114-CacheID: sfid-20260428_113720_687088_A4FA7258 
X-CRM114-Status: GOOD (  15.19  )
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
index 89dd8c5a6a10..430bff9533ee 100644
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
2.54.0.545.g6539524ca2-goog


