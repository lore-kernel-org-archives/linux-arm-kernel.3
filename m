Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39732E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TH0ggL15ha3cHvAVBubqS5XbrDlSBVnwD+kCElIWxLY=; b=UyRwUWc53tuVYAKlZtL+Tq7uAZ
	RCxzOSxY4xoknoYbEdBzCDS1H1+igUy0l+TNQRjO14OEt0nJgPHZK9i6ZIjtJ+6vkyMIUG7bf6ar0
	1ncgLpv0w05HmgZUesEGy5r1PkRwdvCBonBuoBKqtait6KuMnZlY8z90MX4qaBhsjd1j2IzcPmfzS
	YinHpXUcTnfaQz5Gl2+Z4TyGZLSPYO5A7YM/gFgSxknGEYLbaqQuWOXVB4Zuh7AsboHjvWD08pc9z
	EgKkp+WQkboeQDL7L0piIaQ1llF79w97LI9iO2u+VOeTafDgSGQmVcWj7Yr4FPEoYFdPTWe+SooJk
	OfJm267A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeBh-00000005Azx-2Fgd;
	Fri, 20 Dec 2024 14:41:09 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeA3-00000005Ah2-12ZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:39:28 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2551D25401FB;
	Fri, 20 Dec 2024 09:39:26 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 20 Dec 2024 09:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734705565;
	 x=1734791965; bh=TH0ggL15ha3cHvAVBubqS5XbrDlSBVnwD+kCElIWxLY=; b=
	k1Ia4Hye/+r3OslBAM1Nfg4JNNP2wAGtX/h2mle4t2Rq9CXKP1sZZqcdnzMvUyqv
	Lx4M1XJ1y7rghBiGweJe1Rizz0401DVg9Reg/kR9VtnVAuDH9LO//3KL9wbR1oJV
	8mDmDSbB8h2yIEfqH6BrzYE+7v/ZX4Ujywbyw262LZpwPrqmOiaIdh2jj4QpFxKP
	Lj8JXV1jsLJmHiuPzNriKzUm+0vdMvynmUvcCHFtmRdRQQmfTClRN3ynH3I+FkNv
	AV7kL7QWZdYgw38Yejho0v8o8tX5s9e2Pmnft92daOQzupRGKXX5+FS8EnwRGE67
	UY0B5XnSLx6LzACPgBu0Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734705565; x=
	1734791965; bh=TH0ggL15ha3cHvAVBubqS5XbrDlSBVnwD+kCElIWxLY=; b=x
	y94a0sw0ybcp+11dExMmj+RMTfxpSykhQSEb2K/+wAL9Khl1kMAxQRB2HKczfN75
	NKRw6eJLM21vQjChucba3QPltwOtTbc5tLG8oWjz1P16uyl8+h0iZ7p1XSjNlI/R
	cEaDHkmCfywffhueszbdgMMKsRouwm5O7hdK5xwdFOClqbUihxkRuwVL5/btrxUB
	udczGFjAaht0wbHNupaLet9fRmStlC8RnQSExy2URKBVLn0l67ddq2UiWHoATJzH
	Bz/hpVCsIZYwWr5Gy17IB/oHyGdTqIEHVrGhf8AjmeSl5XtmTMHrulQpD0reycsD
	lgjHelQfiJE/p6s1On7DQ==
X-ME-Sender: <xms:nYFlZ3EZpI4kx4jO0g0genC6RGhZ-Ju_Lv-JCpoq6y6V9IJm3HaYzQ>
    <xme:nYFlZ0V33OQWym_0oCB11Y9H8c0CLY9bRCI5Y-UbK9YBDD3SICSK5597YdLK9tvLX
    W-ydl5hEAbuXhmyaog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghird
    gtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghp
    thhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehroh
    hsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghr
    nhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtlhhrkhiflhhlmhhssehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:nYFlZ5IeA0agIQS9WG9-oCGqCbUK8YKCb55q9nS6rbdQalz-tAdeiw>
    <xmx:nYFlZ1GcRqypaBd-6kFgrzxaG6XZZi6XtePVlMXD3A1PPpmDlpiEiA>
    <xmx:nYFlZ9UYcV92jtT5rMUEMW4UgzYkMY_7LfClJMPOzMGSJnBZ4R10sA>
    <xmx:nYFlZwONuVoybRnzJ8AF8-wnRIEjDtAHeyFNi5ugySfspO1SDeSjNw>
    <xmx:nYFlZ-XfwLfzt-yuEwsBvS1PN6Do7TfHDM1ufhT_V4IFoez9ntl6hdMu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5AF242220073; Fri, 20 Dec 2024 09:39:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 15:37:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-rt-devel@lists.linux.dev, "Ard Biesheuvel" <ardb@kernel.org>,
 "Clark Williams" <clrkwllms@kernel.org>, "Jason Baron" <jbaron@akamai.com>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Steven Rostedt" <rostedt@goodmis.org>
Message-Id: <41427a05-f032-4713-812d-7f8a021067d8@app.fastmail.com>
In-Reply-To: <Z1m18yn67dsJRVWA@shell.armlinux.org.uk>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-3-arnd@kernel.org>
 <20241211134811.wM_UADhQ@linutronix.de>
 <20241211140402.yf7gMExr@linutronix.de>
 <Z1m18yn67dsJRVWA@shell.armlinux.org.uk>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_063927_344649_E14535A5 
X-CRM114-Status: GOOD (  23.28  )
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

TL;DR: I would still like to merge patch 3 and 4, but let's
keep that separate from the RT patches.

(just realized I had never sent my reply here)

On Wed, Dec 11, 2024, at 16:55, Russell King (Oracle) wrote:
> On Wed, Dec 11, 2024 at 03:04:02PM +0100, Sebastian Andrzej Siewior wrote:
>
> However, what is quite different is the L1 page tables. On x86,
> everything is nice and easy, and each page table is one 4k page.
> On 32-bit Arm, this is not the case - we need to grab a 16k page for
> the L1, and the more immovable allocations we have in lowmem, the
> harder it will be to satisfy this. Failing to grab a 16k page
> leads to fork() failing and an unusable system.
>
> So, we want to keep as many immovable allocations out of lowmem as
> possible - which is an additional constraint x86 doesn't have, and
> shouldn't be overlooked without ensuring that the probability of it
> happening remains acceptably low.

Right, non-LPAE systems indeed have a bigger problem with
fragmentation here, I hadn't thought of that.  Most of the
systems with 4GB RAM (and all of those with more) support
LPAE though, which means they can use the same page table
layout as x86 when when using CONFIG_LPAE=y.

Almost all SoCs prior to ARMv7VE are limited to 2GB of RAM
or less, the only exceptions I can think of are three SoCs
that can use close to 4GB (a small physical address range 
is used for MMIO):

- Calxeda highbank
- Hisilicon hip01
- NXP i.MX6D/DP/Q/QP

We can throw the first two under the bus, I'm sure nobody
cares enough, but the i.MX6Q was actually shipped in a
handful of products with 4GB that some users still have:

- Bunnie's Novena Laptop (856 original backers on crowdsupply)
- Solidrun CuBox i4x4 (not the more common i4P)
- Solidrun Hummingboard (early revisions only, later 2GB)

A couple of other i.MX6Q boards were advertised as supporting
"up to 4GB", but if you tried to buy those, the only ones in
stock anywhere seemed to be limited to 1 or 2 GB. Examples:

- armstone A9r4 (dts not upstream)
- DFI FS053 (dts not  upstream)
- VAR-SOM-MX6

[Part of the problem here apparently was availability
and cost of qualified 8Gbit DDR3 chips.]

Do you know of any other SoCs or boards in that category?

My feeling so far is that none of these are show-stoppers:

- The 4GB/8GB boards with LPAE don't have the added problem
  of fragmentation with order-2 page table allocations.
  They can run low on lowmem with CONFIG_VMSPLIT_3G, but
  as Sebastian cited, HIGHPTE is not likely to be the
  breaking point for them. These were mainly built around
  2012-2013 (before 64-bit became available) as high-end
  SoCs and are reaching the end of their commercial life.
- The 4GB boards without LPAE are also 10+ years old by now
  and were fairly rare even then. These would suffer the
  most from the fragmentation though.
- The 2GB boards with or without LPAE can theoretically
  avoid HIGHMEM entirely by using CONFIG_VMSPLIT_2G_OPT.
  These are still very common today, but at least a third
  of the total memory is going to be available as lowmem
  even with VMSPLIT_3G.

The case that is less clear to me is the one where memory
is sparse enough to lead to exhausting lowmem without
having a lot of total RAM. These are a little harder
to find, but I think e.g. Renesas has some chips that
need this, and Realview PBX had a custom __phys_to_virt
in earlier versions to work around this. This should
be solved when we get the "densemem" support that Linus
mentioned.

     Arnd

