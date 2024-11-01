Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF112E6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYVPEmwAUmdoUxoWOzZktGM/4ECkeYtdHMXZnU62Ywg=; b=Im71d4KlxrVGs4DRL+07Iw17PA
	x+tXJsVWx6zFJoy4OOWs7E/5CrKYnSJp19A2BBpgscVOYxC8FNxYqe8nq2T9+8CJw2TvgbIOkm1td
	ekQ1yaO9PNcGGKuQ0WxaWYYlTCJEJIQ5DrfGf1+KjgiYuKwe8pJkwYEWEhAKkFGzCaplrP29t7nWI
	AYDWNDchJY7mJJsEBNFBzpNAv4uLsWGtDkTIwOV3HJGXVNno1eWxfWx9FQHJTbbP4jVJHoBWmf8VZ
	WOxjVbIOicldJ79mONRa3kOA1hoUo71Fe41hVCwpkjUHwxvAkTWiQpduj0f7U3GbrRsTU1rLZOi89
	ANrcvRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6upB-00000007kFe-1KjC;
	Fri, 01 Nov 2024 16:48:37 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ugc-00000007i62-0GMr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:39:47 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 31A6F1140186;
	Fri,  1 Nov 2024 12:39:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 01 Nov 2024 12:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730479184; x=1730565584; bh=JYVPEmwAUm
	doUxoWOzZktGM/4ECkeYtdHMXZnU62Ywg=; b=xMkhhGShkcvD81kye7d2wlEQ1K
	Pfp0tN5EylGJ/IH8N9YFBuhx9QkzZywWeHJOF7JxupDu3XcDstkD70olgYjkiDbW
	RJ4RcQlWqid0BthqNfUscRtUaQOEvlaIv+lyOGZB794ZqdGq4FLFj3iUigi27W/u
	X/K13wghn1xg8JAGFgOhTY+MUkOzfFCy7dKryRwv9FMoXb5gyv1Vog2TiurA4xUu
	DEcFZ2x0c9ZCauVQc6qyIozENf7PlygJX6y2g6gepYOOGGPualoibnco2ym+WsTn
	OL4EQG/pk1w2FfA4lz6GAWgOXfN1t8Q7B+TGo34199Icdnzeltq7Oi4rVr7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730479184; x=1730565584; bh=JYVPEmwAUmdoUxoWOzZktGM/4ECkeYtdHMX
	ZnU62Ywg=; b=oGFgaypwLSA/5OLbFe59kL9Wt/EFwbaVDOpD8RLF/LjPg65Gglg
	xj+bbNOJQE0+Oh5fk4mRS1NZvfqe81CAkEtZMiOW8GmiVLMKGu6y+LMMLOEo2StK
	QCxzoXzj3F+RYImvmCzM0CfyRR2v4Zh3Yg7PjbQklnuVbOVihTmx3vcL7toom0mJ
	7FB118uFEPyXws2DrMYSICL+kRjQrbd9bDxKqcqFzhKwiUWqhhFEwKDW0DJMdKiy
	1Mxmm84dgWrhvIcD+XSjtssWH8hsl7MqYsBI51p2NgDJ4ShBzy9oT84dlXBSqBGF
	x3CMUDFWMe2kB2yf4tLVzY1Hauht6Ox7PPQ==
X-ME-Sender: <xms:TwQlZw5UmeQpcZkHFla9X91K-8GmX6gcu8xEx-yq-j0kWXw8htN5ag>
    <xme:TwQlZx56q_8b4kmR4bA2R4fahT06zxMwKM-TGi9U7_1OO8_hcDTAw3pYQncvws64u
    w4NT-9-6-u7MfKcjpI>
X-ME-Received: <xmr:TwQlZ_dKwnqMHd8FClb7qRW45QTiK2wAVGoEl8Jhn28ZqhAzkhGdRjcABqA3M_5gL_DTDaYzl_QmA161TVQr9epPJz3mVscrGX4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeen
    ucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgudeuffelfeekgeeukedtheekjeettdfftddujefhvdehtefg
    iefgledtueefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvght
    pdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsg
    hrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghr
    tggrnhdrshhtpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhrtg
    hpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtoheprhho
    sghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlih
    hnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:TwQlZ1JBq2YiYm_DIN5t3eZZF5iwFNr1zSjLotPxL5MJws2qrWo0ng>
    <xmx:TwQlZ0JAdiOnfujS6omcPe4Jgg93Pdw7F7IbE7J0zfHzXftWIDXhGQ>
    <xmx:TwQlZ2xE01BvdFRJpksiS6W98PDFMb91iDYhwld5pLMZEwAplza3DQ>
    <xmx:TwQlZ4K7mmfbVPaOrA22-zK4YRHHas8N2DMoD4YDC95zDYRBeAHuuQ>
    <xmx:UAQlZ2CgVOHKN-RMwnKFnts-G4dAMh-iwHNS-QqBl3IdrKTtAhpBbrqH>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 12:39:43 -0400 (EDT)
Date: Fri, 1 Nov 2024 17:39:42 +0100
From: Janne Grunau <j@jannau.net>
To: Mark Brown <broonie@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] spi: apple: Add driver for Apple SPI controller
Message-ID: <20241101163942.GC194146@robin.jannau.net>
References: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
 <20241101-asahi-spi-v2-2-763a8a84d834@jannau.net>
 <e3008c6b-ba71-46cf-810b-053dbafe2cfb@sirena.org.uk>
 <20241101161905.GB194146@robin.jannau.net>
 <0b4901b4-8cb7-49e2-a411-a6c57b9edd97@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b4901b4-8cb7-49e2-a411-a6c57b9edd97@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093946_191865_DD12B21D 
X-CRM114-Status: GOOD (  18.52  )
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

On Fri, Nov 01, 2024 at 04:27:32PM +0000, Mark Brown wrote:
> On Fri, Nov 01, 2024 at 05:19:05PM +0100, Janne Grunau wrote:
> > On Fri, Nov 01, 2024 at 04:08:20PM +0000, Mark Brown wrote:
> > > On Fri, Nov 01, 2024 at 03:25:04PM +0100, Janne Grunau via B4 Relay wrote:
> 
> > > > +++ b/drivers/spi/spi-apple.c
> > > > @@ -0,0 +1,531 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Apple SoC SPI device driver
> 
> > > Please make the entire comment block a C++ one so things look more
> > > intentional.
> 
> > I did after your the same comment in v1 but reverted that since
> > checkpatch.pl complained. See
> 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id=a674fefd1732#n3742
> 
> > The inconsistency between *.h and *.c is surprising. I'll change it and
> > ignore checkpatch.pl for v3. I'll address the other comemnts as well.
> 
> Did you make the comment block a C++ one or a C one?  The SPDX header
> does need to be a C++ comment (//) for the SPDX parsers so I'm saying
> make everything else also use //.  There's some constraints from tools
> that consume C headers but don't support the C++ syntax.

err, yes. parsing error on my part. Will change the whole comment to a
C++ style comment.

Janne

