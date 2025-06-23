Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0706CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4Z6/tJa/UFNSN1pd77M3FYDzdgkVF+SixPAfedgsPY=; b=qpAFNSKx/F0O2GihDAvdGpJcRu
	Gj6SgHekxTEz61aOlR4IRtd01THa5kL6QAQTQ4rveZxmqcb+DUgxVv1Gv0pbOqmTjV4z2p04ZD39q
	QWnP3CyQfvruOe9MWDHeYBkYLZ/vsjYUvVPPLpXvfVgSTuu8VXc0tyJkDIkqxIiBvnNYwLcfnLGjJ
	NcbIoHWCHaol/9Z7CopLIT2jFzYZCFIOOF7AaPBAFeHsNGujphyo3NM+i095wlY5gcXOu/g/3+GEd
	KcGz0HtZ1ssxHTs6tzhaDUUXpwDgVWajcMswNn68l1BPVpKDQYvIKffZJPqfi6zdIYmY4TjaB1c9F
	V1q6Od/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnzo-00000003wYX-16QO;
	Mon, 23 Jun 2025 20:42:28 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTihZ-000000039W8-3waH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:03:19 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NAXGFF012023;
	Mon, 23 Jun 2025 17:03:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	+4Z6/tJa/UFNSN1pd77M3FYDzdgkVF+SixPAfedgsPY=; b=Nu6QCp8ytKHhSXKA
	QL5YZ8y8711G6aSBEZyto43QPpTPyx+hWUCox4qJzIbducnaI0nxBMq3KpnvYlKT
	WrmOYkT3BDOx/68i8YhPBfX97yfqlnOgBnXrbgo/tDClwz0hMj6YBKxnkfNbN6X3
	Dx61mJ+Uj0AT2Wh+QCz23oaHxPEHb7lmpdNGxbdFfQyCnRcGAy17DlsgVN+SqLH9
	OydUyEnwZTSc+doNJAd+xQzPeMk4YnO4xfzOr8f6ut8gkiuyFo4KwQg5Vo7tFBYc
	Oc0zfIxreugZ/MBmOEet/60dUCbp+m8Hf6vMJhqN0D4pKwQiND5vMgqTpuLAdLlk
	14lVdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjg0su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 17:03:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E55540046;
	Mon, 23 Jun 2025 17:01:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C67EB4D1DE;
	Mon, 23 Jun 2025 17:00:04 +0200 (CEST)
Received: from [10.252.18.29] (10.252.18.29) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 17:00:03 +0200
Message-ID: <cd7cac7f-e78f-4457-9e42-6290632d9c1c@foss.st.com>
Date: Mon, 23 Jun 2025 17:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-5-7dffff168090@foss.st.com>
 <868b20f0-c1ff-4cd7-91bc-e73069aafa95@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <868b20f0-c1ff-4cd7-91bc-e73069aafa95@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_080318_463398_18A537FB 
X-CRM114-Status: GOOD (  16.87  )
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

On 6/23/25 11:48, Krzysztof Kozlowski wrote:
> On 23/06/2025 11:27, Clément Le Goffic wrote:
>> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
>> It allows to monitor DDR events that come from the DDR Controller
>> such as read or write events.
>>
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Oops, you're right thank you

>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 93 ++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
>> new file mode 100644
>> index 000000000000..35d34782865b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +maintainers:
>> +  - Clément Le Goffic <clement.legoffic@foss.st.com>
>> +
>> +title: STMicroelectronics STM32 DDR Performance Monitor (DDRPERFM)
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - st,stm32mp131-ddr-pmu
>> +      - st,stm32mp151-ddr-pmu
> 
> These are compatible, aren't they?

Yes they are

>> +      - st,stm32mp251-ddr-pmu
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: Reference clock for the DDR Performance Monitor
> 
> Drop description, obvious.

Ok

> 
>> +    maxItems: 1
>> +
>> +  resets:
>> +    description: Reset control for the DDR Performance Monitor
> 
> Drop description, obvious.

Ok

> 
> 
>> +    maxItems: 1
>> +
>> +  access-controllers:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  st,dram-type:
>> +    description: |
>> +      This property is used to specify the type of DRAM memory connected to the
>> +      associated memory controller. It is required for the DDR Performance Monitor
>> +      to correctly interpret the performance data.
>> +      0 = LPDDR4,
>> +      1 = LPDDR3,
>> +      2 = DDR4,
>> +      3 = DDR3
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> No, use standard JEDEC memory bindings (memory controllers) if you need
> to describe the memory, otherwise you duplicate that binding and
> duplicate the memory information.

Ok didn't know about it, I'll take a look

Best regard,
Clément

>> +    enum: [0, 1, 2, 3]
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - st,stm32mp131-ddr-pmu
>> +              - st,stm32mp151-ddr-pmu
>> +    then:
>> +      required:
>> +        - clocks
>> +        - resets
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp251-ddr-pmu
>> +    then:
>> +      required:
>> +        - access-controllers
>> +        - st,dram-type
>> +
>> +additionalProperties: false
> Best regards,
> Krzysztof


