Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EAAD690EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46hNflVp2j+I4D9so2RIss0CrD+H/bB82TUjb66XMME=; b=zNj0Zvhq1RLovkoRbmXb1m4Xn+
	hdLvaT0BB6qthhT9Ib8sVMfuzKoQCl1ZC405qaHBuV6PICWR7KkqtBFzHDGrpmUvTtE0tamvAcXJs
	wfhOf8U7Zq/4mYD8yzuXFJ8jyhdp/5FMTglY9838a5mtGgjWbekQ1o6RzrJPFStTr6guHot/LavWU
	p9ohhHKOTI/oVYW4H/pCzExxmYgMpZ5665tRNz4+i0ONWqy5OEJ2Gb0+QdEs+ed+cQIuQaMwsQwJf
	dgtuv9KcPAUr3D55Qn6Ug1cMmOw28CZ5h9zy3DdAugW+WojZWphR48L/4vzEqzyBrijzY8Qf28iop
	bc6Jm6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa3C-0000000F1nf-0MsD;
	Thu, 28 Nov 2024 08:39:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa2D-0000000F1ec-3ZPl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 28 Nov 2024 08:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=46hNflVp2j+I4D9so2RIss0CrD+H/bB82TUjb66XMME=; b=nwFYXx+ygMDGl9o0tNAzA907O9
	7blMi4wUHY0tZOt04gy/1GsZcV4mSHzG9bDp8ya5dzqkfkKFMR3yXwtAd3bXiUjkPdNlP3CBWZYPU
	y0xMDv8WFE97uY8YfO5TjFVFHwfZbOaFkh3cHoeuk+mmXk4CxM7ZVTFtTBokLnRmbWnN1QDuhWdqv
	DtMKU5VAjeIRKzGepslqyySL1GSWXiGkdNosjLgukN8XEbSOnkHUiRVVlHq1EuIC24gLkpgwYTrWI
	Ld5u595MsJG+BTl1lW3+slxP2uwLmfNAxPqMiiLeIKe9JJRf/RrRmRc9kP7tTXpn2eThQTcMB/OAj
	KwHlsUuA==;
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa29-00000001YtU-3nXN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:38:00 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 52B491140214;
	Thu, 28 Nov 2024 03:37:51 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 28 Nov 2024 03:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1732783071; x=1732869471; bh=46hNflVp2j
	+I4D9so2RIss0CrD+H/bB82TUjb66XMME=; b=fJMgSEF7tmmQnNxlSxaZOszaRT
	PH7uh/1HA61ACBFMh0IARR2U23wrxvRrVv+57Rwl5FMAF1BIVo4P2i1NUY+SmyNj
	QT3DkH41ud++tpM4CD6Y7C/2+tyxxhN8hGrPCRA2eR6xu2Z0Aghqt55WGGxo68DH
	Ju6NHQW6Vt8/6KoHDqIC0Bvuq48CSr8CBsICXvBdGFV9mv+/ExAjcFJJM6di/OnJ
	OYsXDij0RAByyCtwqhL49wHpgTE3WdJZaxRHJpfkgBIv0nX+w7WKamFkQ+PRFNmu
	/PKBeqbHhpsDbVWCUj8XDamxy4hTzccl57HLwK+jwx4vPE5x6x0XYAV7/nZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732783071; x=1732869471; bh=46hNflVp2j+I4D9so2RIss0CrD+H/bB82TU
	jb66XMME=; b=oJjmSH2Un/DuQ4yoQM2gdQ/taznaoqQV2n9hb5SJwDacVCV0/xt
	eOFocC4CT2R4JmpZTP/l8ozqC2jhMaYNvFrsVtu2lRiu3N+nSaks+OF0Wqiz2E0y
	Bk1BA7BYjFJuz6H0QOWSmCtTnTEbtwPKco2FhZkpwIXz3KTw1V17bhdw3+qHPqRO
	f05wYmqDVqMpdI80AmsYjt6IVulsVN6KIo6nKBDrEIYci6ueZVhue/2Edh3yyKeP
	MPpvFx5htKHsrxJp4ZAFkoMvOx/BM97AueRrcncxqhfA3kqWp+d/xJaTi699VNry
	UZERJNL9t97Shx0OhJ/h8ulF7lJpWuXHUfQ==
X-ME-Sender: <xms:3itIZz5jE6xs6QX7jOjfmK48yWSZfPKQMdKtR3Tei8s_fqNSw1tt8g>
    <xme:3itIZ44RiTg-AdEFxy6llExy1XT4rsF9j2gpHILQOclL52WPyStnbsM1qt1f3Vcuw
    wD7ifbJoBJbQijfApY>
X-ME-Received: <xmr:3itIZ6dlaoJYmQHlKmuBXqpKrbidflFecV_uq9Cjf80L13ePEBb4z4RA8xD_anZhISYsyrHiM0uId1tMIxprY8jtCCBNC9aO4Gc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrhedtgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeen
    ucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgudeuffelfeekgeeukedtheekjeettdfftddujefhvdehtefg
    iefgledtueefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvght
    pdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    grrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhes
    ghhmrghilhdrtghomhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhr
    tghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtoheprh
    hosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhihuggsvghrghessghithhmrghthhdrohhrgh
X-ME-Proxy: <xmx:3itIZ0K-eOv218NaJNGxYnuqSmcQCJUhezhFW5krh1DlXXFEI_4jSw>
    <xmx:3itIZ3ISdJqupmJlPmKR1ZTd10I9LhK2pFCpln2ep3cCmFKPMRgIzA>
    <xmx:3itIZ9zi_Gm2jlYDMxY5vnIDLO3gKxkpgHv30gwtqhIfiacIDVo3xA>
    <xmx:3itIZzLR67Gk9G1XNHj3CVU7-G0oI-4Us-x7llM7QZAOVpm9IjFIeA>
    <xmx:3ytIZ46GeJhAVbkyyyA6OZK_oG0CbuZhByk6M_61ooitmTYADDPNRwA5>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Nov 2024 03:37:49 -0500 (EST)
Date: Thu, 28 Nov 2024 09:37:48 +0100
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <20241128083748.GC3782493@robin.jannau.net>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <Z0Z7Lrv3rBfzac_e@google.com>
 <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
 <9dcdea44-974e-416f-9d59-204d519774dd@marcan.st>
 <969b7440-5173-4ecc-af31-c3cd1f3f5acf@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <969b7440-5173-4ecc-af31-c3cd1f3f5acf@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_083758_645412_73D6E7A9 
X-CRM114-Status: GOOD (  25.92  )
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

On Thu, Nov 28, 2024 at 01:20:09AM +0900, Hector Martin wrote:
> 
> 
> On 2024/11/28 0:29, Hector Martin wrote:
> > 
> > 
> > On 2024/11/27 17:29, Sasha Finkelstein wrote:
> >> On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >>> I believe this needs to be done at the SPI controller level. See
> >>> "cs-gpiods" property in
> >>> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
> >>> as I understand, allows overriding controller's native CS handling with
> >>> a GPIO when needed.
> >>
> >> I have already tried doing that (adding the relevant gpio as cs-gpios
> >> on the controller)
> >> and for some reason none of my attempts worked. Since there is no hardware
> >> documentation, I can't really tell why, could be possible that we need both
> >> native CS and that gpio, could be memory barrier issues somewhere in
> >> the driver core,
> >> but the method above is the only one i could get to work.
> > 
> > Are you sure this isn't just a pinmux problem, i.e. the bootloader
> > initializes the pinmux for hardware CS only on one device and not the other?
> > 
> > See spi3_pins in the DTS in our downstream tree (and the reference from
> > the SPI controller). If the rest of the SPI pins are already working
> > properly you can just try with the CS pin (same index as on the gpio
> > spec). Ideally we'd list the 4 pins, but someone needs to reverse
> > engineer the mapping with m1n1 gpiola since we don't know what it is.
> > 
> > If it really doesn't work with native CS and proper pinmux then cs-gpios
> > on the controller should work. If it doesn't something weird is going on
> > elsewhere. There's only one CS line, needing both makes no sense.
> > 
> 
> Looked into this. The pins are 67=CLK, 68=MOSI, 69=MISO for spi0 on
> t8103 (they should be added to pinctrl even though they are already
> configured by iBoot, ping Janne).

queued for the next revision of my "Add Apple SPI controller and spi-nor
dt nodes" series [0] and imported in the downstream kernel.

thanks
Janne

[0] https://lore.kernel.org/asahi/20241127-asahi-spi-dt-v1-0-907c9447f623@jannau.net/

