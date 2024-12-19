Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B494E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkrwmwyQmzawkZWLeCbcqyudcq/7obCIQjFzSFN9/tU=; b=2tWTH8SZ1B6RWtXjdL/4vAFF1w
	jMf6w59f4f+rN5UbhbMOTouCAya2jt4fbnWWSlLzuXU8PJ/S6NP/WbMzvugGDMab52ny5sC30SliM
	0jhbPavd8Y8/szzDMBs1tMniiSpbWavbqVDtsLAMRu0MWfbQFuN/cYkiDhJQlBtyTVjSilPB2T7ag
	FqI8FRWfIFE3PntiS3M2sbMNpAiVpMAoFJvsAbg3oNHdhFNo5OpUELd2FkvLA5X0rtHVzRJfsKgUG
	MnbhTgWu0eovNlGkg/Rm7Z5b1jyF2xi+aY14C2UHJdCjCfe7gYCJoYlOPpskDIZtUn6VgtLx6LJpG
	5G77EN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCPl-00000001Lgq-2jTk;
	Thu, 19 Dec 2024 09:01:49 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCOe-00000001La0-39oJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 09:00:42 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ1Rh8o017817;
	Thu, 19 Dec 2024 10:00:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	UkrwmwyQmzawkZWLeCbcqyudcq/7obCIQjFzSFN9/tU=; b=u8p4Xz2yp6n/8tHE
	/ixidmxQ3dasVRW/tWEiP3IqNVZxIYRY0pGCZOEp4Pq6FgYsfiotzHefBwI3n0wC
	tC1JHcII3o0MuROT3fgmvHGh/usRKjqSHGT0ioTdieS1LwFsSqQ1XkuUeeSTs+/g
	RAkyX9lCWMgbd7pdzJ//6utAPaamij3z7VZ1f8KN9sJZLCHkxAlwXJlEn6gsUhlr
	n25fOvtUnJyN2PmizKakl93KiHiyPJSsd3xpDBLGBeQ6x6mVw7fGRWbhKtyTyCJJ
	ExAppIk8T1p+oIULJAFebFC5m0uVbVH9hTQEhQnzhW5XpcTb4I71aM8bMzFhdIXW
	fxtF/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43m9ug1d12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 10:00:16 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F147F40052;
	Thu, 19 Dec 2024 09:59:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E18B258D62;
	Thu, 19 Dec 2024 09:57:48 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 19 Dec
 2024 09:57:47 +0100
Message-ID: <a765a687-3d53-4ce8-aab3-e8a1d4adccf6@foss.st.com>
Date: Thu, 19 Dec 2024 09:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Swap USART3 and UART8 alias on
 STM32MP15xx DHCOM SoM
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@dh-electronics.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241213223658.99802-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241213223658.99802-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_010041_090919_9A46B8BC 
X-CRM114-Status: GOOD (  14.48  )
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

hi Marek

On 12/13/24 23:36, Marek Vasut wrote:
> Swap USART3 and UART8 aliases on STM32MP15xx DHCOM SoM,
> make sure UART8 is listed first, USART3 second, because
> the UART8 is labeled as UART2 on the SoM pinout, while
> USART3 is labeled as UART3 on the SoM pinout.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 086d3a60ccce2..142d4a8731f8d 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> @@ -15,8 +15,8 @@ aliases {
>   		rtc0 = &hwrtc;
>   		rtc1 = &rtc;
>   		serial0 = &uart4;
> -		serial1 = &usart3;
> -		serial2 = &uart8;
> +		serial1 = &uart8;
> +		serial2 = &usart3;
>   	};
>   
>   	chosen {


Applied on stm32-next.

Regards
Alex

