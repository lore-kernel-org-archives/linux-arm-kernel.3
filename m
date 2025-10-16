Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589DBCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxMxNXtMy6Jnm1vHPFEexy61mNhacC+YBJiirqBC3iQ=; b=ngiGtj0ZsF1Qsh8So4CcIKAkLr
	/SEkCBjUlJohGKVZQya/cX7N/MacO8oUvv6sNc7KCUcJUFwW0QO+Bws8vpR9lf76/WSMXKd0VqOhO
	L0/sQHTHf4e+XGFawONaZdWGHN9DGl51Al03rJG+ykfk3BH/5duhlJczqhz8dtAE9L4HLerNrZAvI
	2hBhJ/BlXsW+rtdVucVTFP25inx7BI+mYMQc6fTGWHW1V0xiZsiMDtF6k+cKnXoXnhnZ1AMWPqkZg
	k5AM/a9FLYrEoN7QbZ5ePLRzOdBOWQzq0lHfEHCgEO/cG1FTdaAARV7sJ0n1Jkvt3dqKDqKiKUJ9C
	V14qeTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JFn-00000003uHS-0byq;
	Thu, 16 Oct 2025 08:22:31 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JFk-00000003uGl-4BYD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:22:30 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54aa6a0babeso1511221e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760602947; x=1761207747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxMxNXtMy6Jnm1vHPFEexy61mNhacC+YBJiirqBC3iQ=;
        b=LaZKALPF5IPkyZAYPjRFTyLEcpX9nJm95b4HnBo0VC/IV8tLVl3VhAqXrcmkbY0U0P
         ytL3jVHWf8gLdtcUnRv6RIeRYv4/hPWaZB7NOTEIOHH96Ly16puqkWG3Nn/ASqq1WXJI
         z5OV0sv1y8KmSJZH2TtU4wEMpMhE4he3hiC9OSxzsRwgabQlM3JX4+YjhppqLSAsPP5h
         aY+0vF5SP5vmgWcz2QMAzr23C8xs+ZRTEbKOEuHlOp74Y7a8y7psA8ckkXLA3AsDZOTN
         o8YFagFw8dmFt8YB8w8UDg1HmzokxBnH5kNVNmIiomDwE1halESLvWZibPHHE+Z0lRS3
         +owg==
X-Gm-Message-State: AOJu0Yz6yla/L4Ygdp8O14D7PS5jVSqVjgH/kzVtu/nZGzhsgi67XYMn
	M3jy/+kFvFELwZSzgL/1/TKVFguSmeBkP748nXsLQVt/LULtRwu9NfysJbsFizdt
X-Gm-Gg: ASbGncvHJZfjZAv9RmvvuISmi5tF0tq8MVowVWvh1U3kjmMBKV6MziEZFYAof1k5U6G
	Tz7wWNz0+EV6MQOGeWJbvjyjvZsmAdka6WXJP8Kqx6cRJVVeiMJKLfP8p9ShTy61tT/LOGf0knW
	C3y12QWg91SVtBzg810uQbhC9Rj9dgC74LJlDg7lSGUfjYDDX5zhykajWR+ofyuPqdpd6TzmemX
	OhhB0Hc3mJzIA8g/mi5HyPUqHqC9ngI50xdIIChbykd76ZwmexTnkqX/d3I+yFV6XBSE9Jnn2iL
	nPwgZez2EkV0RdpOslBuuhh8gPr8uLDSaCMf48N6GZ9UYGCqM4rQN3ndi5MMQKpfyh6iMPuDTuP
	uZiCNtuCvxHlYF9iCM1D9zWRAoOtfQwEZjzQ7eJLNehnuJ5/QqPlUlDRWpjOwQqEfNgVzwS6idv
	4Xoq4nVt0J5Md9Yh+PmjTWJnt0KXWlS4a8JzBq6Q==
X-Google-Smtp-Source: AGHT+IEpWipeBx8nNy0ygcPxVtD4hczZvi4oZDS1pBCEHgTbA7/25FHPoPwDfn2nMHyhkzdhrTdbOQ==
X-Received: by 2002:a05:6122:1794:b0:554:b2d3:4e17 with SMTP id 71dfb90a1353d-55640200db5mr1108587e0c.5.1760602947631;
        Thu, 16 Oct 2025 01:22:27 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7f01e3fsm5764059e0c.7.2025.10.16.01.22.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 01:22:27 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8eafd5a7a23so857514241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 01:22:22 -0700 (PDT)
X-Received: by 2002:a05:6102:801b:b0:59e:73d5:8b57 with SMTP id
 ada2fe7eead31-5d7ce7bd161mr1324148137.16.1760602942005; Thu, 16 Oct 2025
 01:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org> <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:22:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
X-Gm-Features: AS18NWDLIWGJb_IOoRvlCMu35mq1PVX8494ciH6v3rxbYpQaD3fQbpHBOXBZzcQ
Message-ID: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
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
X-CRM114-CacheID: sfid-20251016_012229_042092_E91DADA0 
X-CRM114-Status: GOOD (  18.67  )
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
> present in Renesas R-Car R8A77960 M3-W SoC.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add RB from Niklas
>     - Fill in all three clock and two power domains
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a7796-gpu",
> +                                    "img,img-gx6250",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A7796_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A7796_PD_3DG_A>,
> +                                       <&sysc R8A7796_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 112>;

status =3D "disabled"; ?

> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         compatible =3D "renesas,pcie-r8a7796",
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

