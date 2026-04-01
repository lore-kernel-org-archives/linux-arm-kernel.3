Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E8CD35163
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3jWD8KB9axY08EbcL/Wu3ONW/UD+QA67EncL91vtpI=; b=3JdCPF1B+F0Y5BSzmHKCZY7TB2
	3f1HS+wUGCsH1KxyN6eMc4t2Q4D06Bmz1aVKsMPscLkpYvq/oYHCVnC/PHbr5th/K21Fy/PI9dCiQ
	r0oE9kFAV7D0CPbIWdyIrkrGVOhtNODc//6IQHYDWSW1m4a55FR0q3PZmmM0im5uW+P7gVimIB4nO
	I0op2QfOrAoOiWs05k8UgDS/g9RfrHP8LNJE3iaID4Ae6HmdLOI7dCoiExKiMRxDcul4AhEJg5qMq
	J+8PMS/R8Kqm9Yr0HCqe1d+EkQrEGXI84qtLtQjRFgb8vibpZpn5eiOQc28VxAcYLn7WeUDcn51zi
	E9ekwiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sEN-0000000ERXO-0fBW;
	Wed, 01 Apr 2026 09:51:23 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sEK-0000000ERWB-07dR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 09:51:22 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-89fc4147f2eso74028216d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 02:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775037078; cv=none;
        d=google.com; s=arc-20240605;
        b=TvMOR6y79CXEJIVMsP2V2MKjuv77jkBDb7cMwjRUmFS0dm9O4CXCPTNolRiyU+TvE2
         mHmjem5IE61pUZyhOij9y8fMG0sFbMgXrlvA9KJsp7osOqUZ6j9Gb2Eqn8WccQNOKVmi
         Wbj+A8NQb/egKPGwvrk2pOG9vmgBTDbRduV4thlE5ONZAaxWFiHgFKe5ka9Po7FKzO2Q
         CtAx7q8BQvNq7JPbL8/0YY+OOXXgEbFW3mIBQmBOmtym9H130Gu+aKbGGE+8uPkylPJr
         bpJ4WqaPHuctmwSb55tWGFgAeG8/fKJbbL4Am3iiezm/PKIFMWOb7UK1JOUIhErZMZ0T
         4Mzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z3jWD8KB9axY08EbcL/Wu3ONW/UD+QA67EncL91vtpI=;
        fh=0DEpliSGVNgGwJkjjATdZMHOgZdNFalgWjsVAjhKtJ8=;
        b=kbQyXHRTO06TVAOHgHa1f6G3IDpnM/G8KCwZspvHTAC/U23zf3BOsLfHohWe6wukT3
         9Bc3xcCQnvHzMo1HVDo9lT5pwVd3meM3m/zHZwwzzMDneeFdGEtU9xbyF1xyvPm+f83G
         T8uymSkdn7yc9BhiSkq3UfLKTmi9gZO60kkWzGGVvP0nUe33rW1/jwqz2sGsdcUrC7JF
         yjK7OxdnY9D1gd6FK3KCSHTAh9Fq/gElI7tmSteUHMAzT9ip5rquVEmwW0gM1ttvKVb0
         FfE524eiMg8/bUKIbA8l1ksMWPMZ4eOJrDW7/oiPgvYyFaO1wrgJblcAiG0Ywm483UFL
         xtaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775037078; x=1775641878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3jWD8KB9axY08EbcL/Wu3ONW/UD+QA67EncL91vtpI=;
        b=I2nLbn1WaNWknnKAWDqZouEcno5z5z0Dv+cM62TnKTsvonfNWXqTsJBf3YfHxFfuLM
         hkctbYpb/pN0lkN99yiTQXIwo5E/j1ZagFl9RM0HJVrn7F7fqkIKXAVx94c+Kp7dvy6e
         /Tj/Tg5EcG7UhHmqCqYOVKNeSwupVeAVxK2KxrNLzmr/jSKuNMqVcTvU/lZjZpvKPBvU
         JKm0hP3ocPRMtgJn0R73b6t1iTZrM3WWZw8nhFH0awgLr7WdORykq6v1nZxtfAXXfe6V
         gdKSVmqw8GGAKTRU9Uf91EdBJQR2TCGZX6d0DYRZpf4NpliV2pC4izj6FK6dxGFjbHxP
         aaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037078; x=1775641878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3jWD8KB9axY08EbcL/Wu3ONW/UD+QA67EncL91vtpI=;
        b=XYr+99HCKkMRfWDKnkfaPbYTf4Lrbnsgt+Um6sbr6HvrsWLXCOh4tq/1VHOPYwOquQ
         EKoLtVZ7iPpm/v410slUwIPmaiteTbcfec0Qvl2VWxp/8Q/CvvVE8WjWTW/STBf4maFF
         7aHhdDfxrQz0mWkLkuOJrdXCUnBmbdExobBqJYruJkIb2YSYGt27kyaO8Rhpc46kp+rG
         jShPRS1qYwauj7dkSDUROW9y8EJP4AKakmEKQPvpQPgDoPBsMJgwQVbkYiyl/GqcVaTS
         AlW7syP9GHpCvgSPR5XSKt6v1AFQ//KLD0pzw1WD3nRxMH6XXXj/oP2Bx/jwHmaaOBHX
         QZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0p3pIN9tk3xes34Ka2e6cIXVxD/blSlvfy8tJTLRfyAZBe3bTfACb2iU2n9mM4m6DH33M6xfSSWSD0uPoXG6y@lists.infradead.org
X-Gm-Message-State: AOJu0YzBVDwziJtcLlCGk01AeVqoid/U8Ss+ld/znG0Ov+t8oH9726ue
	BeJsTmVcb+IwREZZ/h4E9OycYxb/T8EqQvHcTZWmCmb3XSRMtkfdSTdzMOoczoFRyXgdh6L+2mO
	Lkwe0e/B5UcBJhO8nkYM8jHcpfAbAn+4=
X-Gm-Gg: ATEYQzy3DG8gkAr7OGfpcGkV3roJnmx15dI2kfot8cKu+OMEj7ve2tev7maj3n+4ihw
	xeEAVUrR/mVZDyuhivlkjUWweEuAjzY4K819/vL2MNNf6X8iZG7WnR2VcgYrJpqLytlYqhYNYNN
	IXc0LYTW9ueRdGiPf5eSsP6tLOdmERI0VEo4w4tGZQFT7it3W64bOXZVWihGviW+mCpgnCiUDam
	cA6EGq8cEehNcn6L5SjKOgFlFix+pdQBn1npVnqCYaBPqk5cVVsAQNH055aTYf1bvVjG699O5/E
	Qg/Ry/Z2wE/+C+Ietg==
X-Received: by 2002:a05:6214:dca:b0:8a1:6509:9cbf with SMTP id
 6a1803df08f44-8a43ac4811emr40231156d6.52.1775037077979; Wed, 01 Apr 2026
 02:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260401010707.2584962-1-dennis@ausil.us> <20260401010707.2584962-4-dennis@ausil.us>
In-Reply-To: <20260401010707.2584962-4-dennis@ausil.us>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 1 Apr 2026 13:51:08 +0400
X-Gm-Features: AQROBzDKP_DuLbzOy_SddOBUTgbRIK7NqHrgEOy3ruL0UsrfbQKg5eUwC1Wr0Tw
Message-ID: <CABjd4YyVRExX4gTCZQj2EEht_022ojS58DrYjntuC6H875ewpA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_025120_179299_81035EA9 
X-CRM114-Status: GOOD (  23.16  )
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

On Wed, Apr 1, 2026 at 5:07=E2=80=AFAM <dennis@ausil.us> wrote:
>
> From: Dennis Gilmore <dennis@ausil.us>
>
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
>
> - eMMC module, you can optionally solder a SPI NOR in place and turn
>  off the eMMC
> - PCIe-attached NIC (pcie2x1l1)
> - PCIe NVMe slot (pcie2x1l2)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth
> - es8388 audio
> - USB 2.0 and USB 3.0
>
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details=
/Orange-Pi-5-Pro.html
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 320 ++++++++++++++++++
>  2 files changed, 321 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 4d384f153c13..c99dca2ae9e7 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.d=
tb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5-pro.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-cm5-base.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> new file mode 100644
> index 000000000000..7ab68245d2c6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3588s-orangepi-5.dtsi"
> +
> +/ {
> +       model =3D "Xunlong Orange Pi 5 Pro";
> +       compatible =3D "xunlong,orangepi-5-pro", "rockchip,rk3588s";
> +
> +       aliases {
> +               mmc0 =3D &sdhci;
> +               mmc1 =3D &sdmmc;
> +               mmc2 =3D &sdio;
> +       };
> +
> +       analog-sound {
> +               compatible =3D "simple-audio-card";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hp_detect>;
> +               simple-audio-card,bitclock-master =3D <&masterdai>;
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,frame-master =3D <&masterdai>;
> +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_AC=
TIVE_HIGH>;
> +               simple-audio-card,mclk-fs =3D <256>;
> +               simple-audio-card,name =3D "rockchip,es8388";
> +               simple-audio-card,routing =3D
> +                       "Headphones", "LOUT1",
> +                       "Headphones", "ROUT1",
> +                       "LINPUT1", "Microphone Jack",
> +                       "RINPUT1", "Microphone Jack",
> +                       "LINPUT2", "Onboard Microphone",
> +                       "RINPUT2", "Onboard Microphone";
> +               simple-audio-card,widgets =3D
> +                       "Microphone", "Microphone Jack",
> +                       "Microphone", "Onboard Microphone",
> +                       "Headphone", "Headphones";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai =3D <&i2s2_2ch>;
> +               };
> +
> +               masterdai: simple-audio-card,codec {
> +                       sound-dai =3D <&es8388>;
> +                       system-clock-frequency =3D <12288000>;
> +               };
> +       };
> +
> +       pwm-leds {
> +               compatible =3D "pwm-leds";
> +
> +               led-0 {
> +                       color =3D <LED_COLOR_ID_BLUE>;
> +                       function =3D LED_FUNCTION_STATUS;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm15 0 1000000 0>;
> +               };
> +
> +               led-1 {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_ACTIVITY;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm3 0 1000000 0>;
> +               };
> +       };
> +
> +       fan: pwm-fan {
> +               compatible =3D "pwm-fan";
> +               #cooling-cells =3D <2>;
> +               cooling-levels =3D <0 50 100 150 200 255>;
> +               fan-supply =3D <&vcc5v0_sys>;
> +               pwms =3D <&pwm2 0 20000000 0>;
> +       };
> +
> +       vcc3v3_phy1: regulator-vcc3v3-phy1 {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> +               regulator-boot-on;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-name =3D "vcc3v3_phy1";
> +               startup-delay-us =3D <50000>;
> +               vin-supply =3D <&vcc_3v3_s3>;
> +       };
> +
> +       vcc5v0_otg: regulator-vcc5v0-otg {
> +               compatible =3D "regulator-fixed";
> +               enable-active-high;
> +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-name =3D "vcc5v0_otg";
> +               vin-supply =3D <&vcc5v0_sys>;
> +       };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               clocks =3D <&hym8563>;
> +               clock-names =3D "ext_clock";
> +               post-power-on-delay-ms =3D <200>;
> +               reset-gpios =3D <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
> +       };
> +
> +       typea_con: usb-a-connector {
> +               compatible =3D "usb-a-connector";
> +               data-role =3D "host";
> +               label =3D "USB3 Type-A";
> +               power-role =3D "source";
> +               vbus-supply =3D <&vcc5v0_otg>;
> +
> +               ports {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       port@0 {
> +                               reg =3D <0>;
> +                               typea_con_hs: endpoint {
> +                               };
> +                       };

Hi Dennis,

You don't have to define ports if you aren't using them - i.e. here
the endpoints are not linked up to their remote counterparts, so they
don't do anything. If it works for you this way that probably means
you can drop the whole ports subnode altogether and add it later if a
need arises.

> +                       port@1 {
> +                               reg =3D <1>;
> +                               typea_con_ss: endpoint {
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c1m4_xfer>;
> +       status =3D "okay";
> +};
> +
> +&i2c3 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c3m0_xfer>;
> +       status =3D "okay";
> +
> +       es8388: audio-codec@11 {
> +               compatible =3D "everest,es8388", "everest,es8328";
> +               reg =3D <0x11>;
> +               #sound-dai-cells =3D <0>;
> +               AVDD-supply =3D <&vcc_3v3_s0>;
> +               DVDD-supply =3D <&vcc_1v8_s0>;
> +               HPVDD-supply =3D <&vcc_3v3_s0>;
> +               PVDD-supply =3D <&vcc_3v3_s0>;
> +               assigned-clock-rates =3D <12288000>;
> +               assigned-clocks =3D <&cru I2S2_2CH_MCLKOUT>;
> +               clocks =3D <&cru I2S2_2CH_MCLKOUT>;

Your codec is the clock master, so it would be better for it to
request the pin config for the mclk pin, as it's the real user of the
master clock (not the i2s2 node). See also below

> +       };
> +};
> +
> +&i2c4 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c4m3_xfer>;
> +       status =3D "okay";
> +};
> +
> +&i2s2_2ch {
> +       pinctrl-0 =3D <&i2s2m1_lrck &i2s2m1_mclk &i2s2m1_sclk

Looks like &i2s2m1_mclk belongs in &es8388 instead, not here.

> +                    &i2s2m1_sdi &i2s2m1_sdo>;
> +       status =3D "okay";
> +};
> +
> +&package_thermal {
> +       polling-delay =3D <1000>;
> +
> +       cooling-maps {
> +               map0 {
> +                       trip =3D <&package_fan0>;
> +                       cooling-device =3D <&fan THERMAL_NO_LIMIT 1>;
> +               };
> +
> +               map1 {
> +                       trip =3D <&package_fan1>;
> +                       cooling-device =3D <&fan 2 THERMAL_NO_LIMIT>;
> +               };
> +       };
> +
> +       trips {
> +               package_fan0: package-fan0 {
> +                       hysteresis =3D <2000>;
> +                       temperature =3D <55000>;
> +                       type =3D "active";
> +               };
> +
> +               package_fan1: package-fan1 {
> +                       hysteresis =3D <2000>;
> +                       temperature =3D <65000>;
> +                       type =3D "active";
> +               };
> +       };
> +};
> +
> +/* NVMe */
> +&pcie2x1l1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pcie30x1m1_1_clkreqn &pcie30x1m1_1_waken>;
> +       reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> +       supports-clkreq;
> +       vpcie3v3-supply =3D <&vcc_3v3_s3>;
> +       status =3D "okay";
> +};
> +
> +/* NIC */
> +&pcie2x1l2 {
> +       reset-gpios =3D <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
> +       vpcie3v3-supply =3D <&vcc3v3_phy1>;
> +       status =3D "okay";
> +};
> +
> +&pinctrl {
> +       bluetooth {
> +               bt_wake_gpio: bt-wake-pin {
> +                       rockchip,pins =3D <0 RK_PC6 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +
> +               bt_wake_host_irq: bt-wake-host-irq {
> +                       rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +       };
> +
> +       usb {
> +               vcc5v0_otg_en: vcc5v0-otg-en {
> +                       rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> +               };
> +       };
> +
> +       wlan {
> +               wifi_host_wake_irq: wifi-host-wake-irq {
> +                       rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pu=
ll_down>;
> +               };
> +       };
> +};
> +
> +&pwm15 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm15m2_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm2m1_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm3 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pwm3m2_pins>;
> +       status =3D "okay";
> +};
> +
> +&sdhci {
> +       status =3D "okay";
> +};
> +
> +&sdio {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       bus-width =3D <4>;
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       keep-power-in-suspend;
> +       max-frequency =3D <150000000>;
> +       mmc-pwrseq =3D <&sdio_pwrseq>;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +
> +       ap6256: wifi@1 {
> +               compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> +               reg =3D <1>;
> +               interrupt-names =3D "host-wake";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&wifi_host_wake_irq>;
> +       };
> +};
> +
> +&uart9 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
> +       uart-has-rtscts;
> +       status =3D "okay";
> +
> +       bluetooth {
> +               compatible =3D "brcm,bcm4345c5";
> +               clocks =3D <&hym8563>;
> +               clock-names =3D "lpo";
> +               device-wakeup-gpios =3D <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
> +               interrupt-names =3D "host-wakeup";
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
> +               max-speed =3D <1500000>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&bt_wake_host_irq &bt_wake_gpio>;
> +               shutdown-gpios =3D <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
> +               vbat-supply =3D <&vcc_3v3_s3>;
> +               vddio-supply =3D <&vcc_1v8_s3>;
> +       };
> +};
> +
> +&usb_host0_xhci {
> +       dr_mode =3D "host";
> +};
> +
> +&usbdp_phy0 {
> +       rockchip,dp-lane-mux =3D <0 1>;

You probably also need a definition for your DP to HDMI bridge and the
HDMI type A connector. Do you get image output on the HDMI port, and
does the hotplug work? I don't see you enabling the &dp0 node with its
pinctrl and ports.

It's okay to leave them out in the initial submission if you wish, but
then it's best mentioned in the commit description.

Best regards,
Alexey

