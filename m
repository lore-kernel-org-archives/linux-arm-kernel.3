Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13C4C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQa5mHxFaZenQFbNXj3M8QXGg67jJVe+kRCeOm2ocMw=; b=vvCDv36dgqovuuke75mHpEQTz1
	hLGuHmpyqEMvbshPa61oRn1gHSLkKJlE2ENTqn4hw9vEvOAD21PeVsm4fvT/FOu3EX5ay7mS/zRk4
	T9ErDHm7CtK45piGFhBur+LemtXqf9imlKRZfsZ+AnBfWBnXmOcsm3vJuIZ1BdZLZNsoKEG2/tHTY
	uCY+aP4PFZn6mwN4WeunlyF6g9wBhaeoj7y0PG0AJzx/GqFdCrkXA0lmzoSA4q88545TB26osIBgg
	S2WTAXx0Ck4JJshBLC/KIWM8D1p6+THaPfEbvDMJBKQBbmUpqUq85j32nUDQ80+fJ59SxKgPKc+/S
	jBDRW6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PF6-0000000DNwk-2m8i;
	Fri, 18 Sep 2026 03:26:28 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7PF3-0000000DNvy-31Pb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:26:27 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260918032620epoutp04d15d1fddb904f2eb2ad9435d0c795a46~WTHglZc0Q0800508005epoutp04f
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 03:26:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260918032620epoutp04d15d1fddb904f2eb2ad9435d0c795a46~WTHglZc0Q0800508005epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789701980;
	bh=lQa5mHxFaZenQFbNXj3M8QXGg67jJVe+kRCeOm2ocMw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=m7ZQxwZraolcPK00vck2WkQcQLsE2Kbyyq3eZXsUVjykqEOU/I0WXfQie2hyb7xVr
	 GIzWZw3CZkXQvFzGpit3TBhW2TkLAZU9mRJLTuJfOBfKDa/EZYPj/hlEUHOBc8nBWN
	 S0BHiRYnldYzr8AyIp4ontY2TIqMaGEOX+TSXXUA=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260918032620epcas5p16d29c6802e42e2ffcfef27610814e80e~WTHgJiGgk1261512615epcas5p10;
	Fri, 18 Sep 2026 03:26:20 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hmJ1l30JHz2SSKg; Fri, 18 Sep
	2026 03:26:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260918032618epcas5p32f86bd24eeb25fdd4ee655495816ff4b~WTHepL_oj2572725727epcas5p3p;
	Fri, 18 Sep 2026 03:26:18 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260918032615epsmtip18a6146a6aa358bc07d721d969f444f17~WTHb1aB5n3129331293epsmtip1U;
	Fri, 18 Sep 2026 03:26:15 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Selvarasu Ganesan'" <selvarasu.g@samsung.com>, <krzk@kernel.org>,
	<peter.griffin@linaro.org>, <gregkh@linuxfoundation.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <mani@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <jh0801.jung@samsung.com>, <h10.kim@samsung.com>,
	<dh10.jung@samsung.com>, <akash.m5@samsung.com>, <hongpooh.kim@samsung.com>,
	<eomji.oh@samsung.com>, <shijie.cai@samsung.com>,
	<muhammed.ali@samsung.com>, <thiagu.r@samsung.com>
In-Reply-To: <20260916122229.2604003-4-selvarasu.g@samsung.com>
Subject: RE: [PATCH v2 3/3] usb: dwc3: Add Exynos8855 to the generic
 platform driver
Date: Fri, 18 Sep 2026 08:56:14 +0530
Message-ID: <058401dd471d$7801a3e0$6804eba0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGcfDqIrCW7OKewQ35ZfbAvR1onfQJI8H1BAp78Uta3LgLn8A==
Content-Language: en-us
X-CMS-MailID: 20260918032618epcas5p32f86bd24eeb25fdd4ee655495816ff4b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122357epcas5p3578059e36eafeb4602f4fb57cd72c883@epcas5p3.samsung.com>
	<20260916122229.2604003-4-selvarasu.g@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_202626_083000_143FAC87 
X-CRM114-Status: GOOD (  17.81  )
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
> From: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> Sent: Wednesday, September 16, 2026 5:52 PM
> To: krzk=40kernel.org; peter.griffin=40linaro.org; alim.akhtar=40samsung.=
com;
> gregkh=40linuxfoundation.org; robh=40kernel.org; conor+dt=40kernel.org;
> Thinh.Nguyen=40synopsys.com; mani=40kernel.org;
> selvarasu.g=40samsung.com; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; linux-usb=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Cc: jh0801.jung=40samsung.com; h10.kim=40samsung.com;
> dh10.jung=40samsung.com; akash.m5=40samsung.com;
> hongpooh.kim=40samsung.com; eomji.oh=40samsung.com;
> shijie.cai=40samsung.com; muhammed.ali=40samsung.com;
> thiagu.r=40samsung.com
> Subject: =5BPATCH v2 3/3=5D usb: dwc3: Add Exynos8855 to the generic plat=
form
> driver
>=20
> Add the =22samsung,snps-dwc3=22 compatible string to dwc3-generic-plat so=
 the
> Exynos8855 USB3 DWC3 controller can probe through the generic DWC3
> platform glue. While at it, alphabetically reorder the existing entries.
>=20
> The =22samsung,snps-dwc3=22 string is used as a generic fallback to suppo=
rt any
> Exynos SoC that utilizes a flattened model instantiation. This fallback a=
llows
> multiple Exynos SoCs to be supported by the generic platform driver simpl=
y
> by adding the fallback compatible to their respective device tree nodes.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali=40samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  drivers/usb/dwc3/dwc3-generic-plat.c =7C 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-
> generic-plat.c
> index ca69ac0eb07c..10c1146564b7 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> =40=40 -232,10 +232,11 =40=40 static const struct dwc3_generic_config
> eic7700_dwc3 =3D  =7B  =7D;
>=20
>  static const struct of_device_id dwc3_generic_of_match=5B=5D =3D =7B
> +	=7B .compatible =3D =22eswin,eic7700-dwc3=22, &eic7700_dwc3=7D,
> +	=7B .compatible =3D =22fsl,ls1028a-dwc3=22, &fsl_ls1028_dwc3=7D,
> +	=7B .compatible =3D =22samsung,snps-dwc3=22, =7D,
>  	=7B .compatible =3D =22spacemit,k1-dwc3=22, &spacemit_k1_dwc3=7D,
>  	=7B .compatible =3D =22spacemit,k3-dwc3=22, =7D,
> -	=7B .compatible =3D =22fsl,ls1028a-dwc3=22, &fsl_ls1028_dwc3=7D,
> -	=7B .compatible =3D =22eswin,eic7700-dwc3=22, &eic7700_dwc3=7D,
>  	=7B .compatible =3D =22starfive,jhb100-dwc3=22, =7D,
>  	=7B /* sentinel */ =7D
>  =7D;
> --
> 2.17.1



