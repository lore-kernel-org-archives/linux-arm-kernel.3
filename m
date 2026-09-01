Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684DDC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNtqw+4cMw2tiBTTuj3vqzwte2JlYbPEDqcQmayzdB4=; b=D1QCK6UZjw3Un01/SfQ8sJ0OM0
	QbAN2QyD86YTJKy9cTtclbNIWj4ZAbywpdLy9XpMJfEVURaRj5mFxLvXgzlgT3XM4tBRHnO4H7ymg
	Wcyh3qetn7sfkoNb3SiWHBtZWNXT1r1VPKzujPx9G64/btZiG6Ypmut86sjkYDP91zwKdOngsp0js
	SI5r0tp6vi6VB8ezThIvJNpd5dIbC8hoAj/RE2jASF1OqdQdg56QTB0yKQx/wrxbg4UOPac8kX4Qh
	EVplA/tcg/z8FsZiC1OGk0Mx+EGk/9fvzDNHKglsffdcI/KDIG3d0b9dhW3c6FlWWecQ0/NnL9uQj
	GMZXJ20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SDi-0000000Cotq-1AdB;
	Tue, 01 Sep 2026 17:24:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SDh-0000000Cote-1Amw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:24:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ECAB4351C;
	Tue,  1 Sep 2026 17:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B451F000E9;
	Tue,  1 Sep 2026 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283464;
	bh=FNtqw+4cMw2tiBTTuj3vqzwte2JlYbPEDqcQmayzdB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LA5VUHH3CQRbq6TtG7uAOUnltv/nWwvN8V4834MNvXbYRxwSmTotOmWteii8UiQS5
	 QR4fRDprMmPj5OuZI0MppUEPQ57nQvrdsdqpstxXyjI1E00zLmnpLMN9UloL/ZT3FO
	 0XmliimdrLwMGlqsl+hZIsTW4GKZKZZ9EEBZc2x2c4GzLI/e4yKx5tOAffPk/J5ASP
	 x2ZLdYf9X9nf1oK3mVaEG8OLndn+E+5n+OfO8fLsoGCF3JHWDts5Pv/MKpgYoy/yPr
	 NZso7dD+ZtKvquJLdY3TsryJ/fkqf89H3HUSu6B8WDndLzqUjSBpq32qmt4O6UVQE/
	 43dW7Sls5S4Yw==
Date: Tue, 1 Sep 2026 20:24:16 +0300
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
Message-ID: <apcKQBRCFeF-usK7@kernel.org>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <apVmYXlqsVr_p4Oc@kernel.org>
 <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7adfefaa-91c5-4bf4-ff98-5dfbba0eac96@outbound.gmail.com>
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

On Tue, Sep 01, 2026 at 10:42:47AM +0200, Eli Billauer wrote:
> On 31/08/2026 13:32, Mike Rapoport wrote:
> > For large sizes kmalloc falls back to page allocator anyway.
> > 
> > And the doc is out of date unfortunately.
> 
> I think it would be a good idea to update the doc first, and by doing so
> officially change the API. After getting this change approved, it's indeed
> safe to rely on kmalloc() even for larger memory allocations.

The documentation always lags behind the code and "official" API is what
include/linux/slab.h says :)

When I wrote that document, SLAB and SLOB were still around and had
different properties than SLUB for larger allocations.

Still, the documentation update is on it's way upstream:
https://lore.kernel.org/linux-mm/20260831-docs-memalloc-guide-v1-0-547718c274c1@kernel.org/
 
> Regards,
>    Eli

-- 
Sincerely yours,
Mike.

