Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47CDC5CFE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYf/U0nL9j9PnqjTffdu49QRWXvXhUFAROWiqj38684=; b=lUmvBoq05Tw4/Y5DU+QalSE/vY
	rv1Xf81f7piE+C4/1Y74GR7dlChT8YdMdLuZxVt/lpry6tDDO2U2HGpjtW4JbMb+8Qc/jO+gsjQvQ
	r1ay6gz5QS+en8aoyLhjTzXOWf9DS0ZqoWvZoCQIaRWyjx8QbOXVMy4C5dL9I/LpQCH9uReu+nEnF
	LCXvjxTO9M+nk2uD6YVRqOPVU4zb0pveKB/Fbe2H5SVT9G+EXSow66rP2GCKPGejBGcYtwZ86fD/g
	9lt6AyYunbLdyUTPN8jmIkrdqH8wcHtRm2gEkUhaqTs5+2u7Iwf890guIBxF8yYiAbp9B0O5tms2g
	5Yh03A4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlIL-0000000DyyS-3j3i;
	Tue, 11 Aug 2026 12:09:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlIK-0000000DyyA-3yKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:09:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6723A4173F;
	Tue, 11 Aug 2026 12:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965861F000E9;
	Tue, 11 Aug 2026 12:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786450164;
	bh=KYf/U0nL9j9PnqjTffdu49QRWXvXhUFAROWiqj38684=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LRB9orrjzfTGLQNJxffigMBqmUUB4/JhA6YJvO2S7dsUnOwOIuEQZiK8dwsV6+oDU
	 JiL7T+/QLTy1xs7YDID+RpfESR4UdYdNEVneioV/YjqmTkZ8YMeC3ZRuZL8Fq9E97e
	 19WYDH4Y+sjD91Q/gHoAnJScpbUlaePG8Ls6wPF0eSp3zv06yKpXkDYfbSNG05I3xJ
	 Y5lcSoavTXoBSYfhoqlQaXDNLask+4oUgR2HI3r35tw00vlDmpVk+ECXQpqNnIdfGy
	 Zne1h8KaQE68sgtPLGLoNY6d+pQMZDYeHdPc4jPhugiOwhcdXVTszAh9bTJBZT6CSM
	 99wjU8MB+DZCA==
Date: Tue, 11 Aug 2026 13:09:19 +0100
From: Will Deacon <will@kernel.org>
To: Gus Bourg <gus@bourg.net>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/efi: Do not call EFI runtime services preemptibly
 under SW PAN
Message-ID: <ansQ7xG51RddFmVu@willie-the-truck>
References: <20260806000144.3388823-1-gus@bourg.net>
 <anXMug2_-vZl_pZ7@willie-the-truck>
 <30c5499e-8041-4e39-933b-c5220d53be77@app.fastmail.com>
 <anmwTDnFR2cgxkqR@willie-the-truck>
 <CAKL=SEpvBqMjw2Ts4ODYHCJz0K1axwmtrUGKQEJeb_rvuAQk0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKL=SEpvBqMjw2Ts4ODYHCJz0K1axwmtrUGKQEJeb_rvuAQk0A@mail.gmail.com>
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

On Mon, Aug 10, 2026 at 05:51:16PM -0700, Gus Bourg wrote:
> On Mon, Aug 10, 2026 at 4:04 AM Will Deacon <will@kernel.org> wrote:
> > On Fri, Aug 07, 2026 at 04:56:00PM +0300, Ard Biesheuvel wrote:
> > > On Fri, 7 Aug 2026, at 15:16, Will Deacon wrote:
> > > > On Wed, Aug 05, 2026 at 05:01:44PM -0700, gus bourg wrote:
> > > >> There is such a preemption point in arch_efi_call_virt_setup() itself,
> > > >> immediately after the TTBR0 install: __efi_fpsimd_begin() ->
> > > >> kernel_neon_begin() -> put_cpu_fpsimd_context() -> local_bh_enable() ->
> > > >> preempt_check_resched().
> > > >
> > > > Hmm, can we move the ttbr0 toggling until after __efi_fpsimd_begin() so
> > > > that this preemption point doesn't interfere?
> > > >
> > >
> > > Either that, or tweak the logic so that the switch is done eagerly in
> > > this particular case (untested):
> > >
> > > --- a/arch/arm64/mm/context.c
> > > +++ b/arch/arm64/mm/context.c
> > > @@ -266,7 +266,7 @@
> > >          * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
> > >          * emulating PAN.
> > >          */
> > > -       if (!system_uses_ttbr0_pan())
> > > +       if (!system_uses_ttbr0_pan() || mm_is_efi(mm))
> > >                 cpu_switch_mm(mm->pgd, mm);
> > >  }
> >
> > I think I'd prefer to avoid special-casing this, if we can. I was just
> > thinking of the diff below.
> 
> Tested the v2 approach (__efi_fpsimd_begin() before
> uaccess_ttbr0_enable()) on the board that originally reproduced the
> oops: Khadas VIM3, Amlogic A311D (4x Cortex-A73 + 2x Cortex-A53, no
> FEAT_PAN, so CONFIG_ARM64_SW_TTBR0_PAN is in use), EDK2-based UEFI
> firmware, v7.0.12 plus this change alone (my prior workaround removed).
> 
> Both firmware description modes were exercised (DeviceTree and ACPI
> boots of the same system):
> 
>   - 3,000,000 GetVariable calls (three concurrent readers) plus
>     200,000 GetTime calls per mode, under sustained CPU contention
>     (busy-loop load on half the cores to force scheduling in the call
>     window) - i.e. 6.4M calls total across the ACPI and DeviceTree
>     boots of the same system
>   - SetVariable create/write/delete round-trips in both modes
>   - ~15 reboots/power cycles (ResetSystem) and clean shutdowns across
>     the session
> 
> Zero efi_call_rts faults and zero "Unable to handle kernel access to
> user memory" events; efivars and the EFI RTC remained functional
> throughout, and poweroff/reboot stayed clean. Under the unpatched
> preemptible path the same board faulted within thousands of calls with
> comparable contention, so this comfortably clears the reproduction
> threshold.
> 
> Tested-by: gus bourg <gus@bourg.net>

Thanks for giving it a spin. I'll send it out as a proper patch.

Will

