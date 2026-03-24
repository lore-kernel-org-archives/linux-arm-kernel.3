Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD57E9A75A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IY4dDZh9dDmUZT2xOVDzhyZHdg/R37G9q2o81SGSX0=; b=E2Shen06NrB9UpfOyemUREVsrb
	T+4M7WL/Y0HlhhdnsbwLCwQU3lIaizp9BZaX3uRjheczpNDhSxRxkpr9L7QH+aK509pfRJLQRRb12
	hGKPfJ/KfY/hvSsNb/mTZZ/o3a4v1jtkgopXh5eTAW01KmgijjiabEePPs7/Kw6QPG3MfnmRIXMBA
	z0VEiOepLcijIQAVsS//HfxXnCpXjyqopDzW8iwjcUeRScJ0o78zh8/Pz6JcFhmw0soKhqa5tqq3a
	cbeAHGIDRkEzYLR/I2WcXYnt9JZ39RpRN+jIEUMlBa8LwG84YSZVe78MNA9YoFwgEuAm3Q3WkvrI9
	WMamxX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ymj-00000001BfG-3nKA;
	Tue, 24 Mar 2026 10:14:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ymd-00000001Bcq-3TO6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 10:14:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso43388555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774347285; x=1774952085; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IY4dDZh9dDmUZT2xOVDzhyZHdg/R37G9q2o81SGSX0=;
        b=aJAl2Z+OzET7iEGVIL43P/DJkYN6gdJKmAtEFwYuUEAj7vuD90jVG+MTvK2KaXuI8Z
         iwcNVEOu5oG44SIXOCF0H0OWezaV3LWLWxns8Xk/iho+7z/hXKkSCwgOeLRbAn1/thHS
         1JKc6i9dbBy0JvQ+5lk6rvW+uH3GU3iXx8B23vJeeGFnoilJiQrWSqnXfgjRtfJPYTC8
         08mCmy9Pvc2Nht8et9viPvF2B+veexfxB73ByTQThqOo8uzJRjixWrrL9xaOqqeJGhv3
         THtsq+LfLPPRNLUWMyoSzcQx8Birr88EGv1eiS9RMDrowXuW3XQidwAroyrWfF0tJIHX
         BFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347285; x=1774952085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IY4dDZh9dDmUZT2xOVDzhyZHdg/R37G9q2o81SGSX0=;
        b=fVneefEFCRueW2f1w3UBKpd463RTxF3sR8CwinEOMot3QLiyjgFvsMyvqBBk2l/zP6
         ZPg/nl/3UaqqUEjQ/NPglnMi3SdQJEfXPRnVBYHY1/LuymqgXnwkJA4aEGdYQWbMSHkG
         0pk1TdRRxh2aA/FCBeWpBMguAxyojTYutdPwRklTLhZOb8aq+0nKqFnDoNdOlJzdnRcl
         Cm2ewYJpBfzsERMcRW+yguKeId+TtpD3a8yQQnRgM7RPH9zOV7Mu6LxD7FZM5a67MQz/
         QDiLc3yfFXyBnVF3/OXbMMbTiVoIa6GvDJaG65mxfCxd0wqQK3USTh/dlfRZfU+oFjw6
         9c+w==
X-Gm-Message-State: AOJu0YyaO006P8ek2rEcrOWJpGfRgF31kN8d08k0KpN5oWCq2m+JdZgO
	W3Gm6+jGeWnZAga9IVSvXqxyn4+jelmgcPIEDZ0OECzdC3ZqIBSUyrl8XjcEgylA1AIbO7k4SS+
	RyJCe3g==
X-Gm-Gg: ATEYQzyTwHJNzOtmLPABwM7+nVsPBBCiACq6kIy5cNzH5utD9KtKOhfv2t7lr6srdbf
	tOX6TyeqtFZUP59laJYZXSojXsNoJY2CiofQO0YlJb2spP6ZFz2sStTELZd/fcS2zSW+AByKly/
	QirO4YI7bc9WluxicRxL6XXPjS1cdfvvkwNGOLCOQfA8xtAHxd/mcRgjSqJm28rTfzTQ8UTYKyE
	ovX8G1rT06ckL4F1vcXIXOiwrHLbJsZylN3koh7GPFCnSMfQhK3dARnbpVmN9lzjclAzDfFfKNa
	fl1pGWopHGxvyz3vkpHMWGUC/xPa+SIvBL5uKvAfd/4S5MLNxtuww8UQdm94br0Kqm6Ofv2YkU/
	fKTNILKiQCoshDMIHr5FCQ6xFsC1H4SOA/zG2a550K0ACGIpl3LXkW08QxN0IRQ6KD5WoLNAfT7
	1oEonkeChazHpiNkBizPwzrDYSqByxg63Dbeq8dVMlNXIIwK2sQh4RKA+2iZdMgYDNq2k=
X-Received: by 2002:a05:600c:1d15:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-486fedf9061mr218893015e9.10.1774347284527;
        Tue, 24 Mar 2026 03:14:44 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm32171989f8f.0.2026.03.24.03.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:14:43 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:14:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 5/5] KVM: arm64: Add SMC hook for SME dvmsync erratum
Message-ID: <acJkEEXKt_GunFLQ@google.com>
References: <20260323162408.4163113-1-catalin.marinas@arm.com>
 <20260323162408.4163113-6-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323162408.4163113-6-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_031447_896690_44410D4A 
X-CRM114-Status: GOOD (  26.33  )
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

On Mon, Mar 23, 2026 at 04:24:05PM +0000, Catalin Marinas wrote:
> From: James Morse <james.morse@arm.com>
> 
> C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
> all outstanding SME accesses. Instead a DSB needs to be executed on the
> affecteed CPUs. The implication is pages cannot be unmapped from the
> host stage2 then provided to the guest. Host SME accesses may occur
> after this point.
> 
> This erratum breaks pKVM's guarantees, and the workaround is hard to
> implement as EL2 and EL1 share a security state meaning EL1 can mask
> IPI sent by EL2, leading to interrupt blackouts.
> 
> Instead, do this in EL3. This has the advantage of a separate security
> state, meaning lower EL cannot mask the IPI. It is also simpler for EL3
> to know about CPUs that are off or in PSCI's CPU_SUSPEND.
> 
> Add the needed hook.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>

In case this goes in before Will's p-guest series and with just a small comment
below:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 17 +++++++++++++++++
>  include/linux/arm-smccc.h             |  6 ++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 38f66a56a766..ef8afbdd421b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -5,6 +5,8 @@
>   */
>  
>  #include <linux/kvm_host.h>
> +#include <linux/arm-smccc.h>
> +
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
> @@ -28,6 +30,15 @@ static struct hyp_pool host_s2_pool;
>  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
>  #define current_vm (*this_cpu_ptr(&__current_vm))
>  
> +static void pkvm_sme_dvmsync_fw_call(void)
> +{
> +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714)) {
> +		struct arm_smccc_res res;
> +
> +		arm_smccc_1_1_smc(ARM_SMCCC_CPU_WORKAROUND_4193714, &res);

With hyp tracing in kvmarm/next, this should be hyp_smccc_1_1_smc().

> +	}
> +}
> +
>  static void guest_lock_component(struct pkvm_hyp_vm *vm)
>  {
>  	hyp_spin_lock(&vm->lock);
> @@ -553,6 +564,12 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * After stage2 maintenance has happened, but before the page owner has
> +	 * changed.
> +	 */
> +	pkvm_sme_dvmsync_fw_call();
> +
>  	/* Don't forget to update the vmemmap tracking for the host */
>  	if (owner_id == PKVM_ID_HOST)
>  		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 50b47eba7d01..e7195750d21b 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -105,6 +105,12 @@
>  			   ARM_SMCCC_SMC_32,				\
>  			   0, 0x3fff)
>  
> +/* C1-Pro erratum 4193714: SME DVMSync early acknowledgement */
> +#define ARM_SMCCC_CPU_WORKAROUND_4193714				\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
> +			   ARM_SMCCC_SMC_32,				\
> +			   ARM_SMCCC_OWNER_CPU, 0x10)
> +
>  #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
>  	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
>  			   ARM_SMCCC_SMC_32,				\
> 

