Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E47CE9D40
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtDur45tUpvGHBeODYEpZIXDPSFkzMbSKKzV/vunzJU=; b=Et1590PlYY5CKFLrM02q8wp+34
	tSPPfOGAYQjObuNMq6KZ8oYN0F8Aoo3afJZAryojZEsxhWvUsc+4BqJEJWP2MZMMlY8zH2mdaYvJu
	0mZSc+NDVBrdTl3B6rm9SAPDt49PnRKpdqPEY+vP6zcqECV4Gun+OVZZ7+NzjGu8mDEuBK70VRGLb
	tTVTodLaMEEVXLWh5+/ljVqq+ZjHxwzGesN6BtVJo4XAFudtizMuwfp3hSWlGRDPAGvgxG4dR5Iya
	29cvODg0wEH5vWb6Cjyy8ezteZFjwRgpijfbF/cGFdxButA7fnXbw/t8j47mGCEd6Cf52hL2Kx827
	sNDVQvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Lw-0000000DKEy-1BdQ;
	Tue, 06 Jan 2026 14:48:08 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Lt-0000000DKEM-3PmD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:48:06 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37b495ce059so8636521fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767710883; x=1768315683; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtDur45tUpvGHBeODYEpZIXDPSFkzMbSKKzV/vunzJU=;
        b=xtpUASXdLBBiQZxhIgF/qbOoEmVYp/HPclSaJfrqi0ZeuP7mdT1GlHBB0RIMymTgnp
         IrYG7ilJtPDEIEx8kMlIJHScG8V8bvNJsTxwpkzIjqtcoEcQk9VQ+9BZ4/83k8wONSVO
         BFcfd/nRm4T1LPKdisYDn1PMzGVAWxocMQGPAb3Wbqs0nSsaqpLFDJRYbfYH/GvdimtV
         nUS53gg+ree/9HodZkoPFqy3/olempN6KXII0PYsYeAgisuBHiEDG3cco9rLb1I41k3l
         b0lmpfmS2bXIAWlziLGHx8j9hEpJrTYx0C2tPY0K8UOpRWD6AjwBdNqCfhHtW4xVGmE9
         8DQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710883; x=1768315683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtDur45tUpvGHBeODYEpZIXDPSFkzMbSKKzV/vunzJU=;
        b=HsEHIZo2qjXqjQeb1Lbn6vo4lQdHZKLEcn/yXS5KMwLfV7AnSAG60dwAnytecps3Ob
         if4TkpOs/cg3z1Dakm6Ez50rx+kNPxjUF6zXbPVBFk+cYfjQ7xPA4a4rFAOL1DN7/Dz9
         Ldrx5lwnLdRDN1GsKGqNB330zjSfnjUYQmMscFE6po26bULWJqko+j/E9Aq78S5hlVKk
         u45Do/S0E3oqk6pRVJmqL4zjUlAi73APzwDvaoBim2okbxUSMOkYr43X8FV4a1o5vEdR
         kGSHywQ8EuPHjvPN6VTTKo3i2k4XYkSabX13Ah8NwG/FePOGoBFawd3DCiP+20GCaQ8C
         hYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiuEYCBT2N4b7KcWi9AU5t8Re/LEBT1O65Iukh1skfjZ6n8VpFI8WB6VCB2cMYwxzb8MceGSpUUaLStpa+Ox6J@lists.infradead.org
X-Gm-Message-State: AOJu0YzVXCCRs5Wuh5/RPc5pJuZ+w3wn9suUkoyetYy5DBkjdfj4D9Ln
	c38CpaIe7qsMlBrOKlTRXUJwEnAkXeOia5D87EMkbTec1UnSI21x2Rr82qSmMtAAfA==
X-Gm-Gg: AY/fxX7yNCST1EWRneCCv550bcxAMkt2+Bj4D+a5NGYemzT1BeCl7HksuMbELpTn3F0
	8VQsPlsU3eQKMCiXBzrVGutF8Xh4SZXaEPvQ9YpUA/ekv0oYuqSolc2sjn7Y6IIBcFKDRKH1DsS
	A8aAK0mL4CAHqOR9ar/hOVF4LvuhXW6Wp1Nuv5kIVpDzoN5bienExIpCupFR8rfO/Cb8s4//p7V
	+Ustmf2lTvp8y7AOM9iw7PMSshgGagMsXO2IabTT3UCu9E0IexksxXkxpvNCjzAsL3+YAHmyS9P
	q1xWFMtbDsHfC7F7CkFigYe3GIn7fMNcR3xgG3aMgzOoPCpSQyiiUoDJutSU1LuJNaziIUINkuo
	M2iSZzg9ia9SocasDorWO8lCZd/xM7LTC+7XDYlD3ETyvA8AFN/eQbtZLsVpiR0tMXwlODuDynJ
	tEuv2xfWy/qm3ypg829arv820vQWfXbh/9KsKJZ70Xl4Obyj/Jyoo0BlPrIqE=
X-Google-Smtp-Source: AGHT+IE+ZL+V7gktGnlm7LVqMvKTrTGnblhmHNM9MbGSbRXG1yK3rUURQTo8Ey8bV8cdhAW0kWdHlA==
X-Received: by 2002:a05:651c:31c6:b0:361:5fa3:1d58 with SMTP id 38308e7fff4ca-382eaa1fda6mr9231971fa.18.1767710883332;
        Tue, 06 Jan 2026 06:48:03 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382f969cc6bsm1910641fa.0.2026.01.06.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:48:02 -0800 (PST)
Date: Tue, 6 Jan 2026 14:48:00 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 10/30] KVM: arm64: Introduce __pkvm_host_donate_guest()
Message-ID: <ocpyeygxhp52jt2mcqq4tmdodubrfdwo4xqvbphmr34x4etrkk@f3ag3a7j5fru>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-11-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-11-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064805_873175_69B2FBE4 
X-CRM114-Status: GOOD (  16.00  )
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

On Monday 05 Jan 2026 at 15:49:18 (+0000), Will Deacon wrote:
> +static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
> +{
> +	DECLARE_REG(u64, pfn, host_ctxt, 1);
> +	DECLARE_REG(u64, gfn, host_ctxt, 2);
> +	struct pkvm_hyp_vcpu *hyp_vcpu;
> +	int ret = -EINVAL;
> +
> +	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> +	if (!hyp_vcpu)

I guess we should check this is a protected VM here, else a malicious
host could donate pages to an np-guest. I didn't try to think through
the implications, perhaps it's fine, but it feels unecessary so I'd say
let's be restrictive here.

Cheers,
Quentin

> +		goto out;
> +
> +	ret = pkvm_refill_memcache(hyp_vcpu);
> +	if (ret)
> +		goto out;
> +
> +	ret = __pkvm_host_donate_guest(pfn, gfn, hyp_vcpu);
> +out:
> +	cpu_reg(host_ctxt, 1) =  ret;
> +}
> +
>  static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
>  {
>  	DECLARE_REG(u64, pfn, host_ctxt, 1);
> @@ -580,6 +600,7 @@ static const hcall_t host_hcall[] = {
>  
>  	HANDLE_FUNC(__pkvm_host_share_hyp),
>  	HANDLE_FUNC(__pkvm_host_unshare_hyp),
> +	HANDLE_FUNC(__pkvm_host_donate_guest),
>  	HANDLE_FUNC(__pkvm_host_share_guest),
>  	HANDLE_FUNC(__pkvm_host_unshare_guest),
>  	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 49db32f3ddf7..ae126ab9febf 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -958,6 +958,36 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
>  	return 0;
>  }
>  
> +int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
> +{
> +	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> +	u64 phys = hyp_pfn_to_phys(pfn);
> +	u64 ipa = hyp_pfn_to_phys(gfn);
> +	int ret;
> +
> +	host_lock_component();
> +	guest_lock_component(vm);
> +
> +	ret = __host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = __guest_check_page_state_range(vm, ipa, PAGE_SIZE, PKVM_NOPAGE);
> +	if (ret)
> +		goto unlock;
> +
> +	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_GUEST));
> +	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> +				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
> +				       &vcpu->vcpu.arch.pkvm_memcache, 0));
> +
> +unlock:
> +	guest_unlock_component(vm);
> +	host_unlock_component();
> +
> +	return ret;
> +}
> +
>  int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
>  			    enum kvm_pgtable_prot prot)
>  {
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

