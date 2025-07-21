Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E48C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUvt4uOf/Ru4kgfEPi2+qpIEYi6/+xiRiZIqZJyY9XA=; b=094mjhKgwh2WRwvWgb4PnyJzLI
	QIiqNfIV+bB6AeSwPomJy95XPkAl+3xH7GKSzZRzDBK4uElW1WD8F1DiX1cjJ1bdOgNL+5Z6cWziT
	O4z5+tc+YZUmob3xmGT7yIXfDckYPB7XLoSpf10PVTY/OQe2XxVkeAfvHyNgaNhfghkOoOXWEzUe0
	ZnLYW34tmrAs32bvMvo5KGxD482n7gGfvekMj6E6H4PVKVmYpsBay7dg0wjR30ZYq2AexVavgBvvN
	QuJey0rcmSgKYuvHzJPgoFwa+f3mxeNma+4Jjd3skIZTWQBl8FZCtM91Q7K0xaDUk9e0PzI2t7x/y
	XjgPU5eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiLU-0000000GBbH-1TA0;
	Mon, 21 Jul 2025 04:41:48 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiCA-0000000GARf-2uVX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753072328; bh=BUvt4uOf/Ru4kgfEPi2+qpIEYi6/+xiRiZIqZJyY9XA=;
	l=779; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=p9U22kuo9b8aaIP7HaMyDGVP6kJEFxbzwswB6a2qKxQh+98hzMzwCHV/LEWBlaWR8
	 wSakoJWIaB6Hd+1vD+hKXSe/1g7g6F+0rYP0/4je9j00bEvgJzlsmJYYERytjUNdDE
	 p6kUgpSZW5RggOt6nNUXj9PFT3EsPZHfE7U/6WI0=
Received: from unknown (HELO ?192.168.1.65?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:32:08 +0900
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
	soc@lists.linux.dev,
	v.pavani@samsung.com
Message-ID: <e8b6dd576b006fe443451c1dbcd5db35f6f1d98b.camel@coasia.com>
Subject: Re: [PATCH 10/16] clk: samsung: artpec-8: Add clock support for
 CMU_PERI block
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
 linux-gpio@vger.kernel.org, soc@lists.linux.dev, Varada Pavani
 <v.pavani@samsung.com>
Date: Mon, 21 Jul 2025 13:32:08 +0900
In-Reply-To: <6d5b4e08-ddf0-438b-a188-fd8b48f3e2d2@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <20250710002047.1573841-11-ksk4725@coasia.com>
	 <6d5b4e08-ddf0-438b-a188-fd8b48f3e2d2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_213210_992370_073C5C79 
X-CRM114-Status: GOOD (  12.08  )
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

On Thu, 2025-07-10 at 09:13 +0200, Krzysztof Kozlowski wrote:
> On 10/07/2025 02:20, ksk4725@coasia.com=C2=A0wrote:
> > From: Hakyeong Kim <hgkim05@coasia.com>
> >=20
> > Add clock support for below CMU block in ARTPEC-8 SoC.
> > =C2=A0- CMU_PERI
> >=20
> > Signed-off-by: Varada Pavani <v.pavani@samsung.com>
> > Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
> > ---
> > =C2=A0drivers/clk/samsung/clk-artpec8.c | 90
> > +++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 90 insertions(+)
>=20
> Please squash all the clock driver patches.

My intention here is to split the clock changes so as to make smaller
patches.
I will squash patch 04 to 10 and make a single clock driver patch.

Thanks,
Hakyeong Kim

>=20
> Best regards,
> Krzysztof


