Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519D0C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIXfuktxBX9npVbn29PNwEDcICMHnTCbs+iOm5eKoxw=; b=SMAltDtOB9ZJLHGM9p6c3oTXfz
	2CIdM5xdFgfHJ8cehEklNrq1Utb0UxN4XPfwtiJcFvBOtAh4y8BVjfwm02lHkxAoAb5uq5l33ImHI
	jj84jur1jp5zo+2gO78t9m3yOLoz8a0LYQwfX1H6Kw/1JWkkmu5NOO79GFal7dWbMUJ1wDaMWNs5h
	ge3X6CYdTaihiZgaoNOLahsMqDIgV4oc5hVWZHSt5Tie/szWJacTtUweZlnEbrovOWvN8Q21ctbs8
	/glxIol8yznSY74PDzU17gyG8Ezg9yt5acQHp8FWTcbAvjQY0GK9W3BriPgBK8V2gcooIi8kj+Wuy
	opy9zpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jmw-0000000EcoZ-10V2;
	Wed, 02 Sep 2026 12:09:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jmu-0000000Eco8-3Ych
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:09:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 387DC43AF5;
	Wed,  2 Sep 2026 12:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35051F00A3D;
	Wed,  2 Sep 2026 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788350996;
	bh=jIXfuktxBX9npVbn29PNwEDcICMHnTCbs+iOm5eKoxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CQFuAyuNHerDnWsaFITNdyKdYk0CDRDVo85WOXqItPK45gd2qprMEyHWZtia5OZSD
	 F+oNuD69Rox5filuXKINVTARp9sP3eAtoharI+a3M2Rss1fvn2x2VqC6o2bnFRH5lX
	 sWfvLXb1DLtYNwb7jeTUmS/hQ/87QH/5c2hyMiXPXNLunXSDqWjqqIHT7fx0mtt1cb
	 p1IfB55BWUQcWZ/99vYKL/i24P6KmHe42oWKm5A/Bq3divRGIFn/AZs9yj28TGXlGE
	 TBOPKGpJU+vTbGBPFq8cP7Iz3+tYBQsIeMQbIxlczwpxE4pmP+9v23ctQP2IEoPg8k
	 nC6gFCN9OuuFA==
Date: Wed, 2 Sep 2026 15:09:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Brad Warrum <bwarrum@linux.ibm.com>,
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
Message-ID: <apgSCyj-h2xVc2ss@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin>
 <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
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

On Wed, Sep 02, 2026 at 01:41:54PM +0200, Eli Billauer wrote:
> On 01/09/2026 19:46, Mike Rapoport wrote:
> > > * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
> > > it returns?
> > It's not pageable in the sense of demand paging. Some architectures lazily
> > synchronize vmalloc page tables and this can cause page faults that will
> > take care of the page table synchronization.
> > 
> 
> Thanks for this clarification.
> 
> This sounds like a showstopper to me. Immediately after the allocation of
> these buffers, data from the USB device can arrive at 400 MB/s. If the data
> flow is throttled as a result of handling page faults while trying to write
> the data to these buffers, this could lead to an overflow in the USB
> device's own RAM buffers. This is because the USB device is an FPGA, where
> RAM is an expensive resource.
> 
> So using vmalloc() may result in a malfunction in the data transport where
> the __get_free_pages() would have been successful. This outweighs the
> benefit of a somewhat higher probability of success in allocating very large
> buffers, and surely the improved aesthetics of the kernel code.

kmalloc() still works, just like __get_free_pages()
 
> Regards,
>    Eli
> 

-- 
Sincerely yours,
Mike.

