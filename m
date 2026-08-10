Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8522EC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI5k/9cl/ieyg839FRaHqV6Z6OMpnh4gRsszIL3A9lg=; b=EFzM8YCf4gDpSWMvCI3jZI+R9l
	yMYJceavFU1zI7p1I9HIkORC6Vkro0wHQ7J1wwvtZ9zVseajiT94kd7ySeXBsYLOPQQYS6gVI6ehY
	7BRMfRDwGFabaHQnX0bHO4Pq9CTTF6aPD/UTvAycGjWevkNploFI+OoMHCXnx2rs+tClv5szqVGOk
	SL+/M4X7Gvee74XAbABH0x+I0hwDxOTtOGGGH+dEXPZ1wj8kW7oMkKNhPfcjEnOm9OvfTO4O+gE5Q
	36Zs6MlI+SMTx33KHPcrN2hjenDPNi9Shu4IlXHTI3fht/naLKpYWC25tZ9DwpEfn/IqXXDOlVL/f
	Qfe+bdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNoI-0000000BZJR-2xi1;
	Mon, 10 Aug 2026 11:04:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNoH-0000000BZJK-3QqX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:04:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7583040BB9;
	Mon, 10 Aug 2026 11:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61451F000E9;
	Mon, 10 Aug 2026 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786359889;
	bh=gI5k/9cl/ieyg839FRaHqV6Z6OMpnh4gRsszIL3A9lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agFE+wD2ubNxyH2+bC30Mu/nvDhuGf1lGI3fxZ/VlwVou3BrvUsWA7v4mCYflP98/
	 kPVS4JMrHfPPPmEX+4ZYWdGl6/7jYRoOzQl7CpCbMw+Ko/cjrW18eK4AfiaTfuYmNL
	 65R4p7p/Y+hIA09oKr0+sPh7RFa1OVE0RSj7jJkMWPHqr8lwZsFrAQGfYtbdBtZvfU
	 gqYDKcPsYDSQDYwsGhMaesZH+JL6sfSehZ5GqLGzxnsJjWltMPL0ab8Q10pn8NHHQX
	 /8oEijyKs2b1HC0gt1WHvozn3osKhAYEHhjTrLDv/RaIuBXyscRynMFasSMqQ/Flhs
	 OGmn1HDOvO3Vw==
Date: Mon, 10 Aug 2026 12:04:44 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: gus bourg <gus@bourg.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/efi: Do not call EFI runtime services preemptibly
 under SW PAN
Message-ID: <anmwTDnFR2cgxkqR@willie-the-truck>
References: <20260806000144.3388823-1-gus@bourg.net>
 <anXMug2_-vZl_pZ7@willie-the-truck>
 <30c5499e-8041-4e39-933b-c5220d53be77@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30c5499e-8041-4e39-933b-c5220d53be77@app.fastmail.com>
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

On Fri, Aug 07, 2026 at 04:56:00PM +0300, Ard Biesheuvel wrote:
> 
> 
> On Fri, 7 Aug 2026, at 15:16, Will Deacon wrote:
> > On Wed, Aug 05, 2026 at 05:01:44PM -0700, gus bourg wrote:
> >> From: Gus Bourg <gus@bourg.net>
> >> 
> >> When PAN is emulated by switching TTBR0_EL1, arch_efi_call_virt_setup()
> >> installs the EFI mm into TTBR0_EL1 via uaccess_ttbr0_enable(), and only a
> >> return from exception ever puts it back: check_and_switch_context() skips
> >> the register write by design ("Defer TTBR0_EL1 setting for user threads to
> >> uaccess_enable() when emulating PAN"), and __switch_to() does not touch it
> >> either. switch_mm() updates only thread_info->ttbr0.
> >> 
> >> Since commit a5baf582f4c0 ("arm64/efi: Call EFI runtime services without
> >> disabling preemption") the runtime call is preemptible, so the EFI worker
> >> can now be scheduled out inside that window. An involuntary preemption is
> >> harmless, because __swpan_entry_el1()/__swpan_exit_el1() save and restore
> >> the state around the exception. A voluntary reschedule is not: it performs
> >> no return from exception, so the worker resumes with another task's
> >> TTBR0_EL1 - or reserved_pg_dir - and the next efi_mm access takes a level 0
> >> translation fault.
> >> 
> >> There is such a preemption point in arch_efi_call_virt_setup() itself,
> >> immediately after the TTBR0 install: __efi_fpsimd_begin() ->
> >> kernel_neon_begin() -> put_cpu_fpsimd_context() -> local_bh_enable() ->
> >> preempt_check_resched().
> >
> > Hmm, can we move the ttbr0 toggling until after __efi_fpsimd_begin() so
> > that this preemption point doesn't interfere?
> >
> 
> Either that, or tweak the logic so that the switch is done eagerly in
> this particular case (untested):
> 
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -266,7 +266,7 @@
>          * Defer TTBR0_EL1 setting for user threads to uaccess_enable() when
>          * emulating PAN.
>          */
> -       if (!system_uses_ttbr0_pan())
> +       if (!system_uses_ttbr0_pan() || mm_is_efi(mm))
>                 cpu_switch_mm(mm->pgd, mm);
>  }

I think I'd prefer to avoid special-casing this, if we can. I was just
thinking of the diff below.

Will

--->8

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 30cd7f804398..0ec90fd1754e 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -184,6 +184,8 @@ void arch_efi_call_virt_setup(void)
                efi_virtmap_load();
        }
 
+       __efi_fpsimd_begin();
+
        /*
         * Enable access to the valid TTBR0_EL1 and invoke the errata
         * workaround directly since there is no return from exception when
@@ -191,8 +193,6 @@ void arch_efi_call_virt_setup(void)
         */
        uaccess_ttbr0_enable();
        post_ttbr_update_workaround();
-
-       __efi_fpsimd_begin();
 }
 
 void arch_efi_call_virt_teardown(void)


