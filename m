Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54705FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zkpM12tj69vsfKZJWabZJT13+DvE4RlIyVQCs6jX8o=; b=M+WuqpIHw2RMdZ
	AVMRfqTS+IKDdyvQC6LaABASjmfw+sX6c3iBVCWX6hpV3q6AcyxPT/5fYTwU6Wl9L49dQhXeLMO7D
	JGfDpvy7Z/FTweY2V2FvGvc/SkIyDYspm1xcj++wFk72hk/NxBYkCJ34JY7O25BLhyEqAIGsUHzY7
	EccHSmKQBWjQSo/rqyCntiOl4IP1TXdDwTH0MP46Riz46UXYsiZA8/s63R09Xwy28a3qACMYWKAiE
	km4sVn9Tj8YUpeV0oDk4y2tTAOp6FbnqPANEzEEGt27HUs+v91Lf2H7Om1JqbBGUS4q7S/NubrG1t
	M6MFd45naVvwjxxnmTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGwb-0000000GXhr-48Ix;
	Tue, 05 May 2026 14:40:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGwY-0000000GXhA-3GfY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F395440F3
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B704C2BCF5
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777992014;
	bh=oMMYfcqr5QWyyTjFtgne0KbL76H6vB+g+XD/Ejp7WPs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=lieVFvq/RMV0PQA00/M/Kw9VNeYljZNknzOo5rq30W8jUJgvhSM6NKkzThGIxa2Nx
	 sYtQYXYu2hD0BTnPWmSSk6cgUJEZOgyNvsbfBuSPK0DbABDlAY2tYVjHOs55zFeddm
	 UGc9S3WSLB+8cgwT1mdwdp68E4PVVwAGiLvIQj539ILcQyGLePswEoCgvzij+cXiU+
	 T3h8qzRSXWX9GVCk67G1tGmlOWjXZD5f7i3qumIqT6kWaMfvSzEfhdxqIKlw89vjLD
	 SCmAXWR0a2G8JyMSnzjPuqf8t7QR+MPNnNDXTAAlmfyG4APE8ZcuJV2gyGHSJSu4PK
	 y4iIJcXldQ6+A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3922b35e69cso45048691fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9SgzrjJLRYorq8hEUx4Ps5PwbSnpAthiCVa7RHu35uq/1xQiH0BTWhZQbGP8M1Q6k/WX+5KKgNXbJzqLCd01yz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7xTFNzt0QJw5OUEOEcIqOeeAvPXXtwfKYG4hbJSVFRMcE90Hw
	espTD1KIcLC+q227bSd4fQG756zUVh3im84awgkwFB6Oy49U+PiaCxwLZkWHtsJbLrlx0y/gy82
	BX3WZ7G7aFQtYLxhwNDwXVc9unp1C1ik=
X-Received: by 2002:a05:651c:1550:b0:38e:cab9:362f with SMTP id
 38308e7fff4ca-393b4aee55fmr16699711fa.5.1777992012684; Tue, 05 May 2026
 07:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:39:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v67em9sO-R25hfH2_2WhD+cGfxEFQ6DeY9gobZoHdpRYdg@mail.gmail.com>
X-Gm-Features: AVHnY4JJpxD2X70zsLR6EJJtacKJo_DgD2S2p0UG0bbAjRuSSF1pdG6HAo4DjV4
Message-ID: <CAGb2v67em9sO-R25hfH2_2WhD+cGfxEFQ6DeY9gobZoHdpRYdg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm: dts: allwinner: t113s: add hstimer node
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_074014_861576_C308D82C 
X-CRM114-Status: GOOD (  17.23  )
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

On Wed, Apr 29, 2026 at 12:29=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Describe high speed timer block on Allwinner T113-S3.
>
> Tested on LCPI-PC-T113/F113:
> - hstimer is registered as clocksource
> - switching clocksource at runtime works
> - after rating increase hstimer operates as a broadcast clockevent device
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot=
/dts/allwinner/sun8i-t113s.dtsi
> index 424f4a2487e2..40e76cfc8a1d 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
> @@ -34,6 +34,17 @@ cpu1: cpu@1 {
>                 };
>         };
>
> +       soc {
> +               hstimer@3008000 {
> +                       compatible =3D "allwinner,sun20i-d1-hstimer";
> +                       reg =3D <0x03008000 0x1000>;
> +                       interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_HSTIMER>;
> +                       resets =3D <&ccu RST_BUS_HSTIMER>;
> +               };
> +       };
> +

Actually this could probably be added to the common risc-v dtsi file instea=
d:

    arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi

That way both the D1 and T113 / T113s benefit.

ChenYu

>         gic: interrupt-controller@1c81000 {
>                 compatible =3D "arm,gic-400";
>                 reg =3D <0x03021000 0x1000>,
>
> --
> 2.43.0
>
>

