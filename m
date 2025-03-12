Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148A1C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0IlTDOpzy4lszv7rlsIj2CbW2c2EXejHnSETwmF388=; b=Z+K6zdLEoxwyjfZXK6Ms/PlKMH
	SATt+EMujcPGl/np4bCxzcnf2TJYuLPcNX2gq31dS6lb7M25PAmTRy40wt0RQ3ShffiwNf1GS5rA5
	tmfIpH4qTdr8kyWZKsPyOOZU5ZhJB2LBL+MiPtfqo4TwWt9orD/IJCQXq4VoObXAoLBm0o7gXidUV
	FfL68e1mqDI50MhgBbZAeVv72psdypWc1/BLpXjLJ1dEvdHfMFHJjGqCa6xpdGq0MFLrRtmCCnked
	8fzvCRYrZ6B1PqItb2fKSRhlSpkfT/wzY0TCAOsbslul7TqMQxH5LFu6cJ1s59iOcYL/oj+i9Z6/n
	gRxcFFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsL0o-00000008NWN-0nhN;
	Wed, 12 Mar 2025 12:16:38 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKD1-00000008FJX-3jKw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:12 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6ef7c9e9592so55524077b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778711; x=1742383511; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j0IlTDOpzy4lszv7rlsIj2CbW2c2EXejHnSETwmF388=;
        b=IczJefOVgXXgK3NwS8zvJ/NeSVf2fmjHA7tE1+eL8M8NwNmbTYnhoC/TAcH6rOUzHP
         nsZkzAtIH9/ixwSTK8dmuNmfOrE8bxN8IxaeReS0CNXfesJA2b1vPzeATJlhNq4p09C7
         /RJcfQ18sF+ndiC1PVLR7R6GrahbqZ3rAaI/J6j/27gy9qmQpBnIZ8o5sdjvRHEDuUXr
         Jtivlui0MTlTxtGvSWingpfzMYzvHCP3ORjUGzvaQj7me4nFZASqfCheIsgMIJZV33eu
         p/W1zWuZRVNoqBOgTxOH0EfpbcOSat835oCRB0ToY5FO25K2jb0PjQbnCpR1wOGqc/L6
         5Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778711; x=1742383511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0IlTDOpzy4lszv7rlsIj2CbW2c2EXejHnSETwmF388=;
        b=rzj0J3HaHgCzZ8CAJY3Ke0gm58ATDD3PK+UZUpVzHHRMmy0B6BTSRXuG1vUuiPF7ne
         kZJRnrjqrQrLIZAT9ZdqOzJGac1NJ7BopYMJ2pIJlBazFo39rUWbbTDfU4x/9CBxJJim
         4HDeyb2iBUYjhRvYX+ZQwiJVqWxPGEcDb/RSikm/eCw2Vnj3d2MTN/133xJScPLv8r68
         te3gpjvzkAILU2XnQ2iDdcQVoAHF++NvXkV44uMHyVY77lL+Vo06UX7yHEcWup74VA9L
         XzVp3e9/0gLD/x02RiLt6aViPCvSzHSdzNetyo3M+SRwnLxJCOAyi3GaW6H1ZsVj7+FO
         SQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKOby8D4Ac4WtZGzQT4wZDFvCsM9llYZXHb1gqyUarX75tkdhh55Suy5XAS+iWI312ZpwXzDXfxLGtWHebhsvx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/dCEmOdcHcgX9eQE8OsZEWHGUNDrqezYlvnG8AmuSoHePMnT/
	rRzHNGixTP3jgcr1hZ495hD5Jt1FNouPZc6F+Fx3Rjm085XXkLF9qqDtoYfOBX9y1rleeckiFVg
	WQ5/wUcm6SOBe64P0EQ+DDQm8+myDIp8RWJluSw==
X-Gm-Gg: ASbGncvRCuev/kl8OrFRjc/d2S14XywS5aumxQs02pEzszDqAO3U7rqY0sQ0E5UsDYZ
	hyDNQUHz9t/sePf9bZ2LL3pVACBIj7drKEteymIJWBCsjNVjHG127ltQH8wQhy5sJOdlhVHFAt3
	KUQCtIXk4ddtrA8U+2WoMUKNg6fKo=
X-Google-Smtp-Source: AGHT+IGtrpMRNM5pKWhW8HbHsUTbWskTVMFFv0bNbb8Q5i77eD95h1GkPE0yUgoUnQWO+Vh/tQK1NcyuMiJXHltawPk=
X-Received: by 2002:a05:690c:3706:b0:6fe:b88e:4d82 with SMTP id
 00721157ae682-6febf3c011emr268595337b3.28.1741778710783; Wed, 12 Mar 2025
 04:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250225022856.3452240-1-gubowen5@huawei.com>
In-Reply-To: <20250225022856.3452240-1-gubowen5@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:34 +0100
X-Gm-Features: AQ5f1JqF8L87qOyyE1uiiOuDOx6g3k6bEVklrzfSeQy_O2wo1fZosXm-g9B9O0o
Message-ID: <CAPDyKFo4K9H82Wbupug3Str=18ekkrwjxQxSmw2-1eu3FZQwfA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: atmel-mci: Add missing clk_disable_unprepare()
To: Gu Bowen <gubowen5@huawei.com>
Cc: aubin.constans@microchip.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	ludovic.desroches@atmel.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	wangweiyang2@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042511_937637_0AF1DDE4 
X-CRM114-Status: GOOD (  20.09  )
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

On Tue, 25 Feb 2025 at 03:18, Gu Bowen <gubowen5@huawei.com> wrote:
>
> The error path when atmci_configure_dma() set dma fails in atmci driver
> does not correctly disable the clock.
> Add the missing clk_disable_unprepare() to the error path for pair with
> clk_prepare_enable().
>
> Fixes: 467e081d23e6 ("mmc: atmel-mci: use probe deferring if dma controller is not ready yet")
> Signed-off-by: Gu Bowen <gubowen5@huawei.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index fc360902729d..24fffc702a94 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -2499,8 +2499,10 @@ static int atmci_probe(struct platform_device *pdev)
>         /* Get MCI capabilities and set operations according to it */
>         atmci_get_cap(host);
>         ret = atmci_configure_dma(host);
> -       if (ret == -EPROBE_DEFER)
> +       if (ret == -EPROBE_DEFER) {
> +               clk_disable_unprepare(host->mck);
>                 goto err_dma_probe_defer;
> +       }
>         if (ret == 0) {
>                 host->prepare_data = &atmci_prepare_data_dma;
>                 host->submit_data = &atmci_submit_data_dma;
> --
> 2.25.1
>

