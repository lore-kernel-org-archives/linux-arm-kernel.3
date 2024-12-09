Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A648CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2BGA9jU8VfghUQrUN6Yf64Ypr7lE8Oudb0vhFn8vD4=; b=GAIkDpQQYA9XSeL3UPNhubyb0g
	x5CNtSoR/7V1eZF+2ulyWnwxsFRCe3jrvEu5Qe8fGmh1nLrcumQm9vdtwG5ENY0zPKYksAIdnQGzD
	o0PjG5XkMUsXl+cgFklWa8Md2zass0KFG8MjeNCG2RsthTpj1Ih0xy474C9X65CVod6Pcrgyj+adI
	Bkk6rYE/4KdBFY3fYwKIGP756O75hVo7vB3044QvOMUi71L5iyrFPs7LVb3Rtyqx+3YMeUH2rCe3E
	S9wSwgjKnU6LeY6g2Q1nX3Ejube0fVJavYfb5K3hHRR8SAA6HNnHzYZR934j/mMqiqRRPj2WwE2cP
	aoZQqWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhp1-00000008m3b-1roX;
	Mon, 09 Dec 2024 17:45:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhmb-00000008lWH-1JbN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:42:58 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9DaPDf014876;
	Mon, 9 Dec 2024 18:42:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Y2BGA9jU8VfghUQrUN6Yf64Ypr7lE8Oudb0vhFn8vD4=; b=pLL2eUEcNSIPxR+Y
	DYvWd4VIezOUREwXUmEvNLjuClUvdPgemUUajj84xw7U3VuY3+K3fiXGojGRZrDB
	+cCihAc4j19/fVMYmxGkDoPbqh+8fTY0ZvyOivmQd6PaJfF/RJrN8ZE6I8NOlHDQ
	L6cAx941WpCGlg5pPgEBONjjJSIV5lwUyHo8chwyNtu0tdpo4YMaJqof9lpfcSaj
	1D20lDpg4388e2Ur0aMtUns9w1BVmu9n6277V2IFD8h+WFmghkkNQUMp0dx1rUaD
	2maF9H/CKcMSuHV/2i2g5KKxqnn0SCbSBVupzm1yz80MtKHlIkJU1I9jn5PUnQoE
	unLFeg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnm1922-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 18:42:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 874D740044;
	Mon,  9 Dec 2024 18:41:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 348E72898EE;
	Mon,  9 Dec 2024 18:41:03 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 18:41:02 +0100
Message-ID: <7b0b43c8-0396-4a61-b8fc-6bb277f3a63b@foss.st.com>
Date: Mon, 9 Dec 2024 18:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Increase CPU core voltage on STM32MP13xx
 DHCOR SoM
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob
 Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@dh-electronics.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241105224728.147384-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241105224728.147384-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094257_661453_5F793E0F 
X-CRM114-Status: GOOD (  18.25  )
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

Hi Marek

On 11/5/24 23:46, Marek Vasut wrote:
> The STM32MP13xx DHCOR DHSBC is populated with STM32MP13xx part capable
> of 1 GHz operation, increase the CPU core voltage to 1.35 V to make
> sure the SoC is stable even if the blobs unconditionally force the CPU
> to 1 GHz operation.
> 
> It is not possible to make use of CPUfreq on the STM32MP13xx because
> the SCMI protocol 0x13 is not implemented by upstream OpTee-OS which
> is the SCMI provider.
> 
> Fixes: 6331bddce649 ("ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> index 07133bd82efa6..8630de147a52b 100644
> --- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> @@ -85,8 +85,8 @@ regulators {
>   
>   			vddcpu: buck1 { /* VDD_CPU_1V2 */
>   				regulator-name = "vddcpu";
> -				regulator-min-microvolt = <1250000>;
> -				regulator-max-microvolt = <1250000>;
> +				regulator-min-microvolt = <1350000>;
> +				regulator-max-microvolt = <1350000>;
>   				regulator-always-on;
>   				regulator-initial-mode = <0>;
>   				regulator-over-current-protection;


Applied on stm32-next.

Thanks!!
Alex

