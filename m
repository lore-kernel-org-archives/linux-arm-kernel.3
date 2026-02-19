Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB47E9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FakAQ6ZAGTITbWRJY7PLQmzeD0Nlfh0Im2ooiMduTE=; b=eLGa5bo5WyQsFwF2zJJ4qXP2PX
	jWlJcYloJv7K0OgnbkBRjzXJxRnRnAHaBNWzv3vl1NQcqZThF3ksC2RSWc4b2ukoPTIqOZDx8LPQa
	FYqdtBu0/IwqmCuJkZU0UzHklgvpLL5LKrtaEwHdCAR62QnhFNRHGzN866D+N2g90UzYZ9vnnBKQr
	0E7dxGw1l6KhC/jlY5PHJ0L3nF+46Xxcf8nL2rFgn/71pTWjBoVjeweggmMlJKvkAutDoVDbZQMeQ
	KkQHPmdXekf2S1Q5MOTFkbwUquD1GBWu6Whfh0+Y00yKAQDeypsMMeC9FA9wvEhu5dz/QxRP+OwCQ
	cBSaAwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Ze-0000000BVYL-0dJZ;
	Thu, 19 Feb 2026 15:04:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZE-0000000BV2P-2gFQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:57 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4836c819456so7917905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513426; x=1772118226; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FakAQ6ZAGTITbWRJY7PLQmzeD0Nlfh0Im2ooiMduTE=;
        b=DZD7I6Bcm4txoI4fVg7WEpTW/v9IpCwh4AQWUfTGXu6+EZfFU5zUL7G0+QJk6XhGLT
         Gd7le2u/HRSI3B9dIWWmv8Ciltvp6+UWLjpw28mGQmOvgHdERRp9x9GTR6CMu6oT+8XP
         y35zYYejm1DovaU/jbvGYxyzTEGCPk+lxeRoRN01YiszLLS3taDIVAW2CksCC07k4pKQ
         /FLQd42c7qU+U0RZ+8FY+df2jwca5UMdUZvLpXLPLf4ri1ZlAGpLD6KJGb13FrADsqDT
         qkYbaSmKbHUiQ6T2xxMF9cIEAXJq6FxGcIhaE+Ln0lgLghSN9OE2MEGbn9z7vbzsXt4s
         CP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513426; x=1772118226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FakAQ6ZAGTITbWRJY7PLQmzeD0Nlfh0Im2ooiMduTE=;
        b=pcRSWDi92z4vxBqtqPSXefbnD4uxjsHINpDBNfBzA6/HEPRs6xYXlYDvkCYDRflVJz
         4yfcsMcHmjQtg31e6hthTnHlias9Dn/S5nP9agl7Nv2HVqrYCB+WC5kQhpXGRx1RHa14
         nC9RTdblLXEmc8k8Uin+LptYM9Axd+3xe/pkeIo+jyLRC5N5LgqYHWiVJIlC/ft4XGK2
         O+J+aJrBdk2pMX6C3sL6yPhf3EdZca3WGYv+pPXBPMaUESM2CQwQ4kYyca9tmJnJeUy7
         rcyE9Z/wwgVjYfzYwRoQ8JVjERjjG5mFRNt3RjffDVQBUTcMMiWCS03L5Rp+Jue9AodR
         Cnfg==
X-Forwarded-Encrypted: i=1; AJvYcCUH+R+7PUMTMlt4M8i2/VOR/AnDdXAyXlJnHmeRdpjtDq2T09HRDThP0FQuo6sqZiftXn1WtcHjhL49lWOfVGua@lists.infradead.org
X-Gm-Message-State: AOJu0YzU59Un/f/LMjV5KprjukT8/hU37dciXMaylhk98P/sqfj53z/6
	np3QRaS5FMfgDPML9YqfiOYvaDfsP4qxji4qH4chJf51+7pBXSCz73B00+nSfF7EkE66YK9n8x3
	E598Gtt5L8OAOjx2mpThwIg==
X-Received: from wmjv9.prod.google.com ([2002:a7b:cb49:0:b0:483:41b6:adeb])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b4c:b0:480:39ad:3b7c with SMTP id 5b1f17b1804b1-4837106152cmr357089555e9.16.1771513420581;
 Thu, 19 Feb 2026 07:03:40 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:56 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-20-vdonnefort@google.com>
Subject: [PATCH v12 19/30] KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_070348_837958_6A537C91 
X-CRM114-Status: GOOD (  16.89  )
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

On NVHE_EL2_DEBUG, when using pKVM, the host stage-2 is relaxed to grant
the kernel access to the stacktrace, hypervisor bug table and text to
symbolize addresses. This is unsafe for production. In preparation for
adding more debug options to NVHE_EL2_DEBUG, decouple the stage-2
relaxation into a separate option.

While at it, rename PROTECTED_NVHE_STACKTRACE into PKVM_STACKTRACE,
following the same naming scheme as PKVM_DISABLE_STAGE2_ON_PANIC.

Reviewed-by: Kalesh Singh <kaleshsingh@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 4f803fd1c99a..6498dec00fe9 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -43,9 +43,27 @@ menuconfig KVM
 
 	  If unsure, say N.
 
+if KVM
+
+config PTDUMP_STAGE2_DEBUGFS
+	bool "Present the stage-2 pagetables to debugfs"
+	depends on DEBUG_KERNEL
+	depends on DEBUG_FS
+	depends on ARCH_HAS_PTDUMP
+	select PTDUMP
+	default n
+	help
+	  Say Y here if you want to show the stage-2 kernel pagetables
+	  layout in a debugfs file. This information is only useful for kernel developers
+	  who are working in architecture specific areas of the kernel.
+	  It is probably not a good idea to enable this feature in a production
+	  kernel.
+
+	  If in doubt, say N.
+
 config NVHE_EL2_DEBUG
 	bool "Debug mode for non-VHE EL2 object"
-	depends on KVM
+	default n
 	help
 	  Say Y here to enable the debug mode for the non-VHE KVM EL2 object.
 	  Failure reports will BUG() in the hypervisor. This is intended for
@@ -53,10 +71,23 @@ config NVHE_EL2_DEBUG
 
 	  If unsure, say N.
 
-config PROTECTED_NVHE_STACKTRACE
-	bool "Protected KVM hypervisor stacktraces"
-	depends on NVHE_EL2_DEBUG
+if NVHE_EL2_DEBUG
+
+config PKVM_DISABLE_STAGE2_ON_PANIC
+	bool "Disable the host stage-2 on panic"
 	default n
+	help
+	  Relax the host stage-2 on hypervisor panic to allow the kernel to
+	  unwind and symbolize the hypervisor stacktrace. This however tampers
+	  the system security. This is intended for local EL2 hypervisor
+	  development.
+
+	  If unsure, say N.
+
+config PKVM_STACKTRACE
+	bool "Protected KVM hypervisor stacktraces"
+	depends on PKVM_DISABLE_STAGE2_ON_PANIC
+	default y
 	help
 	  Say Y here to enable pKVM hypervisor stacktraces on hyp_panic()
 
@@ -66,21 +97,6 @@ config PROTECTED_NVHE_STACKTRACE
 
 	  If unsure, or not using protected nVHE (pKVM), say N.
 
-config PTDUMP_STAGE2_DEBUGFS
-	bool "Present the stage-2 pagetables to debugfs"
-	depends on KVM
-	depends on DEBUG_KERNEL
-	depends on DEBUG_FS
-	depends on ARCH_HAS_PTDUMP
-	select PTDUMP
-	default n
-	help
-	  Say Y here if you want to show the stage-2 kernel pagetables
-	  layout in a debugfs file. This information is only useful for kernel developers
-	  who are working in architecture specific areas of the kernel.
-	  It is probably not a good idea to enable this feature in a production
-	  kernel.
-
-	  If in doubt, say N.
-
+endif # NVHE_EL2_DEBUG
+endif # KVM
 endif # VIRTUALIZATION
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index cc7d5d1709cb..54aedf93c78b 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -539,7 +539,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 
 		/* All hyp bugs, including warnings, are treated as fatal. */
 		if (!is_protected_kvm_enabled() ||
-		    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
+		    IS_ENABLED(CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC)) {
 			struct bug_entry *bug = find_bug(elr_in_kimg);
 
 			if (bug)
diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
index eef15b374abb..3092befcd97c 100644
--- a/arch/arm64/kvm/hyp/nvhe/host.S
+++ b/arch/arm64/kvm/hyp/nvhe/host.S
@@ -120,7 +120,7 @@ SYM_FUNC_START(__hyp_do_panic)
 
 	mov	x29, x0
 
-#ifdef CONFIG_NVHE_EL2_DEBUG
+#ifdef PKVM_DISABLE_STAGE2_ON_PANIC
 	/* Ensure host stage-2 is disabled */
 	mrs	x0, hcr_el2
 	bic	x0, x0, #HCR_VM
diff --git a/arch/arm64/kvm/hyp/nvhe/stacktrace.c b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
index 5b6eeab1a774..7c832d60d22b 100644
--- a/arch/arm64/kvm/hyp/nvhe/stacktrace.c
+++ b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
@@ -34,7 +34,7 @@ static void hyp_prepare_backtrace(unsigned long fp, unsigned long pc)
 	stacktrace_info->pc = pc;
 }
 
-#ifdef CONFIG_PROTECTED_NVHE_STACKTRACE
+#ifdef CONFIG_PKVM_STACKTRACE
 #include <asm/stacktrace/nvhe.h>
 
 DEFINE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)], pkvm_stacktrace);
@@ -134,11 +134,11 @@ static void pkvm_save_backtrace(unsigned long fp, unsigned long pc)
 
 	unwind(&state, pkvm_save_backtrace_entry, &idx);
 }
-#else /* !CONFIG_PROTECTED_NVHE_STACKTRACE */
+#else /* !CONFIG_PKVM_STACKTRACE */
 static void pkvm_save_backtrace(unsigned long fp, unsigned long pc)
 {
 }
-#endif /* CONFIG_PROTECTED_NVHE_STACKTRACE */
+#endif /* CONFIG_PKVM_STACKTRACE */
 
 /*
  * kvm_nvhe_prepare_backtrace - prepare to dump the nVHE backtrace
diff --git a/arch/arm64/kvm/stacktrace.c b/arch/arm64/kvm/stacktrace.c
index af5eec681127..9724c320126b 100644
--- a/arch/arm64/kvm/stacktrace.c
+++ b/arch/arm64/kvm/stacktrace.c
@@ -197,7 +197,7 @@ static void hyp_dump_backtrace(unsigned long hyp_offset)
 	kvm_nvhe_dump_backtrace_end();
 }
 
-#ifdef CONFIG_PROTECTED_NVHE_STACKTRACE
+#ifdef CONFIG_PKVM_STACKTRACE
 DECLARE_KVM_NVHE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)],
 			 pkvm_stacktrace);
 
@@ -225,12 +225,12 @@ static void pkvm_dump_backtrace(unsigned long hyp_offset)
 		kvm_nvhe_dump_backtrace_entry((void *)hyp_offset, stacktrace[i]);
 	kvm_nvhe_dump_backtrace_end();
 }
-#else	/* !CONFIG_PROTECTED_NVHE_STACKTRACE */
+#else	/* !CONFIG_PKVM_STACKTRACE */
 static void pkvm_dump_backtrace(unsigned long hyp_offset)
 {
-	kvm_err("Cannot dump pKVM nVHE stacktrace: !CONFIG_PROTECTED_NVHE_STACKTRACE\n");
+	kvm_err("Cannot dump pKVM nVHE stacktrace: !CONFIG_PKVM_STACKTRACE\n");
 }
-#endif /* CONFIG_PROTECTED_NVHE_STACKTRACE */
+#endif /* CONFIG_PKVM_STACKTRACE */
 
 /*
  * kvm_nvhe_dump_backtrace - Dump KVM nVHE hypervisor backtrace.
-- 
2.53.0.335.g19a08e0c02-goog


