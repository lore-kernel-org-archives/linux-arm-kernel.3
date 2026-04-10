Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F12F44846
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW/7P+Q9ewTp+Nlxs63eE8WGljMMtGMjz8FRskYNhcA=; b=ICiDr2/tDy+mcUejBwe6ugJy3i
	HuGCW96Udt6iLCbQEw/4coBbw898hcQC21Cnu6RDmfT0WUMvPZyE9KN5ndiuDZ4eoYpmIRHPjcmTP
	1dMN5Siro0VdjAj0ybSbP2I2lnd2yi8TrLoeJntkSPw7gdP6mtNwySA2h4DqdEguSg51a4PrutOvr
	kmi6C1aanEeg900YiyxcooHqxbVcybylaKEFvfDts4AlAPyKqG3mmyBGmHGntYpUqO7AuGUIcKHPt
	f8qu7MEQyalFhFenv3PEb2i26FjZZpM61HaGb918US1P4Cg9qsoSZzWNaZdBD5RIB3Xw3wMNMaZwm
	UXcJctEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAUz-0000000C7BC-0gTU;
	Fri, 10 Apr 2026 11:58:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAUy-0000000C7B4-0F34
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E2316091C;
	Fri, 10 Apr 2026 11:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48805C19421;
	Fri, 10 Apr 2026 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775822286;
	bh=1IlVya3cDWf4jvwWxchg1KQjmwkbJ5Ag/jKFwWp3CvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UtHphArRe3+5ugz15PPQLf6OUxnW5LjX8Uc0gNt4yDfRrnoVH5t/QvmsRE8v8eU/G
	 sRJBY0NdCHSYQbYIZWfu2YxuJDgJoKOz6l60yejqkGC8+Mfk7oBJNHXmQ+Z21ZbNkc
	 04yw91ZIEBNPLKwXcj1PzNAqLrUBNItgu1itsAuNmxJ4ggjgvHYrDYnph59t3oeG5Y
	 tNthufSoSeozDo1o4+7hZqxC94QnPrqhFxjsqdc4Bjqw/01zMPYQrWYnXNDpU30g8e
	 UmR0k+lA0oE3rNHj4yYfHTr9q8EVyi9xhAYeMRYukwGGyalwhuE5brmODVtAu0aDgi
	 LkDH/7lAFYepg==
Date: Fri, 10 Apr 2026 12:57:56 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz, 
	ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, 
	kees@kernel.org, kevin.brodsky@arm.com, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mhocko@suse.com, npache@redhat.com, 
	pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, 
	vbabka@kernel.org, Al Viro <viro@zeniv.linux.org.uk>, ziy@nvidia.com, 
	hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev, leitao@debian.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3 0/4] mm: improve large folio readahead and alignment
 for exec memory
Message-ID: <adjllNan2vgBNBHJ@lucifer>
References: <20260402181326.3107102-1-usama.arif@linux.dev>
 <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev>
 <adjkCOiLgZ_-zovg@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjkCOiLgZ_-zovg@lucifer>
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

On Fri, Apr 10, 2026 at 12:55:42PM +0100, Lorenzo Stoakes wrote:
> On Fri, Apr 10, 2026 at 12:03:03PM +0100, Usama Arif wrote:
> >
> >
> > On 02/04/2026 19:08, Usama Arif wrote:
> > > v2 -> v3: https://lore.kernel.org/all/20260320140315.979307-1-usama.arif@linux.dev/
> > > - Take into account READ_ONLY_THP_FOR_FS for elf alignment by aligning
> > >   to HPAGE_PMD_SIZE limited to 2M (Rui)
> > > - Reviewed-by tags for patch 1 from Kiryl and Jan
> > > - Remove preferred_exec_order() (Jan)
> > > - Change ra->order to HPAGE_PMD_ORDER if vma_pages(vma) >= HPAGE_PMD_NR
> > >   otherwise use exec_folio_order() with gfp &= ~__GFP_RECLAIM for
> > >   do_sync_mmap_readahead().
> > > - Change exec_folio_order() to return 2M (cont-pte size) for 64K base
> > >   page size for arm64.
> > > - remove bprm->file NULL check (Matthew)
> > > - Change filp to file (Matthew)
> > > - Improve checking of p_vaddr and p_vaddr (Rui and Matthew)
> > >
> >
> > Hello!
> >
> > Just wanted to check if there was any feedback/review on the latest
> > revision?
>
> It's -rc7, this is definitely something for next cycle :)
>
> On my part, my upstream bandwidth has drastically reduced, and review is
> probably going to have to be a hobbyist thing at least for now.
>
> Also, not to be mean but:
>
> $ git log -E -i --grep "(Reviewed|Acked)-by: Usama Arif" --oneline | wc -l
> 21
>
> So... :)
>
> Review in mm is very lop-sided, let's try to balance it out a bit!
>
> >
> > Thanks!
> >
>
> Thanks, Lorenzo

(Note that we're in a 'quiet period' from here until -rc1 of next cycle and
won't be taking anything new until then. We plan to do this from around rc5 or
rc6 of each cycle in future).

