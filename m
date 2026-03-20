Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BA11099B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBrE+ETl3QSBu97biTA3vK5m68jytBBGssPNHhBNDT4=; b=0PWeIHjfvdVIvTf1rEw/iUiESY
	e1CMjl3xOnKkoZT6U74T+q+p9FZ1+WSVVfLqNkcDM7tafwQtSrklz0TlzJ3usXbLEGNDpCoTh9ius
	z3+QyJMYxGLnd0oGBAObEswc7ZZL2BdotCvwxUGF2JQFKeCBpeNAExDXwQN3xRubxm0nsfFNVGltR
	OXRwYlI6FyWvbLrrOGWXVq/IW3lIOmPZ+bxjo4i/se15WZ56//WHcgvn4jgnSvIDXEWElm5MMMClm
	JYYhThMjYeMVc8Mc97Pq1wWogyeloUsTNegJkHkQ1DHfhyVuN2Pg0/LXwZvjiRSYipozGnjKyqbro
	SEwo3mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dwR-0000000DJeJ-0iNW;
	Fri, 20 Mar 2026 17:47:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dwQ-0000000DJeD-24WD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 17:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YBrE+ETl3QSBu97biTA3vK5m68jytBBGssPNHhBNDT4=; b=T605LBycL3rI4RFN580+M7TbGh
	aCtU6vIGOVxGUwytuHLYp/1ZLkr27qP8DQeq4BOYtdqrVVL7wqOyT5X593nCLlATcEz6u0jOP573S
	Ui6lMu0pcx0mOEggwfgy/xeErgiLPY6i5Atl+6FZuDnHJf/jVwDXtFVk28OQjIvLgQLqnccrJC1il
	ptJwQFvaNBAZEPXJGG6jm1esBTUZ7TfOux7cY9wHxOz0GGaGeCZLrlw58J4aim0VjVLtWzxZKjMv4
	ISz7tyHvSHWMmQuU03PUvGHLpCMGBRVES9neSGXWnsFJ6ZI/TZNJY3nCKyBuPApHpwPAmkHEihWgV
	BjW0+lsg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dwK-000000088lh-00QQ;
	Fri, 20 Mar 2026 17:47:16 +0000
Date: Fri, 20 Mar 2026 17:47:15 +0000
From: Matthew Wilcox <willy@infradead.org>
To: WANG Rui <r@hev.cc>
Cc: usama.arif@linux.dev, Liam.Howlett@oracle.com, ajd@linux.ibm.com,
	akpm@linux-foundation.org, apopple@nvidia.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, brauner@kernel.org,
	catalin.marinas@arm.com, david@kernel.org, dev.jain@arm.com,
	jack@suse.cz, kees@kernel.org, kevin.brodsky@arm.com,
	lance.yang@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.l, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, npache@redhat.com,
	pasha.tatashin@soleen.com, rmclure@linux.ibm.com, rppt@kernel.org,
	ryan.roberts@arm.com, surenb@google.com, vbabka@kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v2 3/4] elf: align ET_DYN base to max folio size for PTE
 coalescing
Message-ID: <ab2IIwKzmK9qwIlZ@casper.infradead.org>
References: <20260320140315.979307-4-usama.arif@linux.dev>
 <20260320160519.80962-1-r@hev.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320160519.80962-1-r@hev.cc>
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

On Sat, Mar 21, 2026 at 12:05:18AM +0800, WANG Rui wrote:
> >From experiments (with 16K base pages), mapping_max_folio_size() appears to
> depend on the filesystem. It returns 8M on ext4, while on btrfs it always
> falls back to PAGE_SIZE (it seems CONFIG_BTRFS_EXPERIMENTAL=y may change this).
> This looks overly conservative and ends up missing practical optimization
> opportunities.

btrfs only supports large folios with CONFIG_BTRFS_EXPERIMENTAL.
I mean, it's only been five years since it was added to XFS, can't rush
these things.

