Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3CFECD994
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw3PrSiEzyr4U3dwUrPPxGu06OkrTvRCG8lG608PLH0=; b=GKFx9H1Mrdzh6t6oD7Onp/OE7n
	hTIhlslmdp0XMyEwd6qkK6nOY7qv4lxPt9PngQ44ZqRapy7jHH/kJCZYUD6nq/c85MEapcHpeAbUy
	5DkGvmTowOaCMiu8I5QAq6ky5qcbnA2ud5r0ZAaVnLefQHDRyEVyMY3x/nzxYoJRP7HfpdG+jP/9I
	4yhSLjg0EXDPULYodc45VLBfVae+gq9uq9moDevbKilcL4eiavuv2iKQshz5YrYEw6QaedRzI4Mk+
	LmHUsCQVd64qp7NZd+nMflHaAqFNPbs04RB2IvfaK61EodAEvlvToRiRIW829NDBvoMDy62KBmvgN
	sf99NKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3H0-0000000AIsv-2TVt;
	Thu, 05 Feb 2026 17:36:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Gx-0000000AIqh-1W1q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 17:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C936B600AD;
	Thu,  5 Feb 2026 17:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE63C116D0;
	Thu,  5 Feb 2026 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770312966;
	bh=ZzYwZ9aeHMDagYomufrx0l2pFxITK8eMYatS6zmJveg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohjzoPaAoHaZqWla6zDANFVs570eMbvYSS2IqUyPPBr0e3GNtN8+Ep2it7mqcj1Ni
	 k0im7ADRSHJ23txkpXSJBM3N2ENwS/aAs+iPk0eaFtYwv993i5ztRJwYY2/cmr2rTg
	 Prznp4J3JWGeRoR2fhR577n5qlQb/zy/J0CnXBxPutBpl0Ixoj0p+eUicQbfDXSuKC
	 6SgmCtxhVe0vdcrhv9YvHz/oLGKzrVEWx7YDapdAooWC/3idLg+84r7PN9zztmVM7w
	 092o1Tjt/BsUBJhJaoHrwN5/1Ev/39DLfPN2ao5Z0XLeSWmzYFcM4zmQhFNjp6+qfd
	 cV7UpK2DXvAZA==
Date: Thu, 5 Feb 2026 17:36:01 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, zengheng4@huawei.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
Message-ID: <aYTVAeMm5cFnuAL7@willie-the-truck>
References: <20260130073807.99474-1-tujinjiang@huawei.com>
 <aYC6_lSm_eJeKIcn@willie-the-truck>
 <73396cda-e12c-484f-ab84-b09e7aab8bb0@huawei.com>
 <aYG-dGzR6MuPSQBK@willie-the-truck>
 <a4ee7faa-5b0d-4ffa-bc06-939d95ef7680@huawei.com>
 <aYSp0--x_QgyiUWL@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYSp0--x_QgyiUWL@arm.com>
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

On Thu, Feb 05, 2026 at 02:31:47PM +0000, Catalin Marinas wrote:
> On Thu, Feb 05, 2026 at 03:23:27PM +0800, Jinjiang Tu wrote:
> > 在 2026/2/3 17:23, Will Deacon 写道:
> > > On Tue, Feb 03, 2026 at 11:38:15AM +0800, Jinjiang Tu wrote:
> > > > 在 2026/2/2 22:55, Will Deacon 写道:
> > > > > On Fri, Jan 30, 2026 at 03:38:07PM +0800, Jinjiang Tu wrote:
> > > > > > +#define arch_mk_kernel_prot arch_mk_kernel_prot
> > > > > > +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
> > > > > > +{
> > > > > > +	ptdesc_t mem_type = pgprot_val(user_prot) & PTE_ATTRINDX_MASK;
> > > > > > +
> > > > > > +	return __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK, mem_type);
> > > > > > +}
> > > > > 
> > > > > Do we really need another arch helper here?
> [...]
> > > My point is that we already have the helper: ioremap_prot(). Just fix
> > > that for arm64 and cc the other arch maintainers if you're not sure how
> > > to fix it for them. What we don't need to do is add an additional helper.
> > 
> > ioremap_prot() may be called outside of arch/arm64 in the future, and I think
> > most of the cases will not pass a user prot to ioremap_prot().
> > 
> > generic_access_phys() is a special case, so I want to limit the modification to
> > generic_access_phys() only.
> 
> Or we can just have an ioremap_user_prot() (or some more meaningful
> name), defined by default as ioremap_prot(). It's still introducing a
> new macro though, unless we go and rename it on all architectures.

ioremap_prot() has exactly one caller outside of arch code and that is
generic_access_phys(). We should just fix the arm64 implementation of
ioremap_prot() and not introduce any new macros. If a new caller comes
along later, we can figure out what to do then. We could shout if the
prot isn't a user prot so we detect the problem.

Will

