Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223D7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMi5RFoEVw/bI61SuJJu7wo3r4lqSX9NiZVLJDNJ+Lo=; b=socDA2LdVRPRI5
	iUGocpNlo9eNrftZ3VHO2/LkNB7JPxOarbKrgF+wJLiCmmHUmqTtSPi1K/f5tJwOS3y2RTmr/FWK5
	RzPEaIPsQU/CNtg4rAqM90xcQNxWfw4YTWy4xJlIh0HdANTxy+xDCKbnD32hXUxUzrg6haY6iFPLY
	sR7lBE9NDnN3+IOFGtrvhWzELXfZEb24c8QXGJ3mOEre82wr0pqWU6wXN/38mf7xyrACIhBaVju39
	/xMQBWr02koa0O9Pyp4suhoI9TBxi/Op826CR+2zrQnfYUYbMPQ6wcVXWGFJmbjuBWp+u6lyYFPBN
	xpfJ+WYQm7tnyvlIsdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXFi-00000000eUN-07I1;
	Mon, 10 Feb 2025 17:07:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thX0E-00000000axo-2Upp;
	Mon, 10 Feb 2025 16:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ADC25C5C5E;
	Mon, 10 Feb 2025 16:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEEDC4CEF3;
	Mon, 10 Feb 2025 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739206280;
	bh=U2vjziE5GMYK6ByV+mMd6XOjSQjKurIySf6gTUHivws=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aKe86zbLMtAuCqht2fMCgtJu0hEU1pv2efLv+jBBC5Wkjhaw3Q/Jqs8ntEELCMwTv
	 adJk1Ms8ZL9uEZAhPriuuTsbgePcf52+OOR9uVwZSfMCMnVcmSETeWXup9V21KvzNO
	 kyNQyb4eLSZZHy0s8IYaL5PemwqSFhE5HFmSb3U2B8+L2HxdKg1IOz7oh5R5L25dSA
	 kWt8r9cWcjPhbpG3HZXYx8FpQHNX2yfDOPNL0DVoI4T5jq3qd8RcKKjFDwuEkWBh9O
	 wonNGU9/7wTqS4HAl+MSaQZPNp7F2SHrIOxqr7KkR33xynfv6yQM3eLyc6aonGKozI
	 Nb1a10xYPgv8w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307d9a13782so40530961fa.2;
        Mon, 10 Feb 2025 08:51:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMD0UC/JIaUGGYC1+Md9c++nge6XteyPsqXx6eP1ew4Dl2yiF6WQEW9eDK3hGAiHs8xaCisWAGQCps+lZw/EU=@lists.infradead.org, AJvYcCWEm59wx32aLnSrMijGYX6gYhC4zea71DnUTy/mZ5+mZlxiC9qziPYV1nPqZieLCFKbayxLKNJJ5v5W3aUYTpDi@lists.infradead.org
X-Gm-Message-State: AOJu0YyUBfzg0ZQ0gk3RGHIhYVZCgJcvWUupA6YVCJcCgDAxAhwUjgk7
	Ary47mEze7X2J+1pp0woMMZ9O1c+zAAJmybaMF0baXUlQ/YPzkRzlJZnZMLDskm59PrFm+rqDaH
	SiP9uyTssxKT8SiQOytZ1OnMFqBw=
X-Google-Smtp-Source: AGHT+IG5t025yFQgv5+IxDx2jt/zCEdWoaia7+P9FBemxbZfy7NIWzyqdgtOgMR7KudhZEJun+VV7TSIGjzCCgMPaoc=
X-Received: by 2002:a05:651c:2129:b0:308:f01f:1829 with SMTP id
 38308e7fff4ca-308f01f1f54mr12808581fa.6.1739206279007; Mon, 10 Feb 2025
 08:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20241226050205.30241-1-val@packett.cool> <20241226050205.30241-10-val@packett.cool>
In-Reply-To: <20241226050205.30241-10-val@packett.cool>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 11 Feb 2025 00:51:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64VhJ0KDiqfFdEG9s__uuVHCN2kss+KHi-ta8WDmG0KKA@mail.gmail.com>
X-Gm-Features: AWEUYZknWIa5-CPGuL8BqnhcoaA-Kfslk_4yIvAua3sKJhdR6f_EU04T4LA0r7U
Message-ID: <CAGb2v64VhJ0KDiqfFdEG9s__uuVHCN2kss+KHi-ta8WDmG0KKA@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
To: Val Packett <val@packett.cool>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Eddie Huang <eddie.huang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Fabien Parent <parent.f@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_085122_734088_9B56C413 
X-CRM114-Status: GOOD (  17.21  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 26, 2024 at 1:21=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
> Add the dts to be included by all boards using the MT6392 PMIC.
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/mediatek/mt6392.dtsi | 232 +++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6392.dtsi
> new file mode 100644
> index 0000000000000..a7c65dbb043c1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2024 Val Packett <val@packett.cool>
> + */
> +
> +#include <dt-bindings/input/input.h>
> +
> +&pwrap {
> +       pmic: mt6392 {
> +               compatible =3D "mediatek,mt6392";
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +
> +               regulators {
> +                       compatible =3D "mediatek,mt6392-regulator";

While listed in the binding, this doesn't actually do anything in
the driver.

> +                       mt6392_vproc_reg: buck_vproc {

Could we get rid of the "buck_" and "ldo_" prefixes?

> +                               regulator-name =3D "buck_vproc";
> +                               regulator-min-microvolt =3D <700000>;
> +                               regulator-max-microvolt =3D <1350000>;

PMIC ranges are already implied by the compatible string and regulator
node name. No need to repeat them.

> +                               regulator-ramp-delay =3D <12500>;

This probably belongs in the driver?

Comments apply to all the regulator sub-nodes.

ChenYu


> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vsys_reg: buck_vsys {
> +                               regulator-name =3D "buck_vsys";
> +                               regulator-min-microvolt =3D <1400000>;
> +                               regulator-max-microvolt =3D <2987500>;
> +                               regulator-ramp-delay =3D <25000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vcore_reg: buck_vcore {
> +                               regulator-name =3D "buck_vcore";
> +                               regulator-min-microvolt =3D <700000>;
> +                               regulator-max-microvolt =3D <1350000>;
> +                               regulator-ramp-delay =3D <12500>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vxo22_reg: ldo_vxo22 {
> +                               regulator-name =3D "ldo_vxo22";
> +                               regulator-min-microvolt =3D <2200000>;
> +                               regulator-max-microvolt =3D <2200000>;
> +                               regulator-enable-ramp-delay =3D <110>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vaud22_reg: ldo_vaud22 {
> +                               regulator-name =3D "ldo_vaud22";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <2200000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vcama_reg: ldo_vcama {
> +                               regulator-name =3D "ldo_vcama";
> +                               regulator-min-microvolt =3D <2800000>;
> +                               regulator-max-microvolt =3D <2800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vaud28_reg: ldo_vaud28 {
> +                               regulator-name =3D "ldo_vaud28";
> +                               regulator-min-microvolt =3D <2800000>;
> +                               regulator-max-microvolt =3D <2800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vadc18_reg: ldo_vadc18 {
> +                               regulator-name =3D "ldo_vadc18";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vcn35_reg: ldo_vcn35 {
> +                               regulator-name =3D "ldo_vcn35";
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3600000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vio28_reg: ldo_vio28 {
> +                               regulator-name =3D "ldo_vio28";
> +                               regulator-min-microvolt =3D <2800000>;
> +                               regulator-max-microvolt =3D <2800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vusb_reg: ldo_vusb {
> +                               regulator-name =3D "ldo_vusb";
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vmc_reg: ldo_vmc {
> +                               regulator-name =3D "ldo_vmc";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vmch_reg: ldo_vmch {
> +                               regulator-name =3D "ldo_vmch";
> +                               regulator-min-microvolt =3D <3000000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vemc3v3_reg: ldo_vemc3v3 {
> +                               regulator-name =3D "ldo_vemc3v3";
> +                               regulator-min-microvolt =3D <3000000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vgp1_reg: ldo_vgp1 {
> +                               regulator-name =3D "ldo_vgp1";
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vgp2_reg: ldo_vgp2 {
> +                               regulator-name =3D "ldo_vgp2";
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vcn18_reg: ldo_vcn18 {
> +                               regulator-name =3D "ldo_vcn18";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vcamaf_reg: ldo_vcamaf {
> +                               regulator-name =3D "ldo_vcamaf";
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vm_reg: ldo_vm {
> +                               regulator-name =3D "ldo_vm";
> +                               regulator-min-microvolt =3D <1240000>;
> +                               regulator-max-microvolt =3D <1390000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vio18_reg: ldo_vio18 {
> +                               regulator-name =3D "ldo_vio18";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vcamd_reg: ldo_vcamd {
> +                               regulator-name =3D "ldo_vcamd";
> +                               regulator-min-microvolt =3D <1200000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vcamio_reg: ldo_vcamio {
> +                               regulator-name =3D "ldo_vcamio";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +
> +                       mt6392_vm25_reg: ldo_vm25 {
> +                               regulator-name =3D "ldo_vm25";
> +                               regulator-min-microvolt =3D <2500000>;
> +                               regulator-max-microvolt =3D <2500000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       mt6392_vefuse_reg: ldo_vefuse {
> +                               regulator-name =3D "ldo_vefuse";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <2000000>;
> +                               regulator-enable-ramp-delay =3D <264>;
> +                       };
> +               };
> +
> +               rtc {
> +                       compatible =3D "mediatek,mt6392-rtc";
> +               };
> +
> +               keys {
> +                       compatible =3D "mediatek,mt6392-keys";
> +
> +                       key-power {
> +                               linux,keycodes =3D <KEY_POWER>;
> +                               wakeup-source;
> +                       };
> +
> +                       key-home {
> +                               linux,keycodes =3D <KEY_HOME>;
> +                               wakeup-source;
> +                       };
> +               };
> +       };
> +};
> --
> 2.47.1
>
>

