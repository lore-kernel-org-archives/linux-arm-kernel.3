Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE38C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRwibQTbtTFkc/qCHLHPXCkbTuwR1ipXTlm5cdeOUc4=; b=YBSQ9joKL2lnk7Yp7PmeJhDlmI
	93xS1COfQTonu6hIzWtS9ASMMFrdfqENP7SPPrg7/SGMv+EtaBVroe1xDY1MyzbR4Rbbz6b2cQKFM
	iFRJQH1U/LSkOl4LDvMoxHCqWedXXQgzEYUTR3XX2P3BNfJX3IyoS1ib+6E/h9Pa4HLx5hLBsMfIf
	KD928+vSLt0hf3r52u9i/K2skxkjl132felnS/ZoFR4V676F9cN+g+3lK+6C1VJZH2fXQ40G3PQ6N
	FLRf6f6daUqG+IZ5Znkvbl7TZss8lVIGxBCBPyRXr87JmNC22Y4dfetmtIo9RusOqACjBTZ70wN7Z
	pQf2ovkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREhq-00000005HHy-3R1e;
	Mon, 16 Jun 2025 18:37:18 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREfb-00000005H1Y-3R4a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 18:35:01 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 337F0254012F;
	Mon, 16 Jun 2025 14:34:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 16 Jun 2025 14:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750098896;
	 x=1750185296; bh=qRwibQTbtTFkc/qCHLHPXCkbTuwR1ipXTlm5cdeOUc4=; b=
	CkAQbKwLRJX2qandCly0sWKOMtf77gN4MgYUuG+OsOzmG9buhoB1zAZUt2ybs+s+
	WmpvOgS6fN47mDAumZkluDJWBK/0X5X0MWxxxXVGYGEddsSPLnDb4tDzwRPyqEEe
	1TET4TyLtO+8vp8XiTLBs7hxKkuda37K+lr2eXSvmWrkF5ewuuTW1iQdxwTkdmTk
	6eXvfnz5QtT1UDMOK+LVbs1kYSHQrteUiv0qfRYwmQD+FUq/jYyvzyxu4CKBn/G7
	yQkaK3WsuaL9pK8PdvLge8pbRkN1dCtXTgWmBXfDFQp2PJPRo8PNd1aYg+s3DHeI
	YFB789jS8Qab+ttLYZ/O0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1750098896; x=1750185296; bh=q
	RwibQTbtTFkc/qCHLHPXCkbTuwR1ipXTlm5cdeOUc4=; b=KEsNygaqVgj7WbCwZ
	Lkvakt2piIfCMaBt1ZbJrSwo4TK7oIkyX4Uoa9XJkgfm1OQP+3u1brIo11UMHbL1
	84tfEe8rsX9Q3gIlO4CAxB2hm2py3yaD8D5YdOUIVdpWbaLmFIopaUFhBbzTs/qe
	kUTiISvnEf5hjsrwF8mFI49VrSwxA4CnQw01e/+H5PaxqtIQa3SQ3iUwbxKtmZeb
	ZEnrDwtSNoPspZvBlo3k7hGL85lsrP4TdTtDQ+qF7Xb3o8DBwzPsKR0WobtUQwt2
	foTLiVMGGX7ZCjuRShvV4eFXAxLJSicbiC+3IxzCRFEqsUSxJqv1SwcRh4l1Rs4u
	q28pA==
X-ME-Sender: <xms:zmNQaIO0hvU2mt4H2Xvk5AnX0iB1kD8BTIM0kmdEAL52qNH_X7Zt-A>
    <xme:zmNQaO-pQtuwcQxZUMYxJEK6v4sPWP1MMPZ4mTg4DyfSTda8L3t54rfvrxWL8zo-n
    VTn7Y50tNPm6fcmkVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffghfetteehuefhgfetgefhtdeu
    feduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgv
    thdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrg
    hupdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvkhhouhhlse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohepuggrnhhivghlrdhmrggthhhonhesmhhitghrohgt
    hhhiphdrtghomh
X-ME-Proxy: <xmx:zmNQaPRswyGdepgzEcq8ZxPpnVu2Wrc6-oOZ7im99CjLcZTGH4eBjA>
    <xmx:zmNQaAsI7EG80DBY_yZ4XKwGWgi6xUtMqBQBeetDFZIs5zE557ilxQ>
    <xmx:zmNQaAcTIVEBWFXjvaHxr56Nf0Ub6-2ApA-P1suW0_0LL4_J5QTA6w>
    <xmx:zmNQaE0AiF_i6R0owGd_wFWswJPr2jjUGwz6T9iv27LgZiCo4HITeQ>
    <xmx:0GNQaAnKS3ebf6Eh4ZHo3SUihb-d9QthvKL2qiqOPzxP4wLM775-Y9gS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 87E5E700062; Mon, 16 Jun 2025 14:34:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tad13d72cbf59a799
Date: Mon, 16 Jun 2025 20:34:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robert Marko" <robert.marko@sartura.hr>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, ore@pengutronix.de,
 luka.perkov@sartura.hr, "Daniel Machon" <daniel.machon@microchip.com>
Message-Id: <3ba837f8-70bb-4b9e-a9f9-0e71b9e073c4@app.fastmail.com>
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Subject: Re: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_113459_918357_332C4253 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Jun 13, 2025, at 13:39, Robert Marko wrote:
> This patch series adds basic support for Microchip LAN969x SoC.
>
> It introduces the SoC ARCH symbol itself and allows basic peripheral
> drivers that are currently marked only for AT91 to be also selected for
> LAN969x.
>
> DTS and further driver will be added in follow-up series.
>
> Robert Marko (6):
>   arm64: lan969x: Add support for Microchip LAN969x SoC
>   spi: atmel: make it selectable for ARCH_LAN969X
>   i2c: at91: make it selectable for ARCH_LAN969X
>   dma: xdmac: make it selectable for ARCH_LAN969X
>   char: hw_random: atmel: make it selectable for ARCH_LAN969X
>   crypto: atmel-aes: make it selectable for ARCH_LAN969X

If the drivers on ARCH_LAN969X are largely shared with those on
ARCH_AT91, should they perhaps depend on a common symbol?

That could be either the existing ARCH_AT91 as we do with LAN966,
or perhaps ARCH_MICROCHIP, which is already used for riscv/polarfire.

    Arnd

