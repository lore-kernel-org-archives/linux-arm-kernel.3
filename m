Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C645CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3psH5CD7tcrvwMqVdIhmXfChnHfszSZCh0gJTDmLAQs=; b=ZZS5KbcE9OwArXcr90KufILALB
	gsNuipj0VulrCz1IWHy7zBoNsEzfEIIDJNVVQ1IsDX2LVrULKxhJ0DlwEKHUo/1YKxlJVN06TRXM8
	84chRhbzbPHgoClABIjYdywS9Y1vqBxmc1ir7X1fPTL9pTHY8tuEj+7u+3dlt0k7nIOdsMFZup9SI
	GEX1r8WKmucd6T8pNpkFCnUeP9rbF5oscoenoakmILPM7a+prbk3HRbtqfFtGnoosI2XEW9vlZvDR
	984w/wR2eVGpO2ckHlK2H8J8tANhKIHLrkCWQzxCBftUjxG9bjCWt1tWwRPiNWF/YxGWX58qo8uFQ
	zKfKqTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUK0-00000007iLx-1cn5;
	Tue, 16 Sep 2025 11:58:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyUJy-00000007iLK-2ROP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 11:58:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45f28aba94cso43585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 04:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758023885; x=1758628685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3psH5CD7tcrvwMqVdIhmXfChnHfszSZCh0gJTDmLAQs=;
        b=Qw7lk5LfMMHmlMuO+kFu8x2UwLxzEKFTgczACogI0kT0nspLKy+ofnJsX4M2fcDujS
         p228h3CScw4K+bQuabiLKxn5781lzCkCZYE0f8dN/Qc3m6Ppr8wnmFPuhcRvjVUkq7U5
         hGUVlBEfuCGbiJf5+8z0wi/3U7j5/S5PUEkCduIWzCmHhBNF8JYhii54BoJoImTorF9o
         7EcSJXM4DN6X6Dwe2kW5ejtxUq8gSvwO7qAnJNZ3N1IlA0rcC0Zr08mb96JEgRPpRhjj
         e29RIr5AbbZjViwsyi6H+Muf9mUFduvPFC9QNY6WGmZE8C2gATg/FFp8o0BHiX1XWX9e
         /FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758023885; x=1758628685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3psH5CD7tcrvwMqVdIhmXfChnHfszSZCh0gJTDmLAQs=;
        b=ESFyo1VMspq78vKiUAFlXTW8CbTpY/2JnSJwaXAxpg1J8vZAl866FlvMhKehBh/0V3
         KrixAI4aAInrGF9CLQaIDsLprT5EG2AoywFrxez/0VxeRz/Y/AJamQa8pvI7sKOhDF6E
         4nfHd8scACaO6CYvoPfOcc3RcvELyW9EVHzaoSJVIqoXZ94AWc03okZ3he78bnV8u0F+
         ts966MnTCf9+A5P2ke1Awr9VOsYmtj116sL3oLFeY2ouoz8JBlI2bCLWSAbfAtBbp7w1
         IjXXJVJ/nqhhSWa9Nj4lbANIGRN76FZdSvNoMWFZ/LriLnp7LQwRF+9Y1tZJnPKQPvbn
         Zk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5owFGlHufCpVSCgjyRHA3TKojpuQrMH5RtANHEFyGHZoO502xUqm3kHuSsg1dpuroPkqbTor0CRY7qKzU9NFh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+O9mK/5b6tht88khvcGLa8D2xrFAYnOgQQmBCNpR7KTLMz2Zf
	fMYG+SA8GAbmLDVmMkJLWSTAgR61cS9x5GPWDlNxw4q42U5U1vsMjUoTI4IToHFLdQ==
X-Gm-Gg: ASbGncuaMrOeig/rznF+vZAVvzL/ogTHKyHRs+p8ytQwy3GYvGJGz6D4/j7HHEctvA6
	ujXLVtyNwOtF2A4rsmKxb9yW8s8rdix4p/fwQlvmW41m2YrbTfaU3uxo6Z22fNHCHStSbf6rrh8
	ADpm7g+h8i+pt4DDmU7qzLT4wohMPrYinFZifCQq0x6Ky+/yPdIKrASe9Pgtk5Yi+L55kJNVlrK
	Bj8wPTsmgR7fpzQUifGE1fKVMBskdapCXBhAEah0V1mx48r8gNZN8lC1K0TXEuzA8bwrEyxy6xd
	A3/+fjx6Y9MwfjsgZHXegrcnyZHK5hbkOYc8jCUkGNWeJeE+Ua+7BDuifbSfAWkaQpQqvlVKYkg
	otCeKPgTrl3bwrKGVu7rgKG23Hy1WgzcFe4Her+65H6WjTg+afguzcNavNJT0OAeIINtmGQ==
X-Google-Smtp-Source: AGHT+IG7Q075/69lFtwq0hoEJKVoCNlBE4hU6CDHrnoiEI5/aWCVfJbO7FkOPky6dULeT2aGJwID/Q==
X-Received: by 2002:a05:600c:8b6a:b0:45f:5b02:b0cb with SMTP id 5b1f17b1804b1-45f5b02b390mr996015e9.0.1758023884645;
        Tue, 16 Sep 2025 04:58:04 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7e645d1fcsm15966584f8f.48.2025.09.16.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:58:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:58:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com
Subject: Re: [PATCH v4 01/28] KVM: arm64: Add a new function to donate memory
 with prot
Message-ID: <aMlQyEdJdJ4Q9iS5@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-2-smostafa@google.com>
 <aMAvwlMQ-Jf2MWzd@willie-the-truck>
 <aMcWIDQzi5CDNC4C@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMcWIDQzi5CDNC4C@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_045806_638148_80858FED 
X-CRM114-Status: GOOD (  26.09  )
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

On Sun, Sep 14, 2025 at 07:23:12PM +0000, Pranjal Shrivastava wrote:
> On Tue, Sep 09, 2025 at 02:46:42PM +0100, Will Deacon wrote:
> > On Tue, Aug 19, 2025 at 09:51:29PM +0000, Mostafa Saleh wrote:
> > > Soon, IOMMU drivers running in the hypervisor might interact with
> > > non-coherent devices, so it needs a mechanism to map memory as
> > > non cacheable.
> > > Add ___pkvm_host_donate_hyp() which accepts a new argument for prot,
> > > so the driver can add KVM_PGTABLE_PROT_NORMAL_NC.
> > > 
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
> > >  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 11 +++++++++--
> > >  2 files changed, 10 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > index 5f9d56754e39..52d7ee91e18c 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> > > @@ -36,6 +36,7 @@ int __pkvm_prot_finalize(void);
> > >  int __pkvm_host_share_hyp(u64 pfn);
> > >  int __pkvm_host_unshare_hyp(u64 pfn);
> > >  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
> > > +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
> > >  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
> > >  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
> > >  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 8957734d6183..861e448183fd 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -769,13 +769,15 @@ int __pkvm_host_unshare_hyp(u64 pfn)
> > >  	return ret;
> > >  }
> > >  
> > > -int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
> > > +int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
> > >  {
> > >  	u64 phys = hyp_pfn_to_phys(pfn);
> > >  	u64 size = PAGE_SIZE * nr_pages;
> > >  	void *virt = __hyp_va(phys);
> > >  	int ret;
> > >  
> > > +	WARN_ON(prot & KVM_PGTABLE_PROT_X);
> > 
> > Should this actually just enforce that the permissions are
> > KVM_PGTABLE_PROT_RW:
> > 
> > 	WARN_ON((prot & KVM_PGTABLE_PROT_RWX) != KVM_PGTABLE_PROT_RW);
> > 
> > ?
> > 
> > Since the motivation is about the memory type rather than the
> > permissions, it would be best to preserve the current behaviour.
> 
> +1. I believe the current `WARN_ON(prot & KVM_PGTABLE_PROT_X);` check
> would potentially allow "Read-only" or "Write-only" donations to slide
> through silently.

True, this can only be done from the hypervisor code though, I will
make the check stricter as Will suggested, and if needed we can relax
that later.

Thanks,
Mostafa

> 
> > 
> > Will
> 
> Thanks,
> Praan

