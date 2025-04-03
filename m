Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7EBC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTskUv4HRecH8zkwhc0nWGv0insFCOczgkdAhLL+Odk=; b=H3nRQlf5nwjnFdpDCKz1qEQVZy
	/S6taWJMocZBdzwWKwar/h1MKzyI/2sk0bKk51iG8DVzGF675gmxDkfEjhWgnbm7yLW/CFnzCfopT
	5k2NXCbEEUW5IYPMBIN+J11cPNpcmnyy0PaqEXhxmogKGKtjQ17/bR3pouiBJB+/hYPatCDi/fd3U
	0GnIVWLbjpFnAqnupElXEsN3W1OMo1KOO1Rjg7SnPPnxKl2pZbsDy7GcUjphbHXGr6YuA8zMukOac
	qpprb9KiknGX5dWC9O9LcdsGkksm/qp0FXiVy7S/4MkNNa3y97kH3nGrCIs8yxjfwAs4BTvsxNnFx
	ALDRfuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MYV-00000009Evd-18MD;
	Thu, 03 Apr 2025 15:32:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MTR-00000009EHY-2MV7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:27:22 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so1462019a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743694040; x=1744298840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTskUv4HRecH8zkwhc0nWGv0insFCOczgkdAhLL+Odk=;
        b=hX1RtZzFmDUMQ/ZKuegaYHGWbXHZE20mKoLysCDaeYn9atiWpReqGwOnPexkXXromG
         s2eAXyusFY4wFuBPSx2BHafE05FedYpBywuUAISTwGCDu/kgPtw7/eq2jEp8NxUk+Jwz
         Oge+iJ1xQqan66AkKBXlbNp2s0RWgTvDMtEYnol+ZfqxGRzRM796Rhh9Ji+S8QU7jGXq
         SgHSXzAG4FyNAku2hizqG/w/wVwiqT+XVrc4ODj0F8n8SlkZ/5BPdvL4aJqovdlP4ieX
         0OQ5O1S+PP+tpQcuqXj5k7oUKebI+wqy5NBGAaUwEhvoXmwyZUMAPgdn0akEUBDZs/QR
         XHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694040; x=1744298840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTskUv4HRecH8zkwhc0nWGv0insFCOczgkdAhLL+Odk=;
        b=kb/179uF6LTxt/caZMdLBnyPootitNE3/ruaMVrHQgVxDUReP70iEl451XZDraq3y/
         AdTogDG0uH2fr++XCZRsjE6aFGFXh8nUEAmn3kwIFCxDzFMf3Q23NviK9LPvz8RuwwpY
         A4y9AV6WDxK5dlwnt+n5/9D13n5SVPA2S01fqgGU49fEU/WnqQ/eHPVzMQED132Zom/j
         piLnCSdRPCuApq6+oJoqLYMiC9Q9DeRi3DfR0+vgX6Y3W0q/k+Zrm3q/lqVr+AJc7/xZ
         UxaPvQUGruq3pKakq7qk0Ss0lDF/voiQrCXc7ZhBauKTDFV2lYnvv7qEjY7OS5Z6m6gk
         +/OA==
X-Forwarded-Encrypted: i=1; AJvYcCVfm6Zc9EvJicdDLim2PmJ0jRP7EF53jiwnkjIWKsNiuC6/xLVIHrsgJ7AZXR1NHTJEXghfLSABxRVuZzK6RIti@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr60XSwxmJPIM5d2UZt587GHX8X7B23uE04Ir9IdzMq8IBJzXN
	NTwENb4mmMRkPBSVtJJGcMXZQ6/hTbKe0pH0rMuKBz84ilLQjCQc67SspUPOOg==
X-Gm-Gg: ASbGncvcZ6K8yPLLFLWWr8WaZiFa6ZxOPkQ+x7/WxgFZSz195beINme3VMRlwuNKBv5
	gRhqxTnlNt8KPL2w4SaUk/6v09lutmG/UUi7+N2PnwBrUMU+nwah40Bwbm84NBhqI2v5S0Qrk5u
	u3jqJKbx996WUs2wLrwMT2zmjC1ZCKvSBdNom8DAFQgzYxQ4ioG/uF7MDTn3y9lGvOaMJffkaNl
	KSRlNjT9l0z4kiAt9sV9cVaRku4jFp18HzYuT1f4SgXv97T3/l+5Wm88SAOUyv5FTDcbKxNI5k3
	Xrz+Gc79xBGInkgTYclUKdGUrr2+jvIBStpWWLeWKmpy4Dl+PkrtngnE4erOaWvCaQso0w60saM
	s0s0JiQ==
X-Google-Smtp-Source: AGHT+IFfmyWrTKMc40a2U0IAHYIOZlLiCjW5rNWsqaDLQ9B5AQ5QDUuo3j6YMdMQxsUaTDXfNwPjYg==
X-Received: by 2002:a17:907:94c2:b0:ac2:a50a:51ad with SMTP id a640c23a62f3a-ac7d1893010mr177366b.14.1743694039740;
        Thu, 03 Apr 2025 08:27:19 -0700 (PDT)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013ec0esm108015266b.98.2025.04.03.08.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 08:27:18 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:27:15 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 2/9] KVM: arm64: Add a range to
 __pkvm_host_share_guest()
Message-ID: <Z-6o0zcLa4Aw0N6R@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-3-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110038.3733649-3-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_082721_644499_611FDE0D 
X-CRM114-Status: GOOD (  20.42  )
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

On Thursday 06 Mar 2025 at 11:00:31 (+0000), Vincent Donnefort wrote:
> +int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
>  			    enum kvm_pgtable_prot prot)
>  {
>  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>  	u64 phys = hyp_pfn_to_phys(pfn);
>  	u64 ipa = hyp_pfn_to_phys(gfn);
> +	enum pkvm_page_state state;
>  	struct hyp_page *page;
> +	u64 size;
>  	int ret;
>  
>  	if (prot & ~KVM_PGTABLE_PROT_RWX)
>  		return -EINVAL;
>  
> -	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
> +	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
> +	if (ret)
> +		return ret;
> +
> +	ret = check_range_allowed_memory(phys, phys + size);
>  	if (ret)
>  		return ret;
>  
>  	host_lock_component();
>  	guest_lock_component(vm);
>  
> -	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
> +	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
>  	if (ret)
>  		goto unlock;
>  
> -	page = hyp_phys_to_page(phys);
> -	switch (page->host_state) {
> +	state = hyp_phys_to_page(phys)->host_state;
> +	for_each_hyp_page(phys, size, page) {
> +		if (page->host_state != state) {
> +			ret = -EPERM;
> +			goto unlock;
> +		}
> +	}
> +
> +	switch (state) {
>  	case PKVM_PAGE_OWNED:
> -		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
> +		WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
>  		break;
>  	case PKVM_PAGE_SHARED_OWNED:
> -		if (page->host_share_guest_count)
> -			break;
> -		/* Only host to np-guest multi-sharing is tolerated */
> -		WARN_ON(1);
> -		fallthrough;
> +		for_each_hyp_page(phys, size, page) {
> +			/* Only host to np-guest multi-sharing is tolerated */
> +			if (WARN_ON(!page->host_share_guest_count)) {
> +				ret = -EPERM;
> +				goto unlock;
> +			}
> +		}
> +		break;
>  	default:
>  		ret = -EPERM;
>  		goto unlock;
>  	}
>  
> -	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> +	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
>  				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
>  				       &vcpu->vcpu.arch.pkvm_memcache, 0));
> -	page->host_share_guest_count++;
> +	__host_update_share_guest_count(phys, size, true);

So we're walking the entire phys range 3 times;

	1. to check the host_state is consistent with that of the first
	page;

	2. to set the state to SHARED_OWNED or to check the
	host_share_guest_count;

	3. and then again here to update the host share guest count

I feel like we could probably remove at least one loop with a pattern
like so:

	for_each_hyp_page(phys, size, page) {
		switch (page->state) {
		case PKVM_PAGE_OWNED:
			continue;
		case PKVM_PAGE_SHARED_BORROWED:
			if (page->host_shared_guest_count)
				continue;
			fallthrough;
		default;
			ret = -EPERM;
			goto unlock;
		}
	}

	for_each_hyp_page(phys, size, page) {
		page->host_state = PKVM_PAGE_SHARED_OWNED;
		page->host_share_guest_count++;
	}

That would also tolerate a mix of OWNED and SHARED_OWNED page in the
range, which I'm not sure is needed but it doesn't cost us anything to
support so ... :-)

Wdyt?

>  unlock:
>  	guest_unlock_component(vm);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 930b677eb9b0..00fd9a524bf7 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -361,7 +361,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>  		return -EINVAL;
>  
>  	lockdep_assert_held_write(&kvm->mmu_lock);
> -	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, prot);
> +	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
>  	if (ret) {
>  		/* Is the gfn already mapped due to a racing vCPU? */
>  		if (ret == -EPERM)
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

