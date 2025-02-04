Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B5DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1yOgJGioVmDsqu8CmCo3aMNjFC8dpIVHIMsONd3BP8=; b=zdVt0S74cEhijq7W/eIFQYTmJY
	EoavEKLI/mJOfQn2mQa+J5jtGXRCTLBzouHjLPOgFTkYVwEqFX217f/pu/Zn9HN8ROXJQrIBJMxv+
	DQ9rqHa9MDTsmXOtD9pLjLmUq+Sp3YpAPfeBpJNnXkrDwXp4hmWRHRI+e6LRRwEUr2VGaZoEL0+Ih
	Qk0MNmYu2mlcb/dI8iQcbP58Y7yVRJZpB3uvcgl3TYWMpAkMaU14g71XMM83P+YdTaMmRyRMBJSu1
	NqW8HWjvfzKRXC30AWDrHFKyQtpPXn63VelyHNf02dSDr9MIWIlpuutXiaRbunzD7jmq7vMP/jZ+y
	ywP5hnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFlX-0000000070b-0P97;
	Tue, 04 Feb 2025 10:02:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFjA-000000006K7-2Ltj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 10:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD1035C5D01;
	Tue,  4 Feb 2025 09:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D432C4CEDF;
	Tue,  4 Feb 2025 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738663219;
	bh=k/p4/X4h0Jx3RXGmvshNwq/XOpVJtXNZ3/ebrqANT8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3fXHPgL+aKQPpIvzAfKLGA7t/VlVyLNkOt4X+cbPIMuRAIgwwvNc7BaBMFb0oqYl
	 aQfBGvuu3k+Zlnqxc9f9c7xKSsJcXiv3ONRt6ktdlVNX9YPN3uEkuv1Lnc0rX1l73g
	 RA93csTIhpDdLWXXWICit9Aa7BRsGqwXu2bHBK9xD7iZdxbALekR+SUxcmqFHo24H8
	 qd4U8OAWt9LtJ1m8uq66xFavrA3D72LBK3dbPz3EyE9AZ1+2ZJb43M95xY3eYyP2qj
	 IRlo1Rn06jEypEIN3XjIoxrWkB7j5uGJ2yDfuRBOi2qUBq9DLNEDMfWCgk8TSuNShE
	 3Mdq2SVs3PiKw==
Date: Tue, 4 Feb 2025 10:00:14 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Emanuele Rocca <emanuele.rocca@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <20250204100014.GA777@willie-the-truck>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
 <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_020020_686629_83811454 
X-CRM114-Status: GOOD (  24.03  )
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

On Fri, Jan 31, 2025 at 01:54:57PM +0000, Mark Rutland wrote:
> On Fri, Jan 31, 2025 at 12:41:04PM +0000, Will Deacon wrote:
> > Anyway, it looks like x6 gets trashed across the SMC. I think that's fine
> > per the SMCCC spec:
> > 
> >   | Unused result and scratch registers can leak information after an
> >   | SMC or HVC call. An implementation can mitigate this risk by either
> >   | preserving the register state over the call, or returning a constant
> >   | value,such as zero, in each register.
> 
> I think that's misleading/stale and x6 specifically is not supposed to
> be clobbered. Shortly before that there's wording about preserving the
> registers, summary/history below:
> 
> * SMCCC v1.0 allowed x0 to x17 to be clobbered over a call; all other
>   GPRs had to be preserved.
> 
>   That was defined in ARM DEN 0028B, AKA "SMC CALLING CONVENTION":
>   https://developer.arm.com/documentation/den0028/b/?lang=en
> 
> * SMCCC v1.1 mandated that x4 to x17 were preserved. This was critical
>   for some of the ARCH_WORKAROUND_* calls made from kernel/kvm entry
>   asm.
> 
>   That was defined in ARM DEN 0070, AKA "Firmware interfaces for
>   mitigating cache speculation vulnerabilities":
> 
>   https://developer.arm.com/cache-speculation-vulnerability-firmware-specification

I can't find "DEN 0070" anywhere there...

> * SMCCC v1.2 relaxed things such that x4 to x17 must be preserved
>   *unless* they contained results of the function.
> 
>   That was defined in ARM DEN 0028C, AKA "SMC CALLING CONVENTION":
>   https://developer.arm.com/documentation/den0028/c/?lang=en
> 
>   .. which folded inthe requirements from ARM DEN 0070, with the
>   relaxation above, but also kept the stale not from ARM DEN 0028B.
> 
> In Linux we depend on x4 to x17 not being clobbered *unless* they're
> being used to return a result.
> 
> The current wording in the spec is messed up, and suggests that SMC32
> calls could clobber the upper 32 bits of x4 to x17, which is inccorect
> and would break the ARCH_WORKAROUND_* calls mentioend above (given those
> are SMC32). I'll go chase the SMCCC architects about that; it's clearly
> an unintentional error when reformatting the document.
> 
> The *intent* is that x4 to x17 are preserved here. AFAICT, nothing in
> arm_smccc_version_init() returns a value in x4 to x17. If any of those
> are clobbered for an SMCCCv1.1 call, it's definitely a firmware bug.

Perhaps, but I must admit that I have sympathy for the f/w developers
here given that the latest spec on the Arm website says that they can do
this and the spec that apparently requires the registers to be preserved
is either missing or hard to find. How are they supposed to know what
the intention was when the documentation definitively says something
else?

Emanuele -- could you hack the code to poison the other unused result
registers () and see if they are also cleared? ARM_SMCCC_TRNG_VERSION
looks like a 32-bit call, so that would be W1-W7 afaict.

Will

