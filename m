Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD09FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C+CpvO6YtCQoGKhsvn8PxW/d2mLnKpNMUX8TT1XIbk=; b=1o4hTTuboZyt3D1OL59S5MK6Ym
	Hi42rT0gtObxutMeWHOwE5NC4Akt64gFHHL7a4i4qtAX0icYiqLkCQKHFChJqhltkCLDLLQx1tLos
	pbKGbqk+etTPxK3vKD15WRXMU8NI8cWUz1e4eV72sXTFyUkKWcB9urjubEAbXXwIY955N43x5vbbe
	YwdqoImxcM4brqvhAYvNyXW3CfqugeQRGfxeVkMyuUyAIR4q0b5W1jG+GHX1gtS+ybA6wTa1Q2MmN
	0qHTKOalRClhBCrBTArQRQrTiDS84h9OsFFXRZ3nqF5LEdV6XNR5PiT6keJeX5+9pS+4nTUBf33kO
	ZhQnbzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHdS-0000000Ggbc-4BOP;
	Fri, 24 Jul 2026 15:16:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHdQ-0000000Ggb4-1UUs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:16:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FF661477;
	Fri, 24 Jul 2026 08:16:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 575F73F59E;
	Fri, 24 Jul 2026 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784906181; bh=rKKnjZ1tIKtzJ6HBpjgLc0Ck9asCrea4HP6d5oTMlaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gf3AIoOdSgamjrSz8hHhDZKsUxu/dPE6rojytFhMlLNhMsaKk9o5MxNShE2E6XIxI
	 tcbXXxM6RsEEIQxsdv0tHTlswHgO3YdYm3jnFrpON/Cb0/Iqgu7obS+gT/ysP/ay/7
	 FlJmYEC+lZ9Cbn2OxpdtuBok6Nn9BerpTCPKwdzA=
Date: Fri, 24 Jul 2026 16:16:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v13 02/32] arm64/fpsimd: Ensure all of ZCR_EL1 is
 initialised from idle
Message-ID: <amOBu-SfzZM7M5Oh@J2N7QTR9R3>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
 <20260720-kvm-arm64-sme-v13-2-d9abd3ffa245@kernel.org>
 <amIP42yILYNsNk0e@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amIP42yILYNsNk0e@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081624_533886_FF541F92 
X-CRM114-Status: GOOD (  22.43  )
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

On Thu, Jul 23, 2026 at 01:58:11PM +0100, Mark Rutland wrote:
> On Mon, Jul 20, 2026 at 12:07:29AM +0100, Mark Brown wrote:
> > At present when exiting from idle we do not fully reinitialise ZCR_EL1,
> > we update ZCR_EL1.LEN with a read/modify/write cycle when loading task
> > state but never set any of the other bits to an explicit value.  Since
> > currently they are all architecturally RES0 or RAZ/WI this is not a
> > practical issue but it may become one if further fields are defined in
> > the register so we should explicitly configure the whole register.
> >
> > Rename the existing sme_suspend_exit() (which handles this for SME) to
> > fpsimd_suspend_exit() and add set ZCR_EL1 to 0 there, if needed LEN will
> > be updated when loading task state.
> >
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> While this happens to work today, this is a more general architecture
> problem, and I think we should cc stable such that kernels will work
> reliably on future hardware.
> 
> All stable kernels support SVE, so this needs to go as far back as
> v5.10.y.
> 
> One minor comment below, but with that fixed up (and a CC stable):
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Sorry, having looked at some of the later patches I think this isn't
quite right even with those changes, as we wouldn't have necessary
context synchronization in all cases.

I'll need to dig a bit more to come up with a more concrete solution.

Mark.

> > +void fpsimd_suspend_exit(void)
> >  {
> >  	u64 smcr = 0;
> >  
> > -	if (!system_supports_sme())
> > -		return;
> > +	if (system_supports_sve())
> > +		write_sysreg_s(0, SYS_ZCR_EL1);
> >  
> > -	if (system_supports_fa64())
> > -		smcr |= SMCR_ELx_FA64;
> > -	if (system_supports_sme2())
> > -		smcr |= SMCR_ELx_EZT0;
> > +	if (system_supports_sme()) {
> 
> We should move the 'smcr' variable into this block. That way it's scoped
> to where it matters.
> 
> > +		if (system_supports_fa64())
> > +			smcr |= SMCR_ELx_FA64;
> > +		if (system_supports_sme2())
> > +			smcr |= SMCR_ELx_EZT0;
> >  
> > -	write_sysreg_s(smcr, SYS_SMCR_EL1);
> > -	write_sysreg_s(0, SYS_SMPRI_EL1);
> > +		write_sysreg_s(smcr, SYS_SMCR_EL1);
> > +		write_sysreg_s(0, SYS_SMPRI_EL1);
> > +	}
> >  }
> 
> Mark.
> 

