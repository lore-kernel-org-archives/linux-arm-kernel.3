Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF076CE9D6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zN3gm9omWhJ2I79tHQv97PtdD9jIxIIRpoGDLMdPnsQ=; b=GASRsRHDdIBGM6h8eYPnoNekJC
	MLstrvb/Q49VUhQcyG/cUXTyX8n6xYlKg0yyGwqtREcazlXLs/tbZbRD/Ay2hKWuhwUToDgnyKYVy
	aOQ0X3/ecpoB5V8eRhP4+4FANGP7wyjZrGmEewQzMSnDdjU7ryjN5zGo4lVwFdiwH5hMfGAJWNAGk
	FXwTQ9te8mvXHhjS4jTI0AI/AEUZ33JR6PEIJLoWHBttFCS3BKd7tlPNLEhEVL8Uh5EL/6tECJdIl
	G0lKJ7ZWTfBw6AGgOjCqw+QPpaFTFlBA/SI37VBAs5fXCU0EkQBZyjdAdq/f/6nWjIRnm0Z3zNxfb
	cEuuYWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Nu-0000000DRUI-2c2h;
	Tue, 06 Jan 2026 15:54:14 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Ns-0000000DRTt-0ISF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:54:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so847085e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767714850; x=1768319650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zN3gm9omWhJ2I79tHQv97PtdD9jIxIIRpoGDLMdPnsQ=;
        b=uvLtOd4nHvj7hiCEjct+6tP8lVNwEBkPDiIAlTsFk79kLtFLpnhbropFSWvkVN4wtp
         WzTMnqgjq9fssOOjxel1PchEkWldSlcRYHFuyEaj/T4fGiJXFy5jsts/7OSSiuN8rZdk
         3uA816RAM2zkbymJ2MYjVB5lIKQpZqnT4URv7nYhhcs+I5wF1ZdVuSjzHUycxnEDPDO2
         FloZcekbhEZzZ7WjwhaRDh1xl7ZYocxJdnvnaSPUFW54t8s4Nayy/l2XFMMAY1I0urHz
         rP8ybh9GyRQ+SdlENtrliXL47eTLzucz+WkY4CiOD0CSKOCv5Gk0NmvL82/xC7cdBJP1
         razQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714850; x=1768319650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zN3gm9omWhJ2I79tHQv97PtdD9jIxIIRpoGDLMdPnsQ=;
        b=fA0OmYXGofrg+ifSuAPlZD87uqpFtPJRopcjviv6iCKFuPMhkU1fyIUZ+Ewb0UnvBZ
         lhprOFjiFXepVjSHfnMMyLtDF64n6nR3wKZ0ZrB65XW97HX0T+AbixwOzUFUNOYtSpRV
         U1HbWMZ34ObVRan5IslDQuNBLzGAIbqirlFJgAx8SmszMqCwsxuo5RTAr9eZm6nWgkWy
         yvgvCw1eDgb/1zO30S0snzzmxT2gBuE/6La8knw/teohgbYrtcpB6Sm12ZNokFVLuIOg
         tjxhpMgyfOnswtXQWpQVIWB9z7Ay+vkW8Cb3Q55sW+yyuZj7p+87v1/UaO46Y0OV+qut
         fk6g==
X-Forwarded-Encrypted: i=1; AJvYcCVxmwc07ifT4x7CxgVlMRs2uosDyFWbBiZeYkyA3TWSHibq/0ACods/8p9YXccjwaJXp/4URJCeJS+ss//w54TT@lists.infradead.org
X-Gm-Message-State: AOJu0YwMTGM8i6DLwfbKrCU/AFot0HblwyMrggQskcnHQUi6wZlhC/Ul
	AsbnRdMVCgBK9sktauHbCEdpIxOgcwpp+1Jx3yO4LwF7pSYJOEzhKW7KqkJk3+3GDJys+78GOnj
	JI5Y1Mw==
X-Gm-Gg: AY/fxX739bmbckFsKuHo8vNAWaAf0+ey4g/7IyVCIGNI/7rUBWLuUW1Vl7IWNxLDmQP
	Gc+jXkbdittSM8ZNpHPUIfRvnBlRepbNp7Cl6icUnd97zzTw2i/LyVc9bouOn5ZFINNvDJOjHTF
	8P3i5rA1RHcwQTci9bZUOn+Y8sj9YzcZctBfPB+ychTOjtK2GIYBe9/mGbwQUppbmQfzB1EeLC+
	GW11zssHDvqXopqynGgzjQW+ChDq6W4gDEbViPrwDVSHgMzfCrumptAcXNCznncFwK6tbRwSaez
	RqaQrwqgsZKxbg853Mai3B30nLIdbDduRpdbJhXl4zEje+8u983IXrPCm4IRjezy6+uIsKo1pBC
	HzPxiYqoDJRcfR4ZH4doUkvbpi0eQlXoRPoACM9q0fjEySj55WgGJyjl3yj3UMHfl5I0MLhlIU2
	nJRItslgJX3lTh4UMXW/5uHh3H/xLqcggjWtv5fPTYNIgjO1L5
X-Google-Smtp-Source: AGHT+IEr+Qb6RHsvXmYC4gn7IGjWj58AVOeQ/r2Dl9ZagyqZLq/pQSe8SUdL75TLTQ5bpqptdehJHg==
X-Received: by 2002:a05:6512:3503:b0:598:eecb:c891 with SMTP id 2adb3069b0e04-59b652e85d0mr1319033e87.52.1767714849732;
        Tue, 06 Jan 2026 07:54:09 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5dc8dsm642216e87.46.2026.01.06.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:54:09 -0800 (PST)
Date: Tue, 6 Jan 2026 15:54:06 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 22/30] KVM: arm64: Return -EFAULT from VCPU_RUN on access
 to a poisoned pte
Message-ID: <s4p2ximtz7pki3waw245jtbl5znuco2ijrzsddlmln5x6rgxee@qbek4vpwn3kl>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-23-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-23-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_075412_128272_41906111 
X-CRM114-Status: GOOD (  19.87  )
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

On Monday 05 Jan 2026 at 15:49:30 (+0000), Will Deacon wrote:
> +int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> +	kvm_pte_t pte;
> +	s8 level;
> +	u64 ipa;
> +	int ret;
> +
> +	switch (kvm_vcpu_trap_get_class(&hyp_vcpu->vcpu)) {
> +	case ESR_ELx_EC_DABT_LOW:
> +	case ESR_ELx_EC_IABT_LOW:
> +		if (kvm_vcpu_trap_is_translation_fault(&hyp_vcpu->vcpu))
> +			break;
> +		fallthrough;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ipa = kvm_vcpu_get_fault_ipa(&hyp_vcpu->vcpu);
> +	ipa |= kvm_vcpu_get_hfar(&hyp_vcpu->vcpu) & GENMASK(11, 0);

Why is all the above needed? Could we simplify by having the host pass
the IPA to the hcall?

> +	guest_lock_component(vm);
> +	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
> +	if (ret)
> +		goto unlock;
> +
> +	if (level != KVM_PGTABLE_LAST_LEVEL) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	ret = guest_pte_is_poisoned(pte);
> +unlock:
> +	guest_unlock_component(vm);
> +	return ret;
> +}
> +
>  int __pkvm_host_share_hyp(u64 pfn)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index d1926cb08c76..14865907610c 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -417,10 +417,13 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  			return -EINVAL;
>  
>  		/*
> -		 * We raced with another vCPU.
> +		 * We either raced with another vCPU or the guest PTE
> +		 * has been poisoned by an erroneous host access.
>  		 */
> -		if (mapping)
> -			return -EAGAIN;
> +		if (mapping) {
> +			ret = kvm_call_hyp_nvhe(__pkvm_vcpu_in_poison_fault);

It's not too bad, but it's a shame we now issue that every time we have
such a race (which is frequent-ish). Could we perhaps only issue it if
at least one page has been forcefully reclaimed since boot?

> +			return ret ? -EFAULT : -EAGAIN;
> +		}
>  
>  		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn);
>  	} else {
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

