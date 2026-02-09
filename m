Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F1EE81BA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WfBFjVA09j4luMmRorBm/nSBpM5ERPntrmJhOsTzJk=; b=atzzyWagax14hd1mBtaJv6T9lo
	Djqw+AU5JcIj9Oij1DW1f/TJaMS1lj6K4bw/Lg4e8dvpeL6b2Tzwyob23/1x6Az/LtDt8NG2268im
	NnFy6GUXK0G0K0wCNzFCE40F2oy26jnEC3cMRqgn7bXF80cLdlG83RMhZJ1dJOZ63QDCoKt2Hm3NZ
	qcrmh/XCKkOxG9xtXVAewWLWwFnTZAjC/wRH/xoF4P8AjyQdpvHymZCk5y/CIxCamAEx2Q360w0eO
	rrCbWOjXtiURSeSu+22DJDrqAZCxy/1Rfbg+pfTacjL9wk34FCxblZ45VziBKdf3zlj/cNs0/p3yL
	ucctnypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPyQ-0000000FLFL-0hZU;
	Mon, 09 Feb 2026 12:02:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPyN-0000000FLEZ-2PrK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 12:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3263C44382;
	Mon,  9 Feb 2026 12:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FACC116C6;
	Mon,  9 Feb 2026 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770638554;
	bh=GxBpqi2qXXbPzWl7ejHnIMQoFh9rAVUsvwOwbYG0E1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbZ3rNX3aA8++I13QCqbGeTnbz5fH0D7y8SozLNMmlauEZy2itXUAJLgU23vsXVQx
	 3VuLwHkWF0qpOqgUcy3YpN3lQicG2IVF0J2fPEwCJjine9RdT4lUSkI+HLnFTnWykm
	 E4gQLkkp3sgchOD89mi2GGLsstXHRo5Cn4XYM+M0WbymOzGpnw839OYR7ABTW20KNY
	 Ww/gFxdLl68Q+B+28hnk+pjIMCk/dYTR7OmvOitacgLpFz9EWIw9fWP8RL6ZoiYBVX
	 PUPRVGHxpK5dbv3dEYkMKODjP+a6rVJCRdwJsMdWRw59dB3qgkmUpIUEOcHT5FI2+b
	 w2KQaTpWeFGGg==
Date: Mon, 9 Feb 2026 12:02:28 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjiang Tu <tujinjiang@huawei.com>, akpm@linux-foundation.org,
	david@kernel.org, zengheng4@huawei.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] arm64: mm: fix pass user prot to ioremap_prot in
 generic_access_phys
Message-ID: <aYnM1A-9VZaOZoC_@willie-the-truck>
References: <20260130073807.99474-1-tujinjiang@huawei.com>
 <aYC6_lSm_eJeKIcn@willie-the-truck>
 <73396cda-e12c-484f-ab84-b09e7aab8bb0@huawei.com>
 <aYG-dGzR6MuPSQBK@willie-the-truck>
 <a4ee7faa-5b0d-4ffa-bc06-939d95ef7680@huawei.com>
 <aYSp0--x_QgyiUWL@arm.com>
 <aYTVAeMm5cFnuAL7@willie-the-truck>
 <aYTgoFQjEs_5WyC-@arm.com>
 <aYXZsRpmQIb7q83D@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aYXZsRpmQIb7q83D@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_040235_709604_2C549066 
X-CRM114-Status: GOOD (  36.06  )
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

On Fri, Feb 06, 2026 at 12:08:17PM +0000, Catalin Marinas wrote:
> On Thu, Feb 05, 2026 at 06:25:36PM +0000, Catalin Marinas wrote:
> > On Thu, Feb 05, 2026 at 05:36:01PM +0000, Will Deacon wrote:
> > > On Thu, Feb 05, 2026 at 02:31:47PM +0000, Catalin Marinas wrote:
> > > > On Thu, Feb 05, 2026 at 03:23:27PM +0800, Jinjiang Tu wrote:
> > > > > 在 2026/2/3 17:23, Will Deacon 写道:
> > > > > > On Tue, Feb 03, 2026 at 11:38:15AM +0800, Jinjiang Tu wrote:
> > > > > > > 在 2026/2/2 22:55, Will Deacon 写道:
> > > > > > > > On Fri, Jan 30, 2026 at 03:38:07PM +0800, Jinjiang Tu wrote:
> > > > > > > > > +#define arch_mk_kernel_prot arch_mk_kernel_prot
> > > > > > > > > +static inline pgprot_t arch_mk_kernel_prot(pgprot_t user_prot)
> > > > > > > > > +{
> > > > > > > > > +	ptdesc_t mem_type = pgprot_val(user_prot) & PTE_ATTRINDX_MASK;
> > > > > > > > > +
> > > > > > > > > +	return __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK, mem_type);
> > > > > > > > > +}
> > > > > > > > 
> > > > > > > > Do we really need another arch helper here?
> > > > [...]
> > > > > > My point is that we already have the helper: ioremap_prot(). Just fix
> > > > > > that for arm64 and cc the other arch maintainers if you're not sure how
> > > > > > to fix it for them. What we don't need to do is add an additional helper.
> > > > > 
> > > > > ioremap_prot() may be called outside of arch/arm64 in the future, and I think
> > > > > most of the cases will not pass a user prot to ioremap_prot().
> > > > > 
> > > > > generic_access_phys() is a special case, so I want to limit the modification to
> > > > > generic_access_phys() only.
> > > > 
> > > > Or we can just have an ioremap_user_prot() (or some more meaningful
> > > > name), defined by default as ioremap_prot(). It's still introducing a
> > > > new macro though, unless we go and rename it on all architectures.
> > > 
> > > ioremap_prot() has exactly one caller outside of arch code and that is
> > > generic_access_phys(). We should just fix the arm64 implementation of
> > > ioremap_prot() and not introduce any new macros. If a new caller comes
> > > along later, we can figure out what to do then. We could shout if the
> > > prot isn't a user prot so we detect the problem.
> > 
> > I was more worried about out of tree drivers using it since it's an
> > EXPORT_SYMBOL(). We should remove the export anyway given that we have
> > only a fixed number of memory types programmed in MAIR and all have
> > corresponding ioremap wrappers already.
> > 
> > So yes, just fixing it in ioremap_prot() works for me if we also remove
> > the export, just in case there are dodgy drivers out there.
> 
> Ah, removing the export would break KMI if backported (unless GKI won't
> merge it) since all the other ioremap_* macros use ioremap_prot(). Well,
> not a problem for stable/LTS in general, just for GKI.

Upstream really shouldn't care about out-of-tree drivers or Android ABI
guarantees.

> I would still introduce a new ioremap_user_prot() to make the intent
> clearer. In its implementation we could skip the ioremap_prot_hook().

I still think this is unnecessary churn. You then end up with
ioremap_prot() having no callers outside of arch/ and if core code just
defines ioremap_user_prot() to ioremap_prot() for everybody apart from
arm64 then the intent isn't clear at all.

> For generic_access_phys(), do we even care about encrypted/decrypted
> pgprot?

Dunno.

Will

