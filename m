Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23EFCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWIr4MBWXFvB87XL0FdioP0FNTIlJtiR/wiwlQFXNPk=; b=jwkQLeSYinb44Fj+NumlJ6v+De
	1p/Qq8R5GhQ9pZvbm3oT028BwwI5mrbZXmW+7kGV+mCSMi6gTRmDrBzc24umWyuY8D0KnIiObkEjv
	pgdjfyUdUXarPh4kAtIMtJzBYfh/T5qj6rknPqVaIg0nTFkhc6FUeMd8DGw9sndjFq/FnDWPX1xhY
	zQz3pB2JA7Ig30oOKpW3B/aVIamzTiDLcG3z4LkJKoW8NK18YijYI8/ditshQbDCFfpKtDEpoaInE
	+Lq3ygFEbR4IzxX3ncrLNY5F63QWp0r47n0OVsL/Cw6G7ffrFUPmnTbmmMQCQkRLPqWvptInvNzXO
	+Wat4sHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJxE-00000001Y5z-2UfJ;
	Tue, 19 May 2026 12:53:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJxD-00000001Y5g-1Ss0;
	Tue, 19 May 2026 12:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C9E860210;
	Tue, 19 May 2026 12:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C81C2BCB3;
	Tue, 19 May 2026 12:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779195226;
	bh=TWIr4MBWXFvB87XL0FdioP0FNTIlJtiR/wiwlQFXNPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLI0FZjwvoL5JToMb00i26zGbDKR5eFTRY9x7LCaeGUN+sYUX8fzz+RnEI5gPwclG
	 94gIHQBg5cOT7eMp2oQzs8eGOxkU1JO1Kcb+sxUNWdlfQYLhFP9l/TwBAiy20kt84O
	 II+rfpB4Co8rMtxuvCVJIOREAlO6IJ8YUAuKE7eYLlErSw63NgBTZSC12q0IgIdIFV
	 yyM5qbUtJcli+VfLGIS8ETLLylKZavBDZX7hHEAiuwPsjuPIavN0UPjxGKNCNPRKJl
	 BlwtrnFUq9/ePp3NnvDShqo/+UYXBFU69SGJ0VF2IQoRPjHMIREZ4zRu4MIgZ6ZSoW
	 N/xrCUg0I4CsA==
Date: Tue, 19 May 2026 13:53:36 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de, 
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com, kunwu.chan@gmail.com, 
	liyangouwen1@oppo.com, chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <agxbq1TxJdniMQT3@lucifer>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
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

On Mon, May 18, 2026 at 12:56:59PM -0700, Suren Baghdasaryan wrote:

> >
> > I think we either need to fix `fork()`, or keep the current
> > behavior of dropping the VMA lock before performing I/O.
>
> I see. So, this problem arises from the fact that we are changing the
> pagefaults requiring I/O operation to hold VMA lock...
> And you want to lock VMA on fork only if vma_is_anonymous(vma) ||
> is_cow_mapping(vma->vm_flags). So, we will be blocking page faults for
> anonymous and COW VMAs only while holding mmap_write_lock, preventing
> any VMA modification. On the surface, that looks ok to me but I might
> be missing some corner cases. If nobody sees any obvious issues, I
> think it's worth a try.

Not sure if you noticed but I did raise concerns ;)

I wonder if you've confused the fault path and fork here, as I think Barry has
been a little unclear on that.

What's being suggested in this thread is to fundamentally change fork behaviour
so it's different from the entire history of the kernel (or - presumably - at
least recent history :) and permit concurrent page faults to occur on a forking
process.

I absolutely object to this for being pretty crazy. I mean I'm not sure we
really want to be simultaneously modifying page tables while invoking
copy_page_range()? No?

OK you cover anon and MAP_PRIVATE file-backed but hang on there's
VM_COPY_ON_FORK too.. so PFN mapped, mixed map and (the accursed) UFFD W/P as
well as possibly-guard region containing VMAs now can have page tables raced.

That's not to mention anything else that relies on serialisation here (this
would be changing how forking has been done in general) that we may or may not
know about.

The risk level is high, for what amounts to a hack to work around the fault
issue.

I suggest that if we have a problem with the fault path, let's look at the fault
path :)

So yeah I'm very opposed to this unless I'm somehow horribly mistaken here or a
very convincing argument is made.


>
>
>
>
> >
> > >
> > > I'd also like to get Suren's input, however.
> >
> > Yes. of course.
> >
> > >
> > > Thanks, Lorenzo
> >
> > Best Regards
> > Barry

Cheers, Lorenzo

