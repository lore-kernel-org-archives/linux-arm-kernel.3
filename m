Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF86BC83F0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxkN8U0d6DLuyWGhk7/eLOhPT1m1WWG0eL9XC0pIFr0=; b=j+1/eB60QZdLXJiKwkj2ZYLw2/
	WKZ0w5HKzsit9JNmQAl2m65T0TuwH+hUr34jEYeA1ukb/C9clzIVjtdF3MHv8J0jvIIJBR7VWAius
	tLsi05liKlofCnibV7Mue93UAhguRqpJlqyfzMXx8xDV5/xk1qbnLA0zRkzVnNAdPAOCeFPh/jY94
	s69KO5byZ1Mj4ylniyP46uO2NrYo/bQiczJJnhBeXfqLwmT1/CKebxPPoZJN+C7w9ynl5Op/zqslG
	qr6uqQaDpSJavIBm+4A1ICRmncbIPmwN0SZ3kL0fzrFbIdE2UzNUTD8Oib0GzaWXxIRo6xcAP0XyN
	UwI/mL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiOB-0000000EpR0-1YcQ;
	Fri, 04 Jul 2025 15:31:47 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiHE-0000000EoV8-2wTA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:24:38 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 5ABB2EC0B7C;
	Fri,  4 Jul 2025 11:24:35 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 11:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751642675;
	 x=1751729075; bh=OxkN8U0d6DLuyWGhk7/eLOhPT1m1WWG0eL9XC0pIFr0=; b=
	Lza9JkLPgRTi72q0CeUE1aSO92cBDepyIq07HiZRYm49g0ed9gUJ5WwPIbg03Agx
	ETl0ivARZlgi2RYninbmTmiJmbP4pCXjqVrW8cFUEMMe8tQ/Cyq0gEz7uBLn6Icg
	Mi1k12uBxYwgsaL0v2FmBijBfYLNjBOiOAvq1Hpt9Ajw+a39wKnbePKYdLbmv6au
	v2RIIEYMqfWQAYuO31E39j1KzAd2EGrvUQgoSZxqziEx2lJQ0+KbfqjZ0wmc7m/J
	meqj5rmsGeyOuSsF9+Pwm/noCawjF2I4kRlmRnQMCM7/JfzDE5iyA3BMsA0yk3cz
	R86QvRN9PYsxUavWRgzk1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751642675; x=
	1751729075; bh=OxkN8U0d6DLuyWGhk7/eLOhPT1m1WWG0eL9XC0pIFr0=; b=d
	xiUTf/1s9MLiP438ZHeuS+7xaEEutv9Mn3/TdWRxhYadPIaMe7EWFZXPZclHpqra
	RKz6rmVnOKyO1GgbACZ6IlCdfoNhcjdsT4FUMUnjb4wDO6uWLuLeGsTr6/IyELim
	ZpoZhm3wIHOi/E/LMRooNtxfO7yuOD+YC64iDzxQWX31EcrSB9Gl1wwPHnVZEXeF
	9dYRW1v1Dzlprpa3tdCGrh14EshhswUvwhD6QYBC6dJ8Rc322PT4hBsJRIgWbtZP
	83tMUkLiDSQRsy0LxCrSy00LrUEHZXYiCSghv5pMH5e+U0KubT45xqc+4MJxGcaa
	rfNZ6rCQCW+0fXJTmfkAQ==
X-ME-Sender: <xms:MfJnaNvN37HV7zgfq6jdTA8JpiW-nE2rx-WKJkpWyg7mvpap_M0SVA>
    <xme:MfJnaGeEF8cn4ICmeJVjqmjyQZLiMCOScRoieyHFnp9MrngymApUVSrPFgsgQmbKt
    Q1otTNuPvQW6D0aGGU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeekvdeuhfeitdeuieejvedtieeijeefleevffefleekieetjeffvdekgfetuefhgfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrd
    hmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepghhrvghgohhrhidrtghlvghm
    vghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguuhhjvgesughujhgvmhhihh
    grnhhovhhitgdrgiihiidprhgtphhtthhopehsvggsrghsthhirghnrdhhvghsshgvlhgs
    rghrthhhsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghhpihgttgholhhisehighgrlh
    hirgdrtghomhdprhgtphhtthhopehtohhnhidrlhhutghksehinhhtvghlrdgtohhmpdhr
    tghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvg
    gvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:MfJnaAxCTD5GLVOvef9h-xijbwlCKGjDQPooOQ9DsoQJ0-bnQyfE8g>
    <xmx:MfJnaENTwpkQ739gsNO-gNbeGdk_tRKEoXqiGjI-ufMAEDIpjF88eQ>
    <xmx:MfJnaN9pkyb4X-XNQ35bfM296M3Ectl9NE9XYjtHFlkWMgdmYd9yzA>
    <xmx:MfJnaEUKXVpOXcgkgxq-JQ0wG5cu-cG3-Cp1eCGhTUovMkmqfJ01fQ>
    <xmx:M_JnaEPhlG2tNQv7xOmXCRaxq_6QiJPS3simNK2BQ7SokKX2A-erjzIr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CBABA700065; Fri,  4 Jul 2025 11:24:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T2c71400495fa2685
Date: Fri, 04 Jul 2025 17:24:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Lubomir Rintel" <lkundrak@v3.sk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: "David Wronek" <david@mainlining.org>, "Karel Balej" <balejk@matfyz.cz>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 soc@lists.linux.dev, "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Message-Id: <89072b80-09c0-418d-b104-668f7fdeae82@app.fastmail.com>
In-Reply-To: <20250407-pxa1908-lkml-v15-0-e83ef101f944@skole.hr>
References: <20250407-pxa1908-lkml-v15-0-e83ef101f944@skole.hr>
Subject: Re: [PATCH v15 0/4] Initial Marvell PXA1908 support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_082437_009563_AAE11CF7 
X-CRM114-Status: GOOD (  10.05  )
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

On Mon, Apr 7, 2025, at 22:02, Duje Mihanovi=C4=87 via B4 Relay wrote:
>
> This series adds initial support for the Marvell PXA1908 SoC and
> "samsung,coreprimevelte", a smartphone using the SoC.
>
...
>
> Andreas F=C3=A4rber attempted to upstream support for this SoC in 2017:
> https://lore.kernel.org/lkml/20170222022929.10540-1-afaerber@suse.de/
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Hi Duje,

I see you last posted this a few months ago and there was only
a small warning that Rob reported. Are you planning to send
an updated v16 of the series for it?

       Arnd

