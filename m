Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F39C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZXkeb6eFkBOPADQFZ6Ugr+b8t74NHRMQP7v0mRURjs=; b=pa8gQfhmMbSXQ0DaJCe7mK5aC0
	MxtR4ar6vMPa/NC8qiCdIQYHaEH0NtA0WiFr74mcf7KRp33GRPbabGRQp3wBb3nOPJaqUB9Xwa8gu
	oDGx7pCLAdb5q9T4yFQR0KeeueLJ8LfFikn+77yZcUUv3dY8oJ/3JDc3tdxIHGp4sA8PHO/cu84LA
	cjGLsfWOFa+npFjhAK82UXGnt/BfrGjDOXWqUbGaRYRgdYbYVP41H4bfUYkSYFoGJJ8p76UVoycSo
	KmvFJIioSPLtaZq8E6aN7kbEhWL+H5fJAXUUN0EbqBvzZ/NAFvCsscXgu9lkTJc++MJD7bk9NpY1s
	BSsgHUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgbo-0000000EXPN-3QMo;
	Fri, 04 Jul 2025 13:37:45 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgAQ-0000000ETXO-3GyG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:09:29 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250704130920epoutp02a4bd4b5475d91604c468b02afac95359~PDlo1KYna2935129351epoutp02-
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Jul 2025 13:09:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250704130920epoutp02a4bd4b5475d91604c468b02afac95359~PDlo1KYna2935129351epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751634560;
	bh=7ZXkeb6eFkBOPADQFZ6Ugr+b8t74NHRMQP7v0mRURjs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=tGy7O1TWZRAGFzE9c5zCBfJ0EWJB9ZW168DlwGplfHmJMdkgUweVwdg8Ma0qOU969
	 owlFoU46WtVhNOXjrual6QCRz/QaeuITxMMQwP4EEnKVB6rxrE9Z3bslWmSbEaCWxw
	 FgEOg93qp+uo6zw0nVsaku9VYF6FtZbxTtgieNXE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250704130919epcas5p19ebf1ad617b18e718d49ca531405bd15~PDlna0mq20316103161epcas5p13;
	Fri,  4 Jul 2025 13:09:19 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.182]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bYYqx3J2Dz2SSKX; Fri,  4 Jul
	2025 13:09:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250704130916epcas5p2ccff0f947268712a35e5e80977bf5806~PDllQx00_1901719017epcas5p21;
	Fri,  4 Jul 2025 13:09:16 +0000 (GMT)
Received: from INBRO001561 (unknown [107.122.12.6]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250704130913epsmtip1efc9beeb49ba18d5c56da5d5c629e5c4~PDligOFVO0201502015epsmtip1b;
	Fri,  4 Jul 2025 13:09:13 +0000 (GMT)
From: "Pankaj Dubey" <pankaj.dubey@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Shradha Todi'"
	<shradha.t@samsung.com>, "'Rob Herring'" <robh@kernel.org>
Cc: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-fsd@tesla.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
	<kw@linux.com>, <bhelgaas@google.com>, <jingoohan1@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alim.akhtar@samsung.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <arnd@arndb.de>,
	<m.szyprowski@samsung.com>, <jh80.chung@samsung.com>
In-Reply-To: <5ea33054-8a08-4bb3-81e7-d832c53979dc@kernel.org>
Subject: RE: [PATCH v2 07/10] dt-bindings: phy: Add PHY bindings support for
 FSD SoC
Date: Fri, 4 Jul 2025 18:39:12 +0530
Message-ID: <000101dbece4$d8694d80$893be880$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFUClgbainc6hQuKSBO0V8ttZVgkwGg1JXJAfs/ltABn1f9rAD4JQ8bAeFf3fQB1zUu0wGsyVLstNTsxXA=
Content-Language: en-us
X-CMS-MailID: 20250704130916epcas5p2ccff0f947268712a35e5e80977bf5806
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03
References: <20250625165229.3458-1-shradha.t@samsung.com>
	<CGME20250625165319epcas5p3721c19f6e6b482438c62dd1ef784de03@epcas5p3.samsung.com>
	<20250625165229.3458-8-shradha.t@samsung.com>
	<20250627211721.GA153863-robh@kernel.org>
	<02af01dbea78$24f01310$6ed03930$@samsung.com>
	<f877b3d7-d770-4424-9813-da748775f456@kernel.org>
	<02bf01dbea8c$fc835cb0$f58a1610$@samsung.com>
	<5ea33054-8a08-4bb3-81e7-d832c53979dc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060927_459727_349731CA 
X-CRM114-Status: GOOD (  32.04  )
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
> Sent: Thursday, July 3, 2025 1:48 AM
> To: Shradha Todi <shradha.t=40samsung.com>; 'Rob Herring'
> <robh=40kernel.org>
> Cc: linux-pci=40vger.kernel.org; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-phy=40lists.infradead.org; linux-fsd=40te=
sla.com;
> mani=40kernel.org; lpieralisi=40kernel.org; kw=40linux.com;
> bhelgaas=40google.com; jingoohan1=40gmail.com; krzk+dt=40kernel.org;
> conor+dt=40kernel.org; alim.akhtar=40samsung.com; vkoul=40kernel.org;
> kishon=40kernel.org; arnd=40arndb.de; m.szyprowski=40samsung.com;
> jh80.chung=40samsung.com; pankaj.dubey=40samsung.com
> Subject: Re: =5BPATCH v2 07/10=5D dt-bindings: phy: Add PHY bindings supp=
ort for
> FSD SoC
>=20
> On 01/07/2025 15:35, Shradha Todi wrote:
> >>> does not support auto adaptation so we need to tune the PHYs
> >>> according to the use case (considering channel loss, etc). This is
> >>> why we
> >>
> >> So not same? Decide. Either it is same or not, cannot be both.
> >>
> >> If you mean that some wiring is different on the board, then how does
> >> it differ in soc thus how it is per-soc property? If these are
> >> use-cases, then how is even suitable for DT?
> >>
> >> I use your Tesla FSD differently and then I exchange DTSI and compatib=
les?
> >>
> >> You are no describing real problem and both binding and your
> >> explanations are vague and imprecise. Binding tells nothing about it,
> >> so it is example of skipping important decisions.
> >>
> >>> have 2 different SW PHY initialization sequence depending on the
> >>> instance number. Do you think having different compatible (something
> >>> like
> >>> tesla,fsd-pcie-phy0 and tesla,fsd-pcie-phy1) and having phy ID as
> >>> platform data is okay in this case? I actually took reference from fi=
les like:
> >>
> >> And in different use case on same soc you are going to reverse
> >> compatibles or instance IDs?
> >>
> >
> > Even though both the PHYs are exactly identical in terms of hardware,
> > they need to be programmed/initialized/configured differently.
> >
> > Sorry for my misuse of the word =22use-case=22. To clarify, these
> > configurations will always remain the same for FSD SoC even if you use =
it
> differently.
> >
> > I will use different compatibles for them as I understand that it is
> > the best option.
>=20
> I still do not see the difference in hardware explained.
>=20

Hi Krzysztof=20

Let me add more details and see if that makes sense to understand the inten=
tion
behind the current design of the PHY driver.

In FSD SoC, the two PHY instances, although having identical hardware desig=
n and
register maps, are placed in different locations (Placement and routing) in=
side the
SoC and have distinct PHY-to-Controller topologies.=20

One instance is connected to two PCIe controllers, while the other is conne=
cted to
only one. As a result, they experience different analog environments, inclu=
ding
varying channel losses and noise profiles.

Since these PHYs lack internal adaptation mechanisms and f/w based tuning,
manual register programming is required for analog tuning, such as equaliza=
tion,
de-emphasis, and gain. To ensure optimal signal integrity, it is essential =
to use different
register values for each PHY instance, despite their identical hardware des=
ign.
This is because the same register values may not be suitable for both insta=
nces due to
their differing environments and topologies.

Do let us know if this explains the intention behind separate programming s=
equence
for both instance of the PHY?

Thanks,
Pankaj Dubey
> Best regards,
> Krzysztof


