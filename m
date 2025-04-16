Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2820C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOy0kKZXmd4v4LZe/WO0h2WayUdvDZh1TqXaFa62B1o=; b=1YtvqGCTldBQTuOP9JmKrZ1KXy
	O+84Qz62CyygrQOb+0T/SRmwuYiFzP/MPxb7TaVmcCL+sfvnGrgonSjwSk/i6Rzrb/I4B+qypvEy+
	FIlI6/qqbwMHos18Dd1bRBVMj39lMqGeHSKn9LFk8wu8a5P64yLeWC+dsw3TVFDVrweeYQkbKbiOr
	/J0isruJ8NdCxN0uG/bBQNEQspiV+ZR5b4ri9pcW/5O7vTPTkfuPHOfn26Zgo9H5PB9dDxKkPP8dt
	w/T6BtcgY+zva146MSata+UKEebYxQzsdty4+8v7PjHGar3FoZ5g0hMPtPnGRXdQHGkr/BnnF4k6U
	o7b3Y+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58tu-0000000Al7l-1Qqe;
	Wed, 16 Apr 2025 19:58:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u58s4-0000000AkmO-1YmK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 19:56:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 740F16156A;
	Wed, 16 Apr 2025 19:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C56C4CEE2;
	Wed, 16 Apr 2025 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744833391;
	bh=1cQoQQDK1oUmzfGtTT0gHZLgQczHjt8gR3Q1A0MnmOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q28ERErFjTirg5FUFEx+Iimn+lOIgFKU4pP7Jsh6gye4h50ZrKR4GIJQBzK7g5s1E
	 dcbLn1pWLhIxir6ST0Mu+HWAamcjHWZFCg0M2So4Hx9AS5wxB6Q4HD4aUbUnSQ/4IE
	 7MHmdtk3WaybPtA8sZDNcqw0EP/b74DLV1SLDmtVeYCLblOIhuzbUEDFE+CarRDK4A
	 BgumN+7BBFgQsd5ZmOqC8v7TI/GIVitcxQL8pO71OE8Mb8OMZ8iIbvZyCTcjPs3aH/
	 lX9POmoH+s4icmxYYQVVLemtGQ+EH8oNU1SVMH76A2Tedqe3mbdoCaIKxjAK8ECKWJ
	 j89csIZJMglSw==
Date: Wed, 16 Apr 2025 12:56:28 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 0/4] KVM: arm64: UBSAN at EL2
Message-ID: <202504161255.7583BC11@keescook>
References: <20250416180440.231949-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416180440.231949-1-smostafa@google.com>
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

On Wed, Apr 16, 2025 at 06:04:30PM +0000, Mostafa Saleh wrote:
> Many of the sanitizers the kernel supports are disabled when running
> in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> (and makes more sense) to integrate than others.
> Last year, kCFI support was added in [1]
> 
> This patchset adds support for UBSAN in EL2.
> UBSAN can run in 2 modes:
>   1) “Normal” (CONFIG_UBSAN_TRAP=n): In this mode the compiler will
>   do the UBSAN checks and insert some function calls in case of
>   failures, it can provide more information(ex: what is the value of
>   the out of bound) about the failures through those function arguments,
>   and those functions(implemented in lib/ubsan.c) will print a report with
>   such errors.
> 
>   2) Trap (CONFIG_UBSAN_TRAP=y): This is a minimal mode, where similarly,
>   the compiler will do the checks, but instead of doing function calls,
>   it would do a “brk #imm” (for ARM64) with a unique code with the failure
>   type, but without any extra information (ex: only print the out-bound line
>   but not the index)
> 
> For nvhe/hvhe/proctected modes, #2 would be suitable, as there is no way to
> print reports from EL2, so similarly to kCFI(even with permissive) it would
> cause the hypervisor to panic.
> 
> But that means that for EL2 we need to compile the code with the same options
> as used by “CONFIG_UBSAN_TRAP” independently from the kernel config.
> 
> This patch series adds a new KCONFIG for ARM64 to choose to enable UBSAN
> separately for the modes mentioned.
> 
> The same logic decoding the kernel UBSAN is reused, so the messages from
> the hypervisor will look similar as:
> [   29.215332] kvm [190]: nVHE hyp UBSAN: array index out of bounds at: [<ffff8000811f2344>] __kvm_nvhe_handle___pkvm_init_vm+0xa8/0xac!
> 
> In this patch set, the same UBSAN options(for check types) are used for both
> EL1/EL2, although a case can be made to have separate options (leading to
> totally separate CFLAGS) if we want EL2 to be compiled with stricter checks
> for something as protected mode.
> However, re-using the current flags, makes code re-use easier for
> report_ubsan_failure() and  Makefile.ubsan
> 
> [1] https://lore.kernel.org/all/20240610063244.2828978-1-ptosi@google.com/
> 
> 
> Mostafa Saleh (4):
>   arm64: Introduce esr_is_ubsan_brk()
>   ubsan: Remove regs from report_ubsan_failure()
>   KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
>   KVM: arm64: Handle UBSAN faults
> 
>  arch/arm64/include/asm/esr.h     | 5 +++++
>  arch/arm64/kernel/traps.c        | 4 ++--
>  arch/arm64/kvm/handle_exit.c     | 6 ++++++
>  arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
>  arch/x86/kernel/traps.c          | 2 +-
>  include/linux/ubsan.h            | 6 +++---
>  lib/Kconfig.ubsan                | 9 +++++++++
>  lib/ubsan.c                      | 8 +++++---
>  scripts/Makefile.ubsan           | 5 ++++-
>  9 files changed, 41 insertions(+), 10 deletions(-)

Nice! I assume this will go via the arm64 tree? I could carry it also,
if I get arm64 maintainer Acks...

-Kees

-- 
Kees Cook

