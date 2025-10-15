Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B4ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfJeYBJf9dKVExNOryhisMuvn1pJYVbY2e0JV1a62gs=; b=fDzW3ZUaiq5ATXbQ3cwf9U+D4c
	zyUA6GOeOpKQXftaSieDKdkmFDhf21EM83YVwkweg73wUaS0Rh6HRuMuy+DrxFm/SsMqb650olQ7p
	i/73z+thhfslpetgM9NFAU8ROozpuYTTr4Xln3rl+JHptztnV82ugStxcBQdlZ2leRo/Sbj45UmOe
	3XwSYLdIxWVwcar402JWT09ZRXXPiw3bHV2BhDnA2BrsGwH3pRo73H8zNFCnUVnLvLcdzxrHAAkpo
	R6EQRwTOus1VW/uh85CqL5xNvhu1uR51Ghi8m5BuBtIeCNiQkO+4Spyuell/f+XKd0V8k+Ue4CdWb
	3WZo+7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98ch-00000002tqj-2oT1;
	Wed, 15 Oct 2025 21:01:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cf-00000002toY-08k5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MfJeYBJf9dKVExNOryhisMuvn1pJYVbY2e0JV1a62gs=; b=kzb7A66iQ00KEpAqeqhjuY4sli
	70B3w4TuYyY/MLQDNW5f2gghfFfBMFE6z4dP3+80+8hge4C6fVf3rwjE2DPZlDilwMHWpIveV3Fff
	CS9IMcWSFrpHP/UQ0V33D4M+n903MWaRSR0xkwu8dKi/DW4TOBeexQmfDJ+MUn8X9gan0azSXW16e
	RllbSXtyUdka+ApJKhAq6NiZy8N5nyqRrABuUi6vbzCA6Je/rooGSgCnDoYXKIW5B3dPGYAvgBNA1
	GlJ47R7M3l67z+dQ9rOW/priCOkfrBZst9aMI2cZJtQUbq7pa+vtV84k63iKKqFAlj3EK4hi40cR5
	A8CEg9Wg==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cV-00000006G99-2k7u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:20 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47108163eeaso96755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562069; x=1761166869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MfJeYBJf9dKVExNOryhisMuvn1pJYVbY2e0JV1a62gs=;
        b=tTeOyjKqQshC4amhtXbtVyS+VrmUk6hCxIbMdYs1SS1UySOtt7ZIMZuVjcL/kNvusE
         QsMlOlh/UcCyTOsqSfZ5iXxQiIJeY1qNFWnLWoYwJLcUd9hYw4tgQSP4w4BFUbfq4f29
         2WAr2AljHzwnm/k+z/1xm+SabWATRb96+U/NUbAjhUAn/c/RgReEvh7Mh/hHfqYozX7S
         b6J7kELT5L7vKojM3VjgmlzH1c1Vsj3ktf5heRFuxMRRZ9Nr8gRiZn3pu8TeT1GTAWby
         dD2zTwIYBYX2DqTIRDXBEomcwMMTI8/vgXpJxHz/b3u2b59KUXrGVHncEqm8lOcIxtD8
         Nl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562069; x=1761166869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfJeYBJf9dKVExNOryhisMuvn1pJYVbY2e0JV1a62gs=;
        b=W6zLucW3FRONZhn6J0NTsGsftnZ74btNh+5vjyPZc9TJpyymANXpDj+bS73r8Pl6ug
         kAlrId3jweoiWuDYdSNLhyQjcNdFHHczXhxuGISNLlYShKlDrVqqG4nSQe6EfUXbEKIg
         uEXZzhOIos82HHpzz3inLvD2vtChQMMLUzMuEzcsxpwY46as1j79fcACKrbb7enJUA7C
         BBLzOBHWKU8vbHSB16XbWjbtgb1NTNRHStvW32rxuqZONDsghj+xPVY39Y2tGZbvTKoM
         Y0F5sq7X+VrMcbYLgphrXSlNa/pNPsw/+fvqxb33wcCL8Bp/v5k0JaQXffvkr3UjR20U
         fD8A==
X-Forwarded-Encrypted: i=1; AJvYcCVuvKZITDEcAvQKCaLDrjHtxbt+tjJisXfMxGeuFqBv9t5xbkID2qVYtxtzUaC6hGKGOcSgU3qZadb6rRYsT3ys@lists.infradead.org
X-Gm-Message-State: AOJu0YxgkB88A5KwMKn/0Ln/1RbjnpO/Ghwe0pPWm/IZH9Unm4qJkuxm
	bRJwpomggz9ZLnvdISQYKFXCwYNQGR6NTAXSx7QB5oCi5SuJguwkHgn2wI9J1cxHT7T0WJnEhA=
	=
X-Google-Smtp-Source: AGHT+IG+9dkTmwOQEgWRMCLUBLZu1hNOQYGDhgDBr9mXwrcUJWepG/mZYYY9jhBrgkyuHclPeYFheC4j
X-Received: from wmwq23.prod.google.com ([2002:a05:600d:8357:b0:46e:32e6:eb8f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c162:b0:46e:4a60:ea2c
 with SMTP id 5b1f17b1804b1-46fa9b17e57mr225565295e9.37.1760562069252; Wed, 15
 Oct 2025 14:01:09 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:42 +0200
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3342; i=ardb@kernel.org;
 h=from:subject; bh=V3JoExKah8YdhW3E7vX+STaF9jmPPtKMQXsXC3Dx8GU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDV6/Jz242lTS+WVIXjoZvt3DsOfpAQDKj6UxbRA9vo
 bXjjfSOUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMBEdI4Y/XAwX+9rNX0+Rdvlo
 fmVqpOjpZaUz1A+KsFpfrfn4ouyyDsMvZl2bLeJTdxe9UkgwLf07P13Kmv9tW+TczqTrKaXqwTw sAA==
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-16-ardb+git@google.com>
Subject: [PATCH v4 resend 7/7] arm64/efi: Call EFI runtime services without
 disabling preemption
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220118_770326_F7BA9477 
X-CRM114-Status: GOOD (  19.03  )
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
2.51.0.869.ge66316f041-goog


