Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C06ACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xR7pvs4sY0VZXb71oeLpqLl5nfCodgR8zUuBqvOj1Tc=; b=xFIyCd9VMOqtrpj7HQxYK3VXSy
	sTr3wSO6o9GbmWuWQbbw7GCITr9SIoYuCircTlGFzMUVPyNLr0zusuXJOoK+u9xPTdCmQMgej7wP/
	SCgDd2l69haqblrDU3Oo3SwZLRJs069TxqzD0Sy1lgt4vovLLXK0mxRy5yaiqtedS5MrpXvP4h0z0
	FYg9gwq4Ni8tRsCEW4D2s9Q17KGAKEDw/wo0T9mAMgt0bFHzM2omLEIQZfCJtrbOy1eBjt/pLySlb
	HkvsU32lWxtDNOuoVEgxotSpPt+AywJ2ImowyrTmwQc1LkzYttS/vuNgnnEftId0aY6mgjXvZPl/q
	Yqtkg6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JGd-00000003ubV-3JR5;
	Thu, 16 Oct 2025 08:23:23 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JGb-00000003ua2-1hCk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:23:22 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso300411137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603000; x=1761207800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR7pvs4sY0VZXb71oeLpqLl5nfCodgR8zUuBqvOj1Tc=;
        b=B6Az0tR8W5wB2kipR+BHfQOVjhi1GPDEaCtGMJdrMh9rZYKZPMuImKrgRX6C3KSVy1
         StzGDsVQ1xI+C6TzQfz/wH5ifaLd5q0bV4g3+D3A98QaMOKigoVujgDUDJMKM7sqcAHW
         LULPHEJIEpWx/xRyd0covF+3w6su5nqcv4scXK43UXNweQDt10klDdgOWovavFOn87wu
         EnOzwj8lUvZGVW22jcNY7HPohw4mlEdwGxExupQFiQNYrNqcIyrE+qgJTg5ois8LmZAq
         1XH8TJTkWLaNrsANi2Oz6kWhhvvgWTYwOAfMdy4QqLW8ky8OrGmRR0fYz7Obqx8O+jod
         1sCA==
X-Gm-Message-State: AOJu0YyPr4d4uMlBbj7IU7R0FL7ujJGjQevxfBOW8GVrg1zbuJdP/KBQ
	SuaoB6okso2QTawMXtlonPGD2oZ36mXA28nEDS9iSMM1Doh+skMIGmZ07WRNZPye
X-Gm-Gg: ASbGncsst1lKqgDL46hxZq3pVaKskUttItRux+VdmYcLdPfbqwFB3loAm++DUeDB7Nn
	rkjW/2hPQtmlrEOwR/l3iPX8PaI7yIR88DzcPRCQC7bY1gd3ETN3VUMEiTBO5rVQR9Zv1nTgEcJ
	vF0CKQsVObSpVvf4qsGr+6Yc5m2TZ7NHQXE5/5nW8dnl4oZ1HeeYgd+koro2zEaICG80InMqkfw
	auGl1ox4E4brZB6OBbcyoy2W01w4yQaA3Irm7GRxB2sKxkU1bVC6qpJn9TQYXuCvxAeFQMhOhDg
	p7i9cFtFKSqGBKp6T5DwHAYArj5mpqbjU+8e8lbDrLr8Q/A0pL3xEkbfZa0x/snbDOchZMhnbcf
	P+XtHYE/B50F0V1Ejoq7Eg7lXUFLAPectFy58tUSuRnsHyY8u+ii+qQOj7iWjfwapY7EY0WYjsx
	LqppWa3mmDbthebqlBk/bmY44BeMJVhCUWno/Zcw==
X-Google-Smtp-Source: AGHT+IHx+psxxil2Byp93bGBN7PrSHj8f/auf6lQx77dcPcS9NbKvyto/i9B19exoWCI45rcQKPl5Q==
X-Received: by 2002:a05:6102:3e1f:b0:530:f657:c40 with SMTP id ada2fe7eead31-5d5e232269amr14298628137.22.1760602999766;
        Thu, 16 Oct 2025 01:23:19 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7f28f51sm5817400e0c.11.2025.10.16.01.23.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:23:19 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93109cb9dffso118636241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:23:18 -0700 (PDT)
X-Received: by 2002:a05:6102:32c1:b0:52d:110:a920 with SMTP id
 ada2fe7eead31-5d5e2394649mr12437643137.33.1760602998488; Thu, 16 Oct 2025
 01:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org> <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:23:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfssQFZj4Mj0T4KpXDzDXBC6MecnauD5wp2_2OLdt=ZA@mail.gmail.com>
X-Gm-Features: AS18NWDv5MDbI0Q-YaerQHTTLK54INzbJu8pMvADwEhMtSUs8ivJgVETlU0r9ws
Message-ID: <CAMuHMdUfssQFZj4Mj0T4KpXDzDXBC6MecnauD5wp2_2OLdt=ZA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_012321_637890_02EF5DB7 
X-CRM114-Status: GOOD (  18.56  )
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

Hi Marek,

On Wed, 15 Oct 2025 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77961 M3-W+ SoC.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add RB from Niklas
>     - Fix up power-domains =3D <&sysc R8A77961_PD_3DG_B>; for 77961
>     - Fill in all three clock and two power domains

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2455,6 +2455,22 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a77961-gpu",
> +                                    "img,img-gx6250",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A77961_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A77961_CLK_S2D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A77961_PD_3DG_A>,
> +                                       <&sysc R8A77961_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 112>;

status =3D "disabled"; ?

> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         compatible =3D "renesas,pcie-r8a77961",
>                                      "renesas,pcie-rcar-gen3";

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

