Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC84C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 06:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=; b=JemfxS6AT1UZ/nlOhQlrjJsEGa
	W04R//C1NAnTwzoPtdS+IU7JwM4GIlOY0havpDMKWetWhbmr7IwUTqrlcs5OcvVqdVG0eZjLJOkF7
	wRSDNukwpyce5Wa0HGi7pA04/2AUoL0x/mznLWsO+SAuLHeKsN2ZDaTqYgTyiwMhBcpP88vmEtEnm
	SdMLgF5VYutfneg02ygaJqGLxGFFMc2FmFwp/PT5GrSpcLQUnTqHE45Vyf/DO6vz6fk6nRmYFa2DC
	hSgNA7zewPxmUikW0o5L6ggc0j1hX609+EqtchhOH5AgGa+JIm/eWLG8RT4hpjZXvx+xgzP0rkQ8O
	IIOEqWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLfl-0000000GOyI-0k73;
	Wed, 08 Jul 2026 06:22:17 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLfh-0000000GOxW-39R4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 06:22:15 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66766d649fdso403579d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 23:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783491732; cv=none;
        d=google.com; s=arc-20260327;
        b=QDKTGPxvnUHVi+NumO9Skdfdusu8Z3JaBzbVac0pym5l+gWyziwa56klN4MPIAcWPi
         x05tKz+V6NHldVkKJdfAAFN27gN8Uv6SlO26S0RwpBMzTp1F4MsxRn4zeBgWL0xoOR/d
         t7+PgwFGnap03js3vEGN5Ah3YFSbA8vIvA1ErFdFutDimkPoNGgIYujdFM2L/fkBPr9e
         aUNFD3QDgyL52mW7MLGokZlC6lEBCVLPKrD63FTxEeP2IcDTbXhrV5+/6FlPF5Xb2ZIS
         j1WB4Pn2z93Sal71oqoRAh0UG6SiUYguePXv5GkyvlXfpHaRuxnc8cCAIfwZSQS76js/
         4egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        fh=cyqMS1EhhnWRbQQHJm6Q0JmvQ53i0/DxzzwfBn6Gj9k=;
        b=I5AB/+J9/5mE6bXPk1wkB9GxUaKfdeXSjP3q1ArSEpbAad570NeVPDbFpHjtTC4WzJ
         LSV9V3o19+rAVTRCmPZ1E8bs4Lu7e7P3zLiC2p5m3Z2n1gea3KXMw499vRIoTHYMGywO
         jVP4NfmECjXzn3Y7iofpFXOnieh0Ec2lOJ4AB6HC1VmHuxULdlVsB7hS5B377J2AAuXI
         gisWcbVWHziUddUxcgImIgdRO5bl9WRUlUrBIQ6qOLbM1JRjC9iEJoaiMy6EvErxBSGm
         l1FCsz04LK6d3Z0uzp4q28dL7EiCRiRXWR/CEi41uCl/Lho9QgXasRcuP+OMYyLU7JPU
         GAbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783491732; x=1784096532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        b=UTmMs2FLc2EBrUotfblVDsMIZDXJi4BejbxUTd5MOCo2V3+0ux1hRhjVRd2XJvUvfs
         /wxXZMJMdsBs08Vcp2fx3nK4zB6mwAC63+Irv4XID4YOLECtnqThWo4ZWuP3kHXiDtlj
         IYJlgbR4SNg4Xg6c81PJcW4VMc+cj7MLc5pWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491732; x=1784096532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        b=hnFBSLyJxYBTlm1XI4Ehjqdhy3szdjRN+xhetgdHflEY9fUB4eZGFbqY80/WoFPmVY
         heOmYnt8toSh6/fVVM7XYw3l0SY3/TF+uN/+sUL/D01cnX/LmwsEKUtGKK3haJxREEAx
         mz6aCyQlZ/ygBpHC2jST+EgJeDiENc+/4PQ19oXqrGprAZYIq7QLlC+K09xWDZ7ItTOL
         peDBof6t4NqBcHYzJThm7YKrrTQGnXTy7ED2iQjCtTmeyu6lnXa8NUlP5Hoz5B0WonLN
         DhPLZh0uyoWrwEbP9M4MzagMptZptC+1VsX3uanYkdMQwLQB3rItEBZeOV1ckxDxpqvm
         JBYA==
X-Forwarded-Encrypted: i=1; AHgh+RolBpD5dC9aEKvTtJeTgpOJh4A5CTk1ypEgxHINmQs6CjudARleLk5Eo22gIZSoDHKp3sjWRCj1j+FQwmMOJqYQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxP+e57bH0CB9ZX/RI3bSQ21jt9YKAuV8V4qrzVgkFNoezLXlmW
	AV6jZBFAxX7xx+UoxhEBWA6Nqipu/0m2k+bCB2lJVxwR510LzEUlmXzvOEI8OIn9p77KtmixWep
	2dgMy7CWpYeuar6dKAKpkhOt8QeSvmWjRJTYaU7FO
X-Gm-Gg: AfdE7cm7uwfgY8dC69lvSIMvJU/DAEEHUQMvaxvBCVRSz6vLIyRdagN4lgeV//Dpp+F
	1b+QS67x1LJ8JQfi0r3yeXCf0/c82YlWxPGnMA/i2qkRROHH4niIzcpiEElHMb8UNM0mvRFeEhY
	VPCTHDmfw3NKEYfyb7ZnDsoyYU4T1m+h6CH8yD4sN8UIND+Jiie6m1wIuMhyjDJgL7patYjxT5m
	Pqn2N1qhbnd2hSGHFn6B3sPPDsUSBEn2tEVfxpv+M4yyxrpuLMRXxRGM0opG8Wu+FqEaAWN7Sn2
	D9wQAMQ454LUSIuJpsNoPiFg0XA=
X-Received: by 2002:a05:690e:4841:b0:666:2480:2b0a with SMTP id
 956f58d0204a3-6679f201176mr697881d50.50.1783491732443; Tue, 07 Jul 2026
 23:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
 <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jul 2026 14:22:01 +0800
X-Gm-Features: AVVi8CeA6CFM4kR5Bt4fLtWwaGoE3MK5l8ZS1mrdHaGZI7ndDG_5d5ZiXOKEMvU
Message-ID: <CAGXv+5F9RPzKWTH1heDEUmWgE2k9mnvdj_uLO9MS5aKqN+3cDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: add Genio 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_232213_840248_F686C5F7 
X-CRM114-Status: GOOD (  23.56  )
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

On Thu, Jul 2, 2026 at 12:36=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Add support for MediaTek MT8189 SoC and its variants, and a devicetree
> for the basic hardware enablement of the Genio 720-EVK board, based on
> MT8391 SoC.
>
> MT8391 SoC is a variant of MT8189 SoC with a difference for the Arm
> Cortex-A78 CPU core maximum frequency (2.6 Ghz for MT8391, 3 Ghz for
> MT8189). MT8391 hardware register maps are identical to MT8189.
>
> The Genio 720-EVK board has following features:
>   - MT8391 SoC
>   - MT6365 PMIC
>   - MT6319 Buck IC
>   - MT6375 Charger IC
>   - 8GB LPDDR5 RAM
>   - 64GB eMMC 5.1
>   - 128GB UFS
>   - 20V DC Jack
>   - USB Type-C Power Adapter
>   - Micro SD card slot
>   - Push Button x 4 (Power, Reset, Download and Home Key)
>   - LED x 3 (System Power, Reset, DC-IN Power)
>   - USB Type-C Connector (USB 3.2) x 2
>   - USB Type-C Connector (USB 2.0) x 1
>   - 3.5mm Earphone Jack x 1 (with Microphone Input)
>   - 3.5mm Line Out Audio Jack x 1
>   - Analog Microphone x 1
>   - Digital Microphone x 2
>   - Gigabit Ethernet with RJ45 connector
>   - DP x 1 (Mode over USB Type-C)
>   - LVDS port x 1
>   - eDP port x 1
>   - UART x2 with serial-to-usb converters and USB Type-C connectors
>   - UART Port x 2 on Pin Header
>   - M.2 Slot x 2
>   - I2C Capacitive Touch Pad
>   - 4-Lane DSI x 1
>   - 4-Data Lane CSI x 2
>   - I2S Pin header
>   - 40-Pin 2.54mm Pin Header x 1
>   - CAN Bus x 1 (RS232 Connector)
>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
>  arch/arm64/boot/dts/mediatek/mt8189.dtsi           | 920 +++++++++++++++=
++++++
>  .../boot/dts/mediatek/mt8391-genio-720-evk.dts     |  27 +
>  .../boot/dts/mediatek/mt8391-genio-common.dtsi     | 673 +++++++++++++++
>  4 files changed, 1621 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/=
mediatek/Makefile
> index a86fb313b1a9..5c75ea1ef09a 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -173,6 +173,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-genio-1200-ev=
k-ufs.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-genio-700-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-grinn-genio-700-sbc.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-tungsten-smarc.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8391-genio-720-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-kontron-3-5-sbc-i1200.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l-8-hd-panel.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8189.dtsi
> new file mode 100644
> index 000000000000..272b1b34c953
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
> @@ -0,0 +1,920 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <dt-bindings/clock/mediatek,mt8189-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/power/mediatek,mt8189-power.h>
> +#include <dt-bindings/phy/phy.h>
> +
> +/ {

[...]

> +       soc {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +               dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
> +
> +               performance: performance-controller@108d78 {
> +                       compatible =3D "mediatek,cpufreq-hw";
> +                       reg =3D <0 0x00108d78 0 0x120>, <0 0x00108e98 0 0=
x120>;
> +                       #performance-domain-cells =3D <1>;
> +               };
> +
> +               gic: interrupt-controller@c000000 {
> +                       compatible =3D "arm,gic-v3";
> +                       reg =3D <0 0xc000000 0 0x40000>, /* distributor *=
/
> +                             <0 0xc040000 0 0x200000>; /* redistributor =
*/
> +                       interrupt-parent =3D <&gic>;
> +                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <4>;
> +                       #redistributor-regions =3D <1>;
> +
> +                       ppi-partitions {
> +                               ppi_cluster0: interrupt-partition-0 {
> +                                       affinity =3D <&cpu0 &cpu1 &cpu2 &=
cpu3 &cpu4 &cpu5>;
> +                               };
> +
> +                               ppi_cluster1: interrupt-partition-1 {
> +                                       affinity =3D <&cpu6 &cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               apdma: dma-controller@11300b00 {
> +                       compatible =3D "mediatek,mt8189-uart-dma", "media=
tek,mt6985-uart-dma";
> +                       reg =3D <0 0x11300b00 0 0x80>,
> +                             <0 0x11300b80 0 0x80>,
> +                             <0 0x11300c00 0 0x80>,
> +                             <0 0x11300c80 0 0x80>,
> +                             <0 0x11300d00 0 0x80>,
> +                             <0 0x11300d80 0 0x80>,
> +                             <0 0x11300e00 0 0x80>,
> +                             <0 0x11300e80 0 0x80>;
> +                       interrupts =3D <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0=
>,
> +                                    <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks =3D <&peri_ao CLK_PERAO_DMA_B>;
> +                       clock-names =3D "apdma";
> +                       dma-requests =3D <8>;
> +                       #dma-cells =3D <1>;
> +               };
> +
> +               auxadc: adc@11019000 {

The .dtsi file's device nodes should be sorted by base address.
This file's device node order is inconsistent.


ChenYu

