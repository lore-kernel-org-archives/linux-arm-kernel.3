Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703A2CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 04:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLph87s8uTl1mRNhEJdvueXclNiF3X9Ct/qHq8xkbxc=; b=M2rAxGd0IPWlcOT9cbSjBaOAe5
	vtYYhmq4RtcDjXaEAl6ALDSY1fXYu8HT2QYbzwMAdwvKEjsqeQyz2wZPmDuu0JNdyNwmfuYZ+Gc3T
	gMg/pwJ508UtvAQDubcA/XNwr1p3KCmiKDIJ3/nWI5AzDvBSVzL7GrRSgmax/aAz6Atd9gX5dLMYb
	vymE6dbkFn6fDbpx5VySHb2reh3YiNbutM+GtumWAyRPH1D3cir4QmCl+Dzl0lKf+Wu2z9830k8qH
	lrF1qaQ23BqoSsIFgFng6Cf7aXSwWVH5Z9ZvuifmKW1ZNqhxSgoy58nqHfZuRp8i3O4kY6ydhpqdh
	i0cY8Tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvnE-0000000B6nI-0GvQ;
	Mon, 01 Sep 2025 04:05:20 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usvKr-0000000B2y7-3k5h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 03:36:03 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901033555epoutp01db1627f883e38e07f30bf78de6404898~hC00SYCEx2745027450epoutp01G
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 03:35:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901033555epoutp01db1627f883e38e07f30bf78de6404898~hC00SYCEx2745027450epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756697755;
	bh=SLph87s8uTl1mRNhEJdvueXclNiF3X9Ct/qHq8xkbxc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Vnzxd3Zyttevv+8cM067HoYIE3M7gBjG24JKRDbOxR923nuB014ryLPY2dqqmPkAk
	 2MVePyYtmkBGNkRdl6pMNV4hbSaFL9Mq1vSp1Llhu6b0EUYx/zRyoUpV9re4VkL4G1
	 USHmIhEgtX9C5ll3CgGqUQBl09sGHKQdJHvN0K1Q=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250901033554epcas5p3bf93e89b823f346c64490171a2f3a95a~hC0zLD_ZI2697626976epcas5p3E;
	Mon,  1 Sep 2025 03:35:54 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cFZK473pJz2SSKY; Mon,  1 Sep
	2025 03:35:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901033552epcas5p10b35ebcca823a43b8d282064733414c4~hC0xcw4bL0189601896epcas5p1G;
	Mon,  1 Sep 2025 03:35:52 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901033547epsmtip2a6cc484678d50e13aa2c0a4577703238~hC0s-tZa92354723547epsmtip2B;
	Mon,  1 Sep 2025 03:35:47 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Linus Walleij'"
	<linus.walleij@linaro.org>
Cc: <jesper.nilsson@axis.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<alim.akhtar@samsung.com>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <shradha.t@samsung.com>, <inbaraj.e@samsung.com>,
	<swathi.ks@samsung.com>, <hrishikesh.d@samsung.com>,
	<dj76.yang@samsung.com>, <hypmean.kim@samsung.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <soc@lists.linux.dev>, "'Priyadarsini G'"
	<priya.ganesh@samsung.com>
In-Reply-To: <32dedafd-df52-48fe-a9b2-be96127bb9b7@kernel.org>
Subject: RE: [PATCH v3 05/10] pinctrl: samsung: Add ARTPEC-8 SoC specific
 configuration
Date: Mon, 1 Sep 2025 09:05:46 +0530
Message-ID: <000101dc1af1$84438410$8cca8c30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ632k4xbrD7jhK5O/rHG9LFVDGhAHHo9j0ArVvYJACmL3/qQEjiZNhsv5Y8CA=
Content-Language: en-in
X-CMS-MailID: 20250901033552epcas5p10b35ebcca823a43b8d282064733414c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2
References: <CGME20250825120720epcas5p491e16bbfbdbcd751acbb0c0e55f9e2a2@epcas5p4.samsung.com>
	<20250825114436.46882-1-ravi.patel@samsung.com>
	<20250825114436.46882-6-ravi.patel@samsung.com>
	<CACRpkdZwz8C=MRgo1tQrkQzNtKMLV+P-LK8XyRA3eSFW-cbFCg@mail.gmail.com>
	<32dedafd-df52-48fe-a9b2-be96127bb9b7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_203602_250923_E626D5E4 
X-CRM114-Status: GOOD (  14.60  )
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
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 29 August 2025 15:59
> To: Linus Walleij <linus.walleij=40linaro.org>; Ravi Patel <ravi.patel=40=
samsung.com>
> Cc: jesper.nilsson=40axis.com; mturquette=40baylibre.com; sboyd=40kernel.=
org; robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> s.nawrocki=40samsung.com; cw00.choi=40samsung.com; alim.akhtar=40samsung.=
com; tomasz.figa=40gmail.com; catalin.marinas=40arm.com;
> will=40kernel.org; arnd=40arndb.de; ksk4725=40coasia.com; kenkim=40coasia=
.com; pjsin865=40coasia.com; gwk1013=40coasia.com;
> hgkim05=40coasia.com; mingyoungbo=40coasia.com; smn1196=40coasia.com; pan=
kaj.dubey=40samsung.com; shradha.t=40samsung.com;
> inbaraj.e=40samsung.com; swathi.ks=40samsung.com; hrishikesh.d=40samsung.=
com; dj76.yang=40samsung.com; hypmean.kim=40samsung.com;
> linux-kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; l=
inux-samsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com;
> linux-clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-gpio=40v=
ger.kernel.org; soc=40lists.linux.dev; Priyadarsini G
> <priya.ganesh=40samsung.com>
> Subject: Re: =5BPATCH v3 05/10=5D pinctrl: samsung: Add ARTPEC-8 SoC spec=
ific configuration
>=20
> On 29/08/2025 12:11, Linus Walleij wrote:
> > Hi Ravi / SeonGu,
> >
> > thanks for your patch=21
> >
> > On Mon, Aug 25, 2025 at 2:07=E2=80=AFPM=20Ravi=20Patel=20<ravi.patel=40=
samsung.com>=20wrote:=0D=0A>=20>=0D=0A>=20>>=20From:=20SeonGu=20Kang=20<ksk=
4725=40coasia.com>=0D=0A>=20>>=0D=0A>=20>>=20Add=20Axis=20ARTPEC-8=20SoC=20=
specific=20configuration=20data=20to=20enable=20pinctrl.=0D=0A>=20>>=0D=0A>=
=20>>=20Signed-off-by:=20SeonGu=20Kang=20<ksk4725=40coasia.com>=0D=0A>=20>>=
=20Signed-off-by:=20Priyadarsini=20G=20<priya.ganesh=40samsung.com>=0D=0A>=
=20>>=20Signed-off-by:=20Ravi=20Patel=20<ravi.patel=40samsung.com>=0D=0A>=
=20>=0D=0A>=20>=20Please=20avoid=20CC=20to=20soc=40kernel.org=20on=20these=
=20patches,=20they=20end=20up=20in=20the=0D=0A>=20>=20patchwork=20for=20imm=
ediate=20merging=20for=20SoC:=0D=0A>=20>=20https://patchwork.kernel.org/pro=
ject/linux-soc/patch/20250825114436.46882-6-ravi.patel=40samsung.com/=0D=0A=
>=20=0D=0A>=20Yeah,=20that's=20odd=20-=20most=20likely=20old=20CC-list.=20T=
his=20could=20happen=20if=20using=0D=0A>=20b4=20but=20there=20is=20no=20b4=
=20being=20used=20here,=20so=20why=20Cc-ing=20according=20to=20some=0D=0A>=
=20old=20files?=0D=0A>=20=0D=0A>=20>=0D=0A>=20>=20I=20think=20this=20is=20n=
ot=20you=20intention,=20the=20pinctrl=20portions=20will=20be=20merged=20by=
=0D=0A>=20>=20Krzysztof=20who=20sends=20it=20to=20me=20once=20that=20part=
=20is=20finished=20reviewing.=0D=0A>=20Version=20for=20review=20should=20no=
t=20be=20merged=20via=20soc=40,=20so=20that's=20wrong=0D=0A>=20process=20in=
=20any=20case.=20But=20you=20are=20right=20that=20I=20will=20be=20taking=20=
everything,=0D=0A>=20thus=20soc=40=20is=20not=20involved=20at=20all.=0D=0A=
=0D=0AOk,=20I=20will=20remove=20soc=40=20while=20sending=20next=20version.=
=0D=0A=0D=0AThanks,=0D=0ARavi=0D=0A=0D=0A>=20=0D=0A>=20Best=20regards,=0D=
=0A>=20Krzysztof=0D=0A=0D=0A

