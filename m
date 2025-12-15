Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63495D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nX3FD3M4ElDf5gKwO+rrIIt9v74oINUi/KijGikZ1qc=; b=W44bKmIkmaCaj0blF9vZz/rXje
	LyAI2ORO5zzQKog/Oe10sPySSJwZFTwkBkHjKDOifE95Q8ElPKO+dFNnov1A2Yj8HaA4ugo+8SPvt
	94GOK6j6n4Yso3aXdOyODBwVCOWXnmFshYRMjjxJgcCUxhG3dOnrcDphHq+s0fAbS6bwWs9y4odY7
	32qA8818NkbfHiKnQHEXAbIkVcN/x347gfDoW7PbhQoSq4Ylwnfn7+qrfvA8YAgLuclB+rkIc31ao
	ULFYUscY3yLpCf0lM6oTOyfyhBUFKix7ddt13VlyXnxij8ZtiPLzdH6Btri3xLPofKW2i14A9IKMB
	T4j+BmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7aw-00000003bXd-1UYA;
	Mon, 15 Dec 2025 12:22:30 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV7at-00000003bWp-0JWP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 12:22:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 483D1130013E;
	Mon, 15 Dec 2025 07:22:25 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Mon, 15 Dec 2025 07:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1765801345;
	 x=1765808545; bh=nX3FD3M4ElDf5gKwO+rrIIt9v74oINUi/KijGikZ1qc=; b=
	QdTO6WX4YcXk7bXnZKwsFTY528xx7OGmujUKGMPJhniWiXbt1XE+JWeXRsIiuIi4
	Y1wl3UJ+yRITA2xOwZ0VaLV+IoR2iG8xm2MjHNGPcw0/jDqywKBiMpl1qzFY5nWU
	wk+6PVgItm3ZM3K8PvpKQizgw2WoNhhiP/Qa/h6xWUY+VSLUQdmUBVz6HMNMxr0e
	YEpN6JdelDi9eMuhcRQf7NegEXwahQGjT9Gtn/kQ2V0pBElg2Ecs1uIzSJXq3OYs
	4ihh7u/BZiG0m5W05q9Sk4R5a6RmLlqgOLDZyxq1MFz4l14/sFGOAkfl8ZwweD0S
	q8RHDRJ69LuZjfm/lFbZFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765801345; x=
	1765808545; bh=nX3FD3M4ElDf5gKwO+rrIIt9v74oINUi/KijGikZ1qc=; b=u
	kb2r1ZFHXhXrNhY5RqiCKkQXPcZNYTk3qcti8FAAnaTGsMPgKWKZNCyOGSPHZcI7
	fru62djvwPJgEUyNoI1N+qxsytur9rm0jsX4x3UwfaLuIE7/RMaGzo4b4wGHJw3A
	s7CUdpbdGD9OenjNnkKIQvHNTyyAhHsdo3GXAaiomeZy+onlNNzNAGQd/3WHm1qO
	jorVv+RgKMyHYVYUoUtQ8pkotNTNpTqd3GsuweywiKSmPFrxjsoGsv5FD1v+3KYr
	w3WWRwgTDtfaf3/8ZDxW0NVIF+1iOhRnpr6GojjCB/ge+2Z6vZL+NX+dgR/f5hik
	sByvndAUptbc/gF8QNERw==
X-ME-Sender: <xms:gP0_acFLbb_GMfqpajTVQ1RvZ3yTg_AZPoUVtlrxwK5GR2WQfH23QQ>
    <xme:gP0_aQJ7E8Of-BBQlR7HFtYFQQL5_zIr0MXfF_8R-7gmHqYT12GrgAu7irU7jaU_P
    ROBgSQRXpri3BvbeytywK0FEJ9gmm2qG5jNht_jfcj9dsGEjml5Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefieektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpth
    htoheplhgvohdrhigrnhesrghrmhdrtghomhdprhgtphhtthhopehirhhoghgvrhhssehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehjohgvlhdqlhhinhhugiesjhhmrgihrdhush
    dprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrmhgv
    shdrtghlrghrkheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhinhhugidqphgvrhhfqdhushgvrhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:gP0_aUmWdGnoGSoI2Xn0APXiPrU1sIZ9qr7K_jZqm7ZrC7vOkiAhpw>
    <xmx:gP0_af2QrV9dUU7LmCWJj2er0UxYWPCjLKvWZoUW1dB3FJ82g1PklQ>
    <xmx:gP0_aU1aKT_qhkjHOGIyHRjkkA7xQlCFm73BLDTm9s--uZlpp4imBg>
    <xmx:gP0_aRqBbEM0-pAsSwlHBKcbpzPhCjXUtRJla45oqev5yZIeBKFN6g>
    <xmx:gf0_aeS4nynp-ToJtmWSudM-NDnjTGbDzmQnlrIV07pa4sJsUM_i5nOP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D6C4BC40072; Mon, 15 Dec 2025 07:22:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV8M3mJaQpUZ
Date: Mon, 15 Dec 2025 13:22:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Leo Yan" <leo.yan@arm.com>, "James Clark" <james.clark@linaro.org>
Cc: "Joel May" <joel-linux@jmay.us>, "Ian Rogers" <irogers@google.com>,
 linux-arm-kernel@lists.infradead.org,
 "Linux perf Profiling" <linux-perf-users@vger.kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <0076b248-9b23-408d-9448-701df3c8d952@app.fastmail.com>
In-Reply-To: <20251215112818.GB681384@e132581.arm.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_042227_680647_E21453BF 
X-CRM114-Status: GOOD (  23.90  )
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

On Mon, Dec 15, 2025, at 12:28, Leo Yan wrote:
> On Mon, Dec 15, 2025 at 12:52:24PM +0200, James Clark wrote:
>> On 15/12/2025 11:33, Arnd Bergmann wrote:
>> > On Mon, Dec 15, 2025, at 09:47, James Clark wrote:
>> > > The first commit has an older fixes: tag and also fixes some other
>> > > issues so it might be better to take that one rather than this one.
>> > 
>> > I don't understand that other "fix", doesn't that just work around
>> > the arm64 build issue by adding another special case for arm64?
>> > 
>> > If we want the tools directory to have a copy of the generated unistd.h
>> > files instead of generating them, it should at the minimum be done
>> > the same across all architectures.
>> 
>> I don't think it's a special case, the other architectures already have a
>> copy of their syscall headers in tools/ don't they?
>
> Correct.  Most of architectures simply include
>
>     tools/include/uapi/asm-generic/unistd.h
>
> x86 includes their own unistd_32/64.h; only arm64 attempted to generate
> unistd_64.h dynamically, but this is problem for build dependency - when
> build perf, feature tests in tools/build/feature/ run before libperf and
> fail if unistd_64.h has not yet been generated by libperf Makefile.

Ah, I see now that arc/hexagon/loongarch/riscv just use an old
copy of the header based on the and no longer update them. I only
saw that they have the stub version but hadn't realized that they
never updated past the point where we started generating the
ones for the uapi.

Still, I would suggest using the same method across all architectures:
either we figure out how to use the generated headers on all of them
(including x86, which uses yet another method), or we just stick with
the old asm-generic/unistd.h copy and use that on arm64 as well.

     Arnd

