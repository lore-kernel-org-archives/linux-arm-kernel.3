Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E7EC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 04:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XADhAxJSJK7XTnD6xMYiRrgiWZbM/wAFycVV7wrUEWw=; b=JSH2HiMR7ICvPyrExontO/CBEC
	nKsOqbMWSp0Lhs5LKJ/OhBwdUi2PoDqF7t+Pk/ZuJhPTtyW1F+H/i6mSQahxybBhqGiiw2mJsnRzY
	6D2lRKySNk5cjkXItEHB29CAPm6HQbO17itT7t7E0XdwQrKupxJ9aYOHzQx7edg8bav8R1PS0Khru
	1WyI9ZZmZfIwY504LWbxNOmRBqLJiiMxmypa9XoyTH/WwGJZ1U9Fg9nZ114ZG1Hfo+ZFjCqJfRzxW
	wynZ/2xYREvma0fHltLIlOMPUmtDOxnaLxmyLMx1/SOOJ5hHbqlVCsjL6AwNsCIqs++4JD54LUqTO
	+eoBZsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugyRE-00000000g8f-15oK;
	Wed, 30 Jul 2025 04:29:12 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugyOg-00000000fxy-0ADq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 04:26:36 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250730042626epoutp02fda81bd1f53aea61c31b4f538c573608~W7OglHnsP1590815908epoutp02Z
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 04:26:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250730042626epoutp02fda81bd1f53aea61c31b4f538c573608~W7OglHnsP1590815908epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753849586;
	bh=XADhAxJSJK7XTnD6xMYiRrgiWZbM/wAFycVV7wrUEWw=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=WTpxiXNo5hDwREZCQCpXkEmdBk9uwAq4fs7H8jEmZv9y8Vqtky7kB51qPKMP25TG7
	 vvD+dEiBY+yAZlhVXyQdaffReJVuztkJ2wmIYL5lCNBHZ6429ZK3gyHLWcKPpSJ//i
	 J5HfyxnrW+QYbpU74BPHrA3RV/hGsOr6ixVuXCFg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250730042625epcas5p2bd1524fa52de5daae0afa6b10db513cf~W7Of3rIvi1492314923epcas5p23;
	Wed, 30 Jul 2025 04:26:25 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bsK0c60mZz6B9mF; Wed, 30 Jul
	2025 04:26:24 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250730042624epcas5p35c34b8407135ac6b3ffd8f5e6f85eadb~W7OeGesCm1453314533epcas5p35;
	Wed, 30 Jul 2025 04:26:24 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250730042622epsmtip2189c4cceaa19ce310300f1e31e526d55~W7OcshZbi0895408954epsmtip2K;
	Wed, 30 Jul 2025 04:26:22 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250710083434.1821671-4-dev.tailor@samsung.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: exynosautov9: add RTC DT node
Date: Wed, 30 Jul 2025 09:56:21 +0530
Message-ID: <36d501dc010a$1ba82f60$52f88e20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQMc6yo9jRPgA4nZ2IiZrgLtyBFMygGaMzhCAmY8HSqxqDjnIA==
X-CMS-MailID: 20250730042624epcas5p35c34b8407135ac6b3ffd8f5e6f85eadb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082538epcas5p2556f80b4193a046262808ae7742675be
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082538epcas5p2556f80b4193a046262808ae7742675be@epcas5p2.samsung.com>
	<20250710083434.1821671-4-dev.tailor@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_212635_530723_AA9A82BB 
X-CRM114-Status: GOOD (  14.46  )
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
> From: Devang Tailor <dev.tailor=40samsung.com>
> Sent: Thursday, July 10, 2025 2:05 PM
> To: robh=40kernel.org; krzk+dt=40kernel.org; conor+dt=40kernel.org;
> alim.akhtar=40samsung.com; alexandre.belloni=40bootlin.com;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org; linux-
> rtc=40vger.kernel.org; faraz.ata=40samsung.com
> Cc: Devang Tailor <dev.tailor=40samsung.com>
> Subject: =5BPATCH v2 3/3=5D arm64: dts: exynosautov9: add RTC DT node
>=20
> Add DT node for on-chip RTC for ExynosAutov9
>=20
> Signed-off-by: Devang Tailor <dev.tailor=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

You can also send a top-up patch to correct the ordering of the nodes based=
 on the ascending addresses.

>  arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts =7C  4 ++++
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi     =7C 10 ++++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> index de2c1de51a76..5f5167571f7a 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
> =40=40 -106,6 +106,10 =40=40 &pwm =7B
>  	status =3D =22okay=22;
>  =7D;
>=20
> +&rtc =7B
> +	status =3D =22okay=22;
> +=7D;
> +
>  &serial_0 =7B
>  	pinctrl-0 =3D <&uart0_bus_dual>;
>  	status =3D =22okay=22;
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 66628cb32776..afa6b258153c 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> =40=40 -1633,6 +1633,16 =40=40 pwm: pwm=40103f0000 =7B
>  			clock-names =3D =22timers=22;
>  			status =3D =22disabled=22;
>  		=7D;
> +
> +		rtc: rtc=4010540000 =7B
> +			compatible =3D =22samsung,exynosautov9-rtc=22;
> +			reg =3D <0x10540000 0x100>;
> +			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&xtcxo>;
> +			clock-names =3D =22rtc=22;
> +			status =3D =22disabled=22;
> +		=7D;
>  	=7D;
>  =7D;
>=20
> --
> 2.34.1



