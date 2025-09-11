Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFA0CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdO1CSLui5RRcTpK5b6MAqtw8kcTxu+RvPzYwpqfiQQ=; b=WuiDcilxbabIVPPXzGV++wKi0l
	KDjkA9OaaRkwHXTMV6qstuMVtRnl6KNHKa8OEQNtYNuvVjJojur5HtCvI4QyT3n7NDx8nitIXDWeh
	RcPG1BayYdR/lOG3Z23ekPPa+n5mesVWmqRE16gQOWyrPhEu6n1CJQAmubM7hkuSUaSXUxo6AFiUk
	vrjlavLhf0i4hTxQBM0VhIIIgyvHOrtlxrKny8YNVf1OlVXUNreYCUaP8zxvePB2Dl1p3y3XNpScq
	vsdNDPz9l8ApaFKJ28AfDlwZDwxPKSfZS0RKmD0iuaLs74Qw9WL5aJikrIHk3/N8Igqf833/30Q9R
	XqntGkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiGq-00000003Y3Y-37BT;
	Thu, 11 Sep 2025 14:27:32 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwiGo-00000003Y1a-2OjX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 14:27:31 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89948e581d5so445382241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 07:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757600849; x=1758205649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdO1CSLui5RRcTpK5b6MAqtw8kcTxu+RvPzYwpqfiQQ=;
        b=OHExU83bX0NVSOaFKQzZig/GA0Yawt1yuq+kQyOMJeFCY96H5agyCcdskija+2S9oE
         GOM1/xzx2Jg2G0Db4DYMm+hM2LwhFArSNcbPvxSD3LpRcVbZ+NMyMC/o3TyGqeENETWL
         RR5YGYsfEbfZTHfGAj2uoKYLwJLiJp2c6gOXL8WzddQOzgM5HTeuQftxlvJWjntxD7XD
         f3NUyJkG3NAWtQRkKnbBBM1tCI0ZCnPtW9LndY+2qSwF7ZJoCA73IFSO7lytZMUguRim
         iz8B2XTbNKUD/QGG06BdSZYV41sI2Wb3vDfLEMvfT1107Hk90BUSzBIgDJaxkYbhW97+
         o5bg==
X-Forwarded-Encrypted: i=1; AJvYcCVD2Q/CuHry4jeFAqRRn3wV3Nqqw0ZJuTnzQi/7W5vX8Jr68j1W2evcBuU+YQvOLiY4qa0PeTwQyeSKESBKhmPa@lists.infradead.org
X-Gm-Message-State: AOJu0YwPzZQ7ZoHmYm/NfFo/eCIYWQs/qUeIJtO6mTEUHJj6Qby25aNq
	VVoFA9sMvrQX3tdLmz5tJxldnPjiGINxk3UgIJKpY8ObhrKoK78sofqyHJdj270y
X-Gm-Gg: ASbGnctOseqEQfAbZK8bu5HyDxykhHxctzpwgwu4qIpy4DvXi1a8U+FeLzXcIzKxiNT
	P6a/Y5dFMeE8knwk+MrKs1/dKrATt7/lJPcP6ag8/ab9nB32nrrn7AFZpZA5bN/ibR2u9ZQ/r0S
	orOgGqIJgpcJXuOI9zPF5meRI8nLny9zCowUmb/iF9xVQYL++YxtujK4xh/czzabdXWi4QW7T3Y
	vXmPcLRyyfgBNjLiRmB8ydE+sR4iBFFFvxP1g/NNySSdMxk3SfBd8i/zrD7qN5axq0Kfi8lIs3c
	Bw5q8MVvqUhINYPFolGJCYOTKfybeA2+M/ry1vL3IqIT116+wYl2KTmV2nG5uPXM7PLgIn8Lkm2
	hseLhvK8ZzgWjL5Q4sa0I/9O20u5PXqEj3vCLw7Cg5B7uNrUrZXW+NNtENEX9
X-Google-Smtp-Source: AGHT+IF8bhiDH9RVU1v/IwIV/RduE6nkaMeMIXgPy/FUq2C5eo2L8E9SDnWb2P8E2J7k2Zr6Tu5fLA==
X-Received: by 2002:a67:e7c9:0:b0:4e9:cd8e:c28f with SMTP id ada2fe7eead31-53d1afa2499mr7343069137.1.1757600848888;
        Thu, 11 Sep 2025 07:27:28 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d3f050esm287836e0c.14.2025.09.11.07.27.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 07:27:28 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-52912c1c805so441147137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 07:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKk2+iR2hpPQXly3StNrmxCwrljbywr3p6Y6s+bGvkAgOtid89L/a3bzy0pB4pjbgrDqLtLue34Sbkujq0AZ8X@lists.infradead.org
X-Received: by 2002:a05:6102:5128:b0:525:9f17:9e55 with SMTP id
 ada2fe7eead31-53d24251fe0mr7482216137.32.1757600847846; Thu, 11 Sep 2025
 07:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250911141714epcas5p29f591a1d645c9c69dc5b7d2c2d12af50@epcas5p2.samsung.com>
 <20250911141605.13034-1-ravi.patel@samsung.com> <20250911141605.13034-4-ravi.patel@samsung.com>
In-Reply-To: <20250911141605.13034-4-ravi.patel@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 16:27:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVe-FULHWk3QCBENG7TsbEZyxj0N5shhESxWBWd49JmOw@mail.gmail.com>
X-Gm-Features: AS18NWA9988xiKX4_TVZURlwneQiJAxbodcHMKtf18AoQ7BwMpO-0BHXub4ifEg
Message-ID: <CAMuHMdVe-FULHWk3QCBENG7TsbEZyxj0N5shhESxWBWd49JmOw@mail.gmail.com>
Subject: Re: [PATCH 3/3] tty: serial: samsung: Remove unused artpec-8 specific code
To: Ravi Patel <ravi.patel@samsung.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jesper.nilsson@axis.com, 
	lars.persson@axis.com, alim.akhtar@samsung.com, arnd@kernel.org, 
	krzk@kernel.org, andriy.shevchenko@linux.intel.com, geert+renesas@glider.be, 
	thierry.bultel.yh@bp.renesas.com, dianders@chromium.org, 
	robert.marko@sartura.hr, schnelle@linux.ibm.com, kkartik@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
	ksk4725@coasia.com, kenkim@coasia.com, smn1196@coasia.com, 
	pjsin865@coasia.com, shradha.t@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_072730_616893_2A25C46F 
X-CRM114-Status: GOOD (  22.33  )
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

Hi Ravi,

On Thu, 11 Sept 2025 at 16:17, Ravi Patel <ravi.patel@samsung.com> wrote:
> Since ARTPEC-8 is using exynos8895 driver data, remove the unused
> artpec-8 specific driver data.
>
> ARTPEC-8 is using exynos4210 for earlycon, so earlycon code
> for ARTPEC-8 is also not required.
>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>

Thanks for your patch!

> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c

> @@ -2655,8 +2621,6 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
>                 .data = S5L_SERIAL_DRV_DATA },
>         { .compatible = "samsung,exynos850-uart",
>                 .data = EXYNOS850_SERIAL_DRV_DATA },
> -       { .compatible = "axis,artpec8-uart",
> -               .data = ARTPEC8_SERIAL_DRV_DATA },
>         { .compatible = "google,gs101-uart",
>                 .data = GS101_SERIAL_DRV_DATA },
>         { .compatible = "samsung,exynos8895-uart",
> @@ -2828,8 +2792,6 @@ OF_EARLYCON_DECLARE(s5pv210, "samsung,s5pv210-uart",
>                         s5pv210_early_console_setup);
>  OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
>                         s5pv210_early_console_setup);
> -OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
> -                       s5pv210_early_console_setup);
>
>  static int __init gs101_early_console_setup(struct earlycon_device *device,
>                                             const char *opt)

Removing these breaks backwards-compatibility with existing DTBs,
which lack the new "samsung,exynos8895-uart" fallback compatible value.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

