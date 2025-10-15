Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69F5CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtXilHA5AAd1z6GdE3uGsC51Fo0T6TRa6MXgCog/xSk=; b=yYfAiSZmBYLfRuIMgABxdHtiY3
	645w4l1KxBrTr4DSBEgEukeoy5ZPVDOXojnkfGTxahGUcdq48qng7bXkCKoRNSyB94K/M/37io+lR
	oJWrKDWHMDD19BDUjU4syftsX5F2AVGF8UAczeInE274fLgeRs1rqLYnluCBV5rCz0N4dFsHWAB3Y
	7iIhoRuyTdiS98qbw3EngJx4PPaL51mVTuMpauDk915ZpDdrWyKYCtDM8KAQirOlah7SN7C4DELLb
	Dj0URJcmj06rhxjDtpMZV0UFRxOy8bq/Wlz/eN9PYkEtBQW2H5otHgFcnToATYmhQzP/lBGkjnlXE
	M5pbOduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cm-00000002tvb-3SXG;
	Wed, 15 Oct 2025 21:01:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98ci-00000002trF-2qxE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HtXilHA5AAd1z6GdE3uGsC51Fo0T6TRa6MXgCog/xSk=; b=njTZj/qRGJwRksOuujkxuHJNwu
	yL/ZVjAE5yJr6N1/nZGg3jmSziqlu9qQVdB9csbW51kLHw2wLXtPjzZsEfXKUj6u82zHuIKuvNw9y
	nYv7V8LUXKBL+/r3qqzBfwRG7qE7Epd6gJTWcXUWt9uc+Yu00VtdHKBhixeA8s3Qr+26J0B4fRK4w
	7XjZhoTE/mymVdouRtMxOOv6qIJzI8nPCGiico6jpHbfqxH8rzOPdrcsklfRCMwg/bailQYkrg+w5
	amF44YGOJFD2w96GV6nok4+/j/wf/OLQMkgifA3BAeYNPEDaRIfd9KFqomB3RhQfCVsa+oIkhMR0d
	hlL43eFw==;
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cZ-00000006G98-09TX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:23 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b5b12e9e02eso567666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562068; x=1761166868; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HtXilHA5AAd1z6GdE3uGsC51Fo0T6TRa6MXgCog/xSk=;
        b=ZfoWmdFEqEE7F4z9uQYGOg1fMMsO7fwcCNu9ZXPmNReJl+Qb2Nf3H27CVxR4T469OO
         jmKVs5mazKTSZ4cV7uo6eTx8GoOkteldicCN+9YmiTeD+gfYmZRdoGlP+PRdV+JNOeMd
         K3saUkPtFUTIVtvcuajyvS73O448rGwd60U2Bh6+A+HSfOOrlJH5MuC/clJu68FaPK8s
         1omSh7nuYKoC3XSlBttqT0hic4k9i7xXfx5w8s9WiCUtwU0k6yQ+0XFhPFR7aqSQsJGQ
         LnSxzcbu+DlC/hseVrETlu5RGCDqC13f3dK8eZagDySmhr+PKpTn984+aumRHFaktvuh
         naIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562068; x=1761166868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtXilHA5AAd1z6GdE3uGsC51Fo0T6TRa6MXgCog/xSk=;
        b=UWX+/zeKLescD3DO0hh+F9APHBlJm20SMjHTW5u44XT+bgyuZm/bYey8CiUa7JjAnm
         TZ4s2ABp4h0/USji4/403KbHMx3Us+WJucvEy3IJ9KHUAG8kPjS/QF9Q52RNI9REJOpk
         r35ud8t+wVgxBmySOXM9cef2CGDJQA190PGXdnLUIfZWsKQmCk3A8BnI0yK8Nce/Z4uD
         RCEfx/ozSGQwe5h3XAa6OxPgY2X1ALfC24WKj8u9KjxaJb9wCdDbrf26BpZ0cBYgGust
         eaeu7VTAF8URFjYcUzWxjGtGdrtoN9vFDO3ATSac7ngbCb8jJjq5ffeANmip3EqHabAR
         q55g==
X-Forwarded-Encrypted: i=1; AJvYcCVraBQs74QTSaFmUCMfj7R4R57D7us2T6RtOFNt07ym256j7Rk/5ss2mAvXAKv897Nzft/V+8tY1O72Xt4dvQHy@lists.infradead.org
X-Gm-Message-State: AOJu0YyWHK9qzwv3MajzNnPSN+HNdggDjcN8aLJbW/DcfC4xkMH+QPfB
	iIVcn5F4eILjTHk/TzOhoRu2gkqs45OhqWRGHvitbXh9BuUJRVgwX+nTErjcchGw5QF+wt3c6Q=
	=
X-Google-Smtp-Source: AGHT+IH3ROeCSpPWS9y2jZ7CvrP8/bWnx+s6dPg9rJBua5mdk6FXYUzuc6+UiuwI+/nVZ3rpHBAA+hiX
X-Received: from ejblo1.prod.google.com ([2002:a17:906:fa01:b0:b47:89a2:8c6c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:980f:b0:b45:420c:81c0
 with SMTP id a640c23a62f3a-b50ac0cc34cmr3303674866b.36.1760562068221; Wed, 15
 Oct 2025 14:01:08 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:41 +0200
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=ardb@kernel.org;
 h=from:subject; bh=997YokF8smvlH2+7Du/063cegE+dHugAIUP6dU3Aa2s=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDVzdTg/stWY4eySNf39jeOrDI2WBiyytOz6jjvWbRV
 x/v0FjRUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACaSeZKR4apV4b0pL78sZ598
 LzA4+I6BwcnoBUdSut9MUZh7iKesm5Phv0fEh9RthhFMgprc7NoZL8o/mqhbhr2MTOZkDl/GnKb KCgA=
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-15-ardb+git@google.com>
Subject: [PATCH v4 resend 6/7] arm64/efi: Move uaccess en/disable out of efi_set_pgd()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220120_741843_EC0180E0 
X-CRM114-Status: GOOD (  17.09  )
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

Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/efi.h | 13 +++----------
 arch/arm64/kernel/efi.c      | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index bcd5622aa096..aa91165ca140 100644
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
index 0094f5938ba6..85f65d5c863c 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -169,12 +169,30 @@ void arch_efi_call_virt_setup(void)
 {
 	efi_runtime_assert_lock_held();
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
 	__efi_fpsimd_begin();
 }
 
 void arch_efi_call_virt_teardown(void)
 {
 	__efi_fpsimd_end();
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
 }
 
-- 
2.51.0.869.ge66316f041-goog


