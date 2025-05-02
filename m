Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428BDC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djH4HCkZ8fHRpSMq+w9X5Wtnm+h0rA+LbETzrFeQVdY=; b=McnDIqiy4fwYrPr0HjCqtMCV/4
	mGgKtimpJxx2Nr4SWQozSaJ752Ny62Zjmd63zxN29G9huuhY+/71NPcBnZyW83UWC3RHjAOorKq9K
	03hVIPcOC7Cn4xQWcO1nprdWrHUEZ4TcaswzlQmw+snUAiJF9vb0iVXKB53bIq2aREzULm1tg4/GX
	Hrp8tyC5mOceueDzvwvb4jHhwM28Nr2rAJGgrwgnn9exsuAELjiOcvHIeWtEVOjQFCuSerhK9AWM2
	EisoRlT3ArnBy4LRRTFkjwDGDlWTK0Rhw7fVw6y94zdflzaaHTh6B1gR45N9XEP/P0d4cf49jrT9k
	Z1MoQE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAra6-00000002DyQ-0Qq3;
	Fri, 02 May 2025 14:41:38 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArWZ-00000002DIQ-15JK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:38:00 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52617ceae0dso445703e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 07:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746196675; x=1746801475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djH4HCkZ8fHRpSMq+w9X5Wtnm+h0rA+LbETzrFeQVdY=;
        b=IbZ67Xo+1a1Q7XKbe5SORPaKakjHqLKl2N5D+X59BJT3fFalVgmNWmCW+eQwZjfnYF
         A8r93aaG1iXwgTRtEMgxp6ZiTpq98+3+3K1ej+pMUiRqLYL+jI52J0oD1i7a+iylJx9x
         4hnNNLBnTNknfcYnAwrJfR9yxxU60eo55v0E/ukRNDhe9KPN9MoZjPiUnhvNjRbKoDSp
         P4bKlAZEKQVOpW6I9moanv2NqY8fLTj/ZMrtU4BSNzGh6VcNL8CxkQfm54TuVY/REtdp
         7jvW9zA5UzpUkkD/DuT5Yiqd8i1SToyWQkbOUPdS/ub3y2H+Uh/dlI8satiHwO8/nDWm
         2/eg==
X-Forwarded-Encrypted: i=1; AJvYcCUKMgdLCMvLCQ5qpXqXbWgXknJHApEA2R6Aebv/8ioTu3PbBaPhf6jfU6CcCnOWGA+3fpCqWCLhhlrU1nLuYN8w@lists.infradead.org
X-Gm-Message-State: AOJu0Yyukl+AwLXVoDApcONS2n8E0WgNr9xRQPW62MKg8enxiY4GR6co
	KRIKKe76MKWsxxUtaaGKHDHYnSOqxznBjn5BWg0puBr6zZZgF7A4Wh20nMsK
X-Gm-Gg: ASbGncuiWKKVDGGCUXjfv1jtrgodJMoWD/HRkw3P/jJqP9mX08U2l7KmfLcvb+lyyCt
	JM0LTqCT+JJRi47lYynIl6FuD+r/AvailLkt416TSDeA2jpS/9ihtsQ/wn+bTinrkCvBDp8T8lK
	Ie7Obs38zM+ln05bqnIF+4P/6fRppLFvRzrC0JDsTmiZJVuRiieZAPzFT+dkJw8BbyTDFzRWoy0
	Sz3ehpaQZNBxXDGOzOR21LffytCfb04SHeKmNkl4zz9Mk8XTh/8R/ZmQW3XOiUSLTranEShUvIf
	aO7vMyktpp0ktR8iej5BZn04YRmrKGYyuWw6UDpDEMBZ3OwwArNH13yBAVY697w0KAa7udNdia5
	0uZM=
X-Google-Smtp-Source: AGHT+IF77qC4ZjssmK5lPxQFflzoikewz2EU4Ukrp5mSDinjH8GjBYySfOEZXmaTThfsJuEGRuM9Ng==
X-Received: by 2002:a05:6122:65aa:b0:52a:863f:4189 with SMTP id 71dfb90a1353d-52aed7b9c85mr1796417e0c.8.1746196674990;
        Fri, 02 May 2025 07:37:54 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae3e9aa37sm564133e0c.0.2025.05.02.07.37.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 07:37:54 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4dae6255c73so520506137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 07:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0IaQfA7GApJL4mHXsd8lO7FZZe1o8uPTR5G+t02Qmi1Yx69AKYw0atxgPWvjlo1M6vI9r3YdewkkRUdK5a1td@lists.infradead.org
X-Received: by 2002:a05:6102:3ca0:b0:4c3:64bd:5405 with SMTP id
 ada2fe7eead31-4dafb4e491amr2229877137.9.1746196673576; Fri, 02 May 2025
 07:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 16:37:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
X-Gm-Features: ATxdqUGHGVa5bIvq47sWpJM4d0i9BJCZPMZeIzvLmuPiSn_UaSOHz6YGgg0iKKU
Message-ID: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_073759_301639_49ACE6B0 
X-CRM114-Status: GOOD (  32.55  )
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

On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
> platform driver will defer and reprobe on any ARM64 Renesas SoC once its
> reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
> were covered.
>
> By matching on `CONFIG_ARM64`, this avoids adding a new config entry
> for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
> are unaffected-they still use OSTM but do not define a resets property,
> so the deferred reprobe mechanism is unnecessary.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Geert,
> I've restored the Reviewed-by tag from v1 with your suggestions applied.
> I hope you're okay with this.
> Cheers, Prabhakar
>
> v1->v2:
> - Instead of adding config for new SoC, changed the probe condition to
>   `CONFIG_ARM64`.
> - Updated commit message
> - Added a Reviewed-by tag from Geert.
> ---
>  drivers/clocksource/renesas-ostm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> index 3fcbd02b2483..6a5785f9c9c1 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>
> -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> +#if defined(CONFIG_ARM64)

Sorry, I've just realized RZ/Five also wants this.

"#ifndef CONFIG_ARM"?

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

