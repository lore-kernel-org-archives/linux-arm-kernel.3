Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4B1CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaH5wVLQcCdHSa8C/Q8gM8ep2RHMYVswk335MNTKl4Q=; b=kGxD9gKGOIhCPN/NK8l0WAzFTU
	tv71JLCw32qKMrP1o22VkHh2s7mIqo/cYaOO8m7Di4PXCbkrXEepmtxbYk+cO2/7vhFu+SbDkCWUe
	lXYcsiBTGzDTckF80ZC55CeEQ9rnoOnMv1s/eEzXSbWBeg9WF6jhIS/uO7zqLu/hO98UCMpuXjaC+
	lA+Qlt7SahO5CFtKxY3fGD0459xNuHzlOempLZNpdhZEtXUuIP7VOpICEaz/D/zFQEgMBcTyK4IUb
	s3v+EqN/vViGwPOT4g+SYVq9VHd9r9iIlUe2pcTkmdjUPXXj2LNnuODHqFQPkCEbn/9NoB+SxF4dl
	c3IOgqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZvH-0000000HRca-1BHC;
	Thu, 14 Aug 2025 15:31:23 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZ7l-0000000HIXD-0c9o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:40:14 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53b1737b9c8so364071e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 07:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755182411; x=1755787211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaH5wVLQcCdHSa8C/Q8gM8ep2RHMYVswk335MNTKl4Q=;
        b=l1Ohjz+VdnhVg9z8NBXHpID0t/ynmeAxXJqLD3Q46T1I4CCIh60xkHN97ekSV/XtOb
         +/jxHt5pTq/eC/bKnNpW2s8P3jyUawij5GdtyMpN2Jn7xXnkaC2hHvfzgABakLWJMNH6
         +eHptWskRzhQ4zwhzKZI3cljwZ0GTr458kDMHOFd3m0ZNx0mPQcFnQSoJy8GI6WoDpV+
         fk9Ot9e/IOcJbXLrQ1mNKrdui8aZe7ZFwvLQkF6meq/ZrTDGT5xV44XSa0rzRWCc8LTm
         Iot0RpkjMEBPlMoHcOm3D4K5q5MU5SaxeAayjLPoLJvoki0VI2eU787yAbWWdSsRgEBg
         a8fw==
X-Forwarded-Encrypted: i=1; AJvYcCVP9o1K14UaxKgPK9BSCFNYjnHLZBxoOA5BpPS95kjiqzpb4AevGzLEDZrT3uXszocQXFB/KPgp9kP4L8sBtboH@lists.infradead.org
X-Gm-Message-State: AOJu0YzNFPCM6fJ2H8S2gGv4xGqjSs6d8kMd6UmQvdyPakLfcz5uIV/v
	cd28YvSfeiCFCKqwprNVZSEzMuVMfuWKegYzjRfSbQEPD+rKjP+bjMjKg9wM8jdU
X-Gm-Gg: ASbGncuJ0tKwTjpJZylwCzcoOPryq2fRlONK/s9KJUYTy3YaqGLDgBM76l3BylXDSab
	4BpmU8lhhoddU34mfNuMPrukTMmWNAifiRRHQ7PQyuTtJYxKKwrUbM15zjpd2YPg3kR0z8jZG+l
	GdMIFqMPelWkk973rGVu8ehqGsjE8VATN+9aGGiZwCWdFGy97WXYOuw6w38J0P6R/GJkMG/wHFN
	WjnHZWpVjsHFDzVdHlCazUjrxL/XnjlFDtLfN2sTxRCXDH+JLUUEaCKU3SP/WP6qH61csO0yQ8/
	TsHQrXnLz4o9C/J3TtSeNw1+D7yd8QSi0UIkFSOihMC/0TZW6GvkjmPFuJmfg6bGpHzUeLL2liY
	jvmrZmb2dwd7T0jtCwV4yBkW/KYl//zuBtquabimmMUkuFlse8Znu2uRmo0+9
X-Google-Smtp-Source: AGHT+IGqIW56P04IfAY8XueBIBWyklURO41qy4nWLWPCh/Psm6TN0Ej35dXIzsUVdqJ0eXpLzJFM8g==
X-Received: by 2002:a05:6122:3089:b0:534:7f57:8e30 with SMTP id 71dfb90a1353d-53b190d150emr962939e0c.10.1755182411087;
        Thu, 14 Aug 2025 07:40:11 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b01ae378sm4606633e0c.9.2025.08.14.07.40.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 07:40:10 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-50f8af4a98bso151880137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 07:40:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXA1jyB3ijlnB3BUrt25P5fyLX43a1pK1GmWVGTPK6ezQMn1/ZuvUP/5G8ZbjTCuJMiNEiSaIFtnpnJbbGhAvXM@lists.infradead.org
X-Received: by 2002:a67:e70a:0:b0:4fb:142:f4c0 with SMTP id
 ada2fe7eead31-50fec575832mr1384714137.0.1755182410088; Thu, 14 Aug 2025
 07:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
In-Reply-To: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 16:39:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
X-Gm-Features: Ac12FXxCewyX2KO-GwUn49WCWjFooiUGy2LjA7azqcnSwW3bRWhwL2RPKQ2cGqU
Message-ID: <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
Subject: Re: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_074013_183893_1F0842AE 
X-CRM114-Status: GOOD (  24.49  )
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

Hi Edgar,

CC loongson

On Thu, 14 Aug 2025 at 15:00, Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:
> Subject: [PATCH] irqchip/atmel-aic5: Fix incorrect lock guard conversion
>
> Commit b00bee8afaca ("irqchip: Convert generic irqchip locking to guards")
> replaced calls to irq_gc_lock_irq{save,restore}() with
> guard(raw_spinlock_irq). However, in irq-atmel-aic5.c, one such guard is
> created early in the boot process, before interrupts are initially enabled.
> As its destructor enables interrupts, this results in the following warning
> on a SAMA5D31-based system:
>
>     ------------[ cut here ]------------
>     WARNING: CPU: 0 PID: 0 at init/main.c:1024 start_kernel+0x4d0/0x5dc
>     Interrupts were enabled early
>     CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.16.0 #1 NONE
>     Hardware name: Atmel SAMA5
>     Call trace:
>      unwind_backtrace from show_stack+0x10/0x14
>      show_stack from dump_stack_lvl+0x38/0x48
>      dump_stack_lvl from __warn+0x78/0xd4
>      __warn from warn_slowpath_fmt+0x98/0xc8
>      warn_slowpath_fmt from start_kernel+0x4d0/0x5dc
>      start_kernel from 0x0
>     ---[ end trace 0000000000000000 ]---
>
> Fix this by using guard(raw_spinlock_irqsave) instead.
>
> Fixes: b00bee8afaca ("irqchip: Convert generic irqchip locking to guards")
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/irqchip/irq-atmel-aic5.c
> +++ b/drivers/irqchip/irq-atmel-aic5.c
> @@ -279,7 +279,7 @@ static int aic5_irq_domain_xlate(struct irq_domain *d,
>         if (ret)
>                 return ret;
>
> -       guard(raw_spinlock_irq)(&bgc->lock);
> +       guard(raw_spinlock_irqsave)(&bgc->lock);
>         irq_reg_writel(bgc, *out_hwirq, AT91_AIC5_SSR);
>         smr = irq_reg_readl(bgc, AT91_AIC5_SMR);
>         aic_common_set_priority(intspec[2], &smr);

I think the conversions in
drivers/irqchip/irq-atmel-aic.c:aic_irq_domain_xlate() and
drivers/irqchip/irq-loongson-liointc.c:liointc_set_type()
are also wrong, and need a similar change.
Unfortunately I have no hardware to verify.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

