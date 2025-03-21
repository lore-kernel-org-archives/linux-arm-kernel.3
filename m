Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC42C36007
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6kPZ0cFTmXIpixMnN6tF81nr1APN9wNYIh/tOxWbbw=; b=aEAGNLOx/LRUlhbHxR0/fAdeQp
	f9tgEyKOh054CWsfc/EVNbnOxOfqr1/6tltxJjkn9Hler2gYtXfUvMrW4Ey0NoOK2cu57RtavBfhF
	pcNaq/83wjDeHI0vtmh/8bVRrUyZX1i+NDb5GhsPHZNqkJPuEuW1ztBRaj0uzdLCBE2kf4E20CidE
	FUPbJU1mhqqHkDd4rWEZPLF+y0h3W31VzdvTOB/s8KGPDok18Xxefz5z/81BJJ9QNJn8Cqn16tWe1
	D/hB+Z3rGKEeym/aHJQsW2jZoY6dhm65xs+O6ciHzTyuBWwjzyCttUGGTpXczS5g+Z5QMgYrqXc0c
	1wkVF5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbWZ-0000000ElMO-0hY1;
	Fri, 21 Mar 2025 12:30:55 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbUs-0000000ElBF-2G9n;
	Fri, 21 Mar 2025 12:29:12 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id BBD171383770;
	Fri, 21 Mar 2025 08:29:08 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-09.internal (MEProxy); Fri, 21 Mar 2025 08:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742560148;
	 x=1742646548; bh=N6kPZ0cFTmXIpixMnN6tF81nr1APN9wNYIh/tOxWbbw=; b=
	i57tvl4VKDF5ha2G2v+8lAQuw6M4b1rAcdwypJljRX1jdQIIhzz0E6CEgVlFkLRO
	QtFqzhLS998HFqJWRmkKelAQcaTcK0YLNtn49PmynzG8d5BS7EsoRVNiuYIoIn9I
	cOiZVhYwtpQWmD2njqRcpGywgdu5+SQt/nPTb4yf8gMJbbwX9oQWrK8AkMTvoVOB
	L9FmDRNfEoZgW12ShA0klsJ9QMNk9FrVQlr6W4xkhkSf5eGpp8IdkbpOJuEE/Qmg
	lCPFhIGP50Wykl2lHlJ8xEpJHVYiNbUhYAS/6s/Ue5lmvLZ1GGZpHTY+Et+Yq5tZ
	OE8D5fzFZEcdRDWUcd+hqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742560148; x=
	1742646548; bh=N6kPZ0cFTmXIpixMnN6tF81nr1APN9wNYIh/tOxWbbw=; b=l
	T051Oi2UrKbm70CTM0+WU3RQEBl8O2InYlf0qdnaHHzwk5G/DKmvmQY4V+YoDLdm
	QJB0kaHQp9VLye/2Xf+xPqSWKQXyi08/ivcZ8uo6Mjm7/UXyd4jeDd8oB94FhdAa
	aC2Y99wIkKUoxgxQP84BNTei34kdy6grBEl3jybYMlOFcPhV2LExykGvfGQg7QXH
	P5QYIGouVKBsllY6pY33yrQvIxGDFhPJFKGTV00z6bwu67sOPPpsFCxVuqIIVKfM
	Qs66jVGIffYzvn79RakI8Q67HJVtLeA8bZT2RhUYwT+Cx7EXXNC2exbfSZPdwyak
	fA7bufMcB9yyYIgUYf9Bg==
X-ME-Sender: <xms:kVvdZ-dvlNxtgCueP5K-X9LrgmPY6bqsjmhT2RPPYtEaSwAWAGAdAQ>
    <xme:kVvdZ0gcXISmmqq1VzvW-zdk0qyp2ODnRZoy7qxoIXaKjL5LU_X1LWe1jWEw4F8_G
    dd1P2hZMkrAJWbSSTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    feeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinh
    hugidrohhrghdruhhkpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhr
    tghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprg
    hnuhhpsegsrhgrihhnfhgruhhlthdrohhrghdprhgtphhtthhopegstghmqdhkvghrnhgv
    lhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtoh
    epfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphht
    thhopehrjhhuihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepshgsrhgrnhguvg
    hnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehhvghinhhrihgthhdrshgthhhu
    tghhrghrughtsegtrghnohhnihgtrghlrdgtohhm
X-ME-Proxy: <xmx:kVvdZyTE_63LDgMM7nvl4LCgcIFqy_9iCOFIBpOZarDifNQuZnO2iA>
    <xmx:kVvdZ9x64sGPKdZ2VIrCvWv-1MNkOWAp6cmotk7ZALObl9LtLLnk7A>
    <xmx:kVvdZ9ft6EbGWl4xG5AO97oQzboLTu8b0zu7dl5RWqGY1OfLFgpFBA>
    <xmx:kVvdZ5K36lITbTqEtI95TI43l1OeBmYuUxwKKiur1-FWuKwrE3_V5Q>
    <xmx:lFvdZ0kCqZVFDyJTIxAcWCLqQ8EY8hX7Vh8b8wygXH59ssdCdw-ftcuY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CB0352220073; Fri, 21 Mar 2025 08:29:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Td2a26421dc1a91fa
Date: Fri, 21 Mar 2025 13:28:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@gmail.com>
Cc: "Celeste Liu" <uwu@coelacanthus.name>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, guoren <guoren@kernel.org>,
 "Anup Patel" <anup@brainfault.org>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Russell King" <linux@armlinux.org.uk>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Ray Jui" <rjui@broadcom.com>,
 "Scott Branden" <sbranden@broadcom.com>,
 "Tony Lindgren" <tony@atomide.com>, "Jon Hunter" <jonathanh@nvidia.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Roger Quadros" <rogerq@kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-tegra@vger.kernel.org,
 "Stefan Wahren" <wahrenst@gmx.net>,
 "Thierry Reding" <treding@nvidia.com>, soc@lists.linux.dev
Message-Id: <5fd4f314-e570-4b37-b7c2-af5b4bc85a39@app.fastmail.com>
In-Reply-To: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name>
 <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_052910_994624_7111335D 
X-CRM114-Status: GOOD (  11.39  )
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

On Thu, Mar 6, 2025, at 20:19, Thierry Reding wrote:
> On Wed, Jan 15, 2025 at 04:41:23AM +0800, Celeste Liu wrote:
>> ---
>>  arch/arm/configs/bcm2835_defconfig   | 1 -
>>  arch/arm/configs/omap2plus_defconfig | 1 -
>>  arch/arm/configs/tegra_defconfig     | 1 -
>>  3 files changed, 3 deletions(-)
>
> Hi Arnd,
>
> is this something that you could pick up? I think so far only the RISC-V
> patch was picked up, but nobody seems to feel responsible for the ARM
> patch here.

I've merged it now after going through stuff in my inbox. It's
generally ok for patches like this one to be forwarded to
soc@lists.linux.dev where they end up in patchwork for me to apply,
in case you don't want it to get lost.

     Arnd

