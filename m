Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16F9C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 19:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I4xw8elqbcnzVfGASLT+oVORF2vfsaVSUSH5PVsoHA=; b=z/axIkAHj7bK6a52T6d7BYGID7
	Ebv+HH3bItssgX6VXjgYyRuqIW5dVtTRRPNOwGhFd++IeK9SO6hGsAdu5g1taAYpGQmDkWNyE/jtz
	AtCAaUrmT1IG4Zwk6wD5imIC2wfYz24mJ8fs5Ym+U8K6cR8Q0hC3uGKbiJfGIlCtwZl7T2BzQoWxB
	8PSkKukLIGydRrKR9FXSuL7jjYEKs7xIVxai6JNjhNISoFGQXcMa4nLnrdoccTK3ij/b8d2KDH4fm
	x5ZV6YzQj8GBRFg9olXyZ7sUW7NlGs3Xajbecw3oL4Hrab/R/M45wY2274nctpupv1V/tAHdfE3Td
	VcqMx31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw4IS-00000000EB5-2ihR;
	Sat, 22 Mar 2025 19:14:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw4Gm-00000000DyC-1lQT;
	Sat, 22 Mar 2025 19:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E57F436D6;
	Sat, 22 Mar 2025 19:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6FEC4CEDD;
	Sat, 22 Mar 2025 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742670751;
	bh=hd78eeVosTOd4KlACodssv3XvVVN9zb3Aq9MsxkmGP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyI4sCRhX+wu+c82pLY5Dfs7mZt0ZonmFNJOxL8M1IVxv3HYH0tgIPU22CTgpZGvb
	 yU8CbZ9/hVu7m9ofuVRiJjaeapqr3YF2RVUBClPDNcsVD8oNweJQywUYhnV9t5lf/p
	 p16YBH3vAafJN32d7BmPXS+iJbxa/ymBFNEZKMBfh2fXO8xKpsJn4LAo+QY+VmbSbL
	 pTmlAfrb43SSsx8tKqn9n99/3fsN0qFoR+dgIk9ZAONTiuE0lcI3GqGzdWqAKZNE2E
	 P2nIkP7uUBe0lMxqdGdYLrF5iKd9mkfgg1Va4uJjSSIM2lXyoFWsO9LNnOCHZ1pcoC
	 GiRSBlpr3jx1w==
Date: Sat, 22 Mar 2025 15:12:26 -0400
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org,
	robh@kernel.org, saravanak@google.com,
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org,
	tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z98Lmo50h5RboFXq@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <20250321134629.GA252045@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321134629.GA252045@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_121232_481706_727D73CD 
X-CRM114-Status: GOOD (  14.75  )
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

On Fri, Mar 21, 2025 at 10:46:29AM -0300, Jason Gunthorpe wrote:
> On Wed, Mar 19, 2025 at 06:55:44PM -0700, Changyuan Lyu wrote:
> >
> > +static void deserialize_bitmap(unsigned int order,
> > +			       struct khoser_mem_bitmap_ptr *elm)
> > +{
> > +	struct kho_mem_phys_bits *bitmap = KHOSER_LOAD_PTR(elm->bitmap);
> > +	unsigned long bit;
> > +
> > +	for_each_set_bit(bit, bitmap->preserve, PRESERVE_BITS) {
> > +		int sz = 1 << (order + PAGE_SHIFT);
> > +		phys_addr_t phys =
> > +			elm->phys_start + (bit << (order + PAGE_SHIFT));
> > +		struct page *page = phys_to_page(phys);
> > +
> > +		memblock_reserve(phys, sz);
> > +		memblock_reserved_mark_noinit(phys, sz);
> 
> Mike asked about this earlier, is it work combining runs of set bits
> to increase sz? Or is this sort of temporary pending something better
> that doesn't rely on memblock_reserve?

This hunk actually came from me. I decided to keep it simple for now and
check what are the alternatives, like moving away from memblock_reserve(),
adding a maple_tree or even something else.

> > +		page->private = order;
> 
> Can't just set the page order directly? Why use private?

Setting the order means recreating the folio the way prep_compound_page()
does. I think it's better to postpone it until the folio is requested. This
way it might run after SMP is enabled. Besides, when we start allocating
folios separately from struct page, initializing it here would be a real
issue.
 
> Jason

-- 
Sincerely yours,
Mike.

