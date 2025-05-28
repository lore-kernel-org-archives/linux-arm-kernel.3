Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726EAC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsxchGz+NPMbQD+2/mdAAZvARKNk9ZKprAWBWXssYfg=; b=MQyvS2doBW1ICMlpZbk3T3fd7z
	tQHKlk2qsM/4OErGjc4xCYVyqldUejZPOTgOZC5VFiDcT2zmg5xcs8/cEvbbLoVQcpTPptYSE3HEj
	l334bJYCFbHLId1oECpozLVS9hEtqjNsHemP2VtOG5uHR5HCYFit5CIaXbMEhi3Apew3eb81FJB6+
	y5xv2apoLFT2IQ7CIKIFTegR/VwvrPbLKzEsIezqB+pvtvhMWOSxO4u7FHKivOd+e/Ps1g8VfvotL
	xkVLKe10vgv4QTLq19EIDZheviuY7f/beoGopp/g55nIzlJq4Jo8/tCoY04qP6YBBBHsPMDfGLQim
	P+R50zrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHrM-0000000DPlw-28BM;
	Wed, 28 May 2025 14:34:24 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFiO-0000000D4zy-42ZK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:17:02 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SB7A5E007927;
	Wed, 28 May 2025 14:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gsxchGz+NPMbQD+2/mdAAZvARKNk9ZKprAWBWXssYfg=; b=P8uR/8ZYHA6PyU+p
	1yQYTn8+drhMGTmu/DwUOUFEmJY6sFik+XP7pbPz0hRRgOgJdATJhYeD+ClTZxvW
	OfwmpHZkxYvD83+alQD1NSA43S/Ma1WerAhlvHAHY3sKa4nva2yaT7tvmQESC8Xy
	MNtWCjm8Evwhv9FJG61K3A7gKhoP2rkAFns0EQRDXcncu5yIYuQAvrycmWQBj6AJ
	/+QwsZJ43IrNZdjnZR9bWlQkQskQ/Yyy7Xk/r48zr/K2Y/d30WGeyQ7CQPMiQQv6
	sO7e7tkct39wYJYdYW119O178HKQVb5ndHre0L6ztrjwyE8tacZF58sBBnYeal+x
	mcS98Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f2951g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 14:16:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF12C40049;
	Wed, 28 May 2025 14:15:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EC216D63CF;
	Wed, 28 May 2025 14:14:49 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 14:14:48 +0200
Message-ID: <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
Date: Wed, 28 May 2025 14:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_051701_289199_0A255D01 
X-CRM114-Status: GOOD (  12.86  )
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

On 5/28/25 10:55, Krzysztof Kozlowski wrote:
> On 23/05/2025 14:38, Clément Le Goffic wrote:
>> Add the hdp devicetree node for stm32mp13 SoC family
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp131.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> index 8512a6e46b33..b0537bcdb9d5 100644
>> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> @@ -951,6 +951,12 @@ dts: thermal@50028000 {
>>   			clocks = <&rcc DTS>;
>>   			clock-names = "pclk";
>>   			#thermal-sensor-cells = <0>;
> 
> Why are you enabling it? Commit msg should explain this and this should
> be sparate patch.

Oops good catch I'll fix this.

> 
>> +		};
>> +
>> +		hdp: pinctrl@5002a000 {
>> +			compatible = "st,stm32mp131-hdp";
>> +			reg = <0x5002a000 0x400>;
>> +			clocks = <&rcc HDP>;
>>   			status = "disabled";
> 
> Why are you disabling it? What is missing?

Nothing is missing just disabled by default.
The node is then enabled when needed in board's dts file.

> 
>>   		};
>>   
>>
> 
> 
> Best regards,
> Krzysztof

Clément

