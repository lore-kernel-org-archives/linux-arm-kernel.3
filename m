Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA4FFF60E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6gKS+TrxVFREJLXgKdYFS1HJsCw8TAnrzdxvehz0sI=; b=v1ADrTEWU2TKoSrrB6kd5SaRJ3
	nYiBREpXZHDtJQfXAhQdOCZVXdTOxwW+7pZDT9IFLlSnPSf4XAV8ib3FuNMAOohXd8thf33s7/VnM
	QdS0fna0FrCXqNiwJCuS/nsdVvXWn6Ap9ShLKl7qcYaMgvgu0N8W8l/xCVTcEw2iWIwkAD10VM/Bi
	svgimIkK6ykmbzimJx+O7uXYO5xJysFfoptKCwtABSDa8LmDLgM+4aOgAGQDfX9yCBHW3nzTo8ayd
	EcD9takaQMwIWjyuDjl3hg9lv2ud+Vp26YmGxoFKIkAqHJ4txFlJuX9msOwGkA/peaKe1tfnv4L5Q
	78yeUvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UKo-0000000CZYz-2Szh;
	Tue, 31 Mar 2026 08:20:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UKn-0000000CZYk-0Pey
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C071600CB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 08:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A43C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774945224;
	bh=ROq3VRnEKIKK9hBJkmpGUe23U+FD0G+M72+mozJ94YI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FHFi78M6ZBPEw3UVs5Ouyv+sgrCxwGlGxxYHEfpy83SrgKNiaGhJ900+RBFYT0rFb
	 f5YPxhGTKIcezQ/7GWSAUwLOdQ8hnsrcyslNpUB6SxGtP87eCzQaXAmvqD9MLAcdcE
	 xf/ZAmbtnNEyLUqbaIfBwV/+iYM7Y8C6vrUy9aBQn/F15nfY9SHstoqD9HSvjrfTQp
	 +xPBqsZjps4+O4fxWkOyYSiwGjjl1QGqMbyVJJw4qNKORvak4BjNfIgPzhgoKIrJ9z
	 HHPK6Nkpu9CJFobQ0scqCZpedAwrO7t4vKLJ24mJFASYuYeN2C1AqsXQXzouzrR4R2
	 U+6Yq7YoBTp8A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2C39CF4007A;
	Tue, 31 Mar 2026 04:20:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 04:20:23 -0400
X-ME-Sender: <xms:x4PLaU7q0jl3LvEYHSHeNaV595X0lIiEosPESvcehG0-jUGP69rv5A>
    <xme:x4PLaQurxpyd935rNMgKcbA6MP6-3XT4FDyQochN0GnmlRoEa_SpH9gUj1Gzat5SW
    C2vyKXlANrb1nDsTU5zXZOwx8YrvJYr1zc-knCdLFqOzH8kFj-FvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefgedufeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeguvghmhigrnhhshhesghhmrghilhdrtghomhdprhgtphhtthhopehhtghhsehinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgtrhihphhtohesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:x4PLaaERw6U4Oxd-8dQZL-H79-Eex1oKa8FVHJ3fyrfsSixyD-nj4A>
    <xmx:x4PLaUSBTbh2ckTyRbLY_wZA6HCOejncj-weqpdQ3nSqodEfQUvcRA>
    <xmx:x4PLaftpDJTtLpOnJrJUormyOye5j8rd7Jo44QnQj01HcdUkJUwp7g>
    <xmx:x4PLaULjVYXS9rSw-SBeYHg5dVvhdaQTeZBJSE3U0_wkC_hF3IM4Pg>
    <xmx:x4PLaclpWvUsiY0eSBlBBYZqteqyaWhqGoLwe1SILD7FOJJeZmjg9VH6>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09865700069; Tue, 31 Mar 2026 04:20:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A8AYNq7FA6_V
Date: Tue, 31 Mar 2026 10:20:02 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Christoph Hellwig" <hch@infradead.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Demian Shulhan" <demyansh@gmail.com>, "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <416ca128-715c-449f-a614-1d97d8f193f2@app.fastmail.com>
In-Reply-To: <actuDkpYbzLj0sI8@infradead.org>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260330144630.33026-12-ardb@kernel.org> <actuDkpYbzLj0sI8@infradead.org>
Subject: Re: [PATCH 5/5] lib/crc: arm: Enable arm64's NEON intrinsics implementation of
 crc64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Tue, 31 Mar 2026, at 08:47, Christoph Hellwig wrote:
>>  	depends on CRC64 && CRC_OPTIMIZATIONS
>> +	default y if ARM && KERNEL_MODE_NEON && !(CPU_BIG_ENDIAN && CC_IS_CLANG)
>
> It would be useful to throw in a comment here why it is disabled for
> big-endian on clang.
>

Ack.

>> +#define crc64_be_arch crc64_be_generic
>> +
>> +static inline u64 crc64_nvme_arch(u64 crc, const u8 *p, size_t len)
>> +{
>> +	if (len >= 128 && static_branch_likely(&have_pmull) &&
>> +	    likely(may_use_simd())) {
>> +		do {
>> +			size_t chunk = min_t(size_t, len & ~15, SZ_4K);
>> +
>> +			scoped_ksimd()
>> +				crc = crc64_nvme_arm64_c(crc, p, chunk);
>> +
>> +			p += chunk;
>> +			len -= chunk;
>> +		} while (len >= 128);
>> +	}
>
> From reading the earlier patches, I'll assume arm SIMD code is
> non-preemptable and thus you want the chunking here?  Maybe add
> a little comment explaining that?

Indeed.

