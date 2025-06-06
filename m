Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCDDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eoma7VE8zBbmkSZqRjLMFcnJ8YljGbTiLj0UCYHlAT0=; b=HyJcWWCX7YdhOx+TXFb7vR0OEf
	E9OL+VvYtHL96bDI+6lbEWYglcxMamoqrthTKr4E++FMIT8evavWlG5tTtoILsv8ga0WLUPOJMX3u
	bUZdCoXCNS8rOP1zZxHZE0KqCbUuHoToQ0g3PWvY/MNE8uDpYMXaH3AoSNLjdpNMdIiwiEaWPneKU
	KS4EzaoTelBPY/jBvWBwESzIGCJJMzNiPU2L5j1hX2dgkUyiZ8Zle2fhfFZ2SXsVqxu8oLJHQ/MXa
	+wIDUFrrolw3ZXDCBDl50fFWWs8cTkrRLy27L7YsbmYW4+GJTYZyBn4haSfiNkHB+4KCpme/S5VUF
	44XYtW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTUV-0000000HXtK-0xCG;
	Fri, 06 Jun 2025 09:35:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTGC-0000000HW7q-3cwi;
	Fri, 06 Jun 2025 09:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749201641; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nzyi95xiWzKt7OEWNMu5E1KNY8xSywTW3tCv/p2angM74H2VjK0l6cbeNJWJ298VXE7X8qYjpszF1k+9cLAUZnXcSPsylxdVB6jKDzxMFOi3rEANEhgfpXRivoGUGb2Bzq+8eirOQzcXeytyn2AA1mB0mmahTO0sGrvnbHaiu3E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749201641; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Eoma7VE8zBbmkSZqRjLMFcnJ8YljGbTiLj0UCYHlAT0=; 
	b=PYsKU8X6p5fkEcHAFY8hlJOChD0WTG2oFUF6dsPpoAub/HSlPcMGhQdGYVX7EJwOtdBNLoZaoH9hzSqgzk3yywmYW8Sqm4sugBU/aOlny78itsBEeRdKUCyDY5D45cUGg7hoV0LlsQ60X7a8LINU/Ea8tCGFVrBv+2iVym6sExQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749201641;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Eoma7VE8zBbmkSZqRjLMFcnJ8YljGbTiLj0UCYHlAT0=;
	b=W8wJm07WNGiJ+m+LKUqIbkD+PnponFs4yfkz+c5LhNxgQTrGWgD7GObZMUFK2rHN
	eAeAOERA46ia74rvkmi7fOdLbdUXrwC/DmHL2Phu0cOV4JgkxWyYRz0RvPiRqJ82eG+
	WDOBXxat9J8zN2lJLvUoTx64SvX1iBC6QBVLgXV4=
Received: by mx.zohomail.com with SMTPS id 1749201638651978.6010401659372;
	Fri, 6 Jun 2025 02:20:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v7 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Date: Fri, 06 Jun 2025 11:20:32 +0200
Message-ID: <6946302.MhkbZ0Pkbq@workhorse>
In-Reply-To: <20250606-6-10-rocket-v7-10-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-10-dc16cfe6fe4e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_022112_927002_D7024F98 
X-CRM114-Status: GOOD (  25.17  )
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

Hi Tomeu,

On Friday, 6 June 2025 08:28:30 Central European Summer Time Tomeu Vizoso wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The NPU on the ROCK5B uses the same regulator for both the sram-supply
> and the npu's supply. Add this regulator, and enable all the NPU bits.
> Also add the regulator as a domain-supply to the pd_npu power domain.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 56 +++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> index d22068475c5dc6cb885f878f3f527a66edf1ba70..49500f7cbcb14af4919a6c1997e9e53a01d84973 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> @@ -316,6 +316,28 @@ regulator-state-mem {
>  	};
>  };
>  
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m2_xfer>;
> +	status = "okay";
> +
> +	vdd_npu_s0: regulator@42 {
> +		compatible = "rockchip,rk8602";
> +		reg = <0x42>;
> +		fcs,suspend-voltage-selector = <1>;
> +		regulator-name = "vdd_npu_s0";
> +		regulator-boot-on;
> +		regulator-min-microvolt = <550000>;
> +		regulator-max-microvolt = <950000>;
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
>  &i2c6 {
>  	status = "okay";
>  
> @@ -440,6 +462,10 @@ &pd_gpu {
>  	domain-supply = <&vdd_gpu_s0>;
>  };
>  
> +&pd_npu {
> +	domain-supply = <&vdd_npu_s0>;
> +};
> +
>  &pinctrl {
>  	hdmirx {
>  		hdmirx_hpd: hdmirx-5v-detection {
> @@ -500,6 +526,36 @@ &pwm1 {
>  	status = "okay";
>  };
>  
> +&rknn_core_top {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_mmu_top {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_1 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_2 {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&avcc_1v8_s0>;
>  	status = "okay";
> 
> 

Feel free to replace this patch with the following, if your series is
based on linux-next or v6.16. It moves the enablement into the new
shared ROCK 5B/5B+ dtsi, and I've added a regulator-enable-ramp-delay
while I was at it because I've run into hard-to-reproduce problems
relating to it before that Heiko quickly identified and fixed in his
recent series[1] for basically all already present regulators. Remains
to be seen if the final patch lands in that form but this should make
it easier for people to try out as it means a bad luck roll for the
day won't make them run into as many weird issues.

[1]: https://lore.kernel.org/all/20250605185001.377055-1-heiko@sntech.de/

---
From ff1c370a158f4340aa5dfa4ed5034e815e5371be Mon Sep 17 00:00:00 2001
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 3 Jun 2025 17:03:10 +0200
Subject: [PATCH] arm64: dts: rockchip: enable NPU on ROCK 5B/+

The NPU on the ROCK5B uses the same regulator for both the sram-supply
and the npu's supply. Add this regulator, and enable all the NPU bits.
Also add the regulator as a domain-supply to the pd_npu power domain.

The 5B+'s regulator setup is identical to the 5B in this regard, so it
goes in the shared .dtsi.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b.dtsi     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
index 51e83f0ed809..5a20cc2555fb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
@@ -332,6 +332,29 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-enable-ramp-delay = <500>;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
 &i2c3 {
 	status = "okay";
 };
@@ -521,6 +544,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -585,6 +612,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_top {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";
-- 
2.49.0





