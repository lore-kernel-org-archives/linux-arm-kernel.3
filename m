Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7704AD3A66B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+/H3pqYnfyIgN4uUTX5uKa1/8V4zVKPQSaYRI/UZRA=; b=mhH1yL90tRvl2BpkDh7rUV3qmW
	WMigmZg+6v/GFSDUfuUKgeVySf7SUpdgKbEayxRgpHdHCfzRRsNyRBckpeNzXbEz9gkERTeKEWaSK
	cVSCEvUHCRyHtXMGu1OT2Od187NY8p0Mvr+gElw3+PefgMj/vVbk+LxbKvm/QQ0PvS29486MCjeHe
	zXXo958jcbzYEqpvXlAgNPkqOursnSbGCUn4xe/bOFLjrdd+uBTpLGi/7e9jLtyM3DXPpmdh/Diti
	bNl8cgAcikDhK2lL6cjbVWQP0WQmvLVdOn7/NmfLjXnxdm2h1nrxeMcH3cf3TKnCGb4Wxb0Uxrp6h
	VTFTfdYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oQS-0000000Ez7V-2rGV;
	Tue, 29 Oct 2024 15:46:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oBR-0000000Ew1O-27hY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:31:03 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCRjnj014244;
	Tue, 29 Oct 2024 16:30:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	R+/H3pqYnfyIgN4uUTX5uKa1/8V4zVKPQSaYRI/UZRA=; b=OVNmKCRko1YzY2kL
	5Z4zEd9acvr9AXfrhBP3j4XJ3vOlg+SkFkMqjbC+p1GB9ZRKKothnz5GqlN3nfJn
	t/lqY+G/f7lpgiWsV7KBtugZaU3rM+eUeqqNA1IOLhTo9WNP+SEgCADKeHTPuR16
	5soEjoVxw5N7CB9ARbgnYVP+md1s4/N6hgsNbCsVHRT32l2l5kfTCXzZGEHgxm75
	tQgg4K3mfTDS1mReIuphJvwgxKfEUKSPcwLNzBONVDEx+dboffGGBRrFnRTZq2qe
	Py9bM3Ptf6tXUgobwCmE7/kDZEgvdWca6f3nqIMMdxRubBEIqEv3jd6Y0a6SLUXB
	aPdH5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42hbchmh24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 16:30:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 10C8540044;
	Tue, 29 Oct 2024 16:29:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2CB95263877;
	Tue, 29 Oct 2024 16:28:47 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 16:28:46 +0100
Message-ID: <b616628b-f9e3-42dd-b5dd-e7aa0235daae@foss.st.com>
Date: Tue, 29 Oct 2024 16:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: stm32: Describe M24256E write-lockable page
 in DH STM32MP13xx DHCOR SoM DT
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241017190933.131441-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241017190933.131441-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_083101_875561_88778EFD 
X-CRM114-Status: GOOD (  17.49  )
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

On 10/17/24 21:09, Marek Vasut wrote:
> The STM32MP13xx DHCOR SoM is populated with M24256E EEPROM which has
> Additional Write lockable page at separate I2C address. Describe the
> page in DT to make it available.
> 
> Note that the WLP page on this device is hardware write-protected by
> R37 which pulls the nWC signal high to VDD_3V3_1V8 power rail.
> 
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
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: Fix up the M25256E in Subject
> ---
> DEPENDS:
> - https://lore.kernel.org/linux-i2c/20241017184152.128395-1-marex@denx.de/
> - https://lore.kernel.org/linux-i2c/20241017184152.128395-2-marex@denx.de/
> ---
>   arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> index 5c633ed548f37..07133bd82efa6 100644
> --- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> @@ -202,6 +202,12 @@ eeprom0: eeprom@50 {
>   		pagesize = <64>;
>   	};
>   
> +	eeprom0wl: eeprom@58 {
> +		compatible = "st,24256e-wl";	/* ST M24256E WL page of 0x50 */
> +		pagesize = <64>;
> +		reg = <0x58>;
> +	};
> +

You could have sorted nodes by I2C addresses.
Anyway, applied on stm32-next (as dependencies have been applied by 
Bartosz).

Cheers
Alex


>   	rv3032: rtc@51 {
>   		compatible = "microcrystal,rv3032";
>   		reg = <0x51>;

