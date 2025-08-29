Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFEACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L7tIxp28iHdwGx+yyV8tn2ybILyzU3KKi9eUDFzJnQ=; b=vDSFG/Q2XMe2wm39JssqJtAmD8
	4aSL8jT+f9Noco28FQANRe9TMf6RrOdHIahF2WLLM1sg69csBENLNUwsi4o4Ij2WwISKq4rMMdyyt
	bYPhAUbzUG5iQBkqywwAkyV4YxRY00EjpbxemrLlUSTz+B5g6tNC50S1jT6CnfTgTmwQNOYdeGs9U
	NzMiicTO7KLsAToET1MlqK9/ALpeRi5j415Gn5JoY/SBHbcboA82RpBzVEbye7w4M5jiBKQKRuEpZ
	sfLrr2ywIQGI94shbD4biPDwuv7pQg8SXBUDfk6shjlQXqjzGr7mNaHnyTib7e1lwsMPTnCI1EcY4
	9wfVvKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzoC-00000005ybY-2rvX;
	Fri, 29 Aug 2025 14:10:29 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwu6-00000005QhB-24Z3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:04:23 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250829110420epoutp020f19476c60efee1e0980e6f76bc9ba7b~gOAfDItV81576215762epoutp02B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 11:04:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250829110420epoutp020f19476c60efee1e0980e6f76bc9ba7b~gOAfDItV81576215762epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756465460;
	bh=7L7tIxp28iHdwGx+yyV8tn2ybILyzU3KKi9eUDFzJnQ=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=VORTWOy224KaeLooY5g47tq5zVTcMTcGosppxHtcA4QJEbcxpjdptFnswY29OrEV/
	 A3CUi2jLxPWhrcmZV0m3Fkd/kEkfjS8uLKPABntkm/Cq/iK5nA3rTayTswacSo1yKI
	 u4dJEL8qxiyrbgr1J6cXsxU1GzqSFPzrpvJ2Ki7o=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250829110420epcas5p357d652ed6ae1444487ef4e97d369560e~gOAeocNpJ1820418204epcas5p3r;
	Fri, 29 Aug 2025 11:04:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cCwPv3vfTz3hhT9; Fri, 29 Aug
	2025 11:04:19 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829110418epcas5p183ad72839fc6cce33835ddf0c9bde53b~gOAdcM9D92447624476epcas5p1d;
	Fri, 29 Aug 2025 11:04:18 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829110417epsmtip21ab963b0b3d34a58966d8d60e6db17c9~gOAb1AUNn0933009330epsmtip2e;
	Fri, 29 Aug 2025 11:04:17 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Ivaylo
 Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Tudor
 Ambarus'" <tudor.ambarus@linaro.org>, <linux-fsd@tesla.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250822121423.228500-8-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 4/4] arm64: dts: exynos2200: Add default GIC address
 cells
Date: Fri, 29 Aug 2025 16:34:16 +0530
Message-ID: <263c01dc18d4$aa870120$ff950360$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJyWVpz9P/Dzbtkobqw1IWAkgYZWwJZwFW7ARdQs12zMW310A==
Content-Language: en-us
X-CMS-MailID: 20250829110418epcas5p183ad72839fc6cce33835ddf0c9bde53b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822121440epcas5p2d67b57b6b165f1f555bea881145cc9db
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
	<CGME20250822121440epcas5p2d67b57b6b165f1f555bea881145cc9db@epcas5p2.samsung.com>
	<20250822121423.228500-8-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040422_847296_BAF44EB1 
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
=5BPATCH=204/4=5D=20arm64:=20dts:=20exynos2200:=20Add=20default=20GIC=20add=
ress=20cells=0D=0A>=20=0D=0A>=20Add=20missing=20address-cells=200=20to=20GI=
C=20interrupt=20node.=20=20Value=20'0'=20is=20correct=0D=0A>=20because=20GI=
C=20interrupt=20controller=20does=20not=20have=20children.=0D=0A>=20=0D=0A>=
=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.o=
rg>=0D=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung=
.com>=0D=0A=0D=0A=0D=0A

