Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C15C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJFEkUxvjfHHQJVzKMFt6Xucn88T8zNc+HZpEWusX8Y=; b=2GV1KI037ZuzoOJtJzUpkfes3J
	djBl8zFt+KnLmNOc2O5rbsF+/CHfkotRerLFCOtc4Jr6FXkMA6gr+FZaNZ17rX/KWgsAwdjY1RZHo
	qeyfnRD+IT+p7Dyjw35ZH634dIrlVhWWWOfFT2VAZ30b/CrPrWXMtGvtJIWEwsDFiA+Xx2vnIfB5f
	j3MgI+9Faz1QypRVY317bHiUAmXRP/syfJ9/ulXGth4fVaBklM5/BgDP0Pj3sSfFUatNyZaY3J4Vz
	uq7Tu8Ai7/8s8S7xF1sexlf+cA3wdco47wUvOITnYcVSSxjefCnzLkxV+3IrrH8lUicQRBYyXWSU1
	sVaT99zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEBi-0000000Exco-15O4;
	Fri, 11 Jul 2025 13:53:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE3o-0000000EwLg-3xio
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 13:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LJFEkUxvjfHHQJVzKMFt6Xucn88T8zNc+HZpEWusX8Y=; b=Ie4PF4avhmIiWDYNKYIpVY2jRT
	eUDSMTdpt2pNeDFrBwi37sGH8WTtuMgFSAm9B8OBhz6BK3cehFMtZFmv2UoUzz9q5/fGg4ziHZGtb
	t2fMuyaT0HwrVKM4nfBJKxUYP74UiLrWANhvVrYpfoNWzWizegfy0dY+Z7k8BXJ/fTKsZ4ivFCf0u
	L8YOC5jVyY7uEvkd4XDNTNfAUJt1S8WcVC89xRuiMauheldE/SW0abCn//Zrh2mz57ErUHhFTdh3w
	nAV9psYLkNytRpgpj1IFXLimBs6tbr6mPY8zbX6aT8PKe71ZljJb9npFB0Ggog3O8LL6nHuGPGMXM
	fgBWrYqw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE3l-00000009GyN-2vlk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCF14A54E82;
	Fri, 11 Jul 2025 13:45:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DBAC4CEED;
	Fri, 11 Jul 2025 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752241503;
	bh=f3rQynSOZUFNU+NuqbfPpRtj0evYLsR/NIIH6sWBbgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9+YTxJ0nh8uwNC6GfWTky0LFWXlJ7YGo4Qj+iur4hP29L9AX1sFUobfUynxxNJr9
	 4NP4lpWB8lic8on6GHkoXvkjbIXnu55ompKxO/dekRVwARa6RTZLu5GA+BKSAXe6KP
	 a6v2BUfIZIa6A/k4Fdd0iGUSnyCyUe981csB8LtGzpO0mxtRjd90F/F88v2NWFPjJD
	 99Pbc0jWgsjZMg3lASe+do4/pEv8HibrfkCSCuEqW+HcimS1o0xSAgBGE91jqW7Gcy
	 CjCoWltugp/Ts0NksjqKWIOHPN7KF1035HYdnvA0B1QBWn51p4g7/BXwZWmv1HUfog
	 HaipDb0yXeWDg==
Date: Fri, 11 Jul 2025 14:44:58 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/7] arm64: Make EFI calls preemptible
Message-ID: <aHEVWjyr7fxA3v93@willie-the-truck>
References: <20250514174339.1834871-9-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514174339.1834871-9-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_144506_042776_E3B9C248 
X-CRM114-Status: GOOD (  22.55  )
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

Hey Ard,

On Wed, May 14, 2025 at 07:43:40PM +0200, Ard Biesheuvel wrote:
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
> (*) only efi_reset_system() and EFI pstore invoke EFI runtime services
>     without going through the workqueue, and the latter only when saving
>     a kernel oops log to the EFI varstore
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> 
> Ard Biesheuvel (7):
>   efi: Add missing static initializer for efi_mm::cpus_allowed_lock
>   efi/runtime: Return success/failure from arch_efi_call_virt_setup()
>   efi/runtime: Deal with arch_efi_call_virt_setup() returning failure
>   arm64/fpsimd: Don't warn when EFI execution context is preemptible
>   arm64/efi: Use a semaphore to protect the EFI stack and FP/SIMD state
>   arm64/efi: Move uaccess en/disable out of efi_set_pgd()
>   arm64/efi: Call EFI runtime services without disabling preemption

I quite like the idea of this from the arm64 side (modulo a small comment
I've left on one of the later patches), however it would be great to hear
from one of the -rt folk to confirm that this actually solves a problem
for them.

Will

