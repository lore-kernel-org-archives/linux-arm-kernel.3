Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86182C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nySQPps4T2a0FRio8EjYlEXOxTgZnY6kE2ly05mdvsU=; b=ROXxOtQ38NAR0CpZenDiWiWsuc
	+UDDyNqRRasleP4ckJQ+9Z/8ubAnNWx61lZQ2kOjyeXanoSK/6lXR9NQlDIn5jRASd9j9pM8f39Un
	PBRWWPl1xGhV6C+fZNp57oNDoSJQnRr0Gm/KtvML1aDB3+gzlRpEd/yvL7eyZnddVsbiJqWdARTW1
	B4j8y9SMEPRGQFJwuV9I+97tRRvOts3rWgWXg2iXImcPSVVIAWkNdH4wcbLAjyj/mGSbK6Hy6dBo7
	6g9XREzkcRGwTMpaa5p1umzUuDg0NWIXVxQbvo5JIVwfXy0D8m7ooJjcKBzYuCORKxZ0t7T80J/1V
	VRwIasSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oLn-00000000wuM-1hxE;
	Mon, 07 Apr 2025 15:25:27 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ncg-00000000lhA-0TTd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 14:38:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537EcjNv385036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 09:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744036725;
	bh=nySQPps4T2a0FRio8EjYlEXOxTgZnY6kE2ly05mdvsU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vyVRcrtD3xjOIAXPPd1J9sovyIHHufJymNRSCBZUw0E/1fmoZQkym040c60IfRVGX
	 xA2MKUwcN2xWAJ/WXQkHjFlfdk1bClxvWTHnc1JNGVs+2CPRYQXfQXWKN7d2SKcVHl
	 ZKs5QnMngiP2eUaLAVFZz4q8ZfJfqAYspm9Zcnr0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537EcjIH065068
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 09:38:45 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 09:38:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 09:38:44 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Eciuh037344;
	Mon, 7 Apr 2025 09:38:44 -0500
Message-ID: <dab7c2ae-2ce9-4fdc-933c-35a4fd92a8e5@ti.com>
Date: Mon, 7 Apr 2025 09:38:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] arm64: dts: ti: k3-am64: Reserve timers used by
 MCU FW
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Padhi <b-padhi@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>
References: <20250405001518.1315273-1-jm@ti.com>
 <20250405001518.1315273-12-jm@ti.com>
 <956c0598-9934-4295-87af-ef86f4eabd94@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <956c0598-9934-4295-87af-ef86f4eabd94@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_073850_282209_72BB5E31 
X-CRM114-Status: GOOD (  14.75  )
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

On 4/7/25 7:35 AM, Andrew Davis wrote:
> On 4/4/25 7:15 PM, Judith Mendez wrote:
>> From: Hari Nagalla <hnagalla@ti.com>
>>
>> AM64x device has 4 R5F cores in the main domain. TI MCU firmware uses
>> main domain timers as tick timers in these firmwares. Hence keep them
>> as reserved in the Linux device tree.
>>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am642-evm.dts | 17 +++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 17 +++++++++++++++++
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts 
>> b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> index f8ec40523254b..68bd6b806f8f0 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
>> @@ -796,6 +796,23 @@ &mcu_m4fss {
>>       status = "okay";
>>   };
>> +/* main_timers 8-11 are used by TI MCU FW */
> 
> Can you make this comment per-core and explain which core
> each timer is reserved for? Makes it easier on me in Zephyr
> to point out why we use the timers that we do, something
> like:
> 
> /* main_timer8 is reserved for mcu_r5fss0_core0 */

Sure, I can do that. Will wait for [0] conversation to close and then
respin the series with this change

[0] 
https://lore.kernel.org/linux-devicetree/f42607f5-e39d-48a1-89c0-11d4982a2426@ti.com/

~ Judith

> 
> Andrew
> 
>> +&main_timer8 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer9 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer10 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer11 {
>> +    status = "reserved";
>> +};
>> +
>>   &serdes_ln_ctrl {
>>       idle-states = <AM64_SERDES0_LANE0_PCIE0>;
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts 
>> b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> index 33e421ec18abb..07fbdf2400d23 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> @@ -710,6 +710,23 @@ &mcu_m4fss {
>>       status = "okay";
>>   };
>> +/* main_timers 8-11 are used by TI MCU FW */
>> +&main_timer8 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer9 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer10 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_timer11 {
>> +    status = "reserved";
>> +};
>> +
>>   &ecap0 {
>>       status = "okay";
>>       /* PWM is available on Pin 1 of header J3 */


