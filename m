Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED17D1951B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 22:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+K7IY2VEjZ5xcqD4utKWilBgIlKvpGKN17wXmYFtuSc=; b=Wg/l4/CJcc675WQRa9mVABbh3a
	L7RI4Si5Fq8cQqlzuSdlBHeGNDDpaTBbzIJPhWVyOeuDNn+FiZN9Ug0R2PaKGasmbSPb3bjlmwhDa
	PxBqqpnbIH5FAr+fZWUbInSPr4GBCmTQMijy/WG66we70+Xo0PSxk4i6yXkwlAMiJDgjBk0lk0Uos
	S/QPXs9Sk9nL1lR8CDf7QouFNcoT6gJjl7f6DVOS1KcLlLg9t7cpRsiEFywgfZFdwJyM5SCvIMUOz
	L/8O6IVicXN48jHZ7DZc+sEgSRe9EhYPl9EUT9L0ANMbQtx3VvPP5G2X5sql88bjeaCre6qnxLscn
	b+0lTjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkV0f-0000000DJTl-157U;
	Mon, 26 Jan 2026 22:24:37 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkV0b-0000000DJT7-3VUt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 22:24:35 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0D4A21400081;
	Mon, 26 Jan 2026 17:24:32 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 26 Jan 2026 17:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769466272;
	 x=1769552672; bh=+K7IY2VEjZ5xcqD4utKWilBgIlKvpGKN17wXmYFtuSc=; b=
	V3qubgH5SvElXBb+qKvl+SHFP0M206/qBTh99JZ4y13qnZFJ6qbywFejaozjen5g
	VMjpy8hL8TFFxbm7NS+uAZuy4V8QzFtAyF+U05u0vYirfNJ+l+MI87HLK2rRhv3A
	Hr/vAqseNgqFVK4mPxYuQV0LGIt5Ciwja/J+al8njhHEN5kj/oeX+3GzPrlIa3Aj
	2HkuZ9szU1oEjUjVo6s/3J+00lr3Z+IiDEwHP5k2q9H0CuLHpY/f394i3BXE6P65
	VWbX2HS57jHhd9I5CqcKO20CovV95QgtBUKwlgGqdIAthX5ZkWVt+9Qlvuh4ggOP
	itsC9EbB4O2UCgzJWs1GJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769466272; x=
	1769552672; bh=+K7IY2VEjZ5xcqD4utKWilBgIlKvpGKN17wXmYFtuSc=; b=G
	jPkkp8xxcSPbhGSZp9xVDkghMTADUpjGgN9+AlC20IZQP/CXa1JhyOUPOgJx7c2Y
	JijWQsvT/cjXRIOX2iIalVE/QDq0CFoSfinL00r8A4ha8pjjvzupVR8ItAOfHACe
	byys5cX+dlGMGB30GXhdjyfg+UCodo5okP5A/wMQT1ypCQgCLx2RQvY5B/4O58KO
	dDiI0xvcfM+F+gF4ugTDvn4d7YHoJnKfpGhBJiEPO8Y6cf/whF/Hs5GgCzH4WwXv
	cFZVQQM2ijl/+28CYGgB6qyqaLZlG9OgdqeQR9vfIQ6SNZEMS7s9tei6lfg/adiW
	O5ZHL/fg4UaIyax1bFtug==
X-ME-Sender: <xms:n-l3aUz90gP7G69GKVcf1eFIvORSPz0uabmkmCVPNfRYpx7LCZloNQ>
    <xme:n-l3aTH1Bnb_tVkGab_gOBQ5wbRgRGKQU4aoKTpkiJtBq4s8Lv-jnjoPIEUVFZR25
    -RckiVUqtXs1RLdBYZrXCZzeKroBYdZKv6NqFySLijlsayup_51Xx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheekkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsvhgrnhgrshhstghhvgesrggtmhdrohhrghdprhgtphhtthhope
    gtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepsghoqhhu
    nhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghlvhgvrhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdgu
    vgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:n-l3aYsFpP5_9sxy_uPq7QSx5PxjO2T5C9ZiQEemDUb2bzZvixaZ1A>
    <xmx:n-l3ab28X8GtNgU6VVfEavF0VQv4wJ4NdIGrznUOUiM2zIGp4ygZPg>
    <xmx:n-l3aQBMgbqk24OMuzoJ8rlhFlFk2Y_DrNgoB8YYE42lwZzWbi0ULw>
    <xmx:n-l3aZD7wgjcuFIxS9tJ3_KXnz7000XSe0Uogfv7SRIQ9wZXudXWGw>
    <xmx:oOl3afdFqOf5Tdtz_kA0W-mE2alzhrNRwlKW6Bw6xdkgdeWGwhp727jG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 34EDB700065; Mon, 26 Jan 2026 17:24:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArrhcHX-7EeF
Date: Mon, 26 Jan 2026 23:24:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Will Deacon" <will@kernel.org>,
 "Ingo Molnar" <mingo@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Waiman Long" <longman@redhat.com>,
 "Bart Van Assche" <bvanassche@acm.org>, llvm@lists.linux.dev,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
In-Reply-To: <aXfGcIpeXQNRUI-A@elver.google.com>
References: <20260126002936.2676435-1-elver@google.com>
 <20260126002936.2676435-3-elver@google.com>
 <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
 <aXfGcIpeXQNRUI-A@elver.google.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_142434_340973_F4C6CCDB 
X-CRM114-Status: GOOD (  16.62  )
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

On Mon, Jan 26, 2026, at 20:54, Marco Elver wrote:
> On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
>> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
>> 
>> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
>> 
>> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
>> on gcc-13, clang-18 and earlier, and not strip out qualifiers.
>
> I think we only need to worry about Clang for LTO builds. But yeah, our
> minimum supported Clang is 15, so between 15-18 it'd be broken.

Right, I missed the #ifdef CONFIG_LTO check, so indeed gcc is
fine here.

>> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
>> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
>> to do the right thing already.
>
> It'd still be broken for Clang 15-18, so it won't help much. We need
> this to work for more than "scalar", so even though it'll work for Clang
> 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> _Generic-based __unqual_scalar_typeof() sooner than later.
>
> I was able to make this work for older compilers:
>
...
>  #define __READ_ONCE(x)							\
>  ({									\
>  	auto __x = &(x);						\
> -	auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;	\
> -	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> +	auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret;	\
> +	union { __read_once_typeof(*__x) __val; char __c[1]; } __u;	\
>  	*__retp = &__u.__val;						\

>
> Thoughts?

Looks better than __unqual_scalar_typeof() to me. Would it make
sense to do the same __read_once_typeof() in the asm-generic
version of __READ_ONCE()? I don't remember if we discussed it
in the thread leading up to dee081bf8f82 ("READ_ONCE: Drop 
pointer qualifiers when reading from scalar types").
We probably didn't have __auto_type back then.

        Arnd

