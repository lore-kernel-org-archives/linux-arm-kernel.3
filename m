Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CABC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 03:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjaBonRK6Ih+sgUNcDnD2a3SzoSU5QGqCQo2yp9Xrj0=; b=op0EnL21IMRyLUgtdxAGQJyZ+6
	k9UDt8uD61vuzY2k9mEuMlkBAK5g2gyMpJPfyOotdqfW1r9GaMAdW0Glpkjqqrq0TpxIni0yhdG21
	hqyBzbeOTH4SBHJdRr2+ao1HPd8HC0J0MnFugj48sWFfRohiKsYwmLq+LJEbBxuH3dC1vRoJFluU3
	wh0LD8MLNC0Dgcb13HFBoaZ88Jt9KpoeKUmR1JKEgSxDiFl/2ik+a6giD3ObYT7p7Ri/+Sy3cmL57
	PZ/stG5nsuWqUsk0FplKsc14ybMpooyXr8xWrLm0SvScjqr1xypQTKXqq+vjwcqksoJfScqJ5Sh0r
	jaPfz/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9FA-00000008yqX-2MZf;
	Fri, 25 Jul 2025 03:37:12 +0000
Received: from [203.254.224.24] (helo=mailout1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf9Ce-00000008ydn-13iA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 03:34:39 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250725033428epoutp01f5a9020b90b2b1b9ffdf75ac46ecb3e7~VYStN8OPu2866228662epoutp01D;
	Fri, 25 Jul 2025 03:34:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250725033428epoutp01f5a9020b90b2b1b9ffdf75ac46ecb3e7~VYStN8OPu2866228662epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753414468;
	bh=rjaBonRK6Ih+sgUNcDnD2a3SzoSU5QGqCQo2yp9Xrj0=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=MWzhwZ6ELFQPsTjfNPkkR5pUNXZo6ltsc8MjE2vSJbeVybkoY8UELsMNA6rADQbxq
	 cSNYqs4dUqrY8UtVgZDeSetcaBXZ7vWKqMH7SowHxaeKMQzP3hWEJmVPDYUytg6Xsi
	 wDEHlZzOWWoxQAfVbbBl6Gqd2b0MAoIm2erAesRY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250725033428epcas5p3746cdb5adc08933bd2ba40c7f43007b5~VYSs16Lcb1523915239epcas5p3z;
	Fri, 25 Jul 2025 03:34:28 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bpD4z0wMTz3hhT3; Fri, 25 Jul
	2025 03:34:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250725033426epcas5p1b632007c5ce46e14274551d309048e1b~VYSrYf8xw2307423074epcas5p1x;
	Fri, 25 Jul 2025 03:34:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250725033421epsmtip2eb2ae98e3dc6373dd26fea50a8e8d8cc~VYSm6U5AJ0743307433epsmtip2r;
	Fri, 25 Jul 2025 03:34:21 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Lars-Peter
 Clausen'" <lars@metafoo.de>, "'Michael Hennerich'"
	<Michael.Hennerich@analog.com>, "'Jonathan Cameron'" <jic23@kernel.org>,
	"'David	Lechner'" <dlechner@baylibre.com>, =?UTF-8?Q?'Nuno_S=C3=A1'?=
	<nuno.sa@analog.com>, "'Andy Shevchenko'" <andy@kernel.org>, "'Rob Herring'"
	<robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>, "'Lucas Stankus'"
	<lucas.p.stankus@gmail.com>, "'Puranjay	Mohan'" <puranjay@kernel.org>, "'Dan
 Robertson'" <dan@dlrobertson.com>, "'Marcelo	Schmitt'"
	<marcelo.schmitt@analog.com>, "'Dragos Bogdan'" <dragos.bogdan@analog.com>,
	"'Jean-Baptiste Maneyrol'" <jean-baptiste.maneyrol@tdk.com>,
	=?UTF-8?Q?'Ond=C5=99ej_Jirman'?= <megi@xff.cz>, "'Alexandru Tachici'"
	<alexandru.tachici@analog.com>, "'Stefan Popa'" <stefan.popa@analog.com>,
	"'Linus Walleij'" <linus.walleij@linaro.org>, "'Stephan	Gerhold'"
	<stephan@gerhold.net>, "'Ceclan Dumitru'" <dumitru.ceclan@analog.com>,
	"'Alexandru Lazar'" <alazar@startmail.com>, "'Andy Gross'"
	<agross@kernel.org>, "'Bjorn Andersson'" <andersson@kernel.org>, "'Matti
 Vaittinen'" <mazziesaccount@gmail.com>, "'Angelo Compagnucci'"
	<angelo.compagnucci@gmail.com>, "'Mike Looijmans'"
	<mike.looijmans@topic.nl>, "'David Heidelberg'" <david@ixit.cz>,
	"'Manivannan Sadhasivam'" <mani@kernel.org>, "'Peter Meerwald-Stadler'"
	<pmeerw@pmeerw.net>, "'Andreas Klinger'" <ak@it-klinger.de>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20250724111345.47889-7-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 3/4] dt-bindings: iio: adc: samsung,exynos-adc: Use
 correct IRQ level in example
Date: Fri, 25 Jul 2025 09:04:20 +0530
Message-ID: <2d2801dbfd15$055db750$101925f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQF9KPnnDP5MNVIiuJxjrYc+La4GeQFz+E82AjEsD8604q6K4A==
X-CMS-MailID: 20250725033426epcas5p1b632007c5ce46e14274551d309048e1b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724111407epcas5p32d1ac49e0e12bdec1b07d2eb2a03ac14
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
	<CGME20250724111407epcas5p32d1ac49e0e12bdec1b07d2eb2a03ac14@epcas5p3.samsung.com>
	<20250724111345.47889-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_203436_939978_0BEF3EE5 
X-CRM114-Status: UNSURE (   8.92  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Thursday, July 24, 2025 4:44 PM
> To: Lars-Peter Clausen <lars=40metafoo.de>; Michael Hennerich
> <Michael.Hennerich=40analog.com>; Jonathan Cameron <jic23=40kernel.org>;
> David Lechner <dlechner=40baylibre.com>; Nuno S=C3=A1=20<nuno.sa=40analog=
.com>;=0D=0A>=20Andy=20Shevchenko=20<andy=40kernel.org>;=20Rob=20Herring=20=
<robh=40kernel.org>;=0D=0A.=0D=0A.=0D=0A.=0D=0A>=20Cc:=20Krzysztof=20Kozlow=
ski=20<krzysztof.kozlowski=40linaro.org>=0D=0A>=20Subject:=20=5BPATCH=203/4=
=5D=20dt-bindings:=20iio:=20adc:=20samsung,exynos-adc:=20Use=20correct=0D=
=0A>=20IRQ=20level=20in=20example=0D=0A>=20=0D=0A>=20The=20interrupt=20line=
=20to=20GIC=20is=20IRQ_TYPE_LEVEL_HIGH,=20so=20use=20that=20instead=20of=0D=
=0A>=20=22none=22.=20=20Also=20replace=20the=20hard-coded=20GIC_SPI=20flag.=
=0D=0A>=20=0D=0A>=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.koz=
lowski=40linaro.org>=0D=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim=
.akhtar=40samsung.com>=0D=0A=0D=0A

