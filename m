Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EDDC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsJ35DXIFyb8IUUDkRLbnd+X8cIaumQnRj2kaGGtJi8=; b=f+xBoncff4Dx1IE7cJGfWs/+Yy
	jdK8rf9LykikuTIPS/C9PfBViPwFYgXIpJVROn1flCQAyP6iHCUPTECqupZfBUDN9kPcN9QU7q7Qc
	b2PhHczE2zZNqbzcI8etI4t8AHuRRAc2NMdDF0vUHmX6MFvE5rKce6UoJJ22E4GK7niZUS3NmfIVX
	wFtLg6RxvIgCW2kDJ0lahnOOCVJzDEp9FTTn3Bv63opig+W5ecWBBgBC+XtPXoJoJQlXISmW2+jxK
	h29uxF/R9hc02k2HL+0k2FSUQgMWV5pResfK+xBPnZz7O6XXLPI2G/8IzJw+Ug501Yya9zYeCPmkF
	QRKhFwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdwi-0000000E7Fx-2aS8;
	Fri, 04 Jul 2025 10:47:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXccX-0000000Dv0W-1N2H
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 09:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xsJ35DXIFyb8IUUDkRLbnd+X8cIaumQnRj2kaGGtJi8=; b=oS6I0MIvgntXLgyfyXD49GxqbP
	R/94GdJealGU9K0ZuioJGnY74jXcfNU8RpGmLWTTKafFObt8HGT9e5hJvf2C8dgktnoVTRmaq+61e
	RzoEdfvSeJbpayDTK39pgW9llliF+TGDN/gSnemHA/SX60WENjOMfEZpmKw7UKs4ijmTQLrXB2iCU
	tLfuGHKdB4N3Vd6iv4IT8KR+YYKgKT4fGNDNWxmJInbpe0P05/CH5xnrICN5jF/7abO/9UfU71nRi
	ise9e5s4/LOqDP/XHpuMcCg7MwaWIMnHLWTvIzPGoIU51YDkJznvDHjv9GH3/nQ/IZ8Og7EdHXpsn
	UCK08Vig==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXccU-00000007u9b-22GW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:22:12 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZvmT028297;
	Fri, 4 Jul 2025 11:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xsJ35DXIFyb8IUUDkRLbnd+X8cIaumQnRj2kaGGtJi8=; b=sNef83OIHgj3F115
	o4AALg+zZxQDdJCTO6KCuqgN/pa5mBGofZMlMVo+nveSjlE5cIFp4k8voMjRgUd9
	nFbIfhETkVp2+ZH3XAYApA6FgTFwhVfzudS0Ai1+wz373rWqbrUws4vo4K6MPyuT
	5jotQEMIhZG/ggNhBMCXEh3hiurcV8nK8Amcjy96DMGzMQXjj8Cnb0OGW5EncJAT
	hKb7F7T6VtpEmcu7Mx2k9o6NqSGRm4ue7qI7TYkcwTDszxDDfGekhrj/cSZFZwgO
	PIlXznP+370DUfnC5BpQ2oeuVy2jNhWPMk0FahSGvblDDyolZ8dU2dCHFOpSXfN4
	AwvQ2w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j5tmmj89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:22:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 53E7D4004F;
	Fri,  4 Jul 2025 11:21:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60B8BA5594F;
	Fri,  4 Jul 2025 11:20:37 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:20:36 +0200
Message-ID: <ec89779f-2193-42a1-b980-de904be9d388@foss.st.com>
Date: Fri, 4 Jul 2025 11:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: add system-clock-direction-out on
 stm32mp15xx-dkx
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250521150418.488152-1-olivier.moysan@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250521150418.488152-1-olivier.moysan@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_102210_716386_1FC37E9F 
X-CRM114-Status: GOOD (  14.13  )
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

Hi Olivier

On 5/21/25 17:04, Olivier Moysan wrote:
> The commit 5725bce709db
> ("ASoC: simple-card-utils: Unify clock direction by clk_direction")
> corrupts the audio on STM32MP15 DK sound cards.
> The parent clock is not correctly set, because set_sai_ck_rate() is not
> executed in stm32_sai_set_sysclk() callback.
> This occurs because set_sysclk() is called with the wrong direction,
> SND_SOC_CLOCK_IN instead of SND_SOC_CLOCK_OUT.
> 
> Add system-clock-direction-out property in SAI2A endpoint node of
> STM32MP15XX-DKX device tree, to specify the MCLK clock direction.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> index a5511b1f0ce3..c74e36676d1b 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> @@ -515,6 +515,7 @@ sai2a_endpoint: endpoint {
>   				remote-endpoint = <&cs42l51_tx_endpoint>;
>   				dai-format = "i2s";
>   				mclk-fs = <256>;
> +				system-clock-direction-out;
>   				dai-tdm-slot-num = <2>;
>   				dai-tdm-slot-width = <32>;
>   			};

Applied on stm32-next.

Thanks !!
Alex

