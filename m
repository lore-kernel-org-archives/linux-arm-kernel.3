Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615ECC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=in++svSa02ErHIPrNvZ2agP/eBfnFfOrXRybTciyp0k=; b=wkN/nzMNLS1Ui+51NFQzfhj93/
	LbkPP57LpSP5Dsbd4KdsMvMwb+MF2Wb66gl/Bws7HF9Oo0dPT+ZpMMJVGjHaCTXdI0A8Ojcv5RU0h
	WDvtDabDui8b51hx1tNR+PTObtuOJRNXM86Vi6Yp7pENM9VEu0dFh5mlmc7rr89wxvxNWd7ufvMgu
	8Co9iJsgBIUqVnGoHeaBHeCvubcMCQIQYPxYWYyn7hMtGAJQj42F2Tiee37yQXl5hp9BquPaotJEK
	b7/SPdFFdG1f8l/ICsiyL5UnihthZQrddb03Kl2Z/QitaRdtkBjtw7nZ4u5yhfEecBvbev051as0M
	nmrqYalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOiW-00000005VJK-33xJ;
	Thu, 02 Jul 2026 21:13:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfOiV-00000005VIz-0Owm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:13:04 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so2272760a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783026781; cv=none;
        d=google.com; s=arc-20260327;
        b=G+jhda6R4xUpvdWblJ0PQSQK0Og4YGO1N+2RbX2VvUZ1ZGmEWoGos8FtlaOhH+YbRG
         /A3e6dFBf99BKflmXJ90wZhXqraqaAfxTDhG2THY/ZGwxHQv3ZttuUtp2l4JxY0G4Kpg
         UlH/cf9KQmdpKpGT/UZ1A5UwHdjWosSlMS8KP9I7lLwt4UoLTV4PIwZQwxucX1Bxvvgi
         fNMG91WPLCkyfVulVEGAmS85E31V9jqckVz4StMwXoaU0F86Gv0dUbnq7+5ukWmcHS+p
         MQxi7bfc1dn3cYcLOYCcB3jWwnoCDcP9QwlVIaUe/yuLYGx16Rb/RJrdhdFMZODmd8wG
         dN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=in++svSa02ErHIPrNvZ2agP/eBfnFfOrXRybTciyp0k=;
        fh=3DcpqGHjcq4znvOJiP1K853YJ7yejouaufmxBQ6Xlzw=;
        b=pgiqZAGJ3BzeUdkffw9ncZ/h0xKP4vuv1eWhp1/SlzyALTBaHQ+fHgR9jAZ3m7xVzM
         jwxm2z71SgZmQREEXTshus/GmpE4FLYATkRCJXYk37yF3T2GRUpqvYIWAkcpiMBKzzk+
         fKkOrm3Dcxu4cYXI/dRko+KSD34JBblPCNRk6JNffjNcdjBdvcq4laL4LKcb4eKU1vLA
         xz82d5sayyuWZeKwvwkNYL7sFf8590KcIYCJVTjqflFEq3/Gemkke54vtbt8Mz4NEAC3
         kytcT4V5eFACyO7SNVhSRfsIwClvA7Dk6U/h8hjxBqolDbS9RItHrF5zx7CENlBEmNNo
         mmLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783026781; x=1783631581; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=in++svSa02ErHIPrNvZ2agP/eBfnFfOrXRybTciyp0k=;
        b=RmOlHXMw+8PKrOSYJC6/fKkrTXwKAmZip4IO+2uqef0utKoZ+Qc0IamcOgvxLAoBgf
         2mH3SAafK64YrX+njrZ9Bcfm7eZyS5wh7hSau3z6it8TDrcucRMkqhXmPdmVgmgTqPuV
         jFes6Q1PWDRPzmZsvT4/gC2Aqo2pie9WaG0BaPizZDm/hb0OkuLFALtImMJ4MQxroJVj
         EDIXmoXMW+kKYuLpSgJeaAT7i4RMscWLLkFL6Kjy5DBWrfZK2rTlyVJH66GqeDCODOGT
         HP79ApKgoZnnZEvQl72In6NbmgohGASOG+2XT4P37pX/nddCeWG+42ZHO6Ps0wc2CMsR
         b+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783026781; x=1783631581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=in++svSa02ErHIPrNvZ2agP/eBfnFfOrXRybTciyp0k=;
        b=EO5w4HCCMNf2KIv6HxOxjhTClKHtaIqtaWxaHlqPvCwQRzIJ4iIMzO1iq968QbR3NL
         /h/RS5vUSsasYMzr9TxjBhoRMHBkjeBLtuiH26fvF9lHxGPR6kqBI7svnrLchD4NracG
         J41iPdZRSUnbhSrWlJwFWB6GmmuN8ovay3PiOPp95vABKqqGPRqY0bN5dSNqL9JMnrNO
         qoBM2U+ANpeRzun6jOTchvAYv3BnLZFTuNaon5wi9QyW6DwwIw3bHWpI0VI52dPnuNDs
         FChfZ+xsiV2MyMqKlFE5BElV+ZmhOurwFxt7y0vLgL78J9Y/07Vz6tA1cp/97/833ssg
         K/pA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2160DUL7Ld/fp9/uwU1if292rSwAEVNNmdXd0Judo1EK9fnCrRyVUAaMOyPFKi1eOIs9xI3TmDrxFAYgPnTSE@lists.infradead.org
X-Gm-Message-State: AOJu0YzFAbjqWI8+N2ZgI2EWugo2Q9PtbAaYSFy+Ie40jLoCzV5Stm8j
	ZU59OuGKVjBYJfzG7viX3Qj7/6kxHANl6SdiiIWbQEf/pitA58l1RBKvLdpI3daQKgbBZEVeEhi
	hfrcNRtAnFbrIJzHW+YpVZRuA92TsfjU=
X-Gm-Gg: AfdE7ck40rXBT5evz02fVmX6Hrj9Kv2AI5BeRNz7xiHvvne3d4SkIN3rfNFTt9UsHJb
	SOcDSP5V5NlYlak3XSQRprwFzaAKFIt9ZP6z+aZCUl0t8MUneT6D7dc8VZ7toLORmMBuCXkh+fE
	xyjwkhxh0nqxEObvj4vAZf+HJyFkA1HqRcGiHU51ePNCidZLK3WxSuM4mug4yyjDQ7XAsyQzxfn
	WrjEM0FVRaZiTTnLhA4QzLnTyV1QIzBfAMJBdhmcXCf1J82h2X3S/2EBrH32kPdfJyYTcI=
X-Received: by 2002:a17:906:40da:b0:c0f:cbe8:7832 with SMTP id
 a640c23a62f3a-c12ae52e590mr293445666b.48.1783026780872; Thu, 02 Jul 2026
 14:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260608182016.99715-1-dbgh9129@gmail.com>
In-Reply-To: <20260608182016.99715-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 2 Jul 2026 17:12:48 -0400
X-Gm-Features: AVVi8CdWBhUKLL1V3IwH3xDMJvBJkCBQP9ZJ4Z1vF2AVUkj23GSMdfGV2CB_bTs
Message-ID: <CACrCO_XQn9WLVVx5NhvzAw=FuW-4R0Du58MGwOQ5q6dgGbtKYg@mail.gmail.com>
Subject: Re: [PATCH v1] clocksource/drivers/timer-atmel-pit: Fix init failure cleanup
To: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Boris Brezillon <bbrezillon@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_141303_180309_671E0BDD 
X-CRM114-Status: GOOD (  23.09  )
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

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks

On Mon, 8 Jun 2026 at 14:20, Yuho Choi <dbgh9129@gmail.com> wrote:
>
> After clk_prepare_enable(data->mck) succeeds, at91sam926x_pit_dt_init()
> can still fail while parsing the IRQ, registering the clocksource, or
> requesting the IRQ. These paths only free the driver data, leaving the
> master clock enabled.
>
> Unwind each initialized state on failure. Stop the PIT after it has been
> started, dispose the IRQ mapping after it has been created, disable and
> put the master clock, and unmap the registers before freeing the driver
> data.
>
> Fixes: 699e36e5b8e9 ("clocksource/drivers/timer-atmel-pit: Enable mck clock")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/clocksource/timer-atmel-pit.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clocksource/timer-atmel-pit.c b/drivers/clocksource/timer-atmel-pit.c
> index 888b06731e54..edd427ab93e6 100644
> --- a/drivers/clocksource/timer-atmel-pit.c
> +++ b/drivers/clocksource/timer-atmel-pit.c
> @@ -12,7 +12,9 @@
>  #include <linux/clk.h>
>  #include <linux/clockchips.h>
>  #include <linux/interrupt.h>
> +#include <linux/io.h>
>  #include <linux/irq.h>
> +#include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -185,13 +187,13 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
>         if (IS_ERR(data->mck)) {
>                 pr_err("Unable to get mck clk\n");
>                 ret = PTR_ERR(data->mck);
> -               goto exit;
> +               goto exit_iounmap;
>         }
>
>         ret = clk_prepare_enable(data->mck);
>         if (ret) {
>                 pr_err("Unable to enable mck\n");
> -               goto exit;
> +               goto exit_clk_put;
>         }
>
>         /* Get the interrupts property */
> @@ -199,7 +201,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
>         if (!data->irq) {
>                 pr_err("Unable to get IRQ from DT\n");
>                 ret = -EINVAL;
> -               goto exit;
> +               goto exit_clk_disable;
>         }
>
>         /*
> @@ -227,7 +229,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
>         ret = clocksource_register_hz(&data->clksrc, pit_rate);
>         if (ret) {
>                 pr_err("Failed to register clocksource\n");
> -               goto exit;
> +               goto exit_pit_disable;
>         }
>
>         /* Set up irq handler */
> @@ -237,7 +239,7 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
>         if (ret) {
>                 pr_err("Unable to setup IRQ\n");
>                 clocksource_unregister(&data->clksrc);
> -               goto exit;
> +               goto exit_pit_disable;
>         }
>
>         /* Set up and register clockevents */
> @@ -256,6 +258,15 @@ static int __init at91sam926x_pit_dt_init(struct device_node *node)
>
>         return 0;
>
> +exit_pit_disable:
> +       pit_write(data->base, AT91_PIT_MR, 0);
> +       irq_dispose_mapping(data->irq);
> +exit_clk_disable:
> +       clk_disable_unprepare(data->mck);
> +exit_clk_put:
> +       clk_put(data->mck);
> +exit_iounmap:
> +       iounmap(data->base);
>  exit:
>         kfree(data);
>         return ret;
> --
> 2.43.0
>

