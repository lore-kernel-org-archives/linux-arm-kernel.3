Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D4DC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFRHIlgUH34gNIFpS8cBfqFWe89JRGpFMu8JNscE7T8=; b=FpMphzGxaed1KyC2knznEyEXsr
	L9wWyIKERcmRFwXkRiaeYbuF/OPXNjUnV1s6I5u8dTXwlxA9Q4jpBQIhqgOz0ZDf7eP+YuT0RtS0x
	/BbAYKnU5MJaYGKp7KF4Ssp3UFExiVZSFKzl/ELF4/GFv/Rfq6cBaXM3q8l/tOwcfqQ9si6bCOLX9
	ZMZqFiKfMhhIpyGXFoe6i8IOyzPsETZ2EjEHAJyaCd0eV2OtTTZa5LXppnHwu5hI9GGBaLOEqppZR
	96NpTV2RuGCM60MGITLZLwPNvpfBmNIaR5BFuytU8lfvvM2V58xAMaq2KT/BzwuB9tevcAGMhqK59
	srnfF5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DAR-0000000B2iD-2h5V;
	Wed, 09 Sep 2026 07:56:27 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DAO-0000000B2hA-0n6p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:56:25 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2531f453eeso806033666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 00:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940582; x=1789545382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FFRHIlgUH34gNIFpS8cBfqFWe89JRGpFMu8JNscE7T8=;
        b=P8BWURRoA/XfQJROSeiNKzK+AdLDpSVrVbVla7bgn6Lfn0vbmmh1jcM0FE2Q2rT/Hm
         VCBbEkGGsGoWgwx8c2U0YKA8qQU2Qw/AjRy7+N6kAjBYzdkzKmtrvnp0gI66FyHZa23D
         PPiti6Q25GJjfSvB6fIVJTf29sfayNchEFuB1G00zIYBJNteXXI9xPCmjpDm/KQQBPO4
         0ZIyK5T0WcIpyhwtpsnQ0FBkH3V+admJwLaep8TtYMpNZRbOfwQVMux79OwFOvDmWQWG
         V8jb1A9wsNTpzU9ssT2LuUFFXhl1fbM5Dq+ewtW4Wi6LrnNMcyGVsRUIwOzFXVk6/Q5U
         RX5A==
X-Forwarded-Encrypted: i=1; AKwUvBzhYCRwDXydj1h84/rnn0SS3Y75UcuJWbgSeWUCkJQOtva+ZA8Yp99h6wvis3iCNWUY1o1lI7syVtaXojXR4J/u@lists.infradead.org
X-Gm-Message-State: AFuF++luEWZy06hK7Sg9elC0xEucmIQ4M0mAAEKsCi7A52fNEdGeehGK
	403kuH3/ZVGm1YJyFckqVGJai/Wz+YEPTaaECSmat991iO96hSNXY9foaWKLYgwxHiQ=
X-Gm-Gg: AYBFou09+1qw6Ib69iuTiSE/SPkNAP3p3XjBINW7mEKVaynk/jBGKzWKRfvJlZcQbue
	dfNcTj2BsFdqyweQ0eYzU2T2YhoKa7j/A8OAd6wZ3/PI9kuFiiDq+gUP47u5U1zXVC/R7o2fONl
	aJ+6Jd1DD09IlY99k+qzecTw+QFjr71Cqg1x2/UOHn3z738FMAjHK59V+C63mZQDtg/EWrWZKEc
	VTNscHDcUqsf/EHNEGz29mtASn8qyImm24DEnpfYqA6shZiozFt4xIASbfK976JARhLKwZQSe8o
	mozBzaQsFrKpyNY+SZM7k3mK/0Al8NOhRjs9m5hPADt6x/KU46WasJgLUfR1h5Km54ulDKppgcx
	JwpN2g6KbOBcEMib1uqldOhCGHl/tx5eZBi5uaI1ojL6ZaX0ih53fUnaWvjkVHQYtvVBx6xKwbN
	k9K29Te4rM5A4yjaieol5xYJnGi03ZOMg91zLp/c3D1GJRKwUR1oTknTgk5vUJ79zZLU66TnbO+
	yvZ0+AIAIMnXSnU5gaYBV/DvMfdUmxZZCPGn1LQ4Wh6nptq
X-Received: by 2002:a17:906:7308:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c260c8e77fcmr2827123366b.9.1788940581991;
        Wed, 09 Sep 2026 00:56:21 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm715115966b.3.2026.09.09.00.56.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:56:19 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso7687887a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 00:56:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWg6D4IjMnwizKNze7XDOf1RomE28UsBncR3MDmC+RXXqc+SRBD6ZcPuafVEH0UdRGUntLBqLy5iExvJGeDgPE@lists.infradead.org
X-Received: by 2002:a05:6402:44db:b0:6a6:7fa6:f0ac with SMTP id
 4fb4d7f45d1cf-6a7e8f9e843mr19491213a12.22.1788940578727; Wed, 09 Sep 2026
 00:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com> <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
In-Reply-To: <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:56:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
X-Gm-Features: AcwNN1VBlUkOuc1dFERdA1IT0JCfCvNrtGVHmcnj2K9AZQ9QnT8wN-u_7o86Wro
Message-ID: <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_005624_244093_DDED4736 
X-CRM114-Status: GOOD (  29.22  )
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

On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >> +&pfc {
> >> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >
> > Node name should be "msiof0".
>
> Do we also have to fix up
> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
>
> "
>   755         msiof1_pins: sound {
>                            ^^^^^
> "
> ?

Might be a good idea, to increase consistency.

> But I wonder, shouldn't the DTOs contain unique pinmux node names, which
> cannot accidentally overlap with the base DT or other DTO node names ?

In general, the answer is yes.
In this case it is about pin control subnodes. If the base DTS already
uses msiof0, its original user needs to be disabled by the overlay
anyway.

> >> +               groups = "msiof0_clk", "msiof0_txd", "msiof0_rxd";
> >> +               function = "msiof0";
> >> +       };
> >> +};
> >> +
> >> +/*
> >> + * PWM1 uses PWM1_B pin configuration for pin GP2_13. This conflicts
> >> + * with SPI_1 CE_1 signal which is also on pin GP2_13. Disable PWM1
> >> + * in case this hat is in use.
> >> + */
> >> +&pwm1 {
> >> +       status = "disabled";
> >> +};
> >
> > Please move this node disabling pwm1 to the top, for compatibility
> > with dynamic DT overlays.
> Could you expand on that a bit ? What difference does the placement of
> this node make within the DTSO ? Please pardon my ignorance.

In case of a dynamic overlay, pwm1 must be disabled before SPI_1 is
probed.  Otherwise the latter will fail with -EBUSY due to the
conflicting pin being still in use.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

