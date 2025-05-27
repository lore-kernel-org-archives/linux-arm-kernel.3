Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F080C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RneKTUgHV8QMOt165N0ghvpuDHAQ12Fmh+L+mVFhiE=; b=LYz0dp2Dv+L4mpeOPgLSG2Q6kU
	afvEdqv/fg4V5UfTDnaTb3IriBvM6RkkhR1GLq9kSmXY8jIi6oSthar3Y/quybylDovVTKCZhmOoc
	vhf3Vet3mOxIqIaRFgv1NjpMgK5cNXr8lI02DZDLo9JDHDq9gr96smCZ8mbUzcdc8n5V5gVLrW/rl
	7vSomPKO0dfVQrC247aL/jhbRTIgBs407KkymglbQNjkUFXpISD6yW5QRtg2LGN/3OILq6SX6hyq2
	IbBnoXRaOUp2uocfJVl+BUhcMhmYGkP0apLQSzsebB20Wy/rmHUsXwIYtBY0ffLjlwHvnbR4JshqV
	pc/T/kxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuxo-0000000Atku-0GTS;
	Tue, 27 May 2025 14:07:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuvd-0000000AtaX-0FEU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:05:18 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCJftD010084;
	Tue, 27 May 2025 16:05:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	9RneKTUgHV8QMOt165N0ghvpuDHAQ12Fmh+L+mVFhiE=; b=MowcQnY11g1gANZG
	Kz6qQJlw2baLFjg1snTrCdCc8Av4npmRHmQS6lrBFxwEfU1Uo4DX/YPNFgWLxju7
	RG2sNCENxmvcPNGTdi84JR89FIplB5z7e/i4nle2zKzJkUvfx2Wl12tIZpCVuSII
	/wImUKQXv/uk8MhegSTR0/Vr2CBIJSZcGRMAaXEEmsOXslof5Ev2HtaB+u1sLkCz
	lL/Pu3qAT/bmHTD5LyzKYsCoPS63XmM27j8ucHyGK6KNSzygt14pkRjTIA/DH0n0
	O9NhYY/exwuLIu6gg4/Jer/qTrkIO9qirvlwn0JpB+Elr0qjFoHh+ZTs79eI+0Tf
	61qcWA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u388v8cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 16:05:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 002E040046;
	Tue, 27 May 2025 16:04:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4EF27AFB4E3;
	Tue, 27 May 2025 16:03:25 +0200 (CEST)
Received: from [10.48.86.139] (10.48.86.139) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 16:03:24 +0200
Message-ID: <61011ea7-6cad-463e-9666-706fe56d98ce@foss.st.com>
Date: Tue, 27 May 2025 16:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: stm32: fullfill diversity with OPP for
 STM32M15x SOCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250527-stm32mp157f-dk2-v1-0-8aef885a4928@foss.st.com>
 <20250527-stm32mp157f-dk2-v1-1-8aef885a4928@foss.st.com>
 <eec2a1db-717e-46f2-a988-6beefab7b699@kernel.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <eec2a1db-717e-46f2-a988-6beefab7b699@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.139]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_070517_560381_0E0E437C 
X-CRM114-Status: GOOD (  21.02  )
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



On 5/27/25 15:12, Krzysztof Kozlowski wrote:
> On 27/05/2025 15:03, Amelie Delaunay wrote:
>> From: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
>> This commit creates new files to manage security features and supported OPP
>> on STM32MP15x SOCs. On STM32MP15xY, "Y" gives information:
>>   -Y = A means no cryp IP and no secure boot + A7-CPU@650MHz.
>>   -Y = C means cryp IP + optee + secure boot + A7-CPU@650MHz.
>>   -Y = D means no cryp IP and no secure boot + A7-CPU@800MHz.
>>   -Y = F means cryp IP + optee + secure boot + A7-CPU@800MHz.
>>
>> It fullfills the initial STM32MP15x SoC diversity introduced by
>> commit 0eda69b6c5f9 ("ARM: dts: stm32: Manage security diversity
>> for STM32M15x SOCs").
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp15xa.dtsi |  5 +++++
>>   arch/arm/boot/dts/st/stm32mp15xc.dtsi |  4 +++-
>>   arch/arm/boot/dts/st/stm32mp15xd.dtsi |  5 +++++
>>   arch/arm/boot/dts/st/stm32mp15xf.dtsi | 20 ++++++++++++++++++++
>>   4 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp15xa.dtsi b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/st/stm32mp15xa.dtsi
>> @@ -0,0 +1,5 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>> +/*
>> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
>> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
> 
> You create entirely empty, unused file. There is literally no benefit of
> this file, no impact, just more files to handle.
> 

Indeed, this one is not useful and will be dropped in v2, as it won't be 
populated with cpufreq/thermal updates due to fixed cpu clock frequency.

>> + */
>> diff --git a/arch/arm/boot/dts/st/stm32mp15xc.dtsi b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
>> index 97465717f932fc223647af76e88a6182cf3c870f..4d30a2a537f15c1e145635b090de0f0222526579 100644
>> --- a/arch/arm/boot/dts/st/stm32mp15xc.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp15xc.dtsi
>> @@ -1,9 +1,11 @@
>> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> 
> License change is not explained in commit msg and anyway should be
> separate commit with acks/sobs from all copyright holders. You also need
> to CC them (Cc e.g. Gatien).
> 

License change is not needed, good to know how it should have been done. 
Since stm32mp15xa.dtsi will be dropped in v2, this file won't be updated 
and the license won't change.

>>   /*
>>    * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
>>    * Author: Alexandre Torgue <alexandre.torgue@st.com> for STMicroelectronics.
>>    */
>>   
>> +#include "stm32mp15xa.dtsi"
>> +
>>   &etzpc {
>>   	cryp1: cryp@54001000 {
>>   		compatible = "st,stm32mp1-cryp";
>> diff --git a/arch/arm/boot/dts/st/stm32mp15xd.dtsi b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..cb55f5966f74011d12d7a5c6ad047569d25d4e98
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/st/stm32mp15xd.dtsi
>> @@ -0,0 +1,5 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>> +/*
>> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
>> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>> + */
> 
> Same problems.
> 

This file won't be empty, it will be populated with cpufreq/thermal 
updates because STM32MP15xD and STM32MP15xF have dynamic CPU frequency 
scaling.

>> diff --git a/arch/arm/boot/dts/st/stm32mp15xf.dtsi b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5f6a2952125d00d468e2e4012024f02380cfaa49
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/st/stm32mp15xf.dtsi
>> @@ -0,0 +1,20 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
>> +/*
>> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
>> + * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
>> + */
>> +
>> +#include "stm32mp15xd.dtsi"
>> +
>> +/ {
>> +	soc {
>> +		cryp1: cryp@54001000 {
>> +			compatible = "st,stm32mp1-cryp";
>> +			reg = <0x54001000 0x400>;
>> +			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&rcc CRYP1>;
>> +			resets = <&rcc CRYP1_R>;
>> +			status = "disabled";
>> +		};
>> +	};
>> +};
>>
> 
> 
> Best regards,
> Krzysztof

Regards,
Amelie

