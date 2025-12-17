Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC93D5C0C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wntWIHSg9UY6achikBORjG8viGhEJfOq4UuJcKAlK+g=; b=cTeFdnBJlstr9j0yE+8myZSbHK
	dxvfbaxaUOWiNoyDJUC0xD3XrEst4DPDM7axGIFgmQxjGSWEqw7x2J0XcKq5CA3nexA0mMnmHItxC
	8D3oLYXsZbnlrPPQjP7cklyXp8foF6rTg5f7OeWJ2xjngU/0X5SwV3zIPTpTIKWQ0lw5VK+9VI1d2
	JB4VAqfQTtEdsnH/76bE2PkX91BBla3/w0MM2yEb7m92hpTOSVN4HcIQR5sa3IHY7+3Gqmz8tMa6v
	zpSpVPXtxYLVDi9P48mAMnb1i7j3xE6Ryz1m0d5rBG7YQcxWG5BtMiPBcb+4wpUrvriQx30L3Ohbu
	I+s3E1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjNx-00000006AKS-0RsF;
	Wed, 17 Dec 2025 04:43:37 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjNt-00000006AK0-3jsz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:43:35 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251217044325epoutp04a238374486771c423dabdfa5c004515e~B5xTDSlNh0475304753epoutp04A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 04:43:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251217044325epoutp04a238374486771c423dabdfa5c004515e~B5xTDSlNh0475304753epoutp04A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765946605;
	bh=wntWIHSg9UY6achikBORjG8viGhEJfOq4UuJcKAlK+g=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DOFN8gqSfX4toBLOtYCQ6YJ2t6OnrPP44OERtI64Vlmhqprxld4RD8WXh5P3o7lNM
	 fjXbILz8j2haDKLMdDrLD5uRoWg0NCQ2oFLYnZuEOLpQPbwKlIbSo6PCKhxJCkXeIv
	 3mWpBgkWmQB7yDZ8iJP660c8RL/tQUxFkC53Efps=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20251217044324epcas5p24766d5be3325dd37a25ca3b25c734ff1~B5xSnBQPo2573425734epcas5p2U;
	Wed, 17 Dec 2025 04:43:24 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dWLlb5Hq5z6B9m6; Wed, 17 Dec
	2025 04:43:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251217044323epcas5p1509325d070f6a5bbdccafa4b07e22010~B5xRH2t390460304603epcas5p1k;
	Wed, 17 Dec 2025 04:43:23 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217044320epsmtip29c4e29ee7c9ce92651fcdd7810bfd325~B5xO67pQn1118811188epsmtip21;
	Wed, 17 Dec 2025 04:43:20 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-5-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 4/5] pinctrl: samsung: fold GS101 pin-bank macros
 into EXYNOS9_*
Date: Wed, 17 Dec 2025 10:13:19 +0530
Message-ID: <12a501dc6f0f$ace76270$06b62750$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQHmAf8yAbO5uNu10cjf4A==
Content-Language: en-us
X-CMS-MailID: 20251217044323epcas5p1509325d070f6a5bbdccafa4b07e22010
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093028epcas2p1955176332d21ce4cadf7ed8894c5c1fa@epcas2p1.samsung.com>
	<20251202093613.852109-5-youngmin.nam@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_204334_578879_133739FF 
X-CRM114-Status: GOOD (  11.61  )
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

Hi Youngmin

> -----Original Message-----
> From: Youngmin Nam <youngmin.nam=40samsung.com>
> Sent: Tuesday, December 2, 2025 3:06 PM
> To: krzk=40kernel.org; s.nawrocki=40samsung.com; alim.akhtar=40samsung.co=
m;
> linus.walleij=40linaro.org; peter.griffin=40linaro.org;
> semen.protsenko=40linaro.org; ivo.ivanov.ivanov1=40gmail.com
> Cc: ryu.real=40samsung.com; d7271.choe=40samsung.com;
> shin.son=40samsung.com; jaewon02.kim=40samsung.com; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; linux-kernel=40vger.kernel.org; Youngmin Nam
> <youngmin.nam=40samsung.com>
> Subject: =5BPATCH v3 4/5=5D pinctrl: samsung: fold GS101 pin-bank macros =
into
> EXYNOS9_*
>=20
> GS101 had dedicated GS101_PIN_BANK_EINT=7BG,W=7D helpers, but they are
> redundant with EXYNOS9_PIN_BANK_EINT=7BG,W=7D (same semantics, including
> the per-bank .eint_fltcon_offset).
> This change removes the GS101_* macros and switches the GS101 pin-bank
> tables to the EXYNOS9_* helpers with exynos9_bank_type_=7Balive,off=7D.
> While here, update the struct comment to note FLTCON is Exynos9-specific
> (not 'GS101-specific').
>=20
> One macro family for all Exynos9-era SoCs (incl. GS101) reduces copy-past=
e
> drift and keeps the FLTCON handling consistent.
> There is no functional change.
>=20
> Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin=40linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Tested-by: Peter Griffin <peter.griffin=40linaro.org> (tested on Pixel6/g=
s101)
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Tested this series on Exynosautov920 sadk board

Tested-by: Alim Akhtar <alim.akhtar=40samsung.com>


