Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A4CCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 05:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoKtrw7hyNRnwwtzfdOXkXTi9AGhOrp6JERxAlqfWSs=; b=XEZMXFq5zMSP1o
	6zNs9Qo7ZrOKMRhXkWSu2sSO2Wl7rQ2MZR0+xRL/wCrEwNhyVlYc9FDZ0D8+t3Jdmwspz7D8nf8Yn
	F16vcIRCizdgl+zm3IufRC31LieNU8WRnX1Rzjx3xz9gpL6x1FmSAG+0lQmOflAEM/g/olf0xJIhL
	da2dpXpXaCa4Jw5ptYtRiVpz2R5njn2ezQZC2sTGW1xohFXASXdXmBkS4Cpcw8zavF3NG3k+0/jBF
	gKUUUnEZrvJqqtUjRytx30QpXF/Tj3zVZRCmpD93k0jnIW0Ih7ABcC4yQVjLb9o4ITfhI3XYFHewY
	2SnbjUq8sadFFb1bzRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHald-000000023Pm-0cOK;
	Fri, 16 Oct 2026 05:46:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHalb-000000023PU-3vPw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 05:46:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6007643D4A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 05:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A9D1F000CA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792129567;
	bh=LoKtrw7hyNRnwwtzfdOXkXTi9AGhOrp6JERxAlqfWSs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JWyV6FqOv9QQWa1oVzJgkTyXA0h1PgnXMa5/dRfAxiA9L9E/+kQI1uUr6tkciK5KX
	 4Ti73fLs44mN99sMYAWSNNVM3JnWOWl5LeudwYgQUdn4jCg+oGTGVZDMcAliLFRsGN
	 49u0h71/rNIcINv6KH4Hq0qOxoX7HN0D8P3loAaP0vtJp65rJ1FKa72xPOqoFLoMS5
	 nmMzFPMs1r2EB7QA9SLXH9AYz+SdN54asOWpwyE7vKsfp0CZCSqnRr68hXpXnqJCGf
	 3XQJk5kKMXgIYSuNZrVdBY/LsWN1P0he7gqlmhyJ2BqD1aDQGx9x+KvnJIzF8gi2iJ
	 +y0oEn6bx3yEw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3aae7df0971so10147601fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 22:46:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhCubXA1t7AuI1+tj17DVzdpTNehnReE4CQp8AN+hRuD0g4ubYLPtfszkpeHiHH0qmIzQfWMc5kclhv7HPMgx0@lists.infradead.org
X-Gm-Message-State: AFq9FYJQYqEnpZI2m302vETSS02aZH0H79tRBtMTUYvKTp2u+EEjX8Lm
	2H8AYx/p593EypnzqUK5zjEoNWt7TkG1u3Cknvn7gzaBoygYbAm//mUzwwPwcS3o3AByxZbu4cS
	9lSn1xvgPkLF5W1qmgUqWjc3GIujy3cI=
X-Received: by 2002:a05:651c:211e:b0:3a9:8450:813e with SMTP id
 38308e7fff4ca-3a9c56df14cmr54234641fa.20.1792129565639; Thu, 15 Oct 2026
 22:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv> <20261016-helios64-power-tree-v1-2-31d6c8dc5092@iav.lv>
In-Reply-To: <20261016-helios64-power-tree-v1-2-31d6c8dc5092@iav.lv>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 16 Oct 2026 14:45:51 +0900
X-Gmail-Original-Message-ID: <CAGb2v64pcvwak2kC7rPwiZm4=BCnb+Kh3WUps3J-19=DC6pkzw@mail.gmail.com>
X-Gm-Features: AclHuK8uVlitNY7i2NB9uFdKYW8oiH_IPPYtbAi4f1OZkEfiAEY-pnEtxZkD2cM
Message-ID: <CAGb2v64pcvwak2kC7rPwiZm4=BCnb+Kh3WUps3J-19=DC6pkzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Describe the unused RK808
 outputs on Kobol Helios64
To: iav@iav.lv
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 16, 2026 at 2:34=E2=80=AFPM Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> From: Igor Velkov <iav@iav.lv>
>
> The Helios64 schematic lists RK808 LDO_REG1, LDO_REG2, LDO_REG5,
> LDO_REG7 and SWITCH_REG2 as unused (sheet 2). Each output has only a
> 0.1 uF capacitor and goes nowhere else (sheet 6).
>
> Describe them with the names from the schematic and no constraints, so
> the regulator core switches them off as unused.

To be honest this seems a bit odd. If something is unused you should
not need to describe it.

ChenYu


> Link: https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics=
_Rev1.2.pdf
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>  .../boot/dts/rockchip/rk3399-kobol-helios64.dts      | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index cf247d6c6212..35e92e1c8ff8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> @@ -436,6 +436,14 @@ regulator-state-mem {
>                                 };
>                         };
>
> +                       vcc1v8_dvp: LDO_REG1 {
> +                               regulator-name =3D "vcc1v8_dvp";
> +                       };
> +
> +                       vcc3v0_touch: LDO_REG2 {
> +                               regulator-name =3D "vcc3v0_touch";
> +                       };
> +
>                         vcc1v8_s3: LDO_REG3 {
>                                 regulator-name =3D "vcc1v8_s3";
>                                 regulator-always-on;
> @@ -462,6 +470,10 @@ regulator-state-mem {
>                                 };
>                         };
>
> +                       vcca3v0_codec: LDO_REG5 {
> +                               regulator-name =3D "vcca3v0_codec";
> +                       };
> +
>                         vcc1v5_s3: LDO_REG6 {
>                                 regulator-name =3D "vcc1v5_s3";
>                                 regulator-always-on;
> @@ -475,6 +487,10 @@ regulator-state-mem {
>                                 };
>                         };
>
> +                       vcca1v8_codec: LDO_REG7 {
> +                               regulator-name =3D "vcca1v8_codec";
> +                       };
> +
>                         vcc3v0_s3: LDO_REG8 {
>                                 regulator-name =3D "vcc3v0_s3";
>                                 regulator-always-on;
> @@ -497,6 +513,10 @@ regulator-state-mem {
>                                         regulator-off-in-suspend;
>                                 };
>                         };
> +
> +                       vcc3v3_s0: SWITCH_REG2 {
> +                               regulator-name =3D "vcc3v3_s0";
> +                       };
>                 };
>         };
>
>
> --
> 2.43.0
>
>
>

