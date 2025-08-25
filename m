Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576DBCA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyZaAnO05abMqFNQPoye38pNw/RRf81HOUABNDFs+ow=; b=X2JcOtprm5vGet0EbD8YiAGqhr
	DgXwDIWak9kU3kNEqAnYYQZJFLqPGpglWhJn9ysnq+UFHiN7uKCFQUiycWLhwmktBWbUm9q/7nLlD
	NateXXti2VZHLvavLbiij4TxS1CEt1pM1S1HL7U9XGWJHA3FYAQX5+XxSqJXlIsGwonhh7ibSdI+d
	7x66hbypR/oPe7z0+yJGn4rk6+9NSTTF0aBLdk+m9xjHZVuP48vMj+d5dLC9k3fd4aazHGHattwv5
	GloyreNQDtEFfHj7oDntc1+3skzEblYNFG5b5RHqiXTykZ7Tey7SwpW8/G7ZrH0RFYQXoTXs5K7LR
	w6Jz4YLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYf7-00000008LRC-2Giv;
	Mon, 25 Aug 2025 14:59:09 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWf5-00000007y5V-0IiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:51:01 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250825125054epoutp02c3faa36b3fbe7efcff6df19b63d9e6da~fA4YVBhuo2081820818epoutp026
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:50:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250825125054epoutp02c3faa36b3fbe7efcff6df19b63d9e6da~fA4YVBhuo2081820818epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756126254;
	bh=IyZaAnO05abMqFNQPoye38pNw/RRf81HOUABNDFs+ow=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=AMh285rdmU623jHntaAR4Uc/mjZOaKCdNV28Ulz6Y8YFW4MLqPqU9eQrLry+2PA5e
	 ful1ZrE3jAecQhBtGRFTOPZ3iCsxrDZjsbVrnFoa/JIQ4nGUsxCSoecAGP75ts7x/3
	 3eXVslFmwYW4edJjEgHeDXPOGDpotI/AG6N10jFc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250825125053epcas5p294541daa3b844dd44558dd8ff6676e60~fA4XffRJ20205802058epcas5p2S;
	Mon, 25 Aug 2025 12:50:53 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9Vyh1bXbz2SSKY; Mon, 25 Aug
	2025 12:50:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250825125051epcas5p4f1fd9b26b26e388fdeef403aa802c252~fA4V6hK7A1505115051epcas5p4O;
	Mon, 25 Aug 2025 12:50:51 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825125047epsmtip11752ab6f3c0ad6db5a0093669b0fc3db~fA4SKmAoD3254932549epsmtip1I;
	Mon, 25 Aug 2025 12:50:47 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <926e9bb2-cdde-4048-9ae2-159d088aa935@kernel.org>
Subject: RE: [PATCH v2 03/12] dt-bindings: media: nxp: Add support for FSD
 SoC
Date: Mon, 25 Aug 2025 18:20:46 +0530
Message-ID: <016301dc15be$e3256300$a9702900$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQF6bLd9AsRKNAMBJ/ZVhAEp+FCyAvdCX9oBWhQiOgImNHTdsk/6UEA=
Content-Language: en-in
X-CMS-MailID: 20250825125051epcas5p4f1fd9b26b26e388fdeef403aa802c252
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141014epcas5p410d41ede7e8ae4f3cf8db6d041d03946@epcas5p4.samsung.com>
	<20250814140943.22531-4-inbaraj.e@samsung.com>
	<ac9769af-9ab6-4b48-9890-ec3bcda3b180@kernel.org>
	<00d001dc136a$36ad7230$a4085690$@samsung.com>
	<7b7f6958-3178-4c6f-8be3-f52ef77464f7@kernel.org>
	<00d201dc136d$1fdd6bc0$5f984340$@samsung.com>
	<926e9bb2-cdde-4048-9ae2-159d088aa935@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_055059_416143_0643EAE8 
X-CRM114-Status: GOOD (  13.54  )
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

> >
> > Using tesla,syscon-csis results in a =22prefix not found=22 issue when
> > running dtbs_check
> Because you develop on ancient, 10 year old downstream kernel?
>=20
> You really do not try enough and this is just wasting our time.
>=20
> Please think and really carefully check your replies. What prefix do you =
have
> in compatible? This command:
> git grep tesla, =7C wc -l
>=20
> gives '99' results including obviously vendor prefix.
>=20
> So your warning is basically impossible or your code is just broken.
> Don't just ask maintainers on every little trouble you have. You must deb=
ug
> it. Not we.
>=20

Sorry, I made a mistake while  running dtbs_check. I'll use the tesla prefi=
x in the next
patchset

Regards,
Inbaraj E


