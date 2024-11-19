Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1A4D591CC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 06:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDdewSiWiOvlIgmH8VJPYwm2861hl32xSAybYxLGNBU=; b=TsX//10BTL43Xq
	0j9xALDtREaUOo9bwBqg0Hdp6uOhZIgwJkd5ElNZhMT4Jgy2zOZFlYtpWDynSmO3C1kuMiiCNY2uZ
	E/z9XwIIbTbOUhce+NIoxg4X1y5w3jBXTwTvgRKJ2bPAgX71B5w8aEBDUQhf4cLb+HZBNyPF+5VX6
	r4M5MGJB5vpNkW05WEeI3geZEMYO5r90iiKZOv0rOEwGECxA6oS2dGt4rckdop9OiunZjnEwZNsHD
	LMDEB0bk9LIYNGVAcpy8sBlDvdqcvVtK8WIA8eWBid37YsHm3eIAU8vETNc7jInm3QalXRZaXmnm3
	9GNn8/ypGIrRES6tCWbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHUg-0000000BVQl-0FJp;
	Tue, 19 Nov 2024 06:13:46 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHTj-0000000BVIT-3G6S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 06:12:49 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AJ6CYq3099191;
	Tue, 19 Nov 2024 00:12:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731996754;
	bh=lDdewSiWiOvlIgmH8VJPYwm2861hl32xSAybYxLGNBU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VETdE85ygXVLJILwxsd+hUBR6n0U4zvlSFT8qSpS91Y6cbyl6Pn51b8qjzHF/9BnT
	 jBcHvTZfdtBpasALEpEIbPhuxbrx8PLiFeMVzgVNimInaZq2ZL7fUnoC5y+fibUPlC
	 VuS79+GSbkkvhNRxbfJZCUP2wsJ0mHg8Ek9qoBUg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AJ6CYaM004366
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Nov 2024 00:12:34 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Nov 2024 00:12:34 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Nov 2024 00:12:34 -0600
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AJ6CUJd101713;
	Tue, 19 Nov 2024 00:12:31 -0600
Message-ID: <d738bb00-e295-4d74-8ba2-efd82b6df2ea@ti.com>
Date: Tue, 19 Nov 2024 11:42:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
To: Roger Quadros <rogerq@kernel.org>, MD Danish Anwar <danishanwar@ti.com>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-2-danishanwar@ti.com>
 <adcc5aa5-0f51-4c69-b684-a1e0844c5e3f@kernel.org>
 <6e11c85a-5883-4a28-b5bd-98da28f20425@kernel.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <6e11c85a-5883-4a28-b5bd-98da28f20425@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_221247_915067_B04BE236 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 18/11/24 19:22, Roger Quadros wrote:
> 
> 
> On 18/11/2024 15:33, Roger Quadros wrote:
>> Hi,
>>
>> On 13/11/2024 13:09, MD Danish Anwar wrote:
>>> The ICSSG module has 7 clocks for each instance.
>>>
>>> These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
>>> ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
>>> These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.
>>>
>>> Add these clocks to the dt binding of ICSSG.
>>>
>>> Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
>>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>>> ---
>>>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>> index 3cb1471cc6b6..927b3200e29e 100644
>>> --- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>>> @@ -92,6 +92,16 @@ properties:
>>>      description: |
>>>        This property is as per sci-pm-domain.txt.
>>>  
>>> +  clocks:
>>> +    items:
>>> +      - description: ICSSG_CORE Clock
>>> +      - description: ICSSG_IEP Clock
>>> +      - description: ICSSG_RGMII_MHZ_250 Clock
>>> +      - description: ICSSG_RGMII_MHZ_50 Clock
>>> +      - description: ICSSG_RGMII_MHZ_5 Clock
>>> +      - description: ICSSG_UART Clock
>>> +      - description: ICSSG_ICLK Clock
>>> +
>>
>> There are actually many more clocks [1]
>> What is the purpose of adding all these clocks in the DT if driver doesn't
>> use them?
>>

DT should completely describe the HW and not based on what Linux driver
needs. So its valid to describe all clock inputs to a module
irrespective of what driver does with it.

>> Only CORE and IEP clocks parent can be configured via clock muxes.
>> Those are already defined in the icssg?_cfg nodes.
> 
> Actually those clock muxes are internal to ICSSG.
> We still need to be able to set clock parents of CORE and IEP clock.
> 
> So pruss block needs at most 2 clocks like you had in v2 of this patch?
> 
>>
>> [1] - https://software-dl.ti.com/tisci/esd/22_01_02/5_soc_doc/am64x/clocks.html
>>
>>>  patternProperties:
>>>  
>>>    memories@[a-f0-9]+$:
>>
> 

-- 
Regards
Vignesh
https://ti.com/opensource


