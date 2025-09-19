Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97000CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAjbnEPAZMAdFwjUN3o9+aXIN1g6BbdbU7cFibLkhCE=; b=MRjc07/itSlQ0cc5bWHy/TTybJ
	+MYGDD0yE3Jejg+J3g0LTKMTK1uKlaT9Gq6gIwAzvmGfP16boKGEpQUbEBFCu5J5op5jaaI0gcT1U
	Edmv0YymLlSOZqj/C/SeHRvl/9NzkAkZuWfHmsV17mzmKVQd/8BXfrDY92ZZg9xs38UaafTUwz3uk
	tmxZohHp7j8RJ7dt1WiRS0JXN5tIAH+jnWXsX/u7b1j8ZteZYQJAGQeQh47VADs/4p6W/gm1Dtjmu
	yZQz2k/HgQzeJhFPTWR2zZjpFD/8JsRITf5zmjoo+0bO7W0/iqAfM02d4fMYijmRD046WwdvSyaSB
	Zg/1f9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXn4-00000002Rv0-004E;
	Fri, 19 Sep 2025 09:52:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXn1-00000002RtM-1Kqx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:52:28 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so2450014e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758275544; x=1758880344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAjbnEPAZMAdFwjUN3o9+aXIN1g6BbdbU7cFibLkhCE=;
        b=YcxQD3yjci38oMe5+9IDYjloVZlBvmGfZpiFnsYP30HexihkfDgeZ86Wbb2hoxg5jZ
         BiATdEQZVLXFZIP6Qttq64fHfTaEhkl5G1r2FyM16AWZ3hWKH0q75ixqiXsHsMOjd7tX
         yPpoXkiNrGR4PESgREdknmLOObm0Qsneq2uN6dCHpa+O9w+puVb85Cz+ejR9n4vunZdM
         oeYO5Y+e6dm+Gtf2Tirwj+rYBVZL91vOPx46m9MC4RUTk7PAjp6+aLvq1dB/OfdMQk40
         6VXV0S2201Mvg7jJfKVuBAlXoBJVQBhZ4odKkIhCRruLU9gZCV/PSPlknCC1u9uWci96
         2i0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275544; x=1758880344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAjbnEPAZMAdFwjUN3o9+aXIN1g6BbdbU7cFibLkhCE=;
        b=mZmfj5VzGoA0w1FF4UXwjRwdikCYGzCTw/UwAHV3WCtb3zUBOySEg8DlKR+Z3vsemc
         t014B05JhV3JB0Vubuy4i5lmokzduQX+obBnuFOEkt+dv80YjP9312WFPxyUWGORE5Ao
         eaBlLAMx4LBch3NmHN8etpeAnx1cFGgtcG5/IadqHtZASv33UDqmxynMr3Grrhcjna34
         8mm0ueZ7Ujc8Q05DtCjmRZHP4GmMrvCp3dvK8R4s8HvZVEq8omzR5br4TTVe3nT0ZoyC
         bantyPLsnjt4vszO/+4wErSXwrsOVsXxp5JKi2syHJpCoFSyqOpxmu4MEYyWkK1WkYL6
         92IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoyBQ+pAlFb9hHf2no9gjDZ/HdrDovxNT0173/bgoVpThavHUkLhZjaJRL5KcNuRU1o4FPOteOZykgce6FlG4V@lists.infradead.org
X-Gm-Message-State: AOJu0YyJGR71jkMbNVFCKDZMcF1tW3Knymqywb/ly+YdT3TJlx6iXbMn
	snMq+nfOw2qHkv81WrxNEvZ7HFX3UPp8MOacGKl6RrBMIm8xLNLJWKptpoRw0nFF8A==
X-Gm-Gg: ASbGncteBtPL4vrIPgkkkY2Fql/btpQvVW86vfUCY9hd3RfE14on25zbvK0l9RhiT22
	v0eo1DwOw46RU6c7JIdqvrtsyL0FWnJ9vdAANN3AmTagwI6ZbfT4lx4sJq7xZvn2E12IcdcgxUM
	o4To/rQrYNhQg08eub4KGMj0ZFGq+rkYLNe6MvIPdg88p0EobbhdIrI0zwwxPwwK5mMVpCpEngT
	LOTFjon52qQSvGN+MlqG0NilOduahujL5JvJO7XJNAfgoTCSsfhF4bJtDvRajgfavrDdliNHsMd
	QvXdDwO/dgSvlTGoosIXv1Y9v+yIo+i0IpaAfIM5g1DeFyUxX1LIG9tiSYb4zr2RvwMGO9Rj9f3
	CItyZ9ZMBJeFErldhzp4n8ZwaYWW6ROmMSNb0sQUM/BrmdTo6hTkFXZDh
X-Google-Smtp-Source: AGHT+IFKy+FwZofZjdcvEDLB/j3u6QlsxJjpuXcH/jzqyXhI1pRvoG7N8aLbvnRsyKe4C6YJXaCgJw==
X-Received: by 2002:ac2:4f08:0:b0:576:fbdc:e3d7 with SMTP id 2adb3069b0e04-579e28e0ff7mr996313e87.57.1758275544122;
        Fri, 19 Sep 2025 02:52:24 -0700 (PDT)
Received: from google.com (146.92.88.34.bc.googleusercontent.com. [34.88.92.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f447f3sm1288190e87.13.2025.09.19.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:52:23 -0700 (PDT)
Date: Fri, 19 Sep 2025 09:52:20 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	sebastianene@google.com, keirf@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Validate input range for pKVM mem transitions
Message-ID: <cf3v4dn233bf6y74ythiqulwfnshcdmddsdx3iqcenqjos5cct@zkcw7g5ieei7>
References: <20250918180050.2000445-1-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918180050.2000445-1-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_025227_381891_EDF5F572 
X-CRM114-Status: GOOD (  18.06  )
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

On Thursday 18 Sep 2025 at 19:00:49 (+0100), Vincent Donnefort wrote:
> There's currently no verification for host issued ranges in most of the
> pKVM memory transitions. The subsequent end boundary might therefore be
> subject to overflow and could evade the later checks.
> 
> Close this loophole with an additional range_is_valid() check on a per
> public function basis.
> 
> host_unshare_guest transition is already protected via
> __check_host_shared_guest(), while assert_host_shared_guest() callers
> are already ignoring host checks.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 8957734d6183..b156fb0bad0f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -443,6 +443,11 @@ static bool range_is_memory(u64 start, u64 end)
>  	return is_in_mem_range(end - 1, &r);
>  }
>  
> +static bool range_is_valid(u64 start, u64 end)
> +{
> +	return start < end;
> +}
> +
>  static inline int __host_stage2_idmap(u64 start, u64 end,
>  				      enum kvm_pgtable_prot prot)
>  {
> @@ -776,6 +781,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  	void *virt = __hyp_va(phys);
>  	int ret;
>  
> +	if (!range_is_valid(phys, phys + size))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	hyp_lock_component();
>  
> @@ -804,6 +812,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
>  	u64 virt = (u64)__hyp_va(phys);
>  	int ret;
>  
> +	if (!range_is_valid(phys, phys + size))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	hyp_lock_component();
>  
> @@ -887,6 +898,9 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
>  	u64 size = PAGE_SIZE * nr_pages;

It occurred to me that this can also overflow, so perhaps fold that
calculation into your helper as well to be on the safe?

Thanks,
Quentin

>  	int ret;
>  
> +	if (!range_is_valid(phys, phys + size))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
>  	if (!ret)
> @@ -902,6 +916,9 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
>  	u64 size = PAGE_SIZE * nr_pages;
>  	int ret;
>  
> +	if (!range_is_valid(phys, phys + size))
> +		return -EINVAL;
> +
>  	host_lock_component();
>  	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
>  	if (!ret)
> @@ -949,6 +966,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
>  	if (ret)
>  		return ret;
>  
> +	if (!range_is_valid(phys, phys + size))
> +		return -EINVAL;
> +
>  	ret = check_range_allowed_memory(phys, phys + size);
>  	if (ret)
>  		return ret;
> 
> base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
> -- 
> 2.51.0.470.ga7dc726c21-goog
> 

