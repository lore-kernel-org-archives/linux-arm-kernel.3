Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303D3FD3772
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xzWh4hx6Q/RioHZM6tLKlKt7+PGS0WbW9/zHaohO54=; b=IEDViVNlIMgE8T
	F8fOs7SCijg1DWqg+EG0Z1eIiEfIaVe2eQxO3ZsUYLqfmLdVkPWNLAvbhO0a3X5Xzk22KEzZ0v3Ha
	maNF6X7MFlHM5XB7xwpuG1HzlW5i+czv5qpIKGLgtiPxmFdu2Y6ngfJR//X+WOVPtQGRMbxwIyJLz
	wKAEUQ8ExL6W/igTKoaGJpiYc1W6Q6qrg6AGMgBab/mITnAp8DIkZBd8UjONM2rp2z7Py/nfre744
	FyBETVbGWFiNKoysQ0/d+BDCdxEPKCecTRLC3ce9nI+LWsb+Unn6xnai4doRw4cgc/irSm06mBcM/
	qCbmLsJrBWvH4CjahzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHXa-00000004UNZ-0XFZ;
	Wed, 25 Feb 2026 16:15:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHXW-00000004UJr-0FMD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65D8744274
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 16:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB9EC19421
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772036105;
	bh=wmdB0fl1vrEWsur3Dkdc9CY49UgOrg4GQj69XI3kpwc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CtGqL61fxVrE+IXAyMneaKwr20DmBCGNDLKv/rBnm8j20N8r1Fhl/045ySrWPgM3Y
	 o6+7C6BbuBOB9NO1ZfILeqNNrog63quE/WBz1qWCYGq/NC8iHk+AVuKfG5JGreZ+9j
	 rgyj+CkcUKkJkxTXyk1P9hYe1RP9fFRIVJQnj7W8hPIOEi1P9EItbSPDQd/1/4eJSX
	 ltyy/xfS7VtrSpOIcuOe8XLa2ztqskTsF/W9/HFwtBDmcy0e1cWLYn3S57IhGxCWYC
	 YLdYzPFQFpA8ZTEb6mp7gp8pl56tReNLU1d9Z55XrSD2qBhdcrIpCoduSc2qrKNTPo
	 uls41fxL4ddlQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-385cfc572f1so54316861fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:15:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrK1B8ofjA25S5Ivbo2O3k1qs3OjvPZTqH+GMdCVd1obO0DKlBY9VMKiFqJo4qub7UHxnCp/JXfmxSHY0z+ofj@lists.infradead.org
X-Gm-Message-State: AOJu0YwHQ7GPDmHSZdLnH15yBVfN575mIK03n5kbCDmV3mrlxNX4VmHy
	DBBD8zeEkGLyJCaEiN07/07jB75gv9HnYWuvGhi5FJyFItF3XobpnsVYU28hEpwnKjFFbcNFpgw
	YtxEuPuz5rENKneN1hlMkrdrP0yn1etc=
X-Received: by 2002:a05:651c:220a:b0:385:ceb0:c330 with SMTP id
 38308e7fff4ca-389a5d18923mr54259111fa.10.1772036103445; Wed, 25 Feb 2026
 08:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20260225160828.1687643-1-wens@kernel.org> <20260225160828.1687643-3-wens@kernel.org>
In-Reply-To: <20260225160828.1687643-3-wens@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Feb 2026 00:14:51 +0800
X-Gmail-Original-Message-ID: <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
X-Gm-Features: AaiRm53ZqutIuvlJ6sHtPgGw3ES5VmzyMvxfSoLIDy0kWkD4Sx0Tz9nprYnh_c0
Message-ID: <CAGb2v675r8idb3MHyaPD6XNrDF3na-rH2342ET0TUm1kGsT20w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081506_134699_FB10E834 
X-CRM114-Status: GOOD (  16.94  )
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

On Thu, Feb 26, 2026 at 12:08=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> The A523 SoC family features an LED controller that is identical to the
> one found on previous SoCs.
>
> Add a device node for it, and one of the possible pinmux settings. This
> setting is used on the Avaota A1.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 09bd149bbf51..b8263e2872af 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -170,6 +170,13 @@ i2s2_pi_pins: i2s2-pi-pins {
>                                 bias-disable;
>                         };
>
> +                       /omit-if-no-ref/
> +                       ledc_ph_pin: ledc-ph-pin {
> +                               pins =3D "PH19";
> +                               function =3D "ledc";
> +                               allwinner,pinmux =3D <5>;
> +                       };
> +
>                         mmc0_pins: mmc0-pins {
>                                 pins =3D "PF0" ,"PF1", "PF2", "PF3", "PF4=
", "PF5";
>                                 allwinner,pinmux =3D <2>;
> @@ -300,6 +307,21 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               ledc: led-controller@2008000 {
> +                       compatible =3D "allwinner,sun55i-a523-ledc",
> +                                    "allwinner,sun50i-a100-ledc";
> +                       reg =3D <0x02008000 0x400>;
> +                       interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_LEDC>, <&ccu CLK_LEDC>;
> +                       clock-names =3D "bus", "mod";
> +                       resets =3D <&ccu RST_BUS_LEDC>;
> +                       dmas =3D <&dma 42>;
> +                       dma-names =3D "tx";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       status =3D "disabled";
> +               };
> +
>                 ths1: thermal-sensor@2009400 {

I Forgot to rebase this patch before the thermal sensor one in my tree.
I can fix this when applying, so please still review the patch.

ChenYu

>                         compatible =3D "allwinner,sun55i-a523-ths1";
>                         reg =3D <0x02009400 0x400>;
> --
> 2.47.3
>

