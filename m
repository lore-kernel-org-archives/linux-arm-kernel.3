Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1206C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXS1HGsTHr9/1Ngx2AF+DGBdFhZg7bub1m4HSTPuIuc=; b=bTc+GQBrz5H1vNsCFytn4mfzwV
	/R79RbTqf4c81oFBHiS7YPYXC9uxYLrzJnpUaFWK4YsFeK/79xsgEYIvAZ4l6Sl0TmgoQ95H0u68b
	7a7OBgm2p4PM/deZYhseizGreaoIlzfDmaJbWE5gCl0xZi0jn6gFOSJYrXt2VQ43HoJW2wz42le0x
	67l3NiOumMWb4EsyVQ3eTu9m3jbH9XE93zM62IzV+imsZYm8XywKd+TfoCJM1kWL5x7ThLBR8bAvI
	ywjOFD2BDGSHdgeEHdAQNUgKTEav6cBujKURoU+KobkFVs/oPbffUPfWY0LOXP8U+hezDk+GIy1Dn
	OLtMqdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixNX-0000000FGLk-3C9m;
	Fri, 14 Feb 2025 15:13:19 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixIv-0000000FFP6-00pV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:08:34 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ECjotE010500;
	Fri, 14 Feb 2025 16:08:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	YXS1HGsTHr9/1Ngx2AF+DGBdFhZg7bub1m4HSTPuIuc=; b=GzC2Xguz8yBpUIFF
	RI+aUtN4T9Bu5IcWJFA7srIVliH9g502kTSXOpj5TcB1vaVujiMXGWT1U1Udz6TL
	kF0YOJVywNexGSdQ4wOypyYaSiXoTXXXd9+OgkGfD5L6qWjNXTXKdiigY256aWgI
	KmdUlXRh3dlXsKs8Bf1hNHSq0IEyKpADMBVSY2ijAd9YAAkkB+MSNjvbM2fLtq6Z
	5jRfdYkTttU+MRuwACRlGwyOFV9p5nFkZ29vT8YtVfVgTfuqEB1LrDhMpOLPzP/i
	LC4Y6qkrwwqd6/blvFlPjuGbINnAsuXkER1ht2L1mjbOBbdK7ux0k7skdjbXq+gG
	bxYN4A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44rrh3uwgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 16:08:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 775EC4002D;
	Fri, 14 Feb 2025 16:07:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AAADE2DB172;
	Fri, 14 Feb 2025 16:06:16 +0100 (CET)
Received: from [10.48.87.120] (10.48.87.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 16:06:15 +0100
Message-ID: <450d2efa-f38b-4f3a-b308-f2fb01fdb8f7@foss.st.com>
Date: Fri, 14 Feb 2025 16:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm64: Kconfig: expand STM32 Armv8 SoC with
 STM32MP21 SoCs family
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-7-e8ef1e666c5e@foss.st.com>
 <20250213-polite-spiked-dingo-ce0f3a@krzk-bin>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20250213-polite-spiked-dingo-ce0f3a@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_06,2025-02-13_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_070833_342031_210583E3 
X-CRM114-Status: GOOD (  12.85  )
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

On 2/13/25 10:02, Krzysztof Kozlowski wrote:
> On Mon, Feb 10, 2025 at 04:21:01PM +0100, Amelie Delaunay wrote:
>> Expand config ARCH_STM32 with the new STM32MP21 SoCs family which is
>> composed of STM32MP211, STM32MP213 and STM32MP215 SoCs.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>>   arch/arm64/Kconfig.platforms | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 844a39620cfea8bfc031a545d85e33894ef20994..f788dbc09c9eb6f5801758ccf6b0ffe50a96090e 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -325,6 +325,8 @@ config ARCH_STM32
>>   			- STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>>   		- STM32MP23:
>>   			- STM32MP231, STM32MP233, STM32MP235.
>> +		- STM32MP21:
> 
> Squash it with previous patch and keep some sort of order.
>

Ok for squashing with patch 3.
Do you mean to keep the current chronological order used here or to 
change the order because "chronological" is not an appropriate order? In 
this case, would the alphanumeric order be fine?

>> +			- STM32MP211, STM32MP213, STM32MP215.
>>   
>>   config ARCH_SYNQUACER
>>   	bool "Socionext SynQuacer SoC Family"
>>
>> -- 
>> 2.25.1
>>

Regards,
Amelie

