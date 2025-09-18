Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDDDCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DksqsAvPlifD5AcgvqzgUC2XrqtgGq1Wq0QfB7rSyJ4=; b=I/cV8kjWKhwJbjlwIewIBSK7Jf
	w4y5I8nqU83QRXJQ2w1YVIPjtB8OxnFyiGgJjGOVPhucCROHksZdrr5iWG5/cagHZxzMHGM3Eo9gD
	YumTbsd0UIpc/7NEfZW0haBUgJhYnKQ0XnXp6XWRI9xERPZ0OVW1VGNqLMwpQGgAjFo+rXH7CLd56
	0aO64hSF+kWrH1PTC245viYlskx9IVuhgiIw4Umc7chcMp37MLuWXp2+zu6APCB1BxMZ4fZS8O8LU
	cuAxZR3Xh7D5HCPi2criISFkF2YfKcgvvPkZQlpSL4ktxy+le81XQJ184RSMynDHuLaFWsgK763xX
	1gmQadow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBur-0000000H4fV-0cGo;
	Thu, 18 Sep 2025 10:31:05 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuW-0000000H4OJ-2knS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:45 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3eb536ac039so639032f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191442; x=1758796242; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DksqsAvPlifD5AcgvqzgUC2XrqtgGq1Wq0QfB7rSyJ4=;
        b=Iaw7XqTJekMzZmoZSnYD0usHP5yTdeZ+ClJZge5IiYc0aBYv6xZIngR3uBoDMFFu2f
         xCliEZP7Zo5srh67eQ2G7c7NmazB0Fj+kJ2eZJyj/9/zZjUU4luKutU2l03PiPSC+zVc
         ZYzmkKTviknHe1+dAvM/Wulzzow3RvS1/b6AZcopasPBD3LzsV0yWOFmQvRGWcPKLdFl
         k5SDF4f016n45/aJjpCiQrP+G69gr4ZLHQ5RE1I14T0cobCiEXh5IIQTPBqwKEVKXR4m
         aLiSNhV55kD+46lIVsIaA2XLe+oDqaaOaJ7OZliGrq0yXWvgU1tgacJdShSx10Vgywca
         4B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191442; x=1758796242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DksqsAvPlifD5AcgvqzgUC2XrqtgGq1Wq0QfB7rSyJ4=;
        b=i9k3/NfM8NTbn6CZcoPpPRX7cvwwq7yz9qBRIZE11wyiY4vY7VOXEDaMXknUU1feXQ
         4nSBG2nZc7Azu0hzMZYZIb95cXDl6SRKQi83Xs8Wo4BIqb9MxBflCcDPFu9brRIlXWpR
         bUYgBXzBPcVGvoevHS5xODTvDbnlyzBDee3KtAfgOa04lY4hvVBaU56Pf62/7gu+1gl7
         0iJLB+89DUZmAkLYWxzqvq3JYAoNNgRu2CmwMGrELxbkNBvvSlJuCkbIaFWG/fFE5KTr
         xWvpV6LMCrDLgpAL98cfk0CgFwPEUscBRN+XOYxUZ0B4lxyDoLQ8/NDrSlfdrEO+Mcxd
         gV/A==
X-Forwarded-Encrypted: i=1; AJvYcCWcYJqJBnb4lwV0dhUcxy9ubR9MG9mNve3Y8IoGik1ts3sfd9ztO5Pe42T3nuDatX4Uazl4cYB3M0sLn4/2XfTu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu0hZHcrOShCCPRu//minlZ0jWq2q4bdp8TCgdMZy2mnChq5S8
	OeqavT1s41JKUixwz+OUM+/hqcYzVKsyldyJjY5Udmquo8Qr1ttKU+iGV7+jdc6n6ZJCsnUB3Q=
	=
X-Google-Smtp-Source: AGHT+IFUmBh+5gegFiYMOlzv62Mjx0w8SlOm74pqvtSIgATSsKH7e5irJfmo4m3CeekRPpIfN+2PS0jf
X-Received: from wrbdn3.prod.google.com ([2002:a05:6000:c03:b0:3e7:6748:fa54])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d86:0:b0:3ec:ce37:3a6d
 with SMTP id ffacd0b85a97d-3ecdfa2ae03mr4664506f8f.47.1758191442249; Thu, 18
 Sep 2025 03:30:42 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:18 +0200
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2694; i=ardb@kernel.org;
 h=from:subject; bh=xrwXhuc4FPqL3CCntBsstjQDywcZZ1Gih2rwsqKYefE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0fTvNvTP51tUVfbQO9um+s2tq1D8Lxal183K23BS8W
 OS76NDVjlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCR5XwM/4yCL/hXm09o4V71
 pFPRwNjmMcvy2bvZFx2+zTFhrsFOwwuMDNdiUvbEfrd6uzYhzjug5+//uNlJCrzPww5vSfdiK1X VZgQA
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-17-ardb+git@google.com>
Subject: [PATCH v3 7/8] arm64/efi: Move uaccess en/disable out of efi_set_pgd()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033044_716788_948EA708 
X-CRM114-Status: GOOD (  17.06  )
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

efi_set_pgd() will no longer be called when invoking EFI runtime
services via the efi_rts_wq work queue, but the uaccess en/disable are
still needed when using PAN emulation using TTBR0 switching. So move
these into the callers.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/efi.h | 13 +++----------
 arch/arm64/kernel/efi.c      | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index decf87777f57..09650b2e15af 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -126,21 +126,14 @@ static inline void efi_set_pgd(struct mm_struct *mm)
 		if (mm != current->active_mm) {
 			/*
 			 * Update the current thread's saved ttbr0 since it is
-			 * restored as part of a return from exception. Enable
-			 * access to the valid TTBR0_EL1 and invoke the errata
-			 * workaround directly since there is no return from
-			 * exception when invoking the EFI run-time services.
+			 * restored as part of a return from exception.
 			 */
 			update_saved_ttbr0(current, mm);
-			uaccess_ttbr0_enable();
-			post_ttbr_update_workaround();
 		} else {
 			/*
-			 * Defer the switch to the current thread's TTBR0_EL1
-			 * until uaccess_enable(). Restore the current
-			 * thread's saved ttbr0 corresponding to its active_mm
+			 * Restore the current thread's saved ttbr0
+			 * corresponding to its active_mm
 			 */
-			uaccess_ttbr0_disable();
 			update_saved_ttbr0(current, current->active_mm);
 		}
 	}
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 4372fafde8e9..a60444dcec68 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -182,6 +182,15 @@ bool arch_efi_call_virt_setup(void)
 		return false;
 
 	efi_virtmap_load();
+
+	/*
+	 * Enable access to the valid TTBR0_EL1 and invoke the errata
+	 * workaround directly since there is no return from exception when
+	 * invoking the EFI run-time services.
+	 */
+	uaccess_ttbr0_enable();
+	post_ttbr_update_workaround();
+
 	kernel_neon_begin();
 	return true;
 }
@@ -189,6 +198,15 @@ bool arch_efi_call_virt_setup(void)
 void arch_efi_call_virt_teardown(void)
 {
 	kernel_neon_end();
+
+	/*
+	 * Defer the switch to the current thread's TTBR0_EL1 until
+	 * uaccess_enable(). Do so before efi_virtmap_unload() updates the
+	 * saved TTBR0 value, so the userland page tables are not activated
+	 * inadvertently over the back of an exception.
+	 */
+	uaccess_ttbr0_disable();
+
 	efi_virtmap_unload();
 	mutex_unlock(&efi_rt_lock);
 }
-- 
2.51.0.384.g4c02a37b29-goog


