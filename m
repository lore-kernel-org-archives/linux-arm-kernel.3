Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF03C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J5Tb1/e7+0o2iMfnVQiLZsqKhQzq+Tx+/PZqWQZOR4=; b=Ao7IuZSQUDzJzN1djX4nwvXKsy
	Sx3J1YoEEDHcZJQgaf1729IdQEiovOLfWv/BYLZmtcqP6LkNa61F40GEAAgzIQzYJidqi4/h9q59E
	Ne8VibyR5uqhCkExL4vzn1+RfgfFVoAZNHK6KUKVqmfgCY8dlX7lP3bGCKYVffOdfkh11dZpI76Ks
	BVG7qGb17lXiZ6vSq/jWKgWNWRgHa6tfdcwZIP0xu9vtWnUHTCOMlOYfa21e5Vv9KGGZ6mnuKUbx9
	/pGgqT5NPR7rExwvsejcY5BrLeLJXcaKHzHjTkZLQrhxGfUyyqMsFKxZwa8zuAPRyokO2SN6hmSAb
	KH33oKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1x4-00000006Nwa-2jsU;
	Thu, 06 Aug 2026 17:32:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1x3-00000006NwS-0li2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:32:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C24C60AB0;
	Thu,  6 Aug 2026 17:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1B81F000E9;
	Thu,  6 Aug 2026 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037536;
	bh=7J5Tb1/e7+0o2iMfnVQiLZsqKhQzq+Tx+/PZqWQZOR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HqKGBGIcEZ/+U514vL1iPOo9QBRMCr2ok62HCPSwILHjFBf/AR08b6mSqHDEjaeFN
	 KutUxL79UxG002+LReaU0p1yGFhFC7M+yh/1MiQaeXZdBlS7PYjI0H9tHz+pQiATs5
	 4NoJXbGzZ7yUsQOYaynFGTV4ABINw+XLGwBubFYe2XKsem9mQPQWlIPZT1GdujLy5t
	 7sHUYsGGPpe20Hy4TMB7iE0OeCoue33lT9XHHBFBGyEYLevj+gtt3a0KpySvREVXv9
	 EayAToVMPG7VDJ1NUebZQUOCdl8yYL3evrEWKLlclZumx0v+dIeuzQS1yy4ri8AhTN
	 P9P8EQTM+ATwg==
Date: Thu, 6 Aug 2026 18:31:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	"Christoph Lameter (Ampere)" <cl@gentwo.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
	catalin.marinas@arm.com, akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anTCM94KoxY2nRaf@lucifer>
References: <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <anIXr4Kbn59Ac31Y@lucifer>
 <anTBN7WzVZukl26p@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anTBN7WzVZukl26p@willie-the-truck>
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

On Thu, Aug 06, 2026 at 06:15:35PM +0100, Will Deacon wrote:
> So the nice thing about having two implementations (i.e. the per-cpu
> page-tables *and* the preemption stuff from Mark) is that we can pitch
> them against each other to help us make a decision.

Yes exactly :)

This point has been put to the submitters a number of times so I hope that
an additional repetition from an arm64 maintainer helps underline it.

>
> However, I don't see how anybody could argue that Mark's series isn't
> cleaner and easier to maintain.

I completely agree.

> I've seen it described as "hacky" but I
> can't tell whether or not that's supposed to be a criticism. If we

Allow me to translate: 'I want to ignore this' :)

Similarly the comment about mm maintainers wanting maintainable not-broken
code being a 'foggy' position. Translation: 'I want to ignore this'.

Since maintainers decide what gets merged the translation gets flipped
if the submitters fail to address the feedback.

Let's hope sanity prevails.

> seriously want to consider the per-cpu page-table approach on arm64, the
> numbers need to be _really_ good and across a variety of hardware, not
> just the stuff with a memory system made of baling twine. That extends
> to the kernel text replication efforts too.

Thanks, and equally so for the core mm changes that are required by the
page table approach (that requirement being attested to by the diffstat).

>
> Will

--
Cheers, Lorenzo

