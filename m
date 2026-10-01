Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A52CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3zb7dffDO05ofATCMsz7RTakXrVtCiOoBFhworE6Ss=; b=wwQG5HjAAts1ga+aQZMsXNJ+yD
	mfS2zV62MELZf+DVOoW0JD2n/MyxGSx7YxocoOQZgfrTCANxf4zCYYBpPyu/Re1VZXX0qGzM718VQ
	y4Ef2HpP5FdAqsZJRl7OBGijNIcfQ89SzwrPt2MyvewmwMzsmxnFhRWvsC+u5M6O638MtWVVHbBlX
	GWdrg2yka0dt8J3VErcP4co7MR5apI0508pCLCyy8TNsODotSzZCdjlGeKNKZtIB4LMev6vgD53/6
	8eAUbc2tPsRnpHDWf6Wn8AxAmaGKq+6lAXwtv1W+aagMV5vslq/JPx+pcuA2QrCE3e/xuTb+PR1yB
	yFBNJjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGYy-00000009BJ0-1Tz1;
	Thu, 01 Oct 2026 13:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGYv-00000009BIA-1xA8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:11:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A2AA260A55;
	Thu,  1 Oct 2026 13:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143E81F000FF;
	Thu,  1 Oct 2026 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860260;
	bh=S3zb7dffDO05ofATCMsz7RTakXrVtCiOoBFhworE6Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aA5blC3LMESqT3U7KX0JtL6c3VyicVX9wKk0HX9Mu6UVegTQN7D8v22lohJ8KVPsT
	 h6h+FHXPNe+9ScK4EB1lD6LXp6TpOYH9ctORuxjVHCZi9VPL1OMP4ppfL6dlkhwZPr
	 Px63YWH9S4uQsuPCh7YNuAFaVl4hZcWYtIglN7ktsRgyjylFeeacF6s+R1H1Coswjo
	 NSNKSm+UAdkfR+1KdAZ69nHwqEByWfiwi8MON4Czkopwfa7cC0YFIlxOvWEMnbNe1y
	 M6hq88W2VLGKAywHm73wIkMg3oECjBP8WhRAX0zyP6lv69Zy3tWNUW3EQSr7ve9dyE
	 aakqpmldf3vTg==
Date: Thu, 1 Oct 2026 14:10:53 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 06/15] KVM: arm64: Validate GCS exception lock when
 emulating ERET
Message-ID: <ar5GKCNx4XOpRnHl@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-6-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930-arm64-gcs-v21-6-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:16PM +0100, Mark Brown wrote:
> As per DDI0487 R_TYTWB GCS adds an additional case where an illegal
> exception return can be generated. If all of:
>
>  - PSTATE.EXLOCK is 0.
>  - The EL is not being changed by the ERET.
>  - GCSCR_ELx.EXLOCKEN is 1.

Ack can see from [0] in D.1.4.4.2 (M.d):

"If the Effective value of GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK is 0, the
execution of an exception return instruction to return to the current Exception
level ELx."

[0]: https://support.arm.com/documentation/ddi0487/md/-Part-D-The-AArch64-System-Level-Architecture/-Chapter-D1-The-AArch64-System-Level-Programmers--Model/-D1-4-Exceptions/-D1-4-4-Exception-return?lang=en

>
> are true then the return is illegal. Emulate this behaviour when
> emulating ERET for nested guests, while we're at it using the symbolic
> definition for EXLOCK in SPSR.
>
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Some comments below. In general LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 1ed708335809..9e595e8e7642 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h

> +#ifdef CONFIG_ARM64_GCS
> +/* See IllegalExceptionReturn() pseudocode */

Ack I see that at [1].

[1]: https://support.arm.com/documentation/ddi0487/md/-Part-J-Architectural-Pseudocode/-Chapter-J1-A-profile-Architecture-Pseudocode/-J1-4-Shared-pseudocode/-J1-4-647-IllegalExceptionReturn?lang=en

> +static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
> +						   u64 spsr)
> +{
> +	u64 pstate, cur_mode, target_mode;
> +
> +	if (!kvm_has_gcs(vcpu->kvm))
> +		return false;
> +
> +	if (vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT)
> +		return false;
> +
> +	/* Check the EL only, ignore thread mode */
> +	pstate = vcpu->arch.ctxt.regs.pstate;
> +	cur_mode = (pstate & PSR_MODE_MASK) | PSR_MODE_THREAD_BIT;
> +	target_mode = (spsr & PSR_MODE_MASK) | PSR_MODE_THREAD_BIT;
> +
> +	if (cur_mode != target_mode)
> +		return false;
> +
> +	return vcpu_read_sys_reg(vcpu, GCSCR_EL2) & GCSCR_ELx_EXLOCKEN;

This seems identical, logically, to the psuedocode:

    if (IsFeatureImplemented(FEAT_GCS) && PSTATE.EXLOCK == ‘0’ &&
          PSTATE.EL == target && GetCurrentEXLOCKEN()) then
        return TRUE;
    end;
    return FALSE;

So LGTM.

> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 625604019fb3..5aa26384720a 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2748,10 +2748,13 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
>  	 * - trying to return to an illegal M value
>  	 * - trying to return to a 32bit EL
>  	 * - trying to return to EL1 with HCR_EL2.TGE set
> +	 * - GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK is 0 when attempting
> +	 *   to return from ELx the same EL.

This seems a little unclear, 'when attempting to return to the same EL'
perhaps?

> @@ -2778,7 +2781,7 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
>
>  		mask = PSR_MODE_MASK | PSR_MODE32_BIT;
>  		if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))

Could use kvm_has_gcs()?

> -			mask |= BIT_ULL(34);	/* PSTATE.EXLOCK */
> +			mask |= PSR_EXLOCK_BIT;

Ah nice to not hard code that any more!

> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 7875911c0506..af59d1bf51ad 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -383,6 +383,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
>  		return false;
>  	}
>
> +	/* Push GCS exception lock failures into the slow path */
> +	if (kvm_check_illegal_exlock_return(vcpu, spsr))
> +		return false;
> +

Ah yeah because false -> slow path and illegal exceptions shouldn't be fast path
:)

--
Cheers, Lorenzo

