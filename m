Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A43CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z19yKbO3LCKIzQcz2PHHAI/22TUE4jSnaLNrPGkt5ME=; b=Zf2CMHRQT4fV00KY7K8+RSQh0g
	NUJNF+l2hOXQ0WrzldF6CmZT4NblcVr6gcPYDb2LE6c/+pbovUdKSeTSPkW/s8iB3FomI3phdCU2z
	kh+rgnLJ/iC4Ij7ubtbZaVMt6tkXO2NZ09yNcDTr8TV+yxr5Yn+eW/Es4ZTb3Q/8PBaO5r90uKebi
	fck3mMjYSWa/WTpwZ6EPk0NziZmPTerknTuqtoQWT1rk6dGKRu10z10rP/5HcJPZfedRJ1pdgg0PY
	v9QJvMJI6tzy51Gnnhe95rRfQ4eOCE6smbpdjRCkJ7YJh9+7ZP2wdSx7f6O6jD2Ehm+HZrNrAneO4
	9wD2kD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Hv-0000000GZ7k-3Tel;
	Tue, 21 Oct 2025 10:08:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Hu-0000000GZ6n-2toc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Oct 2025 10:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=z19yKbO3LCKIzQcz2PHHAI/22TUE4jSnaLNrPGkt5ME=; b=VINdg6jfBhjnG4Y+DLplazCQEx
	dKNgNCut8js/0VZ08tB1A1BcxTkeICU+vgg57CfXkguCO/GZtsfw6dMik3zLXZ5n1DMiSzqRZodnY
	Pn1aCjpZV788N0bRq0N9+6pfRo8X6RxcnpMHmTgQ7/rDEF9W9hak6xnC3fnm3+K0q/Oirnf5CeM53
	PPzrg5xWbM9STURd0+DdrkUgDiJ7m79slx6jNrmv73+rPbC90Q9PvYKHtTcZLKo/S25d0U6P8fB1c
	WxmLgiX8ShfWYnHIz8HQk6uvmfkSCGujU4yk9XYxJkHXaBT3zD3ggWtw1ClhkNu9KPUBEv82E7eA4
	J2QHgj9g==;
Received: from cp2.siel.si ([46.19.12.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8Q6-00000000f1o-3cRk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z19yKbO3LCKIzQcz2PHHAI/22TUE4jSnaLNrPGkt5ME=; b=fide4FWO8OBpK3HmHLqFwieuP+
	F5boLy0JKRmGFRUd7DrV9XMBjKFKErS0xtQ46xaUxjaplqFJxnHsqZfafGZ+uWUTo26+4peQR5r+A
	Ly+5W/GZx9u+Ta6fdSQz/dyDiS1lXPUdHyqs4bRvcOpOaAv/oC5XPh/vkmkwz402GOamO7ji3yFdz
	FMzaNUJeyBsEN4mPzc4PBxZdtflMIlIVoSNX8XOq0+in+bJMipZrGnzrfyfdh2OVsV3LQqrncG56M
	w1wywUU+faxTQvsuZkFmjYHYVsRJgojlb4pJDntsIWFl95xKkXY0wu9rvdArgaXyXSqTOkvDR52+C
	04I7BzVg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:48078 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vB9Gu-00000004MzS-34CR;
	Tue, 21 Oct 2025 12:07:14 +0200
Message-ID: <4979a32f-f938-4956-8293-eca5667bf1c4@norik.com>
Date: Tue, 21 Oct 2025 12:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Add phyBOARD-Segin-i.MX91
 support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <20251021093704.690410-1-primoz.fiser@norik.com>
 <20251021093704.690410-2-primoz.fiser@norik.com>
 <20251021-bright-brave-dolphin-906891-mkl@pengutronix.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20251021-bright-brave-dolphin-906891-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_101243_318131_D0188A85 
X-CRM114-Status: GOOD (  15.31  )
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

Hi Marc,

On 21. 10. 25 11:50, Marc Kleine-Budde wrote:
> On 21.10.2025 11:37:04, Primoz Fiser wrote:
>> Add initial support for the PHYTEC phyBOARD-Segin-i.MX91 board [1] based
>> on the PHYTEC phyCORE-i.MX91 SoM (System-on-Module) [2].
>>
>> Supported features:
>> * Audio
>> * CAN
>> * eMMC
>> * Ethernet
>> * I2C
>> * RTC
>> * SD-Card
>> * UART
>> * USB
>>
>> For more details see the product pages for the development board and the
>> SoM:
>>
>> [1] https://www.phytec.eu/en/produkte/development-kits/phyboard-segin-kit/
>> [2] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-91-93/
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>>  .../dts/freescale/imx91-phyboard-segin.dts    | 344 ++++++++++++++++++
>>  .../boot/dts/freescale/imx91-phycore-som.dtsi | 304 ++++++++++++++++
>>  3 files changed, 649 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 525ef180481d..34a81d34de39 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -344,6 +344,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>>  
>> diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
>> new file mode 100644
>> index 000000000000..bb631439f9cf
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
>> @@ -0,0 +1,344 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
>> + * Author: Christoph Stoidner <c.stoidner@phytec.de>
>> + *
>> + * Product homepage:
>> + * phyBOARD-Segin carrier board is reused for the i.MX91 design.
>> + * https://www.phytec.eu/en/produkte/single-board-computer/phyboard-segin-imx6ul/
>> + */
>> +/dts-v1/;
>> +
>> +#include "imx91-phycore-som.dtsi"
>> +
>> +/{
>> +	model = "PHYTEC phyBOARD-Segin-i.MX91";
>> +	compatible = "phytec,imx91-phyboard-segin", "phytec,imx91-phycore-som",
>> +		     "fsl,imx91";
>> +
>> +	aliases {
>> +		ethernet1 = &eqos;
>> +		gpio0 = &gpio1;
>> +		gpio1 = &gpio2;
>> +		gpio2 = &gpio3;
>> +		gpio3 = &gpio4;
>> +		i2c0 = &lpi2c1;
>> +		i2c1 = &lpi2c2;
>> +		mmc0 = &usdhc1;
>> +		mmc1 = &usdhc2;
>> +		rtc0 = &i2c_rtc;
>> +		rtc1 = &bbnsm_rtc;
>> +		serial0 = &lpuart1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = &lpuart1;
>> +	};
>> +
>> +	flexcan1_tc: can-phy0 {
>> +		compatible = "ti,tcan1043";
>> +		#phy-cells = <0>;
>> +		max-bitrate = <1000000>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_flexcan1_tc>;
>> +		enable-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
>> +	};
> 
> I think the tcan1043 is a CAN-FD transceiver. According to the datasheet
> it support 2 MBit/s and 5 MBit/s in the "G" variant. However due to the
> board layout, etc, the actual bit rate might still be limited to 1
> MBit/s. Ask the HW engineers if in doubt.

phyBOARD-Segin actually uses a TI SN65HVD234D CAN transceiver chip which
supports up to 1MBps. See [1].

However since there is no direct support for SN65HVD234D we model the
enable signal with the generic PHY driver and use "ti,tcan1043" jsut as
compatible. Suggested by Frank and you in [2].

[1]
https://lore.kernel.org/all/20250415043311.3385835-12-primoz.fiser@norik.com/

[2]
https://lore.kernel.org/all/1571414e-5e7d-4c9e-b69d-11a6fdf454e2@norik.com/

BR,
Primoz

> 
> regards,
> Marc
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com


