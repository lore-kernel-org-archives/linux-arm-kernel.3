Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D6CE8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzhySXi6gKgZxoO2ywE0zKF655UizwK1ctYGZ8ZZRlk=; b=zYzpWUX/doKYf8nQqPbxtkCibL
	ybzHqs3rXkRDT5q70DbcePQuHwkWGHBFCmrKRbA7Wx5gsBEMYI+oZlVu+IWeKsBwizmK1LHKhNqlo
	jJey8r0ltHHf59t/8Jbd6PRrkB2QMMRdQRnzSssSv0oSHKbb6xVIWZUwuUvSgCghrqLiiHRu3C+ah
	XvOxjzNygFgvYGJZGHJ/Ns2lCGSUulVgSY/jkcuXi9+kPD1SmvWgDieoVAiC3KXv8pLEpQKlxrHkF
	Oe23MoaiFcEGmSNMxQ/xnrfQ9xeOMP51OAsEE6gZ+mq9D/iH4dcpkrEtAG1xAVP3tD24mvMNFWmqv
	cFcaQLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL43-0000000785C-3TUT;
	Tue, 03 Feb 2026 18:23:51 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL40-0000000784o-30pI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:23:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 65DC67A0053;
	Tue,  3 Feb 2026 13:23:46 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 03 Feb 2026 13:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770143026;
	 x=1770229426; bh=DzhySXi6gKgZxoO2ywE0zKF655UizwK1ctYGZ8ZZRlk=; b=
	hSt3JJ9z4jWWFGFvrw2ygui0lCCg3UT5KjmF1mkT8gHsSqjz8jFPukpt6EBfj0BT
	JcRLpV/52dmXy9DAiKlKE3w/tKj6++zacaQCIef3EjZ2VODb8MZAfBqqBlCp48Uu
	497siYLd1dLeRRjv3pblEVIUzA4krj412ReeQsfX9UEwgsCrDQhEyxlFUU3eSzUr
	LokeVMPgoh87KoHxjJMXCxq4rxnL35t95ZA2UA7sQpCVZKiZLZ0gVlzOSrdfUibl
	LKGJSWfrucN8E/0deik7zHOFntPWqJcgKD2MyouoJ/+z8VGSXyUU77axw69kpUHv
	5wgS/dR505JyZoZOpdUdPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770143026; x=
	1770229426; bh=DzhySXi6gKgZxoO2ywE0zKF655UizwK1ctYGZ8ZZRlk=; b=R
	9l+zJGl1UQ/7TJt+VHeOWF70d4s3f2hwxbgwzfmOStMp6c5lM41zboGMXxHcCvEh
	SRP9DejRE3IzzIgfgUqvOxZSY+gr6DR23m8kYnDsX8i6NeSZbCe97wt4JoYvv6ZD
	3iJIl9IC7I7xP8Jf4O0uObcj4PIhKX7FpgBkv9I5ugogWfqGF4zrYF98ClDg8pbx
	+GYWpf85F8tYfEawSa8a6ON6kLiIYa/EegmcSU8cHmz1nwX8IGx7pBk1nrwQvYa2
	mo55tjd0IMP1ub9nJTC01SVR1B8rk+lzDh1Af+b+mtsOhKZ+VETAFo4f2vlDPwMt
	xtL4wW3XpAy9TS2P7q+hg==
X-ME-Sender: <xms:MT2CaTs9f1u-yCJrpwjkQk3bacamocs10biNQZgob78yEVpWCC-U8Q>
    <xme:MT2CafTnIr5RF5RZZ-yDTJjSaZ9NNMhZG2ltjREU382lkgDox5_jw8S44Watlpo2m
    XKBz_x8_89OAyK95yFiqXmOHW17JTxsi3q-CjG54PAKC5zdqM92da-S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedtjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghnshhhuhhmrghnrdhkhhgrnhguuhgrlhesrghrmhdrtghomhdprh
    gtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthht
    oheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhmpdhrtghpthhtoheprghrnhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:MT2CadVdEFA6y21SyaqavPTeU2t3svOUbhtEg0JD1PoaNCdlKrdRow>
    <xmx:MT2CaXqx7lPw94rg9u3VUSra0vQrG1hh9KbbFNrAGLDRnJ-daVqRhw>
    <xmx:MT2CaZSIZwxDZ_JDSTbRJuT2QMDQrem93pBQIpJkuRkiIVKmZZLFUQ>
    <xmx:MT2CaR0aoxteRvI51FMELyug0GeVqsZYGN_Z3Rde7l3h4BNrx7825g>
    <xmx:Mj2CadRrUXYMdiVxlbEz381661_njya9x_5EogIg3Yk3H8kDQ-nJy0ZK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BD85170006B; Tue,  3 Feb 2026 13:23:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AHCTJPjBZ37Z
Date: Tue, 03 Feb 2026 19:23:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Will Deacon" <will@kernel.org>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Ryan Roberts" <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <6809df4c-f427-4245-8385-a8add6ca2ed5@app.fastmail.com>
In-Reply-To: <aYI7vUJKWVmzz5Yi@arm.com>
References: <20260203162147.2103175-1-arnd@kernel.org>
 <aYI7vUJKWVmzz5Yi@arm.com>
Subject: Re: [PATCH] arm64: hugetlbpage: avoid unused-but-set-parameter warning
 (gcc-16)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_102349_076981_A0667FDD 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, Feb 3, 2026, at 19:17, Catalin Marinas wrote:
> On Tue, Feb 03, 2026 at 05:21:23PM +0100, Arnd Bergmann wrote:
>>  
>>  	ncontig = num_contig_ptes(sz, &pgsize);
>>  
>> -	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>> -		__pte_clear(mm, addr, ptep);
>> +	for (i = 0; i < ncontig; i++, ptep++)
>> +		__pte_clear(mm, addr + pgsize*i, ptep);
>
> Should we not fix the macro instead? Either with a (void)(addr) or just
> turn it into an inline function (still compiling):

Good idea, I'll add your inline function to my randconfig setup
instead and will let you know if I run into other problems.

      Arnd

