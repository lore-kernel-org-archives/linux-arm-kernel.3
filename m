Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01029FA0C43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbxvJOa/JYW1hnfdEB5jM3Immknkau71T9SFVcN6XMA=; b=s2HqsXsM6/x0VlMMH/YECLiOzm
	DODyYGRD+L8iLne+LX1YHPoDJFfAVp05uuWc68lemqa16qazm+IDhCyXbvgTl6z3/7WDPfS/GUqBJ
	qhGLszdTZsBv5NnEcT3+1ep71EqZFzJKM3iwFlH1GFF5qZ7FABu1n5vWtuErlzRbK2s6lw26Wl8CZ
	J8cfBhcWi7BZZCtvwc7nK6zcOeXAYbMEali1j/Iaky6p9jxbUqhqAuzuxBWB7NMT5PbYZ5axO9jE5
	/Y15PpRDGCMHgZPCQAeNSy4nNEsxnG7K8HbE9Zyl4EaQfxcpVNXIFGZ4CSvoKRHBBdczNDf+GEw7/
	FkL3jrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvCf-00000000lZS-3Fds;
	Wed, 15 Apr 2026 08:02:29 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvCc-00000000lYP-3Lby
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:02:29 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50d7c12e48eso62140561cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 01:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776240144; cv=none;
        d=google.com; s=arc-20240605;
        b=Jfs5YFSzLnpbx6cvoVdlvky6FciMz1xWTm0suKGy58yYUDp/JXe9R3Vlofj3IAadV9
         jjM9ToXHJv6782xA7qEkC8gVBSED+7blb0CokXgVlPHKo7NYNxwDh/YheEnsW+dr+eKp
         zdVDX2tqp5i/6Pmxm3yfZkpenr8LSh2vZZOUYiqbFm3Og3kHSZES+FESwDq4PXZ+GPk8
         fT8aNWWY3kQAH+J35/16ePWaV8lYc1cNWR7OtoIQ40hu+HEl1f1e63umfgQuK6tcuhpm
         9M7QMcX0H1kadoLMsReYn3+un3c6St8c48YNkGiqtmtXqgo5cO2vYdkyuV7WFd17h0w6
         2y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rbxvJOa/JYW1hnfdEB5jM3Immknkau71T9SFVcN6XMA=;
        fh=w52o5iVnKsopf4w1F8ysSvdQZPHFTdoZQpeKsQ/MGlc=;
        b=QwezvZTHEYKWtqEsrqCI6uIr5+cQk8VOPqUa1wE4qRZiA9WsIrqy1sIOTQeD/ws9/4
         hQ9s16OhqSU9gsiDjfNvP3PoFsyhLREDizlDftM5dYF4PDT+UdVAzub1gP2UyI57Nfky
         UJ5KBbmEh0sm2qn2QsqLOnqm12J2sA/sx9NhJNIDIrKcKCc8iXH/XIFlsbHN+F5TflbI
         JOEkLJL6maucE4FmOqPLYKA3nYGf5b1V4CcGEEcEj712AvvvxcPhwp2F871N97aQNMD1
         2717ue3xO2sM24Jq/Jnj3ynOu9cSE+Ul1Jw34GGPXQrvXLPW22L+Yb1ZnzrUzLXtBfDe
         JQ/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776240144; x=1776844944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbxvJOa/JYW1hnfdEB5jM3Immknkau71T9SFVcN6XMA=;
        b=A4DKLgumQJXy18WO0/ncUU76f84WuoZff0hEqJBMur6IeX58Uv8zUgw+LhQDdG6lCs
         ZdaBQWi/NrYv0c1BKjV2k9P9N9WscKYOl21Qw1fPSBEXdtX6SMZAjj7uDAvtbjG6t+R9
         IYTrQEnNDCB3Nvu37elhuR6XNuc5vyH3Wi7d8Cu/hiAplWgTqBh5jT86LBQuqzpQePMm
         BR7E6zf5Qxqt+R64/5c/yjrYU8L5WTqbC3ybMafwmqLxA1+X+7QSn3Zjg4lAnuZbys4W
         X1IKsxSZPQSQX4URJGhMeEjbMC2qT+zwsBjHfaQn+5uT7VmGm3coLxTXGpcOsiPL+eWu
         RFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240144; x=1776844944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rbxvJOa/JYW1hnfdEB5jM3Immknkau71T9SFVcN6XMA=;
        b=FGedJgrmqvdy502nh98Pm/DwWnftXfHQJ+itT7Ymlrwy9JCqIhK0OG46Hgn7C1l2XR
         HknzWiDlZR3Reh/l7Pv+hJX82rFnYRlj7a1yaVBMbv7nTFSBMr1JAdF7vRMZmlzbFnX/
         acLH4L37jQGfnby3gUKrQEiCJO2/Qh+10Gn0CPz5ph2Ljoe1W404F7Am8tgwjvyf1wVF
         x1phAoJAmsSqL091vNkgGzTqG9NyE6ZMBcK7k5hTf6OJK7aPblZYqWcJREI7E067f8zI
         KmqZOBTXL31O17c/+CUY9O9s9bB1zQcQVe1q6hZ/1G1LnIP1WAMVcLU63oaBN6ytKnxN
         oS7g==
X-Forwarded-Encrypted: i=1; AFNElJ9YxqJBJykH3thzYIG5W12Xi7gqhqt7wyjeerGCq9WKRFB2csl+w6K18xerQsEkyTlxH/pqUmW5J0mnvbzaxCoC@lists.infradead.org
X-Gm-Message-State: AOJu0YxfSTOrwocL99y0tMaa1eCKDK6735OqPwsHmfTDZmph49iXiDrn
	Ex5WzPSR26jhPkUdvSw3WgnBpUinhCQWxzXFgpsPInoWUQ3sFV71DlIT5zr5x/NHhV8vfsRviKl
	4t/nBA0oqLVlEoAOdJgdb38IzVZtIfqc=
X-Gm-Gg: AeBDietqzVFeztXr7M7stqAE5SNEGdbteD20wmSZvB8rRctmMcANAyE0Jm4JnyNO3jW
	Gy5HAdqkR8dU6ot8/DZBsZ4lZWQVkl3xuB4NJoAvtWcerfSgkoP8dIKxh/gMd21irUGmOqspsE6
	qXyoBST2wlW+ocbLsOdCtDpFBmBgQspJCadDKnHr1BX19pftfTi3hpBjngEE4FB601DN6g39H2v
	/8MTrFsDaNnH1QJPjI841ndzpybrOPUUrZ3K+RSxcLUYTs/u8txWU/PrqvbOvnPlu7YCKbDAVly
	WgfNy8g=
X-Received: by 2002:a05:622a:5592:b0:509:20aa:49ea with SMTP id
 d75a77b69052e-50dd6b7ab10mr259839571cf.18.1776240144181; Wed, 15 Apr 2026
 01:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260414214104.1363987-1-dennis@ausil.us> <20260414214104.1363987-6-dennis@ausil.us>
In-Reply-To: <20260414214104.1363987-6-dennis@ausil.us>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 15 Apr 2026 12:02:09 +0400
X-Gm-Features: AQROBzBxinnSm0ZUpMUnsQeJ0Cy2sLYN8DnKCbBE6CuxbhvJuI91PMGKe2ZVeXI
Message-ID: <CABjd4Yy29f7g7wyZZJj0aZfoREaUANjo+Lj=p1gk5Q=NU7mODA@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: Dennis Gilmore <dennis@ausil.us>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hsun Lai <i@chainsx.cn>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
	John Clark <inindev@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Peter Robinson <pbrobinson@gmail.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Robert Foss <rfoss@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_010226_927096_FAEFD81C 
X-CRM114-Status: GOOD (  22.00  )
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

On Wed, Apr 15, 2026 at 1:41=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> wr=
ote:
>
> The Orange Pi 5 Pro uses the same SoC and base as the Orange Pi 5 and
> Orange Pi 5B but has had sound, USB, and leds wired up differently. The
> 5 and 5B boards use gmac for ethernet where the Pro has a PCIe attached
> NIC.
>
> Move the 5/5B-specific bits (analog-sound/es8388, FUSB302 Type-C,
> gmac1, pwm-leds, i2s1_8ch routing, USB role-switch plumbing) out of
> rk3588s-orangepi-5.dtsi into a new rk3588s-orangepi-5-5b.dtsi that is
> included by both 5 and 5B.
>
> The RK806 PLDO1 and PLDO2 outputs are wired differently between the
> 5/5B and the Pro (PLDO1/PLDO2 are swapped), so label the PMIC node
> rk806_single in the base dtsi, drop pldo-reg1/pldo-reg2 from it, and
> define them via a &rk806_single regulators augmentation in
> rk3588s-orangepi-5-5b.dtsi. The Pro will supply its own mapping.
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 222 +++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 225 +-----------------
>  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
>  4 files changed, 240 insertions(+), 215 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dt=
si

Hi Dennis,

Sashiko makes a good point [1] about also moving the vbus_typec to the
*-5-5b.dtsi, given that it's not used on the Pro. Same with mdio1
which only makes sense together with its respective GMAC. Other than
that, this looks good to me - feel free to include:

Reviewed-by: Alexey Charkov <alchark@gmail.com

Best regards,
Alexey

[1] https://sashiko.dev/#/patchset/20260414214104.1363987-1-dennis%40ausil.=
us

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
> new file mode 100644
> index 000000000000..9e987ffa6241
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Device tree definitions shared by the Orange Pi 5 and Orange Pi 5B
> + * but not the Orange Pi 5 Pro.
> + */
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3588s-orangepi-5.dtsi"
> +
> +/ {
> +       aliases {
> +               ethernet0 =3D &gmac1;
> +       };
> +
> +       analog-sound {
> +               compatible =3D "simple-audio-card";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&hp_detect>;
> +               simple-audio-card,name =3D "rockchip,es8388";
> +               simple-audio-card,bitclock-master =3D <&masterdai>;
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,frame-master =3D <&masterdai>;
> +               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_AC=
TIVE_HIGH>;
> +               simple-audio-card,mclk-fs =3D <256>;
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
> +                       sound-dai =3D <&i2s1_8ch>;
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
> +               led {
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       function =3D LED_FUNCTION_STATUS;
> +                       linux,default-trigger =3D "heartbeat";
> +                       max-brightness =3D <255>;
> +                       pwms =3D <&pwm0 0 25000 0>;
> +               };
> +       };
> +};
> +
> +&gmac1 {
> +       clock_in_out =3D "output";
> +       phy-handle =3D <&rgmii_phy1>;
> +       phy-mode =3D "rgmii-rxid";
> +       pinctrl-0 =3D <&gmac1_miim
> +                       &gmac1_tx_bus2
> +                       &gmac1_rx_bus2
> +                       &gmac1_rgmii_clk
> +                       &gmac1_rgmii_bus>;
> +       pinctrl-names =3D "default";
> +       tx_delay =3D <0x42>;
> +       status =3D "okay";
> +};
> +
> +&i2c6 {
> +       es8388: audio-codec@10 {
> +               compatible =3D "everest,es8388", "everest,es8328";
> +               reg =3D <0x10>;
> +               clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +               AVDD-supply =3D <&vcca_3v3_s0>;
> +               DVDD-supply =3D <&vcca_1v8_s0>;
> +               HPVDD-supply =3D <&vcca_3v3_s0>;
> +               PVDD-supply =3D <&vcca_3v3_s0>;
> +               assigned-clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> +               assigned-clock-rates =3D <12288000>;
> +               #sound-dai-cells =3D <0>;
> +       };
> +
> +       usbc0: usb-typec@22 {
> +               compatible =3D "fcs,fusb302";
> +               reg =3D <0x22>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&usbc0_int>;
> +               vbus-supply =3D <&vbus_typec>;
> +               status =3D "okay";
> +
> +               usb_con: connector {
> +                       compatible =3D "usb-c-connector";
> +                       label =3D "USB-C";
> +                       data-role =3D "dual";
> +                       op-sink-microwatt =3D <1000000>;
> +                       power-role =3D "dual";
> +                       sink-pdos =3D
> +                               <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM=
)>;
> +                       source-pdos =3D
> +                               <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM=
)>;
> +                       try-power-role =3D "source";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       usbc0_hs: endpoint {
> +                                               remote-endpoint =3D <&usb=
_host0_xhci_drd_sw>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       usbc0_ss: endpoint {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_typec_ss>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +                                       usbc0_sbu: endpoint {
> +                                               remote-endpoint =3D <&usb=
dp_phy0_typec_sbu>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&i2s1_8ch {
> +       rockchip,i2s-tx-route =3D <3 2 1 0>;
> +       rockchip,i2s-rx-route =3D <1 3 2 0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2s1m0_sclk
> +                          &i2s1m0_mclk
> +                          &i2s1m0_lrck
> +                          &i2s1m0_sdi1
> +                          &i2s1m0_sdo3>;
> +       status =3D "okay";
> +};
> +
> +&pwm0 {
> +       pinctrl-0 =3D <&pwm0m2_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
> +
> +&rk806_single {
> +       regulators {
> +               vcc_1v8_s0: pldo-reg1 {
> +                       regulator-name =3D "vcc_1v8_s0";
> +                       regulator-always-on;
> +                       regulator-boot-on;
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +
> +                       regulator-state-mem {
> +                               regulator-off-in-suspend;
> +                       };
> +               };
> +
> +               vcca_1v8_s0: pldo-reg2 {
> +                       regulator-name =3D "vcca_1v8_s0";
> +                       regulator-always-on;
> +                       regulator-boot-on;
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +
> +                       regulator-state-mem {
> +                               regulator-off-in-suspend;
> +                               regulator-suspend-microvolt =3D <1800000>=
;
> +                       };
> +               };
> +       };
> +};
> +
> +
> +&usb_host0_xhci {
> +       dr_mode =3D "otg";
> +       usb-role-switch;
> +
> +       port {
> +               usb_host0_xhci_drd_sw: endpoint {
> +                       remote-endpoint =3D <&usbc0_hs>;
> +               };
> +       };
> +};
> +
> +&usb_host2_xhci {
> +       status =3D "okay";
> +};
> +
> +&usbdp_phy0 {
> +       mode-switch;
> +       orientation-switch;
> +       sbu1-dc-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> +       sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
> +
> +       port {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               usbdp_phy0_typec_ss: endpoint@0 {
> +                       reg =3D <0>;
> +                       remote-endpoint =3D <&usbc0_ss>;
> +               };
> +
> +               usbdp_phy0_typec_sbu: endpoint@1 {
> +                       reg =3D <1>;
> +                       remote-endpoint =3D <&usbc0_sbu>;
> +               };
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/a=
rm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> index 83b9b6645a1e..d76bdf1b5e90 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
> @@ -2,12 +2,16 @@
>
>  /dts-v1/;
>
> -#include "rk3588s-orangepi-5.dtsi"
> +#include "rk3588s-orangepi-5-5b.dtsi"
>
>  / {
>         model =3D "Xunlong Orange Pi 5";
>         compatible =3D "xunlong,orangepi-5", "rockchip,rk3588s";
>
> +       aliases {
> +               mmc0 =3D &sdmmc;
> +       };
> +
>         vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
>                 compatible =3D "regulator-fixed";
>                 enable-active-high;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/=
arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> index fd5c6a025cd1..2b605e5fc35a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
> @@ -3,19 +3,13 @@
>  /dts-v1/;
>
>  #include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/soc/rockchip,vop2.h>
> -#include <dt-bindings/usb/pd.h>
>  #include "rk3588s.dtsi"
>
>  / {
> -       aliases {
> -               ethernet0 =3D &gmac1;
> -               mmc0 =3D &sdmmc;
> -       };
> -
>         chosen {
>                 stdout-path =3D "serial2:1500000n8";
>         };
> @@ -34,38 +28,6 @@ button-recovery {
>                 };
>         };
>
> -       analog-sound {
> -               compatible =3D "simple-audio-card";
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&hp_detect>;
> -               simple-audio-card,name =3D "rockchip,es8388";
> -               simple-audio-card,bitclock-master =3D <&masterdai>;
> -               simple-audio-card,format =3D "i2s";
> -               simple-audio-card,frame-master =3D <&masterdai>;
> -               simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD5 GPIO_AC=
TIVE_HIGH>;
> -               simple-audio-card,mclk-fs =3D <256>;
> -               simple-audio-card,routing =3D
> -                       "Headphones", "LOUT1",
> -                       "Headphones", "ROUT1",
> -                       "LINPUT1", "Microphone Jack",
> -                       "RINPUT1", "Microphone Jack",
> -                       "LINPUT2", "Onboard Microphone",
> -                       "RINPUT2", "Onboard Microphone";
> -               simple-audio-card,widgets =3D
> -                       "Microphone", "Microphone Jack",
> -                       "Microphone", "Onboard Microphone",
> -                       "Headphone", "Headphones";
> -
> -               simple-audio-card,cpu {
> -                       sound-dai =3D <&i2s1_8ch>;
> -               };
> -
> -               masterdai: simple-audio-card,codec {
> -                       sound-dai =3D <&es8388>;
> -                       system-clock-frequency =3D <12288000>;
> -               };
> -       };
> -
>         hdmi0-con {
>                 compatible =3D "hdmi-connector";
>                 type =3D "a";
> @@ -77,18 +39,6 @@ hdmi0_con_in: endpoint {
>                 };
>         };
>
> -       pwm-leds {
> -               compatible =3D "pwm-leds";
> -
> -               led {
> -                       color =3D <LED_COLOR_ID_GREEN>;
> -                       function =3D LED_FUNCTION_STATUS;
> -                       linux,default-trigger =3D "heartbeat";
> -                       max-brightness =3D <255>;
> -                       pwms =3D <&pwm0 0 25000 0>;
> -               };
> -       };
> -
>         vbus_typec: regulator-vbus-typec {
>                 compatible =3D "regulator-fixed";
>                 enable-active-high;
> @@ -101,15 +51,6 @@ vbus_typec: regulator-vbus-typec {
>                 vin-supply =3D <&vcc5v0_sys>;
>         };
>
> -       vcc5v0_sys: regulator-vcc5v0-sys {
> -               compatible =3D "regulator-fixed";
> -               regulator-name =3D "vcc5v0_sys";
> -               regulator-always-on;
> -               regulator-boot-on;
> -               regulator-min-microvolt =3D <5000000>;
> -               regulator-max-microvolt =3D <5000000>;
> -       };
> -
>         vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>                 compatible =3D "regulator-fixed";
>                 gpios =3D <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
> @@ -119,6 +60,15 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
>                 regulator-max-microvolt =3D <3300000>;
>                 vin-supply =3D <&vcc_3v3_s3>;
>         };
> +
> +       vcc5v0_sys: regulator-vcc5v0-sys {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vcc5v0_sys";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
>  };
>
>  &combphy0_ps {
> @@ -161,20 +111,6 @@ &cpu_l3 {
>         cpu-supply =3D <&vdd_cpu_lit_s0>;
>  };
>
> -&gmac1 {
> -       clock_in_out =3D "output";
> -       phy-handle =3D <&rgmii_phy1>;
> -       phy-mode =3D "rgmii-rxid";
> -       pinctrl-0 =3D <&gmac1_miim
> -                    &gmac1_tx_bus2
> -                    &gmac1_rx_bus2
> -                    &gmac1_rgmii_clk
> -                    &gmac1_rgmii_bus>;
> -       pinctrl-names =3D "default";
> -       tx_delay =3D <0x42>;
> -       status =3D "okay";
> -};
> -
>  &gpu {
>         mali-supply =3D <&vdd_gpu_s0>;
>         status =3D "okay";
> @@ -270,69 +206,6 @@ &i2c6 {
>         pinctrl-0 =3D <&i2c6m3_xfer>;
>         status =3D "okay";
>
> -       es8388: audio-codec@10 {
> -               compatible =3D "everest,es8388", "everest,es8328";
> -               reg =3D <0x10>;
> -               clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> -               AVDD-supply =3D <&vcca_3v3_s0>;
> -               DVDD-supply =3D <&vcca_1v8_s0>;
> -               HPVDD-supply =3D <&vcca_3v3_s0>;
> -               PVDD-supply =3D <&vcca_3v3_s0>;
> -               assigned-clocks =3D <&cru I2S1_8CH_MCLKOUT>;
> -               assigned-clock-rates =3D <12288000>;
> -               #sound-dai-cells =3D <0>;
> -       };
> -
> -       usbc0: usb-typec@22 {
> -               compatible =3D "fcs,fusb302";
> -               reg =3D <0x22>;
> -               interrupt-parent =3D <&gpio0>;
> -               interrupts =3D <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&usbc0_int>;
> -               vbus-supply =3D <&vbus_typec>;
> -               status =3D "okay";
> -
> -               usb_con: connector {
> -                       compatible =3D "usb-c-connector";
> -                       label =3D "USB-C";
> -                       data-role =3D "dual";
> -                       op-sink-microwatt =3D <1000000>;
> -                       power-role =3D "dual";
> -                       sink-pdos =3D
> -                               <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM=
)>;
> -                       source-pdos =3D
> -                               <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM=
)>;
> -                       try-power-role =3D "source";
> -
> -                       ports {
> -                               #address-cells =3D <1>;
> -                               #size-cells =3D <0>;
> -
> -                               port@0 {
> -                                       reg =3D <0>;
> -                                       usbc0_hs: endpoint {
> -                                               remote-endpoint =3D <&usb=
_host0_xhci_drd_sw>;
> -                                       };
> -                               };
> -
> -                               port@1 {
> -                                       reg =3D <1>;
> -                                       usbc0_ss: endpoint {
> -                                               remote-endpoint =3D <&usb=
dp_phy0_typec_ss>;
> -                                       };
> -                               };
> -
> -                               port@2 {
> -                                       reg =3D <2>;
> -                                       usbc0_sbu: endpoint {
> -                                               remote-endpoint =3D <&usb=
dp_phy0_typec_sbu>;
> -                                       };
> -                               };
> -                       };
> -               };
> -       };
> -
>         hym8563: rtc@51 {
>                 compatible =3D "haoyu,hym8563";
>                 reg =3D <0x51>;
> @@ -346,18 +219,6 @@ hym8563: rtc@51 {
>         };
>  };
>
> -&i2s1_8ch {
> -       rockchip,i2s-tx-route =3D <3 2 1 0>;
> -       rockchip,i2s-rx-route =3D <1 3 2 0>;
> -       pinctrl-names =3D "default";
> -       pinctrl-0 =3D <&i2s1m0_sclk
> -                    &i2s1m0_mclk
> -                    &i2s1m0_lrck
> -                    &i2s1m0_sdi1
> -                    &i2s1m0_sdo3>;
> -       status =3D "okay";
> -};
> -
>  &i2s5_8ch {
>         status =3D "okay";
>  };
> @@ -404,12 +265,6 @@ typec5v_pwren: typec5v-pwren {
>         };
>  };
>
> -&pwm0 {
> -       pinctrl-0 =3D <&pwm0m2_pins>;
> -       pinctrl-names =3D "default";
> -       status =3D "okay";
> -};
> -
>  &rknn_core_0 {
>         npu-supply =3D <&vdd_npu_s0>;
>         sram-supply =3D <&vdd_npu_s0>;
> @@ -491,7 +346,7 @@ &spi2 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&spi2m2_cs0 &spi2m2_pins>;
>
> -       pmic@0 {
> +       rk806_single: pmic@0 {
>                 compatible =3D "rockchip,rk806";
>                 reg =3D <0x0>;
>                 interrupt-parent =3D <&gpio0>;
> @@ -666,31 +521,6 @@ regulator-state-mem {
>                                 };
>                         };
>
> -                       vcc_1v8_s0: pldo-reg1 {
> -                               regulator-name =3D "vcc_1v8_s0";
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                               regulator-min-microvolt =3D <1800000>;
> -                               regulator-max-microvolt =3D <1800000>;
> -
> -                               regulator-state-mem {
> -                                       regulator-off-in-suspend;
> -                               };
> -                       };
> -
> -                       vcca_1v8_s0: pldo-reg2 {
> -                               regulator-name =3D "vcca_1v8_s0";
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                               regulator-min-microvolt =3D <1800000>;
> -                               regulator-max-microvolt =3D <1800000>;
> -
> -                               regulator-state-mem {
> -                                       regulator-off-in-suspend;
> -                                       regulator-suspend-microvolt =3D <=
1800000>;
> -                               };
> -                       };
> -
>                         vdda_1v2_s0: pldo-reg3 {
>                                 regulator-name =3D "vdda_1v2_s0";
>                                 regulator-always-on;
> @@ -841,26 +671,7 @@ &uart2 {
>  };
>
>  &usbdp_phy0 {
> -       mode-switch;
> -       orientation-switch;
> -       sbu1-dc-gpios =3D <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
> -       sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
>         status =3D "okay";
> -
> -       port {
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
> -               usbdp_phy0_typec_ss: endpoint@0 {
> -                       reg =3D <0>;
> -                       remote-endpoint =3D <&usbc0_ss>;
> -               };
> -
> -               usbdp_phy0_typec_sbu: endpoint@1 {
> -                       reg =3D <1>;
> -                       remote-endpoint =3D <&usbc0_sbu>;
> -               };
> -       };
>  };
>
>  &usb_host0_ehci {
> @@ -872,15 +683,7 @@ &usb_host0_ohci {
>  };
>
>  &usb_host0_xhci {
> -       dr_mode =3D "otg";
> -       usb-role-switch;
>         status =3D "okay";
> -
> -       port {
> -               usb_host0_xhci_drd_sw: endpoint {
> -                       remote-endpoint =3D <&usbc0_hs>;
> -               };
> -       };
>  };
>
>  &usb_host1_ehci {
> @@ -891,7 +694,7 @@ &usb_host1_ohci {
>         status =3D "okay";
>  };
>
> -&usb_host2_xhci {
> +&vop {
>         status =3D "okay";
>  };
>
> @@ -899,10 +702,6 @@ &vop_mmu {
>         status =3D "okay";
>  };
>
> -&vop {
> -       status =3D "okay";
> -};
> -
>  &vp0 {
>         vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>                 reg =3D <ROCKCHIP_VOP2_EP_HDMI0>;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
> index d21ec320d295..8af174777809 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
> @@ -2,7 +2,7 @@
>
>  /dts-v1/;
>
> -#include "rk3588s-orangepi-5.dtsi"
> +#include "rk3588s-orangepi-5-5b.dtsi"
>
>  / {
>         model =3D "Xunlong Orange Pi 5B";
> --
> 2.53.0
>

