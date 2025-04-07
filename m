Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B75C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 14:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GQwEgiAttJX3GwlNjWhEsbQtnapbNdqmpn8qGs7ss4=; b=glkxqJ24ECC7eK2FBQUr56lhY0
	ZH9lBOJtwID/uDJrpgo+hLGpThrNC+hwlAOCAnvlxMryOCNwn5d3A2pyQWjucfIj3ABBIXZ64+xy2
	xC2bJGN7pR/1Uq3c5FO2zFdXYKpKzrnNgO3TfboUM5wtPulDax5jvv9PlGZ7T6Dfnalut1lrISaa1
	wia5K/osx2LA69VRG07K9Q8cnygUcPfzY1dtx25rO7HpNcUOHrscoSA089WcOZ+joJ9E5Y6hTmiFi
	E+oZ8BOpW0CK2pqrOOTDUPviYcbiR8thWB7QmUUc7IMRhRjk1I+Vp4WK9MdkW+YG6h4H5sCB7irfF
	hoEo/Wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n2u-00000000dmK-10Cf;
	Mon, 07 Apr 2025 14:01:52 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mnC-00000000aPZ-2kif
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 13:45:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537DjOcN876172
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744033524;
	bh=2GQwEgiAttJX3GwlNjWhEsbQtnapbNdqmpn8qGs7ss4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ENLxtRZ94j61maAHe48uROtOKdjM4x1ieddeC2aDqAL+COIKjV7HGW02z6orjyN8f
	 TSGSCvDlbgWmIJ8YY9g6H9I2peqh00VmGwJvs9PVSqQ8F2p1BERiNs5XjPMArhHojJ
	 nZ9sa+8jQXcpXIDy+42rQm/n9vnHvVpw8yZlSFfE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537DjN1c028869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 08:45:23 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 08:45:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 08:45:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537DjNfZ091617;
	Mon, 7 Apr 2025 08:45:23 -0500
Date: Mon, 7 Apr 2025 08:45:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <jai.luthra@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH 3/5] arm64: dts: ti: k3-j721e-sk: Fix dtbs_check warnings
 in IMX219 overlay
Message-ID: <20250407134523.d56rjpydflmkw2ze@privatize>
References: <20250401114053.229534-1-y-abhilashchandra@ti.com>
 <20250401114053.229534-4-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250401114053.229534-4-y-abhilashchandra@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_064538_794211_B62CC3B7 
X-CRM114-Status: GOOD (  16.41  )
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

$subject - the patch adds description for the supplies for the sensor.
Please fix the description.

On 17:10-20250401, Yemike Abhilash Chandra wrote:
> The device tree bindings mandate three regulator nodes for the IMX219
> sensor: VANA (analog), VDIG (digital core), and VDDL (digital I/O). Add the
> necessary regulator nodes in the device tree overlay and also the device
> tree bindings do not include a clock-names property. Remove the incorrectly
> added clock-names entry to avoid dtbs_check warnings.
> 
> Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219")
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  .../dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> index 47bb5480b5b0..4eb3cffab032 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> @@ -19,6 +19,33 @@ clk_imx219_fixed: imx219-xclk {
>  		#clock-cells = <0>;
>  		clock-frequency = <24000000>;
>  	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &csi_mux {
> @@ -34,7 +61,9 @@ imx219_0: imx219-0@10 {
>  		reg = <0x10>;
>  
>  		clocks = <&clk_imx219_fixed>;
> -		clock-names = "xclk";
> +		VANA-supply = <&reg_2p8v>;
> +		VDIG-supply = <&reg_1p8v>;
> +		VDDL-supply = <&reg_1p2v>;
>  
>  		port {
>  			csi2_cam0: endpoint {
> @@ -56,7 +85,9 @@ imx219_1: imx219-1@10 {
>  		reg = <0x10>;
>  
>  		clocks = <&clk_imx219_fixed>;
> -		clock-names = "xclk";
> +		VANA-supply = <&reg_2p8v>;
> +		VDIG-supply = <&reg_1p8v>;
> +		VDDL-supply = <&reg_1p2v>;
>  
>  		port {
>  			csi2_cam1: endpoint {
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

