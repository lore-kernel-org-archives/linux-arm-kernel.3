Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6C710987A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0ttI541UQY84WArzRfOEWNiNuBFeazGDrQAgFDGq44=; b=YeaE/yoX7YuxLUWLYwca9N6Fdu
	JJY24iLcrxp6OszCUF9HUO9ocwE+n49KaRsgSITRfqj2TDosi/wJ3MUmwtRT9LsjhY+w9MVt9m9nM
	qvKc43eP/KyaA5KJytv+H6iEsWE/+L5f9KCxFOydRKJ7k7iV4DogCmYFz53WsTrFR/nJPCgTDJls2
	xWW3TjlK1H8ywI2fLcqmYBdXdsCLIgjbTx5ER/ZKIjKJtcG7wJkgadn62iUg9bfiMiotFfEK0EZZD
	7eTIqKE+Jxuylvlxiuzv1mcBGjEblIoUeRAseJxFCgRU6W+NEOBmYzd0TeyQi434BOrmtEXgGGd0s
	uk1KQWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cFE-0000000D4gl-461r;
	Fri, 20 Mar 2026 15:58:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cFE-0000000D4gd-0YC6
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 15:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=e0ttI541UQY84WArzRfOEWNiNuBFeazGDrQAgFDGq44=; b=M3L209EmfHhmhx8qXXSa3pll7+
	UWQpI0rPR5iUZxltAVuV53KVp8vgAVRpSTE5EYYh5kFJDTe+TiMPaeTD0IAVZO2s6+tz3tpomEkG1
	xNDpU9byINpbXVjau0BeY+o7fIMw7Dt9gO+cp/uY+yZAQXwC/STkijtxRTq5klqUtwGIfeOmrjjvQ
	z4JJ5ud+P6oY4/5472KsnT0vk2Xg1XTwqJ53ybDJAxhYJFlzLCinx/dVDR1QJfAZTYCkWJHozpoFj
	FLkiuEv+Pv4EKGdopZ3E56HXZi9Bn7GKrbgGrkBjnTRU/CS62KWOFDFTOc1UzIKP7CFxLG1q/S+yp
	QYz3oMvA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cF7-000000080Fh-2VkZ;
	Fri, 20 Mar 2026 15:58:33 +0000
Date: Fri, 20 Mar 2026 15:58:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
	ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz,
	ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, brauner@kernel.org,
	catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org,
	kevin.brodsky@arm.com, lance.yang@linux.dev,
	Liam.Howlett@oracle.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, npache@redhat.com,
	pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org,
	surenb@google.com, vbabka@kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@kvack.org,
	ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org,
	shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE
 coalescing
Message-ID: <ab1uqdcMBP1cBr7Q@casper.infradead.org>
References: <20260320140315.979307-1-usama.arif@linux.dev>
 <20260320140315.979307-4-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320140315.979307-4-usama.arif@linux.dev>
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

On Fri, Mar 20, 2026 at 06:58:53AM -0700, Usama Arif wrote:
> -static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr)
> +static unsigned long maximum_alignment(struct elf_phdr *cmds, int nr,
> +				       struct file *filp)
>  {
>  	unsigned long alignment = 0;
> +	unsigned long max_folio_size = PAGE_SIZE;
>  	int i;
>  
> +	if (filp && filp->f_mapping)
> +		max_folio_size = mapping_max_folio_size(filp->f_mapping);

Under what circumstances can bprm->file be NULL?

Also we tend to prefer the name "file" rather than "filp" for new code
(yes, there's a lot of old code out there).

> +
> +			/*
> +			 * Try to align the binary to the largest folio
> +			 * size that the page cache supports, so the
> +			 * hardware can coalesce PTEs (e.g. arm64
> +			 * contpte) or use PMD mappings for large folios.
> +			 *
> +			 * Use the largest power-of-2 that fits within
> +			 * the segment size, capped by what the page
> +			 * cache will allocate. Only align when the
> +			 * segment's virtual address and file offset are
> +			 * already aligned to the folio size, as
> +			 * misalignment would prevent coalescing anyway.
> +			 *
> +			 * The segment size check avoids reducing ASLR
> +			 * entropy for small binaries that cannot
> +			 * benefit.
> +			 */
> +			if (!cmds[i].p_filesz)
> +				continue;
> +			size = rounddown_pow_of_two(cmds[i].p_filesz);
> +			size = min(size, max_folio_size);
> +			if (size > PAGE_SIZE &&
> +			    IS_ALIGNED(cmds[i].p_vaddr, size) &&
> +			    IS_ALIGNED(cmds[i].p_offset, size))
> +				alignment = max(alignment, size);

Can this not all be factored out into a different function?  Also, I
think it was done a bit better here:
https://lore.kernel.org/linux-fsdevel/20260313005211.882831-1-r@hev.cc/

+	if (!IS_ALIGNED(cmd->p_vaddr | cmd->p_offset, PMD_SIZE))
+		return false;


