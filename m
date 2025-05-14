Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B58C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ll+1KlJ6Ve7Scmxx4WaDVmhcu7tXxe9qh9BO4HCNlIE=; b=MNqv7cSY1RV9XcJ1aVcAqarAYi
	lmFCyex+MqANoHTNlHeTmCxrYftL/HTIwwDFqGXGlZlyJCYEvU9zRI3pnzXu20wOjmFpWeuV9jcR9
	esxh9zCE58VLsY8gOgK695MRUvgCRbHOxsESTsJjiAh1J5wikbbYy/PwNhQueVT/UcEWs19ryBKtl
	XfBgh1QJXGEepEq++4yhFTKg2bVQoEueJU+fqzHDFLpVjxB9IP7fFiNbMZpc1/V5Q9D16WpJPNZzi
	neafgFmoP0zM7qrcix/1d3atyoRiFUVfbJVgRmsCRL9CG2VGunllhxALGau5i/zAyQL/ATi6d1LNo
	rhINSfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBQ-0000000Ftkb-2Lzg;
	Wed, 14 May 2025 17:46:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDo8-0000000FXqC-240c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AE405C1017;
	Wed, 14 May 2025 15:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB88C4CEE3;
	Wed, 14 May 2025 15:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235647;
	bh=ASy4XXDUZ+XqgKJMKMfMraYghZijkdij/uWWZG56WI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qde/O+A4Int0tYt4EQwVneuXsRQr1YUBRqt7rxRMlvMEWAJba/NBWkoZqkNIgIebj
	 9S0lhDyh8DffOLN0Qy+hBivOJB2moQtFdeamW2PvJQAbIwCSONv0pmYxMS7J7dRtxg
	 fFSCY3LP0kcoKl+3Afu/mO2T6+9zfnKuLAixYUcjkzJs3N4z57CdVxf9dcKKtk58iY
	 PeQ1oLnGtJpLI1gPyy93GClLSVtFJJ6iTkuvAsghIQ4OMvusPwQMhN7IRQUuKhNbR0
	 FS0eCeyHMXbNNc0jk1gQmvfkg7n0joHw80vdo1QDSRvZ4jCSzBhPWo9JW4xwPO6QUs
	 9AcK7XSRN/Xpw==
Date: Wed, 14 May 2025 16:14:01 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kalesh Singh <kaleshsingh@google.com>, Zi Yan <ziy@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v4 5/5] mm/filemap: Allow arch to request folio size
 for exec memory
Message-ID: <20250514151400.GB10762@willie-the-truck>
References: <20250430145920.3748738-1-ryan.roberts@arm.com>
 <20250430145920.3748738-6-ryan.roberts@arm.com>
 <20250509135223.GB5707@willie-the-truck>
 <c52861ac-9622-4d4f-899e-3a759f04af12@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c52861ac-9622-4d4f-899e-3a759f04af12@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081408_614561_861A7772 
X-CRM114-Status: GOOD (  22.56  )
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

On Tue, May 13, 2025 at 01:46:06PM +0100, Ryan Roberts wrote:
> On 09/05/2025 14:52, Will Deacon wrote:
> > On Wed, Apr 30, 2025 at 03:59:18PM +0100, Ryan Roberts wrote:
> >> diff --git a/mm/filemap.c b/mm/filemap.c
> >> index e61f374068d4..37fe4a55c00d 100644
> >> --- a/mm/filemap.c
> >> +++ b/mm/filemap.c
> >> @@ -3252,14 +3252,40 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
> >>  	if (mmap_miss > MMAP_LOTSAMISS)
> >>  		return fpin;
> >>  
> >> -	/*
> >> -	 * mmap read-around
> >> -	 */
> >>  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> >> -	ra->start = max_t(long, 0, vmf->pgoff - ra->ra_pages / 2);
> >> -	ra->size = ra->ra_pages;
> >> -	ra->async_size = ra->ra_pages / 4;
> >> -	ra->order = 0;
> >> +	if (vm_flags & VM_EXEC) {
> >> +		/*
> >> +		 * Allow arch to request a preferred minimum folio order for
> >> +		 * executable memory. This can often be beneficial to
> >> +		 * performance if (e.g.) arm64 can contpte-map the folio.
> >> +		 * Executable memory rarely benefits from readahead, due to its
> >> +		 * random access nature, so set async_size to 0.
> > 
> > In light of this observation (about randomness of instruction fetch), do
> > you think it's worth ignoring VM_RAND_READ for VM_EXEC?
> 
> Hmm, yeah that makes sense. Something like:
> 
> ---8<---
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 7b90cbeb4a1a..6c8bf5116c54 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3233,7 +3233,8 @@ static struct file *do_sync_mmap_readahead(struct vm_fault
> *vmf)
>         if (!ra->ra_pages)
>                 return fpin;
> 
> -       if (vm_flags & VM_SEQ_READ) {
> +       /* VM_EXEC case below is already intended for random access */
> +       if ((vm_flags & (VM_SEQ_READ | VM_EXEC)) == VM_SEQ_READ) {
>                 fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>                 page_cache_sync_ra(&ractl, ra->ra_pages);
>                 return fpin;
> ---8<---

I was thinking about the:

	if (vm_flags & VM_RAND_READ)
		return fpin;

code above this which bails if VM_RAND_READ is set. That seems contrary
to the code you're adding which says that, even for random access
patterns where readahead doesn't help, it's still worth sizing the folio
appropriately for contpte mappings.

Will

