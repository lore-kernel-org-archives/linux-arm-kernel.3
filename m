Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E08FC83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7L2O1InbFvnP1XnT/qvX7QB1qmXSTQ8r73bRzTrKWk=; b=Y/T8RNzS/Hetu8P9V3oTkZwqFo
	tPAOYpgE8gZhG/b7BwaeBXJsgOwPfA/OKZnDCAtaFTHVrrkAmK8TEOKs4+IbrJryd9x2Z6FL00xTc
	iSf9k18FNwO0FVrv+J9mXcmd4bIA6TByYrFlBIYB73O7vx1m5FOImmrRSwJU8GS7ZNZn5xq6RVDTM
	uZOvjU1ku/soaIFNAxlGrDI3GM4Pi8/tJz+urlcxLE+4w/pKxooCcKO1CW2vMQiYJq1t8COCSm4Ey
	zZL+t9PtkiKn33eI4kV1C7sTXw7/nIkaD6UpXSIkTv8j/3NgXCgcrAvU3g9Lw5QniSB0wSQ3GC2Ql
	VcyYD4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnNF-0000000BJN9-024E;
	Thu, 10 Jul 2025 09:15:25 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmNY-0000000B7zu-1Vrx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:11:42 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250710081133epoutp02b1e2bc71051a3c26e0bdd1ac3a1f471e~Q1ZWfrNSM0414404144epoutp021
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:11:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250710081133epoutp02b1e2bc71051a3c26e0bdd1ac3a1f471e~Q1ZWfrNSM0414404144epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752135093;
	bh=X7L2O1InbFvnP1XnT/qvX7QB1qmXSTQ8r73bRzTrKWk=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=j3oWKMIvCRVp/Dv455YeJJmmPM/J5mmiE31MlmOozDYdqHCqHuUHcqwHVMy829xRj
	 ohRN/B0EP3DewBQDf97AV0irRclP26ERtNCBYLVAbqYm/sp1MgH+FcBtiDkg1hvj78
	 51UFADaM/2Co0PMP+A978xc8H+034LMIMUE2Ur1g=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250710081133epcas5p3a6c6cebcf5094ebfef37beff296a6b8b~Q1ZWJsbsT0941409414epcas5p3G;
	Thu, 10 Jul 2025 08:11:33 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.182]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bd6xb28lkz6B9mG; Thu, 10 Jul
	2025 08:11:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250710081130epcas5p4190c82d672df991e04e0e131f6d372e1~Q1ZTyXAV51739417394epcas5p4V;
	Thu, 10 Jul 2025 08:11:30 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250710081129epsmtip2d162f17d460245beda3d8f3d64ed8b28~Q1ZSuE_Vl0354303543epsmtip2I;
	Thu, 10 Jul 2025 08:11:29 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, =?UTF-8?Q?'Andr=C3=A9_Draszik'?=
	<andre.draszik@linaro.org>, "'Tudor Ambarus'" <tudor.ambarus@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference
 "SoC clean" maintainer profile
Date: Thu, 10 Jul 2025 13:41:28 +0530
Message-ID: <07e201dbf172$3de42810$b9ac7830$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQLnGEqJ0zqx5E8MZ3x+2WrPG3D23AGimcLLsgeevsA=
X-CMS-MailID: 20250710081130epcas5p4190c82d672df991e04e0e131f6d372e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710073503epcas5p2ad88e48f23891c3592522dd22aee7bf9
References: <CGME20250710073503epcas5p2ad88e48f23891c3592522dd22aee7bf9@epcas5p2.samsung.com>
	<20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_011141_047634_44355A87 
X-CRM114-Status: UNSURE (   7.82  )
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
> Sent: Thursday, July 10, 2025 1:05 PM
> To: Peter Griffin <peter.griffin=40linaro.org>; Andr=C3=A9=20Draszik=0D=
=0A>=20<andre.draszik=40linaro.org>;=20Tudor=20Ambarus=20<tudor.ambarus=40l=
inaro.org>;=0D=0A>=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>;=20linux-a=
rm-=0D=0A>=20kernel=40lists.infradead.org;=20linux-samsung-soc=40vger.kerne=
l.org;=0D=0A>=20devicetree=40vger.kernel.org;=20linux-kernel=40vger.kernel.=
org=0D=0A>=20Cc:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40linaro.or=
g>=0D=0A>=20Subject:=20=5BPATCH=201/2=5D=20arm64:=20tesla/google:=20MAINTAI=
NERS:=20Reference=20=22SoC=0D=0A>=20clean=22=20maintainer=20profile=0D=0A>=
=20=0D=0A>=20Effectively=20all=20Tesla=20FSD=20and=20Google=20GS101=20DTS=
=20patches=20go=20via=20Samsung=20SoC=0D=0A>=20maintainer,=20who=20applies=
=20the=20same=20rules=20as=20for=20Samsung=20SoC:=20DTS=20must=20be=0D=0A>=
=20fully=20DT=20bindings=20compliant=20(=60dtbs_check=20W=3D1=60).=20=20Exi=
sting=20sources=20already=20are=0D=0A>=20compliant,=20so=20just=20document=
=20that=20implicit=20rule=20by=20mentioning=20respective=0D=0A>=20maintaine=
r=20profile=20in=20their=20entries.=0D=0A>=20=0D=0A>=20Cc:=20Peter=20Griffi=
n=20<peter.griffin=40linaro.org>=0D=0A>=20Cc:=20Andr=C3=A9=20Draszik=20<and=
re.draszik=40linaro.org>=0D=0A>=20Cc:=20Tudor=20Ambarus=20<tudor.ambarus=40=
linaro.org>=0D=0A>=20Cc:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=
=0A>=20Signed-off-by:=20Krzysztof=20Kozlowski=20<krzysztof.kozlowski=40lina=
ro.org>=0D=0A>=20---=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40sam=
sung.com>=0D=0A=0D=0A=0D=0A

