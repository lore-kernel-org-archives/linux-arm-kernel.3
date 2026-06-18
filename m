Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B571BCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdkuOGLUlQ7bxWy9OnUbmcuGQ3e2VCJK+CUYR+keUTk=; b=XWxp9nf5d2eY8LCPJ74RiFm1QK
	Q2hRruA0VeYPESA6TQ3c1xl7xXI3npeQ/Lp1KeMkYk/KjbeDHxGRHhayy7krJphP8HiLz6uJbDvFX
	3Ct01b0OWz7RwvapUoid5FnJoZEFLvSBGjnUySyPBSrgXTADSsmgBDNhD8iQ8XyVkdtSDtgFLx4oK
	75R7RRGe/QHFHqVyI7UxIj/vEQ395BVQi36J9yeU/9EqoZFTbgaDbfVubE8mrQ80I6C+pNvGjyLTs
	V0k2el8oxpArXNpqMH2ef9YRgKM1OmJZ89HT9Ahsshr9Le088e0sD/mwrLWwtZY8uC2Gc8Eh28XGL
	vWHaTqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waGF3-00000001dC3-067X;
	Thu, 18 Jun 2026 17:09:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waGF1-00000001dBw-3Auo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Jun 2026 17:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QdkuOGLUlQ7bxWy9OnUbmcuGQ3e2VCJK+CUYR+keUTk=; b=N2fBMIMKaKgGKBIZ0e/mzkqH21
	25yD4/UC73ownDS4ymFy1GKNMMbaD1yAqojs9NkLu7yZhi5jHEyJupswozLhsRaRqNglxd4re85kh
	yWX8qz5NL54acBfF9Uhq79oNJlun5+iN29+/HMAJITzctwmbZGM1BbRy6BcYH8T7NLhjdihafWC0s
	drGXftp2SY/oHi9QOVZEPtiTK3naHovsM1b9c+rXdBhirzUGVuyM4TKbl8Lj1jA2QLHejWjVNGDsG
	EK8SYBWIqFCzxVTDGqyDNZ7Ar+KMY1ffBvGb6BJd25hwtdYW8BX8NmDzF5gng3gz2mDEObO0sBfBN
	1d9UBNYA==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1waGEy-0000000DbeE-3pv4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 17:09:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so17843995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 10:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781802558; x=1782407358; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdkuOGLUlQ7bxWy9OnUbmcuGQ3e2VCJK+CUYR+keUTk=;
        b=IuxTT5XebmvB10ow3ulP8RIoyC6gxygJOCFR7QtvJUXi7uOjmhzSlvK+uNylRRqcIL
         tBBfttfn9z/Nkc02Rs7ZNLN9CWjEyN9ALEzJN6PdfT6s0U1dg0yC7iLuL+gg0OBh3sHv
         Juz4bWbmApd/W7Zga4Nr35CYTtq5fEyqTK2fXpaqnDarObtPM6LNvpzxVRcjXQ2LNh1v
         vFLKiVE5nFti//pS7bRyB6ErurFnDsKt65PQ4HvesVU6C9OR/7b3wMDKYQ2Iah7Be9Nv
         lFvH85ct/rPlZZQskm+DC6Ny6sEGvf+lEZKUdBcRp9i5zPXBSM8RrBVDTW2K9A9VyV5H
         RlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802558; x=1782407358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdkuOGLUlQ7bxWy9OnUbmcuGQ3e2VCJK+CUYR+keUTk=;
        b=dEv7YaWJBeUgffBnYYR7uVfPk8ejIHYcQErdPy4UB2NQgcivR7RJL1vuYfkF9OFrLi
         ASUUDsxpF/cT4Zo2ykACpEI38wyGZAiyePvnZOSJmtBByAlSkDhmb1Wp1SNkssp0sI57
         pSE9gh7YB58XjSDDUX0Hkf95bWsmLYxaOkR+zaOs45+dJeuGSNnFd32Je66uhza1EgiN
         /iX+4zHmKmeTgoc4x+R6wJOWiDl3q3JYhm580e+XPJAkkvNgcgGHiggVfVDZSRI/nLy5
         yqbQmUVZc5/jwG6evSL0vshtgXiRvT3wP93bon4+CXP5CL3TUTkNMegSUPVr0JZt/jlj
         ulMw==
X-Forwarded-Encrypted: i=1; AFNElJ/BGejUxvXJr5EF5JZeevXJ/cOzJyNPOQcHwursRcz90fj89X0Kq9YcM69Un66tmcZ/tyLK87G0Suln6Yqnilc9@lists.infradead.org
X-Gm-Message-State: AOJu0YyBKLt4NMhxDLwzqFfSgUp5QgqmJjsNJZ8WI52XlbCyKS7TMhSn
	zJXd6JKqq3O175JdfHoTlZe5nVWGFhw2zrpOgauzdKgIPwV+Fu06sr26VcSER36ifA==
X-Gm-Gg: AfdE7cnjCRH7TWPWWdVL28Ku4F4hUdBbFTaWpXL54mIdgBvyiCZ6zgTLDSe0/VxINvR
	kc4k2d/OYrUWLBbgOpAVvrVUPQ5+Y8yDZxx/YyUih56WQwsA+dWRehC9l22jRQ644q2sjCaquz+
	BYkHaezaDxfNCD4dIxAl5+PM62mAaRA4Z7pUVmSvwN09+ylkbNsFM3pZEgl1VEPmJAnCpgJm1ue
	3Has0eH/qDQfq565Qp9dLVhls7V2r8A00jHmgIXzO6ImWT7RNnyiNI1B3QIEOv5fMvvk7SMFbQ4
	QlMM2Y1MFsML3tdCilX9eI5yivUfzYo6H6KfmTOJqZNAXkLxkJx2Kgq2/boYAIFOHim4NGy0h5m
	bDzlIkbXQRtEGSKLviU/G41SGJmpXdrDnESvmqz7culLLGtS6FaD3lGJ6vpmPhu4ibahZmrfsBN
	73f8pobNbSP59YYJ8Lr08driWBC0HTEma8WOoANjdMdvaEJFJCu0yOeVZL
X-Received: by 2002:a05:600c:4ec6:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-492381864b5mr67892175e9.13.1781802557213;
        Thu, 18 Jun 2026 10:09:17 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a712sm1949215e9.13.2026.06.18.10.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:09:15 -0700 (PDT)
Date: Thu, 18 Jun 2026 18:09:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org,
	will@kernel.org, jens.wiklander@linaro.org, joey.gouly@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v7 6/7] KVM: arm64: Ensure FFA ranges are page aligned
Message-ID: <ajQmN-UQD3uJJddJ@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-7-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617145130.3729015-7-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_180921_064727_5F3EDCC7 
X-CRM114-Status: GOOD (  23.66  )
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

On Wed, Jun 17, 2026 at 02:51:29PM +0000, Sebastian Ene wrote:
> From: Mostafa Saleh <smostafa@google.com>
> 
> At the moment we only check that the size of the range is page
> aligned, and truncate the address to the page boundary.
> This make an assumption that TZ will do the same.
> 
> However, it might decide to use the extra offset of the neighbour
> page at the end, which is valid under FFA if NS is using larger
> page size.

I failed to parse this 

But I see 

/* The base IPA of the constituent memory region, aligned to 4 kiB */ 

So it sounds fair to prevent oversharing when PAGE_SIZE > 4KiB

> 
> Harden this check by also checking that the base address is aligned
> and reject it otherwise.
> 
> Fixes: 436090001776 ("KVM: arm64: Handle FFA_MEM_SHARE calls from the host")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Sebastian Ene <sebastianene@google.com>

Perhaps the commit description needs some improvement.

The rest looks good.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 1a2abd0154c6..d7c5701d0584 100644
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
>  		if (__pkvm_host_share_ffa(pfn, sz / PAGE_SIZE))
> @@ -372,7 +372,7 @@ static u32 __ffa_host_unshare_ranges(struct ffa_mem_region_addr_range *ranges,
>  		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
>  		u64 pfn = hyp_phys_to_pfn(range->address);
>  
> -		if (!PAGE_ALIGNED(sz))
> +		if (!PAGE_ALIGNED(sz | range->address))
>  			break;
>  
>  		if (__pkvm_host_unshare_ffa(pfn, sz / PAGE_SIZE))
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

