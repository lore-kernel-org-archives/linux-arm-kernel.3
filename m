Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A34CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=MKFkHtkTihkG0V80iOdTHBz/Uy
	KhiRdEb0Px9SWh3HpIsc+IOkMm3tBxW63SSzzMy2C2vvnXOoD/XSID/uzDYmLgGBlh1zdHOlqkoIg
	k1HPRDzoSbY9Wv5I+qhoQ5GgNIWRHIsoB6CtaLp482bPfjUkxZiJ81WYXk7AqiDRjpPEbI1hDa27W
	fQxje+WxGijgfxenyatwY6OJXnwy7g7zxtAxtSGJpS4NC+qnGsGKIQaSDCSlC+HnNTgVbJBFiSq8a
	iIjbxU9/dnzz8EwndSW/pR9rGF2EX0UJhk/E/S6YK7YuG8k2sriKayaTaz7Y8RoFzmpsaOnIVQqcp
	tOIKRJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPp8-0000000AxK9-09mf;
	Fri, 22 May 2026 13:21:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPp0-0000000AxGD-3QQR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=YeeZ5o783ARAXwUW5rsbSbo4vy
	oAbpkAmsSMZP258N8J69SgMv0QFoPnbR8K2yIuf7IpVRyCVhE48TUXK4yoAnYFVyToBI8VMi9iF1X
	VdrIduzBvjbONLC5PwKbfvbH/cfDyBXBuT5q2+XcjvnyFWLyAZG9xJ8XhqjTqW2QPrB5eN8lQw/BS
	I8SaoM7j6eGlQqrnkKm/0OXnSw9NjLgufG9oloVbLmClmuzI0ARrnEpixkHM8XQuTNuFe+nb6vl1s
	M0/YgYXCultsCoa2IiPqI0ihOErDsbJJBltKax7PlpCYGtSSrwph8UNhVMla1xuB4rbokC0E7I8N/
	Aw/lbs8w==;
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPov-00000004QaX-2QX1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:21:48 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bce386d5b85so1180452766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456104; x=1780060904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=kbKhiEjIr/iVpHz5k94ONfsf0DbuzZ8cnJmpG9j9ycFP1u22dYeXjUGmq5/6b2rpuW
         712MbLkBnnX89H8PfOysfu3K11aEUnYZKlKo3boMqdUonHoxw20t2kLbWaSbOZ5vdv5h
         U8N6mk1+r1vqsHMS/jSYARU/WJ9uthFXfAPk5yVnQBiPVCP2K6B8XBDNwLXOQoK2ltU5
         sr8r1Xq5bse56CSDjbdVL59ZiWgUzBR0OyNHEYkojmXK3nXIPYcuxsdhh793K7U/UftY
         bE288oxnI0JcVgib+qesX3/WYYIAQG6gwfmAaFknrWzSKoaDkShIuL4iN+GeWFOj+ac2
         hSwA==
X-Gm-Message-State: AOJu0YxkGi2zyBCRPyK+FxvQWXDUmIZ8ss2UCgct0ehmW0ZQMZlSyJPs
	HOt3hItU9YdHKVyT6hQwL4sswVdV6VStotOYVxjw1CH8zkcZXdw3AHepRgIMo+/GHSE=
X-Gm-Gg: Acq92OES2LLJMKaxAcZgpUjr7BWt6BnNtaIgHerTJhnoZzE0BAHpKU/wtspO3b1xmYx
	fjqPNMHYIBXE/bfOf+XmUt9qwVtUAwZtSeVUQGbvFwBscyb8r5Q/AKl32wilVKgIMYmy4n9nY6p
	5LJTqgjKhvGOtW+2P59iQVzh/DQ1+Hwmsh/X9jQm+tZxZzZFhKlFET3A3CshtB8MrLgIP1WMf6r
	rpx1ur0AjF3ydRUDp+jYvtNxuz09O+0iXJav4qLFs1bDit3/A8X8exfvFBqETf3mEHZFfw89hw2
	26R8mTZBz2iwqwPpw0WD6XHLebjHltLRgOOsI+uwl1/+a5fFnxqtqcwDfpaEPZNMkNohgyFmrD8
	FOhHCtPjjSK0zaOt2hbpg2ya6IOeWyQJVylymAGTPp2M6D8jhPSLe/dAgmjDLKms0zXVIUUumpv
	RYx/lVx7iNvSvPUH51E3I7sLJynWqyktyyNb8XW7ZqqxwahTVfZPGGiNskBhGP
X-Received: by 2002:a17:907:8997:b0:bbf:74d7:1c4a with SMTP id a640c23a62f3a-bdd27fb3622mr230924266b.40.1779456104328;
        Fri, 22 May 2026 06:21:44 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264d98asm54917466b.9.2026.05.22.06.21.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:21:42 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so4189009a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:21:42 -0700 (PDT)
X-Received: by 2002:a05:6402:40c3:b0:67f:7e9b:afe8 with SMTP id
 4fb4d7f45d1cf-6889c4167e7mr2035745a12.6.1779456102329; Fri, 22 May 2026
 06:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXULb8d60kxa6aOSy=uXhByyHWQbZaEY-EOrFWdcYPaRA@mail.gmail.com>
X-Gm-Features: AVHnY4L5XJ7YwASenMlXUKivWU992B_gEILaXDcRMH1AAUKnrMIEZvkG7w1HbsQ
Message-ID: <CAMuHMdXULb8d60kxa6aOSy=uXhByyHWQbZaEY-EOrFWdcYPaRA@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: renesas: v3msk: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142145_966991_BA72CA50 
X-CRM114-Status: GOOD (  19.66  )
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

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

