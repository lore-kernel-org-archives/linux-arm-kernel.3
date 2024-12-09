Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26DEE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLYbGt0hoBREp9nuzUjHJqQgP5LBORvzofcGEX3ZeW4=; b=sF825ne5QFBBY/Jfz6nQTuykKr
	QVM7ZUYL8ekSbAk8fhQxhTOiAz0P5qnJiRxBRua4T68xLNFhB5ATbAwOeGCv8jwjYM4/nC5f/eT95
	lHM5cDvTvhwsuDfzlCoYrAFVp7ewpS4FwScpS//SwFvOHEJihEPXAkjSHyjei0Nv6LimJvm400XPE
	MG70vHKhNOao2lRklJSkRjZOudemgpOqF6o1OuHHxXlnNq/TUT8/+3ufCuXtt2sjOSxJCw8KTM0PS
	BU90ZdA6kJBhhS8vz+dUgcChNS4GY+L0sJaNUxjE/iaUsh16s7kXS/lZ4Gwly1YiW55qLhj6mOHZR
	dyK19Zvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgZM-00000008XwD-0jsT;
	Mon, 09 Dec 2024 16:25:12 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgYJ-00000008Xnf-12jT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:24:08 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9F6MjX011896;
	Mon, 9 Dec 2024 17:24:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	tLYbGt0hoBREp9nuzUjHJqQgP5LBORvzofcGEX3ZeW4=; b=RCt5nFu61IbB9R+d
	uSSmR4Lb9COdG6D0DuY8PbS1DKv6DfZhdFesrw8Yyt1lt9zY5WPXoGr7hPQN5lNz
	ul1540+f92YjOoVCBGPxZ+cR/eNpefCmy7v67QEoF4DPLUXYHPtKgrN+atv7SO3s
	Z3DBU3X2ULqlPZ3a05HVH1MmtNqrpDKX2lymoTyffpSmk5TDbKFIww5EpPGCy8+J
	TncOXwxMgDHbNUbm1JaXKgIYfHIijKlsw57WBW/c/TCzPutCIwc8AYdrnQMmFM/J
	J0TkYZm6F6v6XHhnC+jedlzietvQyFSeBitLPXMa+oEX/5VoE2iFUQXHcPxiCmvj
	9xyeWA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9ga1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 17:24:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A94FF4005D;
	Mon,  9 Dec 2024 17:23:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 70EC72A278D;
	Mon,  9 Dec 2024 17:18:23 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 17:18:22 +0100
Message-ID: <4075e04d-dab3-40f2-9a64-760081cf47ee@foss.st.com>
Date: Mon, 9 Dec 2024 17:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: st: add spdifrx support on stm32mp251
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241105162141.712073-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241105162141.712073-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_082407_571507_B4829C70 
X-CRM114-Status: GOOD (  12.15  )
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

Hi Oliver

On 11/5/24 17:21, Olivier Moysan wrote:
> Add S/PDIFRX support to STM32MP25 SoC family.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 6fe12e3bd7dd..34970be2e0b3 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -267,6 +267,20 @@ spi3: spi@400c0000 {
>   				status = "disabled";
>   			};
>   
> +			spdifrx: audio-controller@400d0000 {
> +				compatible = "st,stm32h7-spdifrx";
> +				#sound-dai-cells = <0>;
> +				reg = <0x400d0000 0x400>;
> +				clocks = <&rcc CK_KER_SPDIFRX>;
> +				clock-names = "kclk";
> +				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&hpdma 71 0x43 0x212>,
> +				       <&hpdma 72 0x43 0x212>;
> +				dma-names = "rx", "rx-ctrl";
> +				access-controllers = <&rifsc 30>;
> +				status = "disabled";
> +			};
> +
>   			usart2: serial@400e0000 {
>   				compatible = "st,stm32h7-uart";
>   				reg = <0x400e0000 0x400>;

Applied on stm32-next.

Thanks!!
Alex

