Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34111C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2DUGq4PpnA0mRyUvzOtXn7CGfV1K5I0ALvoIWAGTP0=; b=iEUaQNdUqvnqBQTHWqag1cLQBT
	szTse1vgQ3N5+ljjR6JLij2Ay2bFHsYLAANpXsLJKjt7vD2LZBLbAA8EBj3XFgndfStXoSaBurLe0
	XyfYgaBe2KPdnRJj8JhPJhjt2YnPQ0cPBE+0ivqWgZOdPJqpINRxJ+VYLfjTfasl8Otti5PJb6xUv
	ojaNWip063OB/mYqfYIXVVavwQypWSYo5YQt03dVIH+b8szdkQhVPwYFp0/h9D7U2sI3EFmOFyn6u
	RF9++8bLeHToCiYYWoeFnc5rTH+vmqryeuK8zdIHpzeb0nhN9/kncZp1EJkMpNzoxSvg5smon3fgY
	WK1mk8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dzx-00000008hXT-0Eo4;
	Wed, 09 Apr 2025 22:34:21 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dy9-00000008hN5-2KWC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 22:32:31 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 539MWMnZ1602107
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 17:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744237943;
	bh=F2DUGq4PpnA0mRyUvzOtXn7CGfV1K5I0ALvoIWAGTP0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BHkvd6t4u0ETPPoqD59yPKVttkp1xjIwR36DmTsiR6+Pcvt5W1ITb6cbaDP0vqQf0
	 XmQ4s/9vtrT5foUApEyyObbMLGq49bn2PGUfRismcohq6IKzD5KrTagCVqGQzRF/D1
	 IHC7RSMTGK2s2sJ7t2WhbqELNFJVs78OzU5OdRIo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 539MWMUG006103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Apr 2025 17:32:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Apr 2025 17:32:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Apr 2025 17:32:22 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 539MWMgB116920;
	Wed, 9 Apr 2025 17:32:22 -0500
Message-ID: <fe735242-4643-432a-adaf-27e29719948a@ti.com>
Date: Wed, 9 Apr 2025 17:32:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Beleswar Prasad Padhi <b-padhi@ti.com>,
        Devarsh Thakkar
	<devarsht@lewv0571a.ent.ti.com>,
        Nishanth Menon <nm@ti.com>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-7-jm@ti.com>
 <6868f593-0728-4e92-a57b-87db6a0037f6@ti>
 <f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com>
 <f8f1d877-3d13-4ba7-90e1-455923458c11@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <f8f1d877-3d13-4ba7-90e1-455923458c11@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_153229_690075_6D4A6FD5 
X-CRM114-Status: GOOD (  26.73  )
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

Hi Beleswar,

On 4/7/25 11:00 PM, Beleswar Prasad Padhi wrote:
> Hi Judith, Andrew,
> 
> On 07/04/25 19:43, Judith Mendez wrote:
>> Hi Devarsh,
>>
>> On 4/7/25 8:54 AM, Devarsh Thakkar wrote:
>>> Hi Judith,
>>>
>>> On 05/04/25 05:45, Judith Mendez wrote:
>>>  > From: Devarsh Thakkar <devarsht@ti.com>
>>>>
>>>
>>> Thanks for the patch.
>>>
>>>> For each remote proc, reserve memory for IPC and bind the mailbox
>>>> assignments. Two memory regions are reserved for each remote processor.
>>>> The first region of 1MB of memory is used for Vring shared buffers
>>>> and the second region is used as external memory to the remote 
>>>> processor
>>>> for the resource table and for tracebuffer allocations.
>>>>
>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> ---
>>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 
>>>> +++++++++++++++++++++++--
>>>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts 
>>>> b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> index 1c9d95696c839..7d817b447c1d0 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>> @@ -52,6 +52,42 @@ linux,cma {
>>>>               linux,cma-default;
>>>>           };
>>>> +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        c7x_0_memory_region: c7x-memory@99900000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>> +            compatible = "shared-dma-pool";
>>>> +            reg = <0x00 0x9c900000 0x00 0xf00000>;
>>>> +            no-map;
>>>> +        };
>>>> +
>>>>           secure_tfa_ddr: tfa@9e780000 {
>>>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>>>               alignment = <0x1000>;
>>>> @@ -63,12 +99,6 @@ secure_ddr: optee@9e800000 {
>>>>               alignment = <0x1000>;
>>>>               no-map;
>>>>           };
>>>> -
>>>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>> -            compatible = "shared-dma-pool";
>>>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>>>> -            no-map;
>>>> -        };
>>>>       };
>>>
>>> This is missing the edgeAI specific remote-core carveouts and 
>>> RTOS-to-RTOS IPC memory regions [1] being used by edgeAI firmwares 
>>> which come as pre-packaged in the official SDK release for AM62A.
>>>
>>> There is only one official SDK release for AM62A (which is edgeAI 
>>> based) [2] which packages these edgeAI remoteproc firmwares and in my 
>>> view it is a fair expectation that remote core careveouts in 
>>> device-tree should align with firmwares released in SDK.
>>>
>>> This is because most developers (including me) and vendors download 
>>> this official SDK release and use it with latest upstream kernel and 
>>> modules (right now we are applying required patches locally) and this 
>>> patch won't suffice for this, in-fact it won't work since the 
>>> remoteproc firmwares are already using regions beyond the 
>>> reserved-regions from this patch.
>>
>> I understand your point, currently with this patch remoteproc loading
>> will not work for some cores. However, the goal here is to standardize
>> as much as possible the memory carveout sizes, push the "demo firmware"
>> to request resources the correct way from resource table, 
> 
> 
> It is indeed more suitable if the memory carveouts are called out in the 
> resource table of the firmware. But you will still need to reserve that 
> memory sections in the Device Tree so that Kernel does not map that 
> memory for anything else. So I am thinking how moving to resource table 
> will help solve this problem?

The point is that our default FW is doing things incorrectly. We want to
push the existing FW to
1. Request resources via resource table.
2. Fix their memory requirements (recent offline discussion proved that
FW is requesting more than it needs)
3. FW should adapt to Linux not Linux adapt to FW

If not, then then we should try to move to Zephyr firmware or other/
better options.

Hope I am able to explain myself better this time around.

~ Judith

> 
> Thanks,
> Beleswar
> 
>> and move away
>> from this dependency and limitations that we have with our firmware. We
>> should soon be able to generate our own firmware using Zephyr, which
>> Andrew is pioneering, so with this firmware we should move to the
>> correct direction upstream. Downstream we are still using the memory
>> carveout sizes that the firmware folk want so desperately to keep, for
>> now..
>>
>> ~ Judith
>>
>>>
>>> [1]: 
>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.6.y-cicd#n103
>>> [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
>>>
>>> Regards
>>> Devarsh
>>>
>>>>       opp-table {
>>>> @@ -741,3 +771,57 @@ dpi1_out: endpoint {
>>>>           };
>>>>       };
>>>>   };
>>>> +
>>>> +&mailbox0_cluster0 {
>>>> +    status = "okay";
>>>> +
>>>> +    mbox_r5_0: mbox-r5-0 {
>>>> +        ti,mbox-rx = <0 0 0>;
>>>> +        ti,mbox-tx = <1 0 0>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&mailbox0_cluster1 {
>>>> +    status = "okay";
>>>> +
>>>> +    mbox_c7x_0: mbox-c7x-0 {
>>>> +        ti,mbox-rx = <0 0 0>;
>>>> +        ti,mbox-tx = <1 0 0>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&mailbox0_cluster2 {
>>>> +    status = "okay";
>>>> +
>>>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>>> +        ti,mbox-rx = <0 0 0>;
>>>> +        ti,mbox-tx = <1 0 0>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&wkup_r5fss0 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&wkup_r5fss0_core0 {
>>>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>>>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>>>> +            <&wkup_r5fss0_core0_memory_region>;
>>>> +};
>>>> +
>>>> +&mcu_r5fss0 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&mcu_r5fss0_core0 {
>>>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>>>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>>>> +            <&mcu_r5fss0_core0_memory_region>;
>>>> +};
>>>> +
>>>> +&c7x_0 {
>>>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>>>> +    memory-region = <&c7x_0_dma_memory_region>,
>>>> +            <&c7x_0_memory_region>;
>>>> +    status = "okay";
>>>> +};
>>>
>>


