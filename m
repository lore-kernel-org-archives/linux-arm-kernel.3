Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4800CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sVaGQNgxK4Rbw/HD10gBKcZbWWSomZH8okuGaQXYso=; b=kBDAY7lXxQDn53Bc/zBmfInzRg
	kUMd65hBo/MzDPCyXM0tcaEKKu/OA9ZVywWYQG1ApQfrjJcolsoIqIrifTUKygsyzDPjWKbAbGcpp
	JpPMI7vnpzGNNXEy3qxjViTYRi/JdhklS9qSfZyEgQJwbiqGN/lD4Sk0rP16y5CJYyKNSmWXk9Y+x
	UW5esfLRVETiGvmqr4evnZTTExsSlDNQlCmD/dKwg1Na6wjZMovBttrnVEu1o7EZEV5GxpSNZx0FX
	jt+K6MGlNZSF3DXWR3cj7yK3pttVgOT4VwJmkUNZkcbzh9QZW/CvDEN3S4xK91tiun7UKYECmHknq
	3b+OMPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzg4-00000005xFG-0zl0;
	Fri, 29 Aug 2025 14:02:04 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwrk-00000005QJb-0JIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:01:57 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250829110152epoutp0450e023869093c708eeab6cf8661b933a~gN_U_tPu-3022730227epoutp04C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 11:01:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250829110152epoutp0450e023869093c708eeab6cf8661b933a~gN_U_tPu-3022730227epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756465312;
	bh=/sVaGQNgxK4Rbw/HD10gBKcZbWWSomZH8okuGaQXYso=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=YiIjEgX0Fa88l3E22YhSWR0XEur8+FLVWzGOzULjwHf9njcec5yTzXwmUP6Uw6hyM
	 84wJpknbj9plXl90de9l1iySCw7nGbTZOwqjyBiiWHt5f6hTYe0arUeSd3J25x8cCK
	 +vdOhorP6MtoSunTiHp5d8NI4TMqFQkZR7Ppjyig=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250829110152epcas5p2c875773ac0e2591d7f354695fb06185d~gN_UnMCZR0681306813epcas5p25;
	Fri, 29 Aug 2025 11:01:52 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cCwM303XLz2SSKX; Fri, 29 Aug
	2025 11:01:51 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250829110150epcas5p1135d8087b4a378f4e94bfccf54f38364~gN_S4gWMT3100631006epcas5p17;
	Fri, 29 Aug 2025 11:01:50 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250829110148epsmtip1fc47927a1fa8de3f737d5650ca87b2a3~gN_RQMxbO1282412824epsmtip1H;
	Fri, 29 Aug 2025 11:01:48 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Ivaylo
 Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Peter Griffin'" <peter.griffin@linaro.org>,
	=?UTF-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Tudor
 Ambarus'" <tudor.ambarus@linaro.org>, <linux-fsd@tesla.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 2/4] arm64: dts: google: gs101: Add default GIC address
 cells
Date: Fri, 29 Aug 2025 16:31:47 +0530
Message-ID: <263a01dc18d4$51d996a0$f58cc3e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJyWVpz9P/Dzbtkobqw1IWAkgYZWwIkLc0CAemv2RazLIbKQA==
Content-Language: en-us
X-CMS-MailID: 20250829110150epcas5p1135d8087b4a378f4e94bfccf54f38364
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822121437epcas5p26305e17407130d09c6dafe5ec5afec3c
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
	<CGME20250822121437epcas5p26305e17407130d09c6dafe5ec5afec3c@epcas5p2.samsung.com>
	<20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040156_423405_2096A5C0 
X-CRM114-Status: UNSURE (   7.45  )
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
=5BPATCH=202/4=5D=20arm64:=20dts:=20google:=20gs101:=20Add=20default=20GIC=
=20address=20cells=0D=0A>=20=0D=0A>=20Add=20missing=20address-cells=200=20t=
o=20GIC=20interrupt=20node.=20=20Value=20'0'=20is=20correct=0D=0A>=20becaus=
e=20GIC=20interrupt=20controller=20does=20not=20have=20children.=0D=0A>=20=
=0D=0A>=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40l=
inaro.org>=0D=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40=
samsung.com>=0D=0A=0D=0A>=20=20arch/arm64/boot/dts/exynos/google/gs101.dtsi=
=20=7C=201=20+=0D=0A>=20=201=20file=20changed,=201=20insertion(+)=0D=0A>=20=
=0D=0A>=20diff=20--git=20a/arch/arm64/boot/dts/exynos/google/gs101.dtsi=0D=
=0A>=20b/arch/arm64/boot/dts/exynos/google/gs101.dtsi=0D=0A>=20index=20c0f8=
c25861a9..31c99526470d=20100644=0D=0A>=20---=20a/arch/arm64/boot/dts/exynos=
/google/gs101.dtsi=0D=0A>=20+++=20b/arch/arm64/boot/dts/exynos/google/gs101=
.dtsi=0D=0A>=20=40=40=20-341,6=20+341,7=20=40=40=20watchdog_cl1:=20watchdog=
=4010070000=20=7B=0D=0A>=20=0D=0A>=20=20=09=09gic:=20interrupt-controller=
=4010400000=20=7B=0D=0A>=20=20=09=09=09compatible=20=3D=20=22arm,gic-v3=22;=
=0D=0A>=20+=09=09=09=23address-cells=20=3D=20<0>;=0D=0A>=20=20=09=09=09=23i=
nterrupt-cells=20=3D=20<4>;=0D=0A>=20=20=09=09=09interrupt-controller;=0D=
=0A>=20=20=09=09=09reg=20=3D=20<0x10400000=200x10000>,=20/*=20GICD=20*/=0D=
=0A>=20--=0D=0A>=202.48.1=0D=0A=0D=0A=0D=0A

