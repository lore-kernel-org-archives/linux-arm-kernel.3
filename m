Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F049C98306
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSuhLUcQ00SBXvM+E6ss/qZ9Lba3jmISZm3sBJoj4hg=; b=RxEkB37GSLJfJ009WOmJDaGY5R
	ttK1u7qKm3IHi+e5Sdsy2TJ8U06wFsIqFsXjD3K3cCySd/raOjZ1JV5hlAOyzi+v7/KcWbVJJCdli
	7S4SQjg+qaq85ihvaWEywno571kEvUDDJM3uo2AJjOAhZe5gz2g/BQv2GCKVQsxzhgXghM0bhIRjv
	z1IkyurOlHMHBq1lgbji15Ef5yvwto/cIKCb47UBeOupSe1R8iaRHBbxitA2yhM35T5neJ7zS6Nw7
	MmqBOnrD7mj3OfSMcoYeEzGkpFKpbASnHQ0DCZ1DCQOFnQR5CW601ki75tjHfT70YDFfMTLlk2YTR
	ka63SkAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtnT-0000000F2BB-1Kyw;
	Sat, 17 Jan 2026 00:04:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtnS-0000000F2B5-1DUR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 00:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 482AC60160;
	Sat, 17 Jan 2026 00:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967C8C116C6;
	Sat, 17 Jan 2026 00:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768608245;
	bh=gQ49HnwgetN2nDbDg2sBxHse+CaBcYv4VByJE8oyVFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJs6dRFsROanapwatHjpvVgku2MWedGCtQ1cs2kaQANdqrg4n9m66oQWx5FzHX+d4
	 2Xw9jWFWM1JdgBiBM2j2mnd5QlOKBef4E5WqDwC6ibMwip1UlBb8jRGktmKQqOG6v+
	 x9L4v+4fsrMvjM55h72ODVW+gC/JR1/2Wme7y4cNvsob3k6NaWQ+1jmCOV8aMj7uN8
	 ZYc+b4eDH4wfaStI7uPLksgTHnyr59bkF2WuOm7sg/LGxjU+F09BTGFMxeApkB+9Uo
	 sf2rwvocPWnR7/R/LZnBfx0go6Lm4BEhhQ5B1fhRVnp6vBdJBEAzD/sj00w3I19GgB
	 rZCzKFL13+hnA==
Date: Sat, 17 Jan 2026 00:03:59 +0000
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
Message-ID: <aWrR700urENbFLcW@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <20260105154939.11041-18-will@kernel.org>
 <rm55zbvakwmh5ny25bosf3jjiehfubcm2st5q4porsmnffuod5@edygmhqq2ckn>
 <aWFM7NnBkRiM4OQI@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWFM7NnBkRiM4OQI@willie-the-truck>
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

On Fri, Jan 09, 2026 at 06:46:04PM +0000, Will Deacon wrote:
> On Tue, Jan 06, 2026 at 03:20:15PM +0000, Quentin Perret wrote:
> > On Monday 05 Jan 2026 at 15:49:25 (+0000), Will Deacon wrote:
> > >  /**
> > > - * kvm_pgtable_stage2_set_owner() - Unmap and annotate pages in the IPA space to
> > > - *				    track ownership.
> > > + * kvm_pgtable_stage2_annotate() - Unmap and annotate pages in the IPA space
> > > + *				   to track ownership (and more).
> > >   * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
> > >   * @addr:	Base intermediate physical address to annotate.
> > >   * @size:	Size of the annotated range.
> > >   * @mc:		Cache of pre-allocated and zeroed memory from which to allocate
> > >   *		page-table pages.
> > > - * @owner_id:	Unique identifier for the owner of the page.
> > > + * @annotation:	A 62-bit value that will be stored in the page tables.
> > > + *		@annotation[0] and @annotation[63] must be 0.
> > > + * 		@annotation[62:1] is stored in the page tables.
> > >   *
> > >   * By default, all page-tables are owned by identifier 0. This function can be
> > >   * used to mark portions of the IPA space as owned by other entities. When a
> > > @@ -673,8 +678,8 @@ int kvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > >   *
> > >   * Return: 0 on success, negative error code on failure.
> > >   */
> > > -int kvm_pgtable_stage2_set_owner(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > > -				 void *mc, u8 owner_id);
> > > +int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
> > > +				void *mc, kvm_pte_t annotation);
> > 
> > While we're on this topic, perhaps we could go one step further and 'type'
> > the annotation itself? For instance have a 'type' and 'meta' parameter
> > directly at the kvm_pgatble_stage2_annotate() level instead of leaving
> > that up to the callers. This would allow to have one place to allocate
> > annotation 'types' (donated pages, locked PTE, MMIO guard, ...) and one
> > way to serialize/deserialize them. That 'type' would be stored in top 2
> > or 3 bits of the PTE for instance, and decoding of the 'meta' field would
> > be dependant on the type value. Thoughts?
> 
> I don't think a global 'type' space is particularly beneficial, as most
> annotations (with the exception of PTE_LOCKED) are specific to the owner
> and putting them into a single number space will just waste bits.
> 
> But I do like the idea of encoding an annotation type in the pte and
> defining those per-owner. I think it would also make some of the code
> more robust; for example, I noticed that __pkvm_guest_unshare_host()
> isn't putting back the right annotation with my series when I started
> looking at implementing your idea.
> 
> I'll come back with a diff. It won't be quite what you're suggesting,
> but let's see what you think.

Ok, so this took a fair bit longer than I initially thought it would.

In the end, I've ended up with something closer to what you seem to have
in mind: kvm_pgtable_stage2_annotate() now takes both a 'type' and an
annotation but it's not without complexity:

  * We're extremely short on bits when endoding the guest gfn + handle.
    The gfn can be 40 bits with LPA2 and 4k pages, so with the 16-bit
    handle and a 4-bit type, that leaves only 3 bits for the owner.

  * Non-zero invalid ptes are 'counted', so I've had to adjust the
    reclaim path to map pages back into the host immediately rather than
    go via a typed annotation.

Despite that, I think it's a slight improvement for now. We may end up
revisiting it if we want to squeeze more bits out of the host
annotations, but I'll include it in v2 for you to have a look at.

Will

