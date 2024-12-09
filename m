Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3A1E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZjFl9rcyGOLqHb8y82twubUUb+uASW6djdfphkNt8U=; b=e05f8r8CU0WvECjn5luVibI0Js
	ErAw/PsF3Mwu/tmbrnYISdYGKWyNOM4HpNPC95f6E5/WyPzmcQmfYN9Ij7JCOdrKmaulNVVIPba+Z
	U7fTgQ8Elp69wxbzlarK++9E4CS+X6YvOu6WNEImp1KrW8DsQzDmlkLL7q9C4e3AaeQHPq7hHgHxx
	jZiFMg85zcOAwgjmCufjGWWVg9URhBN/LIK4qkyjSSkFJ+Q2ANsr8b1gxeM+AzbWVuHYlC0DjkJvn
	fkeDkFArIFh5Ns/MxdOGdGbprFT50KpnYGTz06erZbp7Q8CXuQMreV0ggD7+/zUYW1rKE4fFFFCkO
	0uF2HU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKho0-00000008lnc-3ZEg;
	Mon, 09 Dec 2024 17:44:24 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhly-00000008lTL-3xKi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:42:20 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9F6MYk011882;
	Mon, 9 Dec 2024 18:42:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xZjFl9rcyGOLqHb8y82twubUUb+uASW6djdfphkNt8U=; b=aH61OSCzXdA06GTq
	h3akdMopXpK2VO64BUhD39kzFl3YbtiI8X1EMm2lIUIWywxFmLJeEoZHlB5MCF2I
	9z/PqNfmloyqBkJJhU00dcx1Ehmxxy+mTWQC43teI0LCGsZ1J9v5QqR7zfJl/4yD
	dQ09GhJaUr0YTPix0ckzQighTJu8bcIT3NBTNrBS/yihAUfQfQKopnP+TBJK1d6D
	xM5IG7KXnrcT4yWg6FBiDZ53QIvyOfN8Oh9UfsHZc9JLt+0cKHgUzu5ohLmIARiR
	nT7oMew0UoUFykPNwXVrzU9fKYII/EipYam5UM6pOJ3yKb7jUrl12msl0vJOd3XM
	w/DqQw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9ghmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 18:42:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 04BA84004D;
	Mon,  9 Dec 2024 18:41:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B005287934;
	Mon,  9 Dec 2024 18:40:24 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 18:40:23 +0100
Message-ID: <b7152e15-105a-4a49-860f-b408cd5c3349@foss.st.com>
Date: Mon, 9 Dec 2024 18:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Sort M24256E write-lockable page in DH
 STM32MP13xx DHCOR SoM DT
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob
 Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@dh-electronics.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241105234106.162610-1-marex@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241105234106.162610-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094219_268245_6470640B 
X-CRM114-Status: GOOD (  14.41  )
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



On 11/6/24 00:40, Marek Vasut wrote:
> Move the M24256E write-lockable page subnode after RTC subnode in
> DH STM32MP13xx DHCOR SoM DT to keep the list of nodes sorted by I2C
> address. No functional change.
> 
> Fixes: 3f2e7d167307 ("ARM: dts: stm32: Describe M24256E write-lockable page in DH STM32MP13xx DHCOR SoM DT")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> index 5edbc790d1d27..a181d5a816f69 100644
> --- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
> @@ -201,17 +201,17 @@ eeprom0: eeprom@50 {
>   		pagesize = <64>;
>   	};
>   
> -	eeprom0wl: eeprom@58 {
> -		compatible = "st,24256e-wl";	/* ST M24256E WL page of 0x50 */
> -		pagesize = <64>;
> -		reg = <0x58>;
> -	};
> -
>   	rv3032: rtc@51 {
>   		compatible = "microcrystal,rv3032";
>   		reg = <0x51>;
>   		interrupts-extended = <&gpioi 0 IRQ_TYPE_EDGE_FALLING>;
>   	};
> +
> +	eeprom0wl: eeprom@58 {
> +		compatible = "st,24256e-wl";	/* ST M24256E WL page of 0x50 */
> +		pagesize = <64>;
> +		reg = <0x58>;
> +	};
>   };
>   
>   &iwdg2 {


Applied on stm32-next.

Cheers
Alex

