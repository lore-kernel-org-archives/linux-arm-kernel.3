Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDXJdIpbfvovbuOMVUAH9VpMCZDU7wfvaTpQt7M8sQc=; b=gA6yybwQ4MyFqoiJXAw+E0q4iX
	CekMV7R1jmgST7JSPOIZ9OgtdpSSpIP0ZITEr1mWtBWN/fLBoxSef7mtaD1yNg9IhL/HttxHea8ZT
	ra4klRtqHBrTqmHEYk3UAqd8Ru4aA4++Q5FmfmjmMl3OQK9BRFXCjwiQ3z4u1R91jimzdy8+YHmEq
	yoj7DakHSMduDhIMiMlQsf0m296yQYlYge8zgwvIuXvRz3ombcNizFM+rXV/TocXzor2Euyrh9jdd
	8zsqxIjKn58vEZLdIvXs3OZlrMfMpocxJanx/i9JQfv/0lJdakCUYxq8ZFl8xJFm+618hBlajN99C
	jFtm9b3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCtn-0000000HEGy-2dke;
	Thu, 18 Sep 2025 11:34:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCtm-0000000HEGc-169G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACD5B60207
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CACDC4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758195241;
	bh=sDruQ31RQWcxA9NQ6hpfjci9hEglxsgsiVScqoGOvCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fVb35xF2JnZ5CrcL5/xgfPf9AAWIxH9atnakVT9ETUtGv74gLCtZtnmRc2CFvdQw8
	 aUgH50kHDXv2DxukpJPGzpWnGsxsotjbpf77+vzvp9Ml1/agLX8heoCSGQA/X4p6+0
	 hVm5ihb7yVv+f6Cs9MB8pseDN0FPgRfbuJyb4nt2fPYZEKJowWIsRAr/VzSvObLkKv
	 qpebeKGfjakNjnjXqXxevqoxRIICnPWVk0rknnanpUzvzVGauE1RKnauSxnWVs+Ijk
	 N4tJXCLmWLzMSAg1B1CEwueddeV/T38INbpCwLAgJlrtTgZw6AAp0D1FXJwwDoavZB
	 ifGpjE3RZhqjg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57933d3e498so541677e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 04:34:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqZrIPsHQs3Q+7yaWaIJjhCTjM0QN4JcpvREe2jgA3RMFhqGz6fys3E3qJmoY9uyDaroIGbceiDQ/u86lvV6g2@lists.infradead.org
X-Gm-Message-State: AOJu0YwPfMP35E5JUpr2X/Hrtk622isXgangInX7msqAQAVSZLJ94i7i
	q0qH/zeYJub5psrZuFB9W9GoPqMAAyvtJrVLux6PAPywGMYiX7fX6LlCegkE/me887XHnFzTIeg
	ApbWd9MbMGhOgju2SyLhRMhmQZDyypIM=
X-Google-Smtp-Source: AGHT+IHRO51P1kh8hrccEQ8EhjnKuluFz4Bw+DY0+jrlyrxJs/osMNkIFLqBmkEhBzI+UI7ewRamktzcJNUv/x12ltM=
X-Received: by 2002:a05:6512:224b:b0:572:9791:203d with SMTP id
 2adb3069b0e04-577982850e7mr1582931e87.21.1758195239718; Thu, 18 Sep 2025
 04:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250918103010.2973462-10-ardb+git@google.com>
In-Reply-To: <20250918103010.2973462-10-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 18 Sep 2025 13:33:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGndZxxe+u3st6FCebrdutUibspA7tJUpqGMgpj9UTFnA@mail.gmail.com>
X-Gm-Features: AS18NWBpKR-TPvng9fbMt92bDXPkedcwInqj0GFfa3493ydSnUglQQw7-ggQlLY
Message-ID: <CAMj1kXGndZxxe+u3st6FCebrdutUibspA7tJUpqGMgpj9UTFnA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] arm64: Make EFI calls preemptible
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 18 Sept 2025 at 12:30, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> The arm64 port permits the use of the baseline FP/SIMD register file in
> kernel mode, and no longer requires preemption to be disabled. Now that
> the EFI spec is being clarified to state that EFI runtime services may
> only use baseline FP/SIMD, the fact that EFI may code may use FP/SIMD
> registers (while executing at the same privilege level as the kernel) is
> no longer a reason to disable preemption when invoking them.
>
> This means that the only remaining reason for disabling preemption is
> the fact that the active mm is swapped out and replaced with efi_mm in a
> way that is hidden from the scheduler, and so scheduling is not
> supported currently. However, given that virtually all (*) EFI runtime
> calls are made from the efi_rts_wq workqueue, the efi_mm can simply be
> loaded into the workqueue worker kthread while the call is in progress,
> and this does not require preemption to be disabled.
>
> Note that this is only a partial solution in terms of RT guarantees,
> given that the runtime services execute at the same privilege level as
> the kernel, and can therefore disable interrupts (and therefore
> preemption) directly. But it should prevent scheduling latency spikes
> for EFI calls that simply take a long time to run to completion.
>
> Changes since v2:
> - Permit ordinary kernel mode FP/SIMD with IRQs disabled, so that the
>   special EFI case only deals with invocations in hardirq or NMI context
> - Disallow EFI runtime calls in hardirq or NMI context, so that the
>   special FP/SIMD handling for EFI can be dropped entirely
> - Use a mutex rather than a semaphore for the arm64 EFI runtime lock,
>   now that it is never trylock()ed in IRQ or NMI context.
>
> Changes since v1/RFC:
> - Disable uaccess for SWPAN before updating the preserved TTBR0 value
> - Document why disabling migration is needed
> - Rebase onto v6.17-rc1
>
> (*) only efi_reset_system() and EFI pstore invoke EFI runtime services
>     without going through the workqueue, and the latter only when saving
>     a kernel oops log to the EFI varstore
>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
>
> Ard Biesheuvel (8):
>   efi: Add missing static initializer for efi_mm::cpus_allowed_lock
>   efi/runtime: Return success/failure from arch_efi_call_virt_setup()
>   efi/runtime: Deal with arch_efi_call_virt_setup() returning failure

Unless anyone objects, I am going to queue up these 3 patches ^^^ via
the EFI tree.

>   arm64/fpsimd: Permit kernel mode NEON with IRQs off
>   arm64/fpsimd: Drop special handling for EFI runtime services
>   arm64/efi: Use a mutex to protect the EFI stack and FP/SIMD state
>   arm64/efi: Move uaccess en/disable out of efi_set_pgd()
>   arm64/efi: Call EFI runtime services without disabling preemption
>

... so the rest can go in via the arm64 tree in the next cycle.

