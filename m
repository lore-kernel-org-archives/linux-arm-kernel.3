Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30980D26D7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 18:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3IE19GKAch3cibGyhJWWZVvvq/91xVeyFd4VfvpSzU=; b=O3yDW6NNMCn+9ZSglp8CJDVa9V
	R2C0C2Z0vqu2Bi08rfYgJg24Rhkf/7kDVRLVBufDpdJtJWvhA7WoDmaFPx7QKEPb8biK5cWjBU857
	J+yen4Qbuogk0RailhhXH674jnRs8psnQ3+n07LqaOC1opKzLJDPCu07tTCONam/lsXJevz5D5kUp
	fnpCWGj/glcMg5NnRQcxqEzxoZU7tIL/rUgacw2KHYvFdMeyJpQ3xAgOh0kRio6laKXoGiNbx4uxc
	7/P8PBLFy35telXSUEASr8caJSKp52GdcyIJEjGOORSGygkr6+zPuqK8HgO4MB2Bj0pUIjOrbAnr1
	5GfWr3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHUz-00000002tuH-2UdB;
	Fri, 09 Jan 2026 18:46:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHUx-00000002ttx-32Ej
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 18:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 719D2435CC;
	Fri,  9 Jan 2026 18:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39ACC4CEF1;
	Fri,  9 Jan 2026 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767984370;
	bh=1hEqkjv2D0hSRyFz8anD5p5B//7oIENYTkt9Kf7Orec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5YMg3U1aJw9i8kle0Bnt+0wTkXcr99qOrAizB76xRIO/do+diMXDEZmekcBDOhr3
	 PHph5ANqVIzo9SvHBSxJUcP/Y7R8W+dv2Xoyk3QVh4DFDn5Tb7XQ8lViu/XWq7pyTr
	 KfIRBYxOyeJXGZyiqbu6NF9M3sP3alryHj93kBUn85RjVM15Vk1Vhdgc9Ly9uy+0ZB
	 vxti68FhS59GC2VaVDQQ40lKdd6AxDm+pHQ0pxI0wZjNSxGCqXLCmQ6zmok1cQ8vHl
	 XTT7C2yQEDMHkisKyv5cPeyWdctBdmQx5uIsq/jNpQuJJQ92QMderinB4b2SCjJhLZ
	 FLEHmkT3bRV3w==
Date: Fri, 9 Jan 2026 18:46:04 +0000
From: Will Deacon <will@kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 17/30] KVM: arm64: Generalise
 kvm_pgtable_stage2_set_owner()
Message-ID: <aWFM7NnBkRiM4OQI@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-18-will@kernel.org>
 <rm55zbvakwmh5ny25bosf3jjiehfubcm2st5q4porsmnffuod5@edygmhqq2ckn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rm55zbvakwmh5ny25bosf3jjiehfubcm2st5q4porsmnffuod5@edygmhqq2ckn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_104611_823763_EA57C475 
X-CRM114-Status: GOOD (  19.70  )
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

On Tue, Jan 06, 2026 at 03:20:15PM +0000, Quentin Perret wrote:
> On Monday 05 Jan 2026 at 15:49:25 (+0000), Will Deacon wrote:
> >  /**
> > - * kvm_pgtable_stage2_set_owner() - Unmap and annotate pages in the IPA space to
> > - *				    track ownership.
> > + * kvm_pgtable_stage2_annotate() - Unmap and annotate pages in the IPA space
> > + *				   to track ownership (and more).
> >   * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
> >   * @addr:	Base intermediate physical address to annotate.
> >   * @size:	Size of the annotated range.
> >   * @mc:		Cache of pre-allocated and zeroed memory from which to allocate
> >   *		page-table pages.
> > - * @owner_id:	Unique identifier for the owner of the page.
> > + * @annotation:	A 62-bit value that will be stored in the page tables.
> > + *		@annotation[0] and @annotation[63] must be 0.
> > + * 		@annotation[62:1] is stored in the page tables.
> >   *
> >   * By default, all page-tables are owned by identifier 0. This function can be
> >   * used to mark portions of the IPA space as owned by other entities. When a
> > @@ -673,8 +678,8 @@ int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> >   *
> >   * Return: 0 on success, negative error code on failure.
> >   */
> > -int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > -				 void *mc, u8 owner_id);
> > +int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > +				void *mc, kvm_pte_t annotation);
> 
> While we're on this topic, perhaps we could go one step further and 'type'
> the annotation itself? For instance have a 'type' and 'meta' parameter
> directly at the kvm_pgatble_stage2_annotate() level instead of leaving
> that up to the callers. This would allow to have one place to allocate
> annotation 'types' (donated pages, locked PTE, MMIO guard, ...) and one
> way to serialize/deserialize them. That 'type' would be stored in top 2
> or 3 bits of the PTE for instance, and decoding of the 'meta' field would
> be dependant on the type value. Thoughts?

I don't think a global 'type' space is particularly beneficial, as most
annotations (with the exception of PTE_LOCKED) are specific to the owner
and putting them into a single number space will just waste bits.

But I do like the idea of encoding an annotation type in the pte and
defining those per-owner. I think it would also make some of the code
more robust; for example, I noticed that __pkvm_guest_unshare_host()
isn't putting back the right annotation with my series when I started
looking at implementing your idea.

I'll come back with a diff. It won't be quite what you're suggesting,
but let's see what you think.

Will

