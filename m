Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B999CE8E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w3r0ZE6sHyJMqYbvl55sla7p2voLmSiB1JDYM+8SL8=; b=KcCXs8e9nLwOPj96/p8Am4j3yA
	xHYoYmKLsHLDQxwU6WU44Nb4hcF9Xux3vu+odfv+DbMf0Ip5HfJHfl2m93bxo/Sxinwfks5GUMR1W
	tLLyPQUxT4vOBNL/2cuajnFAnMhgSBElyRJTLXyY2AISE5gEZLk99OMz1VLW+jgSc2gnEUgMw2Vdf
	SCz2Ub/TRTrzw60AYBN8wcHBt39iUJv45LxMY0Hx/S3P7/bcDs7Mwckb+3ifwakel23zmcXziEfTi
	aQ4mZOqrBGzOCCSU7TK7/c1+bilANjKUWCuzVlMnGUqm2hlpirWSmDghcWfb0aQE6j9bFcSnwAW6Z
	36Sz/3Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ywX-00000000lWF-1kVT;
	Thu, 24 Oct 2024 14:36:05 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yjr-00000000hg1-3t5l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:23:01 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6db20e22c85so8448017b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779777; x=1730384577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9w3r0ZE6sHyJMqYbvl55sla7p2voLmSiB1JDYM+8SL8=;
        b=uDwAW0tJLDHKmRm6RkdM29qMCTWkWTiZNL+kb21kECcz77QzSPN0/K1ynhRwwPlCcZ
         iq9fhhxvwKO79vC676m7Q+sTszd194eb7wO+DRM+EbOmqtf6Gb1HTJiRNdYZIEbvqZ5M
         BdlB8fBENUcoqhjz07LenlacVr1+zMdA3K9mIOvQqcl4HIIiPkZ9OK3E7T4vStoPUQVI
         P5uDKVAyj+a/BmHV1Lw2VqcNljABONU7kjuUKtdUcLyyH9PtwE0iykXCQKmKQRgdK8cD
         DhRjCR65aubmu8WCNvJ4pgDt2wiQGkaGFqShvD2H8E9mN5XoI+oN2o4/nguhdpSDe2g8
         etrA==
X-Forwarded-Encrypted: i=1; AJvYcCXPWo5wkX7FBO8mgoJeHU498WImpdLpVkmaHPC33XgGefod2uoPhHfjSCNIIEQBrY6LGF0cm+CpOI3U7lK+734m@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3pQKaxxbdDSs4cyTQwRepGFglCCj49VOOxQZP4lCOE1yGJvdc
	+Vd9dnHe3RQcKBkQpFuW2Zirni/enh7/x89938lzf36mzCoCCDpRzBgyqwH1
X-Google-Smtp-Source: AGHT+IEyfMAoOowtReyIDnE5stFOYT65TyYS4OCBxKLhNejL8N0KN14BVhljsMz3Yo1MPSTI/r5Ibw==
X-Received: by 2002:a05:690c:61c6:b0:6e3:29ae:a3a5 with SMTP id 00721157ae682-6e86630bba1mr27315097b3.34.1729779777185;
        Thu, 24 Oct 2024 07:22:57 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e7f4176c90sm7421917b3.100.2024.10.24.07.22.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:22:56 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11255247b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFWEuKpI62wwi7+nlpxFGLFovG142B/8U0k0S41MdXFJZ/BCzI9PQ2fdzVTjQobWxerPZIXpOazkGxn0QUWcBI@lists.infradead.org
X-Received: by 2002:a05:690c:61c6:b0:6e3:29ae:a3a5 with SMTP id
 00721157ae682-6e86630bba1mr27313797b3.34.1729779775364; Thu, 24 Oct 2024
 07:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:22:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR1dONCFvCm=QekRaw6F-+W1v6-G+xdSWZVhEg0cRCQQ@mail.gmail.com>
Message-ID: <CAMuHMdXR1dONCFvCm=QekRaw6F-+W1v6-G+xdSWZVhEg0cRCQQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_072300_133026_0C5BBB0D 
X-CRM114-Status: GOOD (  24.66  )
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

Hi Claudiu,

On Sat, Oct 19, 2024 at 10:48=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add the DT node for the VBATTB IP along with DT bindings for the clock
> it provides.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - used clock-controller for the vbattb node name
> - move the node near scif0 for ordering

Thanks for the update!

> - set the vbattb_xtal status as disabled to avoid having it exported
>   in linux with frequency =3D 0 in boards that don't use it

That is expected, and perfectly fine.
The clock is referenced from the vbattb node, so IMHO it should not
be disabled.

> - collected tags

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -72,6 +72,18 @@ scif0: serial@1004b800 {
>                         status =3D "disabled";
>                 };
>
> +               vbattb: clock-controller@1005c000 {
> +                       compatible =3D "renesas,r9a08g045-vbattb";
> +                       reg =3D <0 0x1005c000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&=
vbattb_xtal>;
> +                       clock-names =3D "bclk", "rtx";
> +                       #clock-cells =3D <1>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
> +                       status =3D "disabled";
> +               };
> +
>                 i2c0: i2c@10090000 {
>                         compatible =3D "renesas,riic-r9a08g045", "renesas=
,riic-r9a09g057";
>                         reg =3D <0 0x10090000 0 0x400>;
> @@ -425,4 +437,12 @@ timer {
>                 interrupt-names =3D "sec-phys", "phys", "virt", "hyp-phys=
",
>                                   "hyp-virt";
>         };
> +
> +       vbattb_xtal: vbattb-xtal {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by the board. */
> +               clock-frequency =3D <0>;
> +               status =3D "disabled";

Hence please drop this line.

> +       };
>  };

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

