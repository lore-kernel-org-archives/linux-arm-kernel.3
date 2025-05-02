Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E2FC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gCBfgenrcuzOlKaFHM4eFqhnDAHrWXOzgvXT7/VXcg=; b=h4nyHstnI8W/XimSz94sWswwXr
	b/7xcZWldrwAfp7RzQqQIuQQ/eRQ8OjD4wyWNUcVnZbMxs5sT08PVOqBYiA0sA3V+pdt82kZcWgrC
	DKi5EyoTT/t0/h1NHgN1Tu2VEWsMPfEvZvkmV4MrsvS0B3unvIfaoRsvGYU3KH2BnDyG2DkU+vggn
	odqPhYSblhMjtsVzhDtVyWj9zM9J+99ddiwhd/8UD4bJ5eHolj7sLHCNB/1qQdXv0gzQuM0yaKlft
	uZhYA5pnWh3LZpH37pct3QnPkIOy0g5+VGsChiqm9rafQASQMtZxKYn62wMNDEFgxDDa5aFgZP8MQ
	tc0pOBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAok2-00000001nzU-3iKk;
	Fri, 02 May 2025 11:39:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoi7-00000001nn2-2PYD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 11:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AABE6845D;
	Fri,  2 May 2025 11:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B483FC4CEE4;
	Fri,  2 May 2025 11:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746185860;
	bh=R20iTsL1Y4YvlVm8x3qRJWYAMGHK+p/fYIgio9JtTZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pahvfXyjZ5Dvyicm+QYm1c4GBlnYwFUo37WyNHQYg4rZ4tXSLnW6MWu1dQPlqZuh3
	 Arb4MPurEbwWh3sqjgD+XcEbbz65PYsq9QDyAZJZHZ7zU5gA60nId8r+/JC2XdP83/
	 uhjA3vHt1FmyP1oYjidjDE2IZQyOu7AWVW8vQa15ML8P50MSFbcwOW9M3DArL5Lyc6
	 D3uNniMczKv1nS0UMdb1xBui+IOuEmKiicXyMC5FSMR2vAbMsdCDyKeJNbUWb7rMQS
	 o9tpv2WMFJDlw9P4tHoMK0zRX+OK0jWzMb4YDiPxh0PemAoxClRecvz4n0PUBq/xmJ
	 O4J+naEHpBQWQ==
Date: Fri, 2 May 2025 12:37:34 +0100
From: Will Deacon <will@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Juan Yescas <jyescas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <20250502113733.GA29622@willie-the-truck>
References: <20250501052532.1903125-1-jyescas@google.com>
 <aBO_laRsZDYgjEfL@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBO_laRsZDYgjEfL@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, May 01, 2025 at 07:38:13PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
> > 
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> 
> Sure, but why would any architecture *NOT* want to set this?
> This seems like you're making each architecture bump into the problem
> by itself, when the real problem is that the CMA people never thought
> about this and should have come up with better defaults.

Yes, I agree. It would be nice if arm64 wasn't the odd duck here. You'd
think Power and Risc-V would benefit from similar treatement, if nothing
else.

Will

