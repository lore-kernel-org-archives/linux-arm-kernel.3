Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD8ACA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TG+gYRralj304lv9jlQQvH2rsqe/nskBvKJU5W4aZb0=; b=4mlwuKokBH+JYQbNJvSZES+axG
	1TnFwNA4R0JLf/iWioCn6WILuZvLZ+zPmtEAHDhQpCYgpUi+wJ1t6R+0fvSk12esjyF7Hj5yvippZ
	cALZjPNiumzT4muiteXnz1dov2YCqPUaE72m0Z6Bj90khfSV04ci5poaX5Xr7jhtC14xlIHugu6fk
	Rf8vTgs8fwYqEFIDbXBr4G70PpWlznpFsIdzZCaKjNNEaMPYQS+gG20uPR2PbXEqwfuOPLCukf4f8
	pX2uSopuuB9DrvnTmu08FYEUniVljn2JF5HJOuYqbUMQ7++vY/bgHu9u5ICnEknXvpKRpukwI1o3+
	vq/CTH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsJp-000000022C0-2eCY;
	Sun, 14 Sep 2025 19:23:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsJm-000000022Bc-2oxB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:23:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24cca557085so213445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757877801; x=1758482601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TG+gYRralj304lv9jlQQvH2rsqe/nskBvKJU5W4aZb0=;
        b=jFj0kQ23faJJBE6SnFr3T0clYmwCsnoLXuNA/1JhnGYoN44wWlOcDnrN+PuEg1hFjq
         QnWjyviIxHUxDlTHoKl1hmBDSrPEUsTkF5gNWO7PbxG3eTs/sAd0TUY4tBq88iXqlvgx
         goqMZorFTilHUZY45hdJIL7tP5/zvMrDe0RXVRXUXGoSere0Cr0hPq2NDVknXoupNVpl
         Ut2xjq8Jc+RPXE0+gms28EtIVlvWXEWnf7ospaynM+noWhrfarkweMo29tuBpSYdw8EW
         isuKOuWAPVmrUfZ2dRdgn+BadkAGotMJy7yfPyq4jpFW5ADnXRW0Xy2xoHqbhRJTgOFj
         pmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757877801; x=1758482601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG+gYRralj304lv9jlQQvH2rsqe/nskBvKJU5W4aZb0=;
        b=xUrAWHOsTwjFa0CAe0wrCPhze2HHfdjBGf+kL0XPnmTJEEJHVJ5WM3B6Nxq3GwCBn9
         GomY4fhDx02M6PA3fP26CDQ73wOXYGfpirzW2NzCPJHxzmfDwr+TvQErFmGZKbJ0A0p+
         3dV8lqg0J+Q9G9AnFcShk+hSxe+5Bc41/lsPauuzAqo+OmSmR04o0oi3LnC8wVIGWrEk
         PttqaOvkkZD0mh64bepke3tDJAJg6wD7zd+JgGZwN3yWHn6BaNRdzqntTDmpOCKFllJN
         /Cd6ULI0fvCTuPwzGalnk6MjpouIUrZFPbLvqBgktGPgVs3D3fDs85kr/HvWnFtxRlo2
         qzKw==
X-Forwarded-Encrypted: i=1; AJvYcCUu4Vfs6+wiOJYrocOPYDB6reEvxhr+ldyRXT0h7QMo/iq/yDJU0Vee0qiJ3GHCI27Vvf7CDfvcSO2WgBg+t4NB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+3a/UBpR/ZCFsWYM2uEPRp3QSiSLUwhOj4FPJ+pz4dEnF6xs+
	JNSO/vLaKODigY/nvuYXefZHo1uK7laeu7MOJy14j5kcuGvquAKOIoR5GRUBAxSs4w==
X-Gm-Gg: ASbGnct2AttLWeQAj1lNswpMGhPjNxlU1a2ET6eLzq+bhIwh8kOyka+OcS1axvi3D3z
	oTUwcAjVm4c7QMiy99ghQadecb+WqjbP48Xa+bfmP0TngYMQ6BNrr/4tel5rZUPxU6UPgeMeVe1
	5sbR2dO3KtouNdmsYCTX/5OeZeYYp/VI+v9qFGX4X7oG19ow1I53/UnuRZKpT63NUfamSWCIuS2
	29fWuygCml6v5vddYEzUrjIZ1oLFg8zchALbqiIzLaGquYhvv7pwE9g/XEQ1AiNoNjJrVdoL1gg
	ceUgVDAxk5GVh24PGgAwT2N7I+ocUrjH2FJ1Jq1IOkosA29HBG9bbAAkQNVcn3TcdF8iISdOcjF
	oFfZ0uChBVOOsBj1TzIIBnHm9DRQ+nMT7wxJENRxz+WHnVDDeIxe9EH9KafN12mqoi6Pq0KQz2g
	==
X-Google-Smtp-Source: AGHT+IHeCAQpludM0vTJDLMiqTdpngcD9vok0tgM2qTCvopIbkrrbFlepcXGw62j8sLSWvlQCNe2WQ==
X-Received: by 2002:a17:903:183:b0:246:a8ac:1a36 with SMTP id d9443c01a7336-260e7c51cb0mr3888035ad.2.1757877800544;
        Sun, 14 Sep 2025 12:23:20 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32e2b9125a8sm1504984a91.1.2025.09.14.12.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 12:23:19 -0700 (PDT)
Date: Sun, 14 Sep 2025 19:23:12 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com
Subject: Re: [PATCH v4 01/28] KVM: arm64: Add a new function to donate memory
 with prot
Message-ID: <aMcWIDQzi5CDNC4C@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-2-smostafa@google.com>
 <aMAvwlMQ-Jf2MWzd@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMAvwlMQ-Jf2MWzd@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_122322_735943_DBB0ECD0 
X-CRM114-Status: GOOD (  22.90  )
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

On Tue, Sep 09, 2025 at 02:46:42PM +0100, Will Deacon wrote:
> On Tue, Aug 19, 2025 at 09:51:29PM +0000, Mostafa Saleh wrote:
> > Soon, IOMMU drivers running in the hypervisor might interact with
> > non-coherent devices, so it needs a mechanism to map memory as
> > non cacheable.
> > Add ___pkvm_host_donate_hyp() which accepts a new argument for prot,
> > so the driver can add KVM_PGTABLE_PROT_NORMAL_NC.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
> >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 11 +++++++++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > index 5f9d56754e39..52d7ee91e18c 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > @@ -36,6 +36,7 @@ int __pkvm_prot_finalize(void);
> >  int __pkvm_host_share_hyp(u64 pfn);
> >  int __pkvm_host_unshare_hyp(u64 pfn);
> >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> > +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
> >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 8957734d6183..861e448183fd 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -769,13 +769,15 @@ int __pkvm_host_unshare_hyp(u64 pfn)
> >  	return ret;
> >  }
> >  
> > -int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> > +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
> >  {
> >  	u64 phys = hyp_pfn_to_phys(pfn);
> >  	u64 size = PAGE_SIZE * nr_pages;
> >  	void *virt = __hyp_va(phys);
> >  	int ret;
> >  
> > +	WARN_ON(prot & KVM_PGTABLE_PROT_X);
> 
> Should this actually just enforce that the permissions are
> KVM_PGTABLE_PROT_RW:
> 
> 	WARN_ON((prot & KVM_PGTABLE_PROT_RWX) != KVM_PGTABLE_PROT_RW);
> 
> ?
> 
> Since the motivation is about the memory type rather than the
> permissions, it would be best to preserve the current behaviour.

+1. I believe the current `WARN_ON(prot & KVM_PGTABLE_PROT_X);` check
would potentially allow "Read-only" or "Write-only" donations to slide
through silently.

> 
> Will

Thanks,
Praan

