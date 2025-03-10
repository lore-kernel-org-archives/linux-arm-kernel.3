Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272D5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfbmKwc6v1yeOOE9JCszYxgrUac0n2yNInRPRE4qjhw=; b=c6Yghkbgrmi1uUNHvDOD60kbEp
	A0Kbx5EbCpAMKDy0x7EaHzd3Mkjpt1t7oUqVjb8wtJf03rYeVS2inDxwxv4kCZBUxv4mTE6dSX9rS
	M4TGs8jKw/6gDnhGjoAtZqvwky2NR5LRceu4T0njkiLNxCyxq6gGvqM9odmNg2OWS0ZRHuiwL2MUQ
	gweJXj8PG1lGjjI4jLxtjLEIMhRAV7KHdUgXJbHHzs9d2s/FlGDroB+ezUyvxvLbuvhwDKvK3CdJH
	Kz+ThzatvCJJub5qQFFr2B5VdYGjabPeipekohXpiFgSqgvKj5bUQuK8HJ2JOH1ZvgCaBeWpK6cLn
	6AMWwJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbJu-00000002Qtp-1rxs;
	Mon, 10 Mar 2025 11:29:18 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traiU-00000002Jdu-419f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:50:40 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9G8gL017253;
	Mon, 10 Mar 2025 11:50:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dfbmKwc6v1yeOOE9JCszYxgrUac0n2yNInRPRE4qjhw=; b=ko9A3bkKtA24VlrH
	kBrInCzGMbc4p6W9TWc+ruaxkYw5Q7OnYOa2X466UnvXzzEbUPIMegQiHSRnwBgd
	8F3W5l9bE3VuWTdsPcZcZOPwOjZ6xaAHaqIZ9MrmyYSMN7tgU6/EjQr6/0O/Pd+K
	PbDr1N0RlYzTry9IXisVbuJ0gCRUbazozF3tUv3CEijRX4zS7TWdwwNIc627QMBF
	yn/bwId8jPVcoOiypBuE7hE16cVmRkgC5r7IB/4KsjbRIr5K8YS6VlmDBBWIZhyo
	gv7IP6y4rZgm/ifysDFv493rnbw6a48ISxAfEruYHXnugrCDBnyoBZvMzploIIHN
	W574Xg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4590b8v7t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 11:50:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9377640057;
	Mon, 10 Mar 2025 11:49:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 543A54235AC;
	Mon, 10 Mar 2025 11:48:37 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:48:36 +0100
Message-ID: <e5a5dd9b-475b-4c66-a580-08f11a80e5a3@foss.st.com>
Date: Mon, 10 Mar 2025 11:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING on
 stm32mp157c-dk2
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-amarula@amarulasolutions.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_035039_306220_8550644B 
X-CRM114-Status: GOOD (  14.24  )
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

Hi Dario

On 3/1/25 12:51, Dario Binacchi wrote:
> Replace the number 2 with the appropriate numerical constant defined in
> dt-bindings/interrupt-controller/irq.h.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> index 5f9c0160a9c4..dcf17c493022 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
> @@ -11,6 +11,7 @@
>   #include "stm32mp15-pinctrl.dtsi"
>   #include "stm32mp15xxac-pinctrl.dtsi"
>   #include "stm32mp15xx-dkx.dtsi"
> +#include <dt-bindings/interrupt-controller/irq.h>

really needed ? as it comes also with 
dt-bindings/interrupt-controller/arm-gic.h

>   / {
>   	model = "STMicroelectronics STM32MP157C-DK2 Discovery Board";
> @@ -67,7 +68,7 @@ &i2c1 {
>   	touchscreen@38 {
>   		compatible = "focaltech,ft6236";
>   		reg = <0x38>;
> -		interrupts = <2 2>;
> +		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
>   		interrupt-parent = <&gpiof>;
>   		touchscreen-size-x = <480>;
>   		touchscreen-size-y = <800>;

