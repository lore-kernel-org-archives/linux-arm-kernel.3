Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F62D12662
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ym7SjV/dcJIjkJNBKLo9FclTtu+qxw9/1pp0hE1zJ/0=; b=qW/pP0DKDnh1UqcdByKIbZgDQx
	W2TrH7Wd+JMWxqSime/R8t5qlOVXCZXbajKo9AA+izxxjNNV7oTTZ18ktiyigSdGb7ECVreczyEyx
	DB04TFCOX58fw1IwXSnyeElP7QB/kEF6p4cdNCvEVuTQInZT/bQIYMs2bPvN11/OtMZtIfDx8NEfW
	ICtOriuACXKPLePL9gqD+QAbNg9ORjIbaCqrqBfVU46UGhLn1m6sQKolUrHr7r6BuJkzp+qOB/LD9
	UhRfat1GBEV3Ppb1141i7ZFKs0gNAmlgPXm+yecBoYAUvB5Xu/cHZ2P05qFduVftmIyPdVQdzThAk
	GVfaFrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EIZ-0000000GEGH-2rY3;
	Tue, 05 Nov 2024 07:48:23 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EFL-0000000GDhx-3G7U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 07:45:06 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5CD6913802C1;
	Tue,  5 Nov 2024 02:44:59 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 05 Nov 2024 02:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730792699; x=1730879099; bh=Ym7SjV/dcJ
	IjkJNBKLo9FclTtu+qxw9/1pp0hE1zJ/0=; b=QWjcdGJWR3sw5TQS86oG5vnUDb
	AbrlWa9Dj1I52K1momGP0qnUnz5QBIp/R7RJMkgXUGqwzrdaWo/KCyAP3gGivOIT
	7iTVlY1jYBqRQGTTwIDhdo6JgBpyAjSG/kw7H8mKtvxdoH/IxnbS1CafV/51HfQ/
	wmyye/HV8QJ7Lnnf7GLY+TXaP+6SOyQxFYixmfjob+TZ4HCPAZXiQ9IoMP1OrKJ/
	ZOPCmFN3C07/ZUGeEdtetimLFzUF7KJbsfmsRkYHDPLyrE/aHX5GfZxuNMnbaFyC
	6x2xEXdDYKnY6EvGzN0AemYSxCeaygnAfyzvO/p6I1EIVBOHVj/HE2Pj3f7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730792699; x=1730879099; bh=Ym7SjV/dcJIjkJNBKLo9FclTtu+qxw9/1pp
	0hE1zJ/0=; b=CYKTbZJaYJSl3jIzLRQ2OkGryMyNZEDPXMtJsDxzFjZNrSL2aW1
	XzAYkGgF2i63sLgBjYYPv0hZCwULacFWB59t415OLzF3cwvnpy+Nrs5T4byuVWv5
	BnIeGuyWQOLHmMGW3FBCmd1wCX4bPrW4/1vnXU2ExH5hekZsb/sFEsDiGDs88UUt
	Xy7xDb/xTpKSOWTVsfPLRKR2qEq6E2B57kDZLhti8B3TG7sJafJkYeVFZW8eUcno
	kggUhiMh+HOPc5jSD9VGjOMh11dhITtEQfwQXQ+ueqK/BGJbcv5/TZo6KDlLg9MA
	vuBjj6s68atpeiG9unY9rsYdT2VO1V9blxg==
X-ME-Sender: <xms:-cwpZ3wnCXyyr0lismuD8R6pXFOm3DrdmR4g3mcEsYrXT269jWtbwQ>
    <xme:-cwpZ_RTpT92to-LTJkXGFG29enfWR4MC8elbgbz0lP82stG_Vk0rR60GxHjcjxuC
    9sV4fKlPXQWT9RE7Sw>
X-ME-Received: <xmr:-cwpZxVPIpd0lC2-hIr36Pem1OjmZOxHZZW_-osf83gPsKF4LSp-z3pSJkDSeFu5u-YxziHQucORPECYitCIbSOIV9tdzcAoCpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeljedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfduueffleefkeegueektdehkeejtedtffdtudejhfdvheet
    gfeigfeltdeufeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgv
    thdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggr
    nhdrshhtpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhrtghpth
    htoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtohepsghrohho
    nhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslh
    hishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:-cwpZxj2545d2OzQOOOUm1nZrHGqKOdUqUx2V-2KvLycigdo2M64bA>
    <xmx:-cwpZ5AcQSoMG4KKssg82ubxwnXY8srKjgRrqrQIKm1tqODhCmZcBw>
    <xmx:-cwpZ6IlCTOSJXlUDnBNXoxahGKUggkCuUuNfpX-0UZa7yHAPvzVog>
    <xmx:-cwpZ4AjqpLsJfHtxa2rItJ0sz2ddGV50LhWJPSeu4HPiq0vaEHBiw>
    <xmx:-8wpZxyVsuz5RqA6v3Yo3gXt_V7f7Q6Ph83nKqvveNkJq14M50Gq1dU4>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Nov 2024 02:44:57 -0500 (EST)
Date: Tue, 5 Nov 2024 08:44:55 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Apple SPI controller driver
Message-ID: <20241105074455.GA923511@robin.jannau.net>
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <vzulq4ewdbrk7qdurtypxpaoe4jsswddfprtdbudoxipf6d3ya@4gnbmr722pig>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <vzulq4ewdbrk7qdurtypxpaoe4jsswddfprtdbudoxipf6d3ya@4gnbmr722pig>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_234504_855792_752A5724 
X-CRM114-Status: GOOD (  20.56  )
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

On Sat, Nov 02, 2024 at 02:11:51PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 08:26:11PM +0100, Janne Grunau wrote:
> > Hi all,
> > 
> > This updated series address the review comments from the original
> > submission in 2021 [1]. It adds a new SPI controller driver for Apple
> > SoCs and is based on spi-sifive. It has been tested with the generic
> > jedec,spi-nor support and with a downstream driver for an Apple specific
> > HID over SPI transport.
> > 
> > As usual, I'm splitting off the MAINTAINERS and DT binding changes.
> > We would rather merge the MAINTAINERS change through the Asahi-SoC
> > tree to avoid merge conflicts as things trickle upstream, since
> > we have other submissions touching that section of the file.
> > 
> > The DT binding change can go via the SPI tree or via ours, but it's
> > easier if we merge it, as then we can make the DT changes to
> > instantiate it without worrying about DT validation failures depending
> > on merge order.
> > 
> > This is mostly Hector's work with a few minor changes to address review
> > comments from me.
> > 
> > [1] https://lore.kernel.org/linux-spi/20211212034726.26306-1-marcan@marcan.st/
> > 
> > v2:
> > - removed '#address-cells' and '#size-cells' from the bindings and added
> >   Rob's Rb:
> 
> Where?

Apparently only in my mind. fixed for v4

thanks,
Janne

