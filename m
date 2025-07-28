Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A01C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TRBNRU0aazEaz412aN0yClz+07/RSAtN1hf3sqcbTY=; b=tw5wpV7JJ6bB1EDGxroOywDvCV
	6nDHLlvpt8uYfPEIashxaeh69xaC7xdJEZxFAV86Etb4e9keElvQHD4+XlyRZIHnE+kjpsqorylU9
	C5z/w7/+XLxf+sp37OlSMzrw6CIqKb2zVMiVEd2i2ZWGA9dqljBF6zA6hXHj+l8Wul6hW49i51WQa
	1vEz5NPpX/F8ic4VxlAB6pS9zNhBK+XWdcFlGNHJdycxjzIdT7l3nXhXgUc1w9qCIn1xgy+W3Ryz1
	R+I79KniwSYFhv5UYpVPKJ6bS8BRSKEIlRogG2h3rcjUCFGr0Wq/pLVUotglkNOOYkwsa8oiO5zDy
	rElFU2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugMif-0000000EP6o-3lRg;
	Mon, 28 Jul 2025 12:12:42 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLG2-0000000EFfC-40V8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 10:39:04 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAK6Pk031811;
	Mon, 28 Jul 2025 12:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	2TRBNRU0aazEaz412aN0yClz+07/RSAtN1hf3sqcbTY=; b=3duh5Aotax1L6S6u
	3Wfer4PGVcgXjO92s+e7kzK5anxAOga19rCv/l6vuBIvnnaHiWdWQR8La38yiVqY
	oX2PooxgymVguBVZ3ZTrg9+bPNmJNeVn6frG+gj3Uo1QBLNOG1mM7ZYZ0tTuc+Ba
	1Vp8TxeYiWzwSR5eNJIi7XnIp74HBDzr9bgBLmgQdCz7N0WVXrS5QZF4r4HUj7oB
	9l9oCHDf0v0E6onuymUAmSy06IKGdqvwcbdoZSmTbZmRibUmGIhENqidnl5Gkc6i
	OmEHzWNlh+Vg8iAYv04BiCvCvm1m+voNydrK4q8gqmY2uRo4WqzMfJjjPH0fyxKf
	3vaWNA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc27rr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 12:38:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B67FC4002D;
	Mon, 28 Jul 2025 12:37:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CFD6769726;
	Mon, 28 Jul 2025 12:36:04 +0200 (CEST)
Received: from [10.252.20.157] (10.252.20.157) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 12:36:03 +0200
Message-ID: <58bcd0dc-9df0-461c-8e11-5e892bee2f34@foss.st.com>
Date: Mon, 28 Jul 2025 12:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] dt-bindings: display: st: add new compatible to
 LTDC device
To: Rob Herring <robh@kernel.org>
CC: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-1-a59848e62cf9@foss.st.com>
 <20250725194936.GA1731993-robh@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250725194936.GA1731993-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.20.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_033903_280212_DBAEE4E3 
X-CRM114-Status: GOOD (  14.79  )
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



On 7/25/25 21:49, Rob Herring wrote:
> On Fri, Jul 25, 2025 at 12:03:53PM +0200, Raphael Gallais-Pou wrote:
>> The new STMicroelectronics SoC features a display controller similar to
>> the one used in previous SoCs.  Because there is additional registers,
>> it is incompatible with existing IPs.
>>
>> Add the new name to the list of compatible string.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 37 +++++++++++++++++++---
>>  1 file changed, 33 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
>> index d6ea4d62a2cfae26353c9f20a326a4329fed3a2f..546f57cb7a402b82e868aa05f874c65b8da19444 100644
>> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
>> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
>> @@ -12,7 +12,9 @@ maintainers:
>>  
>>  properties:
>>    compatible:
>> -    const: st,stm32-ltdc
>> +    enum:
>> +      - st,stm32-ltdc
>> +      - st,stm32mp25-ltdc
>>  
>>    reg:
>>      maxItems: 1
>> @@ -24,11 +26,12 @@ properties:
>>      minItems: 1
>>  
>>    clocks:
>> -    maxItems: 1
>> +    minItems: 1
>> +    maxItems: 4
>>  
>>    clock-names:
>> -    items:
>> -      - const: lcd
>> +    minItems: 1
>> +    maxItems: 4
>>  
>>    resets:
>>      maxItems: 1
>> @@ -51,6 +54,32 @@ required:
>>    - resets
>>    - port
>>  
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - st,stm32-ltdc
>> +then:
>> +  properties:
>> +    clocks:
>> +      maxItems: 1
>> +    clock-names:
>> +      maxItems: 1
>> +      items:
>> +        - const: lcd
>> +else:
>> +  properties:
>> +    clocks:
>> +      maxItems: 4
>> +    clock-names:
>> +      maxItems: 4
>> +      items:
>> +      - const: bus
>> +      - const: lcd
> Why can't 'lcd' be 1st so you aren't changing positions? Keep the items 
> list at the top level and just use minItems/maxItems in the if/then 
> schemas.
Hi Rob,

I've set the name order to match the stm32mp255.dtsi device-tree, so that it
does not confuse anybody regarding which clock goes with.

Your comment is taken into account for the upcoming version.

Thanks,
Raphaël
>
>> +      - const: ref
>> +      - const: lvds
>> +
>>  additionalProperties: false
>>  
>>  examples:
>>
>> -- 
>> 2.25.1
>>


