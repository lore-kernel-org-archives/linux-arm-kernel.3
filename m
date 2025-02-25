Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D596C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtYdg6N3u1ZvNXN25E9k3h9XmFGTIiZ/1bHuhQqIar8=; b=QZMOGM37BEJTK4oAq/SBBQitAM
	I0uh/5LKlcPjvDZJsj7NdVKMFDZXLNalJjXxGvr9rspi7UCHE7pYNkcoRolOFO+pP1IscahGXNjss
	34PvQsuGIzvIgv3FNad2Gsg4+qWW8cNexWi8itNygQBQXV9P82SYxB+mBSUACS2TjDeaYcDOmdJVm
	f9HEZ9foiyVuvJeuo4uKArLUHDkk3rDe3nsIeIDqZuObgmDEzkpXhGqWSWTzvFLclYiV7oWAddBtc
	1DVLcUg8XznyQUDruGqg/9bKoSo2P4vf3hIErwGo6TWAmFqoD4NMXeWek35Pzl3xjzxfjH4IpMHbu
	R+ggqqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2iH-00000001b1l-2BSE;
	Tue, 25 Feb 2025 21:43:37 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2gi-00000001apE-3zfl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:42:03 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 83EAC11400FA;
	Tue, 25 Feb 2025 16:41:59 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 16:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740519719;
	 x=1740606119; bh=MtYdg6N3u1ZvNXN25E9k3h9XmFGTIiZ/1bHuhQqIar8=; b=
	Ezp6ZY0KYr4iDDMxa4MKeExP6HHLI6z5iWLlb740zBnbdNh7lx1f9pfXWz9RXNXu
	sWWyCjoBURL5fLCZiykljyNnPEWTgMCItEi5Lvqp/jpRhAs3vzlGvZAGStXpGuG2
	kb9Lxt5bx/4/359HSmtgYEfb91xPxJsoroV6WeWllwrfYrphITTBfAF3wj5vV4HN
	3nMRPK8p/nvSPwZFu7Ajfs2nDn7goqF4oclbzAvL8dH+K0MmuztBrndTs8SucTxZ
	blnoxiHWR0Z/3O37rWidrcbugK0GzuvcaprJu6UpTgkz1xb4UUmuRQpVYxOAmmXA
	pg+x7yxuh0l6t/MLNhLPZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740519719; x=
	1740606119; bh=MtYdg6N3u1ZvNXN25E9k3h9XmFGTIiZ/1bHuhQqIar8=; b=L
	v997lUg6tL38799F8UHUN2MLk8X3jEVGDdqA33/ICRugznJi1xdic/WH9Tq+rBDt
	7wcaPNv6y8CQRIq2FxseGHqoUk2jETGtHwgRQ+Hkj1Xp401y8yBtDuYfbHvuPS4a
	czNxgTnaa+OCmLRSZgqb6almiScgBtG53CzIY6aD8vMp/EfetBZMgdzi2RezwW/V
	aG7GsF/NuA+z+kLwLgXNkrDKPMkRJYACdRdXUqjGDJr/N5Ptrh/LKHoaTy3Iam4k
	ns6S+BpbnqGWjNyKt4C+GZ72diLPbqEaSO0KMo4TLIW7NBA9M1lqXxB2g3R5ZCza
	YZqouaweitfG0eQVWiaKA==
X-ME-Sender: <xms:JDm-Z_q8MzMHtAh7pT2j-ng-G4p1_G_Rs_-9cyznx3AzeWO1p1HrEg>
    <xme:JDm-Z5ouPpMwU9Swmjb11x-oDgBEruk4xDLga3kD0VP1VV-skGx3oa2xW8ouQFdmT
    twdh1nYSIIUq0HuvUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhope
    gurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohephhgvrhgsvghrthes
    ghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegvsghighhgvghrsh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhies
    hhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomhdprhgtphhtthhopegrrhgusgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjrghrkhhkoheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:JDm-Z8OLsAjQ42FKZOMswmncgdeROZ5HMpfdpAWHzhG8dDeDkar93w>
    <xmx:JDm-Zy4gZIf74q1lPhb4QYKJh-ea1LN_b_gETUIYCiEvjsONRqxJdw>
    <xmx:JDm-Z-7LNmU_lC_lHZpmEvWmuzmOWpuXNE6ys97GnqGk-WYy-2QiDQ>
    <xmx:JDm-Z6hE2zcb6nYEqjh5RXGgoTASshLoGlCvc19584xMSM2AYtzwhg>
    <xmx:Jzm-ZzrcPJvnTgL1FXzopat1UXwNfaql9--z12dfOkhI7qJOAHcp5cWJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CE9722220072; Tue, 25 Feb 2025 16:41:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 22:40:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Message-Id: <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
In-Reply-To: <20250225213344.GA23792@willie-the-truck>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
Subject: Re: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies more more
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_134201_868996_EFF35B06 
X-CRM114-Status: GOOD (  11.13  )
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

On Tue, Feb 25, 2025, at 22:33, Will Deacon wrote:
> On Tue, Feb 25, 2025 at 05:42:07PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> A recent change tries to fix Kconfig dependencies, but introduced
>> two problems in the process:
>> 
>>  - only arm, powerpc and x86 are changed, while mips, arm64 and s390
>>    are now broken
>> 
>>  - there are now configurations where the architecture enables its
>>    own helper functions as loadable modules, but they remain silently
>>    unused because CRYPTO_LIB_* falls back to the generic helpers
>> 
>> Address both by changing the logic again: the architecture functions
>> select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA, which may be a loadable
>> module or built-in, and this controls whether the library is
>> also built-in.
>> 
>> Fixes: 04f9ccc955c7 ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
>
> Which tree contains this change? I can't seem to resolve the SHA locally.

Sorry, that must have been an older commit ID. Today's linux-next
contains 56b8e4bb7622 ("crypto: lib/Kconfig - Fix lib built-in failure
when arch is modular")

which is in
git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git

    Arnd

