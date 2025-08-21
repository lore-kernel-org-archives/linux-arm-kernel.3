Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65870CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXKKI4OnXo7t/YcWii3j+mJxOzhErP8TYu8TKKt71MY=; b=1H9OdikXjRbFzvDXBuu4MTBqLE
	WvRYNR0HHteZVv1HMNhYRWqW0Rl4zl1TGcH3DM/1uhslBg79xQKNh/MdfxDxYvZb2k77QYG452Dyx
	u3gvzsSQc+GGTu0wOo3yZ7oMOcGYyDKw+ol98GE2DoY4gtgvPt7eNydKF1zk/3OXym4bp//i2wTAy
	En/mAH6QJn15XL+KmmMMCRVWwkcoUMPCsP2ZunE52BKM/fD292UO/fgveThV0W2eRvMExxaKqhj2a
	XgOEeeMuunhHsgzP37IXnN//07C/PYTVlSHldjHvgqZm7ad6NgWhtZpWFXQHaul4v97uswLmqmVmF
	0oL+dZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4ht-0000000GwuP-03pF;
	Thu, 21 Aug 2025 12:47:53 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Zt-0000000GcZm-0jUo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:31:30 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1EFD614000F8;
	Thu, 21 Aug 2025 06:31:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 21 Aug 2025 06:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755772288; x=1755858688; bh=PXKKI4OnXo
	7t/YcWii3j+mJxOzhErP8TYu8TKKt71MY=; b=j686JQrAisvABfKcShupGMSwRS
	br5RiBNpoR/5x/WdLoCsWaE/jZbUCa0bdiMZoP8mQfbjnZSrZngUR+0xsK/+9R90
	wnNIQ3oqulZFKR90W+jPHHkKqgzBvI/HnfCYpuvSEe2jqKDyV4lpfOEyuNL2/qr3
	C/w+alqMrRgqk7sRvi9VkQCqta3F/Z/ahkvTKfTY45NAFdRGqovXJ46Vbz6VZNRn
	ojUgTKpF8k56vFEsN71kcY02sYT0YEhkuM6BnJeREhrM1EHAUnlVsvhw88vB9H+T
	hUBojEAjlrZNpJNx4a2X3tdTOsQ1P/jXvbw9JhHVnuNBMIVXtkNxrnCMz8DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755772288; x=1755858688; bh=PXKKI4OnXo7t/YcWii3j+mJxOzhErP8TYu8
	TKKt71MY=; b=ELkRK+/u7cZsOZClFlftg0BLd8LFmFzLPKpEarwFmg1S5qlVmXP
	jCnWIQsQ5re3AlrADDTlfDvvLq2lUbhkEUZY8VYwX95WNmJNloY7bJNEcaUTKPwR
	hvJYt2js+Up/64jJdK7jlgapUVrbM547UZbXiXO3hob5/jHiqlYJj304p6fS7tZa
	cmXKKPhmxQqubAcI49zWX9GTg14F3dhRreEivjNtCxAmvSJfnr/10nVk11BflRsJ
	SVZQAPqPqMmxwbYQrhl3/c7PjwtCjB/zivyn3wL460o1TZGfJnq93VlvuaDc9WcL
	XJ3vmupyXBkw7cBrVya/IYk+qkPGIIhmR5Q==
X-ME-Sender: <xms:f_WmaHZb7-9Xi55LSqFbgdhaZxNCe8RPzgyDMEu0jh5xKUPhpzohdQ>
    <xme:f_WmaMUWzlarwwy7d5hhkGAqOeqsIStx-YHGL1kqb1sb6CIrECYpVUREYXPZLa55O
    ZNnnEB35t7ltJFqhwY>
X-ME-Received: <xmr:f_WmaHFPPlcnIyX62t4Lg-Sv5v2kWxUDHwpPgd3_PQZmi_JGfy2q9ZWSwJWE4OPHLwuDslf9D0t_Vplq-ccysQyfBjRBDmJz8-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedutddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdp
    rhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtg
    hpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoheprghsrghhihes
    lhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:f_WmaOZj_fNrTtNvP0lOwNRNBC3qfZShIW1IjIFRoj0EzONnzKcrKg>
    <xmx:f_WmaOF4ViS7Ns38LIbqcmqU-JXKpiAsrjJ6_rS2y6kMC9jm3NcBDg>
    <xmx:f_WmaM2AxTDvLAgkj7is4jeLWe8gIPYp0c71bcBG4rkGeM5R2l-MhA>
    <xmx:f_WmaKz4kVZWeMZGdnwhZPLVprAZ9p-TB9-8cpNELntu2Z2ChhqsdQ>
    <xmx:gPWmaHJIvsyYvtbRZcgHsJBj1t34ZPnZbGKcUktHp4tQA-6YcPP_M_2M>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 06:31:27 -0400 (EDT)
Date: Thu, 21 Aug 2025 12:31:26 +0200
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
Subject: Re: [PATCH 4/5] dt-bindings: arm: apple: Add t8112 j415 compatible
Message-ID: <20250821103126.GD1270980@robin.jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
 <20250813-apple-dt-sync-6-17-v1-4-209f15d10aa0@jannau.net>
 <20250820190708.GA538860-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820190708.GA538860-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_033129_281506_B213474A 
X-CRM114-Status: GOOD (  12.83  )
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

On Wed, Aug 20, 2025 at 02:07:08PM -0500, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 11:53:36AM +0200, Janne Grunau wrote:
> > This adds the "apple,j415" (MacBook Air (15-inch, M2, 2023) to the
> > apple,t8112 platform.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/arm/apple.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> > index da60e9de1cfbd0151e973c3aafba6d0880fc21aa..3b90b5df60507b245de387de104a4e64f234139a 100644
> > --- a/Documentation/devicetree/bindings/arm/apple.yaml
> > +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> > @@ -93,6 +93,7 @@ description: |
> >  
> >    - MacBook Air (M2, 2022)
> >    - MacBook Pro (13-inch, M2, 2022)
> > +  - MacBook Pro (15-inch, M2, 2023)
> 
> s/Pro/Air/?

yes, thanks. changed moved the added entry below "MacBook Air (M2, 2022)"

Janne

