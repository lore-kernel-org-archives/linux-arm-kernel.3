Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE439CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8/txwDnlI4nQYNcOZsoHtM2Ey0WOFc4nb5qMbB05Hc=; b=pbr/LU6e+2DiVE9QfWxr3VfI1q
	yzIzTj9r5Z/2/UFBb6x4fmcz78tfUMtvJAiJ7uSuNuu2Qxl9z48TUABmZTP6BQa4jpiqO3w9qLhOr
	lqu5FF4rLF4LgtvmyuhjuKHNKt12ijaz1XngYXiXM4u4DIssT1Ii+nREIA5emk8sDfgAwejREpCu3
	DRYKKF4GJZ6gVJLlxzL5AtIlXfVWKKVllVj6SxMo/pIWuxfr5CXWsN/EKF7SzYjWOCQDW7xC7mJan
	USK5Ec2/a3u1i/ACiqXhY9EWeHTzMFHhs8+CrwlI70rcZdz0hk1/ArvNIyAXtUv5bIofzrJXvQLcW
	nMnsa3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWco-00000002ICZ-23Ey;
	Fri, 19 Jun 2026 10:39:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWcg-00000002IBN-02P0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:39:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7BFE293F;
	Fri, 19 Jun 2026 03:38:46 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D90E3F62B;
	Fri, 19 Jun 2026 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781865531; bh=t11mBFRTz90Zla5G7n2blBq+Ez2hOwWd2lYJC6xdYPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NE8H2ry47HVj9GGcAtbh7MNdLemZl0UawKslCZtkX057kggI7H5ErtnFej6E5n+jS
	 chRgH2ytKdIshceZaA9iB5G6XrUjux8kMuT7ZWzlp6QZuzKK3OdFyozGXc+uB2mkFe
	 aT9sBylO4KYP2W1CsUxm+jEFfJdJhA69vPu/xMwM=
Date: Fri, 19 Jun 2026 11:38:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Message-ID: <ajUbcv75FuSPPi9o@J2N7QTR9R3>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
 <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_033854_155734_7B6E1B5E 
X-CRM114-Status: GOOD (  29.10  )
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

On Wed, Jun 17, 2026 at 09:23:03PM +0200, Yureka Lilian wrote:
> On 6/15/26 17:02, Will Deacon wrote:
> > On Mon, Jun 15, 2026 at 02:21:36PM +0200, Yureka Lilian wrote:
> > > Apple Silicon CPUs can lose register state in WFI, leading to crashes
> > > in the idle loop early in the boot process.
> > > This applies to any previous Apple Silicon CPUs too, but is worked
> > > around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
> > > during m1n1's chickens setup.
> > > This workaround no longer exists since M4.

Are we *certain* that there's no equivalent control elsewhere? i.e. this
hasn't just moved?

> > > Add a workaround capability for replacing wfi and wfit with nop, and
> > > an erratum to enable it on the affected CPUs if the workaround using the
> > > sysreg is not already applied. Leave the decision whether the sysreg
> > > workaround can be used up to the earlier parts of the boot chain which
> > > already configure the Apple Silicon chicken bits.
> > > 
> > > This alternative has to be applied in early boot, since otherwise some
> > > cores might enter the idle loop before apply_alternatives_all() is run.
> > > 
> > > Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
> > > Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> > > ---
> > > Changes since v1:
> > > Restricted the erratum to EL2 only, since in EL1 we'd expect the
> > > hypervisor to trap WFI and handle the erratum.

The KVM portion doesn't seem to be implemented in this patch, so we
can't rely on that as-is.

[...]

> > >   #define wfe()		asm volatile("wfe" : : : "memory")
> > >   #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
> > >   				     : : "r" (val) : "memory")
> > > -#define wfi()		asm volatile("wfi" : : : "memory")
> > > -#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
> > > -				     : : "r" (val) : "memory")
> > > +#define wfi()							\
> > > +	do {							\
> > > +		asm volatile(					\
> > > +		ALTERNATIVE("wfi",				\
> > > +			    "nop",				\
> > > +			    ARM64_WORKAROUND_WFI_STATE)		\
> > > +		: : : "memory");				\
> > > +	} while (0)
> > > +#define wfit(val)						\
> > > +	do {							\
> > > +		asm volatile(					\
> > > +		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
> > > +			    "nop",				\
> > > +			    ARM64_WORKAROUND_WFI_STATE)		\
> > > +		: : "r" (val) : "memory");			\
> > > +	} while (0)
> > How can you guarantee that we don't run one of these prior to patching?
> 
> We can't, but there are a few points to our advantage, namely the boot cpu
> isn't actually affected by this (when the CYC_OVRD bits are not configured
> or not supported), and first round of patching happens quite early before
> the other cpus are started.

I think you're saying that:

* On the boot CPU, WFI *never* loses register state.

* On other CPUs, WFI *might* lose register state (and this cannot be
  inhibited).

Is that understanding correct, or are there other conditions where a WFI
on the boot CPU can lose register state?

IIRC kdump doesn't ensure the new kernel is started on the boot CPU, so
I think that would be broken. I guess you can't kexec generally due to a
lack of offlining of secondary CPUs.

Mark.

