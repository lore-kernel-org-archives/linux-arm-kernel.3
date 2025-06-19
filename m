Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D343C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JTcC8uoCOSM0+5JiXWDBYfybPyfdDoEoObObpyrYRk=; b=oDUHCBFOvBmxADVzJh9TVdzzZ3
	ARDPyn5sVQFmU7uBfW9GOO+x7Fhni5qjR9ivE9FTQYwh+SGDCPburl3p0XEfaiuseiKf8q7zmQ9tq
	tKAc1JUdV0Az7LVTJhc3RKwdBRMgDbIV9eqdnNsTp9WowfpwCY/5Puc2yYpYdha+12d/VmGF1z0sH
	L7KzHAlfh58ol1bah4Kmb1h98FadfMm125zbufMg7uF3uOUCZjZPbGKwsTuJO0FmXme9IHR2usPp9
	DdJpRqUVAkXZisFhSJJVHpe8dS6HPcb/p/Xiq8n2ve4xH9zMAK4p34Sz/W9V3lBNQBd2elqovyNVS
	1JJbWs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBMy-0000000CaWn-1Nec;
	Thu, 19 Jun 2025 09:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiK-0000000CRLi-1y0e
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 08:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2JTcC8uoCOSM0+5JiXWDBYfybPyfdDoEoObObpyrYRk=; b=oXUkL1/IrTv+vunWL6eazO2pUJ
	ld6/XZcGy+U5neiNIIogNiM88V3qjn5GH9v3smG372RUnqsf1N3UEQES0gn6U9ut9Vw6IXtIwmJIA
	SFMRV+sWnbkUhJWkw89rQhY+9CTf2UIRKwKCUzlfu1hsyMrYKkwi/kERE1tNpfX6xg/eJmMqMCO9G
	Gl9V/U+GaQOLUIYmlrBRT0d08wH5LN875g0EWoFBK9JG7oK1rBKwARVa6tkJlRV0eAwiKFIRkLsVm
	vhAoCQItUHU6HJjRZSk9HNB9cbCUrf3KkCZp23ZShlncFthFbUHg7xgBXoT48sLnXVPfNcmIhU5gZ
	9twgnlAQ==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAiH-00000004Nov-2mQB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:33:39 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55J8XMQR532765;
	Thu, 19 Jun 2025 03:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750322002;
	bh=2JTcC8uoCOSM0+5JiXWDBYfybPyfdDoEoObObpyrYRk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Pb8k3kX/r1jnFe/WEbbreOL/yDgBTgd73YVFDTq4jom9bvHeiqyV2xiyuY/kzAGKF
	 vrlEsjMc8DjztNfoMraHrUAWcUlXHw/IbFBERcJ4SiJ8LebEwy7lw0IMGcr2rSmUsE
	 ktuVEgZPBmP1Vvk34+fQFkwbLnI2gHF7upicEKUU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55J8XMPc3732274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 03:33:22 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 03:33:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 03:33:21 -0500
Received: from [172.24.227.4] (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55J8XHnY822301;
	Thu, 19 Jun 2025 03:33:18 -0500
Message-ID: <5c56f6d6-fc3e-40a1-b501-7f1054e6e408@ti.com>
Date: Thu, 19 Jun 2025 14:03:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
To: Vignesh Raghavendra <vigneshr@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <danishanwar@ti.com>, Hrushikesh Salunke <h-salunke@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
 <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
 <b24a97fc-8dac-443b-aec7-317b9e393f2d@ti.com>
 <f6a57a82-c534-4439-a337-8592c2e121c5@ti.com>
 <28c88a78-fe34-4595-b260-c6cc40897bc1@ti.com>
Content-Language: en-US
From: Hrushikesh Salunke <h-salunke@ti.com>
In-Reply-To: <28c88a78-fe34-4595-b260-c6cc40897bc1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_093338_039186_D873FFCC 
X-CRM114-Status: GOOD (  15.07  )
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



On 19/06/25 13:25, Vignesh Raghavendra wrote:
> 
> 
> On 12/06/25 15:46, Hrushikesh Salunke wrote:
>>
>>
>> On 11/06/25 14:17, Hrushikesh Salunke wrote:
>>>
>>>
>>> On 11/06/25 14:14, Vignesh Raghavendra wrote:
>>>>
>>>>
>>>> On 10/06/25 11:19, Hrushikesh Salunke wrote:
>>>>> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
>>>>> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
>>>>> functional at all stages of PCIe boot process. Thus add the
>>>>> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
>>>>>
>>>>> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
>>>>> ---
>>>>> This patch is based on commit
>>>>> 475c850a7fdd Add linux-next specific files for 20250606
>>>>>
>>>>> Changes since v1
>>>>> As per feedback from Nishanth, changed the position of "bootph-all"
>>>>> tag, according to ordering rules for device tree properties.
>>>>>
>>>>> v1 : https://lore.kernel.org/
>>>>> all/20250609115930.w2s6jzg7xii55dlu@speckled/
>>>>>
>>>>>    arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/
>>>>> arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>>>> index 432751774853..a7e8d4ea98ac 100644
>>>>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>>>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
>>>>> @@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
>>>>>            max-functions = /bits/ 8 <1>;
>>>>>            phys = <&serdes0_pcie_link>;
>>>>>            phy-names = "pcie-phy";
>>>>> +        bootph-all;
>>>>>            ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
>>>>>        };
>>>>>    };
>>>>
>>>> Are the patches for PCIe boot support merged to U-Boot or such other
>>>> bootloader repo?
>>>> No, they are not in the U-Boot yet. I will be posting patches for PCIe
>>> boot support for U-Boot this week.
>>>
>>
>> I have posted Patch series for the PCIe boot support in Uboot.
> 
> 
> Great, but dont you need bootph-all in dependent nodes as well such as
> serdes0_pcie_link pcie0_ctrl? how does this work otherwise?
> 

When booting through PCIe, ROM configures SERDES for PCIe. So we don't
need to reconfigure it again in subsequent bootstages, we can keep
using the same configuration. As for PCIe endpoint controller, BAR
registers and Address Translation registers needs to be re-configured
at each bootstage, as bootloaders at different stage are stored at
different memory location.


>>
>> 1.https://patchwork.ozlabs.org/project/uboot/
>> patch/20250612084910.3457060-1-h-salunke@ti.com/
>> 2. https://patchwork.ozlabs.org/project/uboot/
>> cover/20250612085023.3457117-1-h-salunke@ti.com/
>> 3. https://patchwork.ozlabs.org/project/uboot/
>> cover/20250612085534.3457522-1-h-salunke@ti.com/
>>
>>
>> Regards,
>> Hrushikesh.
> 

