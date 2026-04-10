Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E91F44842
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtfUfxE/xs43zAAF0blVEvJBY1bTJtOfWAwYT3PoW5Y=; b=vLADDObaToDmASPBaMT3qfVHzQ
	B0KsFoqYp4D5s0ueAhMIxDI7XeE7uLVRZPfEac6iei5DlrIjL12Kxyo0kF5u6GeaNcZ9AXhwuUB79
	GzMxEYYxgFgHnYaYbEFb6x4k1gNLn+IjW5MHNRp2O5KZN0qrvZmupzKCdiXwezKC3hOV52VqvM4Pb
	j0fQC/5sqNPHuMxkLWWKNfuBdRDeq1kFkM9RuClbUyVGgDKwBBgBhOZuvgqgm+XjeDhPu+FETF5Rm
	kd27bQ/GmoKX+zEAVpDbN9HnJPaz9GSpV/qbPTB4W6Aw2zFbtYnC4dbce2twy1S08Avdx9JNyE2Vz
	fqANtfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBASe-0000000C70i-35wr;
	Fri, 10 Apr 2026 11:55:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBASd-0000000C70H-1GLG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 11:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3DE4D60154;
	Fri, 10 Apr 2026 11:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D0DC19421;
	Fri, 10 Apr 2026 11:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775822141;
	bh=HFVNSZ9NdLshs/GF0kF4F3nn6TItzP93pKQuOnmZi4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOZIcHOx8RMyGXKW+908tLqShReyx8UHYG4egkJqVAZkly0v7p33q4UAay3LeO2Li
	 909+KGhspCpoLhKu/yYX4lgd1bQD8j7huO7QANJEMGOMwOID5qf6JimIdEMuVtAFjW
	 +GhHAia+VOlJjk1lkx7+BsR28wl1z47Ab6wp84ECDq4Ne2+EnT+emA7hhb4J+2rLry
	 YlaUbwErfT9kQccM/Jz2U8uBuxnxtjdRSVkHLVeVUEjGqnHrocrFlrDSa/ozdtHXtC
	 EO3nFkJuqdofrp1T2VseMnr7Gmf0zpuJ+5ds4RjmrJ4HjFgZMtXk4qr1svT4RRSevK
	 SKvQh+S8cISDQ==
Date: Fri, 10 Apr 2026 12:55:31 +0100
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
Message-ID: <adjkCOiLgZ_-zovg@lucifer>
References: <20260402181326.3107102-1-usama.arif@linux.dev>
 <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <803a0c15-0a6a-4c00-b6b3-eaae56d5fc15@linux.dev>
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

On Fri, Apr 10, 2026 at 12:03:03PM +0100, Usama Arif wrote:
>
>
> On 02/04/2026 19:08, Usama Arif wrote:
> > v2 -> v3: https://lore.kernel.org/all/20260320140315.979307-1-usama.arif@linux.dev/
> > - Take into account READ_ONLY_THP_FOR_FS for elf alignment by aligning
> >   to HPAGE_PMD_SIZE limited to 2M (Rui)
> > - Reviewed-by tags for patch 1 from Kiryl and Jan
> > - Remove preferred_exec_order() (Jan)
> > - Change ra->order to HPAGE_PMD_ORDER if vma_pages(vma) >= HPAGE_PMD_NR
> >   otherwise use exec_folio_order() with gfp &= ~__GFP_RECLAIM for
> >   do_sync_mmap_readahead().
> > - Change exec_folio_order() to return 2M (cont-pte size) for 64K base
> >   page size for arm64.
> > - remove bprm->file NULL check (Matthew)
> > - Change filp to file (Matthew)
> > - Improve checking of p_vaddr and p_vaddr (Rui and Matthew)
> >
>
> Hello!
>
> Just wanted to check if there was any feedback/review on the latest
> revision?

It's -rc7, this is definitely something for next cycle :)

On my part, my upstream bandwidth has drastically reduced, and review is
probably going to have to be a hobbyist thing at least for now.

Also, not to be mean but:

$ git log -E -i --grep "(Reviewed|Acked)-by: Usama Arif" --oneline | wc -l
21

So... :)

Review in mm is very lop-sided, let's try to balance it out a bit!

>
> Thanks!
>

Thanks, Lorenzo

