Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2081CC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 08:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEy5kTWJrHiARXNw/DljkoPY++hyVEUVWZlPeTaseu8=; b=wSplFI81w1DV/M5SJpGd5zIwPO
	GzyK4ApbuQPwzkHKQoS1hxZ04UlkWRuBD3glvVG518pQsfKc3T+CwGh+pHpO2Oa12dNN63Ph+Jthh
	nlcJkvtiOjLLlzQ/felA/Ug2sfahJKpuQYKvkdqQTpELR8QVLb3gl/0HNA0+Ls9FQFEs/hxZVePnM
	ic3Ix03lNSCSCem+CJiQFzWwCxSaoJfgfJcXK+RD9hvDswIq0RqDAD6gQaMg0FkTwoFaDIzvbHsaT
	0EmEu79SDCVChEny0978+OKf5xqFrxp0lx2wxYKcCQn9wSkc1ta9op0lINbvRr7G77VJpNlarVdNL
	8WviPTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlTH-00000001B9L-17YM;
	Fri, 02 May 2025 08:10:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlRL-00000001AvQ-1Fd8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 08:08:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54287nYA365294
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 03:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746173269;
	bh=XEy5kTWJrHiARXNw/DljkoPY++hyVEUVWZlPeTaseu8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=X74JdYW/1OIfaBEK/7dZ95S6ToeGG9XqfzmYWzQPbUy+LDQCGFEBwwxmqRc8u8MFs
	 BFdx4pEvb5qy7v1G/XF/HS00TbopFHTdLyThPXKdzY54uN90+rtTMxRA8gnjcsgg6r
	 QBOjB8wdp0XpEVtThGbqz1sODbj1l7RSooghyIIg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54287nBo002710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 03:07:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 03:07:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 03:07:49 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54287ia1107040;
	Fri, 2 May 2025 03:07:44 -0500
Message-ID: <e6533f02-b71f-41f5-bb8c-7d6e57f02b87@ti.com>
Date: Fri, 2 May 2025 13:37:43 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v1 2/4] arm64: dts: ti: k3-am62x: Add required voltage
 supplies for IMX219
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-3-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250429154133.3377962-3-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_010811_432149_53C6AF3D 
X-CRM114-Status: GOOD (  13.40  )
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

On 29/04/25 21:11, Rishikesh Donadkar wrote:
> The device tree overlay for the IMX219 sensor requires three voltage
> supplies to be defined: VANA (analog), VDIG (digital core), and VDDL
> (digital I/O).
> 
> Add the corresponding voltage supply definitions to avoid dtbs_check
> warnings.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  .../boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso  | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index dd090813a32d6..149c59c071823 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> @@ -15,6 +15,33 @@ clk_imx219_fixed: imx219-xclk {
>  		#clock-cells = <0>;
>  		clock-frequency = <24000000>;
>  	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vcc_3v3_sys>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &main_i2c2 {
> @@ -40,6 +67,10 @@ ov5640: camera@10 {
>  
>  				clocks = <&clk_imx219_fixed>;
>  
> +				VANA-supply = <&reg_2p8v>;
> +				VDIG-supply = <&reg_1p8v>;
> +				VDDL-supply = <&reg_1p2v>;
> +
>  				reset-gpios = <&exp1 13 GPIO_ACTIVE_HIGH>;
>  
>  				port {


