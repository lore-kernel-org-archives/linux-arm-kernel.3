Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDE1CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8cNW33wiaXVwXT9Hgyi/JcE/ejaGgsPgY1Fa4o6ZiI=; b=me68elnZ4JqLjHO6FYgVuMTy9L
	yiUpZs5ka37bjBXRp0AN3GPnQnBkL8alBFgdEj0mlx8DZdesDdFR65ysrlV5pUs86RrCf9fXc+022
	oID7TZjbgU8mn0BR29nasm8A+nLi2xFih9rmjGzgC3pn904PPSkS+vtA59Ktt4Mhtr3GBrMPsd7mr
	oWcE1zF56/aJ65Uw6VqLHYlkTvjQamsUO8JNugq3eiZEvwqzl7O2Cgy7fA5ZtGwJ4K/EHxAzRZ+fX
	x2ZQhG3CIcUGwk2viYORxeJB5yLEF4/WbInqqcPldSIWLJj7cy5JJDsdnE61zc1HocTR+a41YXxKd
	KyDnACAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Qs-00000002dB3-0FA1;
	Wed, 13 May 2026 13:15:26 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Qp-00000002dAi-3mQt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:15:24 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so1865107241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678122; x=1779282922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8cNW33wiaXVwXT9Hgyi/JcE/ejaGgsPgY1Fa4o6ZiI=;
        b=aY6CnjWtVn6i0eqPqKQ6pNsBk3Bx/45VwSHsVJUVGvDw8vnIWJfqKxnpSXCI8nRO9Q
         DdqnpJ/Nk9PzZSGndlf6Q1UKClD8GRH0r27MMVJFfudRiwPYDLIahVdAYNyfoY3xYNHI
         K6V77zcoqzAdxEI0eM5GvZFZ+NoMsBhIMjHmwLbdXN9hCIC86A3+RBfKQgjoBUIw3Iwt
         LoWPwwWM7/nsp3YZ146bGCjtFKJqznNBTjwp1XQjnqZUQY/U4aKVSHmNL5LitpL7HwYC
         DzWXbfayjYVX/iMNGXBoNDLlJdkmLdWsA/ZEz42T5TwYowkGQOgnyO8APGPgbp7VkIZb
         9aYw==
X-Gm-Message-State: AOJu0Yxl3NZldXNFc29BnL+5giYV6eVUzHHjlPKvH6Tu+05vpOeYueO2
	vDAl5VGhXHQRowiWL9RA5w4ZhsMaNSDjb6f3i/1Sd5TcPRp7O3fM5dlvpFkU2ffY
X-Gm-Gg: Acq92OHL25q3MK4ldJYXrpy9np3VSfFjS0jk+2FDfxo0twy/rnRG6wu4GPjknC2ymqi
	LWWRqE2w3EElLfVdO8NkAcsduJH0cFz/X3faiLwYeHcsPoSvJzVcmr3W31TQXUOuQ2rGPEG2rZN
	03dSVuKmLMvlbOcIG9TQQQBUSZsghOESPK7hCRlkQeh3hvKzwVoLdkcNSo1sH5yG84tV0wWmnlj
	O3Hfz69OchvywbgG3pnSe8y+vonutlNbNkxcig2SIqduznCEhMbJEsXOJ8WCw6JWDyxE7a5xsaS
	4eU65XRwZMomshbh8Kyg0Cn8ejJcYRUxsODeoOcn5/00w8rjVKXzundF/vZX+QKysUMCbYXJtPT
	7a3MqBAdy9gL1HgyxRBao8Tf4RR6kCSkLUW3kGCn82CwEzlAVdPhFnrqI+fYo4y0t/1RuU/gnuw
	lOOGG9E64R2BM0/kLYr+Z6mXVaATuwHblITTmCCmlIAEDaiRdZTAXopo5LD3DyO9rk
X-Received: by 2002:a05:6122:6992:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-575e6fb88e4mr1427437e0c.7.1778678122451;
        Wed, 13 May 2026 06:15:22 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869eab68sm10046438e0c.2.2026.05.13.06.15.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:15:21 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5751e12c524so2318472e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:15:21 -0700 (PDT)
X-Received: by 2002:a05:6122:d25:b0:56c:ce0b:fecd with SMTP id
 71dfb90a1353d-575e70a7075mr1239716e0c.12.1778678120886; Wed, 13 May 2026
 06:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:15:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
X-Gm-Features: AVHnY4JTrqWXHc77xf-iSrs-bkBREqw0nQKCK-qidhrABbBSLqD0EGxY-SoFw7w
Message-ID: <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061523_943412_9C59D119 
X-CRM114-Status: GOOD (  20.11  )
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

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

/sys/kernel/debug/clk/clk_summary looks a bit off to me:

    zt                         0       0        0        208000000
    ztr                        0       0        0        277333334

> --- a/drivers/clk/renesas/clk-r8a73a4.c
> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
>         { "m1", CPG_FRQCRA,  4 },
>         { "m2", CPG_FRQCRA,  0 },
>         { "zx", CPG_FRQCRB, 12 },
> +       { "ztr", CPG_FRQCRB, 16 },

20?

> +       { "zt", CPG_FRQCRB, 12 },

16? (12 is zx, cfr. above).

I.e. the same shifts as on R-Mobile A1.

>         { "zs", CPG_FRQCRB,  8 },
>         { "hp", CPG_FRQCRB,  4 },
>         { NULL, 0, 0 },

After fixing the shifts, I get:

    zt                         0       0        0        277333334
    ztr                        0       0        0        277333334

which looks much better. If you agree, I can fix this while applying.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

