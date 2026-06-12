Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2378CCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLOF6fP/rRJNscoDrzMxzXOITjjOmIqhXSUh0KfqXwE=; b=V2NXLb8Mo9ip9nxVbisf3KSaCM
	hED9E+/5l0wgi9JwE8tpI7dspoX+rW5VernteDsls2tCH65+jq4VG2eLQQzqpAHEGhjk/IQsYwKxy
	6s1MKhpvvuOBNPXADYinGconzr0mMyl0kTa8UD5+mlPYU40QxBm8rN/n54gPAQsVeMbC6TLabn+MP
	1vuVX/GA7qRXgfniO610SCl04B3nBB3OuOK7mwZl4YfJx94OpFsuvOlsm3yO4nZnBuQvOWboecW5Y
	aDGhAdnn0/UvchykeOXrsLnqYyWHxPvNPqOj6PvMyLl4tOB5US4a3gOxcVfpwO//HlZVs+t04Pyfe
	ueLyddJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4QP-0000000BD6a-0U8X;
	Fri, 12 Jun 2026 16:08:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4QN-0000000BD65-0kVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 16:08:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so79375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781280481; x=1781885281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eLOF6fP/rRJNscoDrzMxzXOITjjOmIqhXSUh0KfqXwE=;
        b=Sd+YNSF98gq+SwS+usU9i5QN2befTPu3tEXcmSPT7FBQTj3w/i5TXSGPdaTdfLCyJA
         EsTuOybbyUVYl1XzWIBUmUnUVvqJrgjpagaRxPRq+iY2ULqcOtdbkGmELonp0xnQjcDe
         Ebbk/Nxc5c7AWW5KQPHPJQYBmF8kS8IGyYI4ePlg3oyvJc7h2Ql/sYcwHSju6F+2IY+8
         vwvudNZ6wSyBwKmozFdkjJD0bAbe23QvdI7sKlEdNLVGqDTlAU3k/xfS0LtmIeo3xPSa
         g6IIFjiKQFSkIj1oMiEm9qdIAQ1j1yhf3OunRXVo4euoE/82tcQPUM85bbOrtEHtsqHl
         0pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781280481; x=1781885281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLOF6fP/rRJNscoDrzMxzXOITjjOmIqhXSUh0KfqXwE=;
        b=bKqd+IJmkb+28vPq8E5wGpGNgH9Db5NdBVlCujlDwASEx3SADR0wyeyyr6sRUiyob3
         a7c3FB2SJsKqHkfpT7lj6C6Pq0GG6q35Ln29rYF0PcDHvqpDOxPitVWeM+emTzf9fI8p
         PiDWQNLQBZQ2x7z39ntuEQ+xWy1JvF7sITth6hCcbIANcClkOpgGkA31E6N7/0ewxDuh
         cR8iWFRkq6UTEq+7cjAmMryGWwlbHosRP3dLg5VScm9DATLVazFf4+jj/r0pK6mrKdLK
         LXU/TC7r9UI1Ba0dVLgXN1Eg4vIHO6CSIZXNL9ztFbOJ4eekTQxoTgLDjIOWUMTS/wU3
         ISxg==
X-Forwarded-Encrypted: i=1; AFNElJ9vbWQzZJXX/fjJPl7spj7+UahL7/rOHJjjptZygeWyTj/8nMVm0W4+kFOUOul5M3FMcySn/UAGGcelAFfK8Ee7@lists.infradead.org
X-Gm-Message-State: AOJu0YwwWYpcf56RHgFHQlRyaAO+WCD6ERfj6gjvV+As33oaxnbFjX33
	/tdyqp5ay3He3JLbE+Dgrx7nqSkpTCA6OHFIbB4ikVXgmAgaQHXHUoMlKTheJvunzw==
X-Gm-Gg: Acq92OGonql3TY+o91ff+6j7hDTrGR6188vGfYDEmP+crzgP4ByRm0E3aJh5LbXjf8w
	2jm2hsU1IAqKGWKQpWB42Ey8mFBb4Q+WK8UxLrhfNKiZm4IHLIjSWcm/LMc8tfKXmX6D50/my1b
	XOciJ19CIBrH2BesHVnKKGdQhWtEMl4jqTqQy1Ae5OGCUZT74y6/VB2p/w61yAjL53vpNgIg+Mv
	CATRKNCbaRe8iicDgUGRWgPUKG8kcMz9M1l5hoyrtFlZ97y0ISbpGnN7n2ZGDQd2UpUX3pWS2Fy
	Tw/hoxA0oFpb024ABnEmQk63YWZHwr6+6eXjH9K+GHj8DMdGWtX2j16azbuqCIuj+5BYn8YO3dS
	J28wpco0H8pyCKv/AztnlPYawWKTXUhvtOsFW8nRHfC7vlXAIos2vmxnzRDk5izKk1EjKeulEcF
	OOh5b2ejasXymox5VaYZhYbfBRSxFNNBmgJ5R33HNMiMwAp3dABhcKUPWXyaVi4FioHgi3Lg==
X-Received: by 2002:a05:600d:6445:20b0:490:c2b6:de6b with SMTP id 5b1f17b1804b1-490ea5da36fmr1068545e9.12.1781280481013;
        Fri, 12 Jun 2026 09:08:01 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm7389953f8f.11.2026.06.12.09.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 09:08:00 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:07:56 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com,
	jens.wiklander@linaro.org, sumit.garg@kernel.org,
	vdonnefort@google.com, sudeep.holla@kernel.org
Subject: Re: [PATCH v6 6/6] KVM: arm64: Ensure FFA ranges are page aligned
Message-ID: <aiwu3EqWdviH5Rmo@google.com>
References: <20260527150236.1978655-1-smostafa@google.com>
 <20260527150236.1978655-7-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527150236.1978655-7-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_090803_255849_18FCFB17 
X-CRM114-Status: GOOD (  23.27  )
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

On Wed, May 27, 2026 at 03:02:36PM +0000, Mostafa Saleh wrote:

Hi Mostafa,

> At the moment we only check that the size of the range is page
> aligned, and truncate the address to the page boundary.
> This make an assumption that TZ will do the same.
> 
> However, it might decide to use the extra offset of the neighbour
> page at the end, which is valid under FFA if NS is using larger
> page size.
> 
> Harden this check by also checking that the base address is aligned
> and reject it otherwise.
> 
> Fixes: 436090001776 ("KVM: arm64: Handle FFA_MEM_SHARE calls from the host")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index a12e01883314..daf0e328c847 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -352,7 +352,7 @@ static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
>  		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
>  		u64 pfn = hyp_phys_to_pfn(range->address);
>  
> -		if (!PAGE_ALIGNED(sz))
> +		if (!PAGE_ALIGNED(sz | range->address))
>  			break;
>  

Should we do the pfn assignment after the check ?

>  		if (__pkvm_host_share_ffa(pfn, sz / PAGE_SIZE))
> @@ -372,7 +372,7 @@ static u32 __ffa_host_unshare_ranges(struct ffa_mem_region_addr_range *ranges,
>  		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
>  		u64 pfn = hyp_phys_to_pfn(range->address);
>  
> -		if (!PAGE_ALIGNED(sz))
> +		if (!PAGE_ALIGNED(sz | range->address))
>  			break;
>  

The same here

>  		if (__pkvm_host_unshare_ffa(pfn, sz / PAGE_SIZE))
> -- 
> 2.54.0.746.g67dd491aae-goog
> 

Thanks,
Sebastian

