Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A21C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83BB7SmwDzPYUhpIg9noheded8S+cXeSPX7ePATlnPI=; b=fMiS39INoqdqXvVZ70FicO09am
	fjEvP4eEHd/rh/t560wz/gMuK2rjBm8taLjQ6OACumRzu7cLbLcE/N4eO+pMTNZRTZI5eEfriVvLq
	00jCkSL/mbQbloI+vj6JU5gFSF9koXqThhURUg+MzXeWcSzCuzLPAWj0cRHM/7FF7FX6h00K2amb5
	VG3BXlys76W21fzQdfBRxAAUlYGr3MVRgk1bOdIiWwBXf9ipTGFvlwbIOhvtCnjIyeAg7waRT4Nhu
	o0ccE+YcBR8BToLZycHB1LTaDQS6XaR/4CiyuPJ8Rnq0iZ3LxYVEXCg/FCQTwXJ36Um9F+TrytZyQ
	AqIG8MjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHiW-0000000By0g-19CB;
	Tue, 06 May 2025 12:48:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFfH-0000000BadU-05gz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:36:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso3666247f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746527800; x=1747132600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=83BB7SmwDzPYUhpIg9noheded8S+cXeSPX7ePATlnPI=;
        b=DXaSFwpdT2CVZYXOlZat7kJr5wuD0/pzixIwU/hc566fIJpNrVjjG3XN2/a4tBOXIi
         4yQsA1NoeJL7CrQgKD+vRi5dkxI/vObXeOzMo/xENN8ubXc1V7l84Hz1N1syEQ7yOnYX
         81nYIPRBFJF2r1k1YzGy0X6cr9FlwT89y1jFEl8fXwqFXNg1H4oGe7mix4teDi3bgoSO
         qg2j05ebGndKxIRxE0ycZBvhqLWAzKpY+iksocCiVhudhjhlJFwfkbMaMdtC4XaJPfCG
         uRlOBR6PN/dU9ZxCjfRIpRsVajDCxXrlmSPjJGY/t68npKWOcWKMmZRpV1+1PxIuLjFv
         rP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527800; x=1747132600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83BB7SmwDzPYUhpIg9noheded8S+cXeSPX7ePATlnPI=;
        b=ZdRvo/UFDvEJMGoMNOoJn+w+7maYQpa35FgwMdM+9F00lT5FVtV47M/VWuDratIpOH
         rYR7e/V828Qzc9KEgoEi+qi2tir+MKZGMIfMFb+zDlTYbtSrpurkZYJuKSVC7KltJ5ja
         27EwhMIxJOCluGjO6+gZ/M+iLnmMPfAzgxKdNSIbu+nyMLJo5VAxdhBvQiGj/k7FQR3y
         FUbChDqZcQYdg1LF/2M+Hq0muyNxl51NIk13x7lH+ZwvKJAraWS+C7Vgsph362JPC9vk
         4IQK8CxIYsdegvMiF63sZbya3jeJ4E+uI4tIHF1ntOl1+y1GRjlFO1Uu3CvCMeSyNqvR
         mzRg==
X-Forwarded-Encrypted: i=1; AJvYcCXsEGWwbNZVY8W+HA+IkGUlHLVU53lWZGWZOQFxqZhThmi6lo2xZRx/VUlRGTfl4jV4pmGrlu19uosMPFKGmmXU@lists.infradead.org
X-Gm-Message-State: AOJu0YyVvrsg663oWfDpJGvflL30ACeovOifGaHVCL/qtL2vfeTFfluK
	jYSJ1BaxepxFvElp9D1RWK9LfV08UY9LGZWSiqvYFc94c2CU4xD8fpsJWmaGag==
X-Gm-Gg: ASbGncsG4f4nD4Bs88pziKQBUgL90mVosvJiVYUQVgoxbgTWnXhLDLEBq6lzy+UIE+y
	sNVncYuMiUzJsrAo0OMbqk1924XaNxw69/fdP5oaRgQcl/1FBGsEh3eaKCT8I0K2seQVPoJ/VsF
	glgYvF+FmVzxIh3Q9U199HKzAgVU/+47uClVi0dxtaC0UK0RNME0KlLRBm97pUOKDeqRMO6zy9T
	gNDmfAe87c7zFVqcxVp+MWcBw5jnDdbWTLxdvN3GflNkaob+AFX8k9qJizaS873FDCHOJ3wwi1Z
	Q0n7kf7OPUEW1lNzQnNjznZ+eq5UEtx4jwg52omoV2OGc/AsEwVq+nesmJXTfjr951MOxxBJnK8
	V8/DsiQ==
X-Google-Smtp-Source: AGHT+IG2CayH2yxmNUdwN95+efpUFPMFHxnxBFQj2axpQ8sGyin+5/PNn5XBefvcRCOTd+k50QaHVw==
X-Received: by 2002:a5d:5f8a:0:b0:3a0:7a7c:2648 with SMTP id ffacd0b85a97d-3a0ac0eaa24mr2087956f8f.27.1746527800468;
        Tue, 06 May 2025 03:36:40 -0700 (PDT)
Received: from google.com (24.204.140.34.bc.googleusercontent.com. [34.140.204.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b0dffaa1sm1179414f8f.31.2025.05.06.03.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:36:40 -0700 (PDT)
Date: Tue, 6 May 2025 11:36:35 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ott <sebott@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix uninitialized memcache pointer in
 user_mem_abort()
Message-ID: <aBnmM7DSonZr_VHC@google.com>
References: <20250505173148.33900-1-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505173148.33900-1-sebott@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_033643_063178_A0988ADF 
X-CRM114-Status: GOOD (  23.24  )
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

On Mon, May 05, 2025 at 07:31:48PM +0200, Sebastian Ott wrote:
> Commit fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM") made the
> initialization of the local memcache variable in user_mem_abort()
> conditional, leaving a codepath where it is used uninitialized via
> kvm_pgtable_stage2_map().
> 
> This can fail on any path that requires a stage-2 allocation
> without transition via a permission fault or dirty logging.
> 
> Fix this by making sure that memcache is always valid.
> 
> Fixes: fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM")
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/kvmarm/3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com/
> ---
>  arch/arm64/kvm/mmu.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 754f2fe0cc67..eeda92330ade 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1501,6 +1501,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		return -EFAULT;
>  	}
>  
> +	if (!is_protected_kvm_enabled())
> +		memcache = &vcpu->arch.mmu_page_cache;
> +	else
> +		memcache = &vcpu->arch.pkvm_memcache;
> +
>  	/*
>  	 * Permission faults just need to update the existing leaf entry,
>  	 * and so normally don't require allocations from the memcache. The
> @@ -1510,13 +1515,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (!fault_is_perm || (logging_active && write_fault)) {
>  		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
>  
> -		if (!is_protected_kvm_enabled()) {
> -			memcache = &vcpu->arch.mmu_page_cache;
> +		if (!is_protected_kvm_enabled())
>  			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
> -		} else {
> -			memcache = &vcpu->arch.pkvm_memcache;
> +		else
>  			ret = topup_hyp_memcache(memcache, min_pages);
> -		}
> +
>  		if (ret)
>  			return ret;
>  	}
> 
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> -- 
> 2.49.0
> 
> 

For the pKVM part 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

Thanks

