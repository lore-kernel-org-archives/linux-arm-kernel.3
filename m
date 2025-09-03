Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CABCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JclnwSMvldXNg3mzAIKsE19OGsHun7hVYkpQHQzEaGg=; b=sIP57MatKKuFuflysIjOWk/H7F
	x8u83JxgwJqbvBw9NFcXjUgr4FlhX+hFArI5Sf28+WM0607l4ZQxCw4rLM1D8nXflfGr3dtmy4+nr
	KdC76LO+kn2vaz6zedXpaFy1T2R1sCswTd9m/ImI5gECuJrRmCVwRzBT9Two3U0MSTvscsvbWDrET
	29oTHZryukgRr12UNxe6Qi9XBDP4rjQc9P5baqa91otN+Nt7K9QgJvMtOac0bcB9XzZTwSxM0Htwi
	1no1mTWrUxHNztUjJMQVKZfnVudlR9s1dqLuIulpFENItNJEIfSYSKc5g4rMOBiWxU8oVnHpLQahp
	iadjnCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utj1e-00000005en0-0yss;
	Wed, 03 Sep 2025 08:39:30 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiEB-00000005FXG-2Zog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:48:25 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58376lcY022966;
	Wed, 3 Sep 2025 09:48:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JclnwSMvldXNg3mzAIKsE19OGsHun7hVYkpQHQzEaGg=; b=O3nFrIWCMqFeoPD+
	GoHXZrTfbqsYitdNwTPnW4e1DXmCkb6S1MXA/EDCUuRVJVEj+OAaeWDr4xoVAW02
	2xmMfdRgGlHd8M4e6RyeqQi/szE6kEIgNQ2STmdBfKqBmY2PNSIvjm0TQWiaoiKK
	nHEeIrrxPtHB/WOH8MUpFkJ0kLxbmuH19keFnPUYwmIe2pVsAIGGvt/DybJkx+t/
	TvjcsqMlW25zZX35sdFPogsXzYn0YPgWGELkfkBPYJB3hLzDMBLCB1F0y2DBAytI
	B3gN7L+Ey7YWQyOsvKTIE+AiMrmfERn9VLt/mxakGMarya/EtVIlaU5646XHqJYS
	BrXCBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxfmrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 09:48:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A372840046;
	Wed,  3 Sep 2025 09:47:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4935329039A;
	Wed,  3 Sep 2025 09:46:48 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 09:46:47 +0200
Message-ID: <7cf42f82-5f90-47a7-8308-5f0c34f3fa1d@foss.st.com>
Date: Wed, 3 Sep 2025 09:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: stm32: Minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
        =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250819131707.86657-3-krzysztof.kozlowski@linaro.org>
 <20250819131707.86657-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250819131707.86657-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_004823_947122_ACADEB1C 
X-CRM114-Status: GOOD (  13.14  )
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

Hi

On 8/19/25 15:17, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 836b1958ce65..4ff334563599 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -100,7 +100,7 @@ &combophy {
>   };
>   
>   &csi {
> -	vdd-supply =  <&scmi_vddcore>;
> +	vdd-supply = <&scmi_vddcore>;
>   	vdda18-supply = <&scmi_v1v8>;
>   	status = "okay";
>   	ports {
> @@ -151,7 +151,7 @@ phy0_eth2: ethernet-phy@1 {
>   			reg = <1>;
>   			reset-assert-us = <10000>;
>   			reset-deassert-us = <300>;
> -			reset-gpios =  <&gpiog 6 GPIO_ACTIVE_LOW>;
> +			reset-gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
>   		};
>   	};
>   };

ARM & arm64 patches applied on stm32-next.

regards
alex

