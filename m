Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4105ECD992
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 18:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNmwi1z8jZDjnrZLEVDb5PYedyOIG7zSKo+esztDpAw=; b=pcFjJhWdGo0PsQtosJATmR/lpC
	5Z6MdWwx1XqiK5w/kX8FtMdOo7pN61KdMn/r/I2VyGq6QQQ3zyEin6OlnKymEF5+eiAYImx1lt8TZ
	BHrGGLzOmrqQTeDPydRJ2FXoL9F42epGKE68LgyTZpzYuqj+SH8LysD1XwWuSPuDLnR8EKcJkvWiB
	h+N3yLb6U+CRSwElnPtgCaV/49ZXxHvnHeLfizTg+9IS8xyFQvVDx+u6b3yQHZPnK7V1dJsh8ISu4
	QXma9YcDxzbq49Aud06CmJuMk0T9uqIXvNsp4rLnokGfKKqa/+Bk+PPkBIbfNCPHp0UhAYvNXs6nY
	Vq0YiUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo42z-0000000AMXi-3AQt;
	Thu, 05 Feb 2026 18:25:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo42w-0000000AMWv-3Onh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 18:25:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7851A339;
	Thu,  5 Feb 2026 10:25:34 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 037653F632;
	Thu,  5 Feb 2026 10:25:38 -0800 (PST)
Date: Thu, 5 Feb 2026 18:25:36 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, zengheng4@huawei.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
Message-ID: <aYTgoFQjEs_5WyC-@arm.com>
References: <20260130073807.99474-1-tujinjiang@huawei.com>
 <aYC6_lSm_eJeKIcn@willie-the-truck>
 <73396cda-e12c-484f-ab84-b09e7aab8bb0@huawei.com>
 <aYG-dGzR6MuPSQBK@willie-the-truck>
 <a4ee7faa-5b0d-4ffa-bc06-939d95ef7680@huawei.com>
 <aYSp0--x_QgyiUWL@arm.com>
 <aYTVAeMm5cFnuAL7@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYTVAeMm5cFnuAL7@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_102542_882401_04E4922A 
X-CRM114-Status: GOOD (  29.13  )
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

On Thu, Feb 05, 2026 at 05:36:01PM +0000, Will Deacon wrote:
> On Thu, Feb 05, 2026 at 02:31:47PM +0000, Catalin Marinas wrote:
> > On Thu, Feb 05, 2026 at 03:23:27PM +0800, Jinjiang Tu wrote:
> > > 在 2026/2/3 17:23, Will Deacon 写道:
> > > > On Tue, Feb 03, 2026 at 11:38:15AM +0800, Jinjiang Tu wrote:
> > > > > 在 2026/2/2 22:55, Will Deacon 写道:
> > > > > > On Fri, Jan 30, 2026 at 03:38:07PM +0800, Jinjiang Tu wrote:
> > > > > > > +#define arch_mk_kernel_prot arch_mk_kernel_prot
> > > > > > > +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
> > > > > > > +{
> > > > > > > +	ptdesc_t mem_type = pgprot_val(user_prot) & PTE_ATTRINDX_MASK;
> > > > > > > +
> > > > > > > +	return __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK, mem_type);
> > > > > > > +}
> > > > > > 
> > > > > > Do we really need another arch helper here?
> > [...]
> > > > My point is that we already have the helper: ioremap_prot(). Just fix
> > > > that for arm64 and cc the other arch maintainers if you're not sure how
> > > > to fix it for them. What we don't need to do is add an additional helper.
> > > 
> > > ioremap_prot() may be called outside of arch/arm64 in the future, and I think
> > > most of the cases will not pass a user prot to ioremap_prot().
> > > 
> > > generic_access_phys() is a special case, so I want to limit the modification to
> > > generic_access_phys() only.
> > 
> > Or we can just have an ioremap_user_prot() (or some more meaningful
> > name), defined by default as ioremap_prot(). It's still introducing a
> > new macro though, unless we go and rename it on all architectures.
> 
> ioremap_prot() has exactly one caller outside of arch code and that is
> generic_access_phys(). We should just fix the arm64 implementation of
> ioremap_prot() and not introduce any new macros. If a new caller comes
> along later, we can figure out what to do then. We could shout if the
> prot isn't a user prot so we detect the problem.

I was more worried about out of tree drivers using it since it's an
EXPORT_SYMBOL(). We should remove the export anyway given that we have
only a fixed number of memory types programmed in MAIR and all have
corresponding ioremap wrappers already.

So yes, just fixing it in ioremap_prot() works for me if we also remove
the export, just in case there are dodgy drivers out there.

-- 
Catalin

