Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14D8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zboDa3cKQkLjfjJd+7M0V2NhLphn96I5A2P8IRJH05M=; b=eftIR1VKM0qi/WZY5IPUNdQrsb
	lxthyx6iF8BVagjRFSjKHLYa+TJ6Bnm6Tx8SC/dsZTcDSdxhOQ6SgX26tCD/nJp1BdECb84ZSHRhY
	hx1iP3AuN8kaMq1TAS81OP7s0RtPCzNK768DAultlbeqoXRW7J2C71k1ykrkN5yPL5Ax9vbDaUDA6
	HKp1IiKA682PDbcGM8n0s74kiBhuvfne8V4nodmD6snOzoHzP6v+2d121EsmEqEEm5iWtX9+PCIMM
	X338iz4vlUK3kN4uTv6PUFqDTVE2bpm3CG21BXxv+QcnF1/X7dX6SmBsEUPeNbjCXK4siSVcIGUXQ
	Gp2CMKJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzj3-00000000wyV-1Zq5;
	Tue, 25 Feb 2025 18:32:13 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyl0-00000000eHD-2DaH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:30:11 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PF2BBx000811;
	Tue, 25 Feb 2025 18:29:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zboDa3cKQkLjfjJd+7M0V2NhLphn96I5A2P8IRJH05M=; b=wgvvxZWW/CqAHK3j
	H8sgxDoRLndjNM9Sd34CXs4PXk5zv6HAYe1E3VwWDrRK8sHF482eocl9THKJ9N27
	yUIfiqlKj2VdC+Ir8+dPwx5EA4NCnMKxl1X74e4c8S/swBVfsjJ5v5afQa3fhJwA
	+wVJ268wjp6nEHEytQg/Qn8skofLorecSxqwEzRIZSUNK5tkojzeyZEkWpK/srzJ
	aeOeQuvy7TX65vAKcnizUIptGUgD3I37OoEY1gX1imisG+4JVwTQoQmwekuHf55P
	SdTs5UrdwLlMDkQhIEF1hSH752cpuFUHY6BKJf01wEcWhzjbcne0+Dwif5rwpHDr
	RsHO+Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4xep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 18:29:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 877F4400E2;
	Tue, 25 Feb 2025 18:28:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6783C4C5307;
	Tue, 25 Feb 2025 17:09:41 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 17:09:40 +0100
Message-ID: <b257aa79-6ca9-4f57-988a-ec00225992ab@foss.st.com>
Date: Tue, 25 Feb 2025 17:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp25
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-7-9d049c65330a@foss.st.com>
 <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <418a80a9-8c08-4dd1-bf49-1bd7378321aa@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_093010_876454_C4D2A79C 
X-CRM114-Status: GOOD (  12.60  )
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

On 2/25/25 14:05, Krzysztof Kozlowski wrote:
> On 25/02/2025 09:48, Clément Le Goffic wrote:
>> Add the hdp devicetree node for stm32mp25 SoC family
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> index f3c6cdfd7008..43aaed4fcf10 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -918,6 +918,13 @@ package_otp@1e8 {
>>   			};
>>   		};
>>   
>> +		hdp: pinctrl@44090000 {
>> +			compatible = "st,stm32mp-hdp";
> 
> So here again - you have stm32mp251 SoC, but use entirely different
> compatible.

Ok so I will use "st,stm32mp15-hdp"

> Same feedback as with previous patchsets from ST. Please take it inside,
> digest internally and do not repeat same issues.
> 
> Best regards,
> Krzysztof

Best regards,

Clément

