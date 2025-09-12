Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67394CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YTVFTqv3esr6/4o2z0BMROL8ZzR/twbyPKp7dOgQ8c=; b=LhT2hM9x/x7aTCqUKe7u0WiVRA
	2vTeRqxWFV3NJbq9pRL1J/gdcK2kZm4WxwbhQl4H7xF/4DsPbPliLMTeXE+YUW2O2nhqX6i950Vir
	QrzsMcvfuBALcQ548zFtEqoM4eg4QUNTYUv37ERvfEAh+0Oh2MjxEXiUXUlmKRAl2Rw4udg9aGZXC
	+4FR6bPuvqKzUbZmLfFjVkg3XNeTxVN6jug4EOEJsuJGzBhIMCCYn1BIAzopkqKZEAasIQYK3Yvbt
	x/Jy1jnInuUMlBITTR+8N/YjSAShvUq1l8cmcQ1iOi6/Y5xnyokBj+ZJVMwUbykDAoAAbFGlblmmB
	iyKWVvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0r4-00000008X2v-1M1v;
	Fri, 12 Sep 2025 10:18:10 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0r0-00000008Wz3-3E7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:18:08 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id B472E1D00410;
	Fri, 12 Sep 2025 06:18:02 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 12 Sep 2025 06:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757672282;
	 x=1757758682; bh=9YTVFTqv3esr6/4o2z0BMROL8ZzR/twbyPKp7dOgQ8c=; b=
	MkTTGqz582tMoXiaxv+WzOMeCUpK43NVEMy0S2ODRVT6sTC0DTo0bXB3GAv1vukK
	dJEC0SEQ1h46wMjlM0kgfqFGcTG77SIC41gzKic0kOGz3o8tsU3ZI5hbyTA4Y43x
	ohKbeayVJdnZPqj5V+ZrKqHCFhmkeEC+rgbi5TVJ9v7kqJ9DvvqO+MW1peFNO+aN
	mTGOCkN0mQA7/SxHODsqxDeHrU/CWbhSVvD98tPKm4aIz0VarFAl4Im3dVLMMG5a
	3o77/cyDl8VssAc4Bm2hiOmeweHDoNJNxytvsrCbvJoDBeOLvwXoe/Io4OCKMv3o
	IFLx/C3HuKRmZ3rVttd6tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757672282; x=
	1757758682; bh=9YTVFTqv3esr6/4o2z0BMROL8ZzR/twbyPKp7dOgQ8c=; b=B
	q3IzD3eNVHz5NfcgZdq/BAq7VPToJWFLvnE7NSgoDR5AJIuIqwb+T3keAu2cJZWY
	KkzHKH6eb7irC3elLVTowyLeB7wOwVeeV/uULPDUTpad6DkCRBwmlz+DF1TRJWKE
	HpaBmN8htE/95T8l/xUhANUYuPEdxZ4tehrOIIQvJbCE81x6NDbZo6UWl6uLMES/
	U11kHYWOB1W7hz9smWXW1HIBNmK10Mxhh5en6Rk3VV1qfc+axmcfLYoJ9h9Fw9ia
	xaoQbgf0e0mWOsExo1UxF/88Xe6B1qgFmYZ6MDtZiX7DVKI0GdE1TRG9X6KT5SW6
	PEaXJyDPEEospM9IHNmFA==
X-ME-Sender: <xms:WfPDaGuIsUrEe6-e3HJpzHbjJCYFKzrF7mghMR4O1VstVjwEdYX-QQ>
    <xme:WfPDaLdTwSIO6wHADzHbI1GCZVROUQFrBN5bf1RSzeigqwVbg08C6WM00Afp-65x0
    RZWEqL5Xjboy3OYyz0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvkeejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:WfPDaEqN_q6tYpYBgHqbaXeMIWWYeCD7i1PfPOpiNQgTfTusQAbplA>
    <xmx:WfPDaFgM8M1jDJDlqZkPywyDozkHTeqG-FJA8dINcdX2bB7OuZkcag>
    <xmx:WfPDaKIxdHlABr-TMX6jl6rL10byP7mIBcu10ZsTsaxIGEL3I_VyEg>
    <xmx:WfPDaC4MP1PgKGRLiJso9NwDui0b7sZsJbvIFwjoBQONQKl07idhZg>
    <xmx:WvPDaAlcw0aU0UxqRmsaUcMFIiKW8MFdVdLPSfFJyj5hIs03ouv_j11Y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F0CF1700069; Fri, 12 Sep 2025 06:18:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmcCJOTBQ5ho
Date: Fri, 12 Sep 2025 12:17:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Larsson" <andreas@gaisler.com>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>
Message-Id: <c6ad1870-f5c1-42f4-9de8-953f2e0f6a6f@app.fastmail.com>
In-Reply-To: <a393f6bd-ac30-4861-818c-ba0b558df4a4@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
 <363853cd-7f10-4aa9-8850-47eee6d516b9@app.fastmail.com>
 <a393f6bd-ac30-4861-818c-ba0b558df4a4@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_031807_333982_96E89B2D 
X-CRM114-Status: GOOD (  31.96  )
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

On Fri, Sep 12, 2025, at 11:32, Andreas Larsson wrote:
> On 2025-09-11 09:53, Arnd Bergmann wrote:
>> On Thu, Sep 11, 2025, at 07:38, Andreas Larsson wrote:
>>>
>>> We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
>>> used in LEON sparc32 configuration (using 36-bit physical addressing), a
>>> removed CONFIG_HIGHMEM would be a considerable limitation, even after an
>>> introduction of different CONFIG_VMSPLIT_* options for sparc32.
>> 
>> I agree that without highmem that chip is going to be unusable from Linux,
>> but I wonder if there is a chance to actually use it even with highmem,
>> for a combination of reasons:
>
> I would definitely not call it unusable in LEON sparc32 mode with
> HIGHMEM gone, but it would of course be seriously hampered memory wise
> without HIGHMEM support compared to with HIGHMEM.

I meant specifically a configuration with 16GB of RAM would be
unusable.

>> - If you come up with patches to extend lowmem to 2GB at the expense
>>   of a lower TASK_SIZE, you're still  looking at a ration of 7:1 with
>>   14GB of highmem on the maxed-out configuration, so many workloads
>>   would still struggle to actually use that memory for page cache.
>
> Yes, we already have patches for 36-bit addressing with 64-bit
> phys_addr_t. Patches for CONFIG_VMSPLIT_* are under development.

Ok

> Even with 192 MiB lowmem we have being using up to 4 GiB without running
> into problems. Could you elaborate on why you think lowmem would run out
> before 14 GiB highmem in a VMSPLIT_3G or VMSPLIT_2G configuration?
>
> And even if 14 GiB highmem would be hard to get full usage out of, for a
> board with 8 GiB memory (or a configuration limiting 16 GiB down to only
> use 8 GiB or somewhere in between) the difference between getting to use
> 2 GiB and 8 GiB is quite hefty.

This is highly workload dependent, but usually what happens is that
one type of allocations fills up lowmem to the point where the
system runs out of memory. This could be any of:

- AFAICT the mem_map[] array uses 40 bytes per physical page on sparc64,
  so on 16GB, you need 160MB of lowmem for the mem_map[] alone.
- to actually access the memory from user space, you need several tasks
  that each map a portion of the physical memory. Each task requires
  at least page tables, task_struct, kernel stack, inodes, vma structures
  etc, all of which have to be in lowmem.
- anything you find in /proc/slabinfo comes from lowmem, and for any
  network or filesystem heavy workload, there are a lot of those

It's easy to construct an artifical testcase that maximises the
highmem usage, but much harder to change an existing workload to
use highmem without using more lowmem as well.

>> When you say "used in LEON sparc32 configuration", does that mean
>> you can also run Linux in some other confuration like an rv64
>> kernel on a NOEL-V core on that chip?
>
> Yes, boot strapping will select between sparc32 LEON and rv64 NOEL-V.

>> Aside from the upcoming SoC and whatever happens to that, what is
>> the largest LEON Linux memory configuration that you know is used
>> in production today and still requires kernel updates beyond ~2029?
>
> The maximum I know of for systems currently in production has the
> capacity to have up to 2 GiB memory.

Ok. The 2GB point is clearly the one that works well enough on
x86-32, arm32, powerpc32 and others, with VMSPLIT_3G+highmem
that gives you a 1:1 or 2:1 ratio of highmem to lowmem, and
a single process is able to use all the available memory in
its 3GB virtual space. Alternatively you can already use 2GB
on those architectures with VMSPLIT_2G_OPT to have everything
in lowmem, again depending on your workload.

Once you go to 4GB and beyond, you really want a 64-bit kernel.
CPU designers have added 36-bit addressing to all the major
32-bit architectures at some point, but it's been very rare
that this was actually used after 64-bit CPUs became available.

    Arnd

