Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29E5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+3/1tyVa1Qn4CQ2/7kBF87oG9qDd6zKjpbib5cEEhE=; b=h3ow5MQgepRv4BBv8XzCLvrUwv
	2nQ54U0Mwt7/09mZEB/tq3/l2HSstgn3NQWelGgDZXpZ/b51EJsp3ZLFlPePk0+0BfbZ+zDMQOZut
	nSF9HjEfhIqIf1p1j98Nw+zBc7zQXJE339ENM+CpnY1RBYs/Wb0s0x5hlLpuzt2ZrXTDrLkab3zKA
	VYy/SrtzDO4OYZCAlEmjhMoOqdmAqj3EuJ1pM2+cgZAyGmC42GMUhiPFs8/vHLm0C9YcNHdrCm1zx
	jpzeFC9qXnhJmQBYr9MxnrqSY2/9dgEcCYjabX5V9ZHDPvUj7bhw9Ogibm51x7w1S7CPYPVq2yWKL
	qgkxikpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJFj-00000007Ld2-0byh;
	Tue, 18 Feb 2025 08:46:51 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJBJ-00000007KdO-30Ee
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:42:19 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I8ERDf013018;
	Tue, 18 Feb 2025 09:41:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	m+3/1tyVa1Qn4CQ2/7kBF87oG9qDd6zKjpbib5cEEhE=; b=Ibz22OBmZ62P3bGD
	d9E/xAJHN3cUuLw6amZCi2WWuYjp70NmQobfeWx0UUlMYN3KpuVUe6u1hoM0qaAE
	9SgLRIBxnVmEiUgdp6UrOsHvA052TQEQhIpkR0zY8M5GdkP8d9XsV+9eShy8yn1A
	bvBdCsUoezygapIyhY5BxOckyFjaN3SNjKdR9BetHfFXiw27JnOYrA7PRk3WY679
	yvfANtotS6xK1YwFXOr8PmEW0JQND75PIzBoaw4a3jEoF9i+OTyPWheb5zcHx3Y7
	wKdFKVykqQ5c6ym7Np1M1SbG1oDYAH7U2leUlpW8tiESvHiI8NHicGX4uF6iRXte
	nK+SRg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44tkttu4rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 09:41:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D30AE40044;
	Tue, 18 Feb 2025 09:40:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7E7C2F80C7;
	Tue, 18 Feb 2025 09:39:32 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 09:39:32 +0100
Message-ID: <ad738b22-7d09-4734-a546-759c23222925@foss.st.com>
Date: Tue, 18 Feb 2025 09:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: spi: Add STM32 OSPI controller
To: Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann
	<arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-2-patrice.chotard@foss.st.com>
 <67fe157ce8ca3c3c4e08451da52f7c94f73439b2.camel@pengutronix.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <67fe157ce8ca3c3c4e08451da52f7c94f73439b2.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_03,2025-02-18_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_004218_364680_2CC34149 
X-CRM114-Status: GOOD (  15.19  )
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



On 2/17/25 10:17, Philipp Zabel wrote:
> On Mo, 2025-02-10 at 14:18 +0100, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Add device tree bindings for the STM32 OSPI controller.
>>
>> Main features of the Octo-SPI controller :
>>   - support sNOR / sNAND / HyperRAM™ and HyperFlash™ devices.
>>   - Three functional modes: indirect, automatic-status polling,
>>     memory-mapped.
>>   - Up to 4 Gbytes of external memory can be addressed in indirect
>>     mode (per physical port and per CS), and up to 256 Mbytes in
>>     memory-mapped mode (combined for both physical ports and per CS).
>>   - Single-, dual-, quad-, and octal-SPI communication.
>>   - Dual-quad communication.
>>   - Single data rate (SDR) and double transfer rate (DTR).
>>   - Maximum target frequency is 133 MHz for SDR and 133 MHz for DTR.
>>   - Data strobe support.
>>   - DMA channel for indirect mode.
>>   - Double CS mapping that allows two external flash devices to be
>>     addressed with a single OCTOSPI controller mapped on a single
>>     OCTOSPI port.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  .../bindings/spi/st,stm32mp25-ospi.yaml       | 105 ++++++++++++++++++
>>  1 file changed, 105 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
>> new file mode 100644
>> index 000000000000..5f276f27dc4c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml
>> @@ -0,0 +1,105 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/st,stm32mp25-ospi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: STMicroelectronics STM32 Octal Serial Peripheral Interface (OSPI)
>> +
>> +maintainers:
>> +  - Patrice Chotard <patrice.chotard@foss.st.com>
>> +
>> +allOf:
>> +  - $ref: spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-ospi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  memory-region:
>> +    description:
>> +      Memory region to be used for memory-map read access.
>> +      In memory-mapped mode, read access are performed from the memory
>> +      device using the direct mapping.
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: phandle to OSPI block reset
>> +      - description: phandle to delay block reset
> 
> Are you positive that these will only ever have to be reset together?
> Otherwise I'd add a reset-names property just in case.

Yes i confirm that these both reset are reset together.

Thanks
Patrice

> 
> regards
> Philipp

