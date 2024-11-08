Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B5BD5C0C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8ZJwvOeV6Ng8VTt9n6SG5cFjyqB7gKUP8OuA6z3DVg=; b=OdZ88jYpowIbovyLUGxlJv8LZZ
	YKOgSoltHefMclWiKqVIkbdZEw3UI3zGdl8CPTaD2Nk4KGyULAbv9D7OAl0+K+paCVMLwfXwik2hL
	xogFw1sbjFLKkveAv75ZTUrw44K0/x0mjo2OirfsswqS/o6sd8WA474bInHsqxXTypDuhEfQHG0er
	6Utq6+JDEIdRST6asXImbRWOd97wANTJyd8Ex2coH0EBCNx9Y31ZU7uSOuci4fBXu/DTorrXhtHO1
	JG2jmWt2iOmP9uWjDQ/bPw35J/MNt9ijdvkBT3mPkQnSPKo4QI9iIHoPjzzsD5Qk9GwQPDMyoQGcY
	JsLp1grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PFW-0000000AiVq-1E11;
	Fri, 08 Nov 2024 13:42:06 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PDl-0000000AiMd-0eaa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:40:18 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7240fa50694so1162966b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731073216; x=1731678016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8ZJwvOeV6Ng8VTt9n6SG5cFjyqB7gKUP8OuA6z3DVg=;
        b=VZ7T8GKLCDeLjBrb+KP/Z6l8ycE0XLHYg8b5eNnXONFVSNlOKIzGUORpYggqfyBV7Z
         c8al0V2Dr8R+lXKGpLM4qEQqI+1wvOfdGM2uKV2lriCDYm3qmLKW4K6Mh0bPCaAhR9/h
         2PGnkcWcEFOdalCteY9s3lKc15iYo5re0XJhONf4n2tQH1a8NZcbke8aatKHZ7ZLJOUm
         lezh+OAr0ycK6Hkp+ligR4w0oXikFOpdA5N1mhr6zAC7eB4KKmaXkvib2HKHgN/Ssxzq
         VC/keH8+43SI5xtZFdeK4mAV97QVbnDk8aeQbJI1tg77mhdmGpz5ketnP1e3ciA8xjDN
         p/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731073216; x=1731678016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8ZJwvOeV6Ng8VTt9n6SG5cFjyqB7gKUP8OuA6z3DVg=;
        b=RKooKjeIpQw9+fDoESWi23WHqXN+kB1TqMRI1ImBrTYqSmz3qda/39QaAew8ductW9
         IcK8SFnVxDvit4oWy/FrwquQvNwBS6QTv1RYetzvMEy1YWMv3BuXu8P+5ZvfF4wbXbxm
         1GDaPqqreelnzxbKJzwFOSnFxGhTblq6lKxhm/oNlD3/Nv25i/61Azufn0UN50rV6man
         UnzbvyT8cldjNCjZpzEmiSGq6/H+HnfDsLypfdjJOX3hRAkRuW2WB6zQLBgRF9iZi9dF
         yCmGRWfyhXll2n2TQ2SUiuP1XYkuB2ADv2fEttYqY1GbIBvM7qDUoYc1ZiyL/eXKJa6t
         Ogqg==
X-Forwarded-Encrypted: i=1; AJvYcCUYJrPXkSPduGxWByYjfTpdtMfx+E+YdnzE0czE3H0JOLc2rJLLZ2wy2V8677yGJcv1tG/1Dnjr6u9Z7ito59xe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxx+s6YFbDUu5fs+rBIgCnL179aXJMe4J0vMAXpB7MDQFOWbZq
	MPZT/IhXVWvHKIvyTiCg9uo1AJcjIeBH9uvVLfnRaM8i24BYh8Z0dSZNmfoKhJeTVPz1E2wYItA
	ryZU3b4ptA7BV1xgFkE+d/f5hpim/iBay3IAdTA==
X-Google-Smtp-Source: AGHT+IG6OWkcSu6zPwaHqEtkBnsm7V//38o9bsGqJYwF50bdWilViY347QwXIH+QFKTXlm4Y8ftOczB4h+DcYu9T4dg=
X-Received: by 2002:a17:90b:1f86:b0:2e2:cba1:67c9 with SMTP id
 98e67ed59e1d1-2e9b1754e25mr3320320a91.35.1731073215604; Fri, 08 Nov 2024
 05:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20241108112355.20251-1-robert.marko@sartura.hr>
 <20241108112355.20251-3-robert.marko@sartura.hr> <609ef9c4-18cd-4a80-9821-5df27727772e@microchip.com>
In-Reply-To: <609ef9c4-18cd-4a80-9821-5df27727772e@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 8 Nov 2024 14:40:04 +0100
Message-ID: <CA+HBbNFomosu+5_C0+6cqKcc3B9DFiXXPxexFYjY4ud2LmWqmg@mail.gmail.com>
Subject: Re: [PATCH 3/3] tty: serial: atmel: make it selectable for ARCH_LAN969X
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, lee@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054017_225591_5D2436C9 
X-CRM114-Status: GOOD (  19.19  )
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

On Fri, Nov 8, 2024 at 2:25=E2=80=AFPM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> On 08/11/2024 at 12:22, Robert Marko wrote:
>
> A little commit message would be better.

Hi Nicolas, I basically reused the same commit description as for MFD
and else as all of the changes are
basically the same.


>
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >   drivers/tty/serial/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> > index 45f0f779fbf9..e6cf20b845f1 100644
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
> >   config SERIAL_ATMEL
> >          bool "AT91 on-chip serial port support"
> >          depends on COMMON_CLK
> > -       depends on ARCH_AT91 || COMPILE_TEST
> > +       depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
>
> Checkpatch.pl reports some "DOS line endings", you might need to fix this=
.

Hm, I ran checkpatch before sending in verbose mode and I dont see
such a warning,
my Sublime text is also set to Unix endings, I also just checked with
cat -e and I dont see
any DOS endings.

Regards,
Robert
>
> >          select SERIAL_CORE
> >          select SERIAL_MCTRL_GPIO if GPIOLIB
> >          select MFD_AT91_USART
> > --
> > 2.47.0
>
>
> Once fixed, you can add my:
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>
> Thanks, best regards,
>    Nicolas



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

