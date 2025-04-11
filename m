Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989A6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 04:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XC15NhKFd0PY+4Z1N+K5fXmaFufMv7nE++wOrKWixg=; b=KiKHLRnUgEh0u1foJnbJza5a6v
	Rg9QNtwWjI11ZsIHai+m4xhqQGz4xt3gYBIOKuXk8soAUQ76ho/UePZpJCR35KaYN80xY5cw2m909
	OqDf4SHOCtQJxtyrWA1qzZgcdaN7CFVAEKm2HK8jOfEZdXRRhZFi1gkEGUKs31DLOAauzISg5W42G
	O9YKXphGs0+Hx1PsD5quXwKALMT3Kb8H2ezF6J3t8s/cnhrvDPab0PliQfuZT3uemxNlTu+Jmxo8y
	78V/ToyCIpSfwe29aHR97tePrthb3Y3O76M0P2unZhabB/I2Cf5227n3tVfRj0wQsGOf1XBr3o7jU
	R+/MjPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u35mV-0000000CSIK-1GRr;
	Fri, 11 Apr 2025 04:14:19 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u35kg-0000000CSAD-0q0Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 04:12:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B4CE3b1473638
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 23:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744344734;
	bh=8XC15NhKFd0PY+4Z1N+K5fXmaFufMv7nE++wOrKWixg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FW62hLXSq91mU6OGMd3X4DNS6b8tOBLV2Ej0PjEUI4JNcmnPg7v7oMT9LIW3VGzlp
	 BlysRAJWkSR33YVTOfv6PAsCDBUIm9cEE31V2YoC0YH3Dv0cSh6L9/zfX6XQI+HpLK
	 xOiLCKjwbYokjiHWtqj1gU2V75jZ5dUhKVZf0Wpk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B4CES5068987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 23:12:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 23:12:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 23:12:13 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B4C9am074277;
	Thu, 10 Apr 2025 23:12:10 -0500
Message-ID: <7629a496-4495-4333-9a90-829e53e9ea84@ti.com>
Date: Fri, 11 Apr 2025 09:42:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>,
        Devarsh Thakkar
	<devarsht@lewv0571a.ent.ti.com>,
        Nishanth Menon <nm@ti.com>, Hari Nagalla
	<hnagalla@ti.com>
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
 <fe735242-4643-432a-adaf-27e29719948a@ti.com>
 <bffd8489-1556-425d-b3f9-8fde8a7d34a7@ti.com>
 <b97c1eaa-f34c-4731-8e9e-b51faa4619c4@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <b97c1eaa-f34c-4731-8e9e-b51faa4619c4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_211226_337740_25CF85A1 
X-CRM114-Status: GOOD (  40.13  )
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

On 10/04/25 23:20, Andrew Davis wrote:
> On 4/10/25 3:55 AM, Beleswar Prasad Padhi wrote:
>> Hi Judith,
>>
>> On 10/04/25 04:02, Judith Mendez wrote:
>>> Hi Beleswar,
>>>
>>> On 4/7/25 11:00 PM, Beleswar Prasad Padhi wrote:
>>>> Hi Judith, Andrew,
>>>>
>>>> On 07/04/25 19:43, Judith Mendez wrote:
>>>>> Hi Devarsh,
>>>>>
>>>>> On 4/7/25 8:54 AM, Devarsh Thakkar wrote:
>>>>>> Hi Judith,
>>>>>>
>>>>>> On 05/04/25 05:45, Judith Mendez wrote:
>>>>>>  > From: Devarsh Thakkar <devarsht@ti.com>
>>>>>>>
>>>>>>
>>>>>> Thanks for the patch.
>>>>>>
>>>>>>> For each remote proc, reserve memory for IPC and bind the mailbox
>>>>>>> assignments. Two memory regions are reserved for each remote 
>>>>>>> processor.
>>>>>>> The first region of 1MB of memory is used for Vring shared buffers
>>>>>>> and the second region is used as external memory to the remote 
>>>>>>> processor
>>>>>>> for the resource table and for tracebuffer allocations.
>>>>>>>
>>>>>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>>>>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>>>> ---
>>>>>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 
>>>>>>> +++++++++++++++++++++++--
>>>>>>>   1 file changed, 90 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts 
>>>>>>> b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>>>> index 1c9d95696c839..7d817b447c1d0 100644
>>>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>>>>>> @@ -52,6 +52,42 @@ linux,cma {
>>>>>>>               linux,cma-default;
>>>>>>>           };
>>>>>>> +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
>>>>>>> +            compatible = "shared-dma-pool";
>>>>>>> +            reg = <0x00 0x99800000 0x00 0x100000>;
>>>>>>> +            no-map;
>>>>>>> +        };
>>>>>>> +
>>>>>>> +        c7x_0_memory_region: c7x-memory@99900000 {
>>>>>>> +            compatible = "shared-dma-pool";
>>>>>>> +            reg = <0x00 0x99900000 0x00 0xf00000>;
>>>>>>> +            no-map;
>>>>>>> +        };
>>>>>>> +
>>>>>>> +        mcu_r5fss0_core0_dma_memory_region: 
>>>>>>> r5f-dma-memory@9b800000 {
>>>>>>> +            compatible = "shared-dma-pool";
>>>>>>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>>>>>>> +            no-map;
>>>>>>> +        };
>>>>>>> +
>>>>>>> +        mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
>>>>>>> +            compatible = "shared-dma-pool";
>>>>>>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>>>>>>> +            no-map;
>>>>>>> +        };
>>>>>>> +
>>>>>>> +        wkup_r5fss0_core0_dma_memory_region: 
>>>>>>> r5f-dma-memory@9c800000 {
>>>>>>> +            compatible = "shared-dma-pool";
>>>>>>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>>>>>>> +            no-map;
>>>>>>> +        };
>>>>>>> +
>>>>>>> +        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>>>>> +            compatible = "shared-dma-pool";
>>>>>>> +            reg = <0x00 0x9c900000 0x00 0xf00000>;
>>>>>>> +            no-map;
>>>>>>> +        };
>>>>>>> +
>>>>>>>           secure_tfa_ddr: tfa@9e780000 {
>>>>>>>               reg = <0x00 0x9e780000 0x00 0x80000>;
>>>>>>>               alignment = <0x1000>;
>>>>>>> @@ -63,12 +99,6 @@ secure_ddr: optee@9e800000 {
>>>>>>>               alignment = <0x1000>;
>>>>>>>               no-map;
>>>>>>>           };
>>>>>>> -
>>>>>>> -        wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
>>>>>>> -            compatible = "shared-dma-pool";
>>>>>>> -            reg = <0x00 0x9c900000 0x00 0x01e00000>;
>>>>>>> -            no-map;
>>>>>>> -        };
>>>>>>>       };
>>>>>>
>>>>>> This is missing the edgeAI specific remote-core carveouts and 
>>>>>> RTOS-to-RTOS IPC memory regions [1] being used by edgeAI 
>>>>>> firmwares which come as pre-packaged in the official SDK release 
>>>>>> for AM62A.
>>>>>>
>>>>>> There is only one official SDK release for AM62A (which is edgeAI 
>>>>>> based) [2] which packages these edgeAI remoteproc firmwares and 
>>>>>> in my view it is a fair expectation that remote core careveouts 
>>>>>> in device-tree should align with firmwares released in SDK.
>>>>>>
>>>>>> This is because most developers (including me) and vendors 
>>>>>> download this official SDK release and use it with latest 
>>>>>> upstream kernel and modules (right now we are applying required 
>>>>>> patches locally) and this patch won't suffice for this, in-fact 
>>>>>> it won't work since the remoteproc firmwares are already using 
>>>>>> regions beyond the reserved-regions from this patch.
>>>>>
>>>>> I understand your point, currently with this patch remoteproc loading
>>>>> will not work for some cores. However, the goal here is to 
>>>>> standardize
>>>>> as much as possible the memory carveout sizes, push the "demo 
>>>>> firmware"
>>>>> to request resources the correct way from resource table, 
>>>>
>>>>
>>>> It is indeed more suitable if the memory carveouts are called out 
>>>> in the resource table of the firmware. But you will still need to 
>>>> reserve that memory sections in the Device Tree so that Kernel does 
>>>> not map that memory for anything else. So I am thinking how moving 
>>>> to resource table will help solve this problem?
>>>
>>> The point is that our default FW is doing things incorrectly. We 
>>> want to
>>> push the existing FW to
>>> 1. Request resources via resource table.
>>> 2. Fix their memory requirements (recent offline discussion proved that
>>> FW is requesting more than it needs)
>>> 3. FW should adapt to Linux not Linux adapt to FW
>>
>>
>> Thanks. I also agree with you on all of the above points for a 
>> standard firmware.
>>
>> However, I was referring to this problem:
>> Can we get rid of static reserved memory carveouts in DT?
>> People using a custom firmware will have to patch the Device Tree to 
>> reserve larger/different memory regions. Is there some way where the 
>> firmware can dictate the "reserved" memory carveouts at runtime? 
>> Memory carveouts can be announced through Resource Table, but there 
>> is no guarantee we will be able to allocate it (it could be mapped by 
>> the Kernel for some other alloc), unless its pre-reserved in DT.
>
> That's the neat thing about the RSC_CARVEOUT item in the resource table,
> it works both ways. The firmware can request a static address, or it can
> use FW_RSC_ADDR_ANY for the address and Linux will go and dynamically
> allocate it a region. Then it passes this info back to the firmware by
> updating the resource table in memory. Firmware can then simply read this
> carveout address from its resource table and start using it.


Ah yes, I forgot about that. We already use FW_RSC_ADDR_ANY for VRING
allocations. We can scale it to memory carveouts in the similar way. Thanks.

>
> The only time we need a static addresses would be for code sections as
> they are not relocatable (yet). And that is the reason we have the
> minimal carveouts we are adding in this patch. Code goes here. And
> these carveouts are 15MB! No firmware I know of has 15MB of *code*
> section.
>
> As we found in the offline discussion, even our largest firmware
> doesn't use near that much space. What that firmware is doing is picking
> some spots in DRAM for its heap and buffer areas, and without 
> coordinating
> with Linux, just starts using that memory. We have to then go into DT and
> carveout all these ranges to avoid stepping on the firmware heaps from
> Linux.


Yeah I have found this as well. All of those heap/buffer areas should be 
moved
to the resource table now.

>
> With these firmware heap/buffer memory static carveouts we have to 
> account
> for the worst case and statically carve out enough memory for the largest
> possible amount of memory a firmware could ever use. In some firmware
> we ship today this is +2GB! So why should every user of this board lose
> all this memory when they might happen to be using a more sane firmware
> that doesn't use so much (like my Zephyr firmware), or if their firmware
> doesn't need any heap at all (like some other firmware we have).


Agreed on your point.

Thanks,
Beleswar

>
> Andrew
>
>>
>> Thanks,
>> Beleswar
>>
>>>
>>> If not, then then we should try to move to Zephyr firmware or other/
>>> better options.
>>>
>>> Hope I am able to explain myself better this time around.
>>>
>>> ~ Judith
>>>
>>>>
>>>> Thanks,
>>>> Beleswar
>>>>
>>>>> and move away
>>>>> from this dependency and limitations that we have with our 
>>>>> firmware. We
>>>>> should soon be able to generate our own firmware using Zephyr, which
>>>>> Andrew is pioneering, so with this firmware we should move to the
>>>>> correct direction upstream. Downstream we are still using the memory
>>>>> carveout sizes that the firmware folk want so desperately to keep, 
>>>>> for
>>>>> now..
>>>>>
>>>>> ~ Judith
>>>>>
>>>>>>
>>>>>> [1]: 
>>>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=ti-linux-6.6.y-cicd#n103
>>>>>> [2]: https://www.ti.com/tool/PROCESSOR-SDK-AM62A
>>>>>>
>>>>>> Regards
>>>>>> Devarsh
>>>>>>
>>>>>>>       opp-table {
>>>>>>> @@ -741,3 +771,57 @@ dpi1_out: endpoint {
>>>>>>>           };
>>>>>>>       };
>>>>>>>   };
>>>>>>> +
>>>>>>> +&mailbox0_cluster0 {
>>>>>>> +    status = "okay";
>>>>>>> +
>>>>>>> +    mbox_r5_0: mbox-r5-0 {
>>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>>> +    };
>>>>>>> +};
>>>>>>> +
>>>>>>> +&mailbox0_cluster1 {
>>>>>>> +    status = "okay";
>>>>>>> +
>>>>>>> +    mbox_c7x_0: mbox-c7x-0 {
>>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>>> +    };
>>>>>>> +};
>>>>>>> +
>>>>>>> +&mailbox0_cluster2 {
>>>>>>> +    status = "okay";
>>>>>>> +
>>>>>>> +    mbox_mcu_r5_0: mbox-mcu-r5-0 {
>>>>>>> +        ti,mbox-rx = <0 0 0>;
>>>>>>> +        ti,mbox-tx = <1 0 0>;
>>>>>>> +    };
>>>>>>> +};
>>>>>>> +
>>>>>>> +&wkup_r5fss0 {
>>>>>>> +    status = "okay";
>>>>>>> +};
>>>>>>> +
>>>>>>> +&wkup_r5fss0_core0 {
>>>>>>> +    mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
>>>>>>> +    memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
>>>>>>> + <&wkup_r5fss0_core0_memory_region>;
>>>>>>> +};
>>>>>>> +
>>>>>>> +&mcu_r5fss0 {
>>>>>>> +    status = "okay";
>>>>>>> +};
>>>>>>> +
>>>>>>> +&mcu_r5fss0_core0 {
>>>>>>> +    mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
>>>>>>> +    memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
>>>>>>> + <&mcu_r5fss0_core0_memory_region>;
>>>>>>> +};
>>>>>>> +
>>>>>>> +&c7x_0 {
>>>>>>> +    mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
>>>>>>> +    memory-region = <&c7x_0_dma_memory_region>,
>>>>>>> +            <&c7x_0_memory_region>;
>>>>>>> +    status = "okay";
>>>>>>> +};
>>>>>>
>>>>>
>>>

