Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EADC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 20:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRGNnZIibSpQ4Mgi891kL5PuMPNjxsoIayZPZFiUSA8=; b=tClwabzZLkU3rdBIlnduwtCgCd
	2Kkp/xS0X1CRjpI95cCPRP0hLMqkPdthJdFaFDumILreuDgWJzqvfDSpWaab+X1r7WyQS2Vv4xtix
	sFqCWWB6ioTrC2FesquI37i1PRBuUgiK+6d5iwTC3utLoRQJrV2hHzKuF1KCK6JPnTKRYNLVY6AY8
	qYoS+nWx6/qj2ufsPYV9Bjxvru9BIZW4nGlh9e45KKDF8apRjKqtB9gPeD6mVQR5cz9Hi7w8LN4ul
	XYs+2bIJ43lU0FKM7Ca9wIS22ueaCNPhRWQKtzjdF0Cl6wuQurKgheJVTwcn3EbcI7HUNpxKJynP4
	Cdg7B/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAa6A-0000000GXZS-2bLB;
	Thu, 01 May 2025 20:01:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYoK-0000000GONv-1IpW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 May 2025 18:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZRGNnZIibSpQ4Mgi891kL5PuMPNjxsoIayZPZFiUSA8=; b=Dzu19DB+UuRCz7HSqaOtKYImi+
	6UyQ7BtWPDSVCV8lRzh6nOrPbePI3MqXWkp7bsr186yx15qq8g11qR7f0JORQ6dxlSRLz4HHHzf66
	AD4spY2/bSYSrm6kpGq2lY+YakjNlmFIS/UufZ2IkPvych1wzKDkyhL1XTQIe4yUNgLkMDJHw6m2N
	dWRRf/7tdpSifsKT8ugr6/csSeT3MVkYwrKrtUKsGqVQ+fA++/YzG+LZWhjTajISfHME8suR1jS8+
	6Jna9s7jnqgd1RYIxR9cB4EcAXDEAEidGbBn3zkboyWsK6s5P6J1zd7Nw75M4FgMznKDBzi+GGYRI
	r/iicqWg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYnV-00000005ULO-3bFC;
	Thu, 01 May 2025 18:38:13 +0000
Date: Thu, 1 May 2025 19:38:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Juan Yescas <jyescas@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tjmercier@google.com, isaacmanjarres@google.com,
	surenb@google.com, kaleshsingh@google.com,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block
 order
Message-ID: <aBO_laRsZDYgjEfL@casper.infradead.org>
References: <20250501052532.1903125-1-jyescas@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501052532.1903125-1-jyescas@google.com>
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

On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> Problem: On large page size configurations (16KiB, 64KiB), the CMA
> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> and this causes the CMA reservations to be larger than necessary.
> This means that system will have less available MIGRATE_UNMOVABLE and
> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
> 
> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.

Sure, but why would any architecture *NOT* want to set this?
This seems like you're making each architecture bump into the problem
by itself, when the real problem is that the CMA people never thought
about this and should have come up with better defaults.

