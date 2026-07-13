Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B675C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5D70PgPOpXCYze4+Z72DPv3iGsJRzVh17hn0cbIFj6E=; b=WDT0OakiFBIrZ5H/jHCyc3uSmz
	OsvfBMWH3P9XKANDBtfTpCKEkSALXztxJtuouDSgE1kM69oSjutbi3oQhis7Le5E54iDDuFqb5n6y
	15Kwjvd8MJbzyn92fFg738GLIL7HxxIxSVKKJL71L8LsV8QYJTlv0qtE8jyJazq3ROKjSA2Ol1EyL
	9AzetI8XX6+cMchLViv1a5wi9A4pavfJBpjcMvVHULyO8P/bSSrqAqgFeOWaOQAc9wYq8pQTgCs34
	ciShG9dN5BG+2PtKlRYZNdlAjYrvxqK+WlkqqpzfAJPUJGVCkNK9yThC6jnBeiK+FZd2JAd8twRQ5
	tnrUArSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHKi-00000009YP5-0h5r;
	Mon, 13 Jul 2026 14:08:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHKg-00000009YOj-3yeG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:08:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 659076013A;
	Mon, 13 Jul 2026 14:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F931F00A3A;
	Mon, 13 Jul 2026 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783951710;
	bh=5D70PgPOpXCYze4+Z72DPv3iGsJRzVh17hn0cbIFj6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IEcGRUQmq/j2oZwL8Kf6eWI82YyVPYbNH14/2FzJeoTFePEit3iAhoG4ugytrOWrR
	 ezVl9VkrgoNuCquhjp2caRSyWFKyvEA4Avoby4m52bd/FgGA7ty7D9RJhdpUUyPzTF
	 1X9WJm/iSqoa3qwgcFma1zhTzZJ4XR2pSNCFH/uGOlr4rgClyC4tp/iEiGbxNBIqXj
	 bbbRBKZZ8Cr2oXnnM8Pr6nAKVuv2FQuQ72Mi+/qjRLearyyBnI4huUQdyifm5sNC78
	 i8TBAdjsJQ3WQef2klxC2+c+KcDEgROBsMslT0iy3f5f1+TUc59vzSF7QS+j4XoiFY
	 NFVQrR8/FtVEQ==
Date: Mon, 13 Jul 2026 17:08:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>,
	Toshi Kani <toshi.kani@hpe.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Carlier <devnexen@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH 0/2] mm: fix UAF caused by race between ptdump and vmap
 pgtable freeing
Message-ID: <alTxUwrkzEx-FEOP@kernel.org>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <8e320b30-9658-4e9f-ac4c-f99dcf855944@arm.com>
 <alNQccqtx5-QApup@lucifer>
 <alTOCtzQh9RMfWbc@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTOCtzQh9RMfWbc@willie-the-truck>
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

On Mon, Jul 13, 2026 at 12:37:46PM +0100, Will Deacon wrote:
> On Sun, Jul 12, 2026 at 09:46:46AM +0100, Lorenzo Stoakes wrote:
> > On Sun, Jul 12, 2026 at 12:50:08PM +0530, Dev Jain wrote:
> > > Will Deacon had pushed back on a similar approach:
> > > https://lore.kernel.org/all/20250530123527.GA30463@willie-the-truck/
> > >
> > > Although now when I read back that thread, it feels more so like my
> > > incompetency to convince :) because:
> > 
> > No haha not so, I think more like this stuff is fiddly.
> 
> Yup, not disputing that this is hard to get right.
> 
> Conceptually, adding locking purely to deal with a vanishingly rare,
> debug reader does turn my head but I'm _far_ less concerned about it if
> it's done in the core code, as is the case here. x86 needs it and we're
> recently running into related locking issues with the set_memory_*()
> APIs if we want to collapse the page-table on arm64 [1]. If the overhead
> is flagged as an issue, we can see if it's worth generalising the static
> key trick that the second patch reverts but I definitely wouldn't start
> from that position.

I'd say it's worth generalizing the set_memory APIs ;-)

Since it's de-facto machinery for manipulation of the kernel page tables it
makes sense to have a common code for page table walks with hooks to
architectures for checking/setting/clearing protection bits.

Coincidentally, I'm working on a POC that lifts x86's CPA into mm/ with
the intention to later use it on other architectures.

> Will
> 
> [1] https://lore.kernel.org/linux-arm-kernel/799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com/

-- 
Sincerely yours,
Mike.

