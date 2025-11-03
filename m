Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497D2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j33smVISVrnN0itzkGV4Zm4MAj8OlVMwAec9wNuydK0=; b=uFsGrxQD/9WYWlJ4H/N8Oo0CBa
	WG7Lo2Bpoea8ro5tk5goMZHhXac/0FbnKqGa7bFsOkjPD+Xn0R4fwicKFF3BavZrMLdQRu15T8PFq
	eOzEm38ygqiVgYrnyhGlXETzLMaY/fFw9Efe3tbuNGVEuL1sofstfoe2astAXoyI3YP0wwJA9x6mu
	5qdAUJwF8b7rF9B2GVFkq+pMZ5IvTgiklkQlO3NRf/culrIee7o2Ny0xaY2N6T/8opvbNxv2zmlO1
	IJFYZv+ND8X/xw04Z/dEDcSdQ/Vc6ujWvbyDHc+vmPCuShqZ80ypCuNsHreepsNn/LYP9zM141QqE
	fZKp6e5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwyC-0000000ACdL-0ffn;
	Mon, 03 Nov 2025 15:59:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwyA-0000000ACcu-0GDJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:59:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9C11D14;
	Mon,  3 Nov 2025 07:59:35 -0800 (PST)
Received: from arm.com (unknown [10.1.25.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDEAA3F694;
	Mon,  3 Nov 2025 07:59:41 -0800 (PST)
Date: Mon, 3 Nov 2025 15:59:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Aishwarya.TCV@arm.com
Subject: Re: [PATCH] mm/huge_memory: Initialise the tags of the huge zero
 folio
Message-ID: <aQjRa-Bh8J8Smgur@arm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <aQiu-hU3x5V5drHF@finisterre.sirena.org.uk>
 <aQi8dA_QpXM8XqrE@arm.com>
 <79a1f2dd-6752-426c-84c1-a38d300eb78c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79a1f2dd-6752-426c-84c1-a38d300eb78c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_075946_139492_9CE2C291 
X-CRM114-Status: GOOD (  14.26  )
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

On Mon, Nov 03, 2025 at 03:41:03PM +0100, David Hildenbrand (Red Hat) wrote:
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index d816ff44faff..125dfa6c613b 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -969,6 +969,16 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
> >   void tag_clear_highpage(struct page *page)
> >   {
> > +	/*
> > +	 * Check if MTE is supported and fall back to clear_highpage().
> > +	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
> > +	 * post_alloc_hook() will invoke tag_clear_highpage().
> > +	 */
> > +	if (!system_supports_mte()) {
> > +		clear_highpage(page);
> > +		return;
> > +	}
> 
> LGTM!

I tested it with and without MTE and it works fine.

Andrew, would you like a separate patch or are you ok with folding this
into the previous patch?

Thanks.

-- 
Catalin

