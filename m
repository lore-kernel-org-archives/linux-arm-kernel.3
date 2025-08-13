Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2F7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhdtKws0AycCkK53UlJjP9D8XM/fNiJlo7puW4IHx5E=; b=1kb92EsBQtjqtbb6sxgVBvoGQp
	RUcrMAUnMnNVE7pnFUOgxoqzjYTGFDO9mcjSEvMD2lh0j6Ts8CEwk3Me5oa8ygWEVsZT41j8qwV3w
	d1/uxH6rOXqafr7Sz54DuDrIZm1ITJTMV6sJ6n/mXpkNci5ShKxoa3UgQAvAqvYizjeuBMtcyluTJ
	abglnEi7LWi6Ya9Cnj3Gz3TjFxf6XpOqB9VA23+sTj7lo6UHz5QcMHYkDW0gCoQgXfBBy8Hnoklyt
	0LxRb9JO+NC2UKDHWy3bUnL9CGBFpCVBoM0wo7QylfsJMiFDRITWZ0mANBIIlUZBU3e+nB4JPmoAA
	U1I7LDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDtG-0000000EHnU-14tl;
	Wed, 13 Aug 2025 15:59:50 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDFB-0000000EA0Y-3YpA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:18:27 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DFIKoi2101708;
	Wed, 13 Aug 2025 10:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755098300;
	bh=hhdtKws0AycCkK53UlJjP9D8XM/fNiJlo7puW4IHx5E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=N/bC7TtxNQJJOzYI0o6kQwioHEBrltAI+Dve+FQ9MVFTM6tAfffdiYiyhzGzzGWx+
	 n4SOIEE2IExuC1TIEMdDAu5Y9/ZIkuD+ogMymeMsPMyHivsDr4ko57xlEWXCsw/IRZ
	 TwsMXTHCIzi5bt9ArUEmDmX6957GL1M1F4iQYwm4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DFIKUM1163159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 10:18:20 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 10:18:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 10:18:19 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DFIJfm2495450;
	Wed, 13 Aug 2025 10:18:19 -0500
Date: Wed, 13 Aug 2025 10:18:19 -0500
From: Nishanth Menon <nm@ti.com>
To: <rs@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the bxs-4-64
Message-ID: <20250813151819.5rthljjrpryfwezz@skinning>
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-3-rs@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250808232522.1296240-3-rs@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_081825_975270_B6F660F5 
X-CRM114-Status: GOOD (  15.78  )
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

On 18:25-20250808, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Add the relevant device tree node for Imagination's BXS-4-64 GPU.
> 
> These devices uses a similar MSMC configuration to the J721S2. As such,
> they also require the use of the dma-coherent attribute.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> index 7c5b0c69897d..a44ca34dda62 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
> @@ -2691,4 +2691,18 @@ bist_main14: bist@33c0000 {
>  		bootph-pre-ram;
>  		ti,sci-dev-id = <234>;
>  	};
> +
> +	gpu: gpu@4e20000000 {
> +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";

Following  https://lore.kernel.org/linux-arm-kernel/DBE4UO2RGAYX.17V1DAF8MQYJM@kernel.org/
Is it worth having ti,j784s4-gpu here? Are there any SoC specific quirks
that driver will need to handle?

> +		reg = <0x4e 0x20000000 0x00 0x80000>;
> +		clocks = <&k3_clks 181 1>;
> +		clock-names = "core";
> +		assigned-clocks = <&k3_clks 181 1>;
> +		assigned-clock-rates = <800000000>;
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +		power-domains = <&k3_pds 181 TI_SCI_PD_EXCLUSIVE>,
> +				<&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names = "a", "b";
> +		dma-coherent;
> +	};
>  };
> -- 
> 2.50.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

