Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F03C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8ucfQhgZWfFMrx90PiVaYFGDbhMLBpVnSk2ahzmCzU=; b=FIGPNaYLQ/kAwUNYoE13LRLS6s
	gFS6vzfKA0/YQFOQLhgb2HZAz9aXKPsxLtK7gtqjmQMMiQv1AeXOU3rMFdmYPtbnw29E1y9cEI/lj
	MinOMG5aXdwyZG4mrAilXAzoUz+gLecrr3fpgmEHWSlEwjjkpPpzSFM03EU5JAgpqN5cL+uRj4ii3
	eZ7Fd1Q0BHQaZAd3h4Vivv3zijis9VcZb5a5j9Mz11PpT6PeG81CyQ7jzE5/JL/sCJeVR9zrNQZOX
	vTB741TJKDqJUE/ALmbxY1KhCB51N3FC1JAGDmIF+Gnz22cL5XOpgl7VU+T9dnOVVnekxYi3G15Tx
	YvEzn0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u291d-00000004D1D-2YvD;
	Tue, 08 Apr 2025 13:30:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28Ed-000000040aQ-0hTe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36D1BA42F6A;
	Tue,  8 Apr 2025 12:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED53C4CEEA;
	Tue,  8 Apr 2025 12:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744115960;
	bh=zdCrsvBkwkAlbHAMoR8vjGyP4JtXAOHDR8/3GQ5F2NU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=o9ze+47oXEJjDau0UliiX+wd69R3bkdCG1e4NviVmgYys7L4RgCEcF3SXFhRv1lB1
	 L17/jBFcA7cJZKvTK8hc06sfpFd+n6AL8zfCvyM7p/Ig+jN7CSjaNDDdI5BMRvTLHf
	 6urA/yky9MYeVx0SbNlxTrbstytaP++FFIPLuG1t7ygO1pTMosRWB6u4Sjlr9vFgYm
	 BKK+lA/KPvcigw617O4YIdWwDUNitupXLhE3vRiy/Gz78ZmSpG99MTkElOoBAr4KLo
	 yaLfPxZ5cLu6Q7W/uSc2HSxa9mrngII2bqp94OiXRjwdKK5CietJ62hvugdqolEgBU
	 /TlLbWSl698ig==
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id EEF5F1200043;
	Tue,  8 Apr 2025 08:39:18 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Tue, 08 Apr 2025 08:39:18 -0400
X-ME-Sender: <xms:9hj1Z7YStGxhPJWouy77Luwn3tWvtZAxmT5YqW7-aiLmEEortt-wZw>
    <xme:9hj1Z6aXOW0fX4RdemxR-_KqIJgCk9oUU6BnMlqBb_S0UXmb5RWNy1dmMHqUBuoSj
    bi8YT73h4nVDWtH2FM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepudefjeetteelhfegudekhfetffehtefh
    tdevkeehfefgtdehheeghfektdekvdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpd
    hrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehgrhgvghhorhih
    rdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshgvsggrshhtih
    grnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehkrhii
    kheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivg
    ifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghi
    jheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghnughrvgif
    sehluhhnnhdrtghh
X-ME-Proxy: <xmx:9hj1Z98NLfhVvk_WwDWYro-8r2kGMF_kTBz7QrHGLdJnbd5aLv29Iw>
    <xmx:9hj1ZxquHJbn6HNz8hHt6sNVN62ln_TV4WnBJToT_N5fUAP6hm4YaQ>
    <xmx:9hj1Z2pB3fZrFsT3Hxe0aczAKDriyFZShNINA2kNSAx32G6RuzKGZw>
    <xmx:9hj1Z3SymJ-8EfUHR8xHPJcO9tiiZQwDG3xETjIF6Imw05vOCN3MEg>
    <xmx:9hj1Z-rE5bH55SCa0_P3mna9HYzHJ-fpboXX-IGUR673DMi_bANSM4oJ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C426D2220073; Tue,  8 Apr 2025 08:39:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1587df106ca63dd0
Date: Tue, 08 Apr 2025 14:38:48 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Andrew Lunn" <andrew@lunn.ch>
Cc: "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <18d59ff1-a357-413c-bde2-961ae0c9b5f2@app.fastmail.com>
In-Reply-To: <CAMRc=MfC7GukR5ZidkZJA8LMZaVXyqeygdUBz9v3oDmw8k+OPA@mail.gmail.com>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-1-9e4a914c7fd4@linaro.org>
 <b032eea6-96c9-4511-8085-da9f5655c252@lunn.ch>
 <CAMRc=MfC7GukR5ZidkZJA8LMZaVXyqeygdUBz9v3oDmw8k+OPA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: orion/gpio: use new line value setter callbacks
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_053923_337322_2DD49943 
X-CRM114-Status: GOOD (  14.81  )
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

On Tue, Apr 8, 2025, at 14:12, Bartosz Golaszewski wrote:
> On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
>>
>> On Mon, Apr 07, 2025 at 09:09:18AM +0200, Bartosz Golaszewski wrote:
>> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> >
>> > struct gpio_chip now has callbacks for setting line values that ret=
urn
>> > an integer, allowing to indicate failures. Convert the driver to us=
ing
>> > them.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> What is you intended merge path for these? Have arm-soc take them as a
>> whole?
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>
>
> That would be best, yes. I'm not sure how many of these platforms are
> actively maintained.
>
> Arnd: you were not Cc'ed on this (get_maintainer.pl didn't show your
> address) but could you take this through the arm-soc tree?

Sure, can you send them once more to soc@lists.linux.dev, either
as patches or a pull request?

      Arnd

