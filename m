Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0148CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEuN3cjM/BEkZI5UyL8A+WNuDqsqCfNuIENBSMw2Vh4=; b=lB4JdYPdCFaQ1nn8ATW5IcnH/w
	G743rHA5VbQCGVlXqLFL95/+kRGyiUyVbtT7De6GBGRtfLdQYxOmRpco7G795KaJKePIkIOWU1zlS
	UVBsd/a6FrFoQypO9yUlHbeoYNpruWiaezY9zlG4O8mTWV/NJb8Z7mXABXePsFIeeBfI0o4RTN+X2
	U+Kn0pFn5MJ0R0dOd7/5Zwx6HtkN2otqYwXVk6AHGErrzGm38vU1olYAvhkkyViP+UEaWPh/cb6zt
	mM4XwtTZdLF20ellU/EiQ6fUDrqXRNObys13OHHJ/a8RZIFfz8jByFZ1HC3gDQDreb0H1hl3tK9Yh
	hX0SiF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsHF-00000004wJY-0p2i;
	Tue, 09 Sep 2025 06:56:29 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvoHs-00000003lr8-3dL2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 02:40:54 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5892eoSU189023;
	Mon, 8 Sep 2025 21:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757385650;
	bh=oEuN3cjM/BEkZI5UyL8A+WNuDqsqCfNuIENBSMw2Vh4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yS3MXcXI4ouRo+FFvCPNxlLPTdJoyH/ekj8RpIj8XKbxdMJ6oIkKxeWhoHftm56kp
	 2u1qAK4pZ3nOZOBu8CN1ADhVeLm5kU+rqd32K2q2CP9jDoIuTPMeu47IYIBTZuGXns
	 x4NYcC1IQkfo/8nnHBaWlprvQzVtvFYCWIRmstx8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5892eojt3450612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 21:40:50 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 21:40:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 21:40:49 -0500
Received: from [10.24.68.177] (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.177])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5892eicK1581243;
	Mon, 8 Sep 2025 21:40:45 -0500
Message-ID: <836f7b6a-87ba-435a-9c5b-5be1f05114e8@ti.com>
Date: Tue, 9 Sep 2025 08:10:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: ti: k3-pinctrl: Fix the bug in
 existing macros
To: Vignesh Raghavendra <vigneshr@ti.com>, <praneeth@ti.com>, <nm@ti.com>,
        <afd@ti.com>, <d-gole@ti.com>, <u-kumar1@ti.com>,
        <sebin.francis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <vishalm@ti.com>
References: <20250904112538.529857-1-a-kaur@ti.com>
 <20250904112538.529857-5-a-kaur@ti.com>
 <63c958a2-3973-4171-8a74-80381218723b@ti.com>
Content-Language: en-US
From: Akashdeep Kaur <a-kaur@ti.com>
In-Reply-To: <63c958a2-3973-4171-8a74-80381218723b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_194052_996116_C9EBE3A6 
X-CRM114-Status: GOOD (  11.15  )
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

On 08/09/25 12:26, Vignesh Raghavendra wrote:
> 
> 
> On 04/09/25 16:55, Akashdeep Kaur wrote:
>> Currently, DS_IO_OVERRIDE_EN_SHIFT macro is not defined anywhere but
>> used for defining other macro.
>> Replace this undefined macro with valid macro. Rename the existing macro
>> to reflect the actual behavior.
>>
>> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
>> ---
> 
> Fixes: 325aa0f6b36e ("arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros")

Updated. Thanks!
> 
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> 
> 
>>   arch/arm64/boot/dts/ti/k3-pinctrl.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> index 7c5b5783769c..36bb403d718e 100644
>> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
>> @@ -88,8 +88,8 @@
>>   
>>   #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
>>   #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
>> -#define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
>> -#define PIN_DS_IO_OVERRIDE_ENABLE	(1 << DS_IO_OVERRIDE_EN_SHIFT)
>> +#define PIN_DS_ISO_OVERRIDE_DISABLE     (0 << ISO_OVERRIDE_EN_SHIFT)
>> +#define PIN_DS_ISO_OVERRIDE_ENABLE      (1 << ISO_OVERRIDE_EN_SHIFT)
>>   #define PIN_DS_OUT_ENABLE		(0 << DS_OUT_DIS_SHIFT)
>>   #define PIN_DS_OUT_DISABLE		(1 << DS_OUT_DIS_SHIFT)
>>   #define PIN_DS_OUT_VALUE_ZERO		(0 << DS_OUT_VAL_SHIFT)
> 


