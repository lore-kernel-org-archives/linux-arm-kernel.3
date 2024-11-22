Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8F6E69188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+K2vO+YH28AbBPpcin8XCiUS+NS9nCewhxVz1hPnHs=; b=Cnvyz6EbhrGiSiYf4LzM8XRvoj
	MV9dzOjpeloSwliwfcUN1Oym9vQ8L/u0PKDxFvSKkYhOGHwcUv7YbTOVtyhv494H6AtEwh/pEuh4V
	WWux+W8i/fjdxt17OKFybEalpQf8suBgSZVncuxNxmLZY6WKgC6jEoGZwsA5fDDDlqtZtA7Enb+j9
	DUxDqw3Ai3CnIQAo8MarSwhtBITv+OuG9QfTc6AKlxK0LgLVe7ingyAOF/4k/nNVS8WlTBxryTS8o
	bBqV5Sq3Oh23ssvH6G2NVOuCwhdbrlWbR1EoVviWKcF0pVNJytBeQTPnON29N5x1viUGX8K+/HQgL
	4IPjt/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYU6-000000037mE-1w1k;
	Fri, 22 Nov 2024 18:34:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYTA-000000037cW-1hYa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Nov 2024 18:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2+K2vO+YH28AbBPpcin8XCiUS+NS9nCewhxVz1hPnHs=; b=dpKJyFBgo5rAV5bVvDqMFqw21z
	93FmlQvXiYAcgtJHjPq0kqXWIrXVNMYT1cax3pXa5gTAso3KQf7Ghn79Vb31Od4P1ff0dWeEKdpa0
	Nt0+RKtkYYTsePr9gI6Dx3LA2wxiz8eVxJbH1t6Gtcn18xAi8Sty91FlynmjrHllIjJoPhxwNPlvp
	/TC4eJqkps4ZMjV7WYLXOMPMj5NVJWDFL6gA0mbrojQFdKYLQ9xhGcSS3ZW/I7dBh2CDxxQ5kCKm+
	6S/k1wAeFJ1fQQFkViTvBF/zJ8qOleScAf0wLCPWMV+VhCEbsWqPqOyHNic4cpNwONVAtshrXeTo+
	j+hifZaw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYT7-000000088t7-1mo1;
	Fri, 22 Nov 2024 18:33:25 +0000
Date: Fri, 22 Nov 2024 18:33:25 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Fuad Tabba <tabba@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	James Gowans <jgowans@amazon.com>, Mike Day <michael.day@amd.com>,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-nfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] mm: guestmem: Convert address_space operations to
 guestmem library
Message-ID: <Z0DOdTRAaK3whZKW@casper.infradead.org>
References: <20241122-guestmem-library-v5-0-450e92951a15@quicinc.com>
 <20241122-guestmem-library-v5-2-450e92951a15@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-guestmem-library-v5-2-450e92951a15@quicinc.com>
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

On Fri, Nov 22, 2024 at 09:29:39AM -0800, Elliot Berman wrote:
> A few near-term features are coming to guest_memfd which make sense to
> create a built-in library.

You haven't created a library, you've created a middle-layer.  This
file primarily consists of functions which redispatch to a function
pointer.  I think you'd be better off creating a library!  That is,
have the consumers register their own address_space_operations and
have functions in this library which provide useful implementations.

That's, eg, how iomap works:

const struct address_space_operations xfs_address_space_operations = {
        .read_folio             = xfs_vm_read_folio,
        .readahead              = xfs_vm_readahead,
        .writepages             = xfs_vm_writepages,
        .dirty_folio            = iomap_dirty_folio,
        .release_folio          = iomap_release_folio,
        .invalidate_folio       = iomap_invalidate_folio,
        .bmap                   = xfs_vm_bmap,
        .migrate_folio          = filemap_migrate_folio,
        .is_partially_uptodate  = iomap_is_partially_uptodate,
        .error_remove_folio     = generic_error_remove_folio,
        .swap_activate          = xfs_iomap_swapfile_activate,
};

Some of these functions are xfs specific, some are iomap specific and
some are the generic VFS implementations.

