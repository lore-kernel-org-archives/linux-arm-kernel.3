Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E65CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdRuwvgpdfkzMUyKr6tHlpFHvNuuCdXxV4D+HC6QaMA=; b=rhu4SNgxdqBoXLv7COj0RMpxTO
	pfWpt85WLtTtEXPRdFH4HIqaQL0CNnQEItjggdQslyvRSj6qfSGMQPq5z4oah6h19d8IqoB0abJG+
	iT0qt19DXhX9dOujVoDPkMOxcWxWMEIokr2tBpwsh6tyBb8SsrXInH7XwYjHSNuCc3uD3Q5vzMgZZ
	pjobD0l4IjHRCKu+IYUP0W4q8eJb4bAi1WEJTJVa3rI2MHmpMgb2dFq9de+nUqERhZGt2sE/o3vK5
	td74xSi+4HYaJaPVtYedcevs0Chu5zvMKCJTyTdOEq7oMKAZEfvta2Zq8uOC71+jv1EtJWY6jD44b
	RzK47hjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphlf-00000003yau-0RKY;
	Sat, 23 Aug 2025 06:30:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRNI-00000002Z7S-0EKA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:00:09 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCoe7v030096;
	Fri, 22 Aug 2025 14:59:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	fdRuwvgpdfkzMUyKr6tHlpFHvNuuCdXxV4D+HC6QaMA=; b=KI/XT+6MJhFi2WeZ
	w5MTkk1UGOx796nFOR/zy+WvJGJudHm7jyOVRGMaXPZ8w3xyHBktOam8O+P/3qVX
	VHDVymxUsP8rpSaly0cSlknRRPL6vW9aO4zwzjIUFMukfMXWBkOUO/R1oZ8meTeE
	+3JvIr4Rbjysy0r1W0Q/J9U7xURtq1A05uWJ4tvY912gefWrZ6GZBa/HvUhyXXpX
	HxiAMdLAgdqNKPU1FHAuEoJ9zVdZywDzhv7Qk6PQCRxrdKDMtOL2kaUPbwAAgvuw
	htF5OKdOLwYHZctSLYtibJWJz5iaAjqC+/wUYlz1RUa9qnLm8+DKybMjl1Az8Lhr
	hFtBYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n77uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 14:59:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 23DE04004B;
	Fri, 22 Aug 2025 14:58:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4281871EE31;
	Fri, 22 Aug 2025 14:57:40 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:57:39 +0200
Message-ID: <7278430c-0b01-4a35-b1c0-b906e6cf464a@foss.st.com>
Date: Fri, 22 Aug 2025 14:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] arm64: dts: st: add ltdc support on stm32mp251
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-9-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-9-7060500f8fd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_060008_361122_5FD7CD7F 
X-CRM114-Status: GOOD (  13.71  )
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

Hi Raphael,

Thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 21/08/2025 à 13:08, Raphael Gallais-Pou a écrit :
> The LCD-TFT Display Controller (LTDC) handles display composition,
> scaling and rotation.  It provides a parallel digital RGB flow to be
> used by display interfaces.
>
> Add the LTDC node.
>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 303abf915b8e489671b51a8c832041c14a42ecb8..372a99d9cc5c3730e8fbeddeb6134a3b18d938b6 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1576,6 +1576,18 @@ dcmipp: dcmipp@48030000 {
>   				status = "disabled";
>   			};
>   
> +			ltdc: display-controller@48010000 {
> +				compatible = "st,stm32mp251-ltdc";
> +				reg = <0x48010000 0x400>;
> +				interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>;
> +				clock-names = "lcd", "bus";
> +				resets = <&rcc LTDC_R>;
> +				access-controllers = <&rifsc 80>;
> +				status = "disabled";
> +			};
> +
>   			combophy: phy@480c0000 {
>   				compatible = "st,stm32mp25-combophy";
>   				reg = <0x480c0000 0x1000>;
>

