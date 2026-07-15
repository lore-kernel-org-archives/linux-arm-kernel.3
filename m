Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7C5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIeWr4qWe0Ig+GOra4mnZ6mrW3E9gxiXXny9RK2rdMU=; b=kMIcBXg92ybP+cUtoL4iIdqg+S
	WYCa3DtJ6RdHniCgn9t3PLxAqVarWMAisXLvcEUNJ1f8CenVIxfhwG14pnv5EBusa1CWt1XCi6SBR
	RTe6/bmqgC89M2Rwmala9UDR2SNUpMDu5IN4uLk88y7iDL/FQAivubTjHQpDPrZH4kgFBcCFUFZTd
	gdLRwl2wZ961iyl3v5Jw7JyZdwCgFmkcKe3Mn+lYk8CtWniG/ha9+MsTQgUH2+FXSuCIWow1zPqax
	IxqJfBioDzUbWFcBSr4uquLPrE2QhngPre5MVgv/8Js5UZRb41BEeMTVyjt/m08NNqjQjLFHxpjcv
	Ui598cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvRp-0000000EFT7-2Tth;
	Wed, 15 Jul 2026 08:58:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvRn-0000000EFSl-2YVw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:58:32 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493e497643fso8861215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784105909; x=1784710709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kIeWr4qWe0Ig+GOra4mnZ6mrW3E9gxiXXny9RK2rdMU=;
        b=WuI0mNZK9XB06BPS4mHKlELNKj+hR5G4CfOGefZZL+A/w5Ogd+lKe6SALK/eP6q1gE
         8Tnh0gnS4cnGAJN1HR9j6uJskphh6zk5vott1th0nYX7fvDcyyqHP5xREJYpRIVgd9Fo
         b/N8blRrZBaFgiANzjh9bR8Mqm0hB0rIk9jdLb35+2i0yAMcDFUnppovEHUMigDFZyPD
         rMHUPDCXmAlec6gVqQjEaVpj6c9tjOpTE9XjTvRb8b4yaiOsO8SVRsQt5LukQHUmx61Z
         Fxa9PpdBHv34WWYOPQnXoI/QIoHiQTPFx+HBrJhsxUbQXc6iSruDJCowS1OcxTPG4fXR
         d5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105909; x=1784710709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIeWr4qWe0Ig+GOra4mnZ6mrW3E9gxiXXny9RK2rdMU=;
        b=XrTaozRykuMovNZZ56lFuRgG2KCuh3aykGH9bHHNH/LSUcSMxtFwZWSHi4neLj68Ch
         /8Z7sgUjA58HUNIKSVXb1JKfdAqDqfdArQ4Gz2YZ8tGqI6s0MFEl0Ypy0Nw0SdVViRg1
         qDgRlQpAKn3sYmB0TsH0J/fLAIhukiPVOZ1ZNZhepi/6OyYe6T6HMtfBaloLirnAW9/D
         MOK2Khum+C/zz2+Jq6wVKzm9ME0fUcS0YHUX6DWDrTGIcU3Td+oC+1sX1136qhCtl5R2
         p5Dtj1Y6dZ8RAzUf/qMPJcRMW+45jiRnMrBTs/6R1n3KKMiQJm4K2Z+AC9tIKoWNDn+l
         CO9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro/8j30v0neKN9EUSgPGngn19SqcC7wNSFNtUeUVEv7Vf4+LVS2TRoKGEm60arEz4whMqx+TNelDWrJDT6Y4kqW@lists.infradead.org
X-Gm-Message-State: AOJu0YzLvlIXjfU5i7XOyO1jNAX087KdDzVnuyoi7nTvZGwXazmXEtox
	a7oMVMCgnT1q22/SolZSYaPZUk19q1YFZC4WwEb4qNxlB/c9sVBx68Fq031Mh99QiA==
X-Gm-Gg: AfdE7clNqxSVBr1rX5Z0j+kefTlKnDjTmNc/x3XepIh4AKvi6ZwAG/vCnGFrYMaqxhC
	78mTE+TE69voPPMqy4RAS2r4rAT9IDpQYPGQnbcgrjbnzhBZ6R8n2CrX3D4dOMXk5Rs7sPzgBwJ
	JD8bIIJxH0CtIj87xuAfqtdCDfBRUmNHi4xtP5OI26GXhGOOtNJGpzKYtS6C3VGH7piBVVNAk5X
	lv8iErYaAQWwtlE1XVs7lAuE6LYtXO3dUccMNZpCJL0ZItqIVGkJfsr5aVTGR3tXgdiNeDBVhAb
	a05xY6uKbh2TIKESc81oyE1J3YHP/eFYhUGc4TYITYHiPF/QnShndlHw3mVS/PT0x/y64EePzlK
	LPjXV+jyhdD/Gi3I8+vwbPJMisTaD2qFBrmoih3d0gOWJEGfKKXq5LoPGpK8u3q7/FCi2esvMmy
	EsJBn5kQXwbCX361pmjxSDTEsCJKiHfjk51rqO0dz7xSjU5DncgW8=
X-Received: by 2002:a05:600c:34d0:b0:493:ee2b:c876 with SMTP id 5b1f17b1804b1-494eb1b6de3mr83415115e9.35.1784105908213;
        Wed, 15 Jul 2026 01:58:28 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953df0fc6esm25752265e9.9.2026.07.15.01.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:58:27 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:58:23 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com
Subject: Re: [PATCH v2 03/18] KVM: arm64: Add __hyp_allocator_map for the
 pKVM hyp
Message-ID: <aldLr8Q8ovbwJn65@google.com>
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-4-vdonnefort@google.com>
 <CA+EHjTwMz+Ojq18Fq9USJqz_pZmemryNhy99Sw36sOejtpaf4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwMz+Ojq18Fq9USJqz_pZmemryNhy99Sw36sOejtpaf4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015831_663084_8ECD5955 
X-CRM114-Status: GOOD (  20.37  )
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

On Tue, Jul 14, 2026 at 06:53:55PM +0100, Fuad Tabba wrote:
> On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > In preparation for the pKVM heap allocator, introduce __hyp_allocator_map()
> > to map a single physical page to a given virtual address in the hypervisor
> > stage-1 page-table.
> >
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > index 725bb0fb941d..98a7774b541c 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
> > @@ -32,5 +32,6 @@ int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
> >  int pkvm_create_stack(phys_addr_t phys, unsigned long *haddr);
> >  int pkvm_alloc_private_va_range(size_t size, unsigned long *haddr);
> >  phys_addr_t __pkvm_private_range_pa(void *va);
> > +int __hyp_allocator_map(void *va, phys_addr_t phys);
> >
> >  #endif /* __KVM_HYP_MM_H */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> > index ec59da1322a7..c1c01f81ac5f 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> > @@ -160,6 +160,11 @@ void pkvm_remove_mappings(void *from, void *to)
> >         hyp_spin_unlock(&pkvm_pgd_lock);
> >  }
> >
> > +int __hyp_allocator_map(void *va, phys_addr_t phys)
> > +{
> > +       return __pkvm_create_mappings((unsigned long)va, PAGE_SIZE, phys, PAGE_HYP);
> > +}
> > +
> 
> nit: __hyp_allocator_map() is named for its caller rather than what it does
> (map a single hyp page). Its siblings here (pkvm_create_mappings,
> pkvm_remove_mappings) are named for the operation. Consider a name like
> pkvm_map_page() so it reads as a generic primitive.

IIRC (it was a few years ago) this was a suggestion from Quentin who didn't want
to expose too much of mm and suggested to make it clear that was a function
private to the allocator.

But looking at what we have now. perhaps 

int __pkvm_map_private_pages(phys_addr_t phys, void *addr, size_t size);

And this could verify that addr is actually aprt of the private range

WDYS?

> 
> That said, naming is hard:
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
> 
> >  int hyp_back_vmemmap(phys_addr_t back)
> >  {
> >         unsigned long i, start, size, end = 0;
> > --
> > 2.55.0.rc2.803.g1fd1e6609c-goog
> >

