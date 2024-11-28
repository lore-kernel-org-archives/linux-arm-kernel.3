Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D332D690ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKBe2f1d/nSE8/83S7fMxQ2H1MkATAfBQssY2mDkHqw=; b=i6ZBjfPNVwJVlaDpaaDHX6mbFD
	78FCMUu+QeRw1pT+UHUeAjQuTz9ByaRR7HIdVBV24yDLuiZ07zait3BEj3iarGP+PCVexAHv+0y+2
	aEQnUet8IIpBFceWpP2WD7Lz5mJy9J/Daa8Gie4WMB/WX3EI0dEL23jZDw6Rkf4nCF87cVtJGDgyU
	RaAdLHC1J4nLECpVmuJg+tPKP5ahSsUz8dxG1jjfK3sUqtXSPk/5GM1vwJz/pxiYB+K31TRiC3la+
	w07SzAidBzhwXglgvtBtD2IEhd/KsumSE8U0bEsk4nO0raDucX6R1Mo8zyCP+VyaH/pFmNBqeqY6F
	WkUGKGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGajg-0000000F880-2Eoc;
	Thu, 28 Nov 2024 09:22:56 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaih-0000000F80C-1LN6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 09:21:56 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffe28c12bdso1732531fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 01:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732785713; x=1733390513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKBe2f1d/nSE8/83S7fMxQ2H1MkATAfBQssY2mDkHqw=;
        b=VZ+3QzlgK/ATfzOnMykFzZQ6EbiAs0lXnrBblqb01Nt+5CNe1Zct/pt47LHJ5YxOQj
         /OX4YSMuCFUNxuLEI7qmoQQc+SIS5Pugak5V4eiVPaqKDm2FjJl4LGXMpGZzIFGMiafM
         Uk4W9EY0AbKhcF/NeOussE0H9t3JleHsJNH/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732785713; x=1733390513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKBe2f1d/nSE8/83S7fMxQ2H1MkATAfBQssY2mDkHqw=;
        b=IJIcKIOVGxt6JL5lPCkiN34yLwshx4mJxn1B4ueiqBzozhD6JO93fxyC+WQfUiVhyz
         LG1VlxvzlQ7yAgglt72f+moC1Vmj/Xo4hy9jrr05vRgAzrMVacH8ZeQerytFHv5dvQwG
         1984cOCnoo7+c7SAW8uo1VwjcdZ02iXw2jZoNdCY7jocfkgadl8MKjDY00+I44T+DxWa
         vrOh5mMJSD18x+afWtJxoREzmFacQKexjvu9gMWK9mqaDAp++AgMf4sk3yrAu7JKzAbh
         YeVBpJUnU1ap++bDLp/8Bi+7DWOiD94hq+B1FxVpAU13mhZuu1MwyY4dV+RyH4NOYgre
         Yl5g==
X-Forwarded-Encrypted: i=1; AJvYcCVv8oyg/k7XelMggnfe+nUGSXy0N9XxFYWfYWFYyBphV/bYONNFg1T4M3DJqDP1ApBvTxh2xT7dojzciIcy9yqF@lists.infradead.org
X-Gm-Message-State: AOJu0YwbsQzZjXjbFBbbZI/h++E2dAPno3pzQwYpcsjlomwX0CGT/180
	8BTva+5HZYsG/MEAu4loDQRd7FrzbBZ7b202DxfLI7M7bzT0CudmmIRkViX1hRb2FPqW/OlRA8T
	8xqPOJje4RDu+if731kKvgdjQ/+ozZZD057Zq
X-Gm-Gg: ASbGncsXuHjC07oSNONQQTWkcdawMQpdmH5rIQaanHaD4r9AwgGFdlJR1yBtVK0M+uR
	jqnj0arGl5FZDMMlDOIeof2VzozaUYEgb1kE2PW1fA0YrAW03ZCzOZUXWjdo=
X-Google-Smtp-Source: AGHT+IGdj/tSc+Vg1n1HINo9pBj3OGBWaUozOoIytbHjWn8FVwKTt7H+aqMvtclp1yALw92qHHQSj6W/RYGN7E3g/EI=
X-Received: by 2002:a05:6512:3e08:b0:53d:dbec:9fca with SMTP id
 2adb3069b0e04-53df001abb1mr3751297e87.0.1732785712733; Thu, 28 Nov 2024
 01:21:52 -0800 (PST)
MIME-Version: 1.0
References: <20241124085739.290556-1-fshao@chromium.org> <20241124085739.290556-3-fshao@chromium.org>
In-Reply-To: <20241124085739.290556-3-fshao@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Nov 2024 17:21:41 +0800
Message-ID: <CAGXv+5GeoDK92Zj1vdjwbj-kaTdtmOof9AJySxNYW3EA0960VQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_012155_387089_DEC53599 
X-CRM114-Status: GOOD (  25.55  )
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

On Sun, Nov 24, 2024 at 5:01=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Introduce MT8188-based Chromebook Ciri, also known commercially as
> Lenovo Chromebook Duet (11", 9).
>
> Ciri is a detachable device based on the Geralt design, where Geralt is
> the codename for the MT8188 platform. Ciri offers 8 SKUs to accommodate
> different combinations of second-source components, including:
> - audio codecs (RT5682S and ES8326)
> - speaker amps (TAS2563 and MAX98390)
> - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)

Of note, a couple things are not working:

- Touchscreen: missing driver for HiMax SPI HID
- Trackpad on detachable base: missing driver support in CBAS and
    associated device tree node

A couple things below.

> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
> Changes in v3:
> - drop scp_mem, scp_pins and SCP declaration per discussion in v2
> - drop unused (for now) dual-SCP reserved memory range
> - drop unused touchscreen pinctrl
> - drop unused HID-I2C touchscreen node in I2C-2
> - drop unused AP-SAR sensor node in I2C-3
> - drop trackpad node in I2C-4 (only work with downstream CBAS)
> - drop mmc1 (unused in public product)
> - drop eDP panel path (unused in public product)
> - declare DSI panel compatibles in individual board .dts files
> - declare CPU TDP target in -geralt.dtsi instead
> - move spi1 default and sleep pinctrl to -geralt.dtsi
> - leave memory@40000000 size empty (filled by bootloader)
> - consolidate audio codec/amplifier, DAI link declaration and
>   audio-routing property
> - stop sourcing `arm/cros-ec-sbs.dtsi` in -geralt.dtsi, because all that
>   does is to declare sbs-battery at address 0xb, which doesn't align
>   with the final design at 0xf. This saves us a /delete-node/.
> - minor format fix
>
> Changes in v2:
> - remove invalid or undocumented properties
>     e.g. mediatek,dai-link, maxim,dsm_param_name etc.
> - remove touchscreen as the driver is not yet accepted in upstream
> - update sound DAI link node name to match the binding
> - add missing pinctrls in audio codec nodes
>
>  arch/arm64/boot/dts/mediatek/Makefile         |    8 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   32 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   59 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   59 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   32 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   48 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   72 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   72 +
>  .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   48 +
>  .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  316 +++++
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1156 +++++++++++++++++
>  11 files changed, 1902 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.=
dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi

[...]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> new file mode 100644
> index 000000000000..b6abecbcfa81
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -0,0 +1,1156 @@

[...]

Looking at the schematic, the following two are actually a TPS65132S
on i2c3. It should be modeled as such. <&pio 3> is the enable GPIO
for both positive and negative regulators, while <&pio 4> goes to
the SYNC pin, which enables higher load on the negative side when
driven high. The latter is not supported by the driver or binding.

The TPS65132S has a different power sequence requirement compared
to the other TPS65132 variants.

> +       ppvar_mipi_disp_avdd: regulator-ppvar-mipi-disp-avdd {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ppvar_mipi_disp_avdd";
> +               enable-active-high;
> +               gpio =3D <&pio 3 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&mipi_disp_avdd_en>;
> +               vin-supply =3D <&pp5000_z1>;
> +       };
> +
> +       ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ppvar_mipi_disp_avee";
> +               regulator-enable-ramp-delay =3D <10000>;
> +               enable-active-high;
> +               gpio =3D <&pio 4 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&mipi_disp_avee_en>;
> +               vin-supply =3D <&pp5000_z1>;
> +       };
> +

[...]

> +&i2c2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c2_pins>;
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +};

&i2c2 on Ciri is completely unused. Please re-disable it there.


ChenYu

