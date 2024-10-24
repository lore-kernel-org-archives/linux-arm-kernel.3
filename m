Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8BDCE8E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQHpv7ID4TH1EE8mb/9nePf96Sk+WNhyNVzL1VBmj6s=; b=YoN1btw6/Lc1SIKEIEOIH/jKXm
	hcbO/CPxn68Ayphs9zBWUbGn/fBOgMBMg+qDFmOQ79OML8j1/fdIMcbHq1rl6LAZDN6WQSuZGumPK
	mRXIHaXEN8jpQkjgFWOZP9LXxFlABYOVoUI9DYVYoGQjmYjleGDqotO14hcXJ710PIBJLvxXeFU5U
	05zkZoacGhnNx60EdRPsbZy/2WIed4KBk1HCa8SDLEiFGUlzKbtaFYboXNa2VZpBd44c+lsCwp04w
	02bx9Kwlv2hkIHHYuHyxXl8BBvzVlTjbKquZKirprEI344/izkzWbSl7MZZS7piBu2gHLLUduPXR+
	B9ldnXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yoi-00000000jHo-2UP5;
	Thu, 24 Oct 2024 14:28:00 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yj1-00000000hQP-3wWm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:22:09 +0000
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3a97a6010so11650457b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779726; x=1730384526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQHpv7ID4TH1EE8mb/9nePf96Sk+WNhyNVzL1VBmj6s=;
        b=HJePBAHwctzu/fLZX3OM/EXNLxz2hKuyckYGpFXPGByNTpe1oC7AufBrw+HSOb/7s2
         byM0GreF4RVBimebRTNlZWCI9jHX5VWYh4EYkvDu6VSYYq+PBJDdHQr1L9wjQHm9R1mH
         /n7WDiGZtTTHyG8utTrEGYyb1vEeVuVmOMXXCaqZw43M6w3Bcz6aiQwjXrSCQQ0j55kg
         KWllBcTXdeQE0k2B6LXkks146P297LA3iWXiMYLc8ZaG4L3YEcdacfK/3RBaEAQyr+ep
         IPQCQPQvHtmR3Oin+0x3/Uu7JZ+daHF3BpZ6+7eYeGE+jTKkfDGkiS2r5NUk4/bD7U/V
         Mqsw==
X-Forwarded-Encrypted: i=1; AJvYcCXa5ArGaq7FaRcDwffvWUKzSlC6AydEDToSOiYoZLslCBsVFYNcL439HEh77iouTa28OQSwPd6l21XxQIJveu4L@lists.infradead.org
X-Gm-Message-State: AOJu0YwPCb65CGcuSTrtymSlsKYALU6Y9GTS8jy6TlM8pVuGu5E0HfS6
	InByssXTPdPwIjt4JznAViF/sPtHgyYplLfXGX4aMkHjis5BLdpsHlSln/JE
X-Google-Smtp-Source: AGHT+IEEPkaebPcqoHy/Mbodmefo0obz/IK5hDNomfVd0kq+FDE8Wz6G2cj/oYKwQ+0YLokDaB4Xpw==
X-Received: by 2002:a05:690c:ecb:b0:6de:c0e:20ef with SMTP id 00721157ae682-6e85814c186mr27075757b3.7.1729779725810;
        Thu, 24 Oct 2024 07:22:05 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5a502d9sm19856907b3.47.2024.10.24.07.22.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:22:05 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e34339d41bso10105907b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:22:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaeQyaWRt3vZPuYvrcShOYzR8Yb8bpW/sS2+V/VvNMfUfFtDY7s8QKbXDWRJkzhtkLMK97i0f5KbW9rOLV75On@lists.infradead.org
X-Received: by 2002:a05:690c:ecb:b0:6de:c0e:20ef with SMTP id
 00721157ae682-6e85814c186mr27075017b3.7.1729779725019; Thu, 24 Oct 2024
 07:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:21:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ2DM7Qzcne5KEN2sx1z4PZn=SFkmWwMENkKQfWGGE_A@mail.gmail.com>
Message-ID: <CAMuHMdXQ2DM7Qzcne5KEN2sx1z4PZn=SFkmWwMENkKQfWGGE_A@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] clk: renesas: clk-vbattb: Add VBATTB clock driver
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
X-CRM114-CacheID: sfid-20241024_072208_025740_A22F8177 
X-CRM114-Status: GOOD (  28.98  )
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

On Sat, Oct 19, 2024 at 10:47=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
> by the RTC. The input to the VBATTB could be a 32KHz crystal
> or an external clock device.
>
> The HW block diagram for the clock generator is as follows:
>
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,
>
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
>
> vbattb-xtal
>    xbyp
>    xc
>       mux
>          vbattbclk
>
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
>
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties. If the crystal is connected on RTXIN,
> RTXOUT pins the XC will be selected as mux input. If an external clock
> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
> mux input.
>
> The load capacitance of the internal crystal can be configured
> with renesas,vbattb-load-nanofarads DT property.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - dropped oscillator from patch description
> - s/on-board/internal in patch description
> - updated dt-binding included file name in the driver as it has been
>   renamed to include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
> - dropped the "_BIT" from driver macros
> - used "quartz-load-femtofarads" dt property instead of adding a new one
> - register the "vbattclk" as critical clock as this feeds the RTC counter
>   logic and it needs to stay on from the moment the RTC is configured;
>   along with it, added a comment to express this.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

