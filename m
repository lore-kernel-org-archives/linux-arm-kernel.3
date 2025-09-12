Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F57CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnTz2gc51WJkMzlk/mlrEsU7FqUmmq3NOjbYK7bSYp4=; b=HvRL/i09Li0aq5MEWmCIVAJbGL
	d8efGBUs1XlbwdbvgAjC2nw+9VoVMP20ZtcWv+BsJWxrVv7wECbKb82LG4I9t4yVmJxhS1mQLNrAD
	mHUtQXEToIfwEQyD6xgUhVcrK73P7K3blrkVoxAQjDlFuahokDuMuUhqo3pVELY3+RAaztxb0tLb4
	alurHgKpYvzEFTPVWm1Rs4mYEOHLp+Vt6nWV6B8NuNsvmQETCXOBYn3g90zqZ2kVpy5WH16mUz4GZ
	8yybWFzOX8or0IgOJQN7ovESve1LN+WssvCYRsMUYJY/VDeu9cwV7ILUHGUF9CbjwjLQdsPCwkurg
	ChuMzBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux144-00000008bdb-4AK7;
	Fri, 12 Sep 2025 10:31:36 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux142-00000008bbt-1NPa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:31:35 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id AED0D1D003A5;
	Fri, 12 Sep 2025 06:31:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 12 Sep 2025 06:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757673092;
	 x=1757759492; bh=ZnTz2gc51WJkMzlk/mlrEsU7FqUmmq3NOjbYK7bSYp4=; b=
	jT0WwhhKNltNjX6oy1wi2+oKiJaYylL7esPneJwhFB9N0maSA8KhckfKJ6NnZQXz
	bYSKUzEJ1WD8GBoOttQ4k4McWa7PUuOpoj8s0jC70raXwNw+Joio585FI3WnZjbl
	x3pSTwt/PxqKxJ9lJ31N1oKIcXKJBT4zXz+pCyvFVjV9Kraw9dayg9sb9jRwV+Nw
	ZCwIvDwoMDizk5Oy4w5Fq4PGMoCfY9L/WG+9W9or8bVbia9mvqlXoeo2P0NR+JgN
	5c355lhHhH91mQkZARqOAP1UqOJCYuCPS9yuex3K/8pU9ahBPN8OBiub5LCVDUWa
	qZJfE07pcyZBzcIZ+mGBAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757673092; x=
	1757759492; bh=ZnTz2gc51WJkMzlk/mlrEsU7FqUmmq3NOjbYK7bSYp4=; b=k
	1vyC6rj2xmNIeSXoxg3bvnTWj9wX83aGkU2Em5DF79HTuHrMRkI/xWw7759LQ+5B
	bkcvjmV9Qcxb5zeuIlTgRw5J7nFj1ieCipA/jEvNGwd6HN40RiueQR16QHBzDb8h
	VtUVL9bF9ugklG9UPWPwK1OXzf1y5zcSOVT/aIDSE7/tpO+qIxlm036IloNQ38vX
	GYO835wCXejsuEjw7jRJxt+JFUijm5OA7IcHo9Ic5uxJrBm8P5nGWjGtURshGLI/
	Jm0wr8SJkFo/frJJBMF0lfIbNHl9FUpWia57G4LZzDDKNpmKp6M9YMb4iODMRpV9
	KmdcZMWP9FzP3F+KYOnRg==
X-ME-Sender: <xms:g_bDaJkb4BCSIXaN20hGGvDbpq_uYHUfXJVkDOB_mVGTfxamBLbrCg>
    <xme:g_bDaE1SOe8uQM2xOpAvalLtJNFp4-tFiBJJg00LzpboZKgRb_HiWpnQAMxIFtxov
    Y9ewlkME-ye5_zj9pk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvkeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:g_bDaFXJUTCPg8Gg2uXGQ5RgMU0uaHD5VVXSZgwboz-q7ftAYqBd_A>
    <xmx:g_bDaH89g0FuTDFfLJztpjIor2KN7O4LrVLiR6mLfjS9st6ed4KczQ>
    <xmx:g_bDaKpKyJokmXH4ARM6vTbfA_Kk9jW9MQRMrRlbx2LKjFb1x4w1Wg>
    <xmx:g_bDaLcx1abt47vng-9Brf4PakpSJA5ATOGTsoYy2HXs2gu4PoxW_w>
    <xmx:hPbDaDl4p91INzeg69byU-AorUJTlq5vFDDCdsqCRc1puYq7VFqbSjGD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9ED19700065; Fri, 12 Sep 2025 06:31:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmcCJOTBQ5ho
Date: Fri, 12 Sep 2025 12:30:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Richard Weinberger" <richard@nod.at>, "Dave Hansen" <dave@sr71.net>
Cc: ksummit <ksummit@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-mips <linux-mips@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 imx <imx@lists.linux.dev>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
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
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>
Message-Id: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
In-Reply-To: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
 <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
 <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_033134_430070_D81035A7 
X-CRM114-Status: GOOD (  17.54  )
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

On Wed, Sep 10, 2025, at 22:33, Richard Weinberger wrote:
> ----- Urspr=C3=BCngliche Mail -----
>> Von: "Dave Hansen" <dave@sr71.net>
>>> Even with a new memory split, which could utilize most of the
>>> available memory, I expect there to be issues with various
>>> applications and FPGA device drivers.

I also remember driver problems on older Marvell NAS systems, which
we never fully figured out, my best guess in retrospect is that these
had devices with DMA address restrictions, and if lowmem is small
enough it would always work, but any lowmem allocation above the
hardware DMA address limit would cause data corruption.

A similar restriction exists on Raspberry Pi, which can run
both 32-bit and 64-bit kernels. The workaround in this case is
a combination of:

- correctly representing the DMA limits in the devicetree, using
  the 'dma-ranges' property.
- enabling SWIOTLB (which is not enabled by default on 32-bit
  Arm without LPAE).
- Using GFP_DMA or dma_alloc_noncoherent() allocations for
  streaming buffers if possible, to avoid extra bounces

(documenting this here, in case someone tries out VMSPLIT_2G
and runs into a similar bug on other hardware, I expect there
may be a few more of these, though most hardware should be fine)

>> I'd be really curious what the _actual_ issues would be with a
>> non-standard split. There are a lot of "maybe" problems and solutions
>> here, but it's hard to move forward without known practical problems =
to
>> tackle.
>>=20
>> Has anybody run into actual end user visible problems when using one =
of
>> weirdo PAGE_OFFSET configs?
>
> In the past I saw that programs such as the Java Runtime (JRE) ran into
> address space limitations due to a 2G/2G split on embedded systems.
> Reverting to a 3G/1G split fixed the problems.

Right, that makes sense, given the tricks they likely play on the
virtual address space. Are the 2GB devices you maintain using a JRE,
or was this on other embedded hardware? How common is Java still in
this type of workload?

Another type of software that I've seen mentioned struggling with
VMSPLIT_2G is web browsers, but I don't know if that is a similar
problem with a V8/spidermonkey JIT managing its own address space,
or more about general bloat exceeding 2GB of user addresses.

      Arnd

