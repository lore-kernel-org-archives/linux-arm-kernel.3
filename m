Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BE9CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/zSYhlf0XUMz4UMm9FSlubQHqk4IYQKjvjWJ9kLyN4=; b=x81YQfazglltA90PS6eWpQ8Gq1
	Amy3nt9R6zzksYM8iLlcaeCPq959VPDzo3bFr29LyLStW6+S/JwR4maJyRHVEb+zanZFianyaAWEw
	/fByMC2xQL6FOzqN4vz1y5q/Wwyw86sw8igxhxgKnzMPt+JL9CXK4qskK7czH3VhZ2jCNiKG6vW0F
	+/xSvqdyH4Igu9/Mx/2mQPvfm0d0Y17x8AH26Uc4i+LWvwFsNe/o33zKcYHsxvUf4vXsRXps0wZ79
	WOaG9WfukOAXYLt1n0Tk7I3HNSas4a2Z3HlCVeP47UNtAmQKfXDLhw4BQ+wTsfbWtyMeG2BRxeYSP
	rrdvOlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OL1-00000003hqc-47Xm;
	Tue, 30 Sep 2025 00:35:27 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3OKz-00000003hoZ-11NQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 00:35:26 +0000
Date: Mon, 29 Sep 2025 17:35:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759192515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/zSYhlf0XUMz4UMm9FSlubQHqk4IYQKjvjWJ9kLyN4=;
	b=mXjyV96jLYYit3I6ZX9WC7triEupDEHwderTsG7W3levjBTWBqCGM2zs1fC7IgoKE/cqyw
	HODQS52Qp+fYgQzYeiKLK8CQBhJIZiYi0SeWDZtymkxSDOt0lmMj6CeaTXXYTGiWTNz9N4
	fMVtmgn5RkZ8eck2RZ0FdWDHiBGREPI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 01/13] KVM: arm64: Hide CNTHV_*_EL2 from userspace for
 nVHE guests
Message-ID: <aNslu47Dl13iNcaL@linux.dev>
References: <20250929160458.3351788-1-maz@kernel.org>
 <20250929160458.3351788-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929160458.3351788-2-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_173525_716186_19154188 
X-CRM114-Status: GOOD (  19.23  )
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

Hey,

On Mon, Sep 29, 2025 at 05:04:45PM +0100, Marc Zyngier wrote:
> Although we correctly UNDEF any CNTHV_*_EL2 access from the guest
> when E2H==0, we still expose these registers to userspace, which
> is a bad idea.
> 
> Drop the ad-hoc UNDEF injection and switch to a .visibility()
> callback which will also hide the register from userspace.
> 
> Fixes: 0e45981028550 ("KVM: arm64: timer: Don't adjust the EL2 virtual timer offset")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index ee8a7033c85bf..9f2f4e0b042e8 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1594,16 +1594,6 @@ static bool access_arch_timer(struct kvm_vcpu *vcpu,
>  	return true;
>  }
>  
> -static bool access_hv_timer(struct kvm_vcpu *vcpu,
> -			    struct sys_reg_params *p,
> -			    const struct sys_reg_desc *r)
> -{
> -	if (!vcpu_el2_e2h_is_set(vcpu))
> -		return undef_access(vcpu, p, r);
> -
> -	return access_arch_timer(vcpu, p, r);
> -}
> -
>  static s64 kvm_arm64_ftr_safe_value(u32 id, const struct arm64_ftr_bits *ftrp,
>  				    s64 new, s64 cur)
>  {
> @@ -2831,6 +2821,16 @@ static unsigned int s1pie_el2_visibility(const struct kvm_vcpu *vcpu,
>  	return __el2_visibility(vcpu, rd, s1pie_visibility);
>  }
>  
> +static unsigned int cnthv_visibility(const struct kvm_vcpu *vcpu,
> +				     const struct sys_reg_desc *rd)
> +{
> +	if (vcpu_has_nv(vcpu) &&
> +	    !vcpu_has_feature(vcpu, KVM_ARM_VCPU_HAS_EL2_E2H0))
> +		return 0;
> +
> +	return REG_HIDDEN;
> +}

Hmm. We've already exposed these to userspace at this point, we just
conveniently last the get-reg-list test to assert the accessibility of
these (broken) exposures.

Given the amount of UAPI mishaps we've had with registers in the past I
don't have much appetite for taking away something we already
advertised.

What about making these RAZ/WI from userspace?

Thanks,
Oliver

