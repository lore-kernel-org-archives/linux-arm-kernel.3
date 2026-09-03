Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A3C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a8yIQ3NE86fziYRRmM1NyoVwXAqG0dHOhexSSfbtW0=; b=UED3dSIX0X+XMFoDnu8usF4hjI
	3WqUDBmGGTgcuY7fJe/Rl5df9DdQtKmtNiXKpxEPBhm7Ypg3orMU49gvUzMdkQCp3xOQin+6QxdxN
	mLwzE1yEy73BU76rxnHj2+pSfETUmAlSAeqs3W0C06GNoyYrTmzQLTUdJx2G3E4uTLcjFUNS4xbXz
	ceHYRVN0d18v4x8w2jiQHHyELM+6jnsZ1NCYOe9LL34ScNGl/i5nQe4IS3iwPHNwRP7PVadpB2GwR
	bJ5BW3lR27hd/UzmLHoZRu/0miS2FD6ZTgtYzkACGEmG8FOvxYYb/1tRkYY8ggASu+Edws6pqn/Im
	VcfhVFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Y3-0000000Guad-36nA;
	Thu, 03 Sep 2026 09:15:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Y2-0000000GuaO-1GJ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:15:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C994D404DB;
	Thu,  3 Sep 2026 09:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCB61F000E9;
	Thu,  3 Sep 2026 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788426953;
	bh=2a8yIQ3NE86fziYRRmM1NyoVwXAqG0dHOhexSSfbtW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0zsCHKQLk4p8gAn3X8j4oy3KYslGMK/guDz3UOJRR2N9We0sVvbpFK/tqFZEs6hS
	 QGZTNx4CYKtVtsv0C4c6LK+370dmf6vuYWyChytDHcZjngcrLBJRbI1EPFabmoqMSA
	 qZY2m0BNqpRVODEnXYlMUDe3XKdhPYn1UADPoG0K7Kp5YbWUwTwJMx998EnYZp5x+E
	 7GFc412nEoX9MMCL8ZxJywrQM0nTSpoDEGJ7jQOSeDwqfeL2JHMR5tpX8WtDYELqbb
	 7IrVKjbr8LEORFSJMs8oYP5mXCSNx/j4l/PbFzx/kbmKrHsqq6Xbb9o6tQoUAyn5GT
	 6o2UQOGFJA4eA==
Date: Thu, 3 Sep 2026 12:15:46 +0300
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
Message-ID: <apk6wr2S1IOQp_Kf@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <apVmYXlqsVr_p4Oc@kernel.org>
 <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
 <apcKQBRCFeF-usK7@kernel.org>
 <2d7b127d-6079-40c0-2020-dc7767b2396b@outbound.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d7b127d-6079-40c0-2020-dc7767b2396b@outbound.gmail.com>
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

On Wed, Sep 02, 2026 at 01:40:21PM +0200, Eli Billauer wrote:
> On 01/09/2026 19:24, Mike Rapoport wrote:
> > On Tue, Sep 01, 2026 at 10:42:47AM +0200, Eli Billauer wrote:
> > > On 31/08/2026 13:32, Mike Rapoport wrote:
> > > > For large sizes kmalloc falls back to page allocator anyway.
> > > > 
> > > > And the doc is out of date unfortunately.
> > > I think it would be a good idea to update the doc first, and by doing so
> > > officially change the API. After getting this change approved, it's indeed
> > > safe to rely on kmalloc() even for larger memory allocations.
> > The documentation always lags behind the code and "official" API is what
> > include/linux/slab.h says :)
> 
> This is what I found in slab.h:
> 
>  *
>  * kmalloc is the normal method of allocating memory
>  * for objects smaller than page size in the kernel.
>  *

Citing vbabka:

that sentence doesn't exclude >PAGE_SIZE allocations :)
 
> Regards,
>    Eli
> 

-- 
Sincerely yours,
Mike.

