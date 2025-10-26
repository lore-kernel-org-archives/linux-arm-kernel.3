Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B588ECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7UdEVIlntkszLli0S/TFlavELFitFXzfvVw5MucTl0=; b=AURs/mUdS/FtRIh5WL2c/nsmEn
	r7UC9Ti3FlH/KGA7FmDObZWFd9CIX1gpO8Bka64PGzCIi/qnwpC+ovT5MuIZaPb9nOav/m8wK4GvC
	dfZXY3KWqstY+JZAF2hBaspUQtOCdIUNSALmY1D5Iogviqv9ycB9zaCTjlFL4bWI1LcZ+Jh1UL4b9
	RYlPoFBmrFKlnDkgvBrEkDEkPEs7WXQ9w5LXrpxBYRs4i2PvCuCVyhZqJ0BEnasAchqyYIClJjfC9
	TCmWWO7vVbBKBV8VkQ9h7wYdlDgrdOcdXe9OTDPglbgJgOKU7fFr+zFTKe6ZXZYZXs33PajhpCbk9
	I5lcuktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8jB-0000000Cmqm-1Hit;
	Sun, 26 Oct 2025 21:56:41 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8j7-0000000Cmpz-2QUU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 21:56:39 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 695621D0005C;
	Sun, 26 Oct 2025 17:56:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sun, 26 Oct 2025 17:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761515793;
	 x=1761602193; bh=y7UdEVIlntkszLli0S/TFlavELFitFXzfvVw5MucTl0=; b=
	XaBmpLD+LLeWJoGjZwoKia3QmFKuayYFAHLHT3EXyjHmc+Eh4qHMO4V/FeyUmU8c
	SWOV/DLEkF74br/bFNRg8RuRoRVPF5ZnuvxqErrQZzMbma9jiHXxHG3qvpATBGr8
	FDoQMzP6yiyl4UbJkKh4MPVmtnEURz8f7nNRgIZH5rg2DQjkNddg7Mh0m/na0Wud
	f70PUlD+4v3h3lBVO5CygDlD9DUZRBtJHxu+KtvqjM6lW6I5Jmb6MDMTdmJk5d5R
	K1Pnoo8VADM1HgzqM2a5pvYwruOzReW4DyTcgjrtP1hgM6sdz/+lKN0Iri3wYj6m
	fkKKXwBcejmfo7jI9cwJcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1761515793; x=
	1761602193; bh=y7UdEVIlntkszLli0S/TFlavELFitFXzfvVw5MucTl0=; b=j
	FOu5oZDPmXHh/h6qY+bgIvUXI4m8olyRcOE9gNNJJvtdG+DD/tKqfWItWTThT12Q
	r0sE8aHS/xfYhQCQ7KAFVUwzugH2QgTpn7wcJO6JPOHCIVvz7Tt3yljfvJF8J60I
	AFE+haJ3umDixYwo8bjCDvqA6N4ydo4a6TK4It5mC9ivSmrTzQj4Uzy7U1LyDASN
	q3/KW2q/XJThJCt7KL+NCA9vPSj2HAK4ODfLDyOGjsmi5F6KNq16M2ECR7rEdIGg
	aLzBc8NLSmE4u35wFMDjh7++i3jfqdUIt0Ha7QciSZNX8APPXZY38SHkrqAeNC/V
	JpNOGvv3Oiqq3xPyoIgBw==
X-ME-Sender: <xms:EJn-aLwt7Zji3qfRQJPMXs3e_x-fNA4075OtQTFYLAQwgb2C3S0Skw>
    <xme:EJn-aOE08kDyuC8ZlA06xKnOA1qnEXbjt7iCAfFPU1D-XLTmMr2HPsYG_u7FqGB3y
    7eKDwcFwIsJso10sTe2b2vmnfNaMkgER73CqGZWpU2Fi1g4YIZ2XjoJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheeivdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihu
    khhirdhpohhulhhoshgvsegrrhhmrdgtohhmpdhrtghpthhtohephigrnhhghigttggttg
    gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhl
    ihgtohhnrdgtohhmpdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonh
    drtghomhdprhgtphhtthhopeiguhifvghiheeshhhurgifvghirdgtohhmpdhrtghpthht
    ohephihuiigvnhhghhhuiheshhhurgifvghirdgtohhmpdhrtghpthhtohepmhgriieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:EJn-aIn6soyeVtgoHZ3U2rqujtnGkW4somAK8tQfDboMyb1IojY3ag>
    <xmx:EJn-aEgOQoe6g5JEV9p1536F0QLAefAcFgsK9uX9zqI5yZaEKQVcAw>
    <xmx:EJn-aKinQgTM9_6yG8XjF89VPfsYadmjFNLlUx_QnQcD1UtzbICjFQ>
    <xmx:EJn-aOtFqI_0G5WmIjpkNTlsYwP8X8nQVyF-KWiIoEO9Lw8tvX27RQ>
    <xmx:EZn-aPngnqvEIxk6GWlFQulajBkas19foFQO2f6X16Jd8Qvj8O905GXy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 06280700054; Sun, 26 Oct 2025 17:56:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmBleg0913uk
Date: Sun, 26 Oct 2025 22:56:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 "Yicong Yang" <yangyccccc@gmail.com>, prime.zeng@hisilicon.com,
 xuwei5@huawei.com
Message-Id: <6bd7fb2a-f9b6-4fbc-8c22-86af6ee662ce@app.fastmail.com>
In-Reply-To: <752915f0-1085-b32e-f94c-c6c68dfa6cd4@hisilicon.com>
References: <20251024090819.4097819-1-wangzhou1@hisilicon.com>
 <20251024090819.4097819-8-wangzhou1@hisilicon.com>
 <e40ce220-e857-4ecf-985b-40407f99fcb3@app.fastmail.com>
 <752915f0-1085-b32e-f94c-c6c68dfa6cd4@hisilicon.com>
Subject: Re: [PATCH v6 7/7] kselftest/arm64: Add HWCAP test for FEAT_{LS64, LS64_V}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_145638_300430_45FFCD20 
X-CRM114-Status: GOOD (  14.25  )
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

On Sat, Oct 25, 2025, at 12:06, Zhou Wang wrote:
> On 2025/10/25 0:18, Arnd Bergmann wrote:
>> On Fri, Oct 24, 2025, at 11:08, Zhou Wang wrote:
>>> +	register void *xn asm ("x8") = src;
>>> +	register u64 xt_1 asm ("x0");
>>> +	register u64 __maybe_unused xt_2 asm ("x1");
>>> +	register u64 __maybe_unused xt_3 asm ("x2");
>>> +	register u64 __maybe_unused xt_4 asm ("x3");
>>> +	register u64 __maybe_unused xt_5 asm ("x4");
>>> +	register u64 __maybe_unused xt_6 asm ("x5");
>>> +	register u64 __maybe_unused xt_7 asm ("x6");
>>> +	register u64 __maybe_unused xt_8 asm ("x7");
>>> +
>>> +	/* LD64B x0, [x8] */
>>> +	asm volatile(".inst 0xf83fd100" : "=r" (xt_1) : "r" (xn));
>> 
>> Relying on the __maybe_unused register declaration seems a little
>> fragile, can you change this so that the inline asm specifies
>> all of the registers correctly as input/output arguments?
>
> Seems we can remove xt_2 ... xt8, but add x1 ... x7 to asm clobber list,
> something like:
>
>     asm volatile(".inst 0xf83fd100" : "=r" (xt_1) : "r" (xn)
>                  : "x1", "x2", "x3", "x4", "x5", "x6", "x7");

I was thinking you'd define the function in a way that would
all arguments passed the way one would for a caller that
actually cares about them, but for the test case I guess
a clobber works just as well.

>>> +
>>> +	/* ST64BV x9, x0, [x8] */
>>> +	asm volatile(".inst 0xf829b100" : "=r" (st) : "r" (xt_1), "r" (xn));
>>> +
>>> +	sigaction(SIGBUS, &old, NULL);
>> 
>> Is ST64BV expected to cause SIGBUS here, or should it return the
>> 0xffffffffffffffff output to indicate an unsupported memory area?
>
> I think it should return 0xffffffffffffffff without an exception,
> will modify above test codes in next version.

Ok.

      Arnd

