Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC02C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 05:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNfyjJ36NwMo27wB3yA4lOZ9U2Fsk9+3dltOkC7RDUE=; b=ajRwdoIhgJUb2GQn6lKgTn212I
	2GA1oUhbaCKwl2mierzZr5G/NU83LFxpd6cjZkVsFL/doSC4QYHL7aELdYI89XJM7i7/l+DR2jHQa
	8BLYTKa28rSQVCkwmugK3QG3WaPw8Y05DJ8Od0c7ZpniMk5uYNGR0wrbzxoBQK3/3MazdgUr85+8Y
	oDEWYoXK39yjtyWWSX6Ly2wVynm8Ql17ZdOJQ+RrBKE/D9/vVXOKORBnN+S3paRK6XGQ25+OR7Ge0
	vEJCOi5NrhvP56mI0NSNJwRjNlo6UrGca/OcNN0CFEWP/fJ01S39mf3DkdgWhIvWAxJyg5in+utO7
	JVJ7uTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1fGT-0000000GUHh-07sP;
	Mon, 07 Apr 2025 05:43:21 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1f94-0000000GT8p-1XDS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 05:35:44 +0000
Date: Sun, 6 Apr 2025 22:35:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744004138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNfyjJ36NwMo27wB3yA4lOZ9U2Fsk9+3dltOkC7RDUE=;
	b=Ho0knh0xTy/U6S07jKpiwc1tvurITGV4mcne2YhLXL2Rn6cx3FnLTTNaMt27AwnJgeBq6H
	+TzMKPCaBi/Ke6MgVhhKc9uyOD2BPbMMn3jOQSa5bxoveD0Tb0fYKCBa4KW7K9ohcrUd6O
	D3h0nI+wvSMyFHJP3zSreSgpZecBsKA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	shuah@kernel.org, jonathan.cameron@huawei.com,
	shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	tangchengchang@huawei.com
Subject: Re: [PATCH v2 6/6] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
Message-ID: <Z_NkHWStDJLo0cmY@linux.dev>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-7-yangyicong@huawei.com>
 <Z-wQuJAefT3xNipl@linux.dev>
 <e9674079-9a22-c3cd-3b00-5989f6926303@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9674079-9a22-c3cd-3b00-5989f6926303@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_223543_097325_59904DFD 
X-CRM114-Status: GOOD (  28.11  )
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

On Mon, Apr 07, 2025 at 11:33:01AM +0800, Yicong Yang wrote:
> On 2025/4/2 0:13, Oliver Upton wrote:
> > On Mon, Mar 31, 2025 at 05:43:20PM +0800, Yicong Yang wrote:
> >> @@ -1658,6 +1658,25 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > Keep in mind that data aborts with DFSC == 0x35 can happen for a lot
> > more than LS64 instructions, e.g. an atomic on a Device-* mapping.
> > 
> 
> got it. 0x35 should be caused by LS64* or IMPLEMENTATION DEFINED fault, but no
> further hint to distinguish between these two faults. hope it's also the right
> behaviour to inject a DABT back for the latter case.

There isn't exactly a 'right' behavior here. The abort could either be
due to a bug in the guest (doing an access on something knows it can't)
or the VMM creating / describing the IPA memory map incorrectly.

Since KVM can't really work out who's to blame in this situation we should
probably exit to userspace + provide a way to reinject the abort.

> >> @@ -1919,6 +1939,21 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
> >>  			goto out_unlock;
> >>  		}
> >>  
> >> +		/*
> >> +		 * If instructions of FEAT_{LS64, LS64_V} operated on
> >> +		 * unsupported memory regions, a DABT for unsupported
> >> +		 * Exclusive or atomic access is generated. It's
> >> +		 * implementation defined whether the exception will
> >> +		 * be taken to, a stage-1 DABT or the final enabled
> >> +		 * stage of translation (stage-2 in this case as we
> >> +		 * hit here). Inject a DABT to the guest to handle it
> >> +		 * if it's implemented as a stage-2 DABT.
> >> +		 */
> >> +		if (esr_fsc_is_excl_atomic_fault(esr)) {
> >> +			kvm_inject_dabt_excl_atomic(vcpu, kvm_vcpu_get_hfar(vcpu));
> >> +			return 1;
> >> +		}
> >> +
> > 
> > A precondition of taking such a data abort is having a valid mapping at
> > stage-2. If KVM can't resolve the HVA of the fault then there couldn't
> > have been a stage-2 mapping.
> > 
> 
> Here's handling the case for emulated mmio, I thought there's no valid stage-2 mapping
> for the emulated MMIO? so this check is put just before entering io_mem_abort(). should
> it be put into io_mem_abort() or we just don't handle the emulated case?

Right -- there's no valid stage-2 translation for _most_ MMIO. If KVM
cannot find an HVA for the fault (look at the condition that gets us
here) then we know there isn't a stage-2 mapping. How would we know what
to map?

In that case I would expect to take a Translation fault with instruction
syndrome that can can be used to construct an exit to the VMM. Marc had
some patches on list to do exactly that [*].

However, after reading this again there's a rather ugly catch. The KVM
ABI has it that writes to a RO memlot generate an MMIO exit, so it *is*
possible to get here w/ a stage-2 mapping. Unfortunately there's no
instruction syndrome with DFSC = 0x35 so no way to decode the access.

This is starting to sound similar an nISV MMIO abort...

[*]: https://lore.kernel.org/kvmarm/20240815125959.2097734-1-maz@kernel.org/

Thanks,
Oliver

