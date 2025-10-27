Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF998CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsQSIKQ8ko6FOAPs4f5QODq86FBvj6wCYn0uamacVKA=; b=dTFnknxh7qbBWFtTMNemo2OENQ
	sqoxaEVYfYGnGIEMTaZ43oGMZlEnaAliKd8ZpTn23jUvcxwRWkP8/enILSgJsaYypQBWh9B7wGqn4
	nQXw9uKACY1gLDbtEIJp8AxTA6Zl6ARudJN7/yi4KO1jFSh9HZr6lxtscoxQAuWmN8GPFDMkJZTr0
	ntjso7UMmk4uHboNPQ9PCf54GeqozOe4GeOK5YiLOkoqKc5Yo74F8lQPIBpk/uT49J2j3IstlX0vS
	a6I+T/he7qqjyj2eKFet2Nfmr/cYtyPrYzB9eA9NuGyaIgUQrm6trENj72dNZb23NxWW6GUOhp7Z9
	vGLY37oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJSL-0000000DWCy-145v;
	Mon, 27 Oct 2025 09:24:01 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJSI-0000000DWC7-2HXY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:24:00 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 36B9B7A0254;
	Mon, 27 Oct 2025 05:23:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 27 Oct 2025 05:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761557036;
	 x=1761643436; bh=FsQSIKQ8ko6FOAPs4f5QODq86FBvj6wCYn0uamacVKA=; b=
	sTKppKSKLn0IO5+CaKn4IGNnsADWQIa28VkBFIYIzzxkdIZeXaU8jrKQfWprMidd
	H/Y3o+CzPDAupFsyCiktcU3fIU4MVjRHQrpTmL0WAB9qtx44VYhQsP95nwW182uN
	znRQ+MY72wceEfQ/9XELTJms9F4JOY17LP/JpUrjWS9bJ2uoNsq4fDOX7fVA+wXa
	xkN1NjlAXIy4xi8Trg7X+LAQ7+ly1ali9ajdo7UgBVCAlKN6K5NbN7ASP0Dld2yw
	GEHQK0/k3928zegV7qlEgXZYTvYRVhuN9pWh2zrbwmoj+RHeGkMwyzRwY760PF0W
	8K9lBlkZUv1C1IrWDFczUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761557036; x=
	1761643436; bh=FsQSIKQ8ko6FOAPs4f5QODq86FBvj6wCYn0uamacVKA=; b=x
	soWpGpJTRLVsrkv21AmNkh37hc3Gkt+SFj/OGCyqYT2meN4r9BB1JhL2Nu1wPaWp
	96PZ4tDDu/hMAyy4Zk/cqk/dyKy/BwCGVZdpiPhMqgxyppxxCatJ2Zcg7s5V3y2l
	2N76VhGKw932dkosezxsM+G9BBlDoYVhudgk1YIaU3F2h8yhSgAKdvH3cuaf4xIB
	aVltC0LBIWLfF59D0Vso6jxlJy/jz9g43M+ydmb7QVMFPmcg3OjpD1Kjop7FSroI
	tlAfTGj/Q9lK96e/xx44UNA9mL0TlPLAC3aq4AGoLWwtOQN+JA7ImfmL+Lh/1wHs
	Bl8XJv6YrOUkzP3wuIijg==
X-ME-Sender: <xms:Kzr_aEPt9FilXlyftrVNXxNR6FxtsCWQaNCh8y9EQ56flfMLKVWJOA>
    <xme:Kzr_aFwLxpzAvxBYb6WKjxd2fqRQNwSeMKXhP6MyNGsf2K1Td2jTA3Zp0MtJzQxDM
    bBWR6bTZPR9I3JbHZvKMNhKbZ7efey3NrD6PEG99S1X2V_HGyICRBDt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheejiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosggvrh
    htrdhjrghriihmihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihh
    uhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepshgrshhhrghlsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhope
    hlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehprghttghhvghssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Kzr_aO2_DwtZf0NbBypm1eXjMtWMXNRtkKwEtaemqID6nIP32m5I_A>
    <xmx:Kzr_aGk8KpcopPSGBBSZfoXvcCPoS3rwsJ4CiiM0jYE1fsLT0IHk3A>
    <xmx:Kzr_aF_gDDk5UoVIoB95HTHQuKaJmoz84nAbeFEPc1orxhUBxWiplg>
    <xmx:Kzr_aELwPd8QwMcMwSfnutWaBW_QPuwBm9qRSLLhxLC2Dw_Fc9PhZA>
    <xmx:LDr_aOImeAidaajgoohjaFRY1UEvXhG8uhDUT_EsV14luDd_je7w6pBs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4C01E700065; Mon, 27 Oct 2025 05:23:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARRIUa0zdPoF
Date: Mon, 27 Oct 2025 10:23:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sasha Levin" <sashal@kernel.org>, patches@lists.linux.dev,
 stable@vger.kernel.org
Cc: "Mark Brown" <broonie@kernel.org>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <eeb6d1ab-e8ec-48dd-b8f0-0de3eaf545a6@app.fastmail.com>
In-Reply-To: <20251025160905.3857885-71-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
 <20251025160905.3857885-71-sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.4] ASoC: pxa: add GPIOLIB_LEGACY dependency
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_022358_882160_9AD356F8 
X-CRM114-Status: GOOD (  10.85  )
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

On Sat, Oct 25, 2025, at 17:55, Sasha Levin wrote:
>
> LLM Generated explanations, may be completely bogus:
>
> YES

It is indeed bogus.

> Rationale
> - Fixes a real build failure during COMPILE_TEST when legacy GPIO APIs
>   are disabled. The failure stems from `gpio_request_one()` in the PXA
>   AC97 support code: `sound/arm/pxa2xx-ac97-lib.c:374` uses legacy GPIO
>   (gpio_request_one/`GPIOF_OUT_INIT_HIGH`). When `GPIOLIB_LEGACY` is n=
ot
>   enabled, these legacy interfaces are not available, leading to the
>   implicit declaration error cited in the commit message.

The build error would only happen after we make GPIOLIB_LEGACY optional,
but in 6.17 it is still always-enabled.

>
> Notes on applicability
> - This backport is most relevant to stable series that already have the
>   `GPIOLIB_LEGACY` split. Older stable trees that predate
>   `GPIOLIB_LEGACY` either won=E2=80=99t need this change (no build bre=
ak) or may
>   require adjusting the dependency accordingly.

On older kernels, this would actively break configurations that need
the symbols.

        Arnd

