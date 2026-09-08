Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15325C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 21:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHeVyoRZa5bzvMZFXHX2pnTEuWP22KkhzmvZL93CYjU=; b=kPT9aQNm+3xI2TGTluQU/UGoYs
	YSqiWSZGcJ2m+ELAvwrWOJfvCzpbzOchDKAMBsUXM3pxDuyQ/lU4uYibxP8VNR/5gG7pDdJavP/Zd
	ogBGORgPuvPy8Kc20s3l7GsILyVHxp/ru/JJT+7+hiKFk/B7AHmJImpqywZOP0ljwgAXynvxrx4IG
	PDIDCMB5CjgbaOKv5mEI3ORAdj8XA+kg4t/ycfWk7yiRoaNTPZKfNxr0moqXQkFokpbv3idSegi7B
	/rH60dATOQocyURPyui0wXDR4ATZ1LQQlkcSLc2B32Y7IzH/lbeawUw1RUBlTSrCk9JxZpzLgPMUy
	8uA/JdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43RL-0000000AK6g-3v6k;
	Tue, 08 Sep 2026 21:33:15 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43RJ-0000000AK6D-3DeZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 21:33:14 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 3AFDE1300C19;
	Tue,  8 Sep 2026 17:33:08 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 17:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788903187;
	 x=1788910387; bh=DHeVyoRZa5bzvMZFXHX2pnTEuWP22KkhzmvZL93CYjU=; b=
	R6DcFHtfC8d9m7oGqZtrAVIjNrw7ZJ25HduhAgNa6wWLEiRSfRAvCMkQcb+TnEmn
	6RJn6yudamIek6tVOsNs8K5mnktHqRUtKIUa5XR05LpYF7EpGuf2o9U298pfd1pZ
	R6cubNoL/UpkP9S+iLT3kWxiMExp++mFHsfgumbGEOWfXQaFyYI+Ti6JJdMDvV59
	yh0GXXHzihCLFQ7cjG5Qa6n0S2zJRXNgtGookn+YQBTpBoaWNr1rKYXKLLwwBPMR
	KUmr9wFBrsvBE3ypUSefYI797QdVQgn3IAAquMRi8+OyRZ5D7zl3AlTSxdkQfeR4
	kNtdN/N1IquR2qavZBaeFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788903187; x=
	1788910387; bh=DHeVyoRZa5bzvMZFXHX2pnTEuWP22KkhzmvZL93CYjU=; b=K
	5fiYbiHr6+3zUdHnvQ4whOn7jhhO1f8BCePlpTan3niIMn/fY4Y3oEbtP3trvV8/
	U60RDJ9PrfZj/BgsUwXGBmIu004M4HYYyTt6hvY29+a2nQ8+hFXpo6LQLeIxMXTx
	zLcmACBMNu/TH+FYw98GrJEcBPgNdjoQB8/BA54rMOY+K+yJklNk6/t0ltS/renn
	M9bR5El6mPWJhlS0/PVIs3rQ98wsesXVDyivwNzLqjIQhDezrE68YhE7ndWQSmEa
	JtgiNkLekRYbnlCO4oSfl9Cp/qoCt71Xli3tvcEdJa+BY9YRb7FAlhkXGqyORSfY
	VK0JS5j3BcCkUnpbe/S9w==
X-ME-Sender: <xms:BX-gan9uDTZjFMtz7uiswUC5l1xG4tjAPNhGTeV9uUcr3p6c6ZQw8Q>
    <xme:BX-gauj5oO9KE768YFWHBjdUU5zi3cEgFyqgexmW6RRVf01xuhoQ0hj2zhdWIblhs
    e0lWGiMwjkBJOU8a6Bu1ygJRoQggOIBPYMn4atuiHKCXcbEhThRIuo>
X-ME-Proxy-Cause: dmFkZTFkZRAq9OscV/rQQpnQvuL5fXj2gffXK4SxYiFAoyeVl5NkU6reCbRCLnKorSaemz
    WueOW17Uu3T2iToY/AKaEaLNp+vE9CNO2JxUrjaQIigTmtxn895HkPO7Fz0+voz6Y5fFVU
    6yuRlW2vLaUNd5DO39Ee9aM/EE9j2Ne8gjkE3ji5xldvud1HLp4l6ldWYVzwCOqd1wi3R3
    zUBxarxblHLM359+Km5yzxvtssSSw3EiySPQGAQgz2tbotMeNq0IFVCgBM7wPUBiKm83yI
    G8OfaqLFvlRtN4JZCggPI4XeYCegk2yzLARziG5W4E2rrBV44CCYg303tWltnrOAUU8htq
    ZsV4pxYT2gbzAKoOzUFuCx24Ktr56NV1NpGCHeUlnQA/e6sI4grpl8Pv0bm0LgKOHeUiHQ
    kIql8AOvd3JhNbfSnpLfELWc1DJ9weePIw7ueqU4ehP/dvpejMZ5XunRqoJfNtEsjdaqBO
    xcOKx3T2Oy6EeVn1E7tbRst5yEooHTuRRGPKP8CPUoCK0TUdnT/7DnQUYYsh2oxl2BQQOb
    bo3EINTomzY0sOQybZJuH32SjdZ/OIlHNF1OykIGMGIeUHXT2qDT4gNh5Ex+XjWvHKsZ49
    l5pj1xKTe+tTuB8457nFm+VYToNZaIH8R4fs5RU34hVLpPmYiVkJPmP5N2ww
X-ME-Proxy: <xmx:C3-gakEcJ4GhwVA1joR4oCawyFfIrhR6TnB65iffu3HQvY-yTsQ3Jg>
    <xmx:C3-gau2JvEzthorIw0-9XHBI_g4Vt2EM0sJqQ3rKYQ4-01heonLFtg>
    <xmx:C3-gamw2xnFclntHcLzRe7mLHQcVgwERhkwLUk4HRCIkpNbGS_9_cQ>
    <xmx:C3-gaoFGM59GCcXe6tG8lWdBOlgeVHpnEf5sFw-Qg0n9KDSh2bQzYQ>
    <xmx:E3-gag5MLaQdTQmLi7YRqIHgz4miN6rpJasUfAKv0oA59wwDcvnrBF5S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 05A5A32A007B; Tue,  8 Sep 2026 17:32:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AwGOxrB98c9B
Date: Tue, 08 Sep 2026 23:32:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Pitre" <nico@fluxnic.net>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Drew Fustini" <fustini@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Stefan Agner" <stefan@agner.ch>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Roger Quadros" <rogerq@kernel.org>, "Tony Lindgren" <tony@atomide.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Karl Mehltretter" <kmehltretter@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Guenter Roeck" <linux@roeck-us.net>
Message-Id: <cd80749e-0d32-4efb-af4e-eff8cd553fb4@app.fastmail.com>
In-Reply-To: <ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-2-arnd@kernel.org>
 <ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_143313_866935_9307912E 
X-CRM114-Status: GOOD (  11.91  )
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

On Tue, Sep 8, 2026, at 22:36, Nicolas Pitre wrote:
> On Tue, 8 Sep 2026, Arnd Bergmann wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> Most sa1100 platforms were removed a few years, with the remaining
>> ones left as a starting point for a conversion to devicetree.
>>=20
>> Nothing ever happened on that front, so remove the rest now,
>> including the sa1111 and locomo drivers that were once shared
>> with pxa but are already sa1100-exclusive now.
>
> The SA1100 was the starting point of my career. Feels strange how much=20
> time has passed.

Indeed, same for me: my first paid job involved both SA1100 and
the i486 compatible AMD =C3=89lan SoC that was also removed this year.

> I parted with such hardware a long time ago in any case.
>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>

Thanks,

       Arnd

