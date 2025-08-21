Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D06CCA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EX+OmVsHALFhoO6Ww9SWkxQEx3YLEuoLuDxeJ73Y/hc=; b=JHEnMeHjWrJU2UhiD70HSXkb26
	xNPmLF60opOb3aN7DUKwTvB9L6xi9rE81rT99lXWNx03uKvLbA+5Y/Cb9BovZOkx20NaFt4KJBT/L
	g+UDLhz3LiJjf3NPuN3hH9pw3zqRqkMkFL+cA+jMMOUI6RKrOOJRCaG5tb8T33Wy2r1pU9DSC7zPe
	NB+g1FNSZCy7YoU9OZrNzOEhd5qNWdvqw4xetFft+YPTUgBsdK/PPwF2yU9BUt74sX6A5GP1dV4sA
	DI8WLews+6uojSxqbIx6+SuH634ijLh5z3n/EKKQcF4cmwGHcsiINsxHIkORkBW1qB3Ry+HqgZtQK
	ohbfiacg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4fI-0000000GwRt-0UWi;
	Thu, 21 Aug 2025 12:45:12 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2YI-0000000GcJJ-06Bt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:29:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 34071EC0184;
	Thu, 21 Aug 2025 06:29:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 21 Aug 2025 06:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755772189; x=1755858589; bh=EX+OmVsHAL
	FhoO6Ww9SWkxQEx3YLEuoLuDxeJ73Y/hc=; b=Q8VCuR+KJ2eU2Yj1L1IqI6xcvV
	a6S5ZBAtp38yxO6dvPAYK0aKoZpOEzsSmlIIkSuT3gihDHGUiqQsgj8acIpCHXW/
	uF5pgp6XhfT2+RlyjppbxG5zSK6asRHvtGhfoceevnR6PiuFj/AGWRA4Yo9cG0n1
	5AoNAop7iSInUJWyi+hL8U4yG+JPu+9WQX4+UjL8G/v9BJGo2HE9N49CYelOP6fL
	Jrxum0Realj5n0XkwZC4ooC7yTrPVDS6Imc+Y+TXrB2EXehZOFRg8LpfcD2iUeda
	VjrTQHPE6H42Ify9RhZi9wMy6IhNDW6l5UfT1s1Xk31KxAiBSZDU11hXIiZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755772189; x=1755858589; bh=EX+OmVsHALFhoO6Ww9SWkxQEx3YLEuoLuDx
	eJ73Y/hc=; b=Y74xPArQQXGdcaVLCR17ShYvusmgrHJOtbQwJ8XTc7iHo9h327/
	i/vQddq+26nn+N+/Kz1nV6L9PKtXCyaUWcJaWIpr7Cm/84eZPLanA4xmlaljxRZ3
	wZuRtb/KJzwqCMhEGBTR6IseAs5H8ekGt+H2IJcvf45VxjuiXTrDFIml8mFxDit/
	uuoa3dYRcuuRJWSEXT+rga3ZxXBjtEUvYLIi8oO5lSACnTSmrVH5g1n6K7EdeyBX
	Qs7wul+ykCrgANQSvnqdP0BHPfUhMEaWk2afXNsVykJqUUIVwoy+6PMS2Wo19qmS
	hWQ0QaGLXw1U0qIYpc8RlRZxnsiB9u85tYg==
X-ME-Sender: <xms:HPWmaFez2AGDrRjdszOhOSakiWSAhAloVVhAzowPrmhlL8oNZI21OQ>
    <xme:HPWmaJKniL0VFApnlQIx7o6WNpgeLXQHgggbjoszXhacpB57vyheUJjPMUH4bLCpu
    cVm-ozyGcDlfa77CIQ>
X-ME-Received: <xmr:HPWmaLokwvX_7qc-jY8mgvLEbOGSh0cKjnfc56aOToT6AnxomfAMzhhPu4M5dK2sOt5435T1ZURVpu0JTmEwudh7cwPLvszbQgk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedutddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdp
    rhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtg
    hpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoheprghsrghhihes
    lhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:HPWmaPvJCtGmjZVJzcl60pjY8Xh26Y-Ckbw7HmSKOeEgo33EsynQNQ>
    <xmx:HPWmaNLNHZ6aR7dav9V4dKFchmF7fh61NcF3dMJiZM7Cvqy-XQfVjg>
    <xmx:HPWmaGoxIW3WLxmleh77I5Y0miTht3-iPmyjJ4iIi-5Umaxej6U2TQ>
    <xmx:HPWmaIU5BWEs5chvI0neYUHlDpaIG-M7aKXmcfxZoy-oDkZBtmCIxw>
    <xmx:HfWmaE93QrR0D0nTe9rnjifrOMaLPReJP1q1595nUIXfIxZ2bdEziFzR>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 06:29:48 -0400 (EDT)
Date: Thu, 21 Aug 2025 12:29:47 +0200
From: Janne Grunau <j@jannau.net>
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: apple: t600x: Comple WiFi properties
Message-ID: <20250821102947.GC1270980@robin.jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
 <20250813-apple-dt-sync-6-17-v1-2-209f15d10aa0@jannau.net>
 <20250820190920.GB538860-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820190920.GB538860-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_032950_136950_D14EE352 
X-CRM114-Status: UNSURE (   7.80  )
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

On Wed, Aug 20, 2025 at 02:09:20PM -0500, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 11:53:34AM +0200, Janne Grunau wrote:
> > From: Hector Martin <marcan@marcan.st>
> 
> What does 'Comple' in the subject mean?

'Complete'. I've changed it locally to
"arm64: dts: apple: t600x: Add missing WiFi properties" and removed
stray words from the end of the commit message.

Janne

