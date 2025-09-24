Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EA9CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NYzK0BK39cJnHRdQugTIBsQkrQwHuE548EDpH1xnRfg=; b=1ZzLKRXLeuMsv9z0Gm8l3nmLSU
	svOAdqK9gSoEk+VyahQG+grASP6K5tjf9Dru/XEiX/cLnb3onSDhGH6k/YhnHAdeiWsEKxSbRoSfa
	E+z1NXbL40WvXlLMdk0DrBy0xbIqkyrplQTxs+zcNPsgcf9T5VcervkzRl8Qc7VHcSLyyUJQHZcJ4
	cDLjwyONgeTKBNnfE0ahOYFOEyc96KgThOj+xTeU44hG3TC/xOgl5vWXxvIFVJLAZ7ijQ+sxfXRBs
	+IUgjBm2qau4xIklUbKg6H4+WB7kegy1/TR1VHjsHMeU9iVBmI5Xn7gCL47sJj+2S7cQAcce4/aaR
	21jtWZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RP0-00000001FCp-0Xrw;
	Wed, 24 Sep 2025 15:27:30 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ROx-00000001F8H-0jIA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:27:28 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3f3c118cbb3so4551142f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758727645; x=1759332445; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NYzK0BK39cJnHRdQugTIBsQkrQwHuE548EDpH1xnRfg=;
        b=Csxvz+xGXuR2Vd88V0KQswZO91//I1DqO0VyQ+NcCGepUusE6v/eIBf1r6wvT5tWSQ
         jfi8Wj1d6FY1AuP084ZQRwOeNCGPIK7GqMx+Um+vNsauWCmS06qNpKANx06EhXG6eTM5
         6B0voOu+G8CF8uoWcer/hLSa34xvyKbc0oabCK5HPddC0PkhrFBTk2PlgosAEuUzxAAy
         fRqN4tG/MhWnUs9AkYqOZNAtMc32uT4rBAN3C/QcMgPNdmdG347RwosVb4zOra3KIAmR
         843XouwmZCgewNtaE/AKO4x0+74ZC/fqge8VM6wLv6G4zHveN2pe3k1WBUk9NZwcnOI2
         EjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758727645; x=1759332445;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYzK0BK39cJnHRdQugTIBsQkrQwHuE548EDpH1xnRfg=;
        b=rrpguvwAF9AKa/fROdhUsqfSZH5jPcOAeFoob3NtVOSdkCSkZnQ5XUMbRPH2103uta
         WTEIs0Oi6HGpbnDzxCukQaFfvokmitJmGQmvUWNwAob2fTlGQU3aTAuBkW8cJLKM3oVi
         k5NzpU9VKCUYzKPLdxBMl4XZIaXx1vvDJoqFJQ1CP9xqLMIdTJyvoeNWyP+tb5e1tPPX
         03AJeXdwti5+g1St7guGFXMW3lkT51o7Rk9kDth1J6BF9ituqbuehDNRZ5YPVClvIzzJ
         jaWaNEz6HtCIS0pZuT3cXyt3wv4vr8CilYRs1azpnSwD/0LimKk/xI9mLo/vVqFg4d9V
         cnIA==
X-Forwarded-Encrypted: i=1; AJvYcCV23BENSZ6SUhdGVI5eQXvQkFBNKerXXxwilgbBjbiGjs80mIPnnfHrke+P/EoAKSbeOShctwH1yJyJ/oC5gyLr@lists.infradead.org
X-Gm-Message-State: AOJu0YyJHEsspyVJgigO2mGIKP+Js4CarRk2s9w3usg4rjQUu5J6IsEQ
	cNMzFM77LB+D+cdnY9IwECfe9PPUytA8OtUiRdTu3R8rrSdV4UCa5ei/X+hAXCclr4Tgt3kJBg=
	=
X-Google-Smtp-Source: AGHT+IHbefrd02lhuZ2Flyflx+b1N4aukNMbcJw3L7x/UfQUsJh20GIK+Ij/1IA/5QQZNocLfgc5VgIO
X-Received: from wrim2.prod.google.com ([2002:adf:e0c2:0:b0:402:d4b3:e79d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:25c3:b0:3b7:8da6:1bb4
 with SMTP id ffacd0b85a97d-40e4accc86fmr331285f8f.58.1758727645084; Wed, 24
 Sep 2025 08:27:25 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:26:52 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3866; i=ardb@kernel.org;
 h=from:subject; bh=0ixWJi3tkymt62w+b2ulCqVUiaEKpOKlW7m61PJbgfo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMK754OwZUmBt/WPl/IuNOg58rHbl0hOb2qBCEL7pdVU
 Y2fyys6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwES8cxkZ1glsnq4m6O4fPuO+
 bInqbu4KR8H63ItGL9ylRBTubNj0jpHhx0eZMwf176V6nrh/5n7CYca/k6W+/vhmw12f/pddySe YCQA=
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250924152651.3328941-9-ardb+git@google.com>
Subject: [PATCH v4 0/7] arm64: Make EFI calls preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082727_230295_5B4DFEBA 
X-CRM114-Status: GOOD (  18.14  )
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

The arm64 port permits the use of the baseline FP/SIMD register file in
kernel mode, and no longer requires preemption to be disabled. Now that
the EFI spec is being clarified to state that EFI runtime services may
only use baseline FP/SIMD, the fact that EFI may code may use FP/SIMD
registers (while executing at the same privilege level as the kernel) is
no longer a reason to disable preemption when invoking them.

This means that the only remaining reason for disabling preemption is
the fact that the active mm is swapped out and replaced with efi_mm in a
way that is hidden from the scheduler, and so scheduling is not
supported currently. However, given that virtually all (*) EFI runtime
calls are made from the efi_rts_wq workqueue, the efi_mm can simply be
loaded into the workqueue worker kthread while the call is in progress,
and this does not require preemption to be disabled.

Note that this is only a partial solution in terms of RT guarantees,
given that the runtime services execute at the same privilege level as
the kernel, and can therefore disable interrupts (and therefore
preemption) directly. But it should prevent scheduling latency spikes
for EFI calls that simply take a long time to run to completion.

Changes since v3:
- Abandon changes that disallow EFI runtime calls in hardirq or NMI
  context, as these might occur when EFI pstore records an OOPS into the
  EFI variable store. Note that this suggests that preserving/restoring
  userland SVE state in such cases is rather futile, but this can be
  revisited at a later time.
- Drop the lock in the arch wrapper, which has become redundant now that
  all EFI calls are serialized under the efi_runtime_lock semaphore
- Add code comment to patch #4 to explain the kludge
- Add some acks from Will

Changes since v2:
- Permit ordinary kernel mode FP/SIMD with IRQs disabled, so that the
  special EFI case only deals with invocations in hardirq or NMI context
- Disallow EFI runtime calls in hardirq or NMI context, so that the
  special FP/SIMD handling for EFI can be dropped entirely
- Use a mutex rather than a semaphore for the arm64 EFI runtime lock,
  now that it is never trylock()ed in IRQ or NMI context.

Changes since v1/RFC:
- Disable uaccess for SWPAN before updating the preserved TTBR0 value
- Document why disabling migration is needed
- Rebase onto v6.17-rc1

(*) only efi_reset_system() and EFI pstore invoke EFI runtime services
    without going through the workqueue, and the latter only when saving
    a kernel oops log to the EFI varstore

Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>

Ard Biesheuvel (7):
  efi: Add missing static initializer for efi_mm::cpus_allowed_lock
  efi/runtime-wrappers: Keep track of the efi_runtime_lock owner
  arm64/fpsimd: Don't warn when EFI execution context is preemptible
  arm64/fpsimd: Permit kernel mode NEON with IRQs off
  arm64/efi: Drop efi_rt_lock spinlock from EFI arch wrapper
  arm64/efi: Move uaccess en/disable out of efi_set_pgd()
  arm64/efi: Call EFI runtime services without disabling preemption

 arch/arm64/include/asm/efi.h            | 13 ++----
 arch/arm64/include/asm/simd.h           |  2 +-
 arch/arm64/kernel/efi.c                 | 46 +++++++++++++++++---
 arch/arm64/kernel/fpsimd.c              | 29 ++++++++----
 drivers/firmware/efi/efi.c              |  3 ++
 drivers/firmware/efi/runtime-wrappers.c | 17 +++++++-
 include/linux/efi.h                     |  2 +
 7 files changed, 86 insertions(+), 26 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.51.0.534.gc79095c0ca-goog


