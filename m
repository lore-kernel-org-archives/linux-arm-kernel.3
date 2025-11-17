Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBA0CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIkYMJgRGW1JPeB/kOo/OLCi0kmAJSDUfWo25iuY2Iw=; b=jAvBtzAgGL3k3nKtWG4hk2PlYu
	gTpEsjPKamxKl1VL0KVm9bMkMSVoOV4cbqEnSneGdGtHML6E5FTBFb5vmnQEWc7lt0uqvJCa3ztA4
	uHrCmPP5PuSN0wu/c3s2D0G5NAIincI9xbgxLRw6BiJ+p9pceydjzdTMH4cRJoeLUC9up8Uk1w+CP
	dum1ppu0W3v/9VVRulz6/zwsTQzleTzXJQWQ2K2Yf0oyoP98aZJsEUDUDoSRg8ecs9fSRfby4dHmQ
	S18T4ik0GXeeo126Sp4ky7sSuHzYQG6mlXJRRWl8MaiCIZqBxuVChzAyfzKNjUNaRuKeFFIJ4S4wk
	hBuqtH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2OO-0000000GQBY-3IPn;
	Mon, 17 Nov 2025 16:47:52 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2OL-0000000GQAz-4Afw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:47:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1C12514001BA;
	Mon, 17 Nov 2025 11:47:48 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 17 Nov 2025 11:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763398068;
	 x=1763484468; bh=vIkYMJgRGW1JPeB/kOo/OLCi0kmAJSDUfWo25iuY2Iw=; b=
	HM8h5RPx03UmtcjuvC/ESKwsWMN9/RwppelGNftAqykf6HTT/bI+BVGsJVDo2y5X
	Mb4ylOzPKgdG9KLXJUv7/JWvdUpsSf7KNtreJCEuMY7a6gO1+kWdWhHWdATa7xZR
	FyDeoLV2GbPSBJRdTU7DZ7ksHuVa8TJ+kdrfaWj3Zi5YtIfytsoFQxYSq7VuoY7l
	G2E3ry3XOE3WNNKtoQnBas1syGdgKmRDTt1jsVuI3cVk6zhSpzSm36pqIqhsOsFh
	2XTbSkDLKeJJBMlt2vfk2J0gDDlyYDvvRBK82Q+9ed5JS4bBdlYMn7DIb71c44je
	JYZAxxmRsUjs4Gq7RP+rJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763398068; x=
	1763484468; bh=vIkYMJgRGW1JPeB/kOo/OLCi0kmAJSDUfWo25iuY2Iw=; b=u
	JBxfwBA7qo6ixAf5ceZ8gSW8TN5aVKZjMJIGf+ycGs4xvt3YIpjqBhnUEG0EiKPI
	xeAP/gtSSv5R3lkeyFM1gaGAR+hq3dMmVk8EcGtX6FT9IGKxgDaCZH2hZYdPnsyj
	nCzaHnX2Q4J/PkCjcAbu+HXkTpP0iLDa0bQ02fZJaG78XIfYPaVHci+CRBdz09S0
	/p9O8wds1dZ8GYMyCJoqWO6cu/7/YKGRTJO0f59G+Y9q0t3dgOA8m1V6QMN9rSZ5
	gsD5LBhtpOGZ9Hbadp7aNnr5FsXL7TOMLMRNs56FqYutpoM7dhK9ajpVsL27T/dZ
	bHHwtarTLAJA3IqEFpL4Q==
X-ME-Sender: <xms:s1EbaUPgEDzANVlWf-ZHyA0q62mUXOa58dvWBkWaXl9k2Oy_t2gBBQ>
    <xme:s1EbaVyC_m8odYIM5JtgxIpHBO2zi9rwIn7nn7OApcxghFS9ZjJNydPuQW3c4zmFP
    _YwtvBBFYsG1UPxCYF6l9q6pyuWmW1rWPoyaIDzer366widYNdaoJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudekleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhgvrhgvmhihrdhlihhnthhonhesrghrmhdrtghomhdprhgtphhtthhopehm
    rghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehrhigrnhdrrhhosg
    gvrhhtshesrghrmhdrtghomhdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:s1EbadZDx65v0mmmgkWeR7ok3ap2FoNRwy3KE3QcDA2YePt5YktR2Q>
    <xmx:s1EbaaadFGjO6-C3VXjLXeWmAPlsrIxN7nlFjMx9ClxsA9k_K5wa0A>
    <xmx:s1EbaaysMrNyT5TqJZToRfVL0KFsIRQcC-s-nwkFdvWfaTV_Yd6Flw>
    <xmx:s1EbaecduOxZOwWBh2ayJ79pUz_QKcMBGv1VkHBueBor8wUlwPYFFw>
    <xmx:tFEbad2fhg3pRDeaLIuFCUUjflUjShRkjAy0UxTLqXonmsQ2Yv0uAyQH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A37CC700054; Mon, 17 Nov 2025 11:47:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5NgtTiaP10B
Date: Mon, 17 Nov 2025 17:47:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ryan Roberts" <ryan.roberts@arm.com>, "Kees Cook" <kees@kernel.org>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Jeremy Linton" <jeremy.linton@arm.com>,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <Catalin.Marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-Id: <dd5b4423-0954-44d5-99a5-0052b62c55af@app.fastmail.com>
In-Reply-To: <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
References: <66c4e2a0-c7fb-46c2-acce-8a040a71cd8e@arm.com>
 <dd8c37bc-795f-4c7a-9086-69e584d8ab24@arm.com>
Subject: Re: [DISCUSSION] kstack offset randomization: bugs and performance
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_084750_539779_7C3D771D 
X-CRM114-Status: GOOD (  16.57  )
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

On Mon, Nov 17, 2025, at 12:31, Ryan Roberts wrote:
> On 17/11/2025 11:30, Ryan Roberts wrote:
>> Hi All,
>> 
>> Over the last few years we had a few complaints that syscall performance on
>> arm64 is slower than x86. Most recently, it was observed that a certain Java
>> benchmark that does a lot of fstat and lseek is spending ~10% of it's time in
>> get_random_u16(). Cue a bit of digging, which led me to [1] and also to some new
>> ideas about how performance could be improved.


>> I believe this helps the mean latency significantly without sacrificing any
>> strength. But it doesn't reduce the tail latency because we still have to call
>> into the crng eventually.
>> 
>> So here's another idea: Could we use siphash to generate some random bits? We
>> would generate the secret key at boot using the crng. Then generate a 64 bit
>> siphash of (cntvct_el0 ^ tweak) (where tweak increments every time we generate a
>> new hash). As long as the key remains secret, the hash is unpredictable.
>> (perhaps we don't even need the timer value). For every hash we get 64 bits, so
>> that would last for 10 syscalls at 6 bits per call. So we would still have to
>> call siphash every 10 syscalls, so there would still be a tail, but from my
>> experiements, it's much less than the crng:

IIRC, Jason argued against creating another type of prng inside of the
kernel for a special purpose. 

As I understand, the other architectures already just use the cycle counter
because that is random enough, but for arm64 the cntvct runs on an
unspecified frequency that is often too low.

However, most future machines are ARMv9.1 or higher and require a 1GHz
timer frequency. I also checked Graviton-3 (Neoverse-V1, ARMv8.4), which
is running its timer at 1.05GHz.

My M2 Mac is running at a slower 24MHz timer. Between two getpid()
syscalls, I see cntvct_el0 advance between 20 and 70 cycles, which
still gives a few bits of entropy but not the six bits we actually
want to use.

How about we just check the timer frequency at boot and patch out the
get_random_u16 call for a cntvct read if it gets updated fast enough?
That would at least take care of the overhead on most new designs and
hopefully on a large subset of the servers that are in active use.

      Arnd

