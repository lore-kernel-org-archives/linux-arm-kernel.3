Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3716ECA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2r+MVGxsvpDAeyHZHUlx7hLWMPN7OTvRNOzrF7TMbU=; b=gofaAkKnxsd3VDsOjAf/3vHL2Q
	syzYIGfAcQBIKSyKX8tqM13/pQk8Zpi+bfmbMVBOFtnR6WRJ2RqUWQQQiXEiaiJ//8Zz0eE1bA1Hl
	+sPVA20TreEi+FjaMXr8odPaZMhNYlTnc9RWktcRovXKzFHBsHqeedQYudHHG+YwMEBS2jUMsk8I+
	q/QCZcOAIqa3ju+mXHPMtay1dtRYjSpvcqbTt2oJMRWh23I7sUNGpVbA3Qb2bwNRII9MpU9pjxtgc
	NVEr1K1avLf9e7W0cj/z7I62+80ADTTsZJZLZ/EH+/m2EMsI6XupnSPx72lAuk3v4B4MJV6emY1Ue
	6PISkZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXV3-00000002KDA-0ep3;
	Fri, 05 Sep 2025 14:33:13 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuShn-00000000jPf-08wh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:26:06 +0000
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-53410d0f4e7so1716456137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064361; x=1757669161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2r+MVGxsvpDAeyHZHUlx7hLWMPN7OTvRNOzrF7TMbU=;
        b=qq7fwv5GmzLCptK9CruJJuZ0J8ZGp2CMJnqWAbkqXUwBtlLvX+Z+lk1lv9DHK3VBh9
         USBtGm0w/3fwBvSiSw05MewzgvjRGWYqSfFFEsvVEQJhwadff4TECEaVuI4tsBY/vExn
         Q+DSMEGpSTGBpcA/j0Yb8Kep9EGr75s8ntorF6O11jgQRRzhAC/tDKbDuYfrBfP8SYV5
         nJ4Exf8nLBIbpgRuAcZn4bTvC88IERXivmvYA+wykj3vrlcBR9E69OWsGcYzuLPxruSD
         xTSNj3r4PU9GO+91W7VX4RHf/X3dVwWak6koNKQ8MqNz2n4tCHzG/lDFo6eMcfKp124k
         oemA==
X-Gm-Message-State: AOJu0Yy5JZwv/4fQXqFkuFuraXLmcY0o1L3Q0dRok3lQVOFFnxh1wSTl
	b0/ftA4SL6EJS8Yka0eVy6p/I8VJyZa6EX5Tq9VKYT9eWSPUI6/YMm2Kgas4dr7y
X-Gm-Gg: ASbGnct7Up/O++uDykRc6/lvTPV+YYTnxi24UeUsfu5gI9ft1aOARxRmhB61pZtwAs8
	UKQAk3aNyCnt2clx408dWOyznvsWPeRZX+ZAT0iaNIZShOewQWyk33WaJYj/w8DIlL9YxYK5elw
	nvDiNK3LevolMAa3uuk5WWYKadQoyCt/FxykZIlEh9dtpNtEZ68mZqTuLZC/O79hHs5rPnlsoR0
	tZRHVsf3tTafOb8D038T3ZQ8EAerS3SwG9TXcYoKUeh6g7u/5KiM3wRNUDSf40qKKQSs8wIMcNN
	lYvggKoaDNHu4CRKIx8zCGDq5BUSS3Z/KT/eqG0ibPpgB4yUQA+v4hMK2LTVi9LI590J4WHqXMn
	N1qDsJ+LdcLGuK/g400axcx2tKhHzwnSSHrcMQ5n19rCmF2y7uIDWz+xIZtGHlb5Pt9YE/UVGQ6
	Q=
X-Google-Smtp-Source: AGHT+IFpYXb3vaTEZ3OWS+/IKO7rpYTssvG6ANheW84RsCw+ouB7EQgmd7mK0nuGdS6dLqFOKbd8zw==
X-Received: by 2002:a05:6102:802a:b0:534:cfe0:f85b with SMTP id ada2fe7eead31-534cfe1065fmr4179551137.20.1757064361361;
        Fri, 05 Sep 2025 02:26:01 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-89984bf4770sm3539672241.22.2025.09.05.02.26.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 02:26:01 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-544ad727e87so1557292e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 02:26:00 -0700 (PDT)
X-Received: by 2002:a05:6102:41a8:b0:53a:fb09:5eb1 with SMTP id
 ada2fe7eead31-53afb0962c2mr13472137.13.1757064360704; Fri, 05 Sep 2025
 02:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 11:25:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
X-Gm-Features: Ac12FXzdkPSCVU6vCiC34INdkoMu_EvqBwzp3vW9OTF994jOdqdC1bw5gHNe8Ps
Message-ID: <CAMuHMdWnusjKE8FNQWX-0arcdbV-18KTCHKZmhs5r5kRXn46ZA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_022603_071457_3E217781 
X-CRM114-Status: GOOD (  23.62  )
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

On Thu, 4 Sept 2025 at 22:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add DT overlay to bind RPi Display 2, both 5" and 7" variant, on
> Retronix R-Car V4H Sparrow Hawk board. All of display output, the
> touch controller, and backlight control have been tested.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Build also the plain DTBO for each DTO. Each new DTO entry in the
>     Makefile has three lines, the DTBO, combined and DTB targets. This
>     is easy to miss, so note this down for myself.

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso

> +&i2c0_mux3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       mcu: gpio@45 {
> +               compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> +               reg = <0x45>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               #pwm-cells = <3>;

make dtbs_check:

    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb:
gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells',
'#pwm-cells', 'gpio-controller' do not match any of the regexes:
'^pinctrl-[0-9]+$'
            from schema $id:
http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#

I noticed you posted patches to fix all other issues in DT bindings
triggered by this series, so I assume you just forgot to post the
fixes for this one (which you authored ;-)?

> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

