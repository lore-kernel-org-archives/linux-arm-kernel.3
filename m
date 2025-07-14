Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DA6C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO37fHOFLEisAFzrUi5Kz1aAD1j8FS1kbeMRxgqRKjg=; b=yNF5INgF8i9OABkZKGAkhGqLEm
	HS+E4bsbxiisn5J/RY1Hz+5xb39B+O7VvzK2J+Q0KUOv19zXPvyMsAmr7GHdLmvpjzQyKxGQr524X
	LS2XhcTX9gkzDaouSBq0lYeq4SnTFd8szgyGkoIGadiKsb4AhQM+nDoiD++MmqjRvMDtLnMRj2LFZ
	OnnKxfJAvFZgFiqdCeesHr9qxcZPX8UnFqXFziSNeKjG/O0S+oh8savM70NQy+ZnBZ2owUozbrK9z
	3CMqnfeNl/6lZHSHmKajf+wx/IoCFgaTbsG8Z1/47QqWBr8IzUKlGRD0VMN8sGJxFMBSpr2XsBERm
	0qWR70Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubG7z-00000001suZ-3AHM;
	Mon, 14 Jul 2025 10:09:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFjY-00000001p2u-23k2;
	Mon, 14 Jul 2025 09:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752486258; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M2L4TXjR7KQNBl5rGIiB4Nx5iAV+gGQD7cmn5iH1EPKt/AUfM/okjiYy32vFk9pAyZtCawaP/35+3c3zsdujBPxXruiAhZy2gJNORIECSOTjlnk3ALbuAbHla1XMrEqPzR4CYGRpJ5HmDl0H+I2tKe9uO/v+Om/tfMME3TuqZlo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752486258; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DO37fHOFLEisAFzrUi5Kz1aAD1j8FS1kbeMRxgqRKjg=; 
	b=HqsKCLXJld6Um7urA4qghNLuQ37c5AaUXS1Oufv57Nni2eF/oehmwxT95LFeTLYDywp6KypiAKVH1rk7O9FR1XyAra4fMwCGqP4qdd+eFGgXX+SFisQRNgyyiyjUD2lgvhL3ougWpSRI1dN7uWT6oUaJ4M3b6BUAz0Y99tNDv+4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752486257;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=DO37fHOFLEisAFzrUi5Kz1aAD1j8FS1kbeMRxgqRKjg=;
	b=RyM671SMHzGNdgWCCDr7RPIalxR8oy+Z0WS6C1ogvPtAAQ73ZP0tzObcYyBSxNj0
	7bTebWNVKqISFXyMrPYHrPvsIV0SmPTfy41GcUonGSF42PSsZoaL3Emo4sLl8dds50A
	on2fQj8/314xmmGwjNMqHXQvz/GjQmemmrO/zjIE=
Received: by mx.zohomail.com with SMTPS id 1752486256438692.7921624244486;
	Mon, 14 Jul 2025 02:44:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v3 2/6] arm64: dts: rockchip: Add Radxa ROCK 2A/2F
Date: Mon, 14 Jul 2025 11:44:11 +0200
Message-ID: <7826308.EvYhyI6sBW@workhorse>
In-Reply-To: <20250712173805.584586-3-jonas@kwiboo.se>
References: <20250712173805.584586-1-jonas@kwiboo.se>
 <20250712173805.584586-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024428_604684_D287CD1F 
X-CRM114-Status: GOOD (  20.61  )
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

Hi Jonas,

see comments in-line.

On Saturday, 12 July 2025 19:37:44 Central European Summer Time Jonas Karlman wrote:
> The ROCK 2A and ROCK 2F is a high-performance single board computer
> developed by Radxa, based on the Rockchip RK3528A SoC.
> 
> Add initial device tree for the Radxa ROCK 2A and ROCK 2F boards.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v3: Rename led nodes to led-0/led-1 (Chukun Pan)
> v2: Limit sdmmc max-frequency to 100 MHz (Yao Zi)
> 
> Schematics:
> - https://dl.radxa.com/rock2/2a/v1.2/radxa_rock_2a_v1.2_schematic.pdf
> - https://dl.radxa.com/rock2/2f/radxa_rock2f_v1.01_schematic.pdf
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   2 +
>  .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 ++++++++++++++++++
>  .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++++
>  .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>  4 files changed, 387 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 099520962ffb..4cb6106b16f2 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -90,6 +90,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2f.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3562-evb2-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg-arc-d.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg-arc-s.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
> new file mode 100644
> index 000000000000..aedc7ee9ee46
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
> [...]
> +
> +&pinctrl {
> +	bluetooth {
> +		bt_wake_host_h: bt-wake-host-h {
> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		host_wake_bt_h: host-wake-bt-h {
> +			rockchip,pins = <1 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	leds {
> +		state_led_b: state-led-b {
> +			rockchip,pins = <1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	sdmmc {
> +		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
> +			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb {
> +		usb_host_en: usb-host-en {
> +			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	wifi {
> +		usb_wifi_pwr: usb-wifi-pwr {
> +			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		wifi_reg_on_h: wifi-reg-on-h {
> +			rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;

I don't see an external pull-up or pull-down in the schematic. I'm not
sure what the recommended practice is; should we have a pull direction
set in the SoC's pin controller in these cases, or leave it floating?

> +		};
> +
> +		wifi_wake_host_h: wifi-wake-host-h {
> +			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +};
> +
> +&pwm1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm1m0_pins>;
> +	status = "okay";
> +};
> +
> +&pwm2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm2m0_pins>;
> +	status = "okay";
> +};
> +
> +&saradc {
> +	vref-supply = <&vcc_1v8>;
> +	status = "okay";
> +};
> +
> +&sdhci {
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vcc_1v8>;
> +	status = "okay";
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency = <100000000>;

Any reason why we reduce this from the 150000000 in the SoC .dtsi?
Using the frequency the SoC .dtsi uses seems to work for me on the
ROCK 2A:

  [    0.347556] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
  [    0.547362] mmc_host mmc1: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
  [    0.814405] dwmmc_rockchip ffc30000.mmc: Successfully tuned phase to 248
  [    0.815407] mmc1: new UHS-I speed SDR104 SDXC card at address aaaa
  [    0.817030] mmcblk1: mmc1:aaaa SH64G 59.5 GiB
  [    0.820943]  mmcblk1: p1 p2

> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vccio_sd>;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0m0_xfer>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts b/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
> new file mode 100644
> index 000000000000..c03ae1dd3456
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
> [...]
> +
> +&pinctrl {
> +	ethernet {
> +		gmac1_rstn_l: gmac1-rstn-l {
> +			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;

Same concern as with wifi-reg-on-h, there's no external pull resistor
in the schematic.

> +		};
> +	};
> +
> +	leds {
> +		sys_led_g: sys-led-g {
> +			rockchip,pins = <3 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb {
> +		usb_otg_en: usb-otg-en {
> +			rockchip,pins = <1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts b/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> new file mode 100644
> index 000000000000..3e2b9b685cb2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3528-rock-2.dtsi"
> +
> +/ {
> +	model = "Radxa ROCK 2F";
> +	compatible = "radxa,rock-2f", "rockchip,rk3528";
> +};
> 

Other than the indicated comments,

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

ensured the pinctrls were correct, checked that they correspond to the
GPIOs being used in the devices associated with them. Also checked the
rock 2a schematic to verify that the vccio_sd switching setup is
correct, i.e. that high is indeed 3.3V and low is 1.8V.

And:

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

test-booted on a ROCK 2A, tested that SD card shows up, made sure
ethernet works as well, also ensured that the adc key works.



