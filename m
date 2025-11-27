Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4FFCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSY12wujyQqkN0s0ZCmyYYswJOo3iF7QtRvGpJcpmMY=; b=KY0EFqFJkQqB4PE8k2wmt5Za9k
	USqivuhpdPFgZ3gdfQpEDUy7kNoT62wvZwjl3VWv9Mf6Tv6+iL6ZZxIkTZXIX8G3Icut5EyZ4onEN
	jZWSIj1IMOujmadA2kK5MIJ1YHtDLP99JZuoPSqUkIIFK13VixIugGXK15I9PnZBT1abhKi5cPQfk
	5uBVliMyAdVyekH4ezgkbjSEc8pK1rEtKgDfiEH9m+n58vSUaZ6iEz8IA0uWmS95ey8hUXCLUVSz3
	jJGKH5sidzTKSlvWTc0muoWYb9Rao+hpqwA7hGdpnw0YxhGnAdRyU6cBLP6dlj/BL6iTD8nwsmhsP
	T3dlCSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXtj-0000000GFFs-1JDq;
	Thu, 27 Nov 2025 09:02:43 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXtg-0000000GFFP-2TIN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:02:41 +0000
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5e18598b9b1so448429137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234159; x=1764838959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSY12wujyQqkN0s0ZCmyYYswJOo3iF7QtRvGpJcpmMY=;
        b=bl9FfazsuljhK+SENNycEBHiSK9qWs2NTjjtnCq5XsAyUjggmYOfqHJdOqd4/Fo4uE
         njkZ+8OTWyE677BvJSSQxzeHGBpcSvomE0Sz5d6elaSPPlzsX2u7tYaN68RsnVNxI9LX
         ekruc1oobeR6XmYzxjiM50z/G/YxcCmCgktyfmU0JCD5zJl//tCm8kOBBejN74GtEWOI
         NnbOCDIQ3hGysp1YD8wT1Ce/YPuWZmhejmOjI7C6fB568imgwt7Aynhl1y89fWDpOty+
         rCjQIt03Qd0QUxIi5tAP8emmQa5yWd27ucKtAch//ymGVWyMxrKHY/t8SDBUcYTLgcoD
         Qadw==
X-Forwarded-Encrypted: i=1; AJvYcCWwumDqR9gMlfx4H3SO8OKAZu0drRBQoVv6r58IgGme28pcPVBC4Q73Ecu+Mt7NrH+IzIP3YbbFCJpLStcqerTY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1sSVbKtuF0G3ycahrrnAWfdS4GmC3YlqfWv7bt3oaWG1XaqSr
	59Dha8syNEFwdrewoxyactdsL/osQ4C16rUnsJFyVU2WiNW8kK9yC+JA+q1E1ezy
X-Gm-Gg: ASbGncvOyCUzueAnoxM5u3l+5DGVql6jxEJyCQjPokJMJKHy66Vh0pviPcyC/6xbGMl
	iEG7hRK0dxLjynkCrmFReJJaW/pileqfiNRWXXlnlaoCKC03x+CHj6Lf8MxoD0Do+TmFmRjFTPH
	OPi8XHyvz7JbcKIgXOOBMt/etmWQZk2V3gJ34lcjOH7DNp667btivRm45LsXsv/uoMxhjdvz4NA
	qdxwFpDvhY1Tke2CzuXSfydCFlgc9fYDGiuYGfpaYl5zTF5zPnc1AjUOQB8b1aJZI1lLU5zj2/W
	IVfQ/fIWmlWulNsdMUIEjQ3SQbzaM7IvNqdVymPftMF9cPwhtmEu43lmfCCsnrcl72yeUXgJiDa
	plYVSIPLM3UmxKv9B4JZIMWdhdI4LIetF4CFiD5wsbygMiBq1fH/c1vO4I5zuLTRyl4kqN448qr
	DcPswrr98ama/aN8BMBRMA7n4BDLMNjsUkW9N4P/eCFCspSBcUNmzbVx/2aXxXVdY=
X-Google-Smtp-Source: AGHT+IFTadLe513I3BAT4oSNQNyksVpIeChvlh82PgZW4tR+gQu1W9QAHqu9uSl3/3AY0d3gB/LcjQ==
X-Received: by 2002:a05:6102:3909:b0:5db:f615:1821 with SMTP id ada2fe7eead31-5e1de088006mr7482190137.10.1764234159162;
        Thu, 27 Nov 2025 01:02:39 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d9391f8sm310504137.5.2025.11.27.01.02.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:02:37 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b1dde0961so481656e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9230iQ2m6st77Ix4SrJM61PNLXIk/unCkB/kb0sOwBTm1X+KJNkiXAKjTR4ohcrgEk8J3YYTp7OiTwyByqEdR@lists.infradead.org
X-Received: by 2002:a67:e108:0:b0:5df:c33d:6e54 with SMTP id
 ada2fe7eead31-5e1de0099d7mr8404976137.3.1764234157141; Thu, 27 Nov 2025
 01:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com> <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 10:02:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
X-Gm-Features: AWmQ_bmLgGar4dfe4FpC2atA-pkz10WbT4MOeIioGse4jPHnHaBNPYet7pQnslE
Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_010240_633984_BE5A816A 
X-CRM114-Status: GOOD (  22.92  )
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

Hi Krzysztof,

On Wed, 26 Nov 2025 at 19:23, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
> clang and W=1 causes:
>
>   i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>
> One of the discussions in 2023 on LKML suggested warning is not suitable
> for kernel.  Nothing changed in this regard since that time, so assume
> the warning will stay and we want to have warnings-free builds.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch!

=
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->io))
>                 return PTR_ERR(priv->io);
>
> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);

Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
The former seems to be the least common option.
FWIW, the most common option is "uintptr_t", which torvalds doesn't like...

>         init_waitqueue_head(&priv->wait);
>
>         adap = &priv->adap;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

