Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0CBC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSIEw/2MydfV3kI4WHDS//5IkvGuSP6WLCIhrE/jR14=; b=0kv4YAFyYUMINK71YC6Fa9Jc4t
	XiwpjK+b8UI0MQgErdPtJTH8CHtvyC/L8nSlrD2iWVXbAbgmBC3Obo9FI4Kj56RH2wr+fwDZUdWlR
	kp1QgCwtRYCgeV7fF+u5jrwYBn33P/oVnYBbyY3AnYvaBxcb4DSRXFuV2EcK/rD+HdckD76jBzoVq
	XjH3fyDddHMXkoUoXOFV3kLuH2tNrQdB6+y1VPIKU8m6dKO9OGlJ92uwILeRcmyGZhlUcfvUZvigp
	cSQLfBS9SPVpA1xroV3ZNZTmZeK42feBVVis3eYWG7jYg+RnMhjYqYoRWJcqhkemK+DHWqz+O1ZaQ
	HIkiC2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdPU-00000004NBY-49fy;
	Mon, 09 Jun 2025 14:23:36 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdNH-00000004MyR-0io6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 14:21:20 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2350804a43eso70168515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749478877; x=1750083677; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSIEw/2MydfV3kI4WHDS//5IkvGuSP6WLCIhrE/jR14=;
        b=FSe1enNQOF7rDrzoYrh+RhuvVs6xZ3p74nb9IEReLtd5HWvJDfDbSpqihimSUA6rUY
         6KqmZSqrV/QQWNulKmmaX6My51PTi4UqfaJ0r+nu5w8/Lkuet4siQZkWiRw9E2XSPK/R
         JCkvqGq+07I1bfk5OZx+GtlLGQFVHXzSVzErBWT198m83JqWXYR1V2doVLNplZULKfWH
         LInNJRHskMop5t0EasPocU3HgKkm9ORcnh8vfR+O4Em+RnmZcPu0LH9e/Kto7UMQKwh7
         aMmqZZTW7PWr3oUFXhx28H3NK0SaJjvxQ/PnNnxgoZOb2xXX/lj+LiBsF5vpmGTEp3sc
         pRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478877; x=1750083677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSIEw/2MydfV3kI4WHDS//5IkvGuSP6WLCIhrE/jR14=;
        b=OTyqCeN0MueM0MH97xy19slKOwzGBmzeCXLLCPcX3g1C4z4oSPG0djtBMk4Jj7OW5O
         KI8KWkAfMpJ2XfDWQpLf2V4qOKUTffnhHJp7SssFrw76cYPTT8Wd5C3XszOeB/rImVSd
         F2KS40r1LSP9hn8vMRqnMoBZjwX+SbuRFVenLEAYYV/uxnTmoNvc+PYp9Mtsj7YsxLUr
         AcHPrxsmdJfPR2bY4OjSM74aW+H4A8iEEfdfdCVZrPGNzxlqHGUx1OUmwUDKG4E7XFTH
         8Y+ow8PU8kMDPAj2OBtk635Si+lm854oaRuVVBbc4d/4eSzzENIZA1q2sXWGkAwr9T5v
         tNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY7SYm4JaEbp0qins6U5OyrUJNT0FH/lt/il0GmMg3lj1alBxTdbCCktWp4+hDzOuHFQfip+SVzb86NuUm6Vv1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv5g2tKMwmkNlnJEBg/aBQ0doAds97JylImDGwFZ5/5lJnTQPz
	duOWn0/ktwNpY4ZrUG4AxZNzHOkhAnDt5J6FktlkeLCAtdUi45mkX48xvBuEXPTB2+aePzrymJP
	NlftCsg==
X-Google-Smtp-Source: AGHT+IERysFaxhAHifqxHTi2VcbI8oY5rYOLco6ZrI9WGaP0rXEe5OjT6M/29a/9l0QmkI+VOJHg1ucx2CE=
X-Received: from plbju5.prod.google.com ([2002:a17:903:4285:b0:234:45eb:5e18])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f544:b0:235:f3e6:467f
 with SMTP id d9443c01a7336-23601cf6bd8mr192715225ad.2.1749478877172; Mon, 09
 Jun 2025 07:21:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 07:21:16 -0700
In-Reply-To: <20250609122402.GM19710@nvidia.com>
Mime-Version: 1.0
References: <20250524013943.2832-1-ankita@nvidia.com> <20250524013943.2832-2-ankita@nvidia.com>
 <aEMvbIu530nCqwhG@google.com> <20250609122402.GM19710@nvidia.com>
Message-ID: <aEbm64VUr_GmBFzI@google.com>
Subject: Re: [PATCH v6 1/5] KVM: arm64: Block cacheable PFNMAP mapping
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: ankita@nvidia.com, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, 
	shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com, 
	aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com, kjaju@nvidia.com, 
	targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com, 
	apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, 
	mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com, 
	alex.williamson@redhat.com, sebastianene@google.com, coltonlewis@google.com, 
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org, 
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org, 
	ddutile@redhat.com, tabba@google.com, qperret@google.com, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_072119_212009_780AF882 
X-CRM114-Status: GOOD (  31.62  )
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

On Mon, Jun 09, 2025, Jason Gunthorpe wrote:
> On Fri, Jun 06, 2025 at 11:11:56AM -0700, Sean Christopherson wrote:
> > > @@ -1612,6 +1624,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > >  
> > >  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
> > >  
> > > +	if ((vma->vm_flags & VM_PFNMAP) &&
> > > +	    !mapping_type_noncacheable(vma->vm_page_prot))
> > 
> > I don't think this is correct, and there's a very real chance this will break
> > existing setups.  PFNMAP memory isn't strictly device memory, and IIUC, KVM
> > force DEVICE/NORMAL_NC based on kvm_is_device_pfn(), not based on VM_PFNMAP.
> 
> kvm_is_device_pfn() effecitvely means KVM can't use CMOs on that
> PFN. It doesn't really mean anything more..

Ah, kvm_is_device_pfn() isn't actually detecting device memory, it's simply
detecting memory that isn't in the direct map.

> PFNMAP says the same thing, or at least from a mm perspective we don't
> want drivers taking PFNMAP memory and then trying to guess if there
> are struct pages/KVAs for it. PFNMAP memory is supposed to be fully
> opaque.
> 
> Though that confusion seems to be a separate issue from this patch.
> 
> > 	if (kvm_is_device_pfn(pfn)) {
> > 		/*
> > 		 * If the page was identified as device early by looking at
> > 		 * the VMA flags, vma_pagesize is already representing the
> > 		 * largest quantity we can map.  If instead it was mapped
> > 		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
> > 		 * and must not be upgraded.
> > 		 *
> > 		 * In both cases, we don't let transparent_hugepage_adjust()
> > 		 * change things at the last minute.
> > 		 */
> > 		device = true;
> 
> "device" here is sort of a mis-nomer, it is really just trying to
> setup the S2 so that CMOs are not going go to be done.
> 
> Calling it 'disable_cmo' would sure make this code clearer..
> 
> > @@ -1639,6 +1653,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >                 return -EFAULT;
> >  
> >         if (kvm_is_device_pfn(pfn)) {
> > +               if (is_vma_cacheable)
> > +                       return -EINVAL;
> > +
> 
> eg
> 
> if (!kvm_can_use_cmo_pfn(pfn)) {
>                if (is_vma_cacheable)
>                        return -EINVAL;
> 
> >                  * If the page was identified as device early by looking at
> >                  * the VMA flags, vma_pagesize is already representing the
> > @@ -1722,6 +1739,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >                 prot |= KVM_PGTABLE_PROT_X;
> >  
> >         if (device) {
> > +               if (is_vma_cacheable) {
> > +                       ret = -EINVAL;
> > +                       goto out;
> > +               }
> 
> if (disable_cmo) {
>                if (is_vma_cacheable)
>                        return -EINVAL;
> 
> Makes alot more sense, right? If KVM can't do CMOs then it should not
> attempt to use memory mapped into the VMA as cachable.

Yes, for sure.

> >                 if (vfio_allow_any_uc)
> >                         prot |= KVM_PGTABLE_PROT_NORMAL_NC;
> >                 else
> > 
> 
> Regardless, this seems good for this patch at least.
> 
> Jason

