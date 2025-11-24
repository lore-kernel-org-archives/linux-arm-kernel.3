Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C8DCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UfPZnz9PDbhxDHBtLEyEa8gvhJLlctrIXKAOZGOWN4=; b=MPtQsFMlP7Pp9+5M2lqQ44T+r+
	yjn31ALaceA9IdIMYKGgUUonPJYgBDFd/rHl0+AuWW0S2ULrtK0ps3DzIzKBsy3AAJEYsLHrh9RqN
	4W0MPeX+yTy3o/DnLsRBlMHodpRUb7eyzUQ4/MRmG+vBZ2WJwJY8ZmcrIvrZVsZDw+V9z9claYShl
	2owtu3NQojT4MJEQHBcxfYWWDkKIZP6JcAbGC1i4H5Bn7OmEy8tJlPvX0snY8xyUOa7ZsAPhERRvi
	8L4W1R+/DJHAh/7I1EP62/mFT/JQ9a3dzmaPKeMkVOwcIuxaZIN61l3YtTYAAJ39V88rpb66jBzvj
	vxXMF+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUyQ-0000000BZg5-10qY;
	Mon, 24 Nov 2025 11:43:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUyO-0000000BZfu-3x5w
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 11:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0UfPZnz9PDbhxDHBtLEyEa8gvhJLlctrIXKAOZGOWN4=; b=ZfdVFMgPLZo2Mf/4Y1I0tDWMI1
	V+6wVPtcaK6SkVRZa5FLuudFW8ixk7wgDV7gb0a9ZW0NnCcsklvZTsgBlHZddqaLoDEWDu0NPNah+
	OEnbWLVfCtO+4u0hyMlm4JWrm1Udc1Rr1JzU6r+GIY6xEV+ICF+ZOLk3NAUXVXprja/p4OM0L8bqq
	Ljxxq/vT6ne0J6CEMtJfb7fORtIoLw0fa6LUSkPP7EtfBBjCTMR7A8O4VQySpQZKJSIFnbcvmg5tp
	s8f9WUFDKGreXkefroxkmS9ylpiYfIrgooXn18xGoHq2Rsc6gLW5iUD8eczIGSbf2o5BBCg3AsFZe
	Z29QNcsQ==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNU6j-00000003YSx-492M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:47:48 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251124114300epoutp041507f5fdb4bb1e88c0189d26a562a5db~67qFSRMAg1507115071epoutp048
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 11:43:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251124114300epoutp041507f5fdb4bb1e88c0189d26a562a5db~67qFSRMAg1507115071epoutp048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763984580;
	bh=0UfPZnz9PDbhxDHBtLEyEa8gvhJLlctrIXKAOZGOWN4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HpJilch6TDX0BNZAKmAtksPr/pTIRtbn+k1MZzmRCfb/qNdQrIyStCoaDvrMl23J2
	 KnI0A8Hd6aGlB0SRPr5Fp8wgDhtNqlYNCymCj0DJu2tOsGknbwheu6JuV7Kqn2gE4G
	 su4enLOhBF8ngnvlypPptrDdRykNFvbrH94+UmzI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251124114259epcas2p48a7d588390bbbab0b08ee6749024b466~67qEhbMgv1875518755epcas2p43;
	Mon, 24 Nov 2025 11:42:59 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.200]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dFP8M3DR6z2SSKX; Mon, 24 Nov
	2025 11:42:59 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251124114258epcas2p103cab1d3b8b5414e7437a08126e36d8b~67qDVN1Ew1969819698epcas2p1T;
	Mon, 24 Nov 2025 11:42:58 +0000 (GMT)
Received: from KORCO115296 (unknown [12.80.207.128]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251124114258epsmtip22c7b65a35428b6c08ca8cac404c177c9~67qDPPttI1360513605epsmtip24;
	Mon, 24 Nov 2025 11:42:58 +0000 (GMT)
From: =?utf-8?B?7IaQ7Iug?= <shin.son@samsung.com>
To: "'Daniel Lezcano'" <daniel.lezcano@linaro.org>, "'Bartlomiej
 Zolnierkiewicz'" <bzolnier@gmail.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Rafael J . Wysocki'" <rafael@kernel.org>, "'Zhang Rui'"
	<rui.zhang@intel.com>, "'Lukasz	Luba'" <lukasz.luba@arm.com>, "'Rob
	Herring'" <robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>, "'Alim
	Akhtar'" <alim.akhtar@samsung.com>
Cc: "'Henrik Grimler'" <henrik@grimler.se>, <linux-pm@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<shin.son@samsung.com>
In-Reply-To: <2b63c064-ce62-421b-8469-e434bd0c9652@linaro.org>
Subject: RE: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
Date: Mon, 24 Nov 2025 20:42:56 +0900
Message-ID: <000c01dc5d37$7b1b8da0$7152a8e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJR08pAfg/+KuTfxFjIW+Bmb4uKqAKoesbtAuyt0KIBiaSaQQHdj7cKAduSh9sCP+LNfQLSCcBls5d4FAA=
Content-Language: ko
X-CMS-MailID: 20251124114258epcas2p103cab1d3b8b5414e7437a08126e36d8b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237
References: <20251113064022.2701578-1-shin.son@samsung.com>
	<CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
	<20251113064022.2701578-3-shin.son@samsung.com>
	<2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
	<000001dc5d2a$0697bf10$13c73d30$@samsung.com>
	<ab35c20e-390c-4479-9bb1-9f5e49cba2a0@linaro.org>
	<000001dc5d32$2b4bfb20$81e3f160$@samsung.com>
	<2b63c064-ce62-421b-8469-e434bd0c9652@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_104746_926157_730FC070 
X-CRM114-Status: UNSURE (   7.95  )
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

Hello, Daniel Lezcano.

> -----Original Message-----
> From: Daniel Lezcano =5Bmailto:daniel.lezcano=40linaro.org=5D
> Sent: Monday, November 24, 2025 8:09 PM
> To: =EC=86=90=EC=8B=A0=20<shin.son=40samsung.com>;=20'Bartlomiej=20Zolnie=
rkiewicz'=0D=0A>=20<bzolnier=40gmail.com>;=20'Krzysztof=20Kozlowski'=20<krz=
k=40kernel.org>;=20'Rafael=20J=20.=0D=0A>=20Wysocki'=20<rafael=40kernel.org=
>;=20'Zhang=20Rui'=20<rui.zhang=40intel.com>;=20'Lukasz=0D=0A>=20Luba'=20<l=
ukasz.luba=40arm.com>;=20'Rob=20Herring'=20<robh=40kernel.org>;=20'Conor=0D=
=0A>=20Dooley'=20<conor+dt=40kernel.org>;=20'Alim=20Akhtar'=20<alim.akhtar=
=40samsung.com>=0D=0A>=20Cc:=20'Henrik=20Grimler'=20<henrik=40grimler.se>;=
=20linux-pm=40vger.kernel.org;=20linux-=0D=0A>=20samsung-soc=40vger.kernel.=
org;=20devicetree=40vger.kernel.org;=20linux-arm-=0D=0A>=20kernel=40lists.i=
nfradead.org;=20linux-kernel=40vger.kernel.org=0D=0A>=20Subject:=20Re:=20=
=5BPATCH=20v7=20RESEND=202/3=5D=20thermal:=20exynos_tmu:=20Support=20new=0D=
=0A>=20hardware=20and=20update=20TMU=20interface=0D=0A>=20=0D=0A>=20On=2011=
/24/25=2012:04,=20=EC=86=90=EC=8B=A0=20wrote:=0D=0A>=20>=20Hello,=20Daniel=
=20Lezcano.=0D=0A>=20>=0D=0A>=20>>=20On=2011/24/25=2011:06,=20=EC=86=90=EC=
=8B=A0=20wrote:=0D=0A>=20>>=20=5B=20...=20=5D=0D=0A>=20>>=0D=0A>=20>>>=20Ho=
wever,=20since=20ExynosAutov920=20diverges=20significantly=20from=20the=0D=
=0A>=20>>>=20existing=20driver,=20Would=20introducing=20a=20separate=20driv=
er=20instead=20of=0D=0A>=20>>>=20unifying=0D=0A>=20>>=20everything=20be=20a=
cceptable?=0D=0A>=20>>=0D=0A>=20>>=20So=20this=20driver=20is=20one=20contro=
ller=20for=20multiple=20sensors=20while=20the=0D=0A>=20>>=20others=20driver=
s=20are=20one=20controller=20for=20one=20sensor,=20right=20?=0D=0A>=20>>=0D=
=0A>=20>=0D=0A>=20>=20Yes.=20As=20far=20as=20I=20understand,=20the=20previo=
us=20Exynos=20variants=20used=20one=20TMU=0D=0A>=20>=20controller=20per=20s=
ensor,=20while=20on=20ExynosAutoV920=20the=20hardware=20has=20multiple=0D=
=0A>=20TMU=20instances=20and=20each=20instance=20contains=20multiple=20sens=
ors.=0D=0A>=20>=20Therefore,=20this=20new=20automotive=20SoC=20requires=20s=
upporting=20multiple=20sensors=0D=0A>=20behind=20a=20single=20TMU=20control=
ler.=0D=0A>=20=0D=0A>=20Ok=20thanks.=20It=20makes=20sense=20to=20create=20a=
=20separate=20driver.=0D=0A=0D=0AThen,=20I'll=20prepare=20a=20new=20patch=
=20series.=20Thank=20you=20for=20your=20feedback=0D=0A=0D=0ABest=20regards,=
=0D=0AShin=0D=0A=0D=0A

