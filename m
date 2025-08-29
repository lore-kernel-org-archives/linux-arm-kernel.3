Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57C2CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPgQdRftW+MPJm/ScWqWeD+k9GOL06cZoXpzePwzSYI=; b=2kTJDeUaF/6FI4APATzpmA/OQV
	/7U4LCF0SkUVBY/7EchRCabHBHW31hx+w/SqoYxHV5q79GZm+umhH2sl7+6ypWRPfijlJlOzyqkyn
	5ROBkyovqnwVcA/qEL8Zra4nrFWTNRuf9XYvv74eBMG+cUK2SMoL7E2SnnnFqXSxEy4m2ccLB5Vu8
	Ru2O3UNIhOhXg18mXueb1ia55zqDWImd1bVrJx3E0tdB6Mryj8M2W6A5zQ0K5rJ3oJqNLrWY8+nQw
	S2mS1VpwbGWEwkvJGtBXRzMjNoQtz/5ZAOHk2vxx69coT2pDcw7wB1t/5uG9r9geABmloA34166VY
	ATs9ZAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzdN-00000005woz-0W0C;
	Fri, 29 Aug 2025 13:59:17 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwqu-00000005QD5-3Muc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:01:07 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250829110059epoutp02ae0b3ad41ad3d3bec90ac46717d166d3~gN9jpBcte0858008580epoutp02c
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 11:00:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250829110059epoutp02ae0b3ad41ad3d3bec90ac46717d166d3~gN9jpBcte0858008580epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756465259;
	bh=aPgQdRftW+MPJm/ScWqWeD+k9GOL06cZoXpzePwzSYI=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=REASU3wDLBTazBjUUN6CSV10k3nzQPDf9/XjvmttU7nF5FGTy5HB6N5CTf2n5SZka
	 0/ZFIFQ3AgQEfWjaZPGZJZ4Ql1vtr+dwhbfPMHgj4vLYbM7M1uh1JmjfyRa3SL1/pL
	 eNN9dj9nkuEotOcfmMkUKauYx/6Wmad6rwMFXYco=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250829110058epcas5p115d5fa830820191971707c8d7cc6ab89~gN9jEzUgw3096530965epcas5p1X;
	Fri, 29 Aug 2025 11:00:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cCwL20y3zz6B9m8; Fri, 29 Aug
	2025 11:00:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829110056epcas5p1de7c054c261d077f66688e4539ea63d1~gN9hJ8fZY3099430994epcas5p1K;
	Fri, 29 Aug 2025 11:00:56 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829110055epsmtip23b5c3d53b927185e53c3c59a2a8c9789~gN9fhcY7a0750007500epsmtip2q;
	Fri, 29 Aug 2025 11:00:54 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Ivaylo
 Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Tudor
 Ambarus'" <tudor.ambarus@linaro.org>, <linux-fsd@tesla.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 3/4] arm64: dts: fsd: Add default GIC address cells
Date: Fri, 29 Aug 2025 16:30:53 +0530
Message-ID: <263901dc18d4$32051700$960f4500$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJyWVpz9P/Dzbtkobqw1IWAkgYZWwJfCO3YAL3x8o+zNA2QIA==
Content-Language: en-us
X-CMS-MailID: 20250829110056epcas5p1de7c054c261d077f66688e4539ea63d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822121438epcas5p48dd8463382036e86f1422300427b2189
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
	<CGME20250822121438epcas5p48dd8463382036e86f1422300427b2189@epcas5p4.samsung.com>
	<20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040105_172687_C3F4D1BA 
X-CRM114-Status: UNSURE (   7.46  )
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

Hi Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Friday, August 22, 2025 5:44 PM
> To: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>; Rob Herring
> <robh=40kernel.org>; Krzysztof Kozlowski <krzk+dt=40kernel.org>; Conor
> Dooley <conor+dt=40kernel.org>; Alim Akhtar <alim.akhtar=40samsung.com>;
> Peter Griffin <peter.griffin=40linaro.org>; Andr=C3=A9=20Draszik=0D=0A>=
=20<andre.draszik=40linaro.org>;=20Tudor=20Ambarus=20<tudor.ambarus=40linar=
o.org>;=0D=0A>=20linux-fsd=40tesla.com;=20linux-arm-kernel=40lists.infradea=
d.org;=20linux-samsung-=0D=0A>=20soc=40vger.kernel.org;=20devicetree=40vger=
.kernel.org;=20linux-=0D=0A>=20kernel=40vger.kernel.org=0D=0A>=20Cc:=20Krzy=
sztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=
=5BPATCH=203/4=5D=20arm64:=20dts:=20fsd:=20Add=20default=20GIC=20address=20=
cells=0D=0A>=20=0D=0A>=20Add=20missing=20address-cells=200=20to=20GIC=20int=
errupt=20node.=20=20Value=20'0'=20is=20correct=0D=0A>=20because=20GIC=20int=
errupt=20controller=20does=20not=20have=20children.=0D=0A>=20=0D=0A>=20Sign=
ed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.org>=0D=
=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=
=0D=0A=0D=0A>=20=20arch/arm64/boot/dts/tesla/fsd.dtsi=20=7C=201=20+=0D=0A>=
=20=201=20file=20changed,=201=20insertion(+)=0D=0A>=20=0D=0A>=20diff=20--gi=
t=20a/arch/arm64/boot/dts/tesla/fsd.dtsi=0D=0A>=20b/arch/arm64/boot/dts/tes=
la/fsd.dtsi=0D=0A>=20index=20a5ebb3f9b18f..5b06e2667b89=20100644=0D=0A>=20-=
--=20a/arch/arm64/boot/dts/tesla/fsd.dtsi=0D=0A>=20+++=20b/arch/arm64/boot/=
dts/tesla/fsd.dtsi=0D=0A>=20=40=40=20-363,6=20+363,7=20=40=40=20soc:=20soc=
=400=20=7B=0D=0A>=20=0D=0A>=20=20=09=09gic:=20interrupt-controller=40104000=
00=20=7B=0D=0A>=20=20=09=09=09compatible=20=3D=20=22arm,gic-v3=22;=0D=0A>=
=20+=09=09=09=23address-cells=20=3D=20<0>;=0D=0A>=20=20=09=09=09=23interrup=
t-cells=20=3D=20<3>;=0D=0A>=20=20=09=09=09interrupt-controller;=0D=0A>=20=
=20=09=09=09reg=20=3D=20<0x0=200x10400000=200x0=200x10000>,=20/*=20GICD=20*=
/=0D=0A>=20--=0D=0A>=202.48.1=0D=0A=0D=0A=0D=0A

