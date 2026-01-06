Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312BFCE9D6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eow7YGp2kuH+GE5d9YWARtTCyG6zUNWe3jwWa64b+uA=; b=LKLMRgmQpOfUbaKsndG/oGy+40
	lE+Dv7MEFpLeYJxlhi86krmIGsmCRzg5Rs6N5+nCIzmU0Sp8XOKb9l7fQWF1H7F/gchLiCVfeb8QQ
	RwuWOEiNNQmz0GaX6IkN0X1V/3BrNkuITAHHOyuS/zhJqUUBUQiE/rIe2xoPjoZbs6zee0wy3z70l
	+hf1h3tCEzPP1Ct3lqASF5vtaRbxhxFWUCsrT/vjb0D0sOkvqVa3n+D0xL1uwbYxH3hhUXEaDidib
	JQ/oP217WdlJGwC0yWBTWaULZaV2SJOh47obgXRSWkMRnhToQxA4FN9oW0c0U/qJTy8o60n/X33Qk
	CH/WC+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9K3-0000000DRC8-0WO9;
	Tue, 06 Jan 2026 15:50:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9K0-0000000DRBi-1b5c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:50:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so9576825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767714610; x=1768319410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eow7YGp2kuH+GE5d9YWARtTCyG6zUNWe3jwWa64b+uA=;
        b=D/6Q1Tb8SA+aejZzr1Ovh8mPDLzhHZY+FRBQDmhhMSbJNUCMvOXOqX4mcXP8GKV3Nt
         qPhidn4JoCZuSSdCyrA6twik5mo2nZObrbHDmN5hbfA9kJz/dwwv8UvGZpCmeYiOo4tp
         ZR+XpIi/YXc0kP5QTYCyDQ6o20Dqiwk0Psca8qTKi3qQcMkdhewj65I4XIQmpAckIYwn
         9aBFxT1WEWuIE/uwfZIXJQXNpqCaRIDMN4n5d/imst0Ympkk7CRTQPW/vlIwYcwPQoO3
         YVtmZroYetRfQ+6BKw4VGddxO0ScR7dVXwB41E/kcanwY3TbOXdYYeT/3+i/a1AYADsS
         liUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714610; x=1768319410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eow7YGp2kuH+GE5d9YWARtTCyG6zUNWe3jwWa64b+uA=;
        b=Ja7j535xmfpEFysFzjU89BQvPIei+WjTJXuO1V54WvP/TEw8Toi63VIlSC83Qn6QYD
         7/XbgN2D4SrlHI9rjCttEUXAH9bHILG9xuRoNaXd9TBNAFu6V115MloAtrvfy5tEf/5W
         JUP9UfXEzjeFi+BkHix4fwdL5WsDj3jFBVILimFhl0oz3LTRzGssn4ARoD2iodQV49qs
         w4I9U9fHFHlXp29tHuVZVQyWJW+oERwMq3B66ZDSwV/stl1C99yVJ2MPzmxS9AdMAqeH
         dWkgLH6xwb7DVwcWqLqw94bEjsY+jOJE0RVC1XQ9vhPMcDhKEqYolxmJ3zoyHlJEHaBe
         9upw==
X-Forwarded-Encrypted: i=1; AJvYcCWDk64VDtjquOCf3DDl2KvdWTfeAPQaSYXew+nnR6il2E9qC8sAepX49HvlZFQgd23aDVFNmkF3hWwyHalmD5F2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+XgxhefpSqRuCI39Av34KrcqYsb573T4q+Cne3SXcaI4JzybI
	YzGeV6c+zK7U1VktcSlalSUgCYWWpZyG/6mBSYNoZDIbDIbAFtWyI7n7PBag2baT1qLL2IijJc3
	bue4K9A==
X-Gm-Gg: AY/fxX6/NcIxacrFQaK2yeAPkZT1Xa+j9KZoMhrIxRRe5vuYfsS9F90CnF5VMX6YK8r
	zSoWBzrABRDJz8sOh9E7qQQNVuvrMFY9X10XQ3L1/eqrqhGw1RPU+DJWT/PH6HmI0v/jsxfEZFZ
	T805rBEmfzSQtMAx2/hmKjiyfYY4LeTMJkRCQB4Hk/q8QlehBkLRYKKr+R5BhSi1sTgGD5JcuUF
	zpwU5jaWuiPqozQhfLbKIfe97Fw2yeCkL+UBbY8ET+GwCZZa/9JeX/TjT1d9v+8B+g8JRpQvQsE
	ExTAo3ZuHQ0gZ1I/h6wvdvBi3KJaBHWdRO2Ysl3Br2AVHSb+cqtRHCQE/UYlpunTOgsBVlPZ18o
	FRCDqBkQF+5UAAFaiZHxzousoy56ZznLyG5mdMr3KohudbvUPRmb2+HSK0c2+O+hCOuMrnH5oeN
	hjR3/tXC3iyCVi8cLKx543h0FQlBCIby27jJIu4iSqA1jk7tMADg==
X-Google-Smtp-Source: AGHT+IEX//ZJItyO7FjqymCb6lXmINJqdOCw7NIAx+KO+aXRUmmcBMYkYR4qL9qlFKEcw46R6zcraA==
X-Received: by 2002:a05:600c:4f54:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-47d7f064497mr35962835e9.8.1767714610364;
        Tue, 06 Jan 2026 07:50:10 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41f5e0sm49020395e9.8.2026.01.06.07.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:50:10 -0800 (PST)
Date: Tue, 6 Jan 2026 15:50:07 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 25/30] KVM: arm64: Implement the MEM_UNSHARE hypercall
 for protected VMs
Message-ID: <aV0vL8Mfl-yjWelz@google.com>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-26-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-26-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_075012_446993_4E519278 
X-CRM114-Status: GOOD (  22.00  )
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

On Mon, Jan 05, 2026 at 03:49:33PM +0000, Will Deacon wrote:
> Implement the ARM_SMCCC_KVM_FUNC_MEM_UNSHARE hypercall to allow
> protected VMs to unshare memory that was previously shared with the host
> using the ARM_SMCCC_KVM_FUNC_MEM_SHARE hypercall.
> 
> Signed-off-by: Will Deacon <will@kernel.org>


Reviewed-by: Vincent Donnefort <vdonnefort@google.com>


> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 32 +++++++++++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                | 22 +++++++++++++
>  3 files changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 42fd60c5cfc9..e41a128b0854 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -36,6 +36,7 @@ extern unsigned long hyp_nr_cpus;
>  int __pkvm_prot_finalize(void);
>  int __pkvm_host_share_hyp(u64 pfn);
>  int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
> +int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn);
>  int __pkvm_host_unshare_hyp(u64 pfn);
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 365c769c82a4..c1600b88c316 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -920,6 +920,38 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
>  	return ret;
>  }
>  
> +int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
> +{
> +	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> +	u64 phys, ipa = hyp_pfn_to_phys(gfn);
> +	kvm_pte_t pte;
> +	int ret;
> +
> +	host_lock_component();
> +	guest_lock_component(vm);
> +
> +	ret = get_valid_guest_pte(vm, ipa, &pte, &phys);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = -EPERM;
> +	if (pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte)) != PKVM_PAGE_SHARED_OWNED)
> +		goto unlock;
> +	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED))
> +		goto unlock;
> +
> +	ret = 0;
> +	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_GUEST));
> +	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> +				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
> +				       &vcpu->vcpu.arch.pkvm_memcache, 0));
> +unlock:
> +	guest_unlock_component(vm);
> +	host_unlock_component();
> +
> +	return ret;
> +}
> +
>  int __pkvm_host_unshare_hyp(u64 pfn)
>  {
>  	u64 phys = hyp_pfn_to_phys(pfn);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index d8afa2b98542..2890328f4a78 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -988,6 +988,19 @@ static bool pkvm_memshare_call(u64 *ret, struct kvm_vcpu *vcpu, u64 *exit_code)
>  	return false;
>  }
>  
> +static void pkvm_memunshare_call(u64 *ret, struct kvm_vcpu *vcpu)
> +{
> +	struct pkvm_hyp_vcpu *hyp_vcpu;
> +	u64 ipa = smccc_get_arg1(vcpu);
> +
> +	if (!PAGE_ALIGNED(ipa))
> +		return;
> +
> +	hyp_vcpu = container_of(vcpu, struct pkvm_hyp_vcpu, vcpu);
> +	if (!__pkvm_guest_unshare_host(hyp_vcpu, hyp_phys_to_pfn(ipa)))
> +		ret[0] = SMCCC_RET_SUCCESS;
> +}
> +
>  /*
>   * Handler for protected VM HVC calls.
>   *
> @@ -1005,6 +1018,7 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
>  		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
>  		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
>  		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_SHARE);
> +		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_MEM_UNSHARE);
>  		break;
>  	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
>  		if (smccc_get_arg1(vcpu) ||
> @@ -1023,6 +1037,14 @@ bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
>  
>  		handled = pkvm_memshare_call(val, vcpu, exit_code);
>  		break;
> +	case ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID:
> +		if (smccc_get_arg2(vcpu) ||
> +		    smccc_get_arg3(vcpu)) {
> +			break;
> +		}
> +
> +		pkvm_memunshare_call(val, vcpu);
> +		break;
>  	default:
>  		/* Punt everything else back to the host, for now. */
>  		handled = false;
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

