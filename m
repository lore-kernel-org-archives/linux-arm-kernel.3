Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88373C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6soQxOpyQs5pInSURD+TjSc3ZmoT7ru1MQgRkMPBEI=; b=2yw/2j9+jigIwkpyxgmcwbt8dW
	t9dGCVlPC2MG9ZMTFD+S9i20R3td7M8Mmh28nRpvcOXAxcWxFR0SRSGK9YvmuFmS3yHe+Ge8Gx7c1
	H4t6WGdFnQlQFjfs+UJzfJUKlvqggModF3nZsleQcx9/Qo3BBxhVtVt/jIn0MpC/oHKQQQbxDw5Gu
	ijWejv/aF2li3drMF+S5vZlCf6S4t/qiyWJXaN1eBT8aJEnd05dv8JiN3EH5f0nm/x/JlHFQUH8PR
	HcGozSVRG/FMg74djXePOmLUupbwJLMQKBc9Eve6NlS+A9ja3tRvXQf8Oz9ETJekRG5MDFvfVM+am
	Jtvx6LKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevBD-0000000FJth-0roL;
	Mon, 03 Feb 2025 12:03:55 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tev9s-0000000FJgS-0B2C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:02:33 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513B5nWI004481;
	Mon, 3 Feb 2025 13:02:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	a6soQxOpyQs5pInSURD+TjSc3ZmoT7ru1MQgRkMPBEI=; b=znPV7j1kbdActcJs
	KEFAFpz1ApcBZQurPiDkKwDdPb69EIZGpjpm5OkucXm7HsRN45bcbSHanZX3THGW
	5EBu6jy1YIh+V8UV7dTSQ0FbfcnL+6IVTnL1B/zKKaZtjGFKPLJGV7yH1W8a+n0y
	X3em/DGmxm8d+aJJUNRCdMPzL2e3P47E3E9I3HUGV3KgM2Lq/yn183QXPGItT4Fi
	BtWnmr0fMvqze0typTryKFe7jNzSKVt+cbm88373Rzu9pIhpQa7VziHn5lQzRLBv
	PnikWmuPdaLKr+TJyDoyEgiaYwokm41sztdUM5/nL/AdDp84Y3kKuO5KZPqFt46u
	DmIUzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44jujv8hx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 13:02:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AC7B94004F;
	Mon,  3 Feb 2025 13:01:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17C42264534;
	Mon,  3 Feb 2025 13:00:15 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 13:00:14 +0100
Message-ID: <8f28bbc1-1ada-41b2-bff2-5ad549c934a5@foss.st.com>
Date: Mon, 3 Feb 2025 13:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stm32-next v3 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
To: Marc Kleine-Budde <mkl@pengutronix.de>,
        "Rob Herring (Arm)"
	<robh@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        <linux-kernel@vger.kernel.org>, <kernel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
 <173764775141.3793586.6690578690442295161.robh@kernel.org>
 <20250123-urban-belligerent-bullfinch-2fa9e6-mkl@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250123-urban-belligerent-bullfinch-2fa9e6-mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_040232_628763_C10D1CB3 
X-CRM114-Status: GOOD (  15.97  )
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

Hi

On 1/23/25 17:05, Marc Kleine-Budde wrote:
> On 23.01.2025 09:57:47, Rob Herring (Arm) wrote:
>>
>> On Tue, 21 Jan 2025 12:14:04 +0100, Marc Kleine-Budde wrote:
>>> Hello,
>>>
>>> this series adds support for the Linux Automation GmbH FairyTux2
>>> boards generation 1 and 2.
>>>
>>> The FairyTux2 is a small Linux device based on an Octavo Systems
>>> OSD32MP153c SiP, that occupies just two slots on a DIN rail.
>>>
>>> regards,
>>> Marc
>>>
>>> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
>>> ---
>>> Changes in v3:
>>> - 2/2: fix use generic node names for external GPIO and USB Type-C controller (thanks Krzysztof)
>>> - 2/2: LEDs: replace label by color and function property (thanks Krzysztof)
>>> - 2/2: gen2: sort nodes of i2c1 by address (thanks Krzysztof)
>>> - Link to v2: https://patch.msgid.link/20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de
>>>
>>> Changes in v2:
>>> - 1/2: Added Krzysztof's Acked-by
>>> - 2/2: fix alignment for gpio-line-names (thanks Krzysztof)
>>> - 2/2: only use color:function for LED labels (thanks Krzysztof)
>>> - 2/2: use generic node names for external GPIO and USB Type-C controller
>>> - Link to v1: https://patch.msgid.link/20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de
>>>
>>> ---
>>> Leonard Göhrs (2):
>>>        dt-bindings: arm: stm32: add compatible strings for Linux Automation GmbH LXA FairyTux 2
>>>        ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTux 2
>>>
>>>   .../devicetree/bindings/arm/stm32/stm32.yaml       |   2 +
>>>   arch/arm/boot/dts/st/Makefile                      |   2 +
>>>   .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 103 ++++++
>>>   .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 147 ++++++++
>>>   .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 397 +++++++++++++++++++++
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
> 
> This patch doesn't touch the offending file "ste-hrefv60plus-tvk.dtb".
> Might be a new warning, but not due to this patch, could this be a false
> positive?

Can you reproduce ? On my side I can't. As you said the reported error 
has no link with your patch. I'll merge it.

regards
ALex



>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>>
>>    pip3 install dtschema --upgrade
>>
>>
>> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de:
>>
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@a03fe000: compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
>> 	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml#
> 
> regards,
> Marc
> 

