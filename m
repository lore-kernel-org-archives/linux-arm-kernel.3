Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BABC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 12:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hREfD9h0pyFa6Qh0S2jAB9bMfbE7Dv/kgHfimMyy6w=; b=naGXh5szIpiYJx9OvkLJfkgjc8
	yVzKGJVPqepgB6qwqxo1LBVoNL8V1GS/T+0fRhY+eEqgyDrSFSDmeJh/40k7Eghr1CxohNHLePotz
	8IgZixB8tcT2LRtQbRYyea6fu3Wt7BrGttdAy4zSpbBBhyZ9R6fHSUeDTjeHnUwC4Zj752Sp0ZnH/
	8MxNchOvgomG0ZRVuF6PgfjraBrLnKJiXjW6gHpeFv+vVB5pwfDvFXoCIAXiKU1wV0OfdGnZeGojw
	u2SmnYgw/jgDmlhN2D3plXmcxTxXAKh+h6xZnKJhJpEC+UPqFSvAPXRkzYK2N9o3YtE6va2LgAYDB
	J0NPTNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTwE-00000008n2u-1y9M;
	Thu, 30 Jan 2025 12:46:30 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdTuu-00000008mtn-1Rei
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 12:45:09 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UCfHYh030056;
	Thu, 30 Jan 2025 13:44:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	9hREfD9h0pyFa6Qh0S2jAB9bMfbE7Dv/kgHfimMyy6w=; b=Xf4anVNWbLdKR6tL
	p0daiYsMRYArJabcArI+84aYSLasTmT8sRaVYO0J5KO5tXyNVkdM1qe50TBwCZyv
	x/f/yVEsRhG/ZGxuSJUkLJIzX4S+88rohm7990nR3uRLt0QBHnaLOuiEdG0BA6h/
	3I8jWYmch5qKFAH1Hpi2okIh8hucv6T4VQGe5pf6OH7qxpQRkyaDiMO50nSpvRDg
	A8/IXObLAfeCr8XIcICq2AvqXamZo0q28jfTtZsL9ZvzuNSkJeV1JUkDyZI5jdjZ
	URQ+g8ZcwN7BHxazwd6gtUoQxOIyQICqxyk+A/0mSlpxlkuTcQg+LopviFb2d/hm
	c/4+Kw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44fy472c6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 13:44:56 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7DD514002D;
	Thu, 30 Jan 2025 13:43:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A4743B1A42;
	Thu, 30 Jan 2025 13:39:13 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 13:39:12 +0100
Message-ID: <1098622d-d9a6-428c-9bbe-1f0de5f3d113@foss.st.com>
Date: Thu, 30 Jan 2025 13:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
 <e3d01bce-a7d4-4690-8a2f-3bbb1ee5ccb7@foss.st.com>
 <20250129-feminize-spotlight-2cee53f8b463@spud>
 <5892e452-96e7-4945-a2dd-2e713d85d751@foss.st.com>
 <7323e5ae-21b7-43cc-aed2-e23cd528842e@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <7323e5ae-21b7-43cc-aed2-e23cd528842e@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_044508_695498_EB830F1D 
X-CRM114-Status: GOOD (  12.16  )
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



On 1/30/25 13:26, Krzysztof Kozlowski wrote:
> On 30/01/2025 11:28, Patrice CHOTARD wrote:
>> For example:
>>
>>  access-controllers:
>>     description: phandle to the rifsc device to check access right
>>       and in some cases, an additional phandle to the rcc device for
>>       secure clock control.
>>     items:
>>       - description: phandle to bus controller
>>       - description: phandle to clock controller
>>     minItems: 1
>>     maxItems: 2
>>
>>
>> make dt_binding_check DT_SCHEMA_FILES=st,stm32mp25-ospi.yaml
>>
>> Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml: properties:access-controllers: {'description': 'phandle to the rifsc device to check access right and in some cases, an additional phandle to the rcc device for secure clock control.', 'items': [{'description': 'phandle to bus controller'}, {'description': 'phandle to clock controller'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
>> 	hint: "maxItems" is not needed with an "items" list
>> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>>   DTC [C] Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.example.dtb
>>
>> How can i indicate that at least one items is mandatory, the second one is optional and in the same
>> time describing the both items as required without getting the above error ? 
> 
> maxItems is redundant.

ok, it solves the issue

Thanks
Patrice


> 
> Best regards,
> Krzysztof

