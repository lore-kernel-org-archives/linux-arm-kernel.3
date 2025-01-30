Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E3CC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sqonxp9aXTn3c2hsrTLPYeaBVLsx7H/jkmUhYlzq4ac=; b=KtLcMRWp3p1WsaZgBp1Gm7qLk6
	27WmycuiozfH1ZuL5FCr5AnjCP1VnVVVF/EV0K5MBq6jNnNzrLe+Y3oHQa3UfckUzLUmd2xXEpIsC
	fQeejWDhARGQYDRrggi/cvJEdjncKheEekvVQ+QbwzcXSDYRwfuuST+s5PqOE7nwW52CqX70BrVuw
	6IAOvWzD44h0f+jacIUue1iMk39ReTUVUo1noD+ggXYQfr1Ptt6Au19soCzxTX7KvVSvO2UJBX0g/
	XPuNaRZ5SC4/oZQTTXVa31Yj6Z3BtAj7Pb6Y1G6bUQTpWQqz5BAPyzX4ijbRKdlkglMRtGQfljQs2
	EZhi5ppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRMk-00000008Z9c-1ivQ;
	Thu, 30 Jan 2025 10:01:42 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRKB-00000008YfA-2Z6Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 09:59:05 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9tuFE006037;
	Thu, 30 Jan 2025 10:58:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Sqonxp9aXTn3c2hsrTLPYeaBVLsx7H/jkmUhYlzq4ac=; b=iQmcYJuXQcC9F7mV
	72ZONSqhy/flHR0oif4Mkm/ITMki91Csklg3bGJNu/RI/iHHSvfc1dTrtfR/ksGm
	FjrQgTATxVd4KfiifJ3BTnds9W0Tyjs2CH5qNUPEqWAnQsdyMuyML+E1Toa0ai4w
	I3p0ioH/Bo3RSDYsxT+n02qUkQJBlSdEFUDEurnLplVmW4nwIRbYweq7GIx7YTz5
	mPew0rg7UZ1q2N9SsNEurvL/sV8jxd0p67ivOwrSaybYfXRuQZ42VtwQH9siMVcQ
	SC2ZhijLos4wQcn7Xq8eRON16pjxxJ5e0EOCNkrWIhCig45ZYXaUglhW7ZHYcIkD
	5Nt8Eg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44fy471jdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 10:58:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A74564002D;
	Thu, 30 Jan 2025 10:57:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F9F72EC5C3;
	Thu, 30 Jan 2025 10:48:08 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 10:48:07 +0100
Message-ID: <bbdf57b8-60e7-4f73-b597-edbbee641fcb@foss.st.com>
Date: Thu, 30 Jan 2025 10:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
 <20250129-annoying-flawless-porpoise-47daed@krzk-bin>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250129-annoying-flawless-porpoise-47daed@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_015904_115706_DA2711C1 
X-CRM114-Status: GOOD (  13.43  )
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



On 1/29/25 08:40, Krzysztof Kozlowski wrote:
> On Tue, Jan 28, 2025 at 06:02:27PM +0000, Conor Dooley wrote:
>>> +  st,syscfg-dlyb:
>>> +    description: phandle to syscon block
>>> +      Use to set the OSPI delay block within syscon to
>>> +      tune the phase of the RX sampling clock (or DQS) in order
>>> +      to sample the data in their valid window and to
>>> +      tune the phase of the TX launch clock in order to meet setup
>>> +      and hold constraints of TX signals versus the memory clock.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Why do you need a phandle here? I assume looking up by compatible ain't
>> possible because you have multiple controllers on the SoC? Also, I don't
>> think your copy-paste "phandle to" stuff here is accurate:
>>       st,syscfg-dlyb = <&syscfg 0x1000>;
>> There's an offset here that you don't mention in your description.
> 
> This needs double items: and listing them with description, instead of
> free form text.

ok, i will remove most of ths text description and update as following :

  st,syscfg-dlyb:
    description: configure OCTOSPI delay block.
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      - description: phandle to syscfg
      - description: register offset within syscfg

Thanks
Patrice
> 
> Best regards,
> Krzysztof
> 

