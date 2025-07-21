Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09BFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjG6Ce63IjihByWSeMTR6U9wT5iUKWsBHd8GH0IIsJs=; b=RFNVcW5XnV7PZDpwj7kKsuekDb
	jTQ0CW4r3iPF2CIEcIUBj4Y1RGgPVJA/hP3vNdQxhr/aW9FYCzbJYyTGT0+HRDsyErwQPExvUH8lb
	EQbSBUrB0bSeI6eflkCm8qUbIY6+jBtFXLUYkG6TptYcOz8LEGMPII1UKFBQZJOICHdh5lWGilwVU
	7jnYxm/FXXBKQbJXvvrsZDQa9SLmE/3UK6dkHMrEXRYYCV7gMu3vR/KDLn8M09qYLHzcD1WRfETtA
	yUgWHBTa+86zTsYkOxRbVaOmJu+Fb/HOwnwy1SBeQoHlzfKBekxSHRHvL6prbREhp/6Bn4qUHTdna
	mb/VsBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiJ5-0000000GBIa-0jmE;
	Mon, 21 Jul 2025 04:39:19 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiC3-0000000GAQV-1wo8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753072320; bh=CjG6Ce63IjihByWSeMTR6U9wT5iUKWsBHd8GH0IIsJs=;
	l=2596; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=KB9DnqkGqp2HGNk3OqupUAApsgTTYe0fQHEFt6fHIE5vWGeEwQplds0CRbC8W85yI
	 swAXk/OIzLA0q8At9KXEDrLIpuT4nkeJ6gLiu91z7U8RMpaTKPgu2NcpZscjKa981m
	 KpPTz0BbzekoJD/xCpQDNlKTunxwrUtriT+0vgtE=
Received: from unknown (HELO ?192.168.1.65?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:32:00 +0900
X-Original-SENDERIP: 119.65.249.123
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: hgkim05@coasia.com
X-Original-RCPTTO: krzk@kernel.org,
	ksk4725@coasia.com,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Message-ID: <35756293677efc07ce4de4d110d9e9b24ec83fcc.camel@coasia.com>
Subject: Re: [PATCH 04/16] clk: samsung: artpec-8: Add initial clock support
From: Hakyeong Kim <hgkim05@coasia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, ksk4725@coasia.com, Jesper
 Nilsson <jesper.nilsson@axis.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Linus
 Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,  Ravi Patel <ravi.patel@samsung.com>,
 SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>, GunWoo
 Kim <gwk1013@coasia.com>, GyoungBo Min <mingyoungbo@coasia.com>, Pankaj
 Dubey <pankaj.dubey@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
 Inbaraj E <inbaraj.e@samsung.com>, Swathi K S <swathi.ks@samsung.com>,
 Hrishikesh <hrishikesh.d@samsung.com>, Dongjin Yang
 <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@axis.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:32:01 +0900
In-Reply-To: <48677b18-3936-464a-a581-26a44ef76c80@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-5-ksk4725@coasia.com>
	 <48677b18-3936-464a-a581-26a44ef76c80@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_213203_769130_52A822C2 
X-CRM114-Status: GOOD (  17.41  )
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

On Thu, 2025-07-10 at 09:12 +0200, Krzysztof Kozlowski wrote:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: Hakyeong Kim <hgkim05@coasia.com>
> >=20
> > Add initial clock support for ARTPEC-8 SoC which is required
> > for enabling basic clock management.
> >=20
> > Add clock support for below CMU block in ARTPEC-8 SoC:
> > =C2=A0- CMU_IMEM
> >=20
> > Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> > Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
> > ---
> > =C2=A0drivers/clk/samsung/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 ++++
> > =C2=A0drivers/clk/samsung/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> > =C2=A0drivers/clk/samsung/clk-artpec8.c | 62
> > +++++++++++++++++++++++++++++++
> > =C2=A03 files changed, 71 insertions(+)
> > =C2=A0create mode 100644 drivers/clk/samsung/clk-artpec8.c
> >=20
> > diff --git a/drivers/clk/samsung/Kconfig
> > b/drivers/clk/samsung/Kconfig
> > index 76a494e95027..289591b403ad 100644
> > --- a/drivers/clk/samsung/Kconfig
> > +++ b/drivers/clk/samsung/Kconfig
> > @@ -13,6 +13,7 @@ config COMMON_CLK_SAMSUNG
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select EXYNOS_5420_COMM=
ON_CLK if ARM && SOC_EXYNOS5420
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select EXYNOS_ARM64_COM=
MON_CLK if ARM64 && ARCH_EXYNOS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select TESLA_FSD_COMMON=
_CLK if ARM64 && ARCH_TESLA_FSD
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select ARTPEC8_COMMON_CLK if=
 ARM64 && ARCH_ARTPEC8
>=20
> Here and:
>=20
> > =C2=A0
> > =C2=A0config S3C64XX_COMMON_CLK
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Samsung S3C64xx c=
lock controller support" if
> > COMPILE_TEST
> > @@ -102,3 +103,10 @@ config TESLA_FSD_COMMON_CLK
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Support for the =
clock controller present on the Tesla FSD
> > SoC.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose Y here on=
ly if you build for this SoC.
> > +
> > +config ARTPEC8_COMMON_CLK
>=20
> here, place it before EXYNOS_3250_COMMON_CLK.

Ok, I will reorder macros in alphabatical order.

Thanks,
Hakyeong Kim

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Axis ARTPEC-8 clock co=
ntroller support" if
> > COMPILE_TEST
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on COMMON_CLK_SAMSUN=
G
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
>=20
>=20
>=20
> Best regards,
> Krzysztof


