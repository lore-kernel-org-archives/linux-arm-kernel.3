Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A41CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jfb1CZzld1w+AYshPyetwxz0Ey757X/HVG1TgmeDSYU=; b=J3yqcWwqwUpciSl3NAvq/cWtXq
	o/tLUbCFQl/tpXopza6fnxYYRu/wUKOq5JqmZL71KRL0ESWAxSCowT226h7pMwXBcHYJ2ZDb5GuTN
	q+u4QI2taIoXuREy65X2TCm/8mpiZavTzoWqMI0xixHC631WAL583Oi9PG8Nr2r13U2ZdnukEAofn
	54TwS1XJ2dfRGWT4KzOG7kOqyL1R7JE1NtL92WKAARdaKE9sJ2fNNFO2nb+123bmMfnysaeddnLza
	Moi0bl0Id8BIjByGH9ED0qgCLKmA/ZwEYw1cY6pJ8J1zh2hPNTaDwuLZOoxjTVlVkWs0nJQ9GWyzN
	6xWTCVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKa50-00000000Zmg-1to3;
	Wed, 06 May 2026 11:06:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKa4y-00000000Zln-1MCm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:06:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488b150559bso43388685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778065568; x=1778670368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jfb1CZzld1w+AYshPyetwxz0Ey757X/HVG1TgmeDSYU=;
        b=H2b6QeJPFIpb5R4rcwRFgaD8G8HIZD78HhlYSb2iZZq367jWzPAGuuYuqf8tJDev/Z
         b/OHq8Yac7FnAnzejGnNmTARVndQADDOYDkWETqtB24J50aDkq2CflDqTh0wJiSyKf9V
         XNqu21juLQulaaozGWcik4TF8sjt3ONRbAfWOfjQegZI8ns/VAxRCbI9lzpX9BCPML/O
         n/d7IC1ElNhVm0MSrhYDSKuCh54vnJ8IZMJ5U731fv4hgie9xEWOXVsZvX4qXr+mYfH4
         IBWS9IiTV+7FCMcIwigNqisn6xoUeGNURAQHAZRRiBW1cGtyVkX9LRBwktsi22d5jkE7
         qQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778065568; x=1778670368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jfb1CZzld1w+AYshPyetwxz0Ey757X/HVG1TgmeDSYU=;
        b=H8e3OHwiUQiSR7WUfUEZuBMjUDpGTZbJXs7RforoAxuvbwvgcCculUMIYd6vg1cwER
         sBcioigkC0YoyAVCSh/inerfpV0w2GhJoa5GjuMIEGqpx8pGeXfobrh+WRtoSS/aztQB
         iWcaCebcCxEGXrm/215e+tyhAEBugAGcE+GaGILHNQy51Kaa8CRkEKFCIxabHVJSQBaL
         VSkua9AtpuwFoml/U3sXlzA9snZjVxghpzdchB8KRJ8JIkG9SrNoceVgro7tdzDuHasV
         iFuyv3SWdF/pyVKx/poY97eIK34CVZEaU57MJVXdHgAsgqMMkzNqzYNhe/PLUXmYMBGz
         TQMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dXNVZU2loX6RGsBFiNQ8n+UkjSmAxGe7gXxP+51nlMxMb2GOINxC20sC2fvs84zWVE2wGA/W7I+kX2mrGYtXN@lists.infradead.org
X-Gm-Message-State: AOJu0YxXVX/IIBfR1i9hMNVU6FrK+lta5NKaukvgI7pJMGHCeOt8b1g1
	8yEWMvU6DjwxSMOjio2lw7/2G+BIo60CBNCBR4mC+wOlDYQnbdIrkJxSOoh0rD/D5A==
X-Gm-Gg: AeBDieu0DKAHqas54o3vbVS+4KtePETttFQNHLS0AiNo0yXMzTrst4x8T+BFVhmnBcw
	dAXxOy0vnOuV/egyIGFaLm9zciALAO7PhE8qg2VDBXl1Dh6fx1t/wpgOoCUtEAuBjAAZxz84dIN
	ok3jgHpcJ+AjVy5fgx2CdWqjLYFOjaBdyVW4SNLEyGjR8lsusV5e7QzUCOKz8lhQQrgdRtrRA/Q
	ZEGbbfUP6bVvbzoPLHcaowrTqVdpbwRDXAFa1xzqZnqfqzSypWV4QdfUWCR0OL/Ew9KzV0mprSY
	LXh8pbK1IyV5fxcC8xNBtol2m8km4kfdEq6jepMXkOaxO+Dx1ZS1LQWCeHT4pVsSXryE1Fjk0Rj
	Pq9Nfiqs9Jqs3Nc3s96cBKIfq8Nl7Kt7MODXV4H09Nw6so8Rs1xPFz6iWkEu5h1PsnuOn548SWg
	BW579p5w8dzOXQYe7ii2dgp/rF5XZyItHak4b1wGxjmqgl3RK977jtWg1D719pDLun8V7tWT3rU
	BJ908WK3VMyLd46FFj+2Ajn5zA=
X-Received: by 2002:a05:600c:8906:b0:48a:93d2:609b with SMTP id 5b1f17b1804b1-48e51f45c46mr38505655e9.28.1778065567947;
        Wed, 06 May 2026 04:06:07 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a5486sm42410345e9.6.2026.05.06.04.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:06:07 -0700 (PDT)
Date: Wed, 6 May 2026 12:06:03 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Work around C1-Pro erratum 4193714 for
 protected guests
Message-ID: <afsgm6pVTFwtqc4e@google.com>
References: <20260430155911.628402-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430155911.628402-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_040612_394518_3D13DF78 
X-CRM114-Status: GOOD (  36.04  )
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

On Thu, Apr 30, 2026 at 04:59:11PM +0100, Catalin Marinas wrote:
> From: James Morse <james.morse@arm.com>
> 
> C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
> all outstanding SME accesses. Instead a DSB needs to be executed on the
> affected CPUs. The implication is pages cannot be unmapped from the
> host Stage 2 then provided to the guest. Host SME accesses may occur
> after this point.
> 
> This erratum breaks pKVM's guarantees, and the workaround is hard to
> implement as EL2 and EL1 share a security state meaning EL1 can mask
> IPIs sent by EL2, leading to interrupt blackouts.
> 
> Instead, do this in EL3. This has the advantage of a separate security
> state, meaning lower EL cannot mask the IPI. It is also simpler for EL3
> to know about CPUs that are off or in PSCI's CPU_SUSPEND.
> 
> Add the needed hook to host_stage2_set_owner_metadata_locked(). This
> covers the cases where the host loses access to a page:
> 
>   __pkvm_host_donate_guest()
>   __pkvm_guest_unshare_host()
>   host_stage2_set_owner_locked() when owner_id == PKVM_ID_HYP
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> [catalin.marinas@arm.com: move the hook to host_stage2_set_owner_metadata_locked()]
> [catalin.marinas@arm.com: use hyp_smccc_1_1_smc()]
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Vincent Donnefort <vdonnefort@google.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> ---

Reviewed-by: Vincent Donnefort <vdonnefort@gogle.com>

> 
> That's a rebase to 7.1-rc1 together with a few tweaks. The initial
> workaround for pKVM was posted here:
> 
> https://lore.kernel.org/r/20260323162408.4163113-6-catalin.marinas@arm.com
> 
> I dropped the vN numbering since the original series evolved a bit. I
> also changed the subject here, more suitable for a stand-alone patch.
> 
> Changes since last time:
> 
> - Use hyp_smccc_1_1_smc() instead of arm_smccc_1_1_smc() as suggested by
>   Vincent
> 
> - Do the SMC only when the host loses access to a page and not when the
>   ownership transition happens in the other direction. Guests do not
>   have access to SME in current mainline
> 
> I looked at the Android16 backport from Vincent and it covers more
> cases but they do not apply to mainline (sglists, donate to FF-A). I
> could not figure out why changing a host permission from RW to R or
> !valid matters for this workaround, so that's not done here either.
> 
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 +++++++++++++++++++-
>  include/linux/arm-smccc.h             |  6 ++++++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 28a471d1927c..75977179c9d1 100644
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
> @@ -14,6 +16,7 @@
>  
>  #include <hyp/fault.h>
>  
> +#include <nvhe/arm-smccc.h>
>  #include <nvhe/gfp.h>
>  #include <nvhe/memory.h>
>  #include <nvhe/mem_protect.h>
> @@ -29,6 +32,15 @@ static struct hyp_pool host_s2_pool;
>  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
>  #define current_vm (*this_cpu_ptr(&__current_vm))
>  
> +static void pkvm_sme_dvmsync_fw_call(void)
> +{
> +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714)) {
> +		struct arm_smccc_res res;
> +
> +		hyp_smccc_1_1_smc(ARM_SMCCC_CPU_WORKAROUND_4193714, &res);
> +	}
> +}
> +
>  static void guest_lock_component(struct pkvm_hyp_vm *vm)
>  {
>  	hyp_spin_lock(&vm->lock);
> @@ -574,8 +586,14 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
>  	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
>  			      addr, size, &host_s2_pool,
>  			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
> -	if (!ret)
> +	if (!ret) {
> +		/*
> +		 * After stage2 maintenance has happened, but before the page
> +		 * owner has changed.
> +		 */
> +		pkvm_sme_dvmsync_fw_call();
>  		__host_update_page_state(addr, size, PKVM_NOPAGE);
> +	}
>  
>  	return ret;
>  }
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

