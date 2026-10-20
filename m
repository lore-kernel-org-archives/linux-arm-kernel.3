Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B6F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B1TiSjoQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLVK4c85
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/lKKMbBLG1C3ERfK2T/2BuXrkJjvJM7GnohfMS18Rk=; b=B1TiSjoQ8fMLmK87JNDa/Pbx7X
	Cg1tksYHM4itzPlVrIqB186U0Z4m5DtsQlola+kgbQLFY+WFv+gECXwxoF40zSngT+YC7YrYwRpW6
	LVVojE19eviPuAHyOTxb2pSnhx1RJfNMOM2EbW+Q4yCiacm8S+Dcdz3caktw6rY1+NaovhCZo4BNS
	s9MHLK6vCkGmYGiO+rLBIQmGcl+hrwzJuTTf4oJ78WH49QxozKSu2Z1YYkOlSHZEgw3jnrC5+BTMu
	6+h8PIED1PUtxMWAoEYR+Nbd+kWZRWIPb0Y7wXNPaMqTd5pdzSWw7xxmEVD/t/o+DoCcskzZxx/83
	05uBDSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9i1-00000009lR4-3iE8;
	Tue, 20 Oct 2026 13:16:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9i0-00000009lQb-0PaX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:16:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6822660052;
	Tue, 20 Oct 2026 13:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16301F000C4;
	Tue, 20 Oct 2026 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502211;
	bh=I/lKKMbBLG1C3ERfK2T/2BuXrkJjvJM7GnohfMS18Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BLVK4c85jEpKcBasUz9BxREf/MNa9QY55Ld7dqoCHZl6DnHhQhhQYw0KIrGl5qVL5
	 /TSml8VG2zattBjDFMfQ7wZ/zQP5ycJjLH/5LIlK7vJcmg9FkRNRNNN+O9knSI877l
	 YeJ0rEr7MWFVBpVsy3PBM4whHdUAf9nMUgr3EYiEEzkjMtRy3jHyp1v7wsGZrlJkWZ
	 tGE+oASF13ed3kA7O1bJsmNe0sMvoFmpyFxj9M7l/fR2STdGQB00eVz6qAAEqVjI5J
	 6rXhZM7+PwMlQ2/e6LQgWVhUxqymtohoEeeXgrv8YYtN/jjVFIWV4L6T9E63s5wnxL
	 DBMNhMz1mEutw==
Date: Tue, 20 Oct 2026 14:16:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Price <steven.price@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, David Hildenbrand <david@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
Message-ID: <atdoknSMviv1xdqd@gremlin>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-2-fuad.tabba@linux.dev>
 <atdUzfOA1Obd7Mir@gremlin>
 <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 02:09:45PM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Tue, 20 Oct 2026 12:52:54 +0100, Lorenzo Stoakes (ARM)
> <ljs@kernel.org> wrote:
> [...]
> > On Mon, Oct 19, 2026 at 02:21:01PM +0100, Fuad Tabba wrote:
> > > sanitise_mte_tags() clears the tags of the pages about to be mapped at
> > > stage-2 before marking them tagged. For a hugetlb folio the flag covers
> > > every page in the folio, but the loop only covers the mapping being
> > > installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
> > > sizes, and for any size under dirty logging. The first fault then marks
> > > the whole folio after clearing only its own piece, and the rest keeps
> > > its previous owner's tags for the guest to read.
> >
> > I'm guessing the folio size is always >= size here?
>
> Yes, the stage-2 mapping of a hugetlb VMA is never larger than its
> hugetlb page size, so it always sits within one folio.

OK good! :)

>
> [...]
> > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> [...]
> > > @@ -1514,7 +1514,8 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
> > >          if (folio_test_hugetlb(folio)) {
> > >                  /* Hugetlb has MTE flags set on head page only */
> >
> > Is this comment redundant now?
>
> I'd keep it: it's why the whole folio has to be cleared, as the flags
> on the head page cover every page in it.

OK, but there's an inconsistency between the comments in 1/3 and 2/3 (you update
one in 2/3 to reflect what's happening), so maybe worth having the comment from
2/3 on both, rather than this one?

(the PG_arch1,2,3 flags are folio flags unless there's something weird so it's
sort of redundant I think?)

>
> > >                  if (folio_try_hugetlb_mte_tagging(folio)) {
> > > -                        for (i = 0; i < nr_pages; i++, page++)
> > > +                        page = folio_page(folio, 0);
> > > +                        for (i = 0; i < folio_nr_pages(folio); i++, page++)
> >
> > I know it's a stable fix, but the fact that this pattern exists in multiple
> > places really argues for a mte_clear_folio_tags(), which would make this
> > trivially:
> >
> >         mte_clear_folio_tags(folio);
> >
> > And avoid the re-use of page etc.
> >
> > It's not a huge change and makes the next patch in the series simpler too so
> > arguably could be part of the series?
>
> I think you're right about the helper, but I'd rather keep the fixes
> as small as possible for the backports. I'll send
> mte_clear_folio_tags() as a separate patch on top of these, using it
> in mte_sync_tags() too. In v2 the loop uses folio_page(folio, i)
> rather than reusing page.

Sure makes sense, though honestly I think the duplication there means delta of
lines of code is small. But then again, adding a helper in a Fixes: is iffy
itself so fair enough :)

--
Cheers, Lorenzo

