Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F302CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 06:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC8ycInTVWa80ivQlmiFJsfkdHS3LZShZCSRnJHPAlA=; b=BJqHSke79+4yrXTn948RmZj6dL
	+3z91NZJqw3ygZ0BS3V/T2eoorWMXqPWa5CgkylD2KtrZoQUu50/gQjy5vxAKXSpbOkEd/S9Z2Ur9
	DuQqFCl6u+RWnvNbGOnDe5lAJ7yuWQ80DzfEyPhRh/qFr2hSmEXTGnbG62nDpqg7+8dYyZBwVIJ4t
	KGsLhVprCfon/LdMTlaLZS8QfFMoDLvg+fAi7ldqtCHXB3q0HEHpQc+L0XSouEsYMvVPoj/WYGuOR
	qGjHWKZCCujVEBebCAMlKVDciC8zI4YywAxlR7k6otL4VogoE4mcUUDBkoh02WtR42KB8paavCTDj
	wf9d1Z9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZEQ-00000008pU4-0zIK;
	Thu, 11 Jun 2026 06:49:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZEO-00000008pTv-3QSs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 06:49:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA789600AA;
	Thu, 11 Jun 2026 06:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA841F00893;
	Thu, 11 Jun 2026 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781160575;
	bh=lC8ycInTVWa80ivQlmiFJsfkdHS3LZShZCSRnJHPAlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z6SKi/fiaA2C2wYajoTbWuUo44PjNAOAJTiPHw824PI9E6pXkIHtOqCt7sirQQmdh
	 6n2RHUP8v0VHzxMFhjmcUXxCXeLWeg3HED/QenMFuJBVdQUZEmSXodSDhbXbjJxaA9
	 Oz3cxcXVtSYJD5EIR1nsweD9YH1JlSEorvZD0QiXHnUcKyDTiTrvx7r9P8CL1n/d9z
	 MSWLmlCyFlV1zXBx07Rf1aI652Yke4Gu3EhZ78CfM9cotPK/qjynEoF2P+k3bULQTF
	 7gqOsaS30CxIboAq+j7qM8/f+sqKLryS1gk8iaSLLOGohIllpuC+sVZo/9nvdTSKEj
	 xOhsMuJp8cUQA==
Date: Thu, 11 Jun 2026 09:49:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: dave.hansen@intel.com, xueyuan.chen21@gmail.com,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	hpa@zytor.com, david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	yang@os.amperecomputing.com, jannh@google.com
Subject: Re: [RFC PATCH v2 1/3] mm/huge_memory: make persistent huge zero
 folio read-only
Message-ID: <aipacpSZrO1DKooO@kernel.org>
References: <930d9121-9176-4a7b-a2d7-8224f94000d3@intel.com>
 <20260610032022.23361-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610032022.23361-1-lance.yang@linux.dev>
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

Hi,

On Wed, Jun 10, 2026 at 11:20:22AM +0800, Lance Yang wrote:
> Hi Dave,
> 
> Thanks for taking the time to review.
> 
> On Tue, Jun 09, 2026 at 12:33:36PM -0700, Dave Hansen wrote:
> >On 6/9/26 07:37, Xueyuan Chen wrote:
> >> +bool __weak arch_make_pages_readonly(struct page *page, int nr_pages)
> >> +{
> >> +	return false;
> >> +}
> >
> >This is a rather wonky function. It's going to cause all kinds of fun if
> >it is used like this:
> >
> >	arch_make_pages_readonly(syscall_table, 1);
> 
> Ouch, yeah, it is ...

We already have set_direct_map* APIs, why don't you add a new one there?
set_direct_map_ro() for example.
 
> >It's also kinda weird to have it return a bool, and not check that bool
> >at the single call site. Some things come to mind:
> >
> >1. This function needs commenting. It needs to say what it does, when
> >   architectures should override it and what their implementations
> >   should look like. It needs to be clear that this can't be used for
> >   anything really important. What should architectures do with alias
> >   mappings? Are they allowed to touch non-direct map aliases? Are they
> >   required to?
> 
> Agreed. Needs a real comment ...
> 
> Just meant as a best-effort direct/linear-map permission chang, nothing
> stronger than that. I should spell out what happens, or does not happen,
> to non-direct-map aliases, if anything, and make clear callers cannot
> treat this as a hard guarantee :D

It's not only about highmem, anything that changes the direct map might
fail to allocate memory when splitting larger mappings.
 
> >2. The return type needs to be reconsidered. Is 'bool' even acceptable?
> >   Should it just be 'void' if callers can't do anything when it fails?
> 
> Maybe ignoring it is OK now, but someone may need the return value later?
> 
> >3. What should the naming be? "readonly" vs "ro". Should it have a
> >   "maybe" since it's kinda optional?
> 
> Fair point. "make" may be overstating it a bit ...
> 
> With a return value, arch_try_make_pages_readonly() sounds about right
> to me. If we end up with void and pure best-effort semantics, maybe
> arch_maybe_make_pages_readonly() fits better :)

Realistically, I wouldn't expect 32-bit configs to enable
PERSISTENT_HUGE_ZERO_FOLIO or even THP, so naming this function to reflect
32-bit behaviour seems odd going forward.
 
> >4. Should this new API be folio or page-based in the first place?
> 
> For page vs folio, I was mostly following David's RFC v1 suggestion.
> 
> Current caller is a folio, sure, but the page-range helper leaves room
> for non-folio users later. Happy to add a simple folio wrapper if that
> reads better ;)
> 
> >5. Is mm/huge_memory.c the right place to define a generic mm function,
> >   even a stub?
> 
> Ah, you're right! My bad, wrong place for a generic stub. Will move it
> out for RFC v3.

We have include/linux/set_memory.h for such function declarations and their
stubs.
 
> Thanks, Lance
> 

-- 
Sincerely yours,
Mike.

