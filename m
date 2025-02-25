Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053A7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7ilTU0nfN/VhX4AMlIMGSs7WY/ZNM9E5SfWaQXtVJA=; b=EHXRg7kjJTiVxHYdt8+Oko3QJK
	Zyf1H9ZQz8ttOfF4lkOGBgPbSvDtLWErB6dS+fV74a2OIOnFXfAYwgjYp6KCuFDo0I9QhXwiIhKRt
	tsgwTE2uQI6GGH40BzAYODDhFlaTlskVNSZcIrOb2Ujm/9LsjVOQ376qSqH72FgjD3A5+gnzfi8cu
	1rKNJolxB9nSitEeht486vgUwBQ6s5GQCWYNTd53X/7hBMcQ/8UDrvJN3m4Zy206a8euTvMvf1rWQ
	LiCy2p+0IHD20est/hyOGuPmxM4kSu/qX4NoF9bWCPpUhGGHSMLr7c6dmDFlfb7yOh/XlcNxd3lII
	FBZq0jYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmymX-00000000enL-0wu0;
	Tue, 25 Feb 2025 17:31:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyTu-00000000YkC-0OX0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:12:32 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PFJbae032256;
	Tue, 25 Feb 2025 18:12:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	b7ilTU0nfN/VhX4AMlIMGSs7WY/ZNM9E5SfWaQXtVJA=; b=Nrq3B2BxNYdXhmuF
	+jmL73KaSfStcX8QKPExFFoP7RqoSXYGRppAkI6ARlaK53KL1dyVyO4IMN3JVCnu
	tGYXS6HfgioN2NTwRJczUCCAzE/57xH5+kkV2Cxd+AHYpSo3/5Rp4fedb48NofFU
	yRjXtSt7zrXgOVoz1WW7amsqH28Yp3rUjJrK+GLhi7HIdO+d3IRP3u2GRmnhln0m
	wPzqD2UC/k8vmQbeA/rNHAVlwELmzgPuiainGS0hQhjKPcssCNvWe615sk4+RGOy
	/wQR2a7PFRz4SNwGT2jVCzJbDqAn0mnb30eauFGVK8qKkbI8fMakiei+0nXKNr1q
	eIqVKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4ukf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 18:12:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69B38400E3;
	Tue, 25 Feb 2025 18:11:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72F044DBF82;
	Tue, 25 Feb 2025 16:51:36 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 16:51:35 +0100
Message-ID: <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
Date: Tue, 25 Feb 2025 16:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
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
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
 <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_091230_430720_7748EB2C 
X-CRM114-Status: GOOD (  14.18  )
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

On 2/25/25 14:04, Krzysztof Kozlowski wrote:
> On 25/02/2025 09:48, Clément Le Goffic wrote:
>> +
>> +maintainers:
>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>> +
>> +description: |
> 
> 
> Do not need '|' unless you need to preserve formatting.

Ok

>> +  STMicroelectronics's STM32 MPUs integrate a Hardware Debug Port (HDP).
>> +  It allows to output internal signals on SoC's GPIO.
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp-hdp
> 
> There is a mess in STM SoCs. Sometimes you call SoC stm32, sometimes
> stm32mp and sometimes stm32mpXX.
> 
> Define for all your STM contributions what is the actual SoC. This
> feedback was already given to ST.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    $ref: pinmux-node.yaml#
>> +
>> +    properties:
>> +      function:
>> +        enum: [ "0", "1", "2", "3", "4", "5", "6", "7",
>> +                "8", "9", "10", "11", "12", "13", "14",
>> +                "15" ]
> 
> Function which has a number is not really useful. What does it even express?

As said in my previous answer, function names are very different from 
one platform to another. Numbers were used as string to be generic.
I'll consider it in a V2.

> 
>> +
>> +      pins:
>> +        enum: [ hdp0, hdp1, hdp2, hdp3, hdp4, hdp5, hdp6, hdp7 ]
>> +
>> +    required:
>> +      - function
>> +      - pins
>> +
>> +    additionalProperties: false
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +    #include <dt-bindings/pinctrl/stm32mp15-hdp.h>
>> +    //Example 1
> 
> Drop

Ok

> 
> Best regards,
> Krzysztof


