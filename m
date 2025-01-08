Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D535AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USnfbtjdzJEK9gukpGljvTqxb7I/7Fqgvuzbz7iTWaM=; b=kcZ0S6Cc1VRctB3yhwrodXp0lR
	lYhnHUUMkV9w34d3FEHOm7cmV2zBjIRPByDKR0FaZptJSgqFMjm9o75puIo6FAqLe0U9H6zzgh9+9
	zgYCN8dthwrrIlJZteBYQpVdF4jOyzHD0oy4HcNkGzr36W/P1Z3q1QCsKi38rKafy3MS0AdkgWYga
	yca6xu272dZELwo6L6OkC81EAXXS7R56io1Xs708gaIuph5lc4onQXvCHlZxknI+QLydSpz/fjGZ4
	k8N1hU1naDkdr3Ln2RuaKmCaN90JgoE4/MbBcpHVs0ZRPE9oGvrUdTK3aVNwkYxEOkR+pEGBr+Z1P
	lZq1p3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTxK-000000089Yw-3zXW;
	Wed, 08 Jan 2025 11:10:34 +0000
Received: from flow-a8-smtp.messagingengine.com ([103.168.172.143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTqb-000000087q1-1Irx;
	Wed, 08 Jan 2025 11:03:39 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 9F498200F91;
	Wed,  8 Jan 2025 06:03:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 08 Jan 2025 06:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736334216;
	 x=1736341416; bh=USnfbtjdzJEK9gukpGljvTqxb7I/7Fqgvuzbz7iTWaM=; b=
	WtLL9WZ2meLEVZxmli00VbYv11fhuBGMZp6eU19+LeFOehXBLGesRZh6foqHtbE0
	V/ZqVr7QGvKNjvIMaFOQQl8fHSHaAhWG2taHOBszb/Sq7XFaSAS+D+pLnhXcVEEG
	9uyMw7CSg+NAiw+pzvO8CUfpXLlE91al0J72AFbo+shTsoaTlWzfYiYt52iZtCKH
	nmg1mZoSHgDk3xnOd214hOZwMr6vTagL9xQJIQro8s2DanAm9Tm63iTfM6HbNZuz
	uvBZuyu1aKoZY4Uun5qOYSYCCWF8j7+i6EXN0AHyCHvZTaUYT731+4yKtq/aCUfm
	vzKDj0eDWfWNK9Xi1Q5X1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736334216; x=
	1736341416; bh=USnfbtjdzJEK9gukpGljvTqxb7I/7Fqgvuzbz7iTWaM=; b=J
	/vtRZnOn2Upyqb3fRTIONUj6WwtelA9l+iJ/3kKR44BHYQB+0BEXpQDFHZyObWkP
	WAI69mXSkRadmsk3gdtGfGutrxvwKpm7uTeYZ8OfHgEZmNiAr20tkfybv2hbmcMp
	aGCFu/i+Ze/nNBT79BvaUZG5iO8ATI+xCjkaIojCFJEUB/7yV9OHAgWXIR4vHoyv
	svnP73yQR2D5DdJaECwwSduJJlJgwyl/c0Zm0q7/p4v9C+QOc0wDTt3BMFKIhm5o
	n6C8ZNGXDcfQcxNUDnSJGxVA5j4AZN+g3Y0WW5RuLPEuRofwDLvI0w4bNYthI1rB
	XcXmK6Drrgsa42Eogsk9g==
X-ME-Sender: <xms:h1t-Z__aAxWAhva-MdllhQ4BYUgmBfsyRApbSzOtiprXyT60uQomkg>
    <xme:h1t-Z7t0b7azrzS4uz3CDbALYqcojYJUUGAsBpI_lmF6nYqjDu3CEvB0twds3feyy
    SsqYy99WQypcV1T2Hc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvghvihhnrdgsrhhoughskhihse
    grrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhm
    pdhrtghpthhtohepiihhvghnghhqihdrrghrtghhsegshihtvggurghntggvrdgtohhmpd
    hrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghn
    ughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopegrlhgvgiesghhhihhtih
    drfhhrpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthho
    pehvihhshhgrlhdrmhhoohhlrgesghhmrghilhdrtghomhdprhgtphhtthhopehhuhhghh
    gusehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:iFt-Z9ANGY5phHCQP5q9aptFJBex2r8tUUEtjidE_xfb4AaP55hNrg>
    <xmx:iFt-Z7ctt2NWtfyYsEgjYqKKIrHn67L1tyZAg4XMHhOyiTzOECL22Q>
    <xmx:iFt-Z0OlCBsb26nhU66OvTEdGpRVGIW5IfVb2Uu5QIznryJY6Y1lyw>
    <xmx:iFt-Z9kr0zvBfse9P3OqsbaaksL8J3gNd0JxqpmXi6zyClNfGpiDVw>
    <xmx:iFt-Z8U-rzqfWoWAKZ4Q8n6ifXS3RNJxGRb6sdxgxo5Zg4md0Aao1UvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D26632220072; Wed,  8 Jan 2025 06:03:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 12:03:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qi Zheng" <zhengqi.arch@bytedance.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Kevin Brodsky" <kevin.brodsky@arm.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "David Hildenbrand" <david@redhat.com>, "Jann Horn" <jannh@google.com>,
 "Hugh Dickins" <hughd@google.com>, "Yu Zhao" <yuzhao@google.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>, vbabka@kernel.org,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Rientjes" <rientjes@google.com>, vishal.moola@gmail.com,
 "Will Deacon" <will@kernel.org>, aneesh.kumar@kernel.org,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Mike Rapoport" <rppt@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Message-Id: <2f93708c-9816-4214-ae61-1e6b9f68cdc4@app.fastmail.com>
In-Reply-To: <ea372633d94f4d3f9f56a7ec5994bf050bf77e39.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <ea372633d94f4d3f9f56a7ec5994bf050bf77e39.1736317725.git.zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v5 14/17] mm: pgtable: introduce generic __tlb_remove_table()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_030337_419024_025BE717 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jan 8, 2025, at 07:57, Qi Zheng wrote:
> Several architectures (arm, arm64, riscv and x86) define exactly the
> same __tlb_remove_table(), just introduce generic __tlb_remove_table() to
> eliminate these duplications.
>
> The s390 __tlb_remove_table() is nearly the same, so also make s390
> __tlb_remove_table() version generic.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc
> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390

Acked-by: Arnd Bergmann <arnd@arndb.de> # asm-generic

