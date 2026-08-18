Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA7C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 17:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjhuD+7fHMoacORpzwa+v4G/gOBUrswHbm+lgOme158=; b=TeH/V34ZeJqED0Lquu4+s0JvP2
	65fqtd04c2cdzYLG0o2HxszocCUfQ9CoFcr6lAMg74u33M6dWatLPWB6Rd4IJRZLGEyOr8WPrEYWV
	6UrqcM42HQpOuUUCEbMSUwmCgUMcFQC58R2h6OPmhA8buUhL8LkGyqjXTysjRo85xtU3kQLBEzjVA
	YAGQ1z0RH/oG2uX4k4vW02TJtvIwe7yMfQOSE05jio21f/GF5f9+a8tmkoBPJZvVpaK4uNyJjY/d8
	8LHxRo2s29gTqV5bkrQf9GfClhvEKmUVigf1avJ9PUBqfc7mq1/YRzfBHPUTTe0Najgz0r3uBpuPs
	tSUWJkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNOu-00000008PSM-0mHG;
	Tue, 18 Aug 2026 17:15:00 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNOr-00000008PRc-0Wvf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 17:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1787071733;
	bh=hjhuD+7fHMoacORpzwa+v4G/gOBUrswHbm+lgOme158=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hTjyAQZ5wY8qRTt/Xh7TTvHKkJecAjz1LYJrlmFU2BBVR8nAdGDCfM7A785vhWnoc
	 iE8bvWWGtj6/lhtv1mrf1cHM+RCINhw74H5Iqu8EOK5uGEJC2p2tRbfA9PNmLB9ltj
	 4kaH+jkwbD8e6XmF9Zk7WEpKKTjgNxHnZsxeSKeM=
Received: by gentwo.org (Postfix, from userid 1003)
	id 1E4C2402B1; Tue, 18 Aug 2026 09:48:53 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 1B11B40293;
	Tue, 18 Aug 2026 09:48:53 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:48:53 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
cc: Will Deacon <will@kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    "David Hildenbrand (Arm)" <david@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    Yang Shi <yang@os.amperecomputing.com>, 
    Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, 
    urezki@gmail.com, catalin.marinas@arm.com, akpm@linux-foundation.org, 
    hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
    linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
In-Reply-To: <anTCM94KoxY2nRaf@lucifer>
Message-ID: <5fdbc331-8067-a0b1-6a66-5be9226a3f15@gentwo.org>
References: <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com> <amCPBrdltFSE_fEf@J2N7QTR9R3> <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org> <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com> <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org> <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com> <anIXr4Kbn59Ac31Y@lucifer> <anTBN7WzVZukl26p@willie-the-truck>
 <anTCM94KoxY2nRaf@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_101457_184143_989EC03E 
X-CRM114-Status: GOOD (  21.83  )
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

On Thu, 6 Aug 2026, Lorenzo Stoakes (ARM) wrote:

> On Thu, Aug 06, 2026 at 06:15:35PM +0100, Will Deacon wrote:
> > So the nice thing about having two implementations (i.e. the per-cpu
> > page-tables *and* the preemption stuff from Mark) is that we can pitch
> > them against each other to help us make a decision.
>
> Yes exactly :)
>
> This point has been put to the submitters a number of times so I hope that
> an additional repetition from an arm64 maintainer helps underline it.
>
> >
> > However, I don't see how anybody could argue that Mark's series isn't
> > cleaner and easier to maintain.
>
> I completely agree.

Changing a register used by code sometimes in a timer interrupt is
cleaner than accessing a virtually mapped address?

A simple RMV instruction is simpler and cleaner than prefixing a code
sequence with flags on how to modify registers if something happens like a
timer interrupt.

> Let's hope sanity prevails.

I sure hope so. But there is the ingroup behavior that rationalizes the
wildest approaches as sane.

> > seriously want to consider the per-cpu page-table approach on arm64, the
> > numbers need to be _really_ good and across a variety of hardware, not
> > just the stuff with a memory system made of baling twine. That extends
> > to the kernel text replication efforts too.
>
> Thanks, and equally so for the core mm changes that are required by the
> page table approach (that requirement being attested to by the diffstat).

The numbers are already approaching 20% and will go much higher because
there is more potential here with the ability to localize various memory
accesses in the future.

Scaling to large core counts requires the reduction of traffic on the
fabric connecting the cores. And the per cpu page tables allow that to
happen and scale to high core counts while minimizing traffc.

If you keep on with your hacky approach of changing registers in the tick
then we wont be getting there. We may have entirely new classes of bugs
because now the timer interrupts changes some registers. Think of the
hacking potential. Wow.

Please stop the madness.

