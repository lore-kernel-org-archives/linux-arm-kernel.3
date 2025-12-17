Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E7DD64073
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 04:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwMQFbuii6OFTcgrFdkJAKQYDxCd7chG2CDPC72TD5A=; b=zEFh7uOWR0SioKqHruu12Bp/Vc
	dSnrmLdSHR+mehO2EiFSGDsvzUgNpPkJVUhVFF5NkcTBuD6ihUDWZ7dEPZhQMFzzD8KX0PIpXjJ3d
	PfYIN8o6O5AjYjNfftvcJzjQ5iWlcIBYDXgJ1S8KCLABUNAc+ocwh93ZUpIcox2ook+FeqyunAfcE
	SwR+b2/7o7PaU/G4WB3Bk+9iBKYtnyg6nW/ibtCG9hXo06sE/Hpp+Ea52c1OKLixELABAocGAABmo
	IUk5uEMfB9ntcF4l6RwuL2bRd55Y0+t0RmRT1tbMKgIyYhBlqWG5qcx2O5kwfD/VrZfvHoZ7m+YO+
	Q2bsk6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjXv-00000006AjP-0j1T;
	Wed, 17 Dec 2025 04:53:55 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVjXr-00000006Aj2-2JwG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 04:53:53 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251217045346epoutp03fda88dea31a456568c3bc48fddcfb171~B56VZmxlQ1763217632epoutp03U
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 04:53:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251217045346epoutp03fda88dea31a456568c3bc48fddcfb171~B56VZmxlQ1763217632epoutp03U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765947226;
	bh=gwMQFbuii6OFTcgrFdkJAKQYDxCd7chG2CDPC72TD5A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=uq3zEgJcxfA0KYJ+2W/wfrcmgpRhiw3dwweN34dYNJEBAX9c4XhU80UOOGndMq4tv
	 ZAnCegS3EIZZh/rTANaRSm9e1BoSl1zcGOQwEv8kAvV+EvzUlWxTWLprppf6jxUMTV
	 RKlaC56uHP9Zv8YnGb2jR8lGwD0dNTa+3nlkdXn8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251217045345epcas5p4a03712a3b5ba5d381ea11a76fb4c1a33~B56U3zm0r2314923149epcas5p4f;
	Wed, 17 Dec 2025 04:53:45 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4dWLzX48Bxz6B9m6; Wed, 17 Dec
	2025 04:53:44 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251217045343epcas5p42b5288f51ac3b36862605f0a4b6e1281~B56SvsDZr3255232552epcas5p4p;
	Wed, 17 Dec 2025 04:53:43 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251217045341epsmtip15abe4c870d785544f9f672b775006566~B56QzUVqU1277712777epsmtip1F;
	Wed, 17 Dec 2025 04:53:41 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Youngmin Nam'" <youngmin.nam@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<peter.griffin@linaro.org>, <semen.protsenko@linaro.org>,
	<ivo.ivanov.ivanov1@gmail.com>
Cc: <ryu.real@samsung.com>, <d7271.choe@samsung.com>,
	<shin.son@samsung.com>, <jaewon02.kim@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20251202093613.852109-6-youngmin.nam@samsung.com>
Subject: RE: [PATCH v3 5/5] pinctrl: samsung: rename gs101_pinctrl_* to
 exynos9_pinctrl_*
Date: Wed, 17 Dec 2025 10:23:40 +0530
Message-ID: <12a701dc6f11$1e9412a0$5bbc37e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF3wuMlGH6lOpjjwF0q/fgc3qftgQH6Vff4AS6bXfS11VMO8A==
Content-Language: en-us
X-CMS-MailID: 20251217045343epcas5p42b5288f51ac3b36862605f0a4b6e1281
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093029epcas2p19224bab81f8ed2b9f63613fdd010ab57
References: <20251202093613.852109-1-youngmin.nam@samsung.com>
	<CGME20251202093029epcas2p19224bab81f8ed2b9f63613fdd010ab57@epcas2p1.samsung.com>
	<20251202093613.852109-6-youngmin.nam@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_205352_254002_814E54B7 
X-CRM114-Status: GOOD (  12.18  )
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

Hello Youngmin

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
> Subject: =5BPATCH v3 5/5=5D pinctrl: samsung: rename gs101_pinctrl_* to
> exynos9_pinctrl_*
>=20
> The suspend/resume helpers named gs101_pinctrl_=7Bsuspend,resume=7D are
> not GS101-specific. They implement the generic save/restore sequence used
> by Exynos9-style controllers that have EINT filter configuration
> (eint_fltcon) to preserve.
>=20
> Rename them to exynos9_pinctrl_=7Bsuspend,resume=7D and update all users:
>   - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
>     exynosautov9, fsd, and gs101 controller tables
>   - prototypes in pinctrl-exynos.h
>   - definitions in pinctrl-exynos.c
>=20
> This aligns naming with the earlier macro/doc cleanups (e.g. using
> EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
> makes the helpers clearly reusable by other Exynos9-like SoCs.
>=20
> Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin=40linaro.org>
> Tested-by: Peter Griffin <peter.griffin=40linaro.org> (tested on Pixel6/g=
s101)
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

Tested this series on Exynosautov920 sadk

Tested-by: Alim Akhtar <alim.akhtar=40samsung.com>



