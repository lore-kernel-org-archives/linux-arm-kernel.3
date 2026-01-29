Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3236CD73E83
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3INMSQtU8Wzky8Kr7Ft8lggZqVbamJ6pQ3F/X+7hSrs=; b=vrRdhiJsZ9eJqcMZPyOVM/G7Yx
	Xhsz5be1NsoYp699UGnoQ9ikhHJ8/aJOjfjDdvAqf0Qg9IO2R1g0pKZQerDvblWDE4JMiE8v1Eld1
	zVfTkNpbKSz859aws4RMMCK7aFPF+dsPzwUx2gfD10Ik5cj68hJ25UNICzHWWpTf0aRv09tiwYYsj
	ofUGcIulukLFByBDN/OqDbrEVTlaupY23jDTWVoWLEsMKW3zdi9OrKoH7zstjF1OcpCEtoLsqC+Sm
	ipZbtcGkIeDflbo+lHY3h6gnRtUvQzvHzv/s6FweENmHesiAUlZ87LRW1IvFqiisCF3X1YMCWuzaf
	VSwu0CzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWf8-00000000VvZ-2uSD;
	Thu, 29 Jan 2026 18:22:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWf6-00000000VvA-0Hp0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:22:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D45C2153B;
	Thu, 29 Jan 2026 10:22:25 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 772BB3F632;
	Thu, 29 Jan 2026 10:22:30 -0800 (PST)
Date: Thu, 29 Jan 2026 18:22:27 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, will@kernel.org,
	zengheng4@huawei.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
Message-ID: <aXulY16Q16TYO06l@arm.com>
References: <20260127090129.412084-1-tujinjiang@huawei.com>
 <c78b76c5-8709-44d0-85c3-feccd41b2ddd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c78b76c5-8709-44d0-85c3-feccd41b2ddd@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_102236_176889_01B463C0 
X-CRM114-Status: GOOD (  15.89  )
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

On Wed, Jan 28, 2026 at 03:12:56PM +0800, Jinjiang Tu wrote:
> 在 2026/1/27 17:01, Jinjiang Tu 写道:
> > diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> > index 83e03abbb2ca..fe8607eafab6 100644
> > --- a/arch/arm64/include/asm/io.h
> > +++ b/arch/arm64/include/asm/io.h
> > @@ -267,6 +267,17 @@ int arm64_ioremap_prot_hook_register(const ioremap_prot_hook_t hook);
> >   #define ioremap_prot ioremap_prot
> > +#define arch_mk_kernel_prot arch_mk_kernel_prot
> > +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
> > +{
> > +	unsigned long kernel_prot_val;
> > +
> > +	kernel_prot_val = _PAGE_KERNEL & ~(PTE_WRITE | PTE_ATTRINDX_MASK);
> > +	kernel_prot_val |= pgprot_val(user_prot) & (PTE_WRITE | PTE_ATTRINDX_MASK);
> > +
> > +	return __pgprot(kernel_prot_val);
> > +}
> 
> I found I misunderstand the READ/WRITE permisson here.
> If the pte is writeale, the PTE_WRITE is 1, and PTE_RDONLY means dirty or not (With DBM).
> If the pte is read-only, the PTE_WRITE is 0, and PTE_RDONLY is 1.
> 
> Since generic_access_phys() have checked if the user can write with:
> 
> 		if ((write & FOLL_WRITE) && !pte_write(pte))
> 		return -EINVAL;
> 
> So, maybe we could always grant writable permission, just as x86's ioremap() does?

Yes, it gets tricky with the dirty/writeable bits and we may change this
in the future. We have follow_pfnmap_start() already checking the
permissions, so going for read/write access for the kernel mapping I
think makes sense. Just do something like:

	ptdesc_t mem_type = pgprot_val(user_prot) & PTE_ATTRINDX_MASK;

	return __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK, mem_type);

-- 
Catalin

