Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B39C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raYhcpxvaUZ+U3DFFXokA1FxIAXMkZbDHQQsHnlKWKI=; b=Jn6mYspU8fOf/mVor4lLDe4c+m
	KcOlxpLO9dbrdYr3lVCXXhbaju3eStErj//IrThehYZaWe8wiynt5fKJgktyHc+gBj2VN3wF2+0tm
	0/FH32rowNGhG84ZOj5QwrMfQsJH7c27GPlVJcVtba2NeaYtCB6BgRKBG+yk91xNA/7ku1WnmetUt
	7StXksqpnpQE89Zpg3t1N5ZMpUzXI/oC+BUtbab6CntWsFOyO3na8sW3dTFWNy1xhaWhiK2DeP/RT
	nxAG8lMu1iwgX+j+ZaR4Nstwv1Dv+dKaPvFZpiJeMmQhL/K+Ni49akTCiKXC1y4KKstn9OYVAKNxR
	CcW4wOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOY0d-00000003gKP-2k2p;
	Mon, 09 Jun 2025 08:37:35 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXwD-00000003fbd-2URU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 08:33:05 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250609083255epoutp025d4586a04c2b00de1a521efe269e7775~HUsJ0pTOD0309603096epoutp02s
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Jun 2025 08:32:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250609083255epoutp025d4586a04c2b00de1a521efe269e7775~HUsJ0pTOD0309603096epoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749457975;
	bh=raYhcpxvaUZ+U3DFFXokA1FxIAXMkZbDHQQsHnlKWKI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=GOoEi8dngFVNeJONQ9mfq/T09fwR7WYEGOMbyQK+/rtoK0dGisjvx6pEr8hFVh6At
	 ZfK9QzcjKwu+ZraOf0+tatFdzdLep5bvLjWdCBJlcycDJocNu+xUafHoNDqc2Y42Vu
	 xv6kbPMU863HBsH29OktGcSRHPjWjLGG+hVYZ8j0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250609083254epcas5p4582a8ece71f15b0d09c96fde109aabc7~HUsJBovem0515605156epcas5p49;
	Mon,  9 Jun 2025 08:32:54 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.183]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bG4tX4gGSz6B9m9; Mon,  9 Jun
	2025 08:32:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250609083251epcas5p1380bd5ffe9b5b91f776a1c7f48b317df~HUsGa3UxF3208532085epcas5p1d;
	Mon,  9 Jun 2025 08:32:51 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250609083249epsmtip1185a8a7cdb024a1a522bad1061beae6f~HUsEApVOx2620026200epsmtip1X;
	Mon,  9 Jun 2025 08:32:49 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Raghav Sharma'" <raghav.s@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <richardcochran@gmail.com>,
	<sunyeal.hong@samsung.com>, <shin.son@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<chandan.vn@samsung.com>, <karthik.sun@samsung.com>,
	<dev.tailor@samsung.com>
In-Reply-To: <20250529112640.1646740-5-raghav.s@samsung.com>
Subject: RE: [PATCH v3 4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock
 DT nodes
Date: Mon, 9 Jun 2025 14:02:47 +0530
Message-ID: <047901dbd919$16a39270$43eab750$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIRyuXPQglR2pg1tLiplohNF2WAzQHWb0Q+AhHSDDezb1SDcA==
Content-Language: en-us
X-CMS-MailID: 20250609083251epcas5p1380bd5ffe9b5b91f776a1c7f48b317df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef@epcas5p4.samsung.com>
	<20250529112640.1646740-5-raghav.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_013303_882608_542B0366 
X-CRM114-Status: GOOD (  15.37  )
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

Hi Raghav

> -----Original Message-----
> From: Raghav Sharma <raghav.s@samsung.com>
> Sent: Thursday, May 29, 2025 4:57 PM
> To: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> alim.akhtar@samsung.com; mturquette@baylibre.com; sboyd@kernel.org;
> robh@kernel.org; conor+dt@kernel.org; richardcochran@gmail.com;
> sunyeal.hong@samsung.com; shin.son@samsung.com
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; netdev@vger.kernel.org;
> chandan.vn@samsung.com; karthik.sun@samsung.com;
> dev.tailor@samsung.com; Raghav Sharma <raghav.s@samsung.com>
> Subject: [PATCH v3 4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock DT
> nodes
> 
> Add required dt node for CMU_HSI2 block, which provides clocks to ufs and
> ethernet IPs
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index 2cb8041c8a9f..7890373f5da0 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> @@ -1048,6 +1048,23 @@ pinctrl_hsi1: pinctrl@16450000 {
>  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> 
> +		cmu_hsi2: clock-controller@16b00000 {
> +			compatible = "samsung,exynosautov920-cmu-hsi2";
> +			reg = <0x16b00000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
> +				 <&cmu_top
> DOUT_CLKCMU_HSI2_NOC_UFS>,
> +				 <&cmu_top
> DOUT_CLKCMU_HSI2_UFS_EMBD>,
> +				 <&cmu_top
> DOUT_CLKCMU_HSI2_ETHERNET>;
> +			clock-names = "oscclk",
> +				      "noc",
> +				      "ufs",
> +				      "embd",
> +				      "ethernet";
> +		};
> +
>  		pinctrl_hsi2: pinctrl@16c10000 {
>  			compatible = "samsung,exynosautov920-pinctrl";
>  			reg = <0x16c10000 0x10000>;
> --
> 2.34.1



