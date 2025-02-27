Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B946DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqtULTJ3Y4hCI2h9nDLIXnOxlASzWujyEiERiEscbIw=; b=WEDHrOUluSzioaUd0izxQYc7EY
	VWoussTgrrslq6sSsls98gMSgP38YhDmAklbNXkwEB/7Cw4YrZ0am9zIjjnCPWnUbXAkCS5iBG7mk
	GFR19/IaKehSGf9Emf/sopznv0chxxQHSvPNPJLVvZWvFT2Uz7vPse/TOhQmBeyatGZxPPvrgqA08
	6AXscJLxrGCaSffMl7ELhdrAuwGUh5XCJTY8byO59fyPeiI4doqMjSAeWD2bartx7ricvyapqHoKU
	DIIabpqzD2uKWn2xMwpOTH1PdHNNVoF2G1Q99WlT1mj12Ctwo3dkTefluZ3lw1QnIimUxHSvz0Zn4
	8QBh6VZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnczQ-00000007Mqz-1fAx;
	Thu, 27 Feb 2025 12:27:44 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnceT-00000007Hzz-27KJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:06:07 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51RC60uN2376020
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 27 Feb 2025 06:06:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740657960;
	bh=DqtULTJ3Y4hCI2h9nDLIXnOxlASzWujyEiERiEscbIw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iMZgK+qesglf/3URui1x5tDDxi2ftEc3Iw0NzwpOw1zz69RMcuobhuCpBPtjCIU+8
	 Bw/IkjEl65nmU19todzqPy+RBWETWMKg4q5iNWX5Y5TwsYdPAUj4yQhpo8rBuWipir
	 n4qDTv0mZI6nGSTaipvbl8bCzkdVKjVhDFh3PBxs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51RC60Ai091670;
	Thu, 27 Feb 2025 06:06:00 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 06:06:00 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 06:06:00 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51RC5uUr082332;
	Thu, 27 Feb 2025 06:05:56 -0600
Message-ID: <64fa3794-e36b-2f77-ff8e-3c2ede3c3927@ti.com>
Date: Thu, 27 Feb 2025 17:35:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 06/10] arm64: dts: ti: k3-am62p5-sk: Enable IPC with
 remote processors
To: Judith Mendez <jm@ti.com>, Andrew Davis <afd@ti.com>,
        Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Soumya <s-tripathy@ti.com>,
        "'Krishnamoorthy, Venkatesan'"
	<v-krishnamoorthy@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Bajjuri,
 Praneeth" <praneeth@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
 <20250210221530.1234009-7-jm@ti.com>
 <04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com>
 <787f9d24-25bc-4171-bd8a-88fe9cef694d@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <787f9d24-25bc-4171-bd8a-88fe9cef694d@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040605_645742_09FA68F1 
X-CRM114-Status: GOOD (  22.41  )
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

Thanks for the patch.

On 18/02/25 23:21, Judith Mendez wrote:
> Hi Andrew,
> 
> 
> On 2/18/25 10:38 AM, Andrew Davis wrote:
>> On 2/10/25 4:15 PM, Judith Mendez wrote:
>>> From: Devarsh Thakkar <devarsht@ti.com>
>>>
>>> For each remote proc, reserve memory for IPC and bind the mailbox
>>> assignments. Two memory regions are reserved for each remote processor.
>>> The first region of 1MB of memory is used for Vring shared buffers
>>> and the second region is used as external memory to the remote processor
>>> for the resource table and for tracebuffer allocations.
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>> Changes since v4:
>>> - Drop SRAM node for am62px MCU R5fSS0 core0
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 50 ++++++++++++++++++++++---
>>>   1 file changed, 44 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>>> b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>>> index ad71d2f27f538..9609727d042d3 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>>> @@ -48,6 +48,30 @@ reserved-memory {
>>>           #size-cells = <2>;
>>>           ranges;
>>> +        mcu_r5fss0_core0_dma_memory_region:
>>> mcu-r5fss-dma-memory-region@9b800000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9b800000 0x00 0x100000>;
>>> +            no-map;
>>> +        };
>>> +

I believe you are testing these carveouts against the default firmwares
shipped with AM62P SDK (compiled from meta-arago), With the same firmwares,
each remote core also does inter-processor communication with each other
(RTOS<->RTOS) on bootup, so you need to reserve the regions for the same too
as done here [1].

>>> +        mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9b900000 0x00 0xf00000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9c800000 0x00 0x100000>;
>>> +            no-map;
>>> +        };
>>> +
>>> +        wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
>>> +            compatible = "shared-dma-pool";
>>> +            reg = <0x00 0x9c900000 0x00 0x1e00000>;
>>
>> 0x1e00000?
>>
>> Yes I know you didn't add this and are just coping it from below, but it
>> is still an issue. I see the same problem for the next patch, the R5F memory
>> size is 0xc00000??
>>
>> Every remote core gets 15MB (0xf00000), this has been true for all K3, and
>> all cores, DSP, R5F, M4, etc.. You even do it correct for the MCU R5F above,
>> but the WKUP R5F on AM62P and AM62 are just randomly given 30M and 12MB?
> 
> Not sure why FW requires 30MB here, I have reached out to FW team to
> investigate this, will respond back here soon.
> 

You will need an alignment with the firmware team to make sure that it doesn't
break with the default firmwares shipped with the AM62Px SDK. Also just FYI,
this will leave a gap of 14 MiB between the wakeup R5 and the next component
i.e. ATF, ideally we should have avoided this gap but seems like ATF nodes are
already upstream [2], so probably can't do much, nevertheless I hope that 14
MiB will be claimed/used by Linux in some manner.

Soumya,
Please provide an ACK for this, if the DM R5 firmware is exceeding 15 MiB,
then you will need to update your linker scripts and regenerate the ipc echo
test firmwares to make sure the wakeup R5 code/data does not exceed to what is
being proposed here (15 MiB).

[1]:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts?h=11.00.05#n72

[2]:
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts?h=next-20250227#n51

Regards
Devarsh

