Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0E8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BjtT2J2J6zXKuxGY/oNhYmRT76YRdnfRvP+EVhF3Q0=; b=HK1EKzz0LD8TpeHV+c9cQduqa7
	mpUfXA4ZbJKHYJDrwcs66zbGl48AOb/svnE8lY26/WfANOgRXeQ/yq8v7x7YBab7v04eVWrjG/xsq
	oTOFSkk89VTuYHkt+R8vyVpj043/3xtaNnDvEnMX00rbNfBC+ZKK+oDZrI2c/OayEdRF/JdRRmrZY
	aKX6x2m5OEriZq+hjmpw9Jkozfx7v0IHPoghk8+veXn28mw7fvI1jKZXwDHJQPukTNQrIf44d3iJF
	M7H+GIsCirWRf7E67cfppWARgPdQR97vRMXWfzmjVm4MRfsD5SEguZ9aHvqI3j1Cs2h0ZZFx0Ygh6
	PivMT6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEyx-000000092aR-344T;
	Mon, 13 Jul 2026 11:37:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEyw-000000092Zz-2oyf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:37:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D70666004E;
	Mon, 13 Jul 2026 11:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126A51F000E9;
	Mon, 13 Jul 2026 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783942673;
	bh=/BjtT2J2J6zXKuxGY/oNhYmRT76YRdnfRvP+EVhF3Q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lwsqz1RuU3/1+c0OVzE60Yb3p9ZEdRyv87rOvJQj2jHlLDEJ9FJh3edRHAabzd8wG
	 camah820QByAwHgAARZVVejvD11aO+S9Ik8ny9LouWcULNkE1aQXCemywImUs6WKfe
	 GDEVgH7ZgoNJI7HcE1g7bcNYXDtt8CrQ/eWnGg2fEWMwktPX7Fww8DmwHln3sdp12T
	 D3uAw0aHU9doRMgRKZY8ITJ7+5ZQAQtLaK2rBS+h//zPXpg/FDXOpqa8jixTrT3CLp
	 7T5xptgnEXNSjzGBE9uqCjgtRrEMT7yXfCEDCtOh+IFFSelv4KHvpqcfasikBCvYr5
	 LvZXZRZnbq1mQ==
Date: Mon, 13 Jul 2026 12:37:46 +0100
From: Will Deacon <will@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Toshi Kani <toshi.kani@hpe.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Carlier <devnexen@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH 0/2] mm: fix UAF caused by race between ptdump and vmap
 pgtable freeing
Message-ID: <alTOCtzQh9RMfWbc@willie-the-truck>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <8e320b30-9658-4e9f-ac4c-f99dcf855944@arm.com>
 <alNQccqtx5-QApup@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alNQccqtx5-QApup@lucifer>
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

On Sun, Jul 12, 2026 at 09:46:46AM +0100, Lorenzo Stoakes wrote:
> On Sun, Jul 12, 2026 at 12:50:08PM +0530, Dev Jain wrote:
> > Will Deacon had pushed back on a similar approach:
> > https://lore.kernel.org/all/20250530123527.GA30463@willie-the-truck/
> >
> > Although now when I read back that thread, it feels more so like my
> > incompetency to convince :) because:
> 
> No haha not so, I think more like this stuff is fiddly.

Yup, not disputing that this is hard to get right.

Conceptually, adding locking purely to deal with a vanishingly rare,
debug reader does turn my head but I'm _far_ less concerned about it if
it's done in the core code, as is the case here. x86 needs it and we're
recently running into related locking issues with the set_memory_*()
APIs if we want to collapse the page-table on arm64 [1]. If the overhead
is flagged as an issue, we can see if it's worth generalising the static
key trick that the second patch reverts but I definitely wouldn't start
from that position.

Will

[1] https://lore.kernel.org/linux-arm-kernel/799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com/

