Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31907CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 05:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z74vgOVZHNwhfErJhL2+ZnEEShq8T4mkIJ9fIx6HkJQ=; b=m2TV4WAqkPmqiioPaVxLp9XnfC
	PXPRHsySHTbBgJWHIh0mfFT4bDQ0/9pvrC3Es5R69PKvtC+x4mZduY9Faughz70QADRJFtI0hz1/e
	ohgsz5HLwJ8mfzaeZNCVY1I7vOZwN8tagrfPJ3xdfG/PVgwNuuU42NjZdm/5FDABZkhPa+5IaD+ky
	rzqmi11QcqIWHzmO0NHT69nJspuMMtazGv99LIg5XWH2S8yV7Ef4WAo7n1szmwFwJMZfmYKdOE0zY
	WmAojfKKkh3Tp70mXPWsZVbg/XSlgU/0gIa8jSsSG3B/pjBsXbmQB0ZDxu2OvfWbTJdF39hXFv0lG
	+qyXCDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usx9u-0000000BDkj-3nsh;
	Mon, 01 Sep 2025 05:32:50 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usx7D-0000000BDdX-2VhH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 05:30:05 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901052955epoutp0109b1d5632e8558830f0e459cdd1c9322~hEYXAcNCt0389903899epoutp01U
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 05:29:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901052955epoutp0109b1d5632e8558830f0e459cdd1c9322~hEYXAcNCt0389903899epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756704595;
	bh=z74vgOVZHNwhfErJhL2+ZnEEShq8T4mkIJ9fIx6HkJQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=kLUxhvjWD/mYbZWj/N8LeoPc+73L39Dh+Lr0tUT3Ccl9ZUQ5rAfoo13t+w1sq8Uno
	 JLYajbXO0xArhoVcbQ/SSA8UfvitXvIdlyK3TkcBmT5JONGMQncr1f/FZsYAz/Hc0y
	 stSRy8pUgrj70HWDSK+E2B6OJ+klryW6TQCscd/s=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250901052955epcas5p22cc7004bedc0128438190393c0253af3~hEYWQVkKp0411204112epcas5p2p;
	Mon,  1 Sep 2025 05:29:55 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFcrf0XRtz6B9mF; Mon,  1 Sep
	2025 05:29:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250901052953epcas5p18a498f14a81ac41b86c227ad4c8acef4~hEYUxtHhj1182311823epcas5p1C;
	Mon,  1 Sep 2025 05:29:53 +0000 (GMT)
Received: from FDSFTE411 (unknown [107.122.81.184]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901052948epsmtip1608cfb6e73b057139f6d612781fccdea~hEYQcXvfw0550105501epsmtip1f;
	Mon,  1 Sep 2025 05:29:48 +0000 (GMT)
From: "Ravi Patel" <ravi.patel@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <jesper.nilsson@axis.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s.nawrocki@samsung.com>,
	<cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>, <tomasz.figa@gmail.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>
Cc: <ksk4725@coasia.com>, <kenkim@coasia.com>, <pjsin865@coasia.com>,
	<gwk1013@coasia.com>, <hgkim05@coasia.com>, <mingyoungbo@coasia.com>,
	<smn1196@coasia.com>, <shradha.t@samsung.com>, <inbaraj.e@samsung.com>,
	<swathi.ks@samsung.com>, <hrishikesh.d@samsung.com>,
	<dj76.yang@samsung.com>, <hypmean.kim@samsung.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@axis.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <soc@lists.linux.dev>
In-Reply-To: <e3f6d000-bbb7-45c2-93f2-69be9815ca99@kernel.org>
Subject: RE: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for ARTPEC-8 SoC
Date: Mon, 1 Sep 2025 10:59:47 +0530
Message-ID: <000301dc1b01$71e4f5a0$55aee0e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHHo9j0Rv1rvZf0N1R8AXn4x9PYUAMDo+/eAkhMLtUCILeh+gILpIJwAZ3h4W+0TgkigA==
Content-Language: en-in
X-CMS-MailID: 20250901052953epcas5p18a498f14a81ac41b86c227ad4c8acef4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64@epcas5p3.samsung.com>
	<20250825114436.46882-5-ravi.patel@samsung.com>
	<b8085dd8-e1a0-48b1-a49f-f3edaa0381da@kernel.org>
	<000201dc1af2$537b4e70$fa71eb50$@samsung.com>
	<e3f6d000-bbb7-45c2-93f2-69be9815ca99@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_223004_309955_E85BDA1C 
X-CRM114-Status: GOOD (  20.71  )
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
> Sent: 01 September 2025 10:42
> To: Ravi Patel <ravi.patel=40samsung.com>; jesper.nilsson=40axis.com; mtu=
rquette=40baylibre.com; sboyd=40kernel.org; robh=40kernel.org;
> krzk+dt=40kernel.org; conor+dt=40kernel.org; s.nawrocki=40samsung.com; cw=
00.choi=40samsung.com; alim.akhtar=40samsung.com;
> linus.walleij=40linaro.org; tomasz.figa=40gmail.com; catalin.marinas=40ar=
m.com; will=40kernel.org; arnd=40arndb.de
> Cc: ksk4725=40coasia.com; kenkim=40coasia.com; pjsin865=40coasia.com; gwk=
1013=40coasia.com; hgkim05=40coasia.com;
> mingyoungbo=40coasia.com; smn1196=40coasia.com; pankaj.dubey=40samsung.co=
m; shradha.t=40samsung.com; inbaraj.e=40samsung.com;
> swathi.ks=40samsung.com; hrishikesh.d=40samsung.com; dj76.yang=40samsung.=
com; hypmean.kim=40samsung.com; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-s=
amsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com; linux-
> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-gpio=40vger.ke=
rnel.org; soc=40lists.linux.dev
> Subject: Re: =5BPATCH v3 04/10=5D dt-bindings: pinctrl: samsung: Add comp=
atible for ARTPEC-8 SoC
>=20
> On 01/09/2025 05:41, Ravi Patel wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: 31 August 2025 18:55
> >> To: Ravi Patel <ravi.patel=40samsung.com>; jesper.nilsson=40axis.com; =
mturquette=40baylibre.com; sboyd=40kernel.org; robh=40kernel.org;
> >> krzk+dt=40kernel.org; conor+dt=40kernel.org; s.nawrocki=40samsung.com;=
 cw00.choi=40samsung.com; alim.akhtar=40samsung.com;
> >> linus.walleij=40linaro.org; tomasz.figa=40gmail.com; catalin.marinas=
=40arm.com; will=40kernel.org; arnd=40arndb.de
> >> Cc: ksk4725=40coasia.com; kenkim=40coasia.com; pjsin865=40coasia.com; =
gwk1013=40coasia.com; hgkim05=40coasia.com;
> >> mingyoungbo=40coasia.com; smn1196=40coasia.com; pankaj.dubey=40samsung=
.com; shradha.t=40samsung.com; inbaraj.e=40samsung.com;
> >> swathi.ks=40samsung.com; hrishikesh.d=40samsung.com; dj76.yang=40samsu=
ng.com; hypmean.kim=40samsung.com; linux-
> >> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linu=
x-samsung-soc=40vger.kernel.org; linux-arm-kernel=40axis.com; linux-
> >> clk=40vger.kernel.org; devicetree=40vger.kernel.org; linux-gpio=40vger=
.kernel.org; soc=40lists.linux.dev
> >> Subject: Re: =5BPATCH v3 04/10=5D dt-bindings: pinctrl: samsung: Add c=
ompatible for ARTPEC-8 SoC
> >>
> >> On 25/08/2025 13:44, Ravi Patel wrote:
> >>> From: SeonGu Kang <ksk4725=40coasia.com>
> >>>
> >>> Document the compatible string for ARTPEC-8 SoC pinctrl block,
> >>> which is similar to other Samsung SoC pinctrl blocks.
> >>>
> >>> Signed-off-by: SeonGu Kang <ksk4725=40coasia.com>
> >>> Acked-by: Rob Herring (Arm) <robh=40kernel.org>
> >>> Signed-off-by: Ravi Patel <ravi.patel=40samsung.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml =7C 1=
 +
> >>>  1 file changed, 1 insertion(+)
> >>
> >>
> >> No wakeup-eint interrupts here? samsung,pinctrl-wakeup-interrupt.yaml?
> >
> > I don't see any use case for external wake-up interrupt here (as of now=
).
>=20
> It is more about hardware, not use case. Does this hardware has EINT
> wakeup pin banks?

I checked SFR sheet, ARTPEC-8 does not have any EINT wakeup pins or SFRs.

Thanks,
Ravi

>=20
> > So wakeup-eint entry is not present in dts and yaml both.
>=20
>=20
>=20
> Best regards,
> Krzysztof


