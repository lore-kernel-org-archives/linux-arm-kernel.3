Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41B4CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gxhxdF3vQ/iqynK82+PoG7FIJTLcJKLDWKPn4QyzC8=; b=C2HoEoGFvtotzwnADuvfSR4a4W
	/p1svLhht9/3GuhotKaET9knaDQvE3FrN5AaYr4com2yzIHJ6wB/VZJVXk1i0evlkNf6EVCZsI7uf
	85dwMLpH6YL0Q9eYwRRYI6Sa9KRkk2XtviB6GrgDwmf87V3X2ciOdX++oM3yWI1wAHKFl5cBfupmr
	/rjawLW/A/ExhbKlPU0EbEUamDVJfJQ8kwWFICg7WzHflMdHa2JH/UUgvrd+xd7hNxByd8Kxf0uL2
	j/O3B+yfNoshTbNBuZNegINfwYEp+hCh9eCpDMcopUEH8o8vf2J+awje5hv459dnFrET8nmV++Kab
	lvrWH7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHYe-00000009mfM-1QbO;
	Tue, 19 Aug 2025 08:19:04 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoH16-00000009i9s-4C7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:44:26 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53b17193865so1466322e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589463; x=1756194263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gxhxdF3vQ/iqynK82+PoG7FIJTLcJKLDWKPn4QyzC8=;
        b=Tw5y9JuYXPteb5SBBy5QGWO3DU4AWhoY8RAOSu5X8GcsajwmcZQbdyOfW8qZXzkeLk
         ysbj0uf9MuRLRiBGiiNBRasDSLnrj5MF48yUBEfXauQtmabkaopO7JpRFi5TyDQ5E/I4
         qsbV1aEv/mbriwurX/0uyGsDDCx7Yop4pGnpxbntbyzWEn8jnNRtglA5VGEXgAN6XBty
         pM/ktKWoLUmnPT/2XwH77bBrO0RqY/mx8EFu1b07lQAZ6xfbNGDBOfIEsJXdK1QzhGTU
         Ae/vOM7VYQQ/C5rbHDmAfvCk1dkB9w2FqMAztlrRkU/ZubK1A7zf7HVHXjPOF5R8gTWZ
         ZPUA==
X-Forwarded-Encrypted: i=1; AJvYcCUdMk1QGdg/IDaOpuqPVzZMii0BNnaJ1SQWRfe/fvLu6uwV/3nE7cr5vY5cyjFtc4gJiC6/cM5Gt6Jk6iCyHhCr@lists.infradead.org
X-Gm-Message-State: AOJu0YyY5FkAFWPwp98uLRqSsJ3f8eCPv8F8jjDPOj6C/RqMujGF/i9i
	xlBwLrp0oigf0ZdMSQHo9uMN9RJSCNA5Xd2BwCTMWClwqEAbN3zx9+GJF/Rz0Yiz
X-Gm-Gg: ASbGncvgqOV0Z2dm5NLt8zNM8eAgWqEI0dmgpxOzaLdADYsjn/ZLyYK5buvVdGuKJ26
	N2sGyqNF0bIZGSEdY0tNxETHamI2q6Wfuy46T1WimsjgurDi/j8kGERRD9JRf/Jr0YvQV6lRf3a
	kMu3lAeahRzmRud6oJI7jMA2VlekhT5aEI4xebaZsk+nDfZixTHAShDl/wgVWuNM6MSyGiSKodV
	v5DHzUJK+ShFl1gHJ6zsJN7+cxj9yR0UIedS/5h6X8W0VdeCG+cFtR/bIBi3+of+l6f2KQB9bQA
	jGHu87R4rG+TvuNkchK9WnYlvwdxK4nVPSQewZ6tBiXz1l9sb8u3vvZlqaio4H7iJ4aGtr726++
	76FjvJf93vjkCB2vqYH9AUSfdKyjQOX6bbTTJnGXVN2hoy59NyRgz22tnThV50YDH
X-Google-Smtp-Source: AGHT+IGyVGRnnxx2sA6O4hF0rylzitVzqc1iPy+HVfxNEDuklD8GUmLbFKKGEehp0efh0ngWDTw0gA==
X-Received: by 2002:a05:6122:30a6:b0:537:3faf:9b43 with SMTP id 71dfb90a1353d-53b5d4d509fmr551889e0c.12.1755589463214;
        Tue, 19 Aug 2025 00:44:23 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd51a48sm2474606e0c.5.2025.08.19.00.44.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:44:22 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-53b174dbfceso1720802e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUV+efCTED2T5WSZ6jFui0lb1GZcVexwDENxJbwpWGf7ibS2SxSZcBDaZyn7kNZrt4pvqWQYp7Jwui/sQvik462@lists.infradead.org
X-Received: by 2002:a05:6102:1608:b0:4e6:edce:4b55 with SMTP id
 ada2fe7eead31-519b27c870emr28164137.4.1755589462392; Tue, 19 Aug 2025
 00:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250818162859.9661-1-john.madieu.xa@bp.renesas.com> <20250818162859.9661-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250818162859.9661-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 09:44:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVV3tH-Mnkb4z=_3Fu9_zaB+ysuFQYni-ss+Sm_JmZFng@mail.gmail.com>
X-Gm-Features: Ac12FXxuuCpFvi4bwIVSlqKVwnnWvAMNW-GEJwHYH1WcsCL9Lbq44q3fnYgjfHs
Message-ID: <CAMuHMdVV3tH-Mnkb4z=_3Fu9_zaB+ysuFQYni-ss+Sm_JmZFng@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] arm64: dts: renesas: r9a09g047: Add #address-cells
 property in sys node
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, catalin.marinas@arm.com, will@kernel.org, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_004425_079129_DEEDFCC5 
X-CRM114-Status: GOOD (  22.96  )
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

Hi John,

On Mon, 18 Aug 2025 at 18:29, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> A couple of registers of the system controller (sys) are shared with the TSU
> device. Add #address-cells property to sys node to allow proper parsing a
> access to these registers from the TSU driver.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -278,6 +278,7 @@ sys: system-controller@10430000 {
>                         reg = <0 0x10430000 0 0x10000>;
>                         clocks = <&cpg CPG_CORE R9A09G047_SYS_0_PCLK>;
>                         resets = <&cpg 0x30>;
> +                       #address-cells = <1>;

Iff you need this, you need to update the DT bindings first, as reported
by Rob's bot.

However, looking at Claudiu's USB series [1], I think you can do
without, by calling of_parse_phandle_with_fixed_args() instead of
of_parse_phandle_with_args() in the driver.

>                 };
>
>                 xspi: spi@11030000 {

[1] "[PATCH v5 0/7] Add initial USB support for the Renesas RZ/G3S SoC"
    https://lore.kernel.org/20250819054212.486426-1-claudiu.beznea.uj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

