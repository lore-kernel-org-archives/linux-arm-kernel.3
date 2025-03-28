Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F13C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 19:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90Q+4dJPZ++gRc8qjEAkgpjYJdb5VOUpPRHZ+O0S5l4=; b=WqKc8sg1dYEdmlNeHUSyfdGkbr
	QMmyxc0tyS6sB4uIGm6WFHUcso5j6z25W1WCpUCEeEhiEDt+2iaxr0HaL197QdynfsMIw+knYvK9+
	NyZQC+s5ZtnGyNfbw48scPcWLrFeGjijX0z0tD6m4ThMUDotYK2FAHQ79tUqdTM9ebkN4NhujUov4
	IMj+Y4Y+tHRmxLaTV2e4NIklMsgM+F5ITH6fihG9mxVoWZcoHknKnV48eRb7K6+knSCjzrUJQkbs/
	ghwOxQynB3Rb3VjCGN/nW7LiWQ1Gu2VoBgotYJhFr4Kj/e2R68m1bN9ZWbQ8wsbUf+HEx3ORXireL
	X0oBQvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyFBk-0000000EA9O-0Xaq;
	Fri, 28 Mar 2025 19:16:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyFA0-0000000EA00-433f
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 28 Mar 2025 19:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=90Q+4dJPZ++gRc8qjEAkgpjYJdb5VOUpPRHZ+O0S5l4=; b=HLCfb4k2r/rHy/w+UYAen83Wc+
	dsKCYV8PnrQ5ZHUuxWn0mkw/Q2XFZkxGxTsit8jmvcDJgMBBNfFEfsR5vdfFzD7X6tCcuwmzuWJAP
	DZxxwdAOTTjO5EWbktI9ydKRZUVfHee9DeTf0msC7VuWag1kIzHNibARYV4uXt8oABMleV9ZEb9hl
	ie+5LZOSr+QZ2mUovgjSEI0BzF4K0e7EmzSk6uqXiE0bDeasEdJqW8x5egSvmEApsxQWNJLyaWBys
	B1Y/fYo8GOr9dDOwYLqOyr2kYAUyG2pJHC4vdfc8/I3h6gTsprPy2axjgHB/a8yfv7d+/H7BS8PCv
	y6PRjJpw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyF9y-00000008yK0-2NDn;
	Fri, 28 Mar 2025 19:14:30 +0000
Date: Fri, 28 Mar 2025 19:14:30 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kalesh Singh <kaleshsingh@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Dave Chinner <david@fromorbit.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/filemap: Allow arch to request folio size for exec
 memory
Message-ID: <Z-b1FmZ5nHzh5huL@casper.infradead.org>
References: <20250327160700.1147155-1-ryan.roberts@arm.com>
 <Z-WAbWfZzG1GA-4n@casper.infradead.org>
 <5131c7ad-cc37-44fc-8672-5866ecbef65b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5131c7ad-cc37-44fc-8672-5866ecbef65b@arm.com>
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

On Thu, Mar 27, 2025 at 04:23:14PM -0400, Ryan Roberts wrote:
> + Kalesh
> 
> On 27/03/2025 12:44, Matthew Wilcox wrote:
> > On Thu, Mar 27, 2025 at 04:06:58PM +0000, Ryan Roberts wrote:
> >> So let's special-case the read(ahead) logic for executable mappings. The
> >> trade-off is performance improvement (due to more efficient storage of
> >> the translations in iTLB) vs potential read amplification (due to
> >> reading too much data around the fault which won't be used), and the
> >> latter is independent of base page size. I've chosen 64K folio size for
> >> arm64 which benefits both the 4K and 16K base page size configs and
> >> shouldn't lead to any read amplification in practice since the old
> >> read-around path was (usually) reading blocks of 128K. I don't
> >> anticipate any write amplification because text is always RO.
> > 
> > Is there not also the potential for wasted memory due to ELF alignment?
> 
> I think this is an orthogonal issue? My change isn't making that any worse.

To a certain extent, it is.  If readahead was doing order-2 allocations
before and is now doing order-4, you're tying up 0-12 extra pages which
happen to be filled with zeroes due to being used to cache the contents
of a hole.

> > Kalesh talked about it in the MM BOF at the same time that Ted and I
> > were discussing it in the FS BOF.  Some coordination required (like
> > maybe Kalesh could have mentioned it to me rathere than assuming I'd be
> > there?)
> 
> I was at Kalesh's talk. David H suggested that a potential solution might be for
> readahead to ask the fs where the next hole is and then truncate readahead to
> avoid reading the hole. Given it's padding, nothing should directly fault it in
> so it never ends up in the page cache. Not sure if you discussed anything like
> that if you were talking in parallel?

Ted said that he and Kalesh had talked about that solution.  I have a
more bold solution in mind which lifts the ext4 extent cache to the
VFS inode so that the readahead code can interrogate it.

> Anyway, I'm not sure if you're suggesting these changes need to be considered as
> one somehow or if you're just mentioning it given it is loosely related? My view
> is that this change is an improvement indepently and could go in much sooner.

This is not a reason to delay this patch.  It's just a downside which
should be mentioned in the commit message.

> >> +static inline int arch_exec_folio_order(void)
> >> +{
> >> +	return -1;
> >> +}
> > 
> > This feels a bit fragile.  I often expect to be able to store an order
> > in an unsigned int.  Why not return 0 instead?
> 
> Well 0 is a valid order, no? I think we have had the "is order signed or
> unsigned" argument before. get_order() returns a signed int :)

But why not always return a valid order?  I don't think we need a
sentinel.  The default value can be 0 to do what we do today.


