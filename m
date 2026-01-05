Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEE3C2A099
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exmRwuE3H60PBAfP7giHoY+OJrbqno0dZ6dVxdCiUeg=; b=B4OHW4wxA1fpGet1aimrgh7r/i
	MIULlNJLwKuf621VVIFsgyBJWnJbfXO0VyeLaPkviUmkRcnLg/M5lJhW80qg3y4H68bEnHnq+iLxc
	CZCHSD1kPjuFk9s3oHd1FbakleMZ6A8ARMfUceSDqjfMk9dg/2tE8+8y34gK79KNX0FdFz/Cl8Pwy
	4xsFpx2cs4DPrEUWY/BMhbmplscWxC5Azn9mh0IVzKfMQSj9RoazwRpKS3oUwn2VXtVyt042TzXVq
	AOVFpsEJzCCJGpVlpY+KK3hVXHlFEdP4Oip/NzqE8tk1ceDDpP+S3Z50J7gKKXOcRAjaOTw3afmQc
	uXh6avfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciZf-0000000BAmJ-0S9Y;
	Mon, 05 Jan 2026 11:16:35 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vciZb-0000000BAlV-2BTv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 11:16:34 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260105111623epoutp03dff76382c6a424a2f618b1024723590b~H0Y064NLu2709227092epoutp03q
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Jan 2026 11:16:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260105111623epoutp03dff76382c6a424a2f618b1024723590b~H0Y064NLu2709227092epoutp03q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767611783;
	bh=exmRwuE3H60PBAfP7giHoY+OJrbqno0dZ6dVxdCiUeg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=eqMlEBR8yOXbCkHJAZlAEv+nUMIPi+dMNilurU0uR9Z4bZPUWHfjcvPlAO0EjVrUg
	 dpl0D3EFU+PJGY4kAJ+gwhyXVeuip0TEPdhoK6LebLP1D8G4nM+ywyrQXofLShPl12
	 zbtfUn3rvi4BzLKTO9vsh9Q4Vp3/mtjEmebc0iVk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260105111622epcas5p1383de210931da80ab45999c9261978ed~H0Y0VivxP3117331173epcas5p1x;
	Mon,  5 Jan 2026 11:16:22 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dlBZF4XcBz6B9m9; Mon,  5 Jan
	2026 11:16:21 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260105111620epcas5p4b639a27284272dd7432cb4b957d5e523~H0YydzdWK1918219182epcas5p4w;
	Mon,  5 Jan 2026 11:16:20 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260105111618epsmtip25fda3d6ff52d0d1f8ab4b76a122827d4~H0YwpBgK00868908689epsmtip2N;
	Mon,  5 Jan 2026 11:16:18 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Andi Shyti'"
	<andi.shyti@kernel.org>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rosa.pila@samsung.com>, <dev.tailor@samsung.com>,
	<pritam.sutar@samsung.com>
In-Reply-To: 
Subject: RE: [PATCH v2] arm64: dts: exynosautov920: Add DT node for all I2C
 ports
Date: Mon, 5 Jan 2026 16:46:09 +0530
Message-ID: <000001dc7e34$b809a030$281ce090$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFOiGH9IZBP/MALtVgmdgdp0NuXDgFMvpOsAcCx1FYC93HaobXRSjbAgF3h61A=
Content-Language: en-us
X-CMS-MailID: 20260105111620epcas5p4b639a27284272dd7432cb4b957d5e523
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014111455epcas5p30731028365023e101dad3b9ba1f90bec
References: <CGME20251014111455epcas5p30731028365023e101dad3b9ba1f90bec@epcas5p3.samsung.com>
	<20251014112338.2023223-1-faraz.ata@samsung.com>
	<2knbzksxobg2kl3aexuiwluctgafgzxblsqc5q5rcikuruuegr@cqlizryhhx4s>
	<7ba31fb7-8f1b-4277-a3cf-649a76c7dda5@kernel.org> 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_031632_202220_E254352F 
X-CRM114-Status: GOOD (  20.79  )
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

HI Krzysztof

I want to follow up on my I2C patches submitted.
Please let me know if anything else needs to be done or do I have to resend=
 the patches



> -----Original Message-----
> From: Faraz Ata <faraz.ata=40samsung.com>
> Sent: Thursday, November 6, 2025 10:49 PM
> To: 'Krzysztof Kozlowski' <krzk=40kernel.org>; 'Andi Shyti'
> <andi.shyti=40kernel.org>
> Cc: 'robh=40kernel.org' <robh=40kernel.org>; 'krzk+dt=40kernel.org'
> <krzk+dt=40kernel.org>; 'conor+dt=40kernel.org' <conor+dt=40kernel.org>;
> 'alim.akhtar=40samsung.com' <alim.akhtar=40samsung.com>; 'linux-
> i2c=40vger.kernel.org' <linux-i2c=40vger.kernel.org>;
> 'devicetree=40vger.kernel.org' <devicetree=40vger.kernel.org>; 'linux-arm=
-
> kernel=40lists.infradead.org' <linux-arm-kernel=40lists.infradead.org>; '=
linux-
> samsung-soc=40vger.kernel.org' <linux-samsung-soc=40vger.kernel.org>;
> 'linux-kernel=40vger.kernel.org' <linux-kernel=40vger.kernel.org>;
> 'rosa.pila=40samsung.com' <rosa.pila=40samsung.com>;
> 'dev.tailor=40samsung.com' <dev.tailor=40samsung.com>;
> 'pritam.sutar=40samsung.com' <pritam.sutar=40samsung.com>
> Subject: RE: =5BPATCH v2=5D arm64: dts: exynosautov920: Add DT node for a=
ll I2C
> ports
>=20
> HI  Krzysztof
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk=40kernel.org>
> > Sent: Thursday, October 30, 2025 9:11 PM
> > To: Andi Shyti <andi.shyti=40kernel.org>; Faraz Ata
> > <faraz.ata=40samsung.com>
> > Cc: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> > alim.akhtar=40samsung.com; linux-i2c=40vger.kernel.org;
> > devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org;
> > linux- samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> > rosa.pila=40samsung.com; dev.tailor=40samsung.com;
> > pritam.sutar=40samsung.com
> > Subject: Re: =5BPATCH v2=5D arm64: dts: exynosautov920: Add DT node for
> > all I2C ports
> >
> > On 30/10/2025 16:34, Andi Shyti wrote:
> > > Hi Faraz,
> > >
> > > On Tue, Oct 14, 2025 at 04:53:38PM +0530, Faraz Ata wrote:
> > >> Universal Serial Interface (USI) supports three serial protocol
> > >> like uart, i2c and spi. ExynosAutov920 has 18 instances of USI.
> > >> Add i2c nodes for all the instances.
> > >>
> > >> Signed-off-by: Faraz Ata <faraz.ata=40samsung.com>
> > >
> > > what happened to patch 1/1?
> >
> > Different patchset, no?
>=20
> In order to address your below comment
> https://lore.kernel.org/all/000001dc39a2=242cf5e570=2486e1b050=24=40samsu=
ng.co
> m/
>=20
> I added the lore link to dt binding in v2
> https://lore.kernel.org/all/176044840242.3094524.6549941972513295895.rob
> h=40kernel.org/
>=20
> Please suggest if anything else need to be done  and via which tree this =
patch
> set will go
> >
> > Best regards,
> > Krzysztof


