Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483C3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bkJPq8vMT8jfjXgOksIkMdTefdHPb/Z7GDoGNb5nNT0=; b=YzJOvpdJQkZWy7KqDc7HQ33a7D
	Md0ALHT7UrgYo01yjytaoDnatlbEuWWon8zX69RMnMxhXTFRpWBx+Rh97Dp1EMwrvm02zFwc/INZ/
	LUJF98ULUvqYEoGqLbFTb9T3nJJ9MBxlG990jM45nMF+29YD9Nw9SyaniJWNQ5gO1ATvtWNED19dJ
	mmL8lt324Lz861blVRukG0JrmccgrqeJGlUcfcsllLUvd5x0KDsVydXJplLD8NsM8JUQTRLxo09tv
	Zv8O6W2bTK6FW4UwqK2qvO8OGvPzmTeSjsjhPTXNlI/Csd/ES/1C4l0bqUtEd4aj6NA7ncGbyDyLF
	AhbYQ6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuR-0000000H4LP-2GSn;
	Thu, 18 Sep 2025 10:30:39 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBuP-0000000H4JB-0h3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:30:38 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-61d31626b01so590272a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191434; x=1758796234; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bkJPq8vMT8jfjXgOksIkMdTefdHPb/Z7GDoGNb5nNT0=;
        b=aRFs05Pj7689E10VlIm0R/LyLttZplgwbMrKM+PlLt3ixhpuzZmRgWokeZHrl5Txg0
         1CeToFn7nmhQw3zi+Zs7+Iu+AdtAfhMSMAE7gUQGKbau1jdBPYoAP0R4iGwvzRTSMLEC
         UmEEui+MARmSo11a1Wvw600GKRhmZYuH6CP7zxMP6k+jrjszavok/LTsgnQOa0HguTZf
         +buowvLCXPca+tk3G531vHwEexKqZdnpWxwxEYZAo8M6q5bs1EGikQP4E66F8bCDhmav
         weMQQvWj69E7LHGfloSg/OAZwxkFOxqhElvU6pX7cY88+Zi4xD4OkRph+6+jc/mVjtVO
         1yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191434; x=1758796234;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkJPq8vMT8jfjXgOksIkMdTefdHPb/Z7GDoGNb5nNT0=;
        b=Sbiu7bbNAPCFE3A07zyeI6y+c2VFLTHKhOeNk2/Gcnf5LQpNHQ3L9kkZUc9JJMRZo3
         HQKFAs2Qobp+khMPARhpkbgy5kXzz4VceZyRJqeWVF/1RxWK7yPQSMpBRK/i/BNcQica
         72YnU4phkzxS+n0enF4KgidpDDRTekgbUtx5QaajhPnlvQ81LGWeAz9nrKCEQGgsBk6a
         NhqvHJHgHPy5Bfq5x13G7tqbjVmWFIETVE/zT2mZaJ1v3iIdMEjnKp4y47IGKm8jsnFu
         jLF0E2NWUfbXu7oC2NivXnEb8gpMG8Hv3ru+SfTFK9Xt9BXTRUlUeQDLxGoNwDF6qcXV
         0rOA==
X-Forwarded-Encrypted: i=1; AJvYcCWSnwiwV0l8G16fIzwcLBfuaEX/VFchqOW0ukxI3l3tv7i1JNu/b4Vm52pzI/fayli9s6LxIWtSdT4A9km3eL/+@lists.infradead.org
X-Gm-Message-State: AOJu0YzogwE1CfWuM4E98HGq139Ry/NFNTJKkWFVZo6kYlRV3LnX8KsU
	ArpbbqXYIMHk7LOPn/DjA5NLF93AjtdoTGJzgo94gTFB+Esjg6pv0ybjceqs4nfl9ulYuc31lg=
	=
X-Google-Smtp-Source: AGHT+IH7GEHEQMPK5uR1AbK9qmrBXkbgHp6FO/i5/9MrPBxJXJII3NY2OOT9yPIy1QWcK3kcEWkWsKjc
X-Received: from edf16.prod.google.com ([2002:a05:6402:21d0:b0:61a:94f3:bf7b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:46cc:b0:62f:8274:d6bd
 with SMTP id 4fb4d7f45d1cf-62f84213dafmr5553015a12.8.1758191434483; Thu, 18
 Sep 2025 03:30:34 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:30:11 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3840; i=ardb@kernel.org;
 h=from:subject; bh=g/6iYjL/DBpqLHEsAcR+wB8/PZx01DdNCswq0jym5uU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeP0feP7mxklXj1nvFN8I3TVwrAPR0SLDTZenazq+aau9
 0H0rOOhHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi4fKMDO9eRs3N7ruxmFnw
 s++1z9P1F2d87b5luzR7h/2OKPvizDUMf+WPbAyvDgqS1o+LYG6p7I9yeWTNptL6mt9LdPHxlXc 0OQA=
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250918103010.2973462-10-ardb+git@google.com>
Subject: [PATCH v3 0/8] arm64: Make EFI calls preemptible
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033037_241652_8E46C533 
X-CRM114-Status: GOOD (  16.86  )
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

Ard Biesheuvel (8):
  efi: Add missing static initializer for efi_mm::cpus_allowed_lock
  efi/runtime: Return success/failure from arch_efi_call_virt_setup()
  efi/runtime: Deal with arch_efi_call_virt_setup() returning failure
  arm64/fpsimd: Permit kernel mode NEON with IRQs off
  arm64/fpsimd: Drop special handling for EFI runtime services
  arm64/efi: Use a mutex to protect the EFI stack and FP/SIMD state
  arm64/efi: Move uaccess en/disable out of efi_set_pgd()
  arm64/efi: Call EFI runtime services without disabling preemption

 arch/arm/include/asm/efi.h              |   2 +-
 arch/arm64/include/asm/efi.h            |  15 +--
 arch/arm64/include/asm/fpsimd.h         |   4 -
 arch/arm64/include/asm/simd.h           |   2 +-
 arch/arm64/kernel/efi.c                 |  65 ++++++++--
 arch/arm64/kernel/fpsimd.c              | 137 ++------------------
 arch/loongarch/include/asm/efi.h        |   2 +-
 arch/riscv/include/asm/efi.h            |   2 +-
 arch/x86/include/asm/efi.h              |   2 +-
 arch/x86/platform/efi/efi_32.c          |   3 +-
 arch/x86/platform/efi/efi_64.c          |   3 +-
 arch/x86/platform/uv/bios_uv.c          |   3 +-
 drivers/firmware/efi/efi.c              |   3 +
 drivers/firmware/efi/riscv-runtime.c    |   3 +-
 drivers/firmware/efi/runtime-wrappers.c |  20 ++-
 include/linux/efi.h                     |   8 +-
 16 files changed, 104 insertions(+), 170 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.51.0.384.g4c02a37b29-goog


