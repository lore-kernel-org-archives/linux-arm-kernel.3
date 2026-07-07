Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D83C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfqKIJOu25jIvGp/MHMBBQ/zA+78h3cOEbJXVr/juXc=; b=FbfY2wyNVQlY7pn07WqGSQiBmV
	AuETlEBWJE6Bw86rLbNGniXnWDh1Ly3QMtCof3CBF6Eh+tblKWI3BIEEqPBBzxE4iJvi6lYSCt/gg
	1rvsAFXL2CGcWPqRP36zs1Gd0ITJ7jSieCtB7gOoCx7cT9435JKPBkMp1+Ub/U70i6VmnizDP3N30
	VwII+96J7rRZuniRhljFbGL40JcMoRPomTWkmi0tl5sYVtszxIAjh8fc3r/P1byQKflx9WxjNK8sR
	HYcAC8hDr0TrpbezgwRjZVwRD/ci30MtJPuk7U2ZitB5G+GHKi9OAu34RZFKX19UStYHowrEgqgB6
	0fc0Jicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Pk-0000000EtoO-3YUP;
	Tue, 07 Jul 2026 11:56:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4Pg-0000000EtkA-3en1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:56:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C58A36001D;
	Tue,  7 Jul 2026 11:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D371F01559;
	Tue,  7 Jul 2026 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783425391;
	bh=dfqKIJOu25jIvGp/MHMBBQ/zA+78h3cOEbJXVr/juXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kLaFw+j20wmNLTAhrt8SIoCgi9fuNsefFqDsKoq3ghMgJ5Coo4Ut3x6FW3iCmq2x/
	 yQHHKkJGahcmV/iDfAtzZcAIwFnChkHsZ559TRHDa+R+17elV+tA8aXeBdG5dFX0IF
	 ZQ6rKwJAz9F6j5yse9QyvZCy6y/s4KT4of1GKlH+SOA+4ICqfwTr1Bi53BtYDcWoa3
	 +eDl9knq8FmECFBkGnqsDgov0sPFtDdzYCGEj8nl9zs3C2UmmS0slodBDe68tFbgHf
	 59y6nJoHWBs1upSEtDDn3IeWxo1Ah6xvbMFs9sI3awvukoaxp8Z/RKK0nWwnyivcpT
	 vsaHe8lUAaeCg==
Date: Tue, 7 Jul 2026 12:56:24 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>, sudeep.holla@kernel.org
Cc: catalin.marinas@arm.com, oupton@kernel.org,
	Sebastian Ene <sebastianene@google.com>, jens.wiklander@linaro.org,
	joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com
Subject: Re: (subset) [PATCH v9 0/6] arm_ffa, KVM: Fix FF-A emad offset
 calculations
Message-ID: <akzpaD3VmMp8Dq4S@willie-the-truck>
References: <20260702103848.1647249-1-sebastianene@google.com>
 <178342187223.1892339.1923162787460489447.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178342187223.1892339.1923162787460489447.b4-ty@kernel.org>
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

On Tue, Jul 07, 2026 at 11:58:01AM +0100, Marc Zyngier wrote:
> On Thu, 02 Jul 2026 10:38:37 +0000, Sebastian Ene wrote:
> > This series fixes the Endpoint Memory Access Descriptor (EMAD) offset
> > calculations and adds the necessary bounds checks for both the core
> > FF-A driver and the pKVM hypervisor.
> > 
> > Prior to FF-A version 1.1, the memory region header didn't specify an
> > explicit offset for the EMADs, leading to the assumption that they
> > immediately follow the header.
> > However, from v1.1 onwards, the specification dictates using the
> > ep_mem_offset` field to determine the start of the memory access
> > array.
> > 
> > [...]
> 
> Applied to fixes, thanks!
> 
> [3/6] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
>       commit: 8c6db30d79528279abbeb416e4f533f1f91b8724
> [4/6] KVM: arm64: Validate the offset to the mem access descriptor
>       commit: a6b49d27c17909608d54523220bb6f3498d4a1df
> [5/6] KVM: arm64: Ensure FFA ranges are page aligned
>       commit: 6a7a181f6921db3d9aed1bba7e15547fefd7eedc
> [6/6] KVM: arm64: Zero out the stack initialized data in the FFA handler
>       commit: 2bd3c6c702f3a9e2bcb3b536b0fbbaa645005d71

Thanks, Marc!

I think Sudeep was also happy for the driver changes to go via the KVM
tree, unless you'd prefer not to pick them up [1].

Will

[1] https://lore.kernel.org/r/20260518-heavy-intelligent-partridge-ddc80b@sudeepholla

