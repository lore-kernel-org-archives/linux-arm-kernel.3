Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB5BE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JnhlkT+86La11TTNlcsIBnITx15puWkRfuAEfVFs/I=; b=x9vFTqPJC1dg9i6EQXSl/piokB
	+lqus1SibDgzSxzXDhdYJXQehNhv7XodV5OpW9zbuWXX5DHVcQ8XBYsv9qrTqNxQPYL5M111RlbAI
	LU5dXZhymdidiO/h7Y7D9WQAjnQpW86mas/MKzkAuUSHVh0L/cDkWsjZ6GGBugt2i8lUxgfpeJeHp
	8hcu15oHjmN7SyEwwYIz6NqjAYvxDhz98E7GdJ6zNEM29pr47LeKtoGyNizL0+SRsLQfrkFfvIG5q
	0NM8fAgWZqJ3PgLOBxJnK8Ccdhjpueo+5+wdLgpWzTeC6HHFjIFf9zm3CFBSd723kLVCrbLzX6J9L
	6xp/Yp/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGLr-0000000H5Kv-2iIq;
	Thu, 05 Dec 2024 18:13:23 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGFY-0000000H43K-0k2b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:06:53 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5G4HBk019839;
	Thu, 5 Dec 2024 19:06:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0JnhlkT+86La11TTNlcsIBnITx15puWkRfuAEfVFs/I=; b=G5nZotVwCco3qDt6
	3Cfl9zzcdOOU/Uml9SI6+Fw7T1PoD+tUBhguTxQqOSCFrZl4j6YaIKRFFUSUsiU6
	Z6iGESJ+JSmq9RTT1t3VA0DFwQJ/Tm6hJnSkA69uFFtZMyJqrtuK7FELR3ZTBTrK
	S3s21nK0xDo+JIR2VMGa8d3iOmV8DY445J5iDbsysAGTRpdMXryOLz5RnGT76Ar8
	6seG7FYjzqNSVuXp9r0ifTCCPcdi+nC9M07N/9QOT0Rzif4ecraID5m2AoIhGBS1
	14KhdkgN7fTr44dxms2+AewXh3kKtod4nNUch5Ho3mf5FBvTX1vRFu9/CPIl0cGW
	ZAkXGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437rq9gssg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 19:06:40 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69D6840049;
	Thu,  5 Dec 2024 19:05:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52D9D267F27;
	Thu,  5 Dec 2024 19:04:41 +0100 (CET)
Received: from [10.252.15.31] (10.252.15.31) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Dec
 2024 19:04:40 +0100
Message-ID: <bdfeceb6-962a-4f20-b76c-4fe5e5ff80c3@foss.st.com>
Date: Thu, 5 Dec 2024 19:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: dma: st-stm32-dmamux: Add description for
 dma-cell values
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ken Sloat
	<ksloat@cornersoftsolutions.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <dmaengine@vger.kernel.org>, <alexandre.torgue@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <conor+dt@kernel.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <vkoul@kernel.org>
References: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
 <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org>
 <CADRqkYDnDNL_H2CzxjsPOdM++iYp-9Ak3PVFBw2qcjR_M=GeBA@mail.gmail.com>
 <28d1bb46-ab18-42da-9ca2-ff498c888d66@kernel.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <28d1bb46-ab18-42da-9ca2-ff498c888d66@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.15.31]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100652_664222_B5996737 
X-CRM114-Status: GOOD (  14.37  )
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


On 12/5/24 17:09, Krzysztof Kozlowski wrote:
> On 05/12/2024 17:07, Ken Sloat wrote:
>>>> + 1. The mux input number/line for the request
>>>> + 2. Bitfield representing DMA channel configuration that is passed
>>>> + to the real DMA controller
>>>> + 3. Bitfield representing device dependent DMA features passed to
>>>> + the real DMA controller
>>>> +
>>>> + For bitfield definitions of cells 2 and 3, see the associated
>>>> + bindings doc for the actual DMA controller the mux is connected
>>>
>>> This does not sound right. This is the binding for DMA controller, so
>>> you are saying "please look at itself". I suggest to drop this as well.
>>>
>>
>> While logically it is the DMA controller, this doc is specifically for
>> the mux - the DMA controller has its own driver and binding docs in
>> Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
>>
>> I can reference st,stm32-dma.yaml directly, but I was unsure if this
>> mux IP was used with another DMA controller from ST on a different
>> SoC.
>>
>> What do you suggest here?
> 
> Thanks for explanation, I think it is fine.
> 
> Best regards,
> Krzysztof

This description was lost when STM32 DMAMUX binding txt file was 
converted to yaml:
0b7c446fa9f7 ("dt-bindings: dma: Convert stm32 DMAMUX bindings to 
json-schema")

-- #dma-cells:	Should be set to <3>.
-		First parameter is request line number.
-		Second is DMA channel configuration
-		Third is Fifo threshold
-		For more details about the three cells, please see
-		stm32-dma.txt documentation binding file


stm32-dmamux exclusively muxes stm32-dma channels. It is not used with 
other ST DMA controllers (STM32 MDMA, STM32 DMA3).

So it is fine to refer to st,stm32-dma.yaml.

Regards,
Amelie

