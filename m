Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5606A1090241
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R22VXrRBbk3HUxII7Rd/TKJsARrw7m6XgPmiO/BY8lI=; b=Wsc+gmbmDnHOVpm4hw2d99Huoy
	igilyK6ywEH+/di8BXYZQ6RYaDdZU0s+V+jzQVptxR0kfvkb9o/rDGkO1idDwnFPrNMjAABCi6m/P
	Xiged+pf9EGkgFJiymGwrGJFks6dJLWipK2/EzB13VhoR6wEqIqhZGAX1j57ajraWwrWm5EYtpiXH
	Gp/4LnTXbQcVU/dW+yMNHz1pbGc8qQNV5hIKwBHPrr6vcnNwN9c/gNtQ2E3l9vW4BNfSo+HGUDTMJ
	n29RxclsXvPfsrE/e2KVLhPUVm61K+QLlEvq5dlGQjYUwzUzTgORfAxmdTWDJLc7ZjZ5MvcSFLZY/
	FlZoY71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FZK-0000000Aw5f-2PsW;
	Thu, 19 Mar 2026 15:45:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3FZI-0000000Aw4w-0piC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 15:45:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8DE81A25;
	Thu, 19 Mar 2026 08:45:43 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8954C3F778;
	Thu, 19 Mar 2026 08:45:48 -0700 (PDT)
Date: Thu, 19 Mar 2026 15:45:45 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 3/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <abwaKf3F0Ya3wyxl@arm.com>
References: <20260318191918.2653160-1-catalin.marinas@arm.com>
 <20260318191918.2653160-4-catalin.marinas@arm.com>
 <abv65n3fhvYDEez0@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abv65n3fhvYDEez0@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_084552_384496_0D6D4FD2 
X-CRM114-Status: GOOD (  27.17  )
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

Hi Will,

Thanks for the review.

On Thu, Mar 19, 2026 at 01:32:22PM +0000, Will Deacon wrote:
> Are you planning to take this for 7.1 or would you like me to take it
> via for-next/fixes? I'm leaning towards the former so it can simmer in
> -next for a bit...

Yes, it makes sense.

> On Wed, Mar 18, 2026 at 07:19:15PM +0000, Catalin Marinas wrote:
> > C1-Pro acknowledges DVMSync messages before completing the SME/CME
> > memory accesses. Work around this by issuing an IPI to the affected CPUs
> > if they are running in EL0 with SME enabled.
> > 
> > Note that we avoid the local DSB in the IPI handler as the kernel runs
> > with SCTLR_EL1.IESB=1 This is sufficient to complete SME memory accesses
> > at EL0 on taking an exception to EL1. On the return to user path, no
> > barrier is necessary either. See the comment in sme_set_active() and the
> > more detailed explanation in the link below.
> 
> Missing link?

Ah, I eventually moved it to a comment in the code directly. I'll add it
here as well.

> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 38dba5f7e4d2..f07cdb6ada08 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1175,6 +1175,18 @@ config ARM64_ERRATUM_4311569
> >  
> >  	  If unsure, say Y.
> >  
> > +config ARM64_ERRATUM_SME_DVMSYNC
> 
> Any reason not to call this ARM64_ERRATUM_4193714 like we do for other
> hardware bugs?

Future-proofing, in case it becomes a feature ;).

I'll change it. I think when I started I didn't have the number (or did
not know where to look for it). I was too lazy to change it afterwards.

> > diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> > index 1d2e33559bd5..129c29aa0fc4 100644
> > --- a/arch/arm64/include/asm/fpsimd.h
> > +++ b/arch/arm64/include/asm/fpsimd.h
> > @@ -428,6 +428,24 @@ static inline size_t sme_state_size(struct task_struct const *task)
> >  	return __sme_state_size(task_get_sme_vl(task));
> >  }
> >  
> > +void sme_enable_dvmsync(void);
> > +void sme_set_active(unsigned int cpu);
> > +void sme_clear_active(unsigned int cpu);
> > +
> > +static inline void sme_enter_from_user_mode(void)
> > +{
> > +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_SME_DVMSYNC) &&
> > +	    test_thread_flag(TIF_SME))
> > +		sme_clear_active(smp_processor_id());
> > +}
> > +
> > +static inline void sme_exit_to_user_mode(void)
> > +{
> > +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_SME_DVMSYNC) &&
> > +	    test_thread_flag(TIF_SME))
> > +		sme_set_active(smp_processor_id());
> > +}
> 
> nit: You could push smp_processor_id() down into sme_{set,clear}_active()
> since they are always called for the running CPU.

Yes, I can. What I had in mind from an API perspective was that the
caller knows preemption is disabled while the callee may not. But it's
only this caller, so fine by me with moving the smp_processor_id() to
those function.

If we ever add support for SME in guests with this erratum, we may
call the same function (not sure yet), just need to make sure preemption
is disabled or add a check. OTOH, I'd rather disable SME in guests
altogether for these CPUs.

I'll address the other points and repost next week.

Thanks.

-- 
Catalin

