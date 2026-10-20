Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A812D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jDNvUr+H;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zvp3kpCL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUAeRgbmHYJ9C+mDpvtxIRPjXTbjGx5SuGL9roQvzK0=; b=jDNvUr+Hz/ESx6o9xZkZQDCJ8M
	z4ISXLaoka7Hz1gqVSdDpNeYUxyGmbPc4AN+y9p0tpRn2LcCClfRXdXWQ2GacPwc2AtQirLNELqiz
	jSKHLWgapB1+O07mLpIqNozCJrvkxxXYy6vrv7rFdZ0sFxNBYr3SNojUFnuOmNfFH5b9lK9N8LMMf
	RMQOJ8Fph5itkfPbqanTHGnvuugYB2JYGxQVYe2A1UHeGrHtWjvrGjpM8f0VnOkF5E9qDM8IwC1KZ
	7gnh7aB4iLgBXyWR4+EcqKKZeXe2/9MvSgiseb0xpO1ASoQ8JtpQ4FbDAF2IyqN+WfKUE9z17qreI
	HnotZQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9im-00000009leu-3A5U;
	Tue, 20 Oct 2026 13:17:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9il-00000009lef-1P3F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:17:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BF9241249;
	Tue, 20 Oct 2026 13:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29111F000C4;
	Tue, 20 Oct 2026 13:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502259;
	bh=gUAeRgbmHYJ9C+mDpvtxIRPjXTbjGx5SuGL9roQvzK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zvp3kpCLVvGB8ZOTuW3HVZ8PQvuUuEuMQwPUlnGBdvwb61ASqkxJyi/1LIRpzHkxT
	 U5RTDX0MiQwkj6AiuhNPmZ9RMGjh7tcChNPfJ+/kBgjevNURE189XwZJzsxCZoJYqB
	 dUpyW0E/TOa7tRhYG1Vbl4BaQePJtbTFvKQlCLM7YRUIpnfb+JlMV2wYyVFx80y5jw
	 /6pSY5VHwJCp3hLOM9y6jCcZAo48PpFgBPrufObDb/bZrhti/5Rx8jHW3gYvPdsa8y
	 D2tVYgF2mtmuJxiUjdmIkR3Es/iijAD1TfQU49qenXLgwDyeI1kOD1fA6PdD+Huuuv
	 PJ/d9Dk0qEllg==
Date: Tue, 20 Oct 2026 14:17:32 +0100
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
Subject: Re: [PATCH 2/3] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
Message-ID: <atdp3mclSi-Cc5FK@gremlin>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-3-fuad.tabba@linux.dev>
 <atdWIpk9Qh8ngs-Y@gremlin>
 <CA+EHjTwb9V+12siUswmUX0-jr=sidKdAJ+vht+HyqS0KgA6v6g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwb9V+12siUswmUX0-jr=sidKdAJ+vht+HyqS0KgA6v6g@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 02:11:11PM +0100, Fuad Tabba wrote:

> > > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> > > @@ -1042,12 +1043,14 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> > > -                        if (folio_test_hugetlb(folio))
> > > -                                folio_try_hugetlb_mte_tagging(folio);
> > > -                        else
> > > +                        if (!folio_test_hugetlb(folio))
> > >                                  try_page_mte_tagging(page);
> > > +                        else if (folio_try_hugetlb_mte_tagging(folio))
> >
> > Slightly awkward logic, testing a negative then the negative of the negative
> > (i.e. else) plus folio_try_hugetlb_mte_tagging(), makes it a little harder to
> > understand.
> >
> > With mte_clear_folio_tags() you can make life simpler:
> >
> >         if (folio_test_hugetlb(folio)) {
> >                 if (folio_try_hugetlb_mte_tagging(folio))
> >                         mte_clear_folio_tags(folio);
> >         } else {
> >                 try_page_mte_tagging(page);
> >         }
>
> Without the helper, the extra level of nesting takes the loop body
> past 100 columns, so I'll switch to your version in the separate patch
> that adds mte_clear_folio_tags() (see 1/3).

Ack makes sense, thanks!

--
Cheers, Lorenzo

