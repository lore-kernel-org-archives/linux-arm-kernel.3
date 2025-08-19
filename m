Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A5DCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4GlBd/XIgWVfoO1w0sqiwXzx+ia4mrInLsy+TcTWQw=; b=eIMN8Y1DWocm6IdpqxdTaB95dP
	gthy2ZbfmAV/oMVxR2qrJAqGO1z7zpyAlLqapFoQcA8jZKnM+Hi9CMoQdB6m9dtHVzwWxsV3TcbsI
	Fqwp3doqhHXzRIyfqyGaHpyLHy32ov9wv5uCPcDgaQ2g5cA3ByLiUlEPow/3+UZK4eH1s+Ot8SeRf
	sUnL54AL3ZbBkzZZdU2O1qdy6bb/MoGfh/x9KtZey/GHCVlN2oVIYIbXNUinJJRt4715+7wTamHhJ
	h95qcpncZPCOPhyvuJjbzbB5geWTdgRkSLjX+ztPvWpHy9cVGeAYmQhNqt1H7Xw4VBb+OCZv0bp5C
	bDTOxczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpW-0000000BBz9-01sl;
	Tue, 19 Aug 2025 18:13:06 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMBT-0000000AYnr-0P02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:15:28 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id 1E3741300BBE;
	Tue, 19 Aug 2025 09:15:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 19 Aug 2025 09:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755609322; x=1755616522; bh=r4GlBd/XIg
	WVfoO1w0sqiwXzx+ia4mrInLsy+TcTWQw=; b=VvS4YukKQYMH/apUX9we3gFDei
	4s0vaH1zyjZ2gTgEX0aNLFZ5zAH/yJQdkRP9JqZf/C5/8yvkCgyXcewYqGvqVh1k
	t8ghXmsmdm4nG9EKR23e6T5FKKlGgfv82q4dvAh4aSfx7kpB3d+2yYptSCM3Cirp
	FZXdyzDSlxW7PF+3oqaOfOZL5osz+HKj5QTo9Dhe50mYJiJqDpeK7JSxZNLrDzHb
	0D3UB2ErQEJmgS5D2UwVaiBHKTAH8OFirYDTauw6mANf8iElvinXZloF51YIKla6
	6ylueSzpQC0AEt7S2hxe37JgH5TwcfqMdbLiG2kZ8fT+zzvcRwtn+n7DduPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755609322; x=1755616522; bh=r4GlBd/XIgWVfoO1w0sqiwXzx+ia4mrInLs
	y+TcTWQw=; b=O0kPoH7DYLugERKZTUOaLyT5PkCatuc23MpbL/OGI6Ah8Slh6bk
	+A7QVJ+A9m1BREMeLGrYLxx/V9uF9YqqtDN8LyxZRVHmDFUeakG3hhDhM0ddo7Ym
	SPKbjH0KdAhCHswH4a1I2ILkbzva1UhjMWUXIMplFRtz6tdQY/FovLy89DHqAmru
	3qSsPUv+ar9W0FUdz8Tk6W0ir+zEuutbLhQk4+0klO8vVZHX8oK2H7yT1yI9n4ZC
	j1fTcSm04DGtc5Vt0i34kcpavMm6lhHREOUzMFcB8vGruYY+tNCFEYuCMeLzwlVz
	BJRkQsXVV/oEMdC2eP8gDsga6T9sMOR0Wig==
X-ME-Sender: <xms:6XikaCMDmqUs282iAXgUcaeJzI5pq11MHvZJkliABpkPBE0yKns7zg>
    <xme:6XikaHQLZ_T34kYWzQtyUOzpszOvy_BWdj7udoJm4XrF_riRjP83d_2TAHLNZE3RN
    -P4IiRzEkq0VxsOhL8>
X-ME-Received: <xmr:6XikaF9vUuFjDX_zC1pPX6yyx36NYC-3e2UaJh1UC3qa2traPIGEpKD_DWQQReIlOlijQdDaK7byjO8Iw0lw3OPgYHFIFUKJ56s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheehheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgvvg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgtrghllhhighgvrhhoshelleesghhm
    rghilhdrtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohepnhgvrghl
    sehgohhmphgrrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhn
    ohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6XikaBU-dAXIl6uuV44Gyb6UVvUAq_L4Mr6v_8LbiK65G-sOpNkHSQ>
    <xmx:6XikaDNUakmE8TkZ-wvqycdSV4I_NvnLyc9a41Hocc29bjf9LO89Uw>
    <xmx:6XikaBeRsQm8kB79Qp-yCO6U_tpxxGsbdxJB_N0L35GG_FozvguRxg>
    <xmx:6XikaKwXOyJ-sNXnGEV1Dmjuofdkh5YvIBRIFQYmok41ObktspQHQA>
    <xmx:6nikaL39rxNFN4E9UD0BxjWzewn--tY-WSa4Ru3fH5zn6un6axbaLyMr>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Aug 2025 09:15:21 -0400 (EDT)
Date: Tue, 19 Aug 2025 15:15:19 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/8] input: macsmc-hid: New driver to handle the Apple
 Mac SMC buttons/lid
Message-ID: <20250819131519.GB1270980@robin.jannau.net>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-5-57df6c3e5f19@gmail.com>
 <20250819123505.GC7508@google.com>
 <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMT+MTQvMnv4Zj3A8hskU1JW3zys0diKxWUzK5ScerxeSmgPjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061527_335824_9B4DAC67 
X-CRM114-Status: GOOD (  11.78  )
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

On Tue, Aug 19, 2025 at 02:49:49PM +0200, Sasha Finkelstein wrote:
> On Tue, 19 Aug 2025 at 14:39, Lee Jones <lee@kernel.org> wrote:
> > Separate patch please.
> >
> 
> Per the discussion in the thread linked from the cover letter, the dt
> maintainers have requested the bindings for all subdevices to be added
> together. Do you want a separate series with just the dt bindings and dts
> changes and the actual drivers in separate series or how do you prefer it?

I think it's asking for patches with the drivera and then separate
single line patches to wire up the drivers in drivers/mfd/macsmc.c

Janne

