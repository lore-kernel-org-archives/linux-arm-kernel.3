Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 04:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql1eWTW4uBCU2FKgu49U0o8nShopMqxONOi70oLH7rs=; b=lzud8uO3O48D0zdK6hOlQx8ukd
	RQDgSu/6gK/Wm9qb5bkOfzfiKaBnvA8Ik9B9WRrx7DQbfoI1YwjOd6oax3Xs1cuBCaD00pGxMPdoU
	Dx0BnD1tUKXzGIcqSpPC5DF+l2x9tk37QB3D96qWCkL5cRGPyE1TUofReRx/exYip5fprIPBlixRa
	hwlb/PvDv/DmDyFuagQ5JqPPWc0AZnHP6LKTdxZ1GJPYM8YzSpi+nN8X32E7WfawqYvsLNYwXOGf4
	Gnvs/59APZ7aLgCmoBjSQLIcBCvZYwWq1r12ihT84gZDcb40uJc14f3wHGnAbI3YY9uR6FOP5LPUf
	rxWDxs8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u36A3-0000000CU8A-43mQ;
	Fri, 11 Apr 2025 04:38:39 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u368F-0000000CTyy-1DNF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 04:36:48 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B4afq81968862
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 23:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744346202;
	bh=Ql1eWTW4uBCU2FKgu49U0o8nShopMqxONOi70oLH7rs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=xlD9JGhPOh/F+TZYDqT83i3lT/uW+I74u+p/6J0hi6VLYQIXDstY3Qn4kl+l2qTC3
	 kaBjyQZ5NErPgvVSHsRsR8lzkQr3iuCQSieQCPRCnrH0nXP7/cWFk2XoG3icdeGBBg
	 RYrI1y31x5v1Ts9EReuuiPGLiVXyqcDTIbA1unDI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B4afXr084447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 23:36:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 23:36:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 23:36:41 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B4aaOK100453;
	Thu, 10 Apr 2025 23:36:37 -0500
Message-ID: <911949c6-b025-4546-9296-681c82e6a84a@ti.com>
Date: Fri, 11 Apr 2025 10:06:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>,
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
 <fe735242-4643-432a-adaf-27e29719948a@ti.com>
 <bffd8489-1556-425d-b3f9-8fde8a7d34a7@ti.com>
 <45e2c2bf-68af-4c78-8f85-e25f4e7ea3fd@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <45e2c2bf-68af-4c78-8f85-e25f4e7ea3fd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_213647_463678_BC8E01EE 
X-CRM114-Status: GOOD (  34.23  )
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

Hi Judith,

On 10/04/25 23:14, Judith Mendez wrote:
> Hi Beleswar,
>
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
>>
>
> Since we do not have an IOMMU for remote cores in K3, we cannot get rid
> of the static reserved memory carveouts, is my understanding. The linux
> driver would have programmed the IOMMU virtual and physical addresses
> and it would have been able to do the virtual to physical address
> translation on its own with only the requirement size from the FW
> resource table. 


We can still do that for K3 remote cores with just requesting carveout size.
The remoteproc core framework will assign the dynamically allocated
Physical Address (PA) as Device Address (DA) for the rproc[0]. Incase the PA
collides with some existing DA for the rproc, we can configure the rproc's
RAT (Region Address Translation Unit) to map the PA to some other DA from
rproc's view. As Andrew pointed, we can use FW_RSC_ADDR_ANY for all of
these carveouts.

Thanks,
Beleswar

[0]: 
https://github.com/torvalds/linux/blob/master/drivers/remoteproc/remoteproc_core.c#L768

> Since we do not have this flexibility provided with
> IOMMU, we must have static reserved carveouts so that Linux will not
> touch these memory regions. The firmware virtual address to physical
> adress is atm a one to one mapping. So in summary, we must have these
> static reserved memory carveouts, but we should fix the default FW
> to use the "standardized" sizes and request SRAM via resource table.
>
> ~ Judith
>
>
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
>

