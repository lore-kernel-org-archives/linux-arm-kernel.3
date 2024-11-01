Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FE3E6F072
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNHBMWzMD0NkocAqxwRh+MsZa3vWvxzvM3VdrJFfGM8=; b=xai/921CNTeZESF3akaJW8oy/Z
	R1Q/hWO7ISAbqEly1iGXfwWFyDtnruFNLfC5k5x+mYGVJXu7KM2enEffuMaeh50dbsqHG0cjRfXEn
	xs5BQaC+grWjCuGhrt9BenfL1erwV/xtrYxrk2WBzjwq2tzMs0A0GzRowsXNdkq1jYPKDz+Ijxec/
	1hhGjzOeiJ76WGTu+REyZDu8JxQZkSGprafkTOXM/ElvHOPm+0+yvuN/aYKwbrtBanT7UlOS2wCd6
	Urt6UxpqZN5e7Dy9sEtDUINlsBDxEPmBBHe5ENA+j7rMQH59d9RGzb2gMBzp3Ab7mbKo6iRQ/LeFT
	pZTVMOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vUT-00000007qce-3ncG;
	Fri, 01 Nov 2024 17:31:18 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uMi-00000007drm-1udy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:19:14 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 30E2B1140168;
	Fri,  1 Nov 2024 12:19:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 01 Nov 2024 12:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730477948; x=1730564348; bh=GNHBMWzMD0
	NkocAqxwRh+MsZa3vWvxzvM3VdrJFfGM8=; b=o7vpaOIOMhBTDnnIBq4DTTS3TD
	mcTjIFbaCJEqHFrDXQgMFh1Kd9i3S18ndp02te6drKJjpfxGb2HlcMZtWnkJ5CHY
	MdDCQbM8MGrbkRs8JlELheLdFTY3RtaxP8ZWM+Th/ZO/Z3GRbxKR5bPlRBk7beLL
	2x1mZwUMNNXsUrmh/tcaPeG7vpSIQLkE4/ncMXnbdPdWMsntvDvHyKMbHaQkrcdL
	irTgt4ANrlJuYNcocoUtHZB/1eL+tGRTS/O4GVtcQz/mII0LbQ+/WUN33twm7llN
	LzR1e5m2/t6oq6Yw5LCCr+32mbMRA9rBc+6GyhCKLG764AdIwyRe58lUbARQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730477948; x=1730564348; bh=GNHBMWzMD0NkocAqxwRh+MsZa3vWvxzvM3V
	drJFfGM8=; b=RELjwy8121HB4CAmI/ikAW784AJyek7dbq6QmgxImiVB5Ghj3Lr
	h440rCbcwHnNnMGYTDcrzg4f4+8QZw0LGmFmJUFta6Co201DJVXrXqUQ9lg1OtyN
	PbQCfQ5gt+ajjQp2+ft4zVcIclb0HTTzgsXuf4oPatxqWEmYpaiALd5r2zLkYFwi
	Il0NfLjzrThh/K9pMjINt0v5lsVpRO5LYqZPebouABKnFZsyHozRMI+TF28PWYXx
	1p+Fbk3fQHbnFlqodaV2cKflUM1tolAWaZNN5nVqjngJR0gjSvTdBHZeu+U/tzQL
	ijUm3mD5mX0fWCRM+JyQxw3MPEljYtcadwg==
X-ME-Sender: <xms:e_8kZ8QprNSabMxxUFBd1mej28P07D3DYighSP-WUrVM6ZQzwy-ggw>
    <xme:e_8kZ5z8efst3Z5klllVV3zbueWAFRYUxAkbJj6fpdhIhTg6JPSKfYYsnpLq3PTgA
    glVtm-sYp2nsjVIvDc>
X-ME-Received: <xmr:e_8kZ50OFcvBsBwTWnV3fXB7iY_CgLNSz4M3DKokepl1TnDAbnhpYr2lxEVwrLktuvEipQ6xwxWZOHak8ctOQImirbRzTwxWST0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledgkeeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:e_8kZwCzt0aws-_lwbhVUfa6KB1UiP_CRfzPP0vBfYKP7dXnJBOe6g>
    <xmx:e_8kZ1j7TGefpKR_BbVS2p5Bc1dkR6PFYEpogrJDiHymD4RbdGAKAg>
    <xmx:e_8kZ8qwnquqlBZ21pLj2iAb5m5BH68sQkghrs4I8vHZNWiFrxVXsg>
    <xmx:e_8kZ4hTPD5nHLRGQ16g22C4ZdzMT3b98fG92fFs58TOm1o1hmiBIg>
    <xmx:fP8kZ-ZFRMagDDBxQVcs4uxML9aDGlKW1K-V7ozF0gcFTD8CSPuzOUV4>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 12:19:06 -0400 (EDT)
Date: Fri, 1 Nov 2024 17:19:05 +0100
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
Message-ID: <20241101161905.GB194146@robin.jannau.net>
References: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
 <20241101-asahi-spi-v2-2-763a8a84d834@jannau.net>
 <e3008c6b-ba71-46cf-810b-053dbafe2cfb@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3008c6b-ba71-46cf-810b-053dbafe2cfb@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_091913_361099_2B7F0B7E 
X-CRM114-Status: GOOD (  17.09  )
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

On Fri, Nov 01, 2024 at 04:08:20PM +0000, Mark Brown wrote:
> On Fri, Nov 01, 2024 at 03:25:04PM +0100, Janne Grunau via B4 Relay wrote:
> 
> > transfer, most of which we do not use right now. Hardware CS control
> > is available, but we haven't found a way to make it stay low across
> > multiple logical transfers, so we just use software CS control for now.
> 
> It is extremely common for hardware CS control to not support multiple
> transfers, I wouldn't be surprised if it's simply not possible.  We
> could potentially use it with compatible messages it seems dubious that
> it'd be worth the time/effort of checking and using it only some of the
> time.
> 
> > +++ b/drivers/spi/spi-apple.c
> > @@ -0,0 +1,531 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Apple SoC SPI device driver
> > + *
> 
> Please make the entire comment block a C++ one so things look more
> intentional.

I did after your the same comment in v1 but reverted that since
checkpatch.pl complained. See

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id=a674fefd1732#n3742

The inconsistency between *.h and *.c is surprising. I'll change it and
ignore checkpatch.pl for v3. I'll address the other comemnts as well.

Thanks,
Janne

