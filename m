Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091F1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gFP2AuzPMSGsSROm+0SSVBtRRQQgVlFC7bqVvtvAew=; b=AlGAwESuJJX6VqEtKaagUEw2Vb
	oAc5Z1aVYbYw2iqyZeA4/1lO9o+DW9on0vBmqcnfPRA5jDP9k/J8M18/DDFuV1EIdagFB+B8XXp2h
	d08sUg8bkF522qKjy/XRURpaerdPHwXYWsStEbgRRJm4JJwWikMRB3AJOdj/IXNEvSuUK5g906Fpl
	w5SoUI7PMOnwGln5z7TLpNuIJ/F7G6Qc9z297mCrrRpl7By6SwCnOL32XWD9QxEFG8RndNykZf3K9
	kP/G/y8W+kUA3e1dRY1c9vziXX9tMOMC5H3IFVaFzP2tcUrn5/stuNSn10dzGjc6ovNvEMS/wAhmq
	Zl7Zf3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARSk-0000000FDqb-0xAJ;
	Thu, 01 May 2025 10:48:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAROH-0000000FDVZ-1owd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:43:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62F62106F;
	Thu,  1 May 2025 03:43:33 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F6CC3F673;
	Thu,  1 May 2025 03:43:38 -0700 (PDT)
Date: Thu, 1 May 2025 11:43:36 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 16/42] KVM: arm64: Simplify handling of negative FGT
 bits
Message-ID: <20250501104336.GG1859293@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-17-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426122836.3341523-17-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_034341_556341_7E7B2D0F 
X-CRM114-Status: GOOD (  20.73  )
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

On Sat, Apr 26, 2025 at 01:28:10PM +0100, Marc Zyngier wrote:
> check_fgt_bit() and triage_sysreg_trap() implement the same thing
> twice for no good reason. We have to lookup the FGT register twice,
> as we don't communucate it. Similarly, we extract the register value
> at the wrong spot.
> 
> Reorganise the code in a more logical way so that things are done
> at the correct location, removing a lot of duplication.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/emulate-nested.c | 49 ++++++++-------------------------
>  1 file changed, 12 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 1bcbddc88a9b7..52a2d63a667c9 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2215,11 +2215,11 @@ static u64 kvm_get_sysreg_res0(struct kvm *kvm, enum vcpu_sysreg sr)
>  	return masks->mask[sr - __VNCR_START__].res0;
>  }
>  
> -static bool check_fgt_bit(struct kvm_vcpu *vcpu, bool is_read,
> -			  u64 val, const union trap_config tc)
> +static bool check_fgt_bit(struct kvm_vcpu *vcpu, enum vcpu_sysreg sr,
> +			  const union trap_config tc)
>  {
>  	struct kvm *kvm = vcpu->kvm;
> -	enum vcpu_sysreg sr;
> +	u64 val;
>  
>  	/*
>  	 * KVM doesn't know about any FGTs that apply to the host, and hopefully
> @@ -2228,6 +2228,8 @@ static bool check_fgt_bit(struct kvm_vcpu *vcpu, bool is_read,
>  	if (is_hyp_ctxt(vcpu))
>  		return false;
>  
> +	val = __vcpu_sys_reg(vcpu, sr);
> +
>  	if (tc.pol)
>  		return (val & BIT(tc.bit));
>  
> @@ -2242,38 +2244,17 @@ static bool check_fgt_bit(struct kvm_vcpu *vcpu, bool is_read,
>  	if (val & BIT(tc.bit))
>  		return false;
>  
> -	switch ((enum fgt_group_id)tc.fgt) {
> -	case HFGRTR_GROUP:
> -		sr = is_read ? HFGRTR_EL2 : HFGWTR_EL2;
> -		break;
> -
> -	case HDFGRTR_GROUP:
> -		sr = is_read ? HDFGRTR_EL2 : HDFGWTR_EL2;
> -		break;
> -
> -	case HAFGRTR_GROUP:
> -		sr = HAFGRTR_EL2;
> -		break;
> -
> -	case HFGITR_GROUP:
> -		sr = HFGITR_EL2;
> -		break;
> -
> -	default:
> -		WARN_ONCE(1, "Unhandled FGT group");
> -		return false;
> -	}
> -
>  	return !(kvm_get_sysreg_res0(kvm, sr) & BIT(tc.bit));
>  }
>  
>  bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
>  {
> +	enum vcpu_sysreg fgtreg;
>  	union trap_config tc;
>  	enum trap_behaviour b;
>  	bool is_read;
>  	u32 sysreg;
> -	u64 esr, val;
> +	u64 esr;
>  
>  	esr = kvm_vcpu_get_esr(vcpu);
>  	sysreg = esr_sys64_to_sysreg(esr);
> @@ -2320,25 +2301,19 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
>  		break;
>  
>  	case HFGRTR_GROUP:
> -		if (is_read)
> -			val = __vcpu_sys_reg(vcpu, HFGRTR_EL2);
> -		else
> -			val = __vcpu_sys_reg(vcpu, HFGWTR_EL2);
> +		fgtreg = is_read ? HFGRTR_EL2 : HFGWTR_EL2;
>  		break;
>  
>  	case HDFGRTR_GROUP:
> -		if (is_read)
> -			val = __vcpu_sys_reg(vcpu, HDFGRTR_EL2);
> -		else
> -			val = __vcpu_sys_reg(vcpu, HDFGWTR_EL2);
> +		fgtreg = is_read ? HDFGRTR_EL2 : HDFGWTR_EL2;
>  		break;
>  
>  	case HAFGRTR_GROUP:
> -		val = __vcpu_sys_reg(vcpu, HAFGRTR_EL2);
> +		fgtreg = HAFGRTR_EL2;
>  		break;
>  
>  	case HFGITR_GROUP:
> -		val = __vcpu_sys_reg(vcpu, HFGITR_EL2);
> +		fgtreg = HFGITR_EL2;
>  		switch (tc.fgf) {
>  			u64 tmp;
>  
> @@ -2359,7 +2334,7 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
>  		goto local;
>  	}
>  
> -	if (tc.fgt != __NO_FGT_GROUP__ && check_fgt_bit(vcpu, is_read, val, tc))
> +	if (tc.fgt != __NO_FGT_GROUP__ && check_fgt_bit(vcpu, fgtreg, tc))
>  		goto inject;
>  
>  	b = compute_trap_behaviour(vcpu, tc);
> -- 
> 2.39.2
> 

