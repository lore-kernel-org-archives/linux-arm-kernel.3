Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FC9CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fxxhnznzIueTel3yKlstqT1bPrMuYbkBI5UywqwoXg=; b=raKU+4mT3WNfzudulT4pRmInel
	aSPdFuQdqJhb6j8OKbO2IIGVeFNVt7l15Bn/ME0KJdZHM036UScEo6qpF6YvePcGGmqMQQfApV9eW
	aWJE2Qjw5qWKWwqGG8rmORwDMhbzEhrlPFNvZqc24p5oTaXXckKCEuxD/tH/QaQ0Z8ZgKJiUiBkFA
	U18PJIlBC4+qjOeARkNcpg3X2C0U+i7yw+hWK2MKDwG9hiLlFB7LHV96YDXVbXedWRJspbeu/AMLG
	PiN7sS7cPpdW66odvYkqDqUr8bId0byQyz71gFzo9PPNfPmWdL6/7MUGcJcNi+u9yijySLOsLvkyc
	b8Nb+Qxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoo-000000058cl-28fM;
	Tue, 02 Dec 2025 09:37:13 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoW-000000058CE-3THJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:56 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-42b3339cab7so3544998f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668210; x=1765273010; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8fxxhnznzIueTel3yKlstqT1bPrMuYbkBI5UywqwoXg=;
        b=zYn6kNzXBzT++f4MMA7aG0XzpyUaspYaSwK21DMt5UYBl4WxTmdPsaFXPkVDEtcP5p
         2TlqYK+fcrML+XqZS1+HRO+lUP3EcvNhQq0IJi+NBSCi0n9Rgrkpj4y9K0naYpWTpLoC
         ap3GG8aovWOT2V7vbch9v8ECp0SY5gvVz4M7BtwKBfHQ/CF+5jbpAV7q1fasJp/uZgy6
         mYY/a4S55iT6V5wU1zE8lCC2myPBQfONAXwrYptOBaMiv7y94uQ3MvSNW45Ar9rUiKz1
         x38R5P2HTJT4OJY8yNGhBYnfzU7XJjAYodifjm+MA2sdKtjzrHsoSVcr9JjSTcpMuRLr
         bjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668210; x=1765273010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fxxhnznzIueTel3yKlstqT1bPrMuYbkBI5UywqwoXg=;
        b=kdL2hNakPXoPXpdFtb3jinaG0cwZNdY8WEvH5Bt8fgULxkk5exkpBfHbCusU8+PFfL
         WSouIm3kXYr0ogM2I89PzTxLSh+zQyGeNQrQ4/ohcEyhgp/SLE3Xkylk3gwF4ekK8Hfa
         4STzcl5p66XzVxTRZC7DjjnuyzvkpXQTmvLvEbMQEUslFV68CPFNZUHcbcNI7HQnlk5K
         MfBpkhf5++vn68ZO9UUqFbribpdCGUTulJl4cCzy5EBsg1e/fnCAZA0NGid/jIn+gBXE
         L8SaOuhstXmsNmHNs4WvjHk7bLUAY0T9IWBhjKMNtyl119KbQpmWdM604XIkX0Rgoj4T
         s5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoUL/KhmIIS6EUkOHNyX3BTl0F5c91GoE/xmuunWf++KFqUx8n/BsZFsBZrVOzIQs1Epn+On3e7Io++4XFCMxY@lists.infradead.org
X-Gm-Message-State: AOJu0YwOsBuWKVd9hDJ9mK/cUy/oZnkLCLMAwJy3m2sjJp94Ty7Qtzmf
	531Azz0vv1Bkt2TO6eyNLbseqyrQCD2YQZez+71HPeGg4Iwfy82lMBQjSZj/GUyD5zFBNlsCHQF
	bwv7lBeH6UmZxHnV4GEg3rQ==
X-Google-Smtp-Source: AGHT+IGx3bQWSZofBrdFOMRaetX7EUPUhwnK47vPVXktbmp6aDtO5sto+D5sF+Nx0ERLO9FQcYvKQkcuoOnaNO1J
X-Received: from wrnp7.prod.google.com ([2002:adf:ce07:0:b0:42b:55b3:8bd0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2210:b0:42b:4961:eb4c with SMTP id ffacd0b85a97d-42e0f1d57f9mr31211022f8f.1.1764668210085;
 Tue, 02 Dec 2025 01:36:50 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:12 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-20-vdonnefort@google.com>
Subject: [PATCH v9 19/30] KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC
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
X-CRM114-CacheID: sfid-20251202_013653_058851_3D3A394C 
X-CRM114-Status: GOOD (  16.98  )
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

Cc: Kalesh Singh <kaleshsingh@google.com>
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
2.52.0.107.ga0afd4fd5b-goog


