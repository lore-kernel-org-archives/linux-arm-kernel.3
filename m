Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF682CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBCM6xv4Yg8/S1sk1lPfe+sG+a+CcBVlpaZP7IkBPRk=; b=zt9nILxHvw5+5aHNgBF57dZe45
	XwW+56fQn4qbCqfhHHE9FuUZF48tGq9OvN5p0fFauqgVvLzpji6gQtRYGXfnjzwngfFa/jpkVUVH/
	Y2/zcDSONml1/4FJCyIzLUMJi6Il2Byyy5DAkjRdRXBGtauAQ6PenkinHexdtvmSQ/eKshaQdTJ1/
	HbwlpHUGoE7QnJbVg/8h5nzyKeyflsmrhcWgMkZdCjHr+SYrDTSkSWoXsHOnHGyCgwK51gEm3ALxo
	NnBN8IoxVUQWuJLNuE1PjKI4sTDdQiIaXdxU9Lk+piV/HnH8FPYnga8K2TKvpLwC4XrH+oGY7UDdB
	yXCKMjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcRh-00000000vCA-1oMW;
	Wed, 06 May 2026 13:37:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcRg-00000000vBf-2R5S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:37:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso48555825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778074667; x=1778679467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBCM6xv4Yg8/S1sk1lPfe+sG+a+CcBVlpaZP7IkBPRk=;
        b=bedGH42w3gnFfI0prR5gCbUpbwWiltUKnNzyU/EOGplsQOsEjnpdihe2Tbgllk/qHk
         /1RblW/KaeDodm+9DDexuZP+g7ivJdkkjnXH2M3VPc65SfuIk66wVR0SVzVfS6Eq13kH
         gJsA1u+SSM9Mcx0mdwqeWamuYRZfCWMm7K2pVsSBsRbmhr+irogffpYkuOT/AqCdiv8a
         oq1e80PLYaGww1CXhMg1R0bOZQHk/D10toUL128zdAJE61NHnYuw5DtxVu4YkOn/Gzwp
         xqx0Vmu0/vuk2Wbi3N6ca11UIzUuqOhKyEGSeC+/SQ7Y3YojG8N+USeK/nEKPvu8cx+8
         yFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778074667; x=1778679467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBCM6xv4Yg8/S1sk1lPfe+sG+a+CcBVlpaZP7IkBPRk=;
        b=GE7oJosrfRTTE+B+yoH4BOx6zseqOj98MTl/pmwSdsJ54Zstjd71ot59JsF6LfRNMF
         BXBeUB3GogeYhW8Mag8LYPxlNxkzCAmySXOGUPPEExuwibBNbMpyJk2qhd0mpniThH+3
         9W3kzg91p1JlW+mo6jJav2Iox6Cy2iORv8xg5fltIei3CQoQBaAx4ii0nQArXiH19bo/
         57c6h+R34hNqf9zPPaPpqN4o6l2xavm+SKbD3BmrnEQihjnXEPmKhJPt+Ob33RyGOLIW
         s9hsNuBdrVF9HlNltScV4Qo/SuyS82/NWZh84zIS7+5+OYV7shg3E2gA99bVHEDEToL2
         kP4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Z3eZW6EiQgnPlWKOkJEBXHsiVdbenBJMNti8nZEdBPmns6ZpkQhQygAY+WPcyzPxEttSr99hJty/bo34yHnb3@lists.infradead.org
X-Gm-Message-State: AOJu0YzXcPwrs/kVuIPmBWh2x5lV3ksAtGwk/W0+uhMjFzEROGhj1IRC
	CINBW0sDYedVnozP0Zsb/xAVS6oB6v+15eICvs5YdFByGj3tVSPSh7/j143d3emWJg==
X-Gm-Gg: AeBDiet+67NPQj355WwuRoE/ji1y6TVyGKZEBZDiRUlXqJ8fmRrBp4y37BjNuiYrxSV
	kjMwkIGkg4A6SSM09JWS8HOa80gnwzkNj/R9uc6Ncx1pepsGECGnI1wE0dTD9a2FT0RHdGfgbQX
	RLoy9BVl8D7PY3aktnPKzL90SbCSE6ZXzPXXKVPQ2vSBPJmyzVITNuZ0NaBeHeoOHauA3gydcfG
	ZK8bgeKhhSomtr5cR4ouR+aGOeqIZQzn91fKPOvmbMrgLQ0zBL8FaPKCwOOZ2xx8c8mxVvHTuPe
	8gXPKJffjWg3D9eFtZkTLaI4tT3uEQwndttPtaJ7d4N1B6OTihzZZ/hysz9Bem14UAYqzMPEIWn
	LfpHWhie7GI3AeTIQjHiP+IBj25ioUW9b5f+ql2IUU+Gp52XX0iesaO6AWNbRLOLxkjIhiKV7qM
	KtZFPmXuAqHhbuFAsQnaMmkYFluewe/kjLuTr2fFvQgqzhEPMnCd11+lsYJrD5ATRsZOH+/NKlK
	MU03aPmdO/ih/5r
X-Received: by 2002:a05:600c:a08b:b0:489:1f3e:5f69 with SMTP id 5b1f17b1804b1-48e51f40252mr61663985e9.18.1778074666409;
        Wed, 06 May 2026 06:37:46 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312df8dsm16977685e9.18.2026.05.06.06.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:37:45 -0700 (PDT)
Date: Wed, 6 May 2026 14:37:41 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v2] KVM: arm64: Work around C1-Pro erratum 4193714 for
 protected guests
Message-ID: <aftEJffxGZ_XSk2E@google.com>
References: <20260505165205.2690919-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505165205.2690919-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_063748_659699_B2B9D0FD 
X-CRM114-Status: GOOD (  40.22  )
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

On Tue, May 05, 2026 at 05:52:03PM +0100, Catalin Marinas wrote:
> From: James Morse <james.morse@arm.com>
> 
> C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
> all outstanding SME accesses. Instead a DSB needs to be executed on the
> affected CPUs. The implication is that pages cannot be unmapped from the
> host Stage 2 and then provided to a protected guest or to the
> hypervisor. Host SME accesses may still complete after this point.
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
> Since pKVM relies on the firmware call for correctness, check for the
> firmware counterpart during protected KVM initialisation and fail the
> pKVM initialisation if it is missing.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Co-developed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Vincent Donnefort <vdonnefort@google.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> ---
> 
> Added the kvm-arm list this time, missed it in v1.
> 
> Changelog below but it's only probing if the firmware counterpart is
> present and disable the hypervisor. If that's too harsh, we can leave it
> as a warning and maybe add a static label/flag to avoid the unnecessary
> SMC call on page donation.

As the pKVM upstream support is currently experimental and the protection
incomplete (see Documentation/virt/kvm/arm/pkvm.rst) perhaps a simple WARN() is
enough?

> 
> Changes:
> 
> v2:
> 
> (v1: https://lore.kernel.org/r/20260430155911.628402-1-catalin.marinas@arm.com)
> 
> - Add a check in init_hyp_mode() if KVM is running in protected mode and
>   refuse initialising the hypervisor if the firmware does not provide
>   the workaround counterpart
> - Add 'Co-developed-by: me'
> 
> v1:
> 
> (pre-7.1-rc: https://lore.kernel.org/r/20260323162408.4163113-6-catalin.marinas@arm.com)
> 
> - Move the hook to host_stage2_set_owner_metadata_locked()
> - Use hyp_smccc_1_1_smc()
> 
>  arch/arm64/kvm/arm.c                  | 21 +++++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 24 +++++++++++++++++++++++-
>  include/linux/arm-smccc.h             |  6 ++++++
>  3 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 176cbe8baad3..51b6db45a54f 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -4,6 +4,7 @@
>   * Author: Christoffer Dall <c.dall@virtualopensystems.com>
>   */
>  
> +#include <linux/arm-smccc.h>
>  #include <linux/bug.h>
>  #include <linux/cpu_pm.h>
>  #include <linux/errno.h>
> @@ -2634,6 +2635,22 @@ static int init_pkvm_host_sve_state(void)
>  	return 0;
>  }
>  
> +static int pkvm_check_sme_dvmsync_fw_call(void)
> +{
> +	struct arm_smccc_res res;
> +
> +	if (!cpus_have_final_cap(ARM64_WORKAROUND_4193714))
> +		return 0;
> +
> +	arm_smccc_1_1_smc(ARM_SMCCC_CPU_WORKAROUND_4193714, &res);
> +	if (res.a0) {
> +		kvm_err("pKVM requires firmware support for C1-Pro erratum 4193714\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Finalizes the initialization of hyp mode, once everything else is initialized
>   * and the initialziation process cannot fail.
> @@ -2834,6 +2851,10 @@ static int __init init_hyp_mode(void)
>  		if (err)
>  			goto out_err;
>  
> +		err = pkvm_check_sme_dvmsync_fw_call();
> +		if (err)
> +			goto out_err;
> +
>  		err = kvm_hyp_init_protection(hyp_va_bits);
>  		if (err) {
>  			kvm_err("Failed to init hyp memory protection\n");
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 28a471d1927c..7d59faa99fee 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -5,6 +5,8 @@
>   */
>  
>  #include <linux/kvm_host.h>
> +#include <linux/arm-smccc.h>
> +

nit: probably not necessary with the nvhe/arm-smccc.h include below.

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
> @@ -29,6 +32,19 @@ static struct hyp_pool host_s2_pool;
>  static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
>  #define current_vm (*this_cpu_ptr(&__current_vm))
>  
> +static void pkvm_sme_dvmsync_fw_call(void)
> +{
> +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714)) {
> +		struct arm_smccc_res res;
> +
> +		/*
> +		 * Ignore the return value. Probing for the workaround
> +		 * availability took place in init_hyp_mode().
> +		 */
> +		hyp_smccc_1_1_smc(ARM_SMCCC_CPU_WORKAROUND_4193714, &res);
> +	}
> +}
> +
>  static void guest_lock_component(struct pkvm_hyp_vm *vm)
>  {
>  	hyp_spin_lock(&vm->lock);
> @@ -574,8 +590,14 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
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

