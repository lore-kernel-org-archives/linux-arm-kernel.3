Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500E1E9128F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ouxj0cE7fpHH9EPUJdEB+G+cq7B+TFlizDXr87xbB9M=; b=BWxW7u+uoAutnXxkQ9PQ1nYCIG
	2QHsj/+AWj3Z8cjNtqklYv43re693P1iVzOaSAj0UUT5jUmxVBLx8ieLtjuh59SDchtxbWUbeIiUC
	EBe+MSwbhj3VsXZLK27dwelM5rY96RqLYseIk1Swzjo83Z/eSnbXhc7RK7ZRDwB8i3Yh4NMk5LIcR
	wm90r73zbLsbiKbucnJbRlo617ohqBNvuHkwntEbrE/YXMDNATCGdswrzfLw73nu+Ugp35pmTnO1x
	MiexQQdbIynFJh6udQWRMCu5JDiwVPJTcNzbTSnPLJ2+ohpHJrluk8sTdbu4ometzhH7awtgXSUtg
	1S1c1bZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Vf-0000000A2QU-0KE5;
	Thu, 05 Feb 2026 14:39:07 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0Va-0000000A2Pu-3zsI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 14:39:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A6F417A01CE;
	Thu,  5 Feb 2026 09:39:00 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 05 Feb 2026 09:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770302340;
	 x=1770388740; bh=Ouxj0cE7fpHH9EPUJdEB+G+cq7B+TFlizDXr87xbB9M=; b=
	TX0kMBx4VH8a7ECFHP22e6QypFGEmXpaveQGItsxnapPTJ3j5Fx17LKi8BUCt8w7
	qYEN3d+tuekKt7XU8nAxmHrO7nr6TvHSlv69S4+Z18qHkPOSUFjSGEFG1bIiWGt8
	AF4M2hloojDgefAZ2YHY1irPKJ5kwW169MZgWhofRPwH5YIf9xl+3EVieXH102Es
	1mcZZxK88CFzPJTIZQcwx4LCsOlAkSIp8j+hEIX5HAhn1WNv/dUgnlqToxdg0zdb
	1par+t+ju4+Ev2E3hAC7BdgxumerHuWs84nko4Grr0R0QtkOEAFq6x2VezdoHP3K
	cNo5ug2DL/+lmvb+LOD1lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770302340; x=
	1770388740; bh=Ouxj0cE7fpHH9EPUJdEB+G+cq7B+TFlizDXr87xbB9M=; b=N
	ZOfl6+XvwBadJ0syiqniIM1A1/D6cY13fzMYSBiDtrYRyFif9QclrGFOwVO1aFFv
	dv95RgKZB6ZbkcdfmAsqGmdtl+T3eMpZDBFWUvyGc72usBf2Za45v/GdeDfKZwuN
	EK8PYK1z+UNnX5Gh9cfmkUbLIPBiR6bLqcNlZBiswdHoJM4ocxHHcwWwEAd6XYa2
	gJI7L/FkgT/WEe9+6GTsr99WVIB37BgyI+cSbETBbdCrs6dJ9z9w03BdvqsHmbvt
	S1iRNL+nbaJOiY3jhtvx1kenMmyhffCKcNFePRQUkM3dxNFXcTg1ayi2C/kvRec/
	3prCaJB0BmONAXKjnszdQ==
X-ME-Sender: <xms:g6uEacLVhFUit7Wh8ES70P9xZ0hx1uPFe9QI8sg1i5c6MO-QGXEFEA>
    <xme:g6uEaW8jAuh1a6fUPOPVjD-eRpNfapCILwxVIqh5Emeh7Ch3ex7V02wbVNuLBg2D-
    cPLh2u-whuIFMtrQnu5EOIrgNvgJdCVQ5SfUKbuMFazgoH8Dv2xSbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepffdvjeejtdeggefhvddvhfethfdtkeeiffetgffgffetiedttdfguefhuefghfeh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdprghrmhdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdr
    uggvpdhnsggprhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epsggrsghurdhmohhgvghrsegrmhgurdgtohhmpdhrtghpthhtohepuggrvhgvrdhmrghr
    thhinhesrghrmhdrtghomhdprhgtphhtthhopegsvghnrdhhohhrghgrnhesrghrmhdrtg
    homhdprhgtphhtthhopehjrghmvghsrdhmohhrshgvsegrrhhmrdgtohhmpdhrtghpthht
    oheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtph
    htthhopehprhhimhgvrdiivghngheshhhishhilhhitghonhdrtghomhdprhgtphhtthho
    peifrghnghiihhhouhdusehhihhsihhlihgtohhnrdgtohhmpdhrtghpthhtohepgihufi
    gvihehsehhihhsihhlihgtohhnrdgtohhmpdhrtghpthhtohepfhgrnhhghhgrohduudes
    hhhurgifvghirdgtohhm
X-ME-Proxy: <xmx:g6uEaTj-zUQrkisjM-GEjDqFDb9KWw5WrPkTCF18OyeFf_WLPtob0g>
    <xmx:g6uEacK8XaIND44J4aZ4xzisnmqdVRNMzIp6Y8KQoVKUAuXi7XqZVA>
    <xmx:g6uEae72ocBMwqeNUfVN2kWT2fYIsxsVjY15Gy4gfxf_Za9GT2i5wg>
    <xmx:g6uEaZmSlCMBHxdO3BboRbOzmdFggdm42g_3vHrpTTFsGgurIbVjRQ>
    <xmx:hKuEaZUUAwlpVwbzChoTBgnyHmUgPBPoA4ogckCGZYG2hvEW7XkGY2AE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 566C7700065; Thu,  5 Feb 2026 09:38:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdHIckEZVcNF
Date: Thu, 05 Feb 2026 15:38:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linusw@kernel.org>,
 "Jonathan Cameron" <jonathan.cameron@huawei.com>
Cc: "Yushan Wang" <wangyushan12@huawei.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Will Deacon" <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fanghao11@huawei.com, linuxarm@huawei.com, liuyonglong@huawei.com,
 prime.zeng@hisilicon.com, "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Wei Xu" <xuwei5@hisilicon.com>, linux-mm@vger.kernel.org,
 "SeongJae Park" <sj@kernel.org>,
 "Reinette Chatre" <reinette.chatre@intel.com>,
 "James Morse" <james.morse@arm.com>, "Zeng Heng" <zengheng4@huawei.com>,
 ben.horgan@arm.com, "Tony Luck" <tony.luck@intel.com>,
 "Dave Martin" <Dave.Martin@arm.com>, "Babu Moger" <babu.moger@amd.com>
Message-Id: <0028a425-140d-4baa-b482-d6f2d349f8c2@app.fastmail.com>
In-Reply-To: <CAD++jLkVoorGWceRaF0VNeNLQz8TM1p2Dz-ivgyr4_T_QB_wfg@mail.gmail.com>
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com>
 <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com>
 <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
 <20260205101814.000072ec@huawei.com>
 <CAD++jLkVoorGWceRaF0VNeNLQz8TM1p2Dz-ivgyr4_T_QB_wfg@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_063903_273276_DFEC1754 
X-CRM114-Status: GOOD (  18.95  )
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

On Thu, Feb 5, 2026, at 14:47, Linus Walleij wrote:
> On Thu, Feb 5, 2026 at 11:18=E2=80=AFAM Jonathan Cameron
> <jonathan.cameron@huawei.com> wrote:
>
>> Take the closest example to this which is resctl (mpam on arm).
>> This actually has a feature that smells a bit like this.
>> Pseudo-cache locking.
>>
>> https://docs.kernel.org/filesystems/resctrl.html#cache-pseudo-locking
>
> That was very interesting. And more than a little bit complex.
> IIUC MPAM is mostly about requesting bandwidth to/from the
> memory.
>
> But maybe cache lockdown can build on top?

The CoreLink interconnect blocks also have a way to lock
cache lines, e.g. for the CMN-600:
https://developer.arm.com/documentation/100180/0200/SLC-Memory-System/So=
ftware-configurable-memory-region-locking?lang=3Den

These are fairly common, but so far we never had the need to
expose this in a low-level driver. If we add driver interface
for HiSilicon chips that use a custom interconnect, we should
probably check at least that the user ABI would theoretically
also work on Arm interconnects if one wrote a driver.

Another similar technology is memory that has already been locked
by firmware (or hardware design, i.e. not a cache), and there are
a few I remember:

- drivers/misc/sram.c exports sram from physical addresses to
  userspace. For a deeply embedded system with known amounts
  of locked-down L3 cache, the firmware could just pre-lock
  the cache and expose it to the kernel as an sram.
- your own arch/arm/kernel/tcm.c, which does not currently have
  any upstream users. I don't remember if it ever had.
- arch/sh/mm/numa.c supports locked SRAM through numactl, originally
  added by Paul Mundt. The idea of using numactl to move page
  cache pages is somwhat appealing, but it really messes
  with the assumptions about NUMA interfaces, and I think this
  is the only 32-bit target that exposes numactl. There are
  probably no applications left using this in modern kernels.
- arch/arc/ had an elaborate downstream patch for wireless
  network SoCs from (IIRC) Quantenna that would link mark
  any performance-sensitive .text and .data parts of the network
  stack to be in on-chip SRAM, but no user interface.

     Arnd

