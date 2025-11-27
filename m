Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66DAD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnxISG+deFt7GHt3BFpEdGiXVoglGnvqHxBF0MY3fn4=; b=vZRcCiHVQzpbbGl+wcVIZvKf/K
	C/ExpkTFhc3uIr0yGZjUZQypjmSCuOA85U80FsKrbiXWXCoTFX3EbIYQLTZboLwH6+naS46FAW2uE
	3q34kCLqmrP2feIEAWUcwZxXbzMzAuR4Ko9dD9pyHjbBPAYYAVtqMu8tKRlULV2+Ky5Fwl6a9tRHH
	h39lVjiqQMMFCM1IjowZVEqiQXTFTIeFNM+dcXbVj8OYGrNvVvWzRIjsew6qzWlQmAnKOcqvcVxsC
	WdjlSynAK/ZIawswhc33oRyk9vhy/4m7IZ0fnm2kF0PGU7gUo9YteZKoLyhFsbiVBdvUQvLwLD7St
	UgOcwAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcWV-0000000Giol-43OO;
	Thu, 27 Nov 2025 13:59:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcWT-0000000Gio9-0EyO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:59:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42bb288c17bso596833f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 05:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764251939; x=1764856739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnxISG+deFt7GHt3BFpEdGiXVoglGnvqHxBF0MY3fn4=;
        b=JOcZPzNeiEoG6oEfulNdc9D6pGr5oShaWF+UtXWurzOoaxFsx4rsfMLcAR2zH2Vfx+
         ENCZ0YL3Jm7KCNHPh3AV6iSGwsWBp88Lzno+xOUzf89BXXkjkA3dxQL0kbFFzXDJlfmI
         bMivRRaR7hnySfJY33dLVlwzs4CoEWpJ6D0d52puHC5ULxtzQWIG1ahiEag97ztrjw9/
         YYUsWkcb1W9QMVcSCdUobDx4HdDr104mCOcLqVmAXVPQzffRy1cZPdYzce4Qz159I1vQ
         ym9L9YLHQDc8v6mHlBwQJWU0W2XV1re7AS3RhWYuEIw/DFAHvug08Bxo/Bk+aTFXbSlQ
         VIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251939; x=1764856739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gnxISG+deFt7GHt3BFpEdGiXVoglGnvqHxBF0MY3fn4=;
        b=BSVwuBjbXURBI2QOJcurVbP7+AwtQqBQxMRONBe6m3l5nGr3lKYBlo/uWcTZwW0imG
         v3DX6PAhdKWc+SIujQON4Qc0icKrlqN02BZ0fX0d8iGB5brhbWgO/44ybuD4bLVQaPY+
         G62L6cDkwNApRXem8PPSIzPEMdtvlx/TvvH41+BPbglMIud+3nRvJrZcViz8/2EsV1K7
         gNXTa0eooEddwKizF9pttuJxSAuAIP9brDKfb/l0V+vx/4fpKbNR6OqZzlMCjCn+HeOm
         DxCbGzC4IcAp7YL9mY10gydFuZm7QvETO5f2xlgU+y4FCoRkTwRuFmk2vkxyr8dw0O3P
         +shA==
X-Forwarded-Encrypted: i=1; AJvYcCUcS3Oprmoe4TZnpcHPld4T2KBceswnOMAnICkJGbl5CERhLDVAARCkkk5tMrNikWgmVlBKGJ2I54MP0gpRR56Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwB5cUckm8Kku2enfLSwLMa+5CYbzgleJ90iJs1GvlE23mw8iJa
	XyTdlEABkow8WcrQc4WhXHF7C37Cuvk3sETI36dCAH4lEZricnLc1vrkczEvw3jmAUgdg4aWJob
	3vSbhioOJrg+BROixKJRFoorLD5aK/+8=
X-Gm-Gg: ASbGnct2lH0Pa7IPnKngokjRFlnu4Xf/a6GEGU61yliAh/db2EqU8KceAY/+5e3rs0b
	yT/CUSz3OXezwbDw0nnBYbNFeoUxzZZJNXHXgGGRUoYON+bH04pwVnlHnMLte6M56ihINMrX7OT
	vjEgU+NRJtp0kNmvqxLGzM4i49xm4Rfs3w4fRW3mxlw/XB1d0q1Bn+k1LPekwWMwNvEJt2pmNBQ
	oz46UzrrAkFNeuh8QODYR3EgLfLaKGtapx60Z4DA5ZzJ3XGga99oUxC+oS5uDtw512DAD40dw==
X-Google-Smtp-Source: AGHT+IGNtcCSrgQktFnYqTZxYZ6Hs3cgPF9O8J4034qoPLGkbQ8PDMY04xenTjU1D4sevAYqeeqaV7IhvGcdhUjbwBs=
X-Received: by 2002:a5d:5f44:0:b0:42b:3701:c4c6 with SMTP id
 ffacd0b85a97d-42cc1cf3c16mr26528101f8f.38.1764251938487; Thu, 27 Nov 2025
 05:58:58 -0800 (PST)
MIME-Version: 1.0
References: <53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063.git.geert+renesas@glider.be>
In-Reply-To: <53d45eed3709cba589a4ef3e9ad198d7e44fd9a5.1764249063.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Nov 2025 13:58:32 +0000
X-Gm-Features: AWmQ_bnedgFk9dq1Mtg11dYj8-7z-L3ilTlE5DIq5awUXGvPaKMvycqmu1EzW3E
Message-ID: <CA+V-a8uhbh280qUQy0ryHQmQ4qzFELaWcdo0gomsJ32nbsM+0A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_055901_116743_B629163C 
X-CRM114-Status: GOOD (  15.18  )
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

On Thu, Nov 27, 2025 at 1:13=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The Ethernet switch device node still lacks interrupts.  Add them.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> "[PATCH net-next 04/11] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add
> RZ/T2H and RZ/N2H ETHSW support"[1] will make interrupts and
> interrupts-names required.
>
> Based on the example in the DT bindings[2], Compile-tested only.
> To be queued in renesas-devel for v6.20.
>
> [1] https://lore.kernel.org/20251121113553.2955854-5-prabhakar.mahadev-la=
d.rj@bp.renesas.com
> [2] Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> ---
>  arch/arm/boot/dts/renesas/r9a06g032.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts=
/renesas/r9a06g032.dtsi
> index 71d655b0565af1a5..5530eb9e891fa45c 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -453,6 +453,12 @@ switch: switch@44050000 {
>                                  <&sysctrl R9A06G032_CLK_SWITCH>;
>                         clock-names =3D "hclk", "clk";
>                         power-domains =3D <&sysctrl>;
> +                       interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "dlr", "switch", "prp", "hub"=
, "ptrn";
>                         status =3D "disabled";
>
>                         ethernet-ports {
> --
> 2.43.0
>
>

