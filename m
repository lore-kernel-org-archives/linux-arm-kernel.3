Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C960CCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jD+kFUBYAeeVe/ddE0v3sfAZUgaXP696q8DDibnTqBE=; b=sQggJ/JZt3P3s0qOUgPeeeTFkH
	EI/RmpWIpVrb2tDGf12/QtVuVzgjEKkYg928Dga1zq4xOEBEmPPdG2ieaIY67+sN0sVi6th9AFxwa
	ed9inuxf2TfCBY/fr2Jx4qC0TvvYQ0+lLGFhdw3PMGaFV5OfY9wPIi0DqkXV0D5LwjpdAcTdBipdg
	1D8yB/zRASTGLw2Yb6KXMF49qGgZYmi4YjyJhHh9cb9CpjkRg0rY9mGWEImeTr5SK/I9zQTH1gtjD
	3pFO3Nba8Kbu/2klfY040Ty48CReIBc5KkdancAMgqZ5CLSquUGeKU4/fBCg7uXMmPD6uNcW3dO7/
	is/NiCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cU-00000002thi-2X1Z;
	Wed, 15 Oct 2025 21:01:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cT-00000002thW-3ZUe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=jD+kFUBYAeeVe/ddE0v3sfAZUgaXP696q8DDibnTqBE=; b=UfWZI+3jaXEIlSr1UJJwrKQ19R
	EnOW84um9Noa2wcM9oBcvp9887McdoTplcfpXKd1WkBMtBUfj4zK5CbEMY2d64Nk/0+DxnzS9YAUk
	I1SGUiU9wMwio4NS9YrKTRPRUZQWIjjr3yJnU4+1Yi8AFTAnQC2eTZpmo9cmsnH3hzh11YoihBLBf
	e/pPbOTqMFe1WA7JHQ7xfUywYb/oYv7sT0wCYAW1fOuC1vaCQehQdPep/xx3LUm4yJFq9CMHQhUIt
	YneMIiQCvFOzh3HrO+8uBpOwXEHtsrclW5ifV1hDb4qIrfGZ8z+ZoG8Eb0KmfFp48V+XUXEj+EN/v
	F1U25d1g==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cK-00000006G87-2dwk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:08 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-471001b980eso197135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562061; x=1761166861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jD+kFUBYAeeVe/ddE0v3sfAZUgaXP696q8DDibnTqBE=;
        b=gSJeUcDFmhIdgt290HRKN2/+dKD01Rb99od5kggJY3oCa7FwxkOUloJoIH/cZYffYr
         beQA+IrovSgIDHRRkwCrfjVu2GU5x1s797jVxxSDHrJrhFyRYL7/OpXCJoraialN06I6
         fxkxb3CqiMIPQt1tFqqoyh+AUJ7vRw0JkCkSQvkQYKxLg27HoJo4GZkLZqyWx+i2+LJU
         /R/R2ONDScFb+4PsKy9May2Gvn0NuxuFAN83gUZOxdY1PNZlmpusw3T+xMlxAUKC9Jfr
         Ag22mIG638pFFvzKAgzFtGboL5LnobJpv0w/zFaB/sVC5y65x5jmLeYbL8uY3426D2dQ
         MLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562061; x=1761166861;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jD+kFUBYAeeVe/ddE0v3sfAZUgaXP696q8DDibnTqBE=;
        b=wg2xJ4Mx2DwYCtU+8jm2FVkDnSPLN1W/bHBIoUZfeI4Ow+wFs3Q4T1tPv/3Z5ZBoNH
         PPTsNl/KM6Cye72pqFbjzL+idDodODNlgAUaka+t9MR/j/mbSqya0GB/zw9FqJzo6UO/
         v2mZA/qQRujfjgx6i/CMO+aCLbtNtz1sUYaJjIlJ2bp/fZeJMmFwUZenMKuUI+NLSKxv
         Qi8ArBiLGzeDxBKvEkGVUhI1Ov02PmHjLcXNZgvyEEazqie9o5l/9idhDkEwCtGTumey
         YNJkj0znuWttcOFnaj57bEVaZON1LA+PShn4ZlxsCL/cKWlB8rwHui1qqWfBMFiILlK5
         E5vA==
X-Forwarded-Encrypted: i=1; AJvYcCWpu719DDqfPaYcviwp+j7igqYaLxqHcLRIURN/HjXfQUO/zeLIgm2TAKY4IVtzZtHQJT+dhV0SrKDfuy6/Z7DV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3CSFBP4f2K5/uyR98xfDKSqxWCXNESXwqG/F/JaZLCXqW+11B
	br7PW4tEh/P702yTn+wqY+Z9vLNQiCejTakHBCbajP//i6xPChRDRtHT/9aMUyVmsPihbDqk5Q=
	=
X-Google-Smtp-Source: AGHT+IFxvD/EQ8rSJVlE+EW9W2l6da03H/DDoZRFzID9t/ZfX7njnQlyQo8cNARQr75jwnOiLRm17aJC
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:46f:aafc:e6d4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b2a:b0:46e:3e63:9a8e
 with SMTP id 5b1f17b1804b1-46fa9b07717mr171322045e9.26.1760562061580; Wed, 15
 Oct 2025 14:01:01 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:35 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4002; i=ardb@kernel.org;
 h=from:subject; bh=QKe9AxQhtU5DJebwz0TSUBdR0vmdHpGkcHrtGscOZ1Q=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDV7O1rafFzh1TTcR2Pj5858b/I+ev7jt29OWyN3McL
 tp41UokdpSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJHExk+F9r/Df39eEsxodc
 EruWlkoqqfxi/cDuVKYia/4qIHbl8ukM/yweKRW8ODp5XmdnbmTQ0kRfr9qrtrFZrxWnetzevcD bnh0A
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-9-ardb+git@google.com>
Subject: [PATCH v4 resend 0/7] arm64: Make EFI calls preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220106_693094_0CEEF266 
X-CRM114-Status: GOOD (  18.25  )
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

No changes since v4, rebase to v6.18-rc1 only.

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
Cc: Pierre Gondois <Pierre.Gondois@arm.com>
Cc: Sami Mujawar <Sami.Mujawar@arm.com>

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


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.51.0.869.ge66316f041-goog


