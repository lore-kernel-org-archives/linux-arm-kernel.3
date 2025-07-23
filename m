Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62737C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK/sgu4bbRdODvf5tGfCdDwOR/bbwmheF/bQDBgiURc=; b=zWmCN+2rfrNBf2Ar6zEtMOZl9u
	LoqKU3viV08HrgSVIu8cyxFsjU5cZmHdBGxBrvFRqPlscnj/2AxJYFrTB5LzRoOXMFT8eYCsx/a2b
	bIsn/aROc97j3Jf1NK1kAYd+8J11rYoTv/I228CPyEFOAK/j/2+BEbb7P4WB6HH2FWZp+wERVZUBm
	msG28riW6fDlygcYgQIxfrASYgVU09EYbiiNjzWoRGIgAVBcPzo5fIvZYg6ne9zm0aG87I38SZsOp
	BRIKLOpZ2RSIj8NiHWitnPD+xoUxncRdh6l/9sp2gtpZcH4oiRxlXJO1p3X6lZWdZKAFMawoGWH1k
	wNfB3jKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUxv-00000004OGu-3q3P;
	Wed, 23 Jul 2025 08:36:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUay-00000004LPa-15wr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:13:01 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N6doax017391;
	Wed, 23 Jul 2025 10:12:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	QK/sgu4bbRdODvf5tGfCdDwOR/bbwmheF/bQDBgiURc=; b=c2BAurjQoIkZx3qZ
	U2f+PzALTuiatgf01cQJZ+5YLfNH9gWPig4oRGmgheOtBV6Fysjg3Dbjnyq3At1K
	C06RPHgeUh3BDvg17/h+P/+vsRdODvB4gkDo6OOZFuKie0KGvhlXbXFBb3/SXuYq
	hRkN/TQBnhr+e8cye3LN3PH5MUR+3JqDcMblh1k+fCMjX13S64aaHHjRCoPXakVq
	ui2IgS0L9Jb9e+sxtSOl6kjyrnZP+pLaop77Dt5U0vAbHXFPodnoh06RmDssgYUO
	qsuGOrFmw/0G6jp3XDY/ZThhXSJ2KPAst6jbzuklVuJBOuMO5+1bZw9V6jLMl2l4
	pqpznw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4qpqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:12:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2CEBC40046;
	Wed, 23 Jul 2025 10:11:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB65D76C471;
	Wed, 23 Jul 2025 10:10:01 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 10:10:00 +0200
Message-ID: <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
Date: Wed, 23 Jul 2025 10:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Julius Werner
	<jwerner@chromium.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Le Goffic <legoffic.clement@gmail.com>,
        Julius Werner <jwerner@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250723-zealous-turtle-of-perfection-e67aee@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_011300_600369_C56B169B 
X-CRM114-Status: GOOD (  26.64  )
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

Hi Krzysztof,

On 7/23/25 08:57, Krzysztof Kozlowski wrote:
> On Tue, Jul 22, 2025 at 04:03:24PM +0200, Clément Le Goffic wrote:
>> LPDDR and DDR channels exist and share the same properties, they have a
>> compatible, ranks, and an io-width.
> 
> Maybe it is true for all types of SDRAM, like RDRAM and eDRAM, but I
> don't think all memory types do.
> 
> I think this should be renamed to sdram-channel.

Ok, do you want me to also the memory-props patch into sdram-props ?

> 
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   ...pddr-channel.yaml => jedec,memory-channel.yaml} | 26 +++++++++++-----------
>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
>> similarity index 82%
>> rename from Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
>> rename to Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
>> index 34b5bd153f63..3bf3a63466eb 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-channel.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,memory-channel.yaml
>> @@ -1,16 +1,16 @@
>>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>   %YAML 1.2
>>   ---
>> -$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,lpddr-channel.yaml#
>> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,memory-channel.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: LPDDR channel with chip/rank topology description
>> +title: Memory channel with chip/rank topology description
>>   
>>   description:
>> -  An LPDDR channel is a completely independent set of LPDDR pins (DQ, CA, CS,
>> -  CK, etc.) that connect one or more LPDDR chips to a host system. The main
>> -  purpose of this node is to overall LPDDR topology of the system, including the
>> -  amount of individual LPDDR chips and the ranks per chip.
>> +  A memory channel is a completely independent set of pins (DQ, CA, CS,
> 
> A memory channel of SDRAM memory like DDR SDRAM or LPDDR SDRAM is ...

Ack

> 
>> +  CK, etc.) that connect one or more memory chips to a host system. The main
>> +  purpose of this node is to overall memory topology of the system, including the
>> +  amount of individual memory chips and the ranks per chip.
>>   
>>   maintainers:
>>     - Julius Werner <jwerner@chromium.org>
>> @@ -26,14 +26,14 @@ properties:
>>     io-width:
>>       description:
>>         The number of DQ pins in the channel. If this number is different
>> -      from (a multiple of) the io-width of the LPDDR chip, that means that
>> +      from (a multiple of) the io-width of the memory chip, that means that
>>         multiple instances of that type of chip are wired in parallel on this
>>         channel (with the channel's DQ pins split up between the different
>>         chips, and the CA, CS, etc. pins of the different chips all shorted
>>         together).  This means that the total physical memory controlled by a
>>         channel is equal to the sum of the densities of each rank on the
>> -      connected LPDDR chip, times the io-width of the channel divided by
>> -      the io-width of the LPDDR chip.
>> +      connected memory chip, times the io-width of the channel divided by
>> +      the io-width of the memory chip.
>>       enum:
>>         - 8
>>         - 16
>> @@ -51,8 +51,8 @@ patternProperties:
>>     "^rank@[0-9]+$":
>>       type: object
>>       description:
>> -      Each physical LPDDR chip may have one or more ranks. Ranks are
>> -      internal but fully independent sub-units of the chip. Each LPDDR bus
>> +      Each physical memory chip may have one or more ranks. Ranks are
>> +      internal but fully independent sub-units of the chip. Each memory bus
>>         transaction on the channel targets exactly one rank, based on the
>>         state of the CS pins. Different ranks may have different densities and
>>         timing requirements.
>> @@ -107,7 +107,7 @@ additionalProperties: false
>>   
>>   examples:
>>     - |
>> -    lpddr-channel0 {
>> +    memory-channel0 {
> 
> If doing this, then separate commit based on generic node name
> convention. But then we need to come with generic node name first,
> sdram-channel?

I don't want anything specific so yes it could be cool to have a generic 
node name.
"sdram-channel" is fine for me.
@Julius what do you think about it ?
Is your existing software generating it in the kernel ?
I'm curious about dynamic node name generation.

> 
> And also '-0', not '0' suffix.

Ack

> Best regards,
> Krzysztof
> 


