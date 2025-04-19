Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9199C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnT6SpimH/suvUjF2ZXLGhM0wMOvau/mRpChBQiDxrQ=; b=VrCaDr86OBMvRiEOr1r/raH4rK
	g/EhfxalHt9GdrdQoWaOC1NZgoZPS1vsMj5HGkZb8QZPmmxwIzqdKJR/zcANdqbZywTbsrKEjmQLv
	4kIOzAnAG8r9Fm9D36IvF7XlDXaXGL7BSOM+ZD2kXZ8AOsQt+aGBz6zwXxpOVEqsXLiZ0AiGrMsb6
	a+MjSWtwkX4+Q5flECrmOAgWU+Gv95nlIL2t4VZmDPRgnhAm+f+ejt2y1mebTrzhS+abgHtkg84bH
	Imq6LdNxlXUUfs5wmcNEankdFXjgToO1IlIVAtQZq5RkUhoMMy8QDKeRXkIUVfFrAHSJMiNJjiao6
	Z6xiYWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69DH-00000001Ohe-1gM1;
	Sat, 19 Apr 2025 14:30:35 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69BP-00000001OZc-0ByX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 14:28:40 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53JESXnD512670
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 09:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745072913;
	bh=bnT6SpimH/suvUjF2ZXLGhM0wMOvau/mRpChBQiDxrQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vDHHg3drJ3ss897hg7P1UhiTvhAogx3/cclr3BePV84xckZIrWXh7z8Z0PMgy4j/+
	 YKS3G4eTfZ4k+Z3f3z5zpXDPhjiVs014BUotYgtp+WUGJSLbAKkrY3vHzu9hw1QP0N
	 TdQKGhrZsSF0VzllDILxmX3cEwRLvRs8oqX668sg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53JESXYO023232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 09:28:33 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 09:28:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 09:28:33 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53JESTrG107279;
	Sat, 19 Apr 2025 09:28:30 -0500
Message-ID: <a34e8c08-0259-417a-8312-9f6efbdccead@ti.com>
Date: Sat, 19 Apr 2025 19:58:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to
 enable USB0 Type-A
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <u-kumar1@ti.com>
References: <20250409100853.4179934-1-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250409100853.4179934-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_072839_221294_96CEC102 
X-CRM114-Status: GOOD (  18.51  )
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


On 4/9/2025 3:38 PM, Siddharth Vadapalli wrote:
> The USB0 instance of the USB controller on both the J742S2 EVM and the
> J784S4 EVM supports a single USB interface at a time among the following:
> 1. USB3.1 Gen1 Type C interface
> 2. Two USB2.0 Type A interfaces via an on-board USB Hub.
>
> By default, the USB3.1 Gen1 Type C interface is supported on both of the
> EVMs. Enable the USB2.0 Type A interface by configuring the USB2.0_MUX_SEL
> mux. Additionally, set the Dual-Role Mode to Host since a Type-A interface
> is only associated with the Host Mode of operation.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> Hello,
>
> This patch is based on linux-next tagged next-20250409.
>
> v2 of this patch is at:
> https://lore.kernel.org/r/20250226124245.9856-4-s-vadapalli@ti.com/
> Changes since v2:
> - Rebased patch on next-20250409 and dropped other patches which were
>    present in the v2 series.
>
> Regards,
> Siddharth.
>
>   arch/arm64/boot/dts/ti/Makefile               |  7 +++++
>   .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 +++++++++++++++++++
>   2 files changed, 36 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> [..]index 03d4cecfc001..c7f23fbce660 100644
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&exp2 {
> +	p12-hog {
> +		/* P12 - USB2.0_MUX_SEL */
> +		gpio-hog;
> +		gpios = <12 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "USB2.0_MUX_SEL";
> +	};
> +};
> +
> +&usb0 {
> +	dr_mode = "host";
> +};

Reviewed-by: Udit Kumar <u-kumar1@ti.com>



