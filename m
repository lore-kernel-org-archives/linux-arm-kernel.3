Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1DFC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJv/WiakOodAqFIubQ5HTmHL0TDtf9MpNqrzEXUw2fg=; b=x3Ipl+PRbYJREBceVIruNQviRJ
	v0dM0KS6KoKRQ2A2SJe7ugLIyNKdtEUJfKycwopnBSIZqbG3X+3ijkFgET84SRPDm1dDkIJHwART3
	Fnd8qLA9UoEYo6LGB45SM3jEJQApXPVKyEbeIJVFHVrhgHp4/8wr2bIEw2IVXv5bLSjqEO9JC+OEN
	MfqR3dPuMA4ozL90ukfej5QBSzNaMz5JfYiina1P9DmaSiH5fE6HjHwYk1Zhm+Q5pVmfybypX6HDk
	YF3Q3x9L8ugazIOtKFXwayJ/Ok7/k8ZOP3QFN5rmw9XBEky101mHH8qU2bDs+RYZsxtpAcUtJWPoK
	p0YcUWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JOw-0000000BBjx-1FFS;
	Tue, 01 Sep 2026 07:59:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JOv-0000000BBjq-1gCz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:59:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0667601DB;
	Tue,  1 Sep 2026 07:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201A81F000E9;
	Tue,  1 Sep 2026 07:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788249564;
	bh=iJv/WiakOodAqFIubQ5HTmHL0TDtf9MpNqrzEXUw2fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P7SEFFP8puwZXZp/YRq5bm12kLhga+lgh99B8rQeYLWPKvjGgDXAgg7amgbvop6gs
	 KnFbcm9PWiLs6fpRX3X9ZFziRD/tbsK3eH/C4U9q+apMvreDXnEx9yuMWrWXaAlfn9
	 RfE+EypR5zdZI4scQXJRBlRBhEahbdQVPKXgYGzRzl4sArWd1u++y7ARbEBAYmsoti
	 qa/YYnJeh63FtQSZKwP6986LY6PCjMAcEQlpM6IXvbI4ROaA1SfUtvjcxi9CnB5UZH
	 Nk9IDitG/j2LUr0suo0oUruy11Tq+byoKby/mpiq0sCo0dpWi4sYmz38BnnJLGVmE9
	 9mRRThkgaqcJA==
Date: Tue, 1 Sep 2026 10:59:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Eli Billauer <eli.billauer@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Brad Warrum <bwarrum@linux.ibm.com>,
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
Message-ID: <apaF1HUtJnstuUN4@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831123937.32255a49@pumpkin>
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

On Mon, Aug 31, 2026 at 12:39:37PM +0100, David Laight wrote:
> On Mon, 31 Aug 2026 12:13:08 +0200
> Eli Billauer <eli.billauer@gmail.com> wrote:
> 
> > On 30/08/2026 9:47, Mike Rapoport (Microsoft) wrote:
> > > fifo_init() allocates the buffers backing the software FIFO and
> > > endpoint_alloc() allocates the transfer buffers of a USB endpoint.
> > > 
> > > These buffers can be allocated with kmalloc() as there's nothing special
> > > about them to go directly to the page allocator.  
> > 
> > Except that they are a bit large.
> > 
> > fifo_init() may be requested to allocate up to 256 MB of buffer memory. 
> > This memory resource is split into an array of buffers (fifo->mem[i]), 
> > each 64 kiB (or less, if there's trouble obtaining segments of this size).
>
> Would it really make sense to allocate the four buffers separately?
> And/or use vmalloc().

My understanding is that the buffers don't need to be physically
contiguous and vmalloc()ing the entire fifo->mem in one go should work.

Eli, what do you think?
 
> David

-- 
Sincerely yours,
Mike.

