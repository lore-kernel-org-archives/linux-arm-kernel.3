Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943EDC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4S1yvQgwjaSQPCxRvjbfFApSmtTLLVqtOux/1CmiffM=; b=YTxVb58h2bzqX2DAgbFyjXQ3zy
	yr6aZfQNqhLA2tGjj8rp8CUGPAM9wjy90U2vqzFjpX679/cT87rj0cZfgc3c3lQPnkWrVUAgU9LbC
	s8zk8mWTCiIeEhvoB2c3BiaPf3rkLWl2lao+Onc/WgONgnS5JFejiFmWLL6aCojHW5amuhAsLQNwb
	fyNJpkBhmJ9yTHD+QqJrPzqssgmyLWiyLJoV7zUxkTwmeiqjgcu7upqoq8aPktutEoJPmTySFHVuY
	1pykLm1Px62KLjNrageg/ieL3OIXtlzxBnkIYYMvpjuLIKsJ7sOBHYIuq+x8F25tKN4no2RikPcbv
	Y1jnWTwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y8i-0000000AKQ8-0zzu;
	Wed, 23 Apr 2025 11:19:40 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VOY-00000009ikY-1ayX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 08:23:53 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250423082343epoutp02f3afa60d3cd500712610c341f3898852~45PtfW6H30414404144epoutp02j
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 08:23:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250423082343epoutp02f3afa60d3cd500712610c341f3898852~45PtfW6H30414404144epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1745396623;
	bh=4S1yvQgwjaSQPCxRvjbfFApSmtTLLVqtOux/1CmiffM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=BZ7qWesr7tr/5WNPbbZBaZ1i+jsCr+KTXoXJ6U1WEYojidChkOTGEy6Wt9voXDgOf
	 n9qhQ5+d6yLoE0KXXFjN8zfuHEpFNmMczll3TxD+PGgIczi1HYwzDxYxKwR4cunnbE
	 MGYGaa/oyItlmSeAZyEOHtIqiwPngmxh1zRALpCE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250423082343epcas5p2859446c8e5bc718417786106955cc012~45PsvxeeO1969819698epcas5p28;
	Wed, 23 Apr 2025 08:23:43 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.176]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZjBvd5GpSz6B9mD; Wed, 23 Apr
	2025 08:23:41 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250423082341epcas5p39444809bd4c8cb0676dc942d76b42365~45PrBIWav1352713527epcas5p3m;
	Wed, 23 Apr 2025 08:23:41 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250423082341epsmtrp20653e6b78f9f4c17e6effa4382b3c3bb~45PrATVbO0694106941epsmtrp2J;
	Wed, 23 Apr 2025 08:23:41 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-53-6808a38dc248
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	81.F5.07818.D83A8086; Wed, 23 Apr 2025 17:23:41 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250423082339epsmtip2a817efb40038bd9238c8dd033bde5bcc~45PpYrBW91211812118epsmtip2W;
	Wed, 23 Apr 2025 08:23:39 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Yashwant Varur'" <yashwant.v@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Cc: <cs0617.lee@samsung.com>, <g.naidu@samsung.com>,
	<niyas.ahmed@samsung.com>
In-Reply-To: <20250423060034.973-1-yashwant.v@samsung.com>
Subject: RE: [PATCH] arm64: dts: exynos: Added the ethernet pin
 configuration
Date: Wed, 23 Apr 2025 13:53:38 +0530
Message-ID: <008a01dbb429$04f55f50$0ee01df0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+tP5AvR0g22A5T67WLyfPVk3CYgKkYErqstW+shA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSvG7vYo4Mg847LBZr9p5jslj1jtdi
	/pFzrBZbZl5mtng56x6bxabH11gtLu+aw2Yx4/w+JosnUx6xWvzfs4PdYtXER2wO3B6bVnWy
	eWxeUu/Rt2UVo8fnTXIBLFFcNimpOZllqUX6dglcGQceJhU0CFR8u3GVqYHxKm8XIyeHhICJ
	ROPFLYxdjFwcQgK7GSW+npzKDJGQlri+cQI7hC0ssfLfc3aIoueMEq0rHoEl2AR0JXYsbmMD
	SYgIdDBJXH/zgLWLkYODWSBI4svuQIiGbkaJFQc7waZyClhJ/F14mRXEFhbwldjdcQZsEIuA
	qsSudRvB4rwClhLn/sxlgbAFJU7OfAJmMwtoS/Q+bGWEsZctfA11qYLEz6fLwHpFgObPaOtl
	g6gRl3h59Aj7BEbhWUhGzUIyahaSUbOQtCxgZFnFKJlaUJybnptsWGCYl1quV5yYW1yal66X
	nJ+7iREcaVoaOxjffWvSP8TIxMF4iFGCg1lJhPeXG3uGEG9KYmVValF+fFFpTmrxIUZpDhYl
	cd6VhhHpQgLpiSWp2ampBalFMFkmDk6pBia71hmcnT3e2Tl626N2Hpuw4I5wsJmWRvC/VsVP
	9f9n1kywtzkzOX5lXq3sBwv/av/fAndeXnTLn2jAn/NMU8PiefKCfXsE3C43Vrd/ON5hMP/a
	RF7RZ3k/EsUTF5UXXhJ8HT3/T87Bn1c0NzkdqDt0z6qyfou5GJ+A28L4hS9VDdcEFPi/Xv91
	NueC5pLVEzScucuW1azun+qVpb/33KudNkWzIkuuLjD1S/13fJKMrqnf1EMLFsRerA5rt5r/
	4crG7X8/FD5Y7nN4oV6b+zXpbZ85jq9Si5H03y6h+Gqp0nyx3xINAkp9kls8wsUENpfeeXc7
	yOTZivdft5rJNm0/dK69c6oVI9O7f/4b+mYqsRRnJBpqMRcVJwIAfGKkqSMDAAA=
X-CMS-MailID: 20250423082341epcas5p39444809bd4c8cb0676dc942d76b42365
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a
References: <CGME20250423060042epcas5p2c04be779e21089f33b8a9a7785bb151a@epcas5p2.samsung.com>
	<20250423060034.973-1-yashwant.v@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_012351_064999_AA21EA7C 
X-CRM114-Status: GOOD (  14.08  )
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

Hi Yashwant,

> -----Original Message-----
> From: Yashwant Varur <yashwant.v=40samsung.com>
> Sent: Wednesday, April 23, 2025 11:31 AM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; devicetree=40vger.kernel.org; linux-arm-
> kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Cc: cs0617.lee=40samsung.com; g.naidu=40samsung.com;
> niyas.ahmed=40samsung.com; yashwant.v=40samsung.com
> Subject: =5BPATCH=5D arm64: dts: exynos: Added the ethernet pin configura=
tion
>=20
> This patch adds the ethernet pin configuration.
>=20
Please follow https://www.kernel.org/doc/html/latest/process/submitting-pat=
ches.html=23describe-your-changes
to describe our changes.

> Signed-off-by: Yashwant Varur <yashwant.v=40samsung.com>
> Signed-off-by: Changsub Lee <cs0617.lee=40samsung.com>
> ---
>  .../dts/exynos/exynosautov920-pinctrl.dtsi    =7C 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> index 663e8265cbf5..778584d339d5 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-pinctrl.dtsi
> =40=40 -166,6 +166,24 =40=40 gph6: gph6-gpio-bank =7B
>  		interrupt-controller;
>  		=23interrupt-cells =3D <2>;
>  	=7D;
> +
> +	eth0_pps_out: eth0_pps_out =7B
> +		samsung,pins =3D =22gph3-0=22;
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;
> +		samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
> +	=7D;
> +
> +	eth0_rgmii: eth0_rgmii =7B
> +		samsung,pins =3D =22gph3-1=22, =22gph3-2=22, =22gph3-3=22, =22gph3-4=
=22,
> +				=22gph3-5=22, =22gph3-6=22, =22gph3-7=22, =22gph4-0=22,
> +				=22gph4-1=22, =22gph4-2=22, =22gph4-3=22, =22gph4-4=22;
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
> +	=7D;
> +
> +	eth0_mdc_mdio: eth0_mdc_mdio =7B
> +		samsung,pins =3D =22gph4-5=22, =22gph4-6=22;
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_2>;
No need to set drive strength and pull-=7Bup/down=7D??


