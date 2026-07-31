Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61350C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fvqKsvm1eyHGNWQHxglb3w7slSjtIMExKpTqKcLLwQ=; b=2o7bFU+g+AEy9ZU5fPKfSkt82T
	HcuPKI7lYR14G9sMZIrKYx+5PxCaAuoy6gd+XS9nnuYQ9VxGUrWPszrDOVOYFpJYjjDoY0I55LkJm
	kD/VvnRsOqFZo39KShk21sTKCLsHxA8nIAyAIbDt3oPMn4/qJG6U0Xh14pmqaATT9I3tv243GPO3q
	xOUQkrxQ+J6ApAKhsjfHdNatsiuTsgOWFvz3sZPHfIZ1ncQoVjySqWwnlez7kBbbrqC0R/9H0Jp1j
	MTzQFyaBCSytsFnRmSgYUfFoRTgwkfAqaqWiqXDkUNiYUS+aP1yN5adwd5Tgu4wLJja7aUf7qHC2y
	lvxrrMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgkG-0000000Bt90-3vnI;
	Fri, 31 Jul 2026 06:29:26 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgkE-0000000Bt8S-06xW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 06:29:23 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260731062914epoutp031ebe943baf3c7e4640f1bd59026cc29a~HTANKmrzO1485914859epoutp03V
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 06:29:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260731062914epoutp031ebe943baf3c7e4640f1bd59026cc29a~HTANKmrzO1485914859epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785479354;
	bh=4fvqKsvm1eyHGNWQHxglb3w7slSjtIMExKpTqKcLLwQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rdlKk93X5DBDiNI8cfcYyGhcZzX/6rSH1HMdTNu+3nxVzT2H4ov190gFF2wafu/yV
	 OYCwIMcHECORoh0NlG5fMf5hgLf2HaFPS2aD2ZIYfuQAw5nkhcSS7ShGX4quvcVIjc
	 yVrcVJoyaOxVR8BGdPS7BVixo6cB7abGINlP7Nbc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260731062913epcas5p17901cfc7098bdcdf15db8fe1cf98817f~HTAMKkcop2719527195epcas5p1g;
	Fri, 31 Jul 2026 06:29:13 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hBGPN166dz6B9mR; Fri, 31 Jul
	2026 06:29:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260731062911epcas5p13055bd03de39a582110a56fe3089659b~HTAKu25ie2713127131epcas5p1h;
	Fri, 31 Jul 2026 06:29:11 +0000 (GMT)
Received: from INBRO002198 (unknown [107.122.5.156]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260731062909epsmtip135f52cd1226a69c6b1fd6a443b9da8f8~HTAIS8qol0207002070epsmtip1p;
	Fri, 31 Jul 2026 06:29:08 +0000 (GMT)
From: "Raghav Sharma" <raghav.s@samsung.com>
To: =?iso-8859-1?Q?'Uwe_Kleine-K=F6nig'?= <u.kleine-koenig@baylibre.com>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<peter.griffin@linaro.org>, <alim.akhtar@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <hajun.sung@samsung.com>,
	<is.gandhi@samsung.com>, <ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <amnz5qkX_zeeVUjU@monoceros>
Subject: RE: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Date: Fri, 31 Jul 2026 11:59:07 +0530
Message-ID: <04ae01dd20b5$e629a040$b27ce0c0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRARWKMB8/axP+0I5R2y9G0OYjygJXZBUnAoCqj1sBW9GAbbXtymAg
Content-Language: en-us
X-CMS-MailID: 20260731062911epcas5p13055bd03de39a582110a56fe3089659b
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
	<20260728121111.2077860-4-raghav.s@samsung.com> <amnz5qkX_zeeVUjU@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_232922_390602_8B4C45F0 
X-CRM114-Status: UNSURE (   6.48  )
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
> From: Uwe Kleine-K=F6nig=20<u.kleine-koenig=40baylibre.com>=0D=0A>=20Sent=
:=20Wednesday,=20July=2029,=202026=206:08=20PM=0D=0A>=20To:=20raghav.s=20<r=
aghav.s=40samsung.com>=0D=0A>=20Cc:=20krzk=40kernel.org;=20s.nawrocki=40sam=
sung.com;=20cw00.choi=40samsung.com;=0D=0A>=20peter.griffin=40linaro.org;=
=20alim.akhtar=40samsung.com;=0D=0A>=20mturquette=40baylibre.com;=20sboyd=
=40kernel.org;=20bmasney=40redhat.com;=0D=0A>=20robh=40kernel.org;=20conor+=
dt=40kernel.org;=20linux-samsung-=0D=0A>=20soc=40vger.kernel.org;=20linux-c=
lk=40vger.kernel.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linux-arm-ke=
rnel=40lists.infradead.org;=20linux-=0D=0A>=20kernel=40vger.kernel.org;=20h=
ajun.sung=40samsung.com;=0D=0A>=20is.gandhi=40samsung.com;=20ts.amit=40sams=
ung.com;=0D=0A>=20pokala.reddy=40samsung.com=0D=0A>=20Subject:=20Re:=20=5BP=
ATCH=2003/13=5D=20clk:=20samsung:=20exynos8855:=20add=20block=20top=20and=
=0D=0A>=20peric=20clock=20support=0D=0A>=20=0D=0A>=20Hello,=0D=0A>=20=0D=0A=
>=20On=20Tue,=20Jul=2028,=202026=20at=2005:41:01PM=20+0530,=20raghav.s=20wr=
ote:=0D=0A>=20>=20+=23include=20<linux/mod_devicetable.h>=0D=0A>=20>=20=5B.=
..=5D=0D=0A>=20>=20+=23include=20<linux/platform_device.h>=0D=0A>=20=0D=0A>=
=20<linux/platform_device.h>=20already=20makes=20sure=20that=20of_device_id=
=20is=0D=0Aavailable=0D=0A>=20and=20<linux/mod_devicetable.h>=20will=20go=
=20away=20soon.=0D=0A>=20=0D=0A>=20So=20please=20don't=20=23include=20the=
=20latter.=0D=0A>=20=0D=0A>=20Best=20regards=0D=0A>=20Uwe=0D=0A=0D=0AHi=20U=
we=0D=0AThanks=20for=20letting=20me=20know,=20I=20will=20remove=20this=20he=
ader=20from=20my=20code:=0D=0A<linux/mod_devicetable.h>=0D=0A=0D=0ARegards=
=0D=0ARaghav=0D=0A=0D=0A

