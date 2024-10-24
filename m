Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F094CD0BB5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hD8pazlMNkRIEUj8wspoCE4BW4rrUFRVlh12y70QEM=; b=mfO963hpIdPPbIqMQDgyiS++XX
	4igFY5CFfLhxtm2UacDOZrvDubjqbWf+Jvbg5RysW/MTyxyvNByz6Y+MzUb3DlD22WQZt8tLvtrxO
	fRd+2wSxHVpRGWhUtJMhlmFXeiV/8bJBEvYCeIaGcqVEPsKT5zg3TTvU0g6ud09nVQwetjk4MiANx
	VOvsVkZF7iUBpicdOmiiC9gq54h5tEJQMWUMPIn0fF/lFxdiaxXMffWP5WROKEwb41XyLvn55n0jo
	O2xrJSepVDcKMYvGk6B7Z2k+klA95/82kq4OCqkYsmIBawxaKi44w1MiRw7jvDnfrx66inFwPMswx
	rIQ7pGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rKM-0000000GvNU-0FVf;
	Thu, 24 Oct 2024 06:28:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rFC-0000000GuPQ-1a2c
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 06:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+hD8pazlMNkRIEUj8wspoCE4BW4rrUFRVlh12y70QEM=; b=XlaRisBRElzCwzrnNPOQlLniJr
	ghPG2hXYudypTMRzhnAeFe2mDX6bC7GLO3hqTMRO8HMWH+9vS/HqNeGJ+48l74DM0NyL75C5iJuRS
	nN4qMqJTWHNsAkNgoGlVjeuBc18rIP6cAVleddjPjs82xribxO8HXeK6fAupcuwoBrWi0X51PJg30
	xZ9GTvU5uCn+d4Vdv+S0H5NobVrMQ1yx5ImXHbK39M6zf1ILzrGwQ7KX/lnauddr6K4bLjXmV5Uxv
	W+BVsOzpTafL5sI+xjUHMSb/vPCZEJa6ewn4ZYCdDRuYzxy97CoWlrobOw3qjm+xpkGG5qY7hphO2
	lEJ4e89w==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rF7-00000008cKT-3v2U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:22:49 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49O6MKX9123892;
	Thu, 24 Oct 2024 01:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729750940;
	bh=+hD8pazlMNkRIEUj8wspoCE4BW4rrUFRVlh12y70QEM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A9IyW3Cu9DpCd82XEUtdsuireR3ZphphhZGbkMG+5Q+DZAq242Eq9xBeKQIqjhVrr
	 fsQRtm0ioviGkfQzaRX77Wu96XB0S0QWz29gu5A/CWq6uKMrc08dhIVSt8q9WW0aaP
	 OiaeCuQl+hxqyF3ntYQwt6irsTjG22DrYicnoOxI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O6MK4E058800;
	Thu, 24 Oct 2024 01:22:20 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Oct 2024 01:22:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Oct 2024 01:22:19 -0500
Received: from [172.24.227.91] (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49O6MGOb035515;
	Thu, 24 Oct 2024 01:22:16 -0500
Message-ID: <7f1d8857-9894-4db9-a0c4-534e1bff4cbb@ti.com>
Date: Thu, 24 Oct 2024 11:52:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j7200: Fix clock ids for MCSPI
 instances
To: Anurag Dutta <a-dutta@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <j-keerthy@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20241023104532.3438851-1-a-dutta@ti.com>
 <20241023104532.3438851-2-a-dutta@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20241023104532.3438851-2-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_072247_019426_0AAF7960 
X-CRM114-Status: GOOD (  12.81  )
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



On 23/10/24 16:15, Anurag Dutta wrote:
> The clock IDs for multiple MCSPI instances across wakeup as
> well as main domain in J7200 are incorrect when compared with
> documentation [1]. This results in kernel crashes when the said
> instances are enabled. Fix the clock ids to their appropriate
> values.
> 
> [1]https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html
> 
> Fixes: 8f6c475f4ca7 ("arm64: dts: ti: k3-j7200: Add MCSPI nodes")
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>

Reviewed-by: Aniket Limaye <a-limaye@ti.com>

> ---
>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       | 16 ++++++++--------
>   arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi |  6 +++---
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> index 9386bf3ef9f6..ee953c0bf11f 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
> @@ -1145,7 +1145,7 @@ main_spi0: spi@2100000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 266 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 266 1>;
> +		clocks = <&k3_clks 266 4>;
>   		status = "disabled";
>   	};
>   
> @@ -1156,7 +1156,7 @@ main_spi1: spi@2110000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 267 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 267 1>;
> +		clocks = <&k3_clks 267 4>;
>   		status = "disabled";
>   	};
>   
> @@ -1167,7 +1167,7 @@ main_spi2: spi@2120000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 268 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 268 1>;
> +		clocks = <&k3_clks 268 4>;
>   		status = "disabled";
>   	};
>   
> @@ -1178,7 +1178,7 @@ main_spi3: spi@2130000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 269 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 269 1>;
> +		clocks = <&k3_clks 269 4>;
>   		status = "disabled";
>   	};
>   
> @@ -1189,7 +1189,7 @@ main_spi4: spi@2140000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 270 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 270 1>;
> +		clocks = <&k3_clks 270 2>;
>   		status = "disabled";
>   	};
>   
> @@ -1200,7 +1200,7 @@ main_spi5: spi@2150000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 271 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 271 1>;
> +		clocks = <&k3_clks 271 4>;
>   		status = "disabled";
>   	};
>   
> @@ -1211,7 +1211,7 @@ main_spi6: spi@2160000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 272 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 272 1>;
> +		clocks = <&k3_clks 272 4>;
>   		status = "disabled";
>   	};
>   
> @@ -1222,7 +1222,7 @@ main_spi7: spi@2170000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 273 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 273 1>;
> +		clocks = <&k3_clks 273 4>;
>   		status = "disabled";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> index 5097d192c2b2..b18b2f2deb96 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
> @@ -494,7 +494,7 @@ mcu_spi0: spi@40300000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 274 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 274 0>;
> +		clocks = <&k3_clks 274 4>;
>   		status = "disabled";
>   	};
>   
> @@ -505,7 +505,7 @@ mcu_spi1: spi@40310000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 275 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 275 0>;
> +		clocks = <&k3_clks 275 4>;
>   		status = "disabled";
>   	};
>   
> @@ -516,7 +516,7 @@ mcu_spi2: spi@40320000 {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
> -		clocks = <&k3_clks 276 0>;
> +		clocks = <&k3_clks 276 2>;
>   		status = "disabled";
>   	};
>   

