Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6912E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/yhLy0x2RPN2n+KfN3/CV+wY/86FBphCXJ0uI9cdtY=; b=To0/FDgZgb+8BqT2wRpH2UCznl
	YFeDgaYVESCsQOk8597ZWpgmBZAjqtN/PlGKvznWPSWSTqKNtmMfMPNfRvWeuQ75kuGyjPXKLFE/4
	uw/kj60AzysQd5si2N+1JSejru6XwgAk3imDhNpNPR3CMIiISYGzYpKdEdMHdqZhSE5bgIFXRkwls
	4qII09MT4y25gPRsmzHuLePghY93CdYuddP6GW6BDGW+8QMi6FNab51L27l3P33Eu+G+RB9QFrOFy
	KZo3BKYoxOEkWIyIAFa6E/XaVJmQFkW7uIGaTlzJEhFaIZcAa3vE73PFymyPm0kf2kVGqCc3FnWjQ
	3w7KeuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgCV-00000009ptt-2vy1;
	Mon, 23 Dec 2024 11:02:15 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgBJ-00000009pkZ-1vHQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 11:01:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4792630e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 03:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734951659; x=1735556459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/yhLy0x2RPN2n+KfN3/CV+wY/86FBphCXJ0uI9cdtY=;
        b=KDxGTSq6/5mqAo+Mvju91BBBAmeDRvkZQiWLjgHV5s4HH/KuU0U/WJbytibpHSfX0r
         OFeRSGSWqvMKWy42jLYUbHC0Hs7/On/Ku0/BagL+81fbOS0iuJ5Yc13CHnxZkX4gl2hK
         U+6tm7lDoL9ZsTUfO9kEgr0XFPTn4sP2nrnZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734951659; x=1735556459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/yhLy0x2RPN2n+KfN3/CV+wY/86FBphCXJ0uI9cdtY=;
        b=jRRmgqg3daP76pmeK4j7ruJWpAVLmHLgDUVEtkfNRS9bUmS+1uau85JH9tO85TbABu
         qyh6o/XmO09bzhHDPfzTc6PcUPZXINAHt8YWTRHpjl2tm/U9L9utBsXlXVQI0gKBXdEh
         SKi05aUiAWOunbeV3J7q9Tq4W9Nm12yWhtHGLEXQUBsSo6lIjvDdt0ttj4kzT8d8AFoh
         fLG+afGRKK8iKIzCOqGCYpcJAhmE3TB8t3MizpAF11oTCv2PkPl71+lInxv2B2Mqqriy
         UlVXsDnQvv8TBuSRmXQFz8LvyRo6UPyYSyvDA6jEtcAXety0xSyx2oo0SY58xNW6nWYA
         rl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwA1oqqyCC6MpP2zuN6wSJPwmzxH+QBLYcv/rlL0hj2L+JiFBOPv3Udv3YT3qjtkhW1iUnYD/L9szTV8wBgaCi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7h8VaEJB+g4c3YrLG49m91EGZAHWvMTj0cNOX8Yw+kgKKkYrZ
	HNy80rvPDD750KLihrWMKtGolbTm4LF5vc8yAYnSLy0fJvurorwoZhkQRLpUOTygTfSATeC2P1F
	wZLbE2bFSvnsn6a9AgBNoeWoSGKJa5u4r4eJp
X-Gm-Gg: ASbGncuLPBrWvgrI/BMN4EY2Qf67agwezmg29rIEvJdlY/OoKqiQrtIP0gPyFSYVXUT
	HYehkxxjkLWDNHiD+HKh/rRbAnM3SEQHzQU0oFkGvXxokDlJXQyTJKVYwawqsJ7rCXg==
X-Google-Smtp-Source: AGHT+IEeGxR1/A7YAIaQNwuIN8M3ispQzQz/1XgsBv21yWEtwbRwNLgwt8VDFiTZY3VyE4P157VtOboXyGxNebyt2WE=
X-Received: by 2002:a05:6512:4010:b0:542:2e05:313b with SMTP id
 2adb3069b0e04-5422e053206mr2012579e87.21.1734951659121; Mon, 23 Dec 2024
 03:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20241223101434.2170166-1-wenst@chromium.org> <20241223101434.2170166-2-wenst@chromium.org>
In-Reply-To: <20241223101434.2170166-2-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Dec 2024 19:00:47 +0800
Message-ID: <CAGXv+5FvhaqvsApufntBABFGRRtGbr_sUjqieWfy-d3K2x+drg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192: Drop Chromebook
 variants that never shipped
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_030101_522865_C270EC76 
X-CRM114-Status: GOOD (  15.48  )
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

On Mon, Dec 23, 2024 at 6:14=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Hayato rev5 sku2 and Spherion rev4 variants were designed in
> anticipation of shortages of the headphone codec. This never happened.
> As far as our records show: the variants were never produced or
> shipped, and no such devices were deployed to any lab.
>
> Drop them.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../mt8192-asurada-hayato-r5-sku2.dts         | 65 ----------------
>  .../mediatek/mt8192-asurada-spherion-r4.dts   | 78 -------------------

Please ignore this version. I forgot to remove them from the Makefile.

I will send a v2 tomorrow.

ChenYu

>  2 files changed, 143 deletions(-)
>  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5=
-sku2.dts
>  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-=
r4.dts
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.d=
ts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
> deleted file mode 100644
> index cd86ad9ba28a..000000000000
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Copyright 2022 Google LLC
> - */
> -/dts-v1/;
> -#include "mt8192-asurada.dtsi"
> -
> -/ {
> -       model =3D "Google Hayato rev5";
> -       chassis-type =3D "convertible";
> -       compatible =3D "google,hayato-rev5-sku2", "google,hayato-sku2",
> -                    "google,hayato", "mediatek,mt8192";
> -};
> -
> -&keyboard_controller {
> -       function-row-physmap =3D <
> -               MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
> -               MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
> -               MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
> -               MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
> -               MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
> -               MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
> -               MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
> -               MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
> -               MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
> -               MATRIX_KEY(0x00, 0x04, 0)       /* T10 */
> -       >;
> -       linux,keymap =3D <
> -               MATRIX_KEY(0x00, 0x02, KEY_BACK)
> -               MATRIX_KEY(0x03, 0x02, KEY_FORWARD)
> -               MATRIX_KEY(0x02, 0x02, KEY_REFRESH)
> -               MATRIX_KEY(0x01, 0x02, KEY_FULL_SCREEN)
> -               MATRIX_KEY(0x03, 0x04, KEY_SCALE)
> -               MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> -               MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> -               MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> -               MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> -               MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
> -
> -               CROS_STD_MAIN_KEYMAP
> -       >;
> -};
> -
> -&rt5682 {
> -       compatible =3D "realtek,rt5682s";
> -};
> -
> -&sound {
> -       compatible =3D "mediatek,mt8192_mt6359_rt1015p_rt5682s";
> -
> -       speaker-codecs {
> -               sound-dai =3D <&rt1015p>;
> -       };
> -
> -       headset-codec {
> -               sound-dai =3D <&rt5682 0>;
> -       };
> -};
> -
> -&touchscreen {
> -       compatible =3D "hid-over-i2c";
> -       post-power-on-delay-ms =3D <10>;
> -       hid-descr-addr =3D <0x0001>;
> -       vdd-supply =3D <&pp3300_u>;
> -};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts =
b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
> deleted file mode 100644
> index 5e9e598bab90..000000000000
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Copyright 2022 Google LLC
> - */
> -/dts-v1/;
> -#include "mt8192-asurada.dtsi"
> -#include <dt-bindings/leds/common.h>
> -
> -/ {
> -       model =3D "Google Spherion (rev4)";
> -       chassis-type =3D "laptop";
> -       compatible =3D "google,spherion-rev4", "google,spherion",
> -                    "mediatek,mt8192";
> -
> -       pwmleds {
> -               compatible =3D "pwm-leds";
> -
> -               led {
> -                       function =3D LED_FUNCTION_KBD_BACKLIGHT;
> -                       color =3D <LED_COLOR_ID_WHITE>;
> -                       pwms =3D <&cros_ec_pwm 0>;
> -                       max-brightness =3D <1023>;
> -               };
> -       };
> -};
> -
> -&cros_ec_pwm {
> -       status =3D "okay";
> -};
> -
> -&keyboard_controller {
> -       function-row-physmap =3D <
> -               MATRIX_KEY(0x00, 0x02, 0)       /* T1 */
> -               MATRIX_KEY(0x03, 0x02, 0)       /* T2 */
> -               MATRIX_KEY(0x02, 0x02, 0)       /* T3 */
> -               MATRIX_KEY(0x01, 0x02, 0)       /* T4 */
> -               MATRIX_KEY(0x03, 0x04, 0)       /* T5 */
> -               MATRIX_KEY(0x02, 0x04, 0)       /* T6 */
> -               MATRIX_KEY(0x01, 0x04, 0)       /* T7 */
> -               MATRIX_KEY(0x02, 0x09, 0)       /* T8 */
> -               MATRIX_KEY(0x01, 0x09, 0)       /* T9 */
> -               MATRIX_KEY(0x00, 0x04, 0)       /* T10 */
> -       >;
> -       linux,keymap =3D <
> -               MATRIX_KEY(0x00, 0x02, KEY_BACK)
> -               MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
> -               MATRIX_KEY(0x02, 0x02, KEY_FULL_SCREEN)
> -               MATRIX_KEY(0x01, 0x02, KEY_SCALE)
> -               MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
> -               MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
> -               MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
> -               MATRIX_KEY(0x02, 0x09, KEY_MUTE)
> -               MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
> -               MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
> -
> -               CROS_STD_MAIN_KEYMAP
> -       >;
> -};
> -
> -&rt5682 {
> -       compatible =3D "realtek,rt5682s";
> -};
> -
> -&sound {
> -       compatible =3D "mediatek,mt8192_mt6359_rt1015p_rt5682s";
> -
> -       speaker-codecs {
> -               sound-dai =3D <&rt1015p>;
> -       };
> -
> -       headset-codec {
> -               sound-dai =3D <&rt5682 0>;
> -       };
> -};
> -
> -&touchscreen {
> -       compatible =3D "elan,ekth3500";
> -};
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

