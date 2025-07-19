Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759DBC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QC2u9RlBCECAjGy3diDciFmlt7x0wiaosNTYWdmh3G4=; b=4TKg7auTM4+gTDhHyqEPH3AD2y
	7Cxjc4lJJbqYEmbtGqZwl3NE1AhIWJ1eGZcQMcSphoj7o335NVGi/2I++VxbZwo7aORgXpHgPfP07
	tjJpBRnMy2pZaJRyH/tdp+g4GBnTaX+qhIkDFCxGgDhOQRdAobj/F56i5KmOxUMVj/eM1fpJMcQ6E
	nRyFHrgfeccve/Jv//mfHmhEtTmrtO46h6aZrCHqlHBw7Q9PgW0JJsEe92WtQsTL7Fy1c24xaGvfQ
	vEheiuVyae5givSLC++lWcvKG7ol4+GBMZYtU8VzUt/qPFS8uhczTq2FYZdzHmoSQKDPcyr+tnfjF
	LfQlxsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udH2D-0000000EjUE-48JZ;
	Sat, 19 Jul 2025 23:32:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udGzm-0000000EjN8-1zgJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 23:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53FA5601E0;
	Sat, 19 Jul 2025 23:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F61C4CEE3;
	Sat, 19 Jul 2025 23:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752967771;
	bh=hO/LlCoAUKXD6PorVjL5Z6Ylzx67dEoCrcnsSsTRAKg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=poNM6QFgW90cchwicbL3fDoe398n62/HCqHbiQfu1o2t8cd5MinUsZMkvl3FpE3jn
	 JEi5V0f0dHukg0x6m79HGSpPcuJm4PLYW2+57Jt/58Sg/5EAUl79q1TaBeW562xAzL
	 nen2+WsRLRR5S4ZjiDrfSeb9NOYsZW67heU+7TI8=
Date: Sat, 19 Jul 2025 16:29:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: david@redhat.com, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com,
 anshuman.khandual@arm.com
Subject: Re: [PATCH v4] arm64: Enable permission change on arm64 kernel
 block mappings
Message-Id: <20250719162930.f5ad0d97c880e9e1f569f9e7@linux-foundation.org>
In-Reply-To: <6e51f756-786f-4f15-a50a-73a482cc73a2@arm.com>
References: <20250703151441.60325-1-dev.jain@arm.com>
	<6e51f756-786f-4f15-a50a-73a482cc73a2@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 19 Jul 2025 19:22:20 +0530 Dev Jain <dev.jain@arm.com> wrote:

> Gentle ping
> 
> On 03/07/25 8:44 pm, Dev Jain wrote:
> > This patch paves the path to enable huge mappings in vmalloc space and
> > linear map space by default on arm64. For this we must ensure that we can
> > handle any permission games on the kernel (init_mm) pagetable. Currently,
> > __change_memory_common() uses apply_to_page_range() which does not support
> > changing permissions for block mappings. We attempt to move away from this
> > by using the pagewalk API, similar to what riscv does right now; however,
> > it is the responsibility of the caller to ensure that we do not pass a
> > range overlapping a partial block mapping or cont mapping; in such a case,
> > the system must be able to support range splitting.
> >
>
> ...
>
> >   arch/arm64/mm/pageattr.c | 155 +++++++++++++++++++++++++++++++--------
> >   include/linux/pagewalk.h |   3 +
> >   mm/pagewalk.c            |  24 ++++++
> >   3 files changed, 150 insertions(+), 32 deletions(-)

I'm assuming this is an arm patch - the pagewalk.c bits are simple.

However, I have nits!

> > --- a/mm/pagewalk.c
> > +++ b/mm/pagewalk.c
> > @@ -633,6 +633,30 @@ int walk_kernel_page_table_range(unsigned long start, unsigned long end,
> >   	return walk_pgd_range(start, end, &walk);
> >   }
> >   
> > +/*
> > + * Use this function to walk the kernel page tables locklessly. It should be
> > + * guaranteed that the caller has exclusive access over the range they are
> > + * operating on - that there should be no concurrent access, for example,
> > + * changing permissions for vmalloc objects.
> > + */

All the other function documenation in there is in kerneldoc form.

> > +int walk_kernel_page_table_range_lockless(unsigned long start, unsigned long end,
> > +		const struct mm_walk_ops *ops, void *private)
> > +{
> > +	struct mm_walk walk = {
> > +		.ops		= ops,
> > +		.mm		= &init_mm,
> > +		.private	= private,
> > +		.no_vma		= true
> > +	};
> > +
> > +	if (start >= end)
> > +		return -EINVAL;
> > +	if (!check_ops_valid(ops))
> > +		return -EINVAL;
> > +
> > +	return walk_pgd_range(start, end, &walk);
> > +}
> > +

If we were being stingy with the bytes we could wrap this in some
`#ifdef CONFIG_ARM' thing,

This is awfully similar to walk_page_range_novma().  We could combine
them in some fashion but the results would be a bit messy.

