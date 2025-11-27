Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41335D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIb8SaPvztgKHHZzH8CWgVAXI7TZRDphVAmy2KGknFI=; b=jpm1ug37EcnmUwYkFW+CQKQCuc
	+gBdvYRJlUyDG/c+t1KGmDtQgjyVq9zhfn1NLWO5Zyk8N3z06JMkAQs7/n+jV/YsYTtMSU2h9KeRi
	ebghug/bU7o6KYlw51bhR3MP9ZF9Ivtdb9rb6u9YGO1bU43W7Tp0FcKbC4ya4qD4l3VKys5SCD74J
	4IZ1TTCHu6lV9QyyGsnqf3m1Q0PBTCAd9D5sV2J9ZxmHv6WzskSEHJ9126B/h0jBxKc1QDBnDcX+V
	QX0L+IiqaGbED+o/3zIuRU+pCjkfITsgp1Wsos9s5aB3o1osE1Tjj+w50uKT6Cby+JOREP5T4Kkn0
	XGFUQnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXVC-0000000GDOs-1Hu6;
	Thu, 27 Nov 2025 08:37:22 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXV9-0000000GDOJ-0Q2z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:37:20 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dfaceec8deso463341137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 00:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764232637; x=1764837437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIb8SaPvztgKHHZzH8CWgVAXI7TZRDphVAmy2KGknFI=;
        b=DD1bf14oDggrHB9g1i886qamctY/JbqtNchERUVBdB6dZusm1CUKiJr8Twd7JcW5CX
         mdsLMyMlWX19ydEaY1Flv7llLHh63CahfPMiZIMHjyDUtDINJWAK5PNbkX48iC/KFkn+
         /A6Ctf+S2O9FC5tAdwRCBTYT9zYR1lA3Tek1VCe9+dlVK4ugTGb73npkjB1MSv6f0XO+
         dqidxufTBgLc+N9tiyFIgZ/wVAbFOUSTLljhEdBRcFCbH6MmlpweWcdRWqfPnA4TTx7v
         mX3Xw5S4BGsZ4/VDhXvjh/TSa1unrnTbrYPos62EP7G4QWkdjegTVue9cM8eU6AZ+SjV
         As5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOIBDzbwBoFeUDvz7DKxeogjEBSVKBjYjE7j3YO+nQp9CY5bV5briuuXFk1ZYhKW19HhhW555O7012yn0bI9a4@lists.infradead.org
X-Gm-Message-State: AOJu0YzceMwvFlV61dcCEKe3d9lOagYZ5BeYzJR2s9JvpVdF9wecyh6O
	sl2639TW6t5QHKjHp8WAy1BKyRJylUTXd9v0U8NTG3V0sdG7bIqIrlBPwlPC7ml3
X-Gm-Gg: ASbGnctMC2pVxCx04wxvhd85ns/57FrKvsxEtWwtNrc6B1RaaRXNzNaDMUqpSNk7yap
	Aeq+cha8dtfIq40FwxVmtIy3ozcyCLplcmHA2kt/HqgGssFvjRN+31ENJDgew3gK9QicNjb37xw
	Zxb45ESNU0rUQEam6XoRdYCCz+Ak39F3flv+MdQF2DVqdvcqjmi+yi/pYAkK3hJJYt9z5niwada
	bq4fbLO1k2gYWlXTZTVg7+yK8Lg4byA8ZhvlFxygJ4Dwpf/CSLXye8d5EMfUmOPmTQi/hzunI96
	yos/BGLA0ZLFSSpQOgdBi7yvbtJyWYpfZXHbiSUr+Z10mPB0DbptnYKu7xK1H5X464Hb21j91kW
	COnM+8QM3pZv/5Q2RzeEM8eSbh7i09bD8d+MJ/YO5dym12OM/3NtxrTlBvxHUR3LbOMOpTwRd9H
	f+4gxmCbxtDxoiw4rY6eh3CB/YhxrAWyw9DCb5au7w1we+Se9m
X-Google-Smtp-Source: AGHT+IFvH3ojMU3x3SxPsWoyiVEP9cOfjem7vB6CaUe9r9rWjvoodshjvzxDW8F0P3YCJK3IX9TIsg==
X-Received: by 2002:a05:6102:8019:b0:5dd:37a3:c389 with SMTP id ada2fe7eead31-5e1c3bbad38mr11679970137.2.1764232637019;
        Thu, 27 Nov 2025 00:37:17 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd6ce2180sm355646241.5.2025.11.27.00.37.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 00:37:16 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93725308c15so411619241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 00:37:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlKnWjJTuUs96QYKnhoiE0uBGHbXfVKaKOPthnb8tznowimIe5xrS/P4j2K6TtWGv8cP3am3NdNdW3MEFfgVdY@lists.infradead.org
X-Received: by 2002:a05:6102:1623:b0:5db:e32d:a3ff with SMTP id
 ada2fe7eead31-5e1c41a822amr12513289137.19.1764232635987; Thu, 27 Nov 2025
 00:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org> <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
In-Reply-To: <aSdjT9BLzGF3_5PB@akranes.kaiser.cx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 09:37:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkVv9s4nivghVE7rDnIpugWqg40dFmqyxV-7HzaTJ-oT-X1ymFUQxkCVvQ
Message-ID: <CAMuHMdUGmw+Pa43oqcGzt0x7ED2FGw0=U7XddvdaUZ3GFmsxsQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
To: Martin Kaiser <martin@kaiser.cx>
Cc: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_003719_151558_13AAC042 
X-CRM114-Status: GOOD (  30.18  )
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

Hi Martin,

On Wed, 26 Nov 2025 at 21:30, Martin Kaiser <martin@kaiser.cx> wrote:
> Thus wrote Jean-Michel Hautbois via B4 Relay (devnull+jeanmichel.hautbois.yoseli.org@kernel.org):
>
> > From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>
> > Change devm_clk_get() to devm_clk_get_optional() to support platforms
> > where the RNG clock is always enabled and not exposed via the clock
> > framework (such as ColdFire MCF54418).
>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > ---
> >  drivers/char/hw_random/imx-rngc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> > diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
> > index 241664a9b5d9..d6a847e48339 100644
> > --- a/drivers/char/hw_random/imx-rngc.c
> > +++ b/drivers/char/hw_random/imx-rngc.c
> > @@ -259,7 +259,7 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
> >       if (IS_ERR(rngc->base))
> >               return PTR_ERR(rngc->base);
>
> > -     rngc->clk = devm_clk_get(&pdev->dev, NULL);
> > +     rngc->clk = devm_clk_get_optional(&pdev->dev, NULL);
> >       if (IS_ERR(rngc->clk))
> >               return dev_err_probe(&pdev->dev, PTR_ERR(rngc->clk), "Cannot get rng_clk\n");
>
> The clock is not optional on a standard imx25 system. If it's missing in the
> device tree, the rngb will not work and we should not load the driver.

As the clocks property is marked required in
Documentation/devicetree/bindings/rng/imx-rng.yaml, "make dtbs_check"
should flag a missing clock.

> Should we call devm_clk_get or devm_clk_get_optional, depending on the
> detected device?

That can quickly lead to complex code.  Nowadays it is fine to rely on
"make dtbs_check" for some part of the validation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

