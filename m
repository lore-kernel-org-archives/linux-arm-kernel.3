Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF14D5C0C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWj+Y3X9SnOAh3+a4cFNqzSCflZ6mMnuYM7SYahU/ww=; b=tCG6FByFWmtmgt
	6WkCIEe/7PE6f71GlkBV1JLVvLnM4VZetXK2S+mHCJ3CrPdD6UkcnApo41Qc1/pu2PVCBZ2KNXZV5
	4QFOaiKpV9LUjEmQdiUzKiVQmcEnoNhnjQJP9IjlitgoDW1N3UMFyi0PWGxug8tpkGwwlVRKAEvoZ
	/8LNsO0QtwMH/G86D9Z3smW5cIFSFbrdl0bUbryWSqIcRhS4FcwSxY0tcEwVsl/XX4NWJ+UzZsmiQ
	Gno4gBZDUHarM8UWhoG7c2kdz2StJlo6fDsi+kWFRSh8Pjg13KritDYVyCI1zCXSSV+yY5ZBK50WF
	FpAXF63KprH8EX32GHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9O5I-0000000AWLW-2lwU;
	Fri, 08 Nov 2024 12:27:28 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NyD-0000000AUkk-1LI4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 12:20:11 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A8CK2Ie104732;
	Fri, 8 Nov 2024 06:20:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731068402;
	bh=mWj+Y3X9SnOAh3+a4cFNqzSCflZ6mMnuYM7SYahU/ww=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XvbQOidz8W05245Nc/1tJp1BTZSSWiTlBEb8xL0wCDoFztBpO/7WaLxwuGGW7P6Ip
	 QkYrl38vXR+Pmi5Evt7lFNSmgKJAYtbFN0cmuLBcYbjO1V6yRWNAiBukaR6Dkqv8m4
	 XBnTa9h9qvrbL2IJK/cay5O92uAlfTSckv5nWEhw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8CK29n104549
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 06:20:02 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 06:20:01 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 06:20:01 -0600
Received: from [10.249.129.69] ([10.249.129.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8CJtUB123140;
	Fri, 8 Nov 2024 06:19:56 -0600
Message-ID: <2a3c54e8-46fc-48f9-8c01-f3bb0c4907af@ti.com>
Date: Fri, 8 Nov 2024 17:49:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: Krzysztof Kozlowski <krzk@kernel.org>,
        MD Danish Anwar
	<danishanwar@ti.com>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <ssantosh@kernel.org>,
        <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
References: <20241107104557.1442800-1-danishanwar@ti.com>
 <20241107104557.1442800-2-danishanwar@ti.com>
 <7f0a73c3-9977-4d07-b996-683ed18e4724@kernel.org>
 <8156fd61-c476-4b58-b3b2-e8bc4f93035e@ti.com>
 <2c368f5a-4b58-45de-8140-21b2f7af4d12@kernel.org>
 <4ba0381b-d30a-4469-a7c4-327f6ac20c9c@ti.com>
 <2e7a1eb6-df8f-44d4-9342-1bc6d8b5ad11@ti.com>
 <1fa4323b-4cee-4dfe-9c68-55f4465999cf@kernel.org>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <1fa4323b-4cee-4dfe-9c68-55f4465999cf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_042009_646583_A6CCE359 
X-CRM114-Status: GOOD (  34.77  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 11/7/2024 5:51 PM, Krzysztof Kozlowski wrote:
> On 07/11/2024 12:58, MD Danish Anwar wrote:
>>
>>
>> On 07/11/24 5:16 pm, MD Danish Anwar wrote:
>>>
>>>
>>> On 07/11/24 5:14 pm, Krzysztof Kozlowski wrote:
>>>> On 07/11/2024 12:36, MD Danish Anwar wrote:
>>>>>
>>>>>
>>>>> On 07/11/24 5:01 pm, Krzysztof Kozlowski wrote:
>>>>>> On 07/11/2024 11:45, MD Danish Anwar wrote:
>>>>>>> Add clocks, assigned-clocks and assigned-clock-parents for ICSSG
>>>>>>
>>>>>> Why? We see what you are doing from the diff, no point to repeat it. I
>>>>>> don't understand why you are doing it.
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>>>>>> ---
>>>>>>>  .../devicetree/bindings/soc/ti/ti,pruss.yaml          | 11 +++++++++++
>>>>>>>  1 file changed, 11 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>>> index 3cb1471cc6b6..cf4c5884d8be 100644
>>>>>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>>>>>> @@ -92,6 +92,17 @@ properties:
>>>>>>>      description: |
>>>>>>>        This property is as per sci-pm-domain.txt.
>>>>>>>  
>>>>>>> +  clocks:
>>>>>>> +    items:
>>>>>>> +      - description: ICSSG_CORE Clock
>>>>>>> +      - description: ICSSG_ICLK Clock
>>>>>>> +
>>>>>>> +  assigned-clocks:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  assigned-clock-parents:
>>>>>>> +    maxItems: 1
>>>>>>
>>>>>> Why? This is really not needed, so you need to explain why you are doing
>>>>>> things differently than entire Linux kernel / DT bindings.
>>>>>>
>>>>>
>>>>> I need to add this to the device tree node
>>>>>
>>>>> +		clocks = <&k3_clks 81 0>,  /* icssg0_core_clk */
>>>>> +			 <&k3_clks 81 20>; /* icssg0_iclk */
>>>>> +		assigned-clocks = <&k3_clks 81 0>;
>>>>> +		assigned-clock-parents = <&k3_clks 81 2>;
>>>>>
>>>>> But without the above change in the binding I am getting below errors
>>>>> while running dtbs check.
>>>>>
>>>>> /workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30000000:
>>>>> 'assigned-clock-parents', 'assigned-clocks' do not match any of the
>>>>> regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', '^pa-stats@[a-f0-9]+$',
>>>>> 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a-f0-9]+$',
>>>>> 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',
>>>>> 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
>>>>> +/workdir/arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: icssg@30080000:
>>>>> 'anyOf' conditional failed, one must be fixed:
>>>>>
>>>>> To fix this warning I added these in the binding and the warnings were
>>>>> fixed.
>>>>
>>>> nah, cannot reproduce. Just be sure you work on recent kernel (last time
>>>> you were sending it on some ancient stuff) and your packages are
>>>> updated, including dt schema and other kernel dependencies.
>>>>

The purpose of this series is to add 'assigned-clock-parents',
'assigned-clocks' to the DT node. Initially I was only trying to add
these two nodes to DT and at that time I got the above error. I also got
 the below error as well

/home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
icssg@30000000: 'anyOf' conditional failed, one must be fixed:
        'clocks' is a required property
        '#clock-cells' is a required property
        from schema $id: http://devicetree.org/schemas/clock/clock.yaml#


To fix this I added 'assigned-clock-parents', 'assigned-clocks' to the
binding and at this time I got only the below error,

/home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
icssg@30000000: 'anyOf' conditional failed, one must be fixed:
        'clocks' is a required property
        '#clock-cells' is a required property
        from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

So to fix this, I added clocks to the binding as well as DT and after
that all the errors got resolved and I posted the series.

>>>
>>> I have posted this series on the latest kernel. Base commit
>>> 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
>>>
>>> Let me check if the schema is up to date or not. I will re test and
>>> reply. Thanks for pointing it out.
>>>
>>
>> Krzysztof, I re-checked.
>> I am on the latest kernel (commit
>> 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb (tag: next-20241106,
>> origin/master, origin/HEAD)) and I am using the lastest dtschema v2024.9
>>
>> ❯ python3 -m pip list|grep 'dtschema'
>> dtschema                      2024.9
>>
>> Still I am getting the below dtbs check errors while running `make
>> CHECK_DTBS=y ti/k3-am642-evm.dtb` without the binding change.
>>
>> Let me know if I am missing something else.
>>
>> /home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
>> icssg@30000000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
> 
> Wait, what? That's different error. You have clocks documented. To
> remind: we talk about previous error so only, *only* assigned-clocks.
> 

I agree. This is a different error. I encountered this error when I
dropped the binding patch of this series and tested only the DT patch.

When you commented on Binding patch mentioning it's not needed, I
thought you were referring to the entire diff. So I dropped the patch
and tested the DT patch only. And at this time I got this error.

>> not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
>> '^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
>> 'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-9]+$',
>> 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$', 'mii-rt@[a-f0-9]+$',
>> 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
>> /home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
>> icssg@30000000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
>> not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
>> '^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
>> 'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-9]+$',
>> 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$', 'mii-rt@[a-f0-9]+$',
>> 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
>> /home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
>> icssg@30080000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
>> not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
>> '^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
>> 'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-9]+$',
>> 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$', 'mii-rt@[a-f0-9]+$',
>> 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/soc/ti/ti,pruss.yaml#
>> /home/danish/workspace/linux-next/arch/arm64/boot/dts/ti/k3-am642-evm.dtb:
>> icssg@30080000: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do
>> not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$',
>> '^pa-stats@[a-f0-9]+$', 'cfg@[a-f0-9]+$', 'iep@[a-f0-9]+$',
> 
> I don't understand these, either.  All of them have clocks. What are you
> testing? You add clocks to DTS but not to the binding? What would be the
> point of that test?
> 

I did some more testing. Turns out just adding clocks to dt binding is
enough. Clocks will need to be added to binding however
'assigned-clock-parents', 'assigned-clocks' are not needed in the binding.

I will drop the 'assigned-clock-parents', 'assigned-clocks' from
dt-binding and only keep below diff. Where as for DT patch (2/2) - I
will keep it as it is.

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 3cb1471cc6b6..12350409d154 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -92,6 +92,11 @@ properties:
     description: |
       This property is as per sci-pm-domain.txt.

+  clocks:
+    items:
+      - description: ICSSG_CORE Clock
+      - description: ICSSG_ICLK Clock
+
 patternProperties:

   memories@[a-f0-9]+$:

Let me know if this looks ok to you. Thanks for your feedback.

> Best regards,
> Krzysztof
> 

-- 
Thanks and Regards,
Md Danish Anwar

