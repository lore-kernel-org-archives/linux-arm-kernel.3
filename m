Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE883E83821
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUkS1R4gKSa9gYnFOdTnGq/mTEqeUYV+1IEX0/Uf5GY=; b=SC9f84+7wxDazkFQ/+kmjYUThP
	oTEMLwerH/f2GxmZhADcUDAqFCVlgI8sj+WH/V6mQzjnIE7FNyuZP4X/gyxyL8FRw+N3Z/o7PzdC0
	hJVFtMeZ5lex52VSVPm2qUuamZ7o4hlvHiwkEwHC5vC2+kdWxMLojZIeJgppo6+9aNkVfSjBF7ymW
	sF2eCDTB8OituVzDtODwDDvG2Px8PymBTcT7SO33PiI29MiesbONzl6ME6xUvUUNwAn20AHctoRqD
	KnLzsu0AML5cKqJ1CvLFof+CM3shrJH4TOclt8f/JIxlI7Aql70HJ3+zFBgWZo8TY55Q9bgDsz6BH
	ss+TVIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs36w-000000078gr-3OGU;
	Mon, 16 Feb 2026 18:14:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs36v-000000078gl-20mt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E28460133;
	Mon, 16 Feb 2026 18:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70838C116C6;
	Mon, 16 Feb 2026 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771265656;
	bh=YxgSyIDm9AQ+DZmvuPojtK1Q533/tuFWmV3R30ZqBUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3yvne0x3LHrXWCYdzoHRqyWySnpaFIm0v5963C8qQkMOsZSShfA3rIKHBMlErv6y
	 bHsrBFKaDj+zL3bECrf4iXEe3Kq4sIzQLgr+llKsMAMiRaFTJycySWiKH+BSMZ8Y/v
	 ENoQ7L0ejrOxdRwJrxWlThSNDHihtts/yoWPp9S4qHxeJFalP7bzoMg6pIu/jkp1Tt
	 +P1X5n8pdf6+5kq1VTkmNT1WLKlB4fNJbdDBvVbnYhzE5ZTglK2T+FFDmOChGEQZsM
	 PX80t7YPLBjtHN4ShaAK/sIIjS5KcI/CvLJ4pBTS+K5oZzrpJ2qAi6/kpg9BjU3qOX
	 5aL1pOrUeI7yA==
Date: Mon, 16 Feb 2026 18:14:11 +0000
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <aZNec3B0Iou9PYGw@willie-the-truck>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
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

On Mon, Feb 16, 2026 at 03:05:10PM +0000, James Clark wrote:
> On 16/02/2026 2:29 pm, Marc Zyngier wrote:
> > On Mon, 16 Feb 2026 13:09:59 +0000,
> > Will Deacon <will@kernel.org> wrote:
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > > index 2a1c0f49792b..fd389a26bc59 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > > @@ -57,12 +57,27 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
> > >   	write_sysreg_el1(new_trfcr, SYS_TRFCR);
> > >   }
> > > -static bool __trace_needs_drain(void)
> > > +static void __trace_drain_and_disable(void)
> > >   {
> > > -	if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
> > > -		return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
> > > +	u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
> > > -	return host_data_test_flag(TRBE_ENABLED);
> > > +	*trblimitr_el1 = 0;
> > > +
> > > +	if (is_protected_kvm_enabled()) {
> > > +		if (!host_data_test_flag(HAS_TRBE))
> > > +			return;
> > > +	} else {
> > > +		if (!host_data_test_flag(TRBE_ENABLED))
> > > +			return;
> > > +	}
> > > +
> > > +	*trblimitr_el1 = read_sysreg_s(SYS_TRBLIMITR_EL1);
> > > +	if (*trblimitr_el1 & TRBLIMITR_EL1_E) {
> > > +		isb();
> > > +		tsb_csync();
> > > +		write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> > > +		isb();
> 
> The TRBE driver might do an extra drain here as a workaround. Hard to tell
> if it's actually required in this case (seems like probably not) but it
> might be worth doing it anyway to avoid hitting the issue. Especially if we
> add guest support later where some of the affected registers might start
> being used. See:
> 
>     if (trbe_needs_drain_after_disable(cpudata))
>         trbe_drain_buffer();

Oh great, this thing sucks even more than I realised!

But thanks for pointing that out... this is presumably erratum #2064142,
but we probably need to look at #2038923 as well :/

I can't find any public documentation for the problems, but based on the
kconfig text then I think we care about #2064142 so that the TRBE
register writes when restoring the host context are effective and we
care about #2038923 to avoid corrupting trace when re-enabling for the
host.

It also looks like we can't rely on the dsb(nsh) in the vcpu_run()
path if that needs to be before the write to TRBLIMITR_EL1.

In which case, the host->guest something hideous like:

	isb();
	tsb_csync();	// Executes twice if ARM64_WORKAROUND_TSB_FLUSH_FAILURE!
	dsb(nsh);	// I missed this in my patch
	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
	if (2064142) {
		tsb_csync();
		dsb(nsh);
	}
	isb();

and then the guest->host part is:

	write_sysreg_s(trblimitr_el1, SYS_TRBLIMITR_EL1);
	isb();
	if (2038923)
		isb();

Does that look right to you?

Will

