Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C664D3A66D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8XNKjRmmoSHtbnT+B047583tz490Iz4vVOFdtNZoJY=; b=OWKgJdiTgfcyhy3BWPHga6lD37
	HJ67xIAUrl2ypaS9WSmSQ6mOHPeP0vrGhkWsV2LvYFFM/VMC6nyMYSedWmBxdqyG4It5PXjJZs/NY
	oUqLbpybNRo5gO+MR9j8vAwNfiEAbCKcS720o344KNvQKpSfFIL3PyRa5z/SgqAFV0INYqSoId/jt
	vE8N9vC7AnYafPdTqnyq2aOw9knWLtb9qfc/9fRKJ8/XBbg0UQ9fcSV1/s3QDMXh6E21EgLkUQqTp
	JsbDJakxCKGarWlQvfmW7oYxKbvh6rc9UTPJErccHlVvJ35IJe0IkGR2xp5IO3jfFLVFlpBgyOAaS
	2B2DAUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o3Q-0000000EtV2-349l;
	Tue, 29 Oct 2024 15:22:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o0Z-0000000EsaS-3u4f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:19:50 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCdqNt022607;
	Tue, 29 Oct 2024 16:19:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Z8XNKjRmmoSHtbnT+B047583tz490Iz4vVOFdtNZoJY=; b=KxG/93OGMT0y3/HC
	7uLC6mepBHlev9qb+A1+0+nlA/pBdVdCFbM5nrX6u/iugpMtuqVJUi+JBWvup6rL
	KEUcHHzfpjQpRihICT3xQUavnBK8L+nBjfN99qzNDGlzw5VrTmeiEg+w08PtOFbx
	XSQR3EM0xJVd81al77bI1tf6qMFpVJlYoyioe5gDR3U+Dcjpx5KTDJ/RMhrQvhzt
	MYIHDjb9+izNsnEYfM0G0LSvotGvjLXVG3c10eVmv9iykRDHrpfHQ+yec7dRgD+N
	XO/K6ttmdJ5yjfhLUni862l+IuZUYQbxSXx/JZR2qR+PbUJrrLVme1EjqVSeMh+8
	wPMQ5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gnj4fhxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:19:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4D3114004B;
	Tue, 29 Oct 2024 16:18:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE10C270D44;
	Tue, 29 Oct 2024 16:16:11 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:16:11 +0100
Message-ID: <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
Date: Tue, 29 Oct 2024 16:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: stm32: Add IWDG2 EXTI interrupt mapping and
 mark as wakeup source
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Guenter Roeck
	<linux@roeck-us.net>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Richard Cochran
	<richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-watchdog@vger.kernel.org>
References: <20240623195136.81522-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240623195136.81522-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_081948_459039_FDF5DAA3 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Marek

On 6/23/24 21:51, Marek Vasut wrote:
> The IWDG2 is capable of generating pre-timeout interrupt, which can be used
> to wake the system up from suspend to mem. Add the EXTI interrupt mapping
> and mark the IWDG2 as wake up source.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-watchdog@vger.kernel.org
> ---
> V2: No change
> V3: No change
> ---
>   arch/arm/boot/dts/st/stm32mp151.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
> index 1804e202eb425..68846699b26fd 100644
> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
> @@ -355,6 +355,8 @@ iwdg2: watchdog@5a002000 {
>   			reg = <0x5a002000 0x400>;
>   			clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
>   			clock-names = "pclk", "lsi";
> +			interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
> +			wakeup-source;
>   			status = "disabled";
>   		};
>   

Applied on stm32-next !!
(late but applied ;))

Regards
Alex

