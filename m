Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1C9C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJy4u2cOTJUFfRT/p8pwkIm5hoX5bxeCYsLaFA2bBsA=; b=BQNLtAHSp3yF1mGfoIu9F82gfR
	Zr+Npi1+udjFI2tISQSb6EA0sp3hsvJ+/L8rwV+dv0OTtj0GFLAVSVjz61Hwv9XM62ObghZuM+Isq
	bAKwJIUYpXxN8AHGGiRz8AcMItq4waOpuXoYAeoO9JdW4YsEdjAy17V8G9wn7bhP0L6XzL25iQgid
	IL4c1jL3O7ZahUriYPO39Beu8U+Rlo1aKc/jP7j4YDf/BSVWt5490DFZ6MCEU4eBbbkVjYNPfchhx
	TEHwuH8ZrK1yfnmPKlQ1galZ3B2zbel8tSEryWatIZWGASCW7gy9JEO/MFU+LPwQHO871fhJa0SIR
	ppqXOMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaJb-00000004NqZ-3ktP;
	Tue, 15 Jul 2025 07:43:03 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaH3-00000004NRv-2b9t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 07:40:27 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6lxuk020561;
	Tue, 15 Jul 2025 09:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	lJy4u2cOTJUFfRT/p8pwkIm5hoX5bxeCYsLaFA2bBsA=; b=7kAjTzeNW9FJV216
	7OqeUNQPrLxCdIZ323fzJsJWpFke4072y6L1dk8QqL8V2Vpsfpf+JCVXMRI3MH4C
	6lW9tUL2O+o+cMjwG2y4ygq793VuqJmdt37dIYs7qmpdWYRpMYE9nWvGWeAmRRrz
	k7jZqRHdNfrNjKvZNqcPab9+hytQGubWNxDd7ZD9sxUxQKmwAPBy6EtbATRkVD1p
	0EI7lnohov4idm03jKs7x0XVdjMQPwxzVE+PDjvGFOYYhvx9ECCObsYgZ60kRap5
	oYEt9+iKARslZ1D2NdCMcaKTcpKdPsChEKJL4huaDlxZpwvRDzEVrPBtxfyX55oi
	9KotqQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47uf22kuc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 09:40:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D20F40045;
	Tue, 15 Jul 2025 09:38:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AF65B5857F;
	Tue, 15 Jul 2025 09:37:23 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 09:37:22 +0200
Message-ID: <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
Date: Tue, 15 Jul 2025 09:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
To: Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250715031717.GA4144523-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_004026_426685_FCC31B9B 
X-CRM114-Status: GOOD (  16.75  )
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

Hello Rob,

On 7/15/25 05:17, Rob Herring wrote:
> On Fri, Jul 11, 2025 at 04:48:54PM +0200, Clément Le Goffic wrote:
>> RCC is able to check the availability of a clock.
>> Allow to query the RCC with a firewall ID.
> 
> If it is tied to a clock, do we need another provider? We have the
> "protected clocks" thing, but that might be a bit different.
> 

I couldn't find any reference to "protected-clocks" outside of qcom
related code, is there a documentation? (Couldn't find it in
clocks.yaml).

The RCC is firewall-aware and has it's own firewall configuration at
RCC level for some system resources. When checking access to a clock,
or a reset, we're reading RCC registers, hence declaring it as an
access-controller.

A RCC resource's firewall configuration usually covers more than a
clock.

>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>> index 88e52f10d1ec..4d471e3d89bc 100644
>> --- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>> @@ -31,6 +31,11 @@ properties:
>>     '#reset-cells':
>>       const: 1
>>   
>> +  '#access-controller-cells':
>> +    const: 1
>> +    description:
>> +      Contains the firewall ID associated to the peripheral.
>> +
>>     clocks:
>>       items:
>>         - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
>> @@ -123,6 +128,7 @@ required:
>>     - reg
>>     - '#clock-cells'
>>     - '#reset-cells'
>> +  - '#access-controller-cells'
>>     - clocks
>>   
>>   additionalProperties: false
>> @@ -136,6 +142,7 @@ examples:
>>           reg = <0x44200000 0x10000>;
>>           #clock-cells = <1>;
>>           #reset-cells = <1>;
>> +        #access-controller-cells = <1>;
>>           clocks =  <&scmi_clk CK_SCMI_HSE>,
>>                     <&scmi_clk CK_SCMI_HSI>,
>>                     <&scmi_clk CK_SCMI_MSI>,
>>
>> -- 
>> 2.43.0
>>

Best regards,
Gatien

