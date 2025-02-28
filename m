Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE2CC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrxfhSQDPSEzY9FwMiMP3kLRUycgWmI45Gcv8VcIec8=; b=0VePhijvHHWiHLNDhMHNxJeQtG
	BniJS3Q+M4IFYvY3IDfSFMfmq4b96ITLfYujHZA87v9otgYaftBzxjtvo9zl0KfAok+hW/T5fRioU
	rvD0hfMUiIlYhj0c6g19jQ/xY7vYuamdCSRImiw9H7qoMdW3zK9BRMvvfXfMCyuhYWPBtLs/e0jw8
	5hCjJkjBA+oM+4fR7iwMDliAjfWynkzurom6IB8Gx+tcfyWpRTR8wQv8EAo1IEiGdRY5EG8Cs3moc
	cDDwMu3etfQMpUJzx6nh9/8pF1nmgysOLjrAsAaD+kbgWPjO15CE3c6wmyxGgPhSWFyXn3IRMsEyI
	3+p2WD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6RP-0000000CRDp-1Q6K;
	Fri, 28 Feb 2025 19:54:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6I1-0000000COtl-36S6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:44:54 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e08064b4ddso3291188a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 11:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740771892; x=1741376692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrxfhSQDPSEzY9FwMiMP3kLRUycgWmI45Gcv8VcIec8=;
        b=OAKr/bKsaum18i8z+pNSLXsBPQH6uTOxdAoHTMM1O1S2n+yy9qdWBu9JzxT+2hWhMB
         qUX42XjDB0lpR6O6jM9D0WGZciGK1xvqKklFqDrZvyvfU0dCdO1oKRYMM1ASHXRi5wTK
         9dfOhi3GkEJTm9jvHlt7XTAE3laM8gQF194uekjL3QgIRuDq2VZ2RaZTbI9owEFBiNPl
         bGnGdAfiexSIOSdpozw4gBMLAMjviQ0kN2QMs/bnwbw6/me7xgX3ylvmGT+SccFMkREC
         MR0xMyUmwdOlFJqiHKGhgScg8dtTpFaZGKcx7MUVjdsR0sC2nkJ6bSSXlhmSmw3n19WC
         VBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740771892; x=1741376692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrxfhSQDPSEzY9FwMiMP3kLRUycgWmI45Gcv8VcIec8=;
        b=BUQULVM5x3C/EwTlA/JTnz7/ltyqjrx5nSksboD9/ZQYNHIdwo9kwm4Wj/fIGT1/y5
         U+jgqiG3x6Ct2lYAbEoyXTA1aT08nS7GCeYZpRZHE+4FOSaFbsRVNg5c0GrdrJWLbbAE
         tR4U79pMdsIqeRgGB5tgsf3zE8KsW5TlYBqRnPTgCCd61Rdsepls4RSCv9rjV4BYn5lI
         m8n9IRfRV8mGcOLt4Jmw9lC1g+b0xswloJx3hfzSwWxk18T60g4ezX5AaZfSIg0R8BuL
         ReZWP6UUmCAyyFUzKHZMTI6aCj9ze24RquXWX6vARwn7mI+U1hdbBh+itwTaW5n+QMe2
         7iIA==
X-Forwarded-Encrypted: i=1; AJvYcCVzC7kHqBvtekDW77KsJtGdREd7PxYY1O2j6RM6AfrCY0GWoIgHE+o/FIdsSBjsjasT5mI1gsci6vkk4iO2jNAl@lists.infradead.org
X-Gm-Message-State: AOJu0YwiM5VfZJP7daxIxP8HabLPEO9FvOvDJljyPCo+m2fN3M+NopGZ
	mGNO78ZOQljLCrdhlwjvrhEczuB2hCPE/hutqdLNwmEa4ZToQSjZGxhJytY93A==
X-Gm-Gg: ASbGncuhZHpIhBNAMlpPO8OtSU4VFUCYbb8UppTC7JqnXw/1JpT8cMnCeVR5xHH88tN
	VlT1TXFMNjWAnw/OcpvDGrXvYJZdyp8cbeC7ILoHx8/cHIfFTtc6Y6F9jf0FFNA7xTxM4Jr0Wmc
	NgQj0awppPQhryrVLkHFJpfc/7AoIrlXGXPgKpSeVyTbr9UWLnipMzB9YRgMx7x/+NN97iZSGZ1
	TvQ0p7Cl7ZVr8X6FnzXqWTM4t28CXR2Q/wPCmsVBqG4NledBT3S8qtTRMhAjMDosLBP5uHMS3+n
	2e66smRLP5xdXAh+XK/OG10qf3Sn7o8mkzMOkTZdzB3A+RhH0aZ6JGBKCxTbgOg=
X-Google-Smtp-Source: AGHT+IHTdYieiZ2Aj4ze6pa8HY7tXwIhYVqJDu+daMOyke7B6a6VZw8tHVhi3y8YmBfQzTjNAAk15w==
X-Received: by 2002:a17:907:9484:b0:abb:b136:a402 with SMTP id a640c23a62f3a-abf26424829mr475325566b.18.1740771891977;
        Fri, 28 Feb 2025 11:44:51 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7c18a3sm335218866b.185.2025.02.28.11.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:44:51 -0800 (PST)
Date: Fri, 28 Feb 2025 19:44:47 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	vdonnefort@google.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
Message-ID: <Z8ISLxQRcsx2uuHw@google.com>
References: <20250226215520.1759218-1-tabba@google.com>
 <20250226215520.1759218-4-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226215520.1759218-4-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_114453_776700_2692D006 
X-CRM114-Status: GOOD (  15.57  )
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

On Wednesday 26 Feb 2025 at 21:55:19 (+0000), Fuad Tabba wrote:
>  static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
>  {
> -	size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
> +	size_t pgd_sz, hyp_vm_sz;
>  	struct kvm_vcpu *host_vcpu;
> -	pkvm_handle_t handle;
>  	void *pgd, *hyp_vm;
>  	unsigned long idx;
>  	int ret;
> @@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
>  	if (ret < 0)
>  		goto free_vm;
>  
> -	handle = ret;
> +	WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);

What's the reason to make this a WRITE_ONCE? Does it mean we should
update the readers to be READ_ONCE()?

> -	host_kvm->arch.pkvm.handle = handle;
> -
> -	/* Donate memory for the vcpus at hyp and initialize it. */
> -	hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
>  	kvm_for_each_vcpu(idx, host_vcpu, host_kvm) {
> -		void *hyp_vcpu;
> -
> -		/* Indexing of the vcpus to be sequential starting at 0. */
> -		if (WARN_ON(host_vcpu->vcpu_idx != idx)) {
> -			ret = -EINVAL;
> -			goto destroy_vm;
> -		}
> -
> -		hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
> -		if (!hyp_vcpu) {
> -			ret = -ENOMEM;
> -			goto destroy_vm;
> -		}
> -
> -		ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, host_vcpu,
> -					hyp_vcpu);
> -		if (ret) {
> -			free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
> +		ret = __pkvm_create_hyp_vcpu(host_vcpu);
> +		if (ret)
>  			goto destroy_vm;
> -		}
>  	}
>  
>  	return 0;
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

