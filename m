Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81A1C3ABB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrVE1N/wFbZaBJ1oXIeEDUfqYfCD3wLAKBNXgULHQNA=; b=AomzAm2RHkEhDRgFplA5thyCi2
	vPFQ1YwAeD3UJ5xJAGS+NGQoljRBJXByGMxUgDcFOhfz4ChN2ydJp9jD59ARf4n+c5xsrYYzzHY2W
	0qwdCYhlh80fxMxKoikjpUObpcLhzVx3AQi00uTrlC4m0Giz8MXvcjkWMGIYuroEzBoQ989rK351G
	FXR+ItIMXJ4DkejYpjEHbrMB2gYb4FYp5E5mcvWxUeeHMug8M1n0XY9Yu8O+WL+ljUGAol+BaFevC
	+5rA7VsW14Zr3453YWnPgwoQWcIjSMEa/455Cty9ZhFxG40D42V+QlxZBwnn03gmIWj1yc/wE6b2p
	s0jEYAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o67-0000000AIaw-1fVh;
	Tue, 29 Apr 2025 16:46:19 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lwl-00000009xPF-0MPD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 14:28:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53TESQ0f3117359
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 09:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745936906;
	bh=MrVE1N/wFbZaBJ1oXIeEDUfqYfCD3wLAKBNXgULHQNA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HTqLcWH0ZHpq90H9L8BrEm40CAD45Ff3AIVEH4us4okodm/3As9bzQelCLhF/n+qX
	 1D/6VBqWNvNnIC8jps+zz8q5v/tI2mf4S7sxdWaJYQCUaNuoGLFXVAipysltHbYGhD
	 WkQDTBN3JujXsk+8h8ac7Sbaa6ZOjF6tG3oT1aHM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53TESQFh066594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Apr 2025 09:28:26 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Apr 2025 09:28:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Apr 2025 09:28:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53TESPfs073545;
	Tue, 29 Apr 2025 09:28:25 -0500
Date: Tue, 29 Apr 2025 09:28:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
Message-ID: <20250429142825.bvrbpoc5iz32wh35@garment>
References: <20250429142333.4140010-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429142333.4140010-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_072831_234707_756B3307 
X-CRM114-Status: GOOD (  20.58  )
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

On 09:23-20250429, Judith Mendez wrote:
> Set eMMC clock parents to the defaults which is MAIN_PLL0_HSDIV5_CLKOUT
> for eMMC. This change is necessary since DM is not implementing the
> correct procedure to switch PLL clock source for eMMC and we have a
> non-glich-free mux. To remove any potential issues, lets switch back to
> the defaults.
> 
> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral nodes")
> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0 instance")
> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for more IPs")

I thought I had given this comment previously as well, please DONOT put
multiple fixes in a single patch -> All three are solving the similar
problems, but on three different baseline - please think through how
this patch needs to be automatically backported to previous stable
kernels.

> Cc: stable@vger.kernel.org
> Signed-off-by: Judith Mendez <jm@ti.com>
> Acked-by: Udit Kumar <u-kumar1@ti.com>
> ---
> This patch was split from "Misc MMC udates" patch series [0] to help
> with backporting.
> [0] https://lore.kernel.org/linux-devicetree/20250417233040.3658761-1-jm@ti.com/
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>  3 files changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2..0c286f600296 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -552,8 +552,6 @@ sdhci0: mmc@fa10000 {
>  		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
>  		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
>  		clock-names = "clk_ahb", "clk_xin";
> -		assigned-clocks = <&k3_clks 57 6>;
> -		assigned-clock-parents = <&k3_clks 57 8>;
>  		bus-width = <8>;
>  		mmc-ddr-1_8v;
>  		mmc-hs200-1_8v;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index a1daba7b1fad..455ccc770f16 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -575,8 +575,6 @@ sdhci0: mmc@fa10000 {
>  		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
>  		clocks = <&k3_clks 57 5>, <&k3_clks 57 6>;
>  		clock-names = "clk_ahb", "clk_xin";
> -		assigned-clocks = <&k3_clks 57 6>;
> -		assigned-clock-parents = <&k3_clks 57 8>;
>  		bus-width = <8>;
>  		mmc-hs200-1_8v;
>  		ti,clkbuf-sel = <0x7>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 7b65538110e8..fa55c43ca28d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -573,8 +573,6 @@ sdhci0: mmc@fa10000 {
>  		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
>  		clocks = <&k3_clks 57 1>, <&k3_clks 57 2>;
>  		clock-names = "clk_ahb", "clk_xin";
> -		assigned-clocks = <&k3_clks 57 2>;
> -		assigned-clock-parents = <&k3_clks 57 4>;
>  		bus-width = <8>;
>  		mmc-ddr-1_8v;
>  		mmc-hs200-1_8v;
> 
> base-commit: d864bb528a6725e775d564fd4430762acbb9dd0d
> -- 
> 2.49.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

