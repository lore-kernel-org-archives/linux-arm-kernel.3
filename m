Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B2CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPyujSEjHofHg9YDm/Jyl8IxXmB1G+6YXd/CQAOVg0g=; b=aomiQPAPqOAiFppwnJuptAn/mS
	8IGa8hqOWculx+JMeC5fBw0yJuBdi29la4LgKn9/iJsVQfSsQRgMtga66DlIkkD7E5W+D9Hu3/Af6
	Cz034ENjC6vNpAlL9W7kg5pIHnTAxoBE9zQWXz9rnellCPwx6Dmmbx6ciN9qftLY3xe34dvtOZ2Kk
	a7ZqXHrzso8MllBsVjvuT2CpBBSFW6CcDlQxyXQbAlRpL+BiRE5Geejp6Uo3oc6bhR6V3WIc4ryEG
	w9C8u+RXA0SE/dHA2c/tXUs9CqWl+ib5cL7Nn3Fh0BKofxM6yYrzayc3COWtSJjrIyR9CssgvRoJy
	K3Z2QcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RPP-00000001Fkr-3HIq;
	Wed, 24 Sep 2025 15:27:55 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP4-00000001FHn-3bns
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:36 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b25f63db20bso103294266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727653; x=1759332453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sPyujSEjHofHg9YDm/Jyl8IxXmB1G+6YXd/CQAOVg0g=;
        b=XrWI5QfCoq2WiD42a0gSU8nhD1h7bUhjWUj+88dyEyhJJ8w0FhkH0TNO5AW/oxNUEQ
         S8OLX0Z334t3zUwM/9fPI9uv2ltITcXvHE5dpDQPY1P0cZnG70F6Ri7/pb5CS8Pcv98i
         jua7FjeKgnPHU43y0N5Sz4a1qjrfoyfI0RR9PTb0sl0n62qn2q2BRaaPUe5XsNLzrLd1
         X+oDr7A6B0/JzirQ+N34QW/fnPApx7s/8MMoa9BQaXdU6VEDt+dOiBQx5PUMMb43JgIW
         WrEs10bR6Wc8fiiK9SWTF/MgneOV7Ppcc99eGuCWEtQdjY7ULPwokmVkckST8rClynOO
         uGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727653; x=1759332453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPyujSEjHofHg9YDm/Jyl8IxXmB1G+6YXd/CQAOVg0g=;
        b=FvBBbe9Ju4q8sREEXKejuwa3OyBi6RGjWkoBzDX3U/ZLHQRzlxFjPXcUd6fVjrhJqm
         bhIa7JcpswHjMh8zCu49dCYKQh4fKKoZhUJ7i10DFVCZPMcuq0YA147Z6iBsl+Mikcdo
         9tUwtlw+cJUPVRVNz3QkP4t0F+3RefSiOU+PMxkjZ9vxeuFkINH982uy2fSZaL/j++xo
         VlfmhhPrjYJR7/sZs0m14m2yyWL4EJvv8C6jre2ZkHmtn4WT9+huGae9ZRKqlgx9MWda
         V6aaRFv98Gc6ctX1S5r7pQ1eOJlKKHGYZGyPR2FZ9WcBI+NWCptAWH9U6vX2lhuCIiC6
         Thdw==
X-Forwarded-Encrypted: i=1; AJvYcCVzrO9rQ1fPOHbJeqouypE3NGDBCzVq/kogTaKPwipPFceDKsa2zPeitB2vib+CV0tUmrbwkAUhcsjN24rbqVX5@lists.infradead.org
X-Gm-Message-State: AOJu0YzGYkSrkyS8eWhq4Z0Wf+9iU1igEKYFp/qG5MdJ44LzWXWe5jyh
	itqa2T3OAT+l2L16UBjhLTa5ctFnd04aFBe29CIYaDgyiw4/Qmy4Rmt0X7jyFYFaqWEyUaG1ww=
	=
X-Google-Smtp-Source: AGHT+IGhYJri2jw2StcIcnozNtBl5X8wH5wzUecPXuiOreaVtyiBeuhRrBBP2IZw5zrKucj7w3PXpApx
X-Received: from ejcvk3.prod.google.com ([2002:a17:907:cbc3:b0:b29:9df3:352a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:868e:b0:b0d:400:9182
 with SMTP id a640c23a62f3a-b34d97c9779mr811566b.22.1758727652921; Wed, 24 Sep
 2025 08:27:32 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:59 +0200
In-Reply-To: <20250924152651.3328941-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20250924152651.3328941-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3342; i=ardb@kernel.org;
 h=from:subject; bh=CE858YGwYUY/DV8BNXHqb59oe3QHOpqPxAjPh5x7H10=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK78lkzuc7891fhPp9vvPkx4xPP3bezZiqJb6oYdLRh
 TEarxokO0pZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEGi8z/Hd1spzUWVpgZF90
 X8z6fe7v11eNVF17d278MLOa9d8kgWuMDPt8rfx/a1xa9mXKu5QAjQm8v38xlUyfPN/i54RAQVF zYS4A
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-16-ardb+git@google.com>
Subject: [PATCH v4 7/7] arm64/efi: Call EFI runtime services without disabling preemption
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082734_927690_5E5AFF37 
X-CRM114-Status: GOOD (  19.08  )
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

From: Ard Biesheuvel <ardb@kernel.org>

The only remaining reason why EFI runtime services are invoked with
preemption disabled is the fact that the mm is swapped out behind the
back of the context switching code.

The kernel no longer disables preemption in kernel_neon_begin().
Furthermore, the EFI spec is being clarified to explicitly state that
only baseline FP/SIMD is permitted in EFI runtime service
implementations, and so the existing kernel mode NEON context switching
code is sufficient to preserve and restore the execution context of an
in-progress EFI runtime service call.

Most EFI calls are made from the efi_rts_wq, which is serviced by a
kthread. As kthreads never return to user space, they usually don't have
an mm, and so we can use the existing infrastructure to swap in the
efi_mm while the EFI call is in progress. This is visible to the
scheduler, which will therefore reactivate the selected mm when
switching out the kthread and back in again.

Given that the EFI spec explicitly permits runtime services to be called
with interrupts enabled, firmware code is already required to tolerate
interruptions. So rather than disable preemption, disable only migration
so that EFI runtime services are less likely to cause scheduling delays.
To avoid potential issues where runtime services are interrupted while
polling the secure firmware for async completions, keep migration
disabled so that a runtime service invocation does not resume on a
different CPU from the one it was started on.

Note, though, that the firmware executes at the same privilege level as
the kernel, and is therefore able to disable interrupts altogether.

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 23 ++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 85f65d5c863c..a81cb4aa4738 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -10,6 +10,7 @@
 #include <linux/efi.h>
 #include <linux/init.h>
 #include <linux/kmemleak.h>
+#include <linux/kthread.h>
 #include <linux/screen_info.h>
 #include <linux/vmalloc.h>
 
@@ -168,7 +169,20 @@ asmlinkage efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f)
 void arch_efi_call_virt_setup(void)
 {
 	efi_runtime_assert_lock_held();
-	efi_virtmap_load();
+
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		/*
+		 * Disable migration to ensure that a preempted EFI runtime
+		 * service call will be resumed on the same CPU. This avoids
+		 * potential issues with EFI runtime calls that are preempted
+		 * while polling for an asynchronous completion of a secure
+		 * firmware call, which may not permit the CPU to change.
+		 */
+		migrate_disable();
+		kthread_use_mm(&efi_mm);
+	} else {
+		efi_virtmap_load();
+	}
 
 	/*
 	 * Enable access to the valid TTBR0_EL1 and invoke the errata
@@ -193,7 +207,12 @@ void arch_efi_call_virt_teardown(void)
 	 */
 	uaccess_ttbr0_disable();
 
-	efi_virtmap_unload();
+	if (preemptible() && (current->flags & PF_KTHREAD)) {
+		kthread_unuse_mm(&efi_mm);
+		migrate_enable();
+	} else {
+		efi_virtmap_unload();
+	}
 }
 
 asmlinkage u64 *efi_rt_stack_top __ro_after_init;
-- 
2.51.0.534.gc79095c0ca-goog


