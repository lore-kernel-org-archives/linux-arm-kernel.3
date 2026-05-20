Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90D7CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoQFWNK7oWAD/wrjDNQs2N+Z55W1ZBNqkdyVcG17n+A=; b=y3veKCQXL8vdrgRZioJbHLIh9Z
	FkirKocGwzRZq022yhQTAfQVt0KQAKepRXq6HWTB63YYCjnynXtTWU1Sj3QqOXIx9OtKR5NPDphZo
	taUiuGmvm0Z247W1dqzMp6gaeWOmCwsD+NmPJ8mo4N4E+AYzPaus7cKEE90q7kEvvJT1Uu3SGwtmV
	AC0ldCDAtc6fe/QcJwBku3WhNCcCjm4XPAIXrhRlGQ48f7y5aOL47nr1dkAPCgi35nEl+VK3X+GyM
	D2gnE68Osu7Cdj3w592eo21+XijJQYWFKbw2sQnv08IVQyrRKwbggFe8XKx9HFzqbF+SwBBYNp8P3
	Irlgoicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo6D-00000005nJt-22kI;
	Wed, 20 May 2026 21:05:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo6C-00000005nJX-03xm;
	Wed, 20 May 2026 21:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NoQFWNK7oWAD/wrjDNQs2N+Z55W1ZBNqkdyVcG17n+A=; b=bR9HCAGSj3BuTqMtUE+DLlE2/V
	hbqFNHpAblQKp5tyrESGJToQyAt4gGSYt43sRu6JEbVNZTj0qvFZxTyoBxJ1wp0kQ5ZcRxN1nm3Rb
	gh32K03vbE/E7J0yrggnNOynCTcgltl9vPaiaVZXlPQBWE/JQgInR1dXcExZ8Iz6LVbgTlq8x52mX
	WL8vfh2Lyfw2a/Tpq2i/SXxctbJ1CzS4YgLicbHSvLU347BFYhk2464cXsmbdNSDNV+5du23ojl3E
	wPSEPslSUR5LG+Oc0B2L/jDVGsi3Or0fTJoXFl2vl9TX0JbwU5Szrew428V10FYaIsgWdHpxL5RaA
	8tHIsB1A==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo5z-00000007aEX-3LBW;
	Wed, 20 May 2026 21:04:51 +0000
Date: Wed, 20 May 2026 22:04:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, akpm@linux-foundation.org,
	linux-mm@kvack.org, david@kernel.org, vbabka@kernel.org,
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de,
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com,
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org,
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
	bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ag4h87CBd-gph9zX@casper.infradead.org>
References: <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
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

On Wed, May 20, 2026 at 06:01:56AM +0800, Barry Song wrote:
> > implied is that the per-vma locking may stall mmap_lock writes for
> > longer than if the mmap_lock was taken in read mode?  Barry, is that
> > correct?
> 
> Not the case — the actual situation is (if we modify the
> current kernel to perform I/O without releasing VMA read locks):
> 
> thread 1 PF: lock vma1 read ----  IO ----- ;
> thread 2 PF: lock vma2 read ----- IO ----- ;
> thread 3 PF:  lock vma3 read ---- IO ----- ;
> thread 4 fork:  mmap_lock_write ---- lock vma1, vma2, vma3 write ;
> thread 5 :  take mmap_lock for any read/write reason
> 
> Now you can see that thread 4 has to wait for the I/O of
> VMA1, VMA2, and VMA3 to complete, and thread 5 then has to
> wait for thread 4 to release mmap_lock. Both thread 4 and
> thread 5 can become extremely slow, because I/O may be stuck
> anywhere in the bio/request queue or filesystem GC.
> 
> So now we have two choices:
> 
> 1. Change fork() to avoid taking the vma write lock for vma1/2/3 where possible;
> 2. Keep the current kernel behavior and drop the VMA lock before I/O:

Option 3: Say that this is a very silly thing to optimise for.  I have a
hard time believing that any application will care about the latency of
fork(), or the latency of page faults while it's in the middle of fork().
Multithreaded applications just don't fork that often!

