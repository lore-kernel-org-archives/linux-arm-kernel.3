Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEF6F3ED4B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDfIyXP/Uwov8eB2hwhNC8+qnUHzWCIDl8PJ5Ugl7vQ=; b=3cW2k/3+3KhJ/WI7qTnSFDx+NL
	t4/dzlh2JgoS719lr33kgmLIAb3v81czjpebBxO9oLacEncE8uqzd1IkPFiyel8Rs2sbN1Q6afZgY
	1LTzAtv5fzDLX1F/tqcuX2o4vPNbiusggLgoSe08Yz53jzGiI51kDIJBBMRJmO7z8bv7ViOMh9Mll
	e8EVqxRIDue80vZu6CvVo5mRxYEZVCKyDT0KC89nRfvdT8y1IOg6JvHd9qCSCMTBB+fC+TyhoKrii
	S8giJSnT2XiPgg4OAzvmUM3nl9ai88wOoFd9pEu1z2f0RSgNrJAslZsthF5iF2vZ0kf4AMPQhHF6T
	Bt6blwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBWyv-0000000DP0y-0wvl;
	Sat, 11 Apr 2026 11:58:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBWys-0000000DOza-2kY4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 11:58:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso2972137f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 04:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775908708; cv=none;
        d=google.com; s=arc-20240605;
        b=Ih9/9pi95oNKL/kS09/3xr75+H1dLC8h2m5J+Drqkdnxy7hPl7rnOBuyYwR8KWWLFR
         az7IKmaDtTY9fwQrbWbsevdo26UHQvGoGq3U4Nd4mrDVqz7GWTjm3fo05q/XKEEm0aA/
         IghZBxIcDhP5KlsnxDZGnK00aFICxxGYyfXWFprj5Da99rbG9OPpbLQ+FJoTe4TkrvIJ
         2K7tfaZeEyeJkqrMLx09AHX97vqZRjzNVn2GEnH+lME+qOCCorH7gtTMYN3GHuP9Wv+v
         v5MhiRJe29m0jq/+SVF8A5nayIxJXvSlo+PejVYZLR2I66Oo5Ex06q0CKqf/y6ipbQFf
         x5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDfIyXP/Uwov8eB2hwhNC8+qnUHzWCIDl8PJ5Ugl7vQ=;
        fh=AucAPLUXip2jSTZn4zixG7VY9pGrXvjwLm1dfqNZR18=;
        b=EE4tSiwYHW6MKa9Kla73nCA7hCdjStzREwORNbKfTDkJGbusapL+ZYDEAM4ikNoshB
         uWRV+OiCtI5rzxUcl5mGbHJRUpBOiPafFK//Vqd1H6+fx0voiMYtsSbuA5coPIcf8YzR
         dK5M52J+RaRhYs0yzrBYjzqCXQ/oFmKncu3nWmekBRm1+3uOC1T+hhnpuaneN0TkglpB
         ceKnlqJ+yGXTGa+ZqT6/dGK4F55UvhwyeqlDC9Ag2HgbILKdfdi8PVdWXjOvCZ9v+7a5
         rLEfQa6q+JqhcIm2NdYv0lN3R8WPKNECupNgWi2eGUoAH4UdVz14FHfG/wnvq4jMBW41
         jYjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775908708; x=1776513508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDfIyXP/Uwov8eB2hwhNC8+qnUHzWCIDl8PJ5Ugl7vQ=;
        b=dX2rfymK3KyqATS+eozz8qfyVIVjppCM1wVSV0LK0QjKh++Fm0Fbx3WXsxRdc7Em9i
         m1l7OIHTKrojs6Zt5jCyd+JEE5sLHmRhVYAvpsW+BmR55WEHtEW3ALIrQcKPPGoUK/kX
         6W11wA2KTq1cINOIgcDgYhy+H74tL/y52qKV+10Zfb2R2IQpaGaDJ2BkWZCOzCcK+nEo
         1+y+Xr5WQvJS3OwjjEVvSlO35VS0/H94UmvMTQMdbgPR6qO6mXFjMhoFUjB2JISg156L
         XMhDPjMY4wFFbkUF8fh8KWf8Mciu3O6I1kAg7t7qg5J3SLiiE4s+lakDjgNknNZ7J/m1
         CCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775908708; x=1776513508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XDfIyXP/Uwov8eB2hwhNC8+qnUHzWCIDl8PJ5Ugl7vQ=;
        b=Qy8pee95RxyDncxJeqcf90X4ae+L2LWlSalByi+zvgNH4I5U6vFnO18If7nh03rL4O
         KyzG+PWC1PhegRJzVUWQb8wp0SyDGxhilR09794g6SGDbzPFt3U0LAubR1oQ60oQXa41
         zgR+fqgxyxGV7e8K9uoCkuIzc1Yu1IX9eZa2hnKUAOEiml/tEfW4kEN5RhuocYO3mfMo
         yP9bfGK6YXngsR2oYBuU8yUU2FlmmS46gzt8qimY2T1CPE+Utj0OEa+ydWlwKeeXdYiO
         R/aDnCbPvdYZNshoTp7AQPePctXTma37FgmDJPAX6U6IPe1zpACWpRbxGprDwP2y70NA
         A78A==
X-Forwarded-Encrypted: i=1; AJvYcCWxlPJJcWSHz2COzTpq4nYGkwVbj76CcB3FLpkFJmDM1xLpZ0fyeWaSiR7W7nu/G2dxvQentkB3RTFJYFHFEj/x@lists.infradead.org
X-Gm-Message-State: AOJu0YzqiJygSwpBKz/H1CVyENwsSOhsVi/bF+MsVLibq5+oZ1ayZ55W
	vxHbNlpMfJKnwfd7yYn8X2wFUL7Bz08nlUKit511s6pIQCfJWBJqNHLvXv8/u/Nt6S954cRS4lm
	9wONcfXc4fhDa/RLLzrHGuWyV9G+LXO4=
X-Gm-Gg: AeBDiev/VbD95UlVWUlT8RRS1xH0DhdPh+a+KpVdHucT6othzVzFKZUA0aIuYDuKBro
	b96tph6qtHsIcFjrGiDxQGnI+7LSnlqxYdJiIHeZiMtFhVTQMCQZMzji+LtF9UZ4PKcADZWmEpJ
	SGqVdk/qTQE5MZibYTkILoMFag8HFlTih3cw6Lvo4zkNd6wFiLM/k6fw7Ik0XbBmtRo1mrFfChn
	6Ww93ozn0k/o/eK+QGT6gU2X+epg7JF2Vupn5MK2O4M/7AqzhaNdUK7p5FoKluVtQEQlva1r5JO
	GIpSQHkM/FTIOA2eUzIcjgjvtVYDG3g89Kid1rU=
X-Received: by 2002:a05:6000:4285:b0:43c:4810:dc4a with SMTP id
 ffacd0b85a97d-43d642d3630mr9789353f8f.38.1775908707676; Sat, 11 Apr 2026
 04:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260411024743.195385-1-dennis@ausil.us> <20260411024743.195385-3-dennis@ausil.us>
In-Reply-To: <20260411024743.195385-3-dennis@ausil.us>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sat, 11 Apr 2026 06:58:16 -0500
X-Gm-Features: AQROBzB-J9aCgYAe-VfePK1n3X_NKRT6WCrA17gzUMN__JIvmHRVrDeM5hAiTf4
Message-ID: <CALWfF7JAZYHwhVAT_C4XppPrBnwwKZ4iNNdwZzkzFPkxZiJuxw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] arm64: dts: rockchip: refactor items from Orange
 Pi 5/b to prep for Pro
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_045830_869873_A4BE54AF 
X-CRM114-Status: GOOD (  19.83  )
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

On Fri, Apr 10, 2026 at 9:47=E2=80=AFPM <dennis@ausil.us> wrote:
>
> From: Dennis Gilmore <dennis@ausil.us>
>
> The Orange Pi 5 Pro uses the same SoC and base as the Orange Pi 5 and
> Orange Pi 5B but has had sound, USB, and leds wired up differently. The
> boards also use gmac for ethernet where the Pro has a PCIe attached NIC.
>
> I have not changed the definitions from what was in rk3588s-orangepi-5.dt=
si
>
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>

Still works on Orange Pi 5.
Having the 5 and 5B share a dtsi is similar to how the 5 Max and 5
Ultra share a dtsi while the 5 Plus has more differences.

Tested-By: Jimmy Hon <honyuenkwun@gmail.com>
Reviewed-By: Jimmy Hon <honyuenkwun@gmail.com>

> ---
>  .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 192 +++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
>  .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 198 +-----------------
>  .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
>  4 files changed, 209 insertions(+), 189 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dt=
si
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
> new file mode 100644
> index 000000000000..b04dd667605d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
> @@ -0,0 +1,192 @@
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
> +                    &gmac1_tx_bus2
> +                    &gmac1_rx_bus2
> +                    &gmac1_rgmii_clk
> +                    &gmac1_rgmii_bus>;
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
> +               AVDD-supply =3D <&vcc_3v3_s0>;
> +               DVDD-supply =3D <&vcc_1v8_s0>;
> +               HPVDD-supply =3D <&vcc_3v3_s0>;
> +               PVDD-supply =3D <&vcc_3v3_s0>;
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
> +                    &i2s1m0_mclk
> +                    &i2s1m0_lrck
> +                    &i2s1m0_sdi1
> +                    &i2s1m0_sdo3>;
> +       status =3D "okay";
> +};
> +
> +&pwm0 {
> +       pinctrl-0 =3D <&pwm0m2_pins>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +};
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
> index dafad29f9854..5c154cc6c62a 100644
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
> -               AVDD-supply =3D <&vcc_3v3_s0>;
> -               DVDD-supply =3D <&vcc_1v8_s0>;
> -               HPVDD-supply =3D <&vcc_3v3_s0>;
> -               PVDD-supply =3D <&vcc_3v3_s0>;
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
> @@ -841,26 +696,7 @@ &uart2 {
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
> @@ -872,15 +708,7 @@ &usb_host0_ohci {
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
> @@ -891,7 +719,7 @@ &usb_host1_ohci {
>         status =3D "okay";
>  };
>
> -&usb_host2_xhci {
> +&vop {
>         status =3D "okay";
>  };
>
> @@ -899,10 +727,6 @@ &vop_mmu {
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

