Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBBEC88E6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IfPvmYKcPzCTIR9O8n/ZZl1J7ESmm5QMdaDtE3F9Ak=; b=x+w9lea2pnYPbKa824NSQldwrd
	3SSr0GmzcCsevoywODkmw3dBcU2tFVdI1CzdWH1ft7h3jdfA8g56OtHBiNDXVYLpj+QjN+MUI9BKQ
	Lsu+v0HEEXPHF5BsHvOmXsjZKpu0G1yRuRBjnYbeRfx+GUuHapgf4by6RtJZsOYRPeV292uuE+ywQ
	SFIGEnZfvdXrc4iO1p/jZzAI55JyYX/HiQIPgRh40h89THZ9I2YOL34L1e+u3e+ftmNEtO5cmAxcp
	AFeLtIZ5Dh9LluGNl0P26m6jTirej47J89dLo5sv0VU7sbub+hGjaSESNdA89yFEUa6UjZjv7y+4R
	7hwgQ5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHT0-0000000C4LG-3TSg;
	Mon, 26 Jan 2026 07:56:58 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHSy-0000000C4KR-3Aha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:56:58 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EE9AF1400133;
	Mon, 26 Jan 2026 02:56:52 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 26 Jan 2026 02:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769414212;
	 x=1769500612; bh=3IfPvmYKcPzCTIR9O8n/ZZl1J7ESmm5QMdaDtE3F9Ak=; b=
	eDOHAvbfe67c7eNr6nvfZediiLLte7005PrRqlu0iOJYtnxgkYz8ahsKixtMWmuD
	u8u8nGO1QkjwNaktsBNh2CV5c+9vSXwE4p0INN+HMcT61A1rtud2mCDy2LUIuaaS
	mG7qawiTbA6SBlvFMx4B5MjlsBQ9hkpApdV6pksVN44LVf2NDjdgrnq+oXw4cKTu
	Eda9a2eXauZCaA0oJCQQ30By2P3Bawit66b+1DgGCEqNAzUK6wTbLYnjVygmPTtL
	e1cqM4Y93GWBjzGAh/p1xZA7oFWvRyW/fCvq4Cks2Z/e5OUQdufbB4hLLVv5326K
	M3NxG9mJ2mScK+XkgXhkhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769414212; x=
	1769500612; bh=3IfPvmYKcPzCTIR9O8n/ZZl1J7ESmm5QMdaDtE3F9Ak=; b=W
	3fx2I7+Tr3U/oGqVC8/FrPV/NMfI3Cy8wmbcKoMJ4yMyysqKEdx1Dv0JWlON72n3
	NW/N8kpdDewTu/Ld03jpDt0mTYMXFy+qVOV+x928f2Aw/7qsK/+5mr6NhYzK2NWt
	ZtxkaZVbty9gKQpYkOaQY3Uu6gQ9AI59N+OOvL1clClFURNjw4Rf5E+AcNtL2cTl
	ajRffZ8guBUhV57QGkQ6gQzfpOC3S8MN1o0QLH77PNmaXBsJLDm/5lTpe1BTr3Ye
	M7oAzYxYCGQeBbz+td+Pdh2AtaP8/WFH9A3ht3kZYbw7Wem0WOrajZJFBdFjcVH/
	e7HOsm5c8lvji14tfgEsQ==
X-ME-Sender: <xms:RB53adg4XV3YLrQwjKUTfLbpfRx-xYDDm43MvU6zuE2ok_iyZaWZvA>
    <xme:RB53ac0XchSpGcx1Vhll0YcisS3D8rMC31psmJm4eDWDwL3Ot7sEzlKR9lGABVtEJ
    1o_zH0UQYwPvKgBi-ZDdiA7iWnBuNUArkmJ4SRM7a6IFGD6DEQkQrM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheejudefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:RB53aReo68kLo8Q1IJCChvRmKN-3htxlI-nXrn6R5155lU1DAyOEzw>
    <xmx:RB53aVm6-evyg8KFJbFCbA2umpHntC9GhAPNbn3962Rs2sCPDehgTQ>
    <xmx:RB53aWxvvEu_mZ49ut_QBMH9nYXstucdc__dd9-N53eNV8C0M_RVTQ>
    <xmx:RB53aYwYVFAceK9En2bDONpgdSB5BKx7v13o8NcOATLXSbVwLVH0tw>
    <xmx:RB53abOVjjg5sh8HqUZ3KEB_tzykmn2fdXpbJmsUeO3-psbeH5fcgbBp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B7E8700069; Mon, 26 Jan 2026 02:56:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ArrhcHX-7EeF
Date: Mon, 26 Jan 2026 08:56:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Will Deacon" <will@kernel.org>
Cc: "Ingo Molnar" <mingo@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Waiman Long" <longman@redhat.com>,
 "Bart Van Assche" <bvanassche@acm.org>, llvm@lists.linux.dev,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
In-Reply-To: <20260126002936.2676435-3-elver@google.com>
References: <20260126002936.2676435-1-elver@google.com>
 <20260126002936.2676435-3-elver@google.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_235657_252526_41FF1447 
X-CRM114-Status: UNSURE (   9.93  )
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

On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..9963948f4b44 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -32,8 +32,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\

How does this work with CC_HAS_TYPEOF_UNQUAL=false?

As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
on gcc-13, clang-18 and earlier, and not strip out qualifiers.

With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
__unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
to do the right thing already.

     Arnd

