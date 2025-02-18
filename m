Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB13BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3jGz9dTOI3zjTp+FWv3GOetS4aavIzrIh1eri2pQa4=; b=jI/NXm3G7ZWvJZLAjXE7hiRQmI
	yhQFCS2ZVYadRYyhsVavrKJgzLP8x+YbtfYPumaAm1k1pYCYM8XNS1Z/0oC+0u2zkBhpTRp0voiOc
	B4gaL6XEWEK62ihuOlG0L/2yv7ZqTKjg6SX5bQMT2AyFemFislms1l7LHo0pQQ7fcOuXdvfK2K3KD
	KQWyLMtKcRvr5npr5dDShV97N7p8C35LSXHwb+8RwFPtMhRxZIDN66NjsDZPr4quXkHKX7CYi60+e
	6zgYmysOc6yb2CmonvvmKp9VFFZAT0yuhXdGDyeNTcamGE/3IsOQ8i5RpklWeuTDmzz3w4tysIsSe
	8I1EVh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRmf-00000009F3H-2Hah;
	Tue, 18 Feb 2025 17:53:25 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRlB-00000009EwH-3FBH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 17:51:55 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IHpmv0051957
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 11:51:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739901109;
	bh=F3jGz9dTOI3zjTp+FWv3GOetS4aavIzrIh1eri2pQa4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cx1GEg9MnkBeyrIVntzsS73hLqty3ydz9iZdHuzoq16cpWcIuxF8aPcM4UFgYSsFJ
	 dGjDgynGhNwMyHfsQwB4IdLQ6FlkiRx3Mz8FLeZXPNtA+5tnbAS9j0Wsao5X+1IaqK
	 23RV3ohSPkY6EJ4yx5PrG9dFcSrI3LlYi3R44C9E=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IHpmsY105306
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 11:51:48 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 11:51:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 11:51:48 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IHpmBe092458;
	Tue, 18 Feb 2025 11:51:48 -0600
Message-ID: <787f9d24-25bc-4171-bd8a-88fe9cef694d@ti.com>
Date: Tue, 18 Feb 2025 11:51:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
 <20250210221530.1234009-7-jm@ti.com>
 <04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_095153_944450_11E68EAD 
X-CRM114-Status: GOOD (  22.44  )
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

Hi Andrew,


On 2/18/25 10:38 AM, Andrew Davis wrote:
> On 2/10/25 4:15 PM, Judith Mendez wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> For each remote proc, reserve memory for IPC and bind the mailbox
>> assignments. Two memory regions are reserved for each remote processor.
>> The first region of 1MB of memory is used for Vring shared buffers
>> and the second region is used as external memory to the remote processor
>> for the resource table and for tracebuffer allocations.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changes since v4:
>> - Drop SRAM node for am62px MCU R5fSS0 core0
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 50 ++++++++++++++++++++++---
>>   1 file changed, 44 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts 
>> b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> index ad71d2f27f538..9609727d042d3 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> @@ -48,6 +48,30 @@ reserved-memory {
>>           #size-cells = <2>;
>>           ranges;
>> +        mcu_r5fss0_core0_dma_memory_region: 
>> mcu-r5fss-dma-memory-region@9b800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        mcu_r5fss0_core0_memory_region: 
>> mcu-r5fss-memory-region@9b900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>> +            no-map;
>> +        };
>> +
>> +        wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>> +            compatible = "shared-dma-pool";
>> +            reg = <0x00 0x9c900000 0x00 0x1e00000>;
> 
> 0x1e00000?
> 
> Yes I know you didn't add this and are just coping it from below, but it
> is still an issue. I see the same problem for the next patch, the R5F 
> memory
> size is 0xc00000??
> 
> Every remote core gets 15MB (0xf00000), this has been true for all K3, and
> all cores, DSP, R5F, M4, etc.. You even do it correct for the MCU R5F 
> above,
> but the WKUP R5F on AM62P and AM62 are just randomly given 30M and 12MB?

Not sure why FW requires 30MB here, I have reached out to FW team to
investigate this, will respond back here soon.

~ Judith

> 
> Andrew
> 
>> +            no-map;
>> +        };
>> +
>>           secure_tfa_ddr: tfa@9e780000 {
>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>               no-map;
>> @@ -57,12 +81,6 @@ secure_ddr: optee@9e800000 {
>>               reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
>>               no-map;
>>           };
>> -
>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>> -            compatible = "shared-dma-pool";
>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>> -            no-map;
>> -        };
>>       };
>>       vmain_pd: regulator-0 {
>> @@ -638,6 +656,26 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>       };
>>   };
>> +&wkup_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&wkup_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>> +            <&wkup_r5fss0_core0_memory_region>;
>> +};
>> +
>> +&mcu_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>> +&mcu_r5fss0_core0 {
>> +    mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>> +            <&mcu_r5fss0_core0_memory_region>;
>> +};
>> +
>>   &main_uart0 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_uart0_pins_default>;


