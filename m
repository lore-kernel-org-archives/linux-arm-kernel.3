Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F471C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY8XikeU0AVzM/KkOL4D4V6UOM1fbLtQGUrNKfsnaxY=; b=3Emazj0ezlr3wgYzQBdLHeJN0T
	sc3zyyHcp3wKS/Nxa6Cks84VNlbOA5Db+t6J6I14T5lGIPV/9OmBcd6ApXPbuEnGNXP72JTWrI3sO
	kg9R4qQ+i15N83DY0oxb3ujSlm7P7mAmF16LEBtjiK+SP5NDJ1qrXWlcyX9blkzToQ0xZKbVUJ8P0
	yLDDmNfM0ShxBGmR+AnWCP9/6FMXKcXJ4/SRMlwU56UjML9nqbP7V0tfrX1EZ374BtJUC5994vMDv
	YoIEFyr85gjcv/pymGxdAk2u8TXnH2nVMpTcmQltM5CbNyaUmw3LPsz1UmGrtNRtPLXXobsi5c9Xt
	2uPpJH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAp8W-00000001qcb-3H5S;
	Fri, 02 May 2025 12:05:00 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAp5g-00000001qBD-2rPU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:02:05 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c3b863b8eso1384580a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187320; x=1746792120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MY8XikeU0AVzM/KkOL4D4V6UOM1fbLtQGUrNKfsnaxY=;
        b=mCuSiSCb276bBH6X14Hd7EK1KiVeusuZfaitYmUNfXpu5EZrQwBXRes5nhW4bvlMXo
         6ranMuovwexYXrGRqR7lyI1Wm3kR5hN7ecd+e95BXXOh0YLF4WwdNzN8dL0Uxa+kEZlj
         me17Gi4ZZ66zoGWluSw3SggD8/IG70eK7k8k/QiMCJyz2Df1wtEQhGJGdU1H2rnMYSfs
         AMaiS5xXIeMqcUAxj6UysgBn3EA1xKe05ahrW7F89RTSrZ2Tf1+xpn2VR0kvwGGaazil
         TiPnndoN6i++4MCbGZhhlX7g2THB979Fmi3Jl696dPJsr7u6cawvahUJjrgGou+pSBgD
         BS2w==
X-Forwarded-Encrypted: i=1; AJvYcCWamm11u8grlrz1UVxHBJz16uy+pAodvWBoSC4NuGx4RZ5wONFiRx2cdYm0Kg2vCdOuNZQ5q86Tgu2ETYdFqjmD@lists.infradead.org
X-Gm-Message-State: AOJu0YyLPCJ2muLYJz+MHQgIvnvuuYqF/txtQ2h8W6CnSltIhFJIq42U
	mbzyMH/uq6oPkyUR1f5DegbKbLe/E2lGRJl4/0FElXZjiHCDGav9/kXQ25p3
X-Gm-Gg: ASbGnct9o7/F6zf500YUqMVFkc7cbzhTtEdwu+kr6/e3IgBtc8Y6biIpdY1oSg6FrsQ
	+sGrfx/9LS4/zTqKPhvLg4CIc/ca9DZUqz31gi1vtwu9/w6KGe04pp/0CTMCRyCgHZHy/5frYHA
	ORRCY7NDeCsF5u6o6NxWnIdpet23364wmAphjdEA0Xd4EizIkWbuWjs4X+Fb7x/31fM6c5K71Fh
	SAXhbsZ/+mvUlkIDAW6aF1uyXgprqd97QUlpMW6a2C3xhH+kxQjhO0MYsGTYZrSBx6BVZgncwmw
	etCN1ApibGHlgncpq6NrchjuQIPlD9UEdGgLS1XTvFBBHJkLHA7Iz5z9JygL7Jpi+lcsydsVw/A
	BKliH7/5Ze7RKkkaISw==
X-Google-Smtp-Source: AGHT+IE+jBsg+fltwgjkpEacnEKG5TqNnlh+rbCGX54c7CHvEGEDIGmP48WwyO6s50du65bdwIxFMg==
X-Received: by 2002:a05:6830:418a:b0:72c:32a7:8830 with SMTP id 46e09a7af769-731da20b77cmr1322767a34.26.1746187319932;
        Fri, 02 May 2025 05:01:59 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d31cb976sm458787a34.28.2025.05.02.05.01.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:01:59 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f7f7b70aebso1422208b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:01:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcIAY4mFtHMJZRBwHU/LDmmKemOfFw4N5eUFEUJRM0Q4BDULtuqAWaDvjwW3hLGwuIT2lIktuuPUFz6hTO3ZxV@lists.infradead.org
X-Received: by 2002:a05:6808:182a:b0:401:f4e4:5e0e with SMTP id
 5614622812f47-403414b6397mr1305952b6e.33.1746187318706; Fri, 02 May 2025
 05:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 14:01:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
X-Gm-Features: ATxdqUGawMLisO3F1rvM5sjYPkJMq15HZKLhxKiBy_fyPwGI47XSqoAGJERmrvE
Message-ID: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Enable OSTM reprobe
 for RZ/V2N SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_050204_719490_91B99D34 
X-CRM114-Status: GOOD (  25.23  )
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

Hi Prabhakar,

On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so that
> the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Like
> RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OSTM)
> which requires its reset to be deasserted before any register access.
> Enabling the platform_device probe path ensures the driver defers until
> resets are available.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>
> -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> +#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || defined(CONFIG_ARCH_R9A09G056)

What about simplifying this to a check for CONFIG_ARM64?
The only SoCs which don't want this are RZ/A1 and RZ/A2, because they
are Cortex-A9 and thus do not have the architectured timer, which is
mandatory on ARM64.

>  static int __init ostm_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

