Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CCAFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VszaiiOS69LMCrF4cs+T+KN9spCJ8nVeRr4kSbOs1XQ=; b=0zHMYvnTtja8w13CXTJ2wEIXBq
	ft+FWR97Nmggxie/8U62gmGlJHIkGG/2XHs4YOKhxI8Bf3TzcI7MMTH56AFIOsv9EAOq4KLXo0fz7
	Eb/GRc4a9vlUrGqZJnwW93fyD7HZAvDt43X0j0hNXVI/4HAyHl2nvITe3cM93PvORVy3zEjNYk1eX
	lKwRTU0A1VVCWq3Ub6cQZ84Tnwa0hZpPjoN5C/AZtWRob1pzqVQaKnrR30iJKBV3LQWqWCEQrjpcS
	6BigMFO9kv2OmITQ/bK+3sVR14QrAVCoYq192KN1FPNCKKn9EPKi9+S99JLpwGkQtL7fEkks7GWLg
	HC1oFFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJZn-0000000GjU9-1zfc;
	Mon, 27 Apr 2026 10:52:31 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJZk-0000000GjTW-1PbJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:52:29 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D7B677A00BC;
	Mon, 27 Apr 2026 06:52:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 06:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777287146;
	 x=1777373546; bh=VszaiiOS69LMCrF4cs+T+KN9spCJ8nVeRr4kSbOs1XQ=; b=
	i3lKiaXV1DkZ7dW7YxB0zQBj7iLHSfc30tdPzrsF+LdH55SqyMKCJp5g45zn9wpb
	wQnu/3lSs6alP0zb/RlIstJWCRPxrcVVZ/LVhFGns8vlj5EVZzSH6gnARb4HunHT
	UFlAdlTGiW7+C8gTkm0rZpuOdFmzhvXJ8TboWVUDBmSH/9HmmJocBOLF/RN92dCj
	0VxSNh1U1r/D9GcXq7qya7oApU+AkVwTsoPW3dZ1JetNjc8Ln4YYWUCdxHnR67kz
	PUnwReYoqBj13a4QRbd8Hl6mPdYkPMDDIjsDdCH0LaojvzgH5zGggaD/PundXGd2
	RpeZ7fjKpJFIYTGMwsSW+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777287146; x=
	1777373546; bh=VszaiiOS69LMCrF4cs+T+KN9spCJ8nVeRr4kSbOs1XQ=; b=s
	q0xlL49/jJdl1t2cEtLucmn0Q9bXqfkKBiXTm5f3kSlshyH+XuoJOVTqCT4/7lyt
	lQfJ5my5YtLb/b22yJJ1ewi8bnmCDDr4tS7gX3lM9Qdq49UcSa6j0j7OXQ6DX4kL
	jmYOpP1P8KHwdv7CW25yUWB4jm4Xa1WIDWHYzAIrtLXnNsZsNGbuarNMlS1tE/5k
	0q7ZA/5kN8274gO62/WZC9AKpPZfgIYtGsjc4NOHDAvLoWsrPKiWh9OSjHpb18Gq
	FljH+v9gBbqniVnE3AO57oaCUNtPEH363bIshQH07MPgQuHXd3KN1VQOaDrLljhR
	FCtmRAfYzfqWcrqTkqYeg==
X-ME-Sender: <xms:6j_vae90RTOVVNevnRVJ7_7NkpEW2pW4JrnqAC6w5ePkOAZXnSWZ1A>
    <xme:6j_vaZhXhCUtRtYEnMWD6jbEzzdLhuVoM1AzsFeq-MCe_cjVnq_XK6DSN1xFBNE2l
    eGz8XatgZi6K8dfspSEfMN7lgfpYA-0Ler7ub4GKtbCX6EXYdOnSjs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehkhhhilhhmrghnsegs
    rgihlhhisghrvgdrtghomhdprhgtphhtthhopegujhhrshgtrghllhihsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehjmhhkrhiihihsiihtsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohepsghrghhlsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6j_vacMXLOCRI7xDUznXTth8jdPsep2YclT8G2_FhbPaB3u1JYokhQ>
    <xmx:6j_vaQKnGyjQT2V7a9bokjAPQlndHf3khTSONj8OIR8S2dMInAIoiA>
    <xmx:6j_vaXxgYZU7PKY05SkCYggqJddVDeQi6MeiOqc8SeGwdsj6wLqcfA>
    <xmx:6j_vaQ6EPqeScOkCDw-NObr5fpNmf2LvgLqTcSUZ2s4j5itKTbMAoA>
    <xmx:6j_vaUSzpLA04WEL2-l84ubvlS_Eq2ohIFp_r3RJzzp9oCnpyJ2Hjha8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 849C770006A; Mon, 27 Apr 2026 06:52:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AGuRs2470qq3
Date: Mon, 27 Apr 2026 12:52:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Kevin Hilman" <khilman@baylibre.com>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>
Message-Id: <94985c72-fd4c-4afd-aee6-881d1f17b2f6@app.fastmail.com>
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-1-b693296c1985@oss.qualcomm.com>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
 <20260427-nokia770-gpio-swnodes-v6-1-b693296c1985@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] ARM: omap1: drop unused variable from omap16xx_gpio_init()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_035228_466211_7F679F38 
X-CRM114-Status: UNSURE (   7.37  )
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

On Mon, Apr 27, 2026, at 12:46, Bartosz Golaszewski wrote:
> The pdata variable is set but not used. Remove it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm/mach-omap1/gpio16xx.c | 2 --

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

