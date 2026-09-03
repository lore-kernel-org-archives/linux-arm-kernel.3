Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC630C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTwYujv3WhJdXJFBHmfwERtV7wj7m3KxFIb0DnveR34=; b=oRTBnBERHEWVvKz+Km0AobXu47
	ZpXGVM9jZ1Ylw1xprQYK/5wXVqQDB/Os0arJkOYPFXE2W5JWiNMLzUsMIXXpX7b6AJmNBxsCGY7CF
	9rgPVSzJundFh1prz/Dvr0PsKEMPiM7D+KIKOIJDnN0ZvoHS4vSINyPdcGa5SJ3q55IPjlWZFKk/7
	nfk1TjPHzgbfC/pRiBi0N/M41TlxufWr85kYH7M8JhqdMU6GW3xsgIBptVNWlkHma/yoMRoHdRad6
	6CB2mhksQTF3R0/SYzgLCwhFZKJvGQgW6TY2UfQuURz/Zfl4cKiSzf2H0YFkHkdGDSl28eK7fDVm1
	t/T9KvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29Vm-000000001cN-05HC;
	Thu, 03 Sep 2026 15:37:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29Vk-000000001bs-0rR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:37:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 320021596;
	Thu,  3 Sep 2026 08:37:51 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0D013F7D8;
	Thu,  3 Sep 2026 08:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788449874; bh=oCZbPDVvCXBkOJzwU5rhSB7/JmNpokz7ClUQIUpFm5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OEMbio4GVl0XWAA8MxNYy8/78cHWeKkeSKov4BrZM47nNeFK1FHGCIutpsBSvLacf
	 MQJI2phietymUtotbazfVjw/nYwJF3ZyVwqCuG/7fs5xq+DhCZUE/qI9IuNQn8FtKr
	 1JwJVdol0cXrEDUH4UreZbPXJTz3/pwONCDOXAL8=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 06/14] KVM: arm64: Validate GCS exception lock when emulating ERET
Date: Thu,  3 Sep 2026 16:37:37 +0100
Message-ID: <apmUQETDlhTIuJIY@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-6-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-6-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_083756_317793_2DB40F34 
X-CRM114-Status: GOOD (  25.98  )
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

On Tue, Sep 01, 2026 at 10:47:04PM +0100, Mark Brown wrote:
[...]
> +#ifdef CONFIG_ARM64_GCS
> +/* See IllegalExceptionReturn() pseudocode */
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
> +}

The above perfectly translates the GCS part of IllegalExceptionReturn().

It's a nit, as I suppose there should be no compiler warning on that, but
the function should return a bool, and the last return line returns an u64.

Maybe adding a "return !!()" would be better?

[...]
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 3806ff0920fe..170c0c521f22 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2748,10 +2748,13 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
>  	 * - trying to return to an illegal M value
>  	 * - trying to return to a 32bit EL
>  	 * - trying to return to EL1 with HCR_EL2.TGE set
> +	 * - GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK is 0 when attempting
> +	 *   to return from ELx the same EL.
>  	 */
>  	if (mode == PSR_MODE_EL3t   || mode == PSR_MODE_EL3h ||
>  	    mode == 0b00001         || (mode & BIT(1))       ||
>  	    (spsr & PSR_MODE32_BIT) ||
> +	    kvm_check_illegal_exlock_return(vcpu, spsr) ||
>  	    (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
>  					   mode == PSR_MODE_EL1h))) {
>  		u64 mask;

In IllegalExceptionReturn(), the GCS-related clause happens at the end, and 
here it happens before the TGE one. Could this cause any weird behavior in 
the future?

I get that by doing like this you don't change the last line of the "if", 
but I wonder if that could change anything.

[...]
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
>  	/* If ERETAx fails, take the slow path */
>  	if (esr_iss_is_eretax(esr)) {
>  		if (!(vcpu_has_ptrauth(vcpu) && kvm_auth_eretax(vcpu, &elr)))

IIUC, this function will be called on the __kvm_vcpu_run_vhe() inner loop, 
in the cases where the guest exited due to a eret. 

What you change here is that in case of an illegal exlock return, it goes 
out of the loop and return to host kernel, probably to deal with it in the 
mentioned slowpath, the same way the ERETAx entry does.

I don't question on this being needed. 
I would just like to understand why this is needed here. 

This does not seem to be related to nested, as this is called in 
__fixup_guest_exit() and not in fixup_nv_guest_exit(). But would not 
hardware be responsible for cheking this, then?

Thanks!
Leo

