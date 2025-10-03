Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88899CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 05:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6SlgDCFOBi9h8Zr7L2vlVB4Qa0jU3GPw7jT23nrerc=; b=zQR2rglvaWAqvpbY0VDqbhk8c6
	dqD/b0t3FeRug2T2+9LqlSL/MAS1EKKNkuzeu9GUwZ8yAIX2pEAW6892VG6P/9SorGVnIXRhqbFnn
	whFZkaO4iLFIpBr2QT1vUkVbbMCxADE8lHRMdVmfhNabPOvoeCPFRNMnMt571RK17953ksqt79SCJ
	qvcZKVHt9AklCPq9ADrvWPaPK/QWNDr1lE4Al9NRWtmzYrpIqg5hpCcfl0wE55H5MdVR4cBdIscUc
	VeKOHzeB/70kc4L4tovXMlXQ6aeivZvWYxRaklduygnNpDn/7Be+Be+JW6SwKVkuzRXiXGJyKb1pP
	v6wGVZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4YbX-0000000Bi0S-34JF;
	Fri, 03 Oct 2025 05:45:19 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4YbQ-0000000Bhzt-1tWm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 05:45:17 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251003054503epoutp045ffa6fca66f73460f9b5671f7edd0d5d~q5OtUQuL-1139911399epoutp04-
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Oct 2025 05:45:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251003054503epoutp045ffa6fca66f73460f9b5671f7edd0d5d~q5OtUQuL-1139911399epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759470303;
	bh=z6SlgDCFOBi9h8Zr7L2vlVB4Qa0jU3GPw7jT23nrerc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=qhNIOAvPx6uoDmXmCwXxj95uNjHaogCl3At7rjuiK+JWfgK9h8VrxSVOiU3sbyb0L
	 Q+exqebSpMvX+0OGrQ9/YD0NbLP9zB56J6LiXykWijBTKN3Q5CcqJe1Ec7KTNy08+5
	 gvewGiE7y978nIop2sKmDL6fB/ScDQ9s48tWpY/Q=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251003054502epcas5p147f4ac05e859f93ced29739c9dd6db1b~q5OsU5Zyx2599925999epcas5p1B;
	Fri,  3 Oct 2025 05:45:02 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cdHgK5jwVz6B9m7; Fri,  3 Oct
	2025 05:45:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251003054501epcas5p17ec2255ee66f0ea533b8dc9a058e33e9~q5Oq8U0mF2736927369epcas5p12;
	Fri,  3 Oct 2025 05:45:01 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251003054456epsmtip1431a24308d04a35b90a24f8eb7b752a2~q5Omvl53I2540725407epsmtip16;
	Fri,  3 Oct 2025 05:44:56 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc: <jesper.nilsson@axis.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<alim.akhtar@samsung.com>, <linus.walleij@linaro.org>,
	<tomasz.figa@gmail.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>, <ksk4725@coasia.com>, <kenkim@coasia.com>,
	<pjsin865@coasia.com>, <gwk1013@coasia.com>, <hgkim05@coasia.com>,
	<mingyoungbo@coasia.com>, <smn1196@coasia.com>, <shradha.t@samsung.com>,
	<inbaraj.e@samsung.com>, <swathi.ks@samsung.com>,
	<hrishikesh.d@samsung.com>, <dj76.yang@samsung.com>,
	<hypmean.kim@samsung.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-arm-kernel@axis.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
In-Reply-To: <CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
Subject: RE: [PATCH v4 0/6] Add support for the Axis ARTPEC-8 SoC
Date: Fri, 3 Oct 2025 11:14:55 +0530
Message-ID: <000001dc3428$dc2990c0$947cb240$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKKMINb5ygeSmhM7iNuat0EV5IHsAIgbsJhATIDr/2zOVZ1wA==
Content-Language: en-in
X-CMS-MailID: 20251003054501epcas5p17ec2255ee66f0ea533b8dc9a058e33e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2
References: <CGME20250901054234epcas5p1e4b34b6ccb304b0306b1fe616edda9e2@epcas5p1.samsung.com>
	<20250901051926.59970-1-ravi.patel@samsung.com>
	<CAJKOXPe7Hn0qwg8jDMg4KoF-n4kziLQnvAx9vbNKEcS_KjzEdw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_224515_554182_553E0902 
X-CRM114-Status: GOOD (  22.54  )
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

Hi Krzysztof,

The dt-bindings patch was merged earlier in v3 series (https://lore.kernel.=
org/linux-samsung-soc/175664688891.195158.13270877080433356384.b4-ty=40lina=
ro.org/ on 31st August)
into respective maintainer repo.=20
Then I have been asked to drop the applied v3 patches and send rebased v4 s=
eries (https://lore.kernel.org/linux-samsung-soc/15508cb4-843c-42d1-8854-5e=
abd79ca0df=40kernel.org/)

Since the 4 patches from v3 series has been already merged, I have not the =
mentioned dependency while sending remaining v4 patches considering
It is going to same maintainer repo and it will be applied in sequence.

For future patches (like artpec-9), I will mention the dependency even it i=
s merged in same repo.

Thanks,
Ravi

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: 02 October 2025 12:10
> To: Ravi Patel <ravi.patel=40samsung.com>
> Cc: jesper.nilsson=40axis.com; mturquette=40baylibre.com; sboyd=40kernel.=
org; robh=40kernel.org; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; s.nawrocki=40samsung.com; cw00.choi=40samsung.com;=
 alim.akhtar=40samsung.com; linus.walleij=40linaro.org;
> tomasz.figa=40gmail.com; catalin.marinas=40arm.com; will=40kernel.org; ar=
nd=40arndb.de; ksk4725=40coasia.com; kenkim=40coasia.com;
> pjsin865=40coasia.com; gwk1013=40coasia.com; hgkim05=40coasia.com; mingyo=
ungbo=40coasia.com; smn1196=40coasia.com;
> shradha.t=40samsung.com; inbaraj.e=40samsung.com; swathi.ks=40samsung.com=
; hrishikesh.d=40samsung.com;
> dj76.yang=40samsung.com; hypmean.kim=40samsung.com; linux-kernel=40vger.k=
ernel.org; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com; devicetree=40=
vger.kernel.org; linux-gpio=40vger.kernel.org
> Subject: Re: =5BPATCH v4 0/6=5D Add support for the Axis ARTPEC-8 SoC
>=20
> On Mon, 1 Sept 2025 at 14:42, Ravi Patel <ravi.patel=40samsung.com> wrote=
:
> >
> > Add basic support for the Axis ARTPEC-8 SoC which contains
> > quad-core Cortex-A53 CPU and other several IPs. This SoC is an
> > Axis-designed chipset used in surveillance camera products such as
> > the AXIS Q1656-LE and AXIS Q3538-LVE.
> >
> > This ARTPEC-8 SoC has a variety of Samsung-specific IP blocks and
> > Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> >
> > List of Samsung-provided IPs:
> > - UART
> > - Ethernet (Vendor: Synopsys)
> > - SDIO
> > - SPI
> > - HSI2C
> > - I2S
> > - CMU (Clock Management Unit)
> > - Pinctrl (GPIO)
> > - PCIe (Vendor: Synopsys)
> > - USB (Vendor: Synopsys)
> >
> > List of Axis-provided IPs:
> > - VIP (Image Sensor Processing IP)
> > - VPP (Video Post Processing)
> > - GPU
> > - CDC (Video Encoder)
> >
> > This patch series includes below changes:
> > - CMU (Clock Management Unit) driver and its bindings
> > - GPIO pinctrl configuration and its bindings
> > - Basic Device Tree for ARTPEC-8 SoC and boards
> >
>=20
> Pretty useless cover letter since it doesn't say the damn most
> important thing : dependency=21
>=20
> So this went unnoticed and now mainline (Linus tree) is affected. See
> Linus rant on soc pull request
>=20
> I'm very disappointed, actually mostly on me that I picked this up.
> Your future patches, need to improve quality and probably you need to
> go back to how Git works and how maintainer trees are organized. Read
> carefully, really carefully please maintainer profile .
>=20
> I'll be putting artpec 9 on hold, till you confirm what was wrong here
> and how are you going to fix it in the future.


