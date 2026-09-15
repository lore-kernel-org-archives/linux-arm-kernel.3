Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D02C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62UkEF2WigrS8Qx3ZV8XeKxYeA/oVOGI4GnA4AVT89E=; b=0gXOyuMj2KTV8QUfJy4U0Yuuun
	YObBYmvZwoP70/9y8r6IeXeQRnipHQre/Q+ODLTNlbNX85qV8Uoicv7YdKkPXAkIhJ8emLDh1kpgD
	7kgyFumlDjXpWLazK8Ork8v5kp5UTepMfPs72UI034rataiDjao9CMcKF/4BTJvOxJw+xkBGysZ6o
	DHwHrAky/oopIVXYLMtY2hhcy3rTkqcXeOMXQH+RXwKf/Gxzk/Q8IfcvUQZYwzu4ZL+Ovnr4r9EtW
	O1Phb3tHs1NGcBFH5LcOe5zzgnvAe8Z5LoeuTTuXpS9883bSMJI9tSJ5xR3dYlTdbBPMEr6ptmI+e
	xjvrIO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ngv-00000005U0z-3OwV;
	Tue, 15 Sep 2026 07:34:57 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ngs-00000005U0W-2nEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:34:56 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485b1d2874aso2256313f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789457693; x=1790062493; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62UkEF2WigrS8Qx3ZV8XeKxYeA/oVOGI4GnA4AVT89E=;
        b=PNSfGWIdkO/HN0DFHZnV+Wz8tUw9x1SRJtkdpsIPar/CEoo6ytRJC8TboR6Smot90o
         TRrB1L1hcNIUgNgyx6QOG/YwyI5UOGxQEjwYh5RItk8Msi/iBo42StRWbJuJtfMY68JW
         IaiMTEz2Ihm0v7vrv5QhTHiKroh4LiEgrWpIWTX9y8eF/XliUzw2xHCGM0LWBzmO9jFv
         spvaoH0lfgRGKek+UJGQfTiuw2F8Xg/NZneXQT/bGWLXBrinYSs5zgxUhjuVAgHiciiM
         AnSGYRL43IyYIKq+25hJfaU2Wt44Rk2a/LsNX3DrX0i5u9XndA6IOITzdghc0rFgQPzd
         6hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789457693; x=1790062493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62UkEF2WigrS8Qx3ZV8XeKxYeA/oVOGI4GnA4AVT89E=;
        b=enLnWk9uQa7ZlC6GXaJtD98neO4EIpHlO83XtSlWMHIYJiPAj+uM2Lx9Hkgs4plUG3
         0aFVbStBl+v40m7Z5hC5z84KJSTBnf7hEuk6CyFrp9tTVfiIq+udh3yhHHHJgl7mtrGi
         WpPOs3yx1eiO0Ix5ZW+VdB4fn1CxHwk6fYRqhs739csUJGseqTpjvfKq7+UEtYU8dBpO
         ZCi/67RFMOmh6Yx4VMk0RFgv2tdyerRx1fs6hEkvT6jk9kAWr732dUYwksgstKkONC2s
         1NMR8ukXCgubEqdqfcYSQQ3B0Vd05vixw+d6ZICx3iEuUikqRR4YAq/8xPzPnYhGFBVz
         dmyA==
X-Forwarded-Encrypted: i=1; AKwUvByYydsqGjmFk8WAsTz5IBD4f0k2R9tUiAfSbz/z2TsWrPRJF7zJt6P61m+ZzObgbjewW/6uKr0TMLWzFhhkXnL0@lists.infradead.org
X-Gm-Message-State: AFuF++mmhxTwB93Wb8wG0Ml/IF4C5KS86FTfIZq1yNDz6xLXvmkPzvOj
	rwi3arnNAtFwX2JwKYFQKC/qniyqaLkiM0j71/+4W+lx0eGwzQ3EJCmRTtSA0fzqyb9E5QWbh13
	6pBeBEQ==
X-Gm-Gg: AYBFou2gCGYYx9zlau+bInDkKZf8YLdfhCHK1AKKFzLAIzI3zuhwHjRGVEs3Au9zgdT
	5ohkzDzhPb0kPrir5kpY8w+oCxFtN8csl9dniG7u9M74D2G0RPu8kuWx8rHz1iql03EB0HsamOv
	k/CZ0iCrbhWgDFvbiAOyi2O+hht/GvtrmaYSUKgRWGxRxwOxpm1F8SJHYfbhrBRwOmTNhA71yxY
	nKQSta39rPLSippn2LgHAIKeDh5hBoolSsvpGw7rtVrjeYRe85afDWpRciYrpYPddbR8bp+nlzt
	sYxNgQN4WzFs6NkDegTNcXAmNVGdbIy6vPrMCgmUllsiiiLXobolpEtb7NXWhLn3GDYmYzIuYBf
	CXVZ5Y94inqb5VkSGz+x6G4aGRMb8XJ3Suw04ANqfkgbwovamfrszn3/TWE0JKKjkYJ66PBJ0Nt
	aFAWK9piqm/gypC6gqamWevHD8WjRSRomAOOdWPVP6j50nxoAb8DMIE8WER7869XbsdWtRiC1eG
	hQG1Thy2JNFIOAzQl2O9T9GJ0QHNYyOI3h/vLG+isY=
X-Received: by 2002:a05:600c:a00d:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e7a686db5mr168895005e9.15.1789457692234;
        Tue, 15 Sep 2026 00:34:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d66ab6esm51074165e9.2.2026.09.15.00.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:34:51 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:34:48 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v2 1/2] KVM: arm64: Validate the host vCPU's VM before
 reading it under pKVM
Message-ID: <aqj1GKamuBraiub0@google.com>
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915070418.3209779-2-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_003454_736354_1158DFE9 
X-CRM114-Status: GOOD (  30.18  )
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

On Tue, Sep 15, 2026 at 08:04:17AM +0100, Fuad Tabba wrote:
> On an MTE-capable host under pKVM, enter_exception64() reads the VM's
> MTE flag through vcpu->kvm, which for a host vCPU is a host-writable
> pointer nothing validates. The host can point it at any address in the
> hyp linear map and read back bit 1 of that word through PSR_TCO in the
> vCPU's CPSR, or panic the hypervisor with an unmapped one.
> 
> Get the VM through a get/put pair around the read: a loaded vCPU's is
> the hyp VM, an unloaded host vCPU's is read once and pinned, and a
> pointer the host never shared leaves TCO clear.
> 
> Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260914070536.877D91F000FF@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/exception.c             |  5 ++-
>  arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 18 ++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c             | 39 ++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
> index 754e2dc1df54a..6e60d890afa4a 100644
> --- a/arch/arm64/kvm/hyp/exception.c
> +++ b/arch/arm64/kvm/hyp/exception.c
> @@ -70,6 +70,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  			      enum exception_type type)
>  {
>  	unsigned long sctlr, vbar, old, new, mode;
> +	struct kvm *kvm;
>  	u64 exc_offset;
>  
>  	mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
> @@ -109,8 +110,10 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  	new |= (old & PSR_C_BIT);
>  	new |= (old & PSR_V_BIT);
>  
> -	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
> +	kvm = vcpu_get_kvm(vcpu);
> +	if (kvm && kvm_has_mte(kvm))
>  		new |= PSR_TCO_BIT;
> +	vcpu_put_kvm(vcpu, kvm);
>  
>  	new |= (old & PSR_DIT_BIT);
>  
> diff --git a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
> index 4fdfeabefeb43..a4fb04faa7d09 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
> @@ -13,6 +13,24 @@
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_host.h>
>  
> +/*
> + * Under pKVM a host vCPU's ->kvm is host-writable: the nVHE pair
> + * validates it.
> + */
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu);
> +void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm);
> +#else
> +static inline struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->kvm;
> +}
> +
> +static inline void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
> +{
> +}
> +#endif
> +
>  static inline void kvm_skip_instr(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu_mode_is_32bit(vcpu)) {
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..9bdc7a9b84b8c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -11,6 +11,8 @@
>  
>  #include <asm/kvm_emulate.h>
>  
> +#include <hyp/adjust_pc.h>
> +
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/memory.h>
>  #include <nvhe/pkvm.h>
> @@ -304,6 +306,43 @@ struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
>  
>  }
>  
> +static struct pkvm_hyp_vm *loaded_hyp_vm_of(struct kvm_vcpu *vcpu)

pkvm_get_loaded_hyp_vm()? to align with the other.

> +{
> +	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> +
> +	if (hyp_vcpu &&
> +	    (vcpu == &hyp_vcpu->vcpu || vcpu == hyp_vcpu->host_vcpu))
> +		return pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> +
> +	return NULL;
> +}
> +
> +/* An unloaded host vCPU's VM is mapped at EL2 only while pinned. */

Could we get the last paragraph of the commit here? As this describes quite well
what this is doing.

> +struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
> +{
> +	struct pkvm_hyp_vm *hyp_vm;
> +	struct kvm *kvm;
> +
> +	if (!is_protected_kvm_enabled())
> +		return kern_hyp_va(vcpu->kvm);
> +
> +	hyp_vm = loaded_hyp_vm_of(vcpu);
> +	if (hyp_vm)
> +		return &hyp_vm->kvm;
> +
> +	kvm = kern_hyp_va(READ_ONCE(vcpu->kvm));
> +	if (hyp_pin_shared_mem(kvm, kvm + 1))
> +		return NULL;
> +
> +	return kvm;
> +}
> +
> +void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
> +{
> +	if (kvm && is_protected_kvm_enabled() && !loaded_hyp_vm_of(vcpu))
> +		hyp_unpin_shared_mem(kvm, kvm + 1);
> +}
> +

It seems strange for pkvm.c to provides function that aren't prefixed with pkvm_
and declared into adjust_pc.h and not pkvm.h. I wonder if adjust_pc.h should't
just

struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
{
	if (is_protected_kvm_enabled())
		return pkvm_vcpu_get_kvm()
	else
		kern_hyp_va(vcpu->kvm);
}

>  struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
>  {
>  	struct pkvm_hyp_vm *hyp_vm;
> -- 
> 2.39.5
> 

Beside those nits:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent

