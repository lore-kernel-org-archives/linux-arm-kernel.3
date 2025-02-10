Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB96C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjxGcZGgbTw2rXhcQe0xTXiOGkjk4V+jo19rYFPocYg=; b=xVQakYZy0u1ScvIM6iEVdW1J8+
	WAGAJa7/RFXEMvbc6ulN7PGWxnQsQizMwrxx98/wLDx4O7KBggoB0Ogw6A/V58QdEwsbVxCOYHipZ
	S0ajEkRtXoMvFOaaI7JfyEzVZvku2NGTRdU4Ij7PIG6ypLNhP0N+nNzK43NbByEn2KqCPL5NQ1emW
	lm6Oy/lIkC/C8D0SrrlQyNNfr+5p1MN3PGc8QpO9DJF3jCP/3Ee7p5r/Tn6umgKSlrK2/fI1/hSOw
	Tf7LivCnGurSw+SCdtFaI9ZLkEFMlaXUKEeU8jXRMQgOlyp9wrGNEwXvCklWocoLDoCzG1c/CxVE7
	RcPyjTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZZ4-000000017pt-18Dx;
	Mon, 10 Feb 2025 19:35:30 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZLN-000000014QU-1FJa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:21:22 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AJLHLM3555492
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 10 Feb 2025 13:21:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739215277;
	bh=BjxGcZGgbTw2rXhcQe0xTXiOGkjk4V+jo19rYFPocYg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fK/bOSqdgtbZ3xpHBZ7QtmC4Hozhkq35qg2Ge8lNqu8OcCdOVEIiB6JRHWyNrlp6c
	 XJ9fxLsNC064KGyobSOJX9gzZ3x0qdB8EPXSrOOdABQzptWNmzlocVmHWom26jRpT5
	 P33d1fkR4CCOp2hYFCNZLD8GIMbC5MjSnrjd/yHM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AJLHVk024020;
	Mon, 10 Feb 2025 13:21:17 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 13:21:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 13:21:16 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AJLGCu057473;
	Mon, 10 Feb 2025 13:21:17 -0600
Message-ID: <205926b9-6698-4e57-bf96-a7c75e474652@ti.com>
Date: Mon, 10 Feb 2025 13:21:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250206235200.3128163-1-jm@ti.com>
 <20250206235200.3128163-7-jm@ti.com>
 <32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_112121_430232_9BE7BD72 
X-CRM114-Status: GOOD (  23.20  )
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

On 2/7/25 10:58 AM, Andrew Davis wrote:
> On 2/6/25 5:51 PM, Judith Mendez wrote:
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
>> Changes since v3:
>> - Add SRAM child node for am62p MCU R5 core 0
>> ---
>>   .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     | 13 +++++
>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 50 ++++++++++++++++---
>>   2 files changed, 57 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi 
>> b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
>> index b33aff0d65c9d..0be3463bc21c5 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
>> @@ -6,6 +6,18 @@
>>    */
>>   &cbass_mcu {
>> +    mcu_ram: sram@79100000 {
>> +        compatible = "mmio-sram";
>> +        reg = <0x00 0x79100000 0x00 0x80000>;
>> +        ranges = <0x00 0x00 0x79100000 0x80000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        mcu_sram1@0 {
> 
> What does this node do for us? Seems you reserve the whole SRAM
> area from the start, but shouldn't the phandle in mcu_r5fss0_core0
> point to this node? Or better it would use the normal SRAM API
> to request an allocation from this region.
> 
> Since this is still not resolved, and you don't mention it in
> the commit message, might be good to drop this SRAM part of this
> patch and deal with this in a later series.


Ok, since we do not have a better way to do this for now, will drop the
SRAM node.

Will respin the series one more time. Anyways I forgot to include
another patch so will add that for v5.

Thanks,
Judith



> 
> Andrew
> 
>> +            reg = <0x0 0x80000>;
>> +        };
>> +    };
>> +
>>       mcu_pmx0: pinctrl@4084000 {
>>           compatible = "pinctrl-single";
>>           reg = <0x00 0x04084000 0x00 0x88>;
>> @@ -213,6 +225,7 @@ mcu_r5fss0_core0: r5f@79000000 {
>>               ti,atcm-enable = <0>;
>>               ti,btcm-enable = <1>;
>>               ti,loczrama = <0>;
>> +            sram = <&mcu_ram>;
>>           };
>>       };
>>   };
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


