Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E960CE9D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PG2N5It+TmGVOOXoBLd3eGZR3+xZRApjmmcqpt/ZQJU=; b=4FbOvysl7FVIr22eUQigAgTc5c
	qsAels47kxZJlUNlhh0EdQ1Ha0/iIVfxmkdjCJFzCAIBnrZi+r6rlyz+EP8FgXWrOaa5AyrttEb6L
	HhRR6FliLyYyQ+jHI4L9wbf1G2nbObktSEG4muihaRLDoAT2qvOKtQRxzqVt7espPpuykqC5vSZwm
	vaFA+f+shmXYM+zmfABrn5FDLr/Hb9KQiRo0ZU0mAGs3kjWxNkufe4KeJ3J/Qs+9GoHhmqhPa3lWB
	c6M6Ip9zY7KOXLf2/rrks94r8L9gwQbp+oPQTDiLDySBDXNm6YQNo75bnlQpqljPpDksJ9EDnGs5A
	Y3s5X3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Wt-0000000DLtv-2M6c;
	Tue, 06 Jan 2026 14:59:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Wr-0000000DLtO-17sx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:59:26 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59b6a987346so405632e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767711563; x=1768316363; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PG2N5It+TmGVOOXoBLd3eGZR3+xZRApjmmcqpt/ZQJU=;
        b=brQSzNL8KRiI2aHtwiOKxUIO8v3bPzfXwfhyuuGQUUSl9T72y5JQmnDtk/uw1OTjhB
         XZXhw7uasmYRn3L8RLT3RFhd+SiLrEP66BwEHTh9Qs6DZ2tLl80bozSQ3Ye70V3LeQm5
         uBwwH0R3SZkgpH1lcV3JPG4/+4L2R9wnKl3IWePSSwFqYz2oeD2K/OgK9JVb8epJGVUK
         6djysyab8NNeTWcqSuvpdvDzpMES8w320GA4gDEZ+ERYZf/25otXk4RXkVP3LxbX17RH
         VQgU+k8uqkYf7BR0VhN4b+3LWfG0d4tKAVF+UmDLaSuyKRZpOThA2AbBVgxJHKXV2GsV
         gNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711563; x=1768316363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PG2N5It+TmGVOOXoBLd3eGZR3+xZRApjmmcqpt/ZQJU=;
        b=URSZYruflyW+MOeGQ2+yPa1QEylaBFH+pyQY8ZU1lgEauyhcFUYW0Nj/BQZ8u5z35X
         6g8+r2AtriupowX/CRDCcW9Cxyb2Jmrt3C6RMSTWctpPOME2NoQwIkkPJ7p6r3+smOyo
         d1zh8rDrtX3oxhX8mfGTU82gdTdgBdUq30oAjR5WpL0x0T57zVMOEdI6wVEgQkYJxUpp
         VFUOmvIsNKrTLuFL5I7oeUIxJ/Zq9uIPIS1y+rL4M2atxrdsjpVtP7ifngbikSGUOXYF
         J+wmBYgPyqJ+tMV0IL4uwOVQ3XY6AUjZNJ0rWlAzvbKkouXhn6c1m/HmLSbrDo/W6cBI
         iX5w==
X-Forwarded-Encrypted: i=1; AJvYcCXsiVUe8rNwsSpLNOTSbIrDlsfCpJ55aZOAfNmzTSs+tQP09GijYRbGftN2izpa5ErvTfNOyFNDEE9CODIsXWUy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr1MfRIBcpQPOCLybQ0iur+VlrWwO1gj2CaD+IdpymmXiEifGv
	YGWdZQvZhFXQchwwQSo2qsQ1ZgGtAuPR+x74jpxkaoO0keQe3zOGqEC0klYuZEpqTrZr8j8141M
	IZyRf6A==
X-Gm-Gg: AY/fxX5UCFY13VwmMYmYcW3OHA9qgIXuncvh6onrHOnFJienjH7GUjQKIrLr/3APbJs
	jZdTz/u6XGA2J7xznYhGstxrhlVj9GXAJAfhPoHAQV7KoQRTDlFrxeYD/UlZnZy7kW7tzdhZY9X
	d212O2hk9Q8xkj/2d6UZvoCkbgUQKhu35YXJ7pyoD9geA5ybBYlsBkrUI5TH8uLrElA+Qb4JUTg
	e/mMjz2t2Cux/KT3innWmZQVGx8Gx017SFnltecti+Alw7X/obGjXEQMnhRSRQKI4Gb5DLVZKoL
	wjeiYcFdzCDJ+CGiAJ/aE/WmjtGflgpGJ7DmOk/7Krqv4PfbUVA6zOZuVwldBfZL/GWHBJsyOy3
	heMryWXgONrNWKDNJz7Fw0ZX5ajkLGzkHKd7k73N/IBmjmZTljAMjJV61+AH3BVuthilDGme5dr
	juglONda6Hpy3SljV4mw1VCfWeuBvRRzXtQFCXjDDxXoVWl1Fo
X-Google-Smtp-Source: AGHT+IFAKUDmgnFB7fgseWxDswTHxVbr9Bi36lxtzMdQtE6ZLibvtwZpajKpR/HB7iE//12LWrQYYQ==
X-Received: by 2002:a05:6512:3d11:b0:59a:181b:d6ab with SMTP id 2adb3069b0e04-59b6525fad7mr1059016e87.41.1767711562819;
        Tue, 06 Jan 2026 06:59:22 -0800 (PST)
Received: from google.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d7615dsm632723e87.92.2026.01.06.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:59:22 -0800 (PST)
Date: Tue, 6 Jan 2026 14:59:19 +0000
From: Quentin Perret <qperret@google.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 14/30] KVM: arm64: Hook up reclaim hypercall to
 pkvm_pgtable_stage2_destroy()
Message-ID: <bc246bvbf3cg7scut2dcey7tynxqzclyceqv4hhooqacsdzti7@hcaqfbnvebt2>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-15-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-15-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_065925_328564_F746750F 
X-CRM114-Status: GOOD (  22.12  )
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

On Monday 05 Jan 2026 at 15:49:22 (+0000), Will Deacon wrote:
> During teardown of a protected guest, its memory pages must be reclaimed
> from the hypervisor by issuing the '__pkvm_reclaim_dying_guest_page'
> hypercall.
> 
> Add a new helper, __pkvm_pgtable_stage2_reclaim(), which is called
> during the VM teardown operation to reclaim pages from the hypervisor
> and drop the GUP pin on the host.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/pkvm.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 1814e17d600e..8be91051699e 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -322,6 +322,32 @@ int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
>  	return 0;
>  }
>  
> +static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64 end)
> +{
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> +	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> +	struct pkvm_mapping *mapping;
> +	int ret;
> +
> +	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
> +		struct page *page;
> +
> +		ret = kvm_call_hyp_nvhe(__pkvm_reclaim_dying_guest_page,
> +					handle, mapping->gfn);
> +		if (WARN_ON(ret))
> +			return ret;
> +
> +		page = pfn_to_page(mapping->pfn);
> +		WARN_ON_ONCE(mapping->nr_pages != 1);
> +		unpin_user_pages_dirty_lock(&page, 1, true);
> +		account_locked_vm(current->mm, 1, false);
> +		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
> +		kfree(mapping);

Nit: this might take a while, worth adding a cond_resched() in here?

> +	}
> +
> +	return 0;
> +}
> +
>  static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64 end)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> @@ -355,7 +381,10 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  		kvm->arch.pkvm.is_dying = true;
>  	}
>  
> -	__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> +	if (kvm_vm_is_protected(kvm))
> +		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
> +	else
> +		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  }
>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

