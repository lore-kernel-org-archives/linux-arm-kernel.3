Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E65010A3D8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbHnBtjvbra5+LRx9NtxkjXhFGZRRoduS2A97aiNLvk=; b=r9dpHAblHMZPpizpEAhnx8Rum3
	WC3Ee2dT4zi3RmwpMV+irvSVFoPz+7syAJwrJ79/Wju5ZY6tkWOlXFdcfBqE2Q90w3PtWnSajAxn6
	JrR+nce1uzzZk2IOzZm+gEcOz0uO7+DgqJ0mGwIats/Pkaj4G3FdODR9fo0SQ2vbsrAF26f/jXuEl
	MR2evdpWXlEyOj7BntEe5/hEI0G/xNrp3UjhlA30HndW8NzpMBU4rSCmd4tghp+gaxb4VCGAHsa0F
	QZXgOf88GxTViUw37GEf97jDsZ68mazMEaR/9RT8WDOgxEAjUVOypYGVcJ/l+SAZGPxIxfTfOGqEc
	Ll+rbskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k9v-00000005URc-3iIQ;
	Thu, 26 Mar 2026 12:49:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k9u-00000005URT-0oD7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CAE860103;
	Thu, 26 Mar 2026 12:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC68AC116C6;
	Thu, 26 Mar 2026 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774529396;
	bh=9EnC73UJMvC+ggET7kvHMNECqIIbpyprn+Rs/3zGlU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZA/05io3UVQH3utmerGfUMGXTXoc6wRUaGANt/ShbFdUtShd4kUt0y2DfIV9boYnd
	 YIPUqpJDlb1Ce0dDhXf/FAclEOjg+ZckMkqJEmz1UA8cOvQXFmr3SOfVQMFOqQx92i
	 ItAcQhogrjFcPhwwP3yJh4XmduD0A4szO0RqjG+gM10NqrWXs9KXE+q98xhmmnR7sO
	 sWUskyqUrGxCyPI7p4teIxRK2ZYIYV4rqxuZ7V66Gzm7YZu/2ZBifz9Ztx32MKBcft
	 b+iq+1Emk+kCA8BYyyCj3hca1NHn+i63Nw7hm60q2uHve0O2i8UdtvKbPvQt96TNGM
	 /nPtGNT20LTCQ==
Date: Thu, 26 Mar 2026 12:49:51 +0000
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Disable TRBE Trace Buffer Unit when
 running in guest context
Message-ID: <acUrb1WX9M9eMXIV@willie-the-truck>
References: <20260227212136.7660-1-will@kernel.org>
 <20260227212136.7660-2-will@kernel.org>
 <CA+EHjTxcc2FArmi1hu17LW3BHUZ5zTnqbaQP0kbV39HXZfp9+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxcc2FArmi1hu17LW3BHUZ5zTnqbaQP0kbV39HXZfp9+Q@mail.gmail.com>
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

On Wed, Mar 25, 2026 at 07:27:32PM +0000, Fuad Tabba wrote:
> On Fri, 27 Feb 2026 at 21:22, Will Deacon <will@kernel.org> wrote:
> >
> > The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
> > generation in guest context when self-hosted TRBE is in use by the host.
> >
> > Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
> > TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
> > per R_YCHKJ the Trace Buffer Unit will still be enabled if
> > TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
> > Trace Buffer Unit can perform address translation for the "owning
> > exception level" even when it is out of context.
> >
> > Consequently, we can end up in a state where TRBE performs speculative
> > page-table walks for a host VA/IPA in guest/hypervisor context depending
> > on the value of MDCR_EL2.E2TB, which changes over world-switch. The
> > potential result appears to be a heady mixture of SErrors, data
> > corruption and hardware lockups.
> >
> > Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
> > draining the buffer, restoring the register on return to the host. This
> > unfortunately means we need to tackle CPU errata #2064142 and #2038923
> > which add additional synchronisation requirements around manipulations
> > of the limit register. Hopefully this doesn't need to be fast.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Oliver Upton <oupton@kernel.org>
> > Cc: James Clark <james.clark@linaro.org>
> > Cc: Leo Yan <leo.yan@arm.com>
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Fuad Tabba <tabba@google.com>
> > Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> > Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  arch/arm64/include/asm/kvm_host.h  |  1 +
> >  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 73 ++++++++++++++++++++++++++----
> >  arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
> >  3 files changed, 66 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 5d5a3bbdb95e..1532ad2b2ec2 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -770,6 +770,7 @@ struct kvm_host_data {
> >                 u64 pmscr_el1;
> >                 /* Self-hosted trace */
> >                 u64 trfcr_el1;
> > +               u64 trblimitr_el1;
> >                 /* Values of trap registers for the host before guest entry. */
> >                 u64 mdcr_el2;
> >                 u64 brbcr_el1;
> > diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > index 2a1c0f49792b..3dbdee1148d3 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> > @@ -57,12 +57,56 @@ static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
> >         write_sysreg_el1(new_trfcr, SYS_TRFCR);
> >  }
> >
> > -static bool __trace_needs_drain(void)
> > +static void __trace_drain_and_disable(void)
> >  {
> > -       if (is_protected_kvm_enabled() && host_data_test_flag(HAS_TRBE))
> > -               return read_sysreg_s(SYS_TRBLIMITR_EL1) & TRBLIMITR_EL1_E;
> > +       u64 *trblimitr_el1 = host_data_ptr(host_debug_state.trblimitr_el1);
> >
> > -       return host_data_test_flag(TRBE_ENABLED);
> > +       *trblimitr_el1 = 0;
> > +
> > +       if (is_protected_kvm_enabled()) {
> > +               if (!host_data_test_flag(HAS_TRBE))
> > +                       return;
> > +       } else {
> > +               if (!host_data_test_flag(TRBE_ENABLED))
> > +                       return;
> > +       }
> 
> Can we simplify this? e.g.,
> 
> +      bool needs_drain = is_protected_kvm_enabled() ?
> host_data_test_flag(HAS_TRBE) : host_data_test_flag(TRBE_ENABLED);
> ....

Good idea. I tend to avoid 'bool's as they often make the code less
readable in my experience, but in this case it would be a lot better
than the nested conditionals I have. I'll spin a v3!

> That said:
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,

Will

