Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BC3CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw2G6qHIZr2q4Bt6ggK8RCIkbrjHTRhw+FWlDVwXhMw=; b=fZa14UjMFmVKwnJkiBNO0isqEL
	4GkieyMN8EC95hspj91lFsexWQEanJd813s9PiVqMB/8pHMYKmIPMgV655V6Qiv3WiSznngcyvjZV
	nHYZuH3TDIg40UOWqzmgKAV/auo0goFCvBfh6d1Ym5j9NlRNP22NcwT8XSrvizbjf7uP1S3AxYyj+
	SwuNBv0JKrP/T6BXm+Rmv9PakjM86L9NvaqIiXqLxPV2FtXYN6MPrDzZFS59x49qY5yXz/7URZ2b7
	1hkyJgnRw1tqkHK7QM2N+0xWN9Uyzm5mgvaN6gEnObw+NQyIKh/OKFukNVnrfn5ddLc/9LCil4+/m
	9NBBbrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXOL-00000003bT9-0OXZ;
	Tue, 29 Sep 2026 12:57:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXOI-00000003bSL-1X99;
	Tue, 29 Sep 2026 12:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790686616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rt7F9cTQIqsjz0/NLpXxFU/ERhBy0Wq5tUNyvR0qSmXf+sbVn5wEqTfdOoyD6Jvuug97tgA9DIwfcw0AfIBeIugiu3B4q0/tjOvQvVlmr6vS8YyidT61uSPlXVM37ukrwZtcT4nYfG7IyzPieKbU3fzueVl8v7pQ7sMCVQZuMcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790686616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dw2G6qHIZr2q4Bt6ggK8RCIkbrjHTRhw+FWlDVwXhMw=; 
	b=Y4j6sHPHlglWJ/oKpZoONft9cPvUrJh3rTAi/SfU2Qm7gB6A0lMTFnKkdjT4yxVGi/ZBxO2xsrz73GvFnO9Dl/JMoIhTW+09rzQaNL1Xh7U3Eik+cDFALzkdDmPihi1AOheVFsV83L1pxX7TJNazG5D/XzgdAC8M/KTjv0ydZLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790686616;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dw2G6qHIZr2q4Bt6ggK8RCIkbrjHTRhw+FWlDVwXhMw=;
	b=RgJwRajfRURzMAck6XuHxeKK9XLgC4qoJTbyTeubCqyQnoIui8KFgVN5y/kFby1D
	8paaPKm9XKd4B+sSHGNLJ19lfeeKISnD2LpEnA1nD0fiFN1m6YSYKGKLsjl+X43NvgI
	jn06RIF6os8JMUwmNNVbIqXVi+V/JjzsJJWffMo0=
Received: by smtp.zohomail.com with SMTPS id 1790686613886757.8277621120569;
	Tue, 29 Sep 2026 05:56:53 -0700 (PDT)
Message-ID: <e0699ffb-5e73-4fd5-b3e2-79cc7c2d49aa@collabora.com>
Date: Tue, 29 Sep 2026 14:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: add radxa camera 4k on rock 4d
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260925-rock4d-cam4k-v1-1-c9519c794fb3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_055702_450556_56518DB1 
X-CRM114-Status: GOOD (  18.74  )
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

Hi Amin,

Thanks for the patch, LGTM!

On 9/25/26 14:16, Amin Gattout wrote:
> Add a device tree overlay for the Radxa Camera 4K (featuring the Sony
> IMX415 image sensor) to be applied on the Radxa ROCK 4D camera
> connector. The camera connects to CSI HOST1 through the MIPI D-PHY0
> in full mode.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   5 +
>  .../dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso   | 105 +++++++++++++++++++++
>  2 files changed, 110 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index e7936a21c118..82b2afd420d5 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -183,6 +183,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-cam4k.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
> @@ -311,6 +312,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10-pcie1.dtb
>  rk3576-evb1-v10-pcie1-dtbs := rk3576-evb1-v10.dtb \
>  	rk3576-evb1-v10-pcie1.dtbo
>  
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d-radxa-4k-cam.dtb
> +rk3576-rock-4d-radxa-4k-cam-dtbs := rk3576-rock-4d.dtb \
> +	rk3576-rock-4d-radxa-cam4k.dtbo
> +
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
> new file mode 100644
> index 000000000000..613a3e351500
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-cam4k.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device tree overlay for the Radxa Camera 4K attached to the camera
> + * connector of the Radxa ROCK 4D.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/rockchip,rk3576-cru.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +&{/} {
> +	savdd_cam: regulator-savdd-cam {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <2900000>;
> +		regulator-max-microvolt = <2900000>;
> +		regulator-name = "savdd_cam";
> +		vin-supply = <&vcc_3v3_s0>;
> +	};
> +
> +	sdvdd_cam: regulator-sdvdd-cam {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		regulator-name = "sdvdd_cam";
> +		vin-supply = <&vcc_5v0_device>;
> +	};
> +
> +	siovdd_cam: regulator-siovdd-cam {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-name = "siovdd_cam";
> +		vin-supply = <&vcc_3v3_s0>;
> +	};
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5m3_xfer>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	imx415: camera-sensor@1a {
> +		compatible = "sony,imx415";
> +		reg = <0x1a>;
> +		assigned-clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
> +		assigned-clock-rates = <37125000>;
> +		avdd-supply = <&savdd_cam>;
> +		clocks = <&cru CLK_MIPI_CAMERAOUT_M1>;
> +		dvdd-supply = <&sdvdd_cam>;
> +		orientation = <2>; /* External */
> +		ovdd-supply = <&siovdd_cam>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&cam_rstn &cam_clk1m0_clk1>;
> +		reset-gpios = <&gpio3 RK_PC7 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			imx415_output: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <445500000>;
> +				remote-endpoint = <&csi1_input>;
> +			};
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	cam {
> +		cam_rstn: cam-rstn-pinctrl {
> +			rockchip,pins = <3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&csi1 {
> +	status = "okay";
> +};
> +
> +&csi1_in {
> +	csi1_input: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		data-lanes = <1 2 3 4>;
> +		link-frequencies = /bits/ 64 <445500000>;
> +		remote-endpoint = <&imx415_output>;
> +	};
> +};
> +
> +&csi_dphy0 {
> +	status = "okay";
> +};
> +
> +&vicap {
> +	status = "okay";
> +};
> +
> +&vicap_mmu {
> +	status = "okay";
> +};
> 
> ---
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
> change-id: 20260925-rock4d-cam4k-6e3521c61b55
> prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v2
> prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
> prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
> prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
> prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
> prerequisite-change-id: 20260825-csi-2-rcv-dts-7712bd834de6:v2
> prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
> prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
> prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
> prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
> prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
> prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
> prerequisite-change-id: 20260828-vicap-rk3576-6e7118ea0246:v2
> prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
> prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
> prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
> prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
> prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
> prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97
> prerequisite-patch-id: d4120ad9def5effeda632f831b6fd0cd59295285
> prerequisite-patch-id: e0c7e587fcaffe58b61fe78508efccec86dc7c79
> prerequisite-patch-id: 6a87bd22798d58cc8f9b30733f5b28a2fced05c1
> prerequisite-patch-id: a94c687ac3f648079b18dbb5109657fb038bd516
> prerequisite-patch-id: 76e36df1aab8a9853440aa28b4bda528ce2adfd7
> 
> Best regards,
> --  
> Amin Gattout <amin.gattout@gmail.com>
> 


