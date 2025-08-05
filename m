Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052A8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQR2epURekpNA+95Z0QjSFyHUkhLJWM+1+cAqhzA1kE=; b=hiLt6j48UN1leRDhGcZHExsV7V
	w+ByWTTU3aEKOcYmEqygY0+nowq4DxeC/+ZoM1eV7ziNNq3ALeVpJPnfXthkDqvNM3/LaTnwg4Opg
	mcoQUKNRB9F1rBtA1j56iXT0fFkBUhtI1UbJnxq2oAomY+EWyBGSLMJApe7GxaJfOv15adiUsHD6y
	8KC3lVuGADgTq9OmRxhBB5dETR9/4ivq8QmiiJ+F4w48mO/wYgghW2dqWWvxb8fMSIcflSiVdbTWL
	GQTYnXgd/eexNTHtZv6wu2TtsR1478+JdEvCL7d/xxb6EUsPiNS0ysJ65lq2ujSzIl1scO9+i79w0
	y0M/vqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJsR-0000000DC8m-1LKX;
	Tue, 05 Aug 2025 15:46:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIob-0000000D2Yd-0z4U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 14:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 907B0A55C3E;
	Tue,  5 Aug 2025 14:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B059CC4CEF0;
	Tue,  5 Aug 2025 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754404736;
	bh=fFzCKWdJOEzQHpeFCArObuHdaP3421oaeu4PjzR5Wno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tP9KNPog9PH5Q4it44Jn+MXQ8q4z3WLPOJT5fbzXpZ7pHDOrvADIEyYK/chEYUyGt
	 bLz1g+wk4Ue/eLQfso4Cd2nOU4T+q49fnJmtuuw/FKbaSAfhTjnwuqiO/Jxr3v8sls
	 ij/jqq1rdysvwgLzRFO7h23ovvw56IUHIUZRF0KorBdpbbat0ww7WKrBSk5qMmriAk
	 qJodWjbNyL3euUhlOZP0miQmT5gmaAkdl0J7ArypdcgdpLKnlPcG9QCvw6dAEpva2t
	 hWJoIxkBHasqEqWW5zf4fJyB1B5vqCAvxOKAk4jC3WL62qmSusOPBZhuyxpVkZ5V2m
	 Vu39gEGAD69UA==
Date: Tue, 5 Aug 2025 15:38:50 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com,
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v1 2/4] KVM: arm64: Make vcpu_{read,write}_sys_reg
 available to HYP code
Message-ID: <aJIXerl04PDah1db@willie-the-truck>
References: <20250805135617.831971-1-tabba@google.com>
 <20250805135617.831971-3-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805135617.831971-3-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_073857_402569_1D16C895 
X-CRM114-Status: GOOD (  26.18  )
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

On Tue, Aug 05, 2025 at 02:56:15PM +0100, Fuad Tabba wrote:
> Allow vcpu_{read,write}_sys_reg() to be called from EL2. This makes it
> possible for hyp to use existing helper functions to access the vCPU
> context.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 184 +++++++++++++++++++++++++++
>  arch/arm64/include/asm/kvm_host.h    |   3 -
>  arch/arm64/kvm/sys_regs.c            | 184 ---------------------------
>  3 files changed, 184 insertions(+), 187 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 0720898f563e..1f449ef4564c 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -224,6 +224,190 @@ static inline bool vcpu_is_host_el0(const struct kvm_vcpu *vcpu)
>  	return is_hyp_ctxt(vcpu) && !vcpu_is_el2(vcpu);
>  }
>  
> +#define PURE_EL2_SYSREG(el2)						\
> +	case el2: {							\
> +		*el1r = el2;						\
> +		return true;						\
> +	}
> +
> +#define MAPPED_EL2_SYSREG(el2, el1, fn)					\
> +	case el2: {							\
> +		*xlate = fn;						\
> +		*el1r = el1;						\
> +		return true;						\
> +	}
> +
> +static bool get_el2_to_el1_mapping(unsigned int reg,
> +				   unsigned int *el1r, u64 (**xlate)(u64))
> +{

I guess this needs to be 'inline' too, but...

> +static inline u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
> +{
> +	u64 val = 0x8badf00d8badf00d;
> +	u64 (*xlate)(u64) = NULL;
> +	unsigned int el1r;
> +
> +	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
> +		goto memory_read;
> +
> +	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
> +		if (!is_hyp_ctxt(vcpu))
> +			goto memory_read;
> +
> +		/*
> +		 * CNTHCTL_EL2 requires some special treatment to
> +		 * account for the bits that can be set via CNTKCTL_EL1.
> +		 */
> +		switch (reg) {
> +		case CNTHCTL_EL2:
> +			if (vcpu_el2_e2h_is_set(vcpu)) {
> +				val = read_sysreg_el1(SYS_CNTKCTL);
> +				val &= CNTKCTL_VALID_BITS;
> +				val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
> +				return val;
> +			}
> +			break;
> +		}
> +
> +		/*
> +		 * If this register does not have an EL1 counterpart,
> +		 * then read the stored EL2 version.
> +		 */
> +		if (reg == el1r)
> +			goto memory_read;
> +
> +		/*
> +		 * If we have a non-VHE guest and that the sysreg
> +		 * requires translation to be used at EL1, use the
> +		 * in-memory copy instead.
> +		 */
> +		if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
> +			goto memory_read;
> +
> +		/* Get the current version of the EL1 counterpart. */
> +		WARN_ON(!__vcpu_read_sys_reg_from_cpu(el1r, &val));
> +		if (reg >= __SANITISED_REG_START__)
> +			val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
> +
> +		return val;
> +	}
> +
> +	/* EL1 register can't be on the CPU if the guest is in vEL2. */
> +	if (unlikely(is_hyp_ctxt(vcpu)))
> +		goto memory_read;
> +
> +	if (__vcpu_read_sys_reg_from_cpu(reg, &val))
> +		return val;
> +
> +memory_read:
> +	return __vcpu_sys_reg(vcpu, reg);
> +}

... isn't this now pretty huge to be inlining? Similarly for the write
accessor. What does the bloat-o-meter script say?

Will

