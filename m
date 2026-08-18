Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82481C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 04:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2J8nu4Hey8UwWctf5x81wbobgR75wzg5QI2g8k9cZU=; b=qApsrluCvoyb+sShyMPIMpPGoe
	8BMbN9ti6l+7A1HangMwsRDjOCFAJpBxkN0j2AB+46ts7txkDlmAzuwL+Q900w7I/DxSPR1xOnzzy
	J2oonPltVoi5GCB2WANmL+ixSuvlp2R9aH3JScPcQkEbKlyV/rx8X0HmVFjSobMcjMy1OgYQhH8jB
	3iIPZ+DsWyBg+mr2ZiBOTXNrpCy+bFh3rxm9jqgvpDFsYIZOpdRywKLNY4Xp5eibSt2IhXcjCcJvL
	dW9dyxV2lP9PHZyo4LeLrWUY4+Xkt49UIKaYURrK/kvjE1EtBW0oPySuwbvnAM+jOo740jhtrQDxY
	KGE0um6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAzd-00000007Duf-29rr;
	Tue, 18 Aug 2026 04:00:05 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAzX-00000007DtY-2jGg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 04:00:04 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260818035949epoutp0389129c20244bdea284d848b03a7a45ec~Myk5Txe2d3050230502epoutp03H
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:59:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260818035949epoutp0389129c20244bdea284d848b03a7a45ec~Myk5Txe2d3050230502epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1787025589;
	bh=H2J8nu4Hey8UwWctf5x81wbobgR75wzg5QI2g8k9cZU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Nc0iQO4XRZTBEr1C8F63Sl+E62UbVdo8KYySkR6MFrbPVke0tbk56GdvdXEfklsH/
	 C01WHDKLobFKCq6BC4XddKhZHnnCSnr7mQ7rj0HCw+GAowBfQASYw2L6EFPOtRAAFD
	 /k4opETaKveiFFpxZ2kHGASy8PxDs/1yVRUmj31E=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260818035949epcas5p44be5b57e72841931cfbaa3fef7d96f32~Myk41pdgw2027520275epcas5p4e;
	Tue, 18 Aug 2026 03:59:49 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hPGDg5jK6z6B9m5; Tue, 18 Aug
	2026 03:59:47 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260818035947epcas5p16adfc8c5f942956df7310bf76fc82e86~Myk2tWgjK1737017370epcas5p1j;
	Tue, 18 Aug 2026 03:59:47 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260818035944epsmtip24102c5d9b3cde735c82d29b9288e0537~Myk0MRq1f1699416994epsmtip2C;
	Tue, 18 Aug 2026 03:59:44 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: <aidenisik@member.fsf.org>, "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	"'Sylwester Nawrocki'" <s.nawrocki@samsung.com>, "'Chanwoo Choi'"
	<cw00.choi@samsung.com>, "'Peter	Griffin'" <peter.griffin@linaro.org>,
	"'Michael Turquette'" <mturquette@baylibre.com>, "'Stephen Boyd'"
	<sboyd@kernel.org>, "'Brian Masney'" <bmasney@redhat.com>, "'Rob Herring'"
	<robh@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>, "'Kees Cook'"
	<kees@kernel.org>, "'Gustavo A. R. Silva'" <gustavoars@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>, "'Aiden
 Isik'" <aidenisik+git@member.fsf.org>
In-Reply-To: <20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org>
Subject: RE: [PATCH 2/3] clk: samsung: clk-pll: Add support for pll_309
Date: Tue, 18 Aug 2026 09:29:42 +0530
Message-ID: <025901dd2ec6$0245bcf0$06d136d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHOeIyOJ24EK7guGNA1AUHFAM/4yAG4p0XDAgM/Jlq2orpDUA==
Content-Language: en-us
X-CMS-MailID: 20260818035947epcas5p16adfc8c5f942956df7310bf76fc82e86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260817101721epcas5p228e56fa915717b7a547df144ff801c8c
References: <20260817-for-next-lucky7-clock-v1-0-032e4b229c76@member.fsf.org>
	<CGME20260817101721epcas5p228e56fa915717b7a547df144ff801c8c@epcas5p2.samsung.com>
	<20260817-for-next-lucky7-clock-v1-2-032e4b229c76@member.fsf.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_210001_202579_DF087044 
X-CRM114-Status: GOOD (  13.63  )
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
> From: Aiden Isik via B4 Relay
> <devnull+aidenisik.member.fsf.org=40kernel.org>
> Sent: Monday, August 17, 2026 3:47 PM
> To: Krzysztof Kozlowski <krzk=40kernel.org>; Sylwester Nawrocki
> <s.nawrocki=40samsung.com>; Chanwoo Choi <cw00.choi=40samsung.com>;
> Peter Griffin <peter.griffin=40linaro.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>; Michael Turquette
> <mturquette=40baylibre.com>; Stephen Boyd <sboyd=40kernel.org>; Brian
> Masney <bmasney=40redhat.com>; Rob Herring <robh=40kernel.org>; Conor
> Dooley <conor+dt=40kernel.org>; Kees Cook <kees=40kernel.org>; Gustavo A.
> R. Silva <gustavoars=40kernel.org>
> Cc: linux-samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; linux-hardening=40vger.kernel.org; Aiden Isik
> <aidenisik+git=40member.fsf.org>
> Subject: =5BPATCH 2/3=5D clk: samsung: clk-pll: Add support for pll_309
>=20
> From: Aiden Isik <aidenisik=40member.fsf.org>
>=20
> pll_309 (referred to in the downstream kernel sources as frd_309_rpll) is=
 one
> of two PLLs used in the Exynos5515 SoC. It is an integer/fractional PLL w=
ith an
> FVCO of 600-2400MHz.
>=20
> It has the same locktime (500), and kdiv/mdiv/pdiv/sdiv masks and shifts =
as
> pll_531x, so it can be handled in exactly the same way.
>=20
> When defining a PLL, the =22con=22 parameter should be set to the CON3 re=
gister,
> like this:
>=20
> PLL(pll_309, CLK_FOUT_AUD_PLL, =22fout_aud_pll=22, =22oscclk=22,
>     PLL_LOCKTIME_PLL_AUD, PLL_CON3_PLL_AUD, NULL),
>=20
This patch does more then what is described above; please explain all chang=
es in the commit.=20
If needed, split this into common and pll_309 specific changes. Thanks=21

Regards,
Alim


