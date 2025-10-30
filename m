Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C590CCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 06:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLithzThx8pxlXaz1qEgue0vbFKuTuLtSl9y/H9uBGw=; b=L/mygZgO7lhknmn/HxSj6+PF8r
	WXjnnm0RLUJ37VOZhUL3LgZlGcvckmBxYULZr2YcZuzrfhqIQl2YrsOrPNIQ0JsozUUp2JnuTbtqm
	RDQ4AbMSHi3X6ALTJO614+5B6z1ghlDdW49twelqEuu/+RA7Rejk1kvzvO8/libhHPvLPBwo4Qxr2
	WcGPnNRsW19ran+v96ap7+9sT3iN9KphNRkoRhp9vH2TwfjO5TLo8fi58E3uV2eGP0d9mC8r4Gvm+
	JG7DgGg7ppV4HHI+7aVN24nCIFfiuzK1CwRCQETloWvTkuRwigwVSaCscYnDzoU18kPSozZe0ws8S
	ACjtOmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELqu-00000003Y0g-0l6I;
	Thu, 30 Oct 2025 06:09:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELqr-00000003Y0G-2fgd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 06:09:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-470ff2f6e56so40165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 23:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761804576; x=1762409376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DLithzThx8pxlXaz1qEgue0vbFKuTuLtSl9y/H9uBGw=;
        b=dsRCg2xOHFxG2kzjprcasvx87WcykURkYX/K3MwmLHJ1uxJ5RqUQgJqdUt1EpTuuG0
         zU416WrsbdkzBinbFnMa+4FUnYxZpcXP/IPa3VKronCLptm/bmaHbUEX1nqlQE+lFTWP
         7DnvQhlZKCXDYiU54fmgZxfS9JQ/ovt2wbHtRz0+HVd7aB4M4+SRWq0E3DU2OIIyEp48
         xQ4f9fstTwAg+yc1kPmMtvXxLMZEOtunQo5+fox1f5Y5KIvW1UwOCPjGrlM6OScxv4AX
         HRud2XMnxVz8NE+6RMuh5bbO9akVxgSwDdj0llkWxxGoEMSHd+Mc1SxHb4srbtgQxhWh
         pBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761804576; x=1762409376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLithzThx8pxlXaz1qEgue0vbFKuTuLtSl9y/H9uBGw=;
        b=kzre84E6zl2xpkbOAtMj0cNzDBPE9ZB6rX/BgchPKPrMQt2RICL4CQuI/AP1GBvr7H
         DyFAo7jBvKJPF+QxRAuNWqTt5jsZYlNjBYitAMjMl//DlTbJs58pHG8wagNWpwNxAqtd
         y9auwI4eIH5JGygd5gHyoSua954kJRllgNa0YI41W7XfdZQGT96La8zHGFThuDy+xvTn
         ppA+Ns80wXbq1YQ2Rac8cbuh/ggjDdmYWjs2m9BmPuM7BwDnth8TzcZOuJ6TEWDTvDvO
         kObsy34qhIPyKH3BmH7cpY/HNXtDEXTgNLi26SoxB7yUh0/4mQjvaMzerQqW4N6UvQHa
         yEWA==
X-Forwarded-Encrypted: i=1; AJvYcCXF9Bldx8GAnHt8CQx/L3ZkuRRRH9SNMyC2/elpzZfJxs4w0VbqguBwSTcTEjxEMIc7T4ww2EL+lmLTMo4POD7E@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4xKYIB4B3cAS5BzRyCOPAbIH5Av4YQwK+zFtWshY+4MfZcVCL
	Hzp8j9eIlYeBosE5+MsBm2Qyr7VVh3e70SaEjdYWl3IuVivVeMs9ZZCTzzMND+iUwA==
X-Gm-Gg: ASbGncs8OWERSDcincyq1fmC/sbLQOpWXpmzX/DcMzwCCgXp+MOng8L4iq8ENkSiTTM
	3ZKRN2i3Rrkag5P9f/kmMIW7VmmnhKTFbi7+FX85S+aO1lLxeL8DfUs3Yz45NdmpGh/orQ3YH/4
	9i7kPUG13mksO3G7m4Yme2/UCwhdSptPX0uBXZs/i0oLOR++Kx5GP0LFy6z7XTIc6H0usUntOcn
	oqiVRznaPsST+j/NNoRU+Z+9t96Ijpe3Gq3HP24MDOsjv+X6a6kRLjIDSakWoAHEfaFf+U5sgU1
	MJU6/WPVUJf1xC1tKSWl6aJ0fL1UKwh5FnJOwqtF60w5xFplVdhyPt9un3CTVzFwSMOG1KjzOOT
	iRdvCVoSwpPNYBSm6AHsTMcmypdtQJpfZ2Pwy+z5I0XqT+JwFFWJpkYNYdbP0dV9o/CdN1Kpy2f
	zxDq2K8hwt+OCX3ZWwgKbGS441xjpw6UrQa34Z/8F4vKETbOhYQg0jrv+OYQ==
X-Google-Smtp-Source: AGHT+IGeJspzX9tfUeAx5eQ3UCzknbWkBSs575JdAgz7ivV6hKq3b/O79zgLFOS7QUNGGU3V+/JhTA==
X-Received: by 2002:a05:600c:d2:b0:477:255c:bea8 with SMTP id 5b1f17b1804b1-47728a06de2mr733935e9.7.1761804575641;
        Wed, 29 Oct 2025 23:09:35 -0700 (PDT)
Received: from google.com (177.112.205.35.bc.googleusercontent.com. [35.205.112.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289b0bb3sm20742205e9.8.2025.10.29.23.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 23:09:35 -0700 (PDT)
Date: Thu, 30 Oct 2025 06:09:31 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, qperret@google.com,
	keirf@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v3] KVM: arm64: Check range args for pKVM mem transitions
Message-ID: <aQMBG0SUlNWuQQFZ@google.com>
References: <20251016164541.3771235-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016164541.3771235-1-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_230937_709297_17BD9C63 
X-CRM114-Status: GOOD (  25.91  )
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

On Thu, Oct 16, 2025 at 05:45:41PM +0100, Vincent Donnefort wrote:
> There's currently no verification for host issued ranges in most of the
> pKVM memory transitions. The end boundary might therefore be subject to
> overflow and later checks could be evaded.
> 
> Close this loophole with an additional pfn_range_is_valid() check on a
> per public function basis. Once this check has passed, it is safe to
> convert pfn and nr_pages into a phys_addr_t and a size.
> 
> host_unshare_guest transition is already protected via
> __check_host_shared_guest(), while assert_host_shared_guest() callers
> are already ignoring host checks.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> ---
> 
> v2 -> v3: 
>    * Test range against PA-range and make the func phys specific.
> 
> v1 -> v2:
>    * Also check for (nr_pages * PAGE_SIZE) overflow. (Quentin)
>    * Rename to check_range_args().
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index ddc8beb55eee..49db32f3ddf7 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -367,6 +367,19 @@ static int host_stage2_unmap_dev_all(void)
>  	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
>  }

Hello Vincent,

>  
> +/*
> + * Ensure the PFN range is contained within PA-range.
> + *
> + * This check is also robust to overflows and is therefore a requirement before
> + * using a pfn/nr_pages pair from an untrusted source.
> + */
> +static bool pfn_range_is_valid(u64 pfn, u64 nr_pages)
> +{
> +	u64 limit = BIT(kvm_phys_shift(&host_mmu.arch.mmu) - PAGE_SHIFT);
> +
> +	return pfn < limit && ((limit - pfn) >= nr_pages);
> +}
> +

This newly introduced function is probably fine to be called without the host lock held as long
as no one modifies the vtcr field from the host.mmu structure. While
searching I couldn't find a place where this is directly modified so
this is probably fine. 

>  struct kvm_mem_range {
>  	u64 start;
>  	u64 end;
> @@ -776,6 +789,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  	void *virt = __hyp_va(phys);
>  	int ret;
>  
> +	if (!pfn_range_is_valid(pfn, nr_pages))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	hyp_lock_component();
>  
> @@ -804,6 +820,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
>  	u64 virt = (u64)__hyp_va(phys);
>  	int ret;
>  
> +	if (!pfn_range_is_valid(pfn, nr_pages))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	hyp_lock_component();
>  
> @@ -887,6 +906,9 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
>  	u64 size = PAGE_SIZE * nr_pages;
>  	int ret;
>  
> +	if (!pfn_range_is_valid(pfn, nr_pages))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
>  	if (!ret)
> @@ -902,6 +924,9 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
>  	u64 size = PAGE_SIZE * nr_pages;
>  	int ret;
>  
> +	if (!pfn_range_is_valid(pfn, nr_pages))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
>  	if (!ret)
> @@ -945,6 +970,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
>  	if (prot & ~KVM_PGTABLE_PROT_RWX)
>  		return -EINVAL;
>  
> +	if (!pfn_range_is_valid(pfn, nr_pages))
> +		return -EINVAL;
> +

I think we don't need it here because __pkvm_host_share_guest has the
__guest_check_transition_size verification in place which limits
nr_pages.  

>  	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
>  	if (ret)
>  		return ret;
> 
> base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
> -- 
> 2.51.0.869.ge66316f041-goog
>

Other than that this looks good, thanks
Sebastian

