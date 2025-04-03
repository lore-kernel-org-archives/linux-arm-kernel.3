Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E7C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdKyMlf3QjSGqDaSEQwhmI34sCc+7J8IQI9BHCCFOAE=; b=uBkmK6JkCNHpdrET6d3R/61zND
	wQNpDzswH3Op+NDuUEn6C8JVGFhp3jsfxffnEpeN9d4G+j2JnllHlsfx1eW4M/VxRf9oI2N/Bsln4
	Fj8b63oWm0lD0PNT2wgk+nmRqpH6X73tmvFVQCcesCfNe9jtkY2AJV548SN5tjvGvDLOPlnW0obem
	EZBnArvLgNILSZl7ecohl6C7+yS+Huk8/2BlHJN0qS0WWQQIA6hZb/pplMqii8yoGKGf6zGjltQgz
	OGxlQd+ltxbP7YQNFl88LQLZhvYpOYwI6vxpUnvLA8kRU99IqDQB3LvIMnLLF8iD4V9fBiwwSbzzc
	i5JgRAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LXr-000000094Ng-3MZe;
	Thu, 03 Apr 2025 14:27:51 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LRT-000000093Bd-0aoL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:21:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso1891343a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743690072; x=1744294872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdKyMlf3QjSGqDaSEQwhmI34sCc+7J8IQI9BHCCFOAE=;
        b=q6/P9CpaMfIhFaMtlcwMsHfv+VzIIfiKzQESHt4Isij9yUniJskDTwgmKblB8dJL9w
         PfrVo2UfFxHHhenIlcJoC88AVbAENyh9uSu7u7evNBP4slcgsIxw1wq2/uqZrUwRuwS9
         wVYMyN0idh9iP0dhW5oq85kC/2gxPMBpcedJj4h6yYhySQ9DQaePkKgUYEdIy5bTgcQV
         gTtwIRFP4SkTfhT0Xwd09qJmBWkHmn/KKscKsOPSdpG/Cmk+et+4vPtutddZnOR2oDov
         Grn8qgTAOxpkUXsEjxb9oASx4b0Ie6JiIpq3rmKGS2vwc67b/5fM6MvVgiEv7jHlG0Nf
         xuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743690072; x=1744294872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdKyMlf3QjSGqDaSEQwhmI34sCc+7J8IQI9BHCCFOAE=;
        b=cK+1cfW71aTP64UoQ7pmB2XQaVMQ1+zUtp26y9p55BawAfnd2Cq7PxbVh2fi8i/sh3
         WJer40ttR3FWjkCDgBK/eQq8xPIq6SYl6U+yBwwFFK2+sf64Qb3vskqPnBXGIegUal/V
         e5UOrVZt/pi/6XHzDp5PffRCGTUJ/NnJ7gu/TqnciK+7qpMIBx6wWp49nFzbI9qq9397
         eiWbC48HNJHggFLnlziQtUqp1zKh+Kq2uNlFGzMBHhTclxHHYrdSWvDkuAJRz3LRrzkw
         UyKYVNViEnCyQlYhhSHurFjD12RtkKGeFKMbxy8Mc85GB7/O/Nb7CnJmVU/hXC3JOlrO
         0c4w==
X-Forwarded-Encrypted: i=1; AJvYcCVN9yNgb5U0sq96YBS8PXFBx4qHfC87AJjWzo87T7MoSl9eM6dBUC7T32kiYsuqzusTvkbBm/ogr/fhRLEYRi9o@lists.infradead.org
X-Gm-Message-State: AOJu0YzlWJ9Tq8X1nbNM5YzluVuUX/fsGWrRz5MbPR2kn+9AU9QqDEKY
	GDt1gBVmLya25JrG5uUJLRtB770K1EAdmvXVnMc4al+Ud5yMkop7Dq81WlZreg==
X-Gm-Gg: ASbGnctg0BNLcaml8s//gSK9GrS8krY7bdCFdRzDu0taVMC7/Hpgly82AcgvqUQ/uU6
	XqtNN7gGDjP667xM0e5ZkCZGTgRcFsYvwRsvlZyoAlxGGzTYiWnqOaGw15X0VJ/Oec3tnogg/9n
	3IJMtOsjgIHcdLuyqZU1LA1gUvh+U4vbkfGnjE/YpIFO3ADicDk3rDpHDPw+g/qWDiLgRMBJZk1
	UAgo48lfceZ6VOFBWCKh1kWel/4QCM2K4fbKhHEsBnhwnysK2UDMSV8u96Y7VjoiLfsdgwxRbTc
	5iDb2+BLgeeU7FZbZh+yuHJxZOU/mY3J/iwNYKVs2v1Q3iqaT6mvSaaqZz2MVAzutzJjgWUIXR1
	iW+Fuwg==
X-Google-Smtp-Source: AGHT+IH9NWYIICiILBtI5t/w7XFm2+Ky2qyQvmJWj71kOjgDjuSgYqFoF+3azC8fuvUTcmLQ14dsAw==
X-Received: by 2002:a17:907:97c9:b0:ac7:2f8b:6844 with SMTP id a640c23a62f3a-ac738a4b2a5mr2120901366b.23.1743690072237;
        Thu, 03 Apr 2025 07:21:12 -0700 (PDT)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5c599sm99498766b.6.2025.04.03.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:21:11 -0700 (PDT)
Date: Thu, 3 Apr 2025 14:21:07 +0000
From: Quentin Perret <qperret@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
Message-ID: <Z-6ZU7DWkxnVIbff@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-9-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306110038.3733649-9-vdonnefort@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_072115_196070_F4CB12F5 
X-CRM114-Status: GOOD (  12.67  )
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

On Thursday 06 Mar 2025 at 11:00:37 (+0000), Vincent Donnefort wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1f55b0c7b11d..3143f3b52c93 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1525,7 +1525,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	 * logging_active is guaranteed to never be true for VM_PFNMAP
>  	 * memslots.
>  	 */
> -	if (logging_active || is_protected_kvm_enabled()) {
> +	if (logging_active) {
>  		force_pte = true;
>  		vma_shift = PAGE_SHIFT;
>  	} else {
> @@ -1535,7 +1535,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	switch (vma_shift) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SHIFT:
> -		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> +		if (is_protected_kvm_enabled() ||
> +		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))

Should this be

		if (!is_protected_kvm_enabled() &&
		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))

instead?

Thanks,
Quentin

