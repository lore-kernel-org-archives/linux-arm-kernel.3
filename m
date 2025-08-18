Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B455DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdXtjCINBYYl2y0vIxcCS+dE3WLQsljv6X6tY5i9tL4=; b=THv9dmn7opvs5KQUJt+48R0QFc
	y55XuJkWyY6G5jaDU4/xjZnuqPKxSuo7WviMXDFK2foDaFRhJpw4G2juuvWw1c3883pHe78ITR5Vr
	Jysl+8fH4v7wpqI7o+WErrmDciXatGnggzFZbp0hj5EKm17XffPXd+ruGfe69wskT1FW14ZpaIIzn
	ADWRNyNTnsUFaQqQ+2b26gdmrKPZzzCQMhRSIBYjVaiUN2A2uYqfNoXBsH/ux3dWdyjmSMkiSxrLm
	ryxf5HcAyfn13H7pGl/FO27IFP83KeaX+bf+nQ0uFJOBUOJ731c8GBaexysDLColyEPW0cgC0xjCC
	8fGKd8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0dW-00000007iMg-2ts9;
	Mon, 18 Aug 2025 14:14:58 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo0TP-00000007gkm-3xCz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 14:04:33 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IDgcJo022338;
	Mon, 18 Aug 2025 16:04:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SdXtjCINBYYl2y0vIxcCS+dE3WLQsljv6X6tY5i9tL4=; b=updHvFjI2C7p8gFG
	QApsM9kyPimXAFYNBtIJyCaOhgx34foyMQH8xFMKefIBW+7P4qrrBKQjv/+4MlWd
	k9YUeze9h79r4aBprU144nzdU+645oUPSQfb2QrnR9xNSJ3PCXJ3dhobR5dlqRKP
	BTKkql0SwE0FfJqE3yYpQygUApIRrIdSqndKrCM0ZQRHDU0mVKanAqrz+sK7WFsr
	gEa59GXrFUd08Y6PUpLHQXHeJzXd01flU7UtHnq1uAccc3o7yzM+jcSsP3F9Hgwl
	e0Lz6wjPWPgRXYi4ZjvaUcewO39FQnC4lcmAO01P8udM2urXTLtEvqm84m5pfWEL
	YO4whw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jf47phne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 16:04:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6CD724004F;
	Mon, 18 Aug 2025 16:03:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99821738B2D;
	Mon, 18 Aug 2025 16:02:55 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 16:02:54 +0200
Message-ID: <fa1f6952-dba5-421d-9a79-03904059df0d@foss.st.com>
Date: Mon, 18 Aug 2025 16:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: sti: drop B2120 board support
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
 <20250714-sti-rework-v2-3-f4274920858b@gmail.com>
 <517de150-9fb1-4098-92a3-d5a24eea67a1@foss.st.com>
Content-Language: en-US
In-Reply-To: <517de150-9fb1-4098-92a3-d5a24eea67a1@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_070432_250638_257C6B06 
X-CRM114-Status: GOOD (  11.60  )
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



On 7/28/25 11:26, Patrice CHOTARD wrote:
> 
> 
> On 7/14/25 15:49, Raphael Gallais-Pou wrote:
>> B2120 boards are internal boards which never were commercialised.
>>
>> Remove them from bindings.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
>>
>> ---
>> Changes in v2:
>> - Added Krzysztof's acked-by
>> - Put this patch last to get a bisectable series
>> ---
>>  Documentation/devicetree/bindings/arm/sti.yaml | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
>> index 842def3e3f2bce470763d3665c7603b9058b1e4e..177358895fe1c9f80f8c825142cf015d04286ce8 100644
>> --- a/Documentation/devicetree/bindings/arm/sti.yaml
>> +++ b/Documentation/devicetree/bindings/arm/sti.yaml
>> @@ -14,12 +14,8 @@ properties:
>>      const: '/'
>>    compatible:
>>      oneOf:
>> -      - items:
>> -          - const: st,stih407-b2120
>> -          - const: st,stih407
>>        - items:
>>            - enum:
>> -              - st,stih410-b2120
>>                - st,stih410-b2260
>>            - const: st,stih410
>>        - items:
>>
> 
> 
> Hi Raphael
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
Applied to sti-next

Thanks
Patrice

