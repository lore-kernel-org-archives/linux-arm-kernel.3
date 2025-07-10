Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2E9C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FteJQilrWBfBvhIiChMigkGkPT4QD1u6xypvpY95TU0=; b=Woz7b5xu4HN0pCaYhtwFWyXl3l
	/Y8RBBSSNY+dr09oLmq4fVQKShjw3CgHK1IvmlnUBj0rt1V4qDcjIlw9sO1ZtjpM4JgRZvxu9nmlx
	K278VJjhZrt48LQ1YgwZc3XqEKPgo1NCG1WwypnHLUAcAJwOEWtfOSs0rBzXJdBHgjOpsG7TRcfMM
	HWf9/Qrdhxuxia7b7Lx3TsE3sfumBoAiRjvgdHONTdbvbw3HYh9jJBh5MZWddxYES+65AP8QzBlzj
	eHymkIIPzXYRoJJ/4hv7PgeJ0jum5bCdRG6kxJrLkZlfjjDLJnxFKqV9fE6DvAkZk59jydpaP9S3x
	HEQporag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmpq-0000000BDA4-33Td;
	Thu, 10 Jul 2025 08:40:54 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlhZ-0000000B0cW-0FSE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:28:19 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6nMQ4020561;
	Thu, 10 Jul 2025 09:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	FteJQilrWBfBvhIiChMigkGkPT4QD1u6xypvpY95TU0=; b=VhSXHgvkoCKjL0PB
	yLPzLljS9EtzmH6qBo4MWrhd/pumsuUD8+ON95lET7nmSmqFrQnoRVupBYdYAlfu
	djGjVlo43TAdWUmsXUZgnroiJwMw47odRN0mNYABKDiOZ51Bt/EJzZNDPzmhBCJ0
	CMbstpvVa2BWVI2D8EppAjFvYXVZ4ZhxSrngbuZELHV/aY6bFeDQ35BAlp1S7N2x
	GeJfMjn0DSAq3a6zy8jnfueD2KysLIEasSHwMmzGQLS15g1t/eLo25EJf82KRv5d
	sp1MjzM+BSKvkf8g6WMx0/jPp6e9fRSs21UvN8PDDjbqKUdd6eMSNQ0AzEYvOb8v
	L38+Tg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ptxjf7w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:27:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CC7DF40048;
	Thu, 10 Jul 2025 09:26:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81309AE9D80;
	Thu, 10 Jul 2025 09:26:06 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 09:26:05 +0200
Message-ID: <cadb2bcc-9a2a-447a-ac03-459f3e37a173@foss.st.com>
Date: Thu, 10 Jul 2025 09:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: memory: add jedec,ddr[3-4]-channel
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
 <20250626-ddr-bindings-v1-1-cae30933c54c@foss.st.com>
 <e016efd6-891b-467e-8a4e-9ea53b7006a9@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <e016efd6-891b-467e-8a4e-9ea53b7006a9@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_002817_580114_9E3FABEF 
X-CRM114-Status: GOOD (  10.16  )
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

On 7/9/25 20:27, Krzysztof Kozlowski wrote:
> On 26/06/2025 21:48, Clément Le Goffic wrote:
>> Introduce as per jdec,lpddrX-channel binding, jdec,ddr[3-4]-channel
> 
> s/jdec/jedec/

Right thanks

> 
>> binding.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
> 
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    ddr_channel: ddr3-channel@0 {
>> +        compatible = "jedec,ddr3-channel";
>> +        io-width = <16>;
> 
> Missing reg... or not? What was your intention

Indeed no reg.
I'll drop the "@0" for the next version.

> 
> 
>> +    };
>>
> 
> 
> Best regards,
> Krzysztof


