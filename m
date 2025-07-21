Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C3C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 04:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkkRCoPbO262N6nh5T1e3WS51jJoTMENI1DUO2zY2Qs=; b=vL28tUXyWal4NwprIi0mGGL97R
	HQ2p98BNe8ZgxCEH+ln19LCPjbNP9UF0QtD1GUlkWUq8p+SUlM60tJCReNblNAuHoTCl5Sm3e+pNe
	PMucogsMm4SEBDeW/LX/0wi479ZuovPDjbCFSfDL9Hh9BJ9K4uHpEcUlq5wYj0NMvtXaV+w8ODLBr
	yZ3+nFbKV43TPD0/DLyhh250uG6jYIfAZny0SvW+7UmB3DzNPqr3FWO2kH3hCYWQo86wyiRKEHDZD
	XURUv7n23X5106i2ZxkiFCRNbxwueEOxeQ89HS8B2qd4hI/QzzbQKFaoFchwV4yATd6pDAq03tCHQ
	FLMMIgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiNs-0000000GBuA-0f2M;
	Mon, 21 Jul 2025 04:44:16 +0000
Received: from mail2.coasia.com ([112.168.119.159] helo=spam.coasia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udiCJ-0000000GATt-40T2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 04:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1753072336; bh=fkkRCoPbO262N6nh5T1e3WS51jJoTMENI1DUO2zY2Qs=;
	l=1861; h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
	b=tgvv69//Fs2/46nT31h2p0wGINamYYhDrCg79CyxUey8MTdRF1HJGc/TKxIYA5Rc0
	 XlNgTsN+sZhzN3g1aJ5a+q8qXiGKCc3wsewQxj5nCw5eyP5Y+xniRugyr7dvH5dIjW
	 tZ4Mxu35CtyS0zkANrBXcO1f39m/BIYPhB2j5YR4=
Received: from unknown (HELO ?192.168.1.65?) (119.65.249.123)
	by 192.168.10.159 with ESMTP; 21 Jul 2025 13:32:16 +0900
X-Original-SENDERIP: 119.65.249.123
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: hgkim05@coasia.com
X-Original-RCPTTO: linus.walleij@linaro.org,
	ksk4725@coasia.com,
	jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	mingyoungbo@coasia.com,
	smn1196@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	ravi.patel@samsung.com,
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
Message-ID: <d8ab3efec0eac72e74cd7864c81c91cd796e3074.camel@coasia.com>
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
From: Hakyeong Kim <hgkim05@coasia.com>
To: Linus Walleij <linus.walleij@linaro.org>, ksk4725@coasia.com
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, kenkim <kenkim@coasia.com>, Jongshin Park
 <pjsin865@coasia.com>,  GunWoo Kim <gwk1013@coasia.com>, GyoungBo Min
 <mingyoungbo@coasia.com>, SungMin Park <smn1196@coasia.com>,  Pankaj Dubey
 <pankaj.dubey@samsung.com>, Shradha Todi <shradha.t@samsung.com>, Ravi
 Patel <ravi.patel@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>, Swathi K
 S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>, Dongjin
 Yang <dj76.yang@samsung.com>, Sang Min Kim <hypmean.kim@samsung.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 21 Jul 2025 13:32:17 +0900
In-Reply-To: <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	 <CACRpkdaxAr8i-AByUsxnBmoSNtEDvik3VFvxAzk525GD=pH97Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_213220_250888_4C6DC11A 
X-CRM114-Status: GOOD (  19.52  )
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

On Sat, 2025-07-12 at 21:26 +0200, Linus Walleij wrote:
> Hi Hakyeong,
>=20
> thanks for your patch!
>=20
> On Thu, Jul 10, 2025 at 2:20=E2=80=AFAM <ksk4725@coasia.com> wrote:
>=20
> > Add basic support for the Axis ARTPEC-8 SoC.
> > This SoC contains four Cortex-A53 CPUs and other several IPs.
> >=20
> > Patches 1 to 10 provide the support for the clock controller,
> > which is similar to other Samsung SoCs.
> >=20
> > The remaining patches provide pinctrl support and
> > initial device tree support.
> >=20
> > Hakyeong Kim (9):
> > =C2=A0 dt-bindings: clock: Add ARTPEC-8 CMU bindings
> > =C2=A0 clk: samsung: Add clock PLL support for ARTPEC-8 SoC
> > =C2=A0 clk: samsung: artpec-8: Add initial clock support
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_CMU block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_BUS block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_CORE block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_CPUCL block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_FSYS block
> > =C2=A0 clk: samsung: artpec-8: Add clock support for CMU_PERI block
>=20
> Out of the 9 patches there are 7 patches related to "CMU" without
> any explanation or even expansion of this acronym.
>=20
> Camera Management Unit? I think I'm not supposed to
> guess. Is is an Axis-custom piece of hardware? (Would make
> sense.)
>=20
> Please expand this acronym and state clearly that (if this
> is a correct assumption) that you are not supplying any
> bindings and even less a driver for the "CMU" thing, just the
> clocks. (That's fine the actual CMU can come later, but
> it should be clear *what* it is.)

Ok, I will add CMU abbreviation on cover-letter and respective patches.

Thanks,
Hakyeong Kim

>=20
> Yours,
> Linus Walleij


