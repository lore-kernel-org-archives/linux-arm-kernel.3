Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7494AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56E+7FMMOWqDmBxT+WtZLGSI2R/SROVQv8aPW35xP7c=; b=jNcOQM57tG29f445Y4XL+d0p+B
	sL67UHDR6XgNFWrLoiX/TC11OnIzlmbdOsphFhqJ+mRzU4Is4ybHZXQB7YKfNdRFS4+16m69Bm2u0
	d+EzqPEbXG5sK6Q0KujdFxYBGbKRkYI++nR7uxDhIb0mHMO/SieuvAn9ZTOtYWPvZIh6wwNmPdwYC
	9aVNXKQaGpo8xNqvyZIZgpbzIr+a1YUYbt4cuy+BtPNk4QBlzNRSFEXcBkI5h8yUbcoAolvHd4OkB
	j8izR3ysq9QJhW+mMC2bUH7h/KnJrwnYhNOclmMg0TtxnsF2qtiKnjWPfNFNDGhO5cxpueV/mNzV4
	Yvo2vD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ8E-00000009tga-0XVz;
	Mon, 13 Jul 2026 16:03:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJ88-00000009tfH-3WLa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:03:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47122683cf3so1822529f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783958619; x=1784563419; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56E+7FMMOWqDmBxT+WtZLGSI2R/SROVQv8aPW35xP7c=;
        b=XynqR0Oh4QNifhL8EwYWLgLgkQFcebgDxQRaQZ1gUPWk8rBBFvCdU88fmwzR11eRVi
         HL1m9VUpYcR+oKzCRyIjhJd/+pW2G3SIH+qaqMrXY8fyDwVdFbBoGHxZVlYG0ihLX1u4
         WO1foVOCIBUE2GrvINfW2EWlyhaemmk1z2UExX9evW+4G84VOmb8KYN/1hvevLw9KZTu
         2leyHkt65fXyjrdTKfFyl96vZqgXwi9bbUWkMeRDe1H+xEphmri6VQGfHWp9ol8N4L2N
         2wPVr85Cfi0UBzkmoeDB274ADavaAN/4yTzp2bawmTFdAms9dGpHwvYkH+cJMMLc/7s7
         +Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958619; x=1784563419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56E+7FMMOWqDmBxT+WtZLGSI2R/SROVQv8aPW35xP7c=;
        b=BRX6wNdxgL8jXM8PhA9G/oVYb5PZQUWjOX1+IRHHcypcVd5dIwXY9lF9lkrwUiGtPL
         A/rQYGHBPXSEWnIkTLhG+rNWGpUqGR7jgQuW/ve+3RyJzYOlBAQ899HJSlZlNMTlMCMd
         JD4DEcRv+OZ4uISATx/pgmD9wRkGOKwRrHVarzT6i7D5eH0TkOyI5djxQ/KyDIHUM2RC
         JzBe7uZV0lk+lIL9o24zrEWepLG0fdJhW2QpBG+ijr719nPqXguwxUk2ki9rSAMF+uHs
         LajtP3KgxxAflsVVKdamX1IJT5nIC1x4uwIuOlfiJW5iFUcMfPAgFnfpGbRVb/KkH24N
         gy+g==
X-Gm-Message-State: AOJu0YySU+UMbXl7VWxmYNZOT8FRctRNH/L3AuntUcD1cNYF7/rwYen9
	1Z9PYKDrkVyzY942X8oUdYr7eQa8WeqMBhSX6FcGWVOFHWMox0FJb0UUsGubkBsKuuqkze5Ru3y
	7xudBVA==
X-Gm-Gg: AfdE7ck3QRikqkGHltAQ7wFWeS4tjhexZ8M2PAgjrWyQBnBGgXztFsWKWYnJdoCsMli
	7Qwz6/7B+aPUJyyKXq1XdMDaYpcxP+NKaa++Saxbf1DI3gghdSVEG1OtNDQBI7e+P1yaQdM12Ty
	dXkxqYFnbBtuBhO2hJHN6s8jNIL/B+Fg9sN2dWt9b4BnOrUW5pGKuk+JSTYIGHAY8Bf9fXZXent
	+kHg3vuQ4SzNQvOClZQop/13etwgcuUAEJOezydcR0OOvDT3+Gd1KVC8GOB8waZC7TMaa5FldK7
	RBogbdRKJoketokudlYzmTEm5QG9NW8AInXnPGI1kkB5cUXS0EpkdDT+hUce/bhZi6VQbTKWlb7
	b+1Zcut5E3nNzGI/ag49CDI8uJaqhVfd+uJhAGUTiWgAR93jowlpRoo8nC+469iDS7abG0uisIc
	yBRvrOov+p/UbtQ4aC3Gh3dlLuR9TyEqW93ziCt6excXTlMpxN8EU=
X-Received: by 2002:a05:600c:1d89:b0:493:f29d:d591 with SMTP id 5b1f17b1804b1-493f8837f95mr107335125e9.39.1783958618287;
        Mon, 13 Jul 2026 09:03:38 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f84sm323988f8f.27.2026.07.13.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:03:37 -0700 (PDT)
Date: Mon, 13 Jul 2026 17:03:33 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	jgg@ziepe.ca, mark.rutland@arm.com, qperret@google.com,
	tabba@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 08/25] KVM: arm64: iommu: Shadow host stage-2 page
 table
Message-ID: <alUMVU7DYcrvgAYi@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-9-smostafa@google.com>
 <alTnAy7jvjUamwUA@google.com>
 <alTvf7iiOWn4PKE8@google.com>
 <alUA7zsJO1FGnss-@google.com>
 <alUJa5cbjjqZ8n72@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUJa5cbjjqZ8n72@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_090340_910078_6EBB3D50 
X-CRM114-Status: GOOD (  41.45  )
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

On Mon, Jul 13, 2026 at 03:51:07PM +0000, Mostafa Saleh wrote:
> On Mon, Jul 13, 2026 at 04:14:55PM +0100, Vincent Donnefort wrote:
> > On Mon, Jul 13, 2026 at 02:00:31PM +0000, Mostafa Saleh wrote:
> > > On Mon, Jul 13, 2026 at 02:24:19PM +0100, Vincent Donnefort wrote:
> > > > On Fri, May 01, 2026 at 11:19:10AM +0000, Mostafa Saleh wrote:
> > > > > Create a page-table for the IOMMU that shadows the host CPU stage-2
> > > > > to establish DMA isolation.
> > > > > 
> > > > > An initial snapshot is created after the driver init, then
> > > > > on every permission change a callback would be called for
> > > > > the IOMMU driver to update the page table.
> > > > > 
> > > 
> > > [...]
> > > 
> > > > > +	 */
> > > > > +	if (pte && !kvm_pte_valid(pte))
> > > > > +		return 0;
> > > > > +
> > > > > +	if (kvm_pte_valid(pte)) {
> > > > > +		prot = pkvm_to_iommu_prot(kvm_pgtable_stage2_pte_prot(pte));
> > > > > +		/* If the range is mapped in a single PTE, it must be the same type.*/
> > > > > +		if (!addr_is_memory(start))
> > > > > +			prot |= IOMMU_MMIO;
> > > > > +
> > > > > +		return kvm_iommu_ops->host_stage2_idmap(start, end, prot);
> > > > 
> > > > Do we really need to do that when is_memory()? 
> > > > 
> > > > fix_host_ownership_walker() by calling host_stage2_idmap_locked() and
> > > > host_stage2_set_owner_locked() should already handle the memory region. That
> > > > would also get rid of kvm_idmap_initialized.
> > > > 
> > > > So this one here could only take care of the MMIO?
> > > > 
> > > > Overall we would have a common point of synchro which is
> > > > fix_host_ownership_walker() after which the host ownership is ready for both
> > > > CPU stage-2 and the IOMMU?
> > > > 
> > > 
> > > I am not sure I understand, this is another empty page table, so we
> > > have to walk all of the host CPU stage-2 page table to shadow it in the
> > > IOMMU. if you are refering to the case where it handle zero ptes for
> > > memory, I can drop that but it will not change much in this logic.
> > 
> > In fixup_host_ownership() we already walk the hyp pgtable to know what needs to be
> > map/unmapped from the host stage-2. Can't we rely on that for the IOMMU
> > page-table as well?
> > 
> > As of, fix_host_ownership() could handle the host stage-2 __and__ the iommu? 
> 
> fix_host_ownership() only walks the hypervisor page table, and fixes the
> hypervisor pages in the host.

Yeah, Looking closer I don't think my proposal simplify things so much in the
end.

> That means that the IOMMU page table has
> to  be fully populated first, then we unmap the donated pages.
> That seems more complicated and it feels that decoupling the IOMMU
> logic outside of this would be better.

Why more complicated? That's actually another solution I was thinking about, to
just map everything as soon as possible and let host_stage2_idmap_locked() and
host_stage2_set_owner_locked() unmap what is needed here. (and also in
__pkvm_host_donate_hyp_mmio())

We wouldn't need any specific setup walker for the iommu at all.

> 
> Also, I rely on the IOMMU init to be done at the end of setup, so we
> do not have to clean the IOMMU init if any other part of KVM fails.

We could just leak those pages if it fails?

> 
> > 
> > > 
> > > > > +	}
> > > > > +
> > > > > +	/* In case of invalid PTE, we need to figure out which part of it is MMIO */
> > > 
> > > [...]
> > > 

[...]

