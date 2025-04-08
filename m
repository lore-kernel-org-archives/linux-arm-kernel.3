Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A87C369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idy7unnjHF724gRlX6xdG7LoWiV2Db9Z6YWr6CtXLEw=; b=a0R7lfy9pWKbcsC/zjACjSKKYi
	3T2HJUQBf4YkdO8MFWPp8PzNrwZxvB9gziU7iKqGw17nyvQYtnmRdFBzZy8/GpsomDtRjS2le3gRn
	k+GCDym5mJjQ9y6H3sxS0GEzeE1ZeKzhWn7v2rsTRhG+taWyTY37xipPMgy2Ot2oxSEjSlnA9Y8aI
	Fu01JzfVOngWg8Kq7LGsu1medcrqV0DvcugPYDgjYK66Gr9CY/dgcqFFCp30mwPJav3qW/WVhXubD
	CfU14OLGJZUHyAo+7fnVNYJO/R125/foSpU7uwxFHTzvQKKaxAe/6DhND33Wktn7lUpo4odwtlYjY
	xoTw7+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QE-00000004HFc-2SK9;
	Tue, 08 Apr 2025 13:55:26 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28rT-00000004AlQ-2DFt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:19:33 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AxRwX008721;
	Tue, 8 Apr 2025 15:19:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	idy7unnjHF724gRlX6xdG7LoWiV2Db9Z6YWr6CtXLEw=; b=SnPhGGZ4sX07yhN4
	4MXSfSo/N5BcZyt3zL9A+tmFTt1eZ9BObWHhjYPK+KrbsG9Bt/9mDh7E1QiqoAVC
	C0qlRdPJnKp0byut2kxVtwPJQrmxbqTjj0SmaBwDxXUr+CQgPFXKAmVaaogJ+zEN
	3CDvdvcxQM/oLtYXa7MTp6mxlLDhge4YG9vi4/XG/jD5tpatwvH+z7TxtD3I+4xw
	kMR7S2YwOscP/L7aDDp2U5uBGXzDtea/vtYQ7lkzttpfy8Mx7A3rgY2t77Ai3vfZ
	eG5OA7zOXLsF1tIaunn/UcXQE7gElQfhe1OCo09Mdt+vqBzfQ8C71RkZdYCrpm+Y
	UF+Ogg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw2gw664-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:19:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B6C9740047;
	Tue,  8 Apr 2025 15:17:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D64E59A469C;
	Tue,  8 Apr 2025 15:16:32 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 15:16:32 +0200
Message-ID: <1f737628-6a0b-4265-96bc-4ddacd244e7a@foss.st.com>
Date: Tue, 8 Apr 2025 15:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <christophe.kerello@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>
 <20250408-magic-arrogant-hound-0f2de5@shite>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250408-magic-arrogant-hound-0f2de5@shite>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_061932_146935_47CAB93B 
X-CRM114-Status: GOOD (  11.99  )
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



On 4/8/25 08:45, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:33PM GMT, Patrice Chotard wrote:
>> +  st,syscfg-amcr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
>> +      memory map area shared between the 2 OSPI instance. The Octo Memory
>> +      Manager sets the AMCR depending of the memory-region configuration.
>> +      The memory split bitmask description is:
>> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
>> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
>> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
>> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
>> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
>> +    items:
>> +      items:
> 
> That's not what Rob asked. Are we goign to repeat the story of Benjamin
> and VD55G1? You got the exact code to use, which only need corrections
> in indentation probably. Why not using it?
> 
> You miss here '-'.

Hi Krzysztof

Sorry but Errare humanum est and dtbs_check didn't detect this.
I will fix it. 

Thanks
Patrice

> 
> Best regards,
> Krzysztof
> 

