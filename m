Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B2EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CuW4XhQKZb8IjoxJvFGlJFEMyWtcoqQnz4Is5XWIhk=; b=t3frb8dSWtPTriFRp/eXIL2RHE
	giqI4wWXNuDu5F5M94rAbJy7wzVbT2aCyMzYdfC359gpKJjGhIkf97en1LuigdtijLR7lUgpHqMw4
	x5V/D2jI0zlwc3i+GlIGZuVMjrbuo8/Vkeb7p88zI5nGLb0//6Q16lSgkw47YvmQmAkjWjlaZ96SL
	w0m5a7F3p/b1SFPuJsq8UA5GWtLgWA+3xAmlB+I3U9xfIQXWs6PRdEzmDiNPcbFdL/4ve/P+pZLqb
	x8XAHaWGAoA/i072T/srdoChc//TFlDq0O/0AvRwcrlf1qhO683EuqdOrv7z2WHjJEZNE6aR0UY6Y
	xMagSWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZllO-0000000B17t-3Jic;
	Thu, 10 Jul 2025 07:32:14 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkn3-0000000Askt-1v38
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:29:54 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56A6TouM1414345;
	Thu, 10 Jul 2025 01:29:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752128990;
	bh=6CuW4XhQKZb8IjoxJvFGlJFEMyWtcoqQnz4Is5XWIhk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=KtblvU/fpv2GmZUY/zvs0Q+i+9qAEVpjvWl5gOhpwXy1uaLrN706DnjNcQ8/TemM5
	 gTcjYTy7orGwVK4vsHySy0YpfVEeLT9lSjxHhlhEvE8jLi6WgDUXOE/b/y4xVvU77q
	 MR5VPjViM29uDyy4htqbY2zRGnGZfPKBPBkSZ22Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56A6ToM1949606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 01:29:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 01:29:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 01:29:50 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56A6TlbN872775;
	Thu, 10 Jul 2025 01:29:47 -0500
Message-ID: <83c5d0b8-add8-4db7-bcde-5b17c796b53a@ti.com>
Date: Thu, 10 Jul 2025 11:59:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am65: add boot phase tags
To: Bryan Brattlof <bb@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250709-65-boot-phases-v1-0-e1f89d97a931@ti.com>
 <20250709-65-boot-phases-v1-1-e1f89d97a931@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250709-65-boot-phases-v1-1-e1f89d97a931@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_232953_549251_321D96EB 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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



On 10/07/25 04:05, Bryan Brattlof wrote:

[...]

> diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
> index 7cf1f646500a16c1d1bac6dfb37fb285218063b3..5bbd817bc51464f6605c5b2dc9cb544a109a695d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
> @@ -211,6 +211,7 @@ mcu_ringacc: ringacc@2b800000 {
>  			ti,sci = <&dmsc>;
>  			ti,sci-dev-id = <195>;
>  			msi-parent = <&inta_main_udmass>;
> +			bootph-all;
>  		};
>  
>  		mcu_udmap: dma-controller@285c0000 {
> @@ -235,6 +236,7 @@ mcu_udmap: dma-controller@285c0000 {
>  			ti,sci-rm-range-rchan = <0xb>, /* RX_HCHAN */
>  						<0xa>; /* RX_CHAN */
>  			ti,sci-rm-range-rflow = <0x0>; /* GP RFLOW */
> +			bootph-all;
>  		};
>  	};

Should this be board specific property? Does every user of AM65x need
DMA at boot stage?

[...]

> @@ -107,5 +111,6 @@ wkup_vtm0: temperature-sensor@42050000 {
>  		reg = <0x42050000 0x25c>;
>  		power-domains = <&k3_pds 80 TI_SCI_PD_EXCLUSIVE>;
>  		#thermal-sensor-cells = <1>;
> +		bootph-all;

Same here..

>  	};
>  };

-- 
Regards
Vignesh
https://ti.com/opensource


