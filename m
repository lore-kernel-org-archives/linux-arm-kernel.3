Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D65C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WH9GLRjSzyUmXP73YbT8GymaYDLOXQlGnVZRz7SJVBA=; b=g1/fTkvQyYKrOGv5cmuYGDBnkO
	qQLYBC2xxhGKsOu9cQ3z7V3jvWhO1nPRvLJYY5/QefNKV7YQl2IqJP4BVFyBakuOXGbJdnghgkbGV
	EeCbaKqS4PJyNcXLEN+3p5X2pLxW9kE6t2k2n/q4TvpcXw6iAWCohmytgex0fNfb2e1pNpDYXH+BW
	dsQXbK6gLM+clxNIjYLFdzhNhAL2cn8XRBJLLkh5X4JeDFINunhXAGWer7U/BqXy6GE+oqnhxTn8u
	iUG6Xv0L+K05R/H7Z9Qb6CJdfvp/xqxLeKASF4YgmP9PQGGESRYndL3Ued3IvSyYZAnag/t2iMsEQ
	v7k3UTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10G4-00000009B3r-2vVN;
	Mon, 31 Aug 2026 11:33:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10G3-00000009B3W-4231
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:33:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E41D60213;
	Mon, 31 Aug 2026 11:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E191F000E9;
	Mon, 31 Aug 2026 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788175978;
	bh=WH9GLRjSzyUmXP73YbT8GymaYDLOXQlGnVZRz7SJVBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AZJyrgmM8QADM/tQ3djTAeARnE0tu71LsYAnpmqOKEj9/Wtt3nwHniVayVY8E0Toa
	 yOc5jOJtEmC3bTWpfpt3zQGdo1fQ9ZleHcWHBaMU8ssVlG+Ke0eEyvGXlXmRFCnQaj
	 24DWfOWiKUIVTcMRoDf8GLwWworUIMllAjQPrMak3Uhn+2l8psqWw7Z70Ac7fmF9Mj
	 s5xWmHPx0ttQkWplwpmg38jECJ3umgKKp4Q9iMYLezRSHDeetagS7TrEN9nDaw0PxY
	 MWZfkVXytlJKkgMMAQ1j+jROPE42uPqSohV8GVbsUZvr6h+q88wozzSnTj8/xy/yXH
	 LgAp5GZKJQY0w==
Date: Mon, 31 Aug 2026 14:32:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Ritu Agarwal <rituagar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <apVmYXlqsVr_p4Oc@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
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

On Mon, Aug 31, 2026 at 12:13:08PM +0200, Eli Billauer wrote:
> On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> > fifo_init() allocates the buffers backing the software FIFO and
> > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > 
> > These buffers can be allocated with kmalloc() as there's nothing special
> > about them to go directly to the page allocator.
> 
> Except that they are a bit large.
> 
> fifo_init() may be requested to allocate up to 256 MB of buffer memory. This
> memory resource is split into an array of buffers (fifo->mem[i]), each 64
> kiB (or less, if there's trouble obtaining segments of this size).
> 
> Citing Documentation/core-api/memory-allocation.rst:
> 
> "The maximal size of a chunk that can be allocated with `kmalloc` is
> limited. The actual limit depends on the hardware and the kernel
> configuration, but it is a good practice to use `kmalloc` for objects
> smaller than page size."

For large sizes kmalloc falls back to page allocator anyway.

And the doc is out of date unfortunately.
 
> Regards,
>    Eli

-- 
Sincerely yours,
Mike.

