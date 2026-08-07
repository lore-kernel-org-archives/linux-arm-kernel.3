Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A05C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAxJcsTBx78VxwObBjDafBX3xIovoIX98Z3YZn8IFUo=; b=0MHLGQ0iRKC2QAYiYoYthQ/oLA
	Z177FUJHnSfMGGLes99CHy29+RtIFYci3Z63SJUYJt/YN/hA+PbZp+9pJ4yUjF+vdRWJv/VNysB1a
	nRqgyuvTT/+I+CpUriesHf9rdXVVQKDUbyo9zxEnvAvl/spa4IpvR5lvrf/cm+opeBxBsuExXIMYW
	AWGSAi4G2e/+kS6xLoHusIBWof2/zZ8Lq63LAEEdgQHhF0aqKPwqU1uJQ7/Y1kFe1W/RKecwvvxtD
	3oxio5AZzdd2QJaK3WRCcJh9WkwobxiWQm1JFFqOKdhCvxiN4XaxCqyjUVssyWF1a31M3Z90Wvgqp
	U2/7vDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsH8U-00000007XuM-0S3j;
	Fri, 07 Aug 2026 09:45:06 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsH8Q-00000007Xtt-3F1Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:45:04 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9770e900464so1447685241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095901; x=1786700701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UAxJcsTBx78VxwObBjDafBX3xIovoIX98Z3YZn8IFUo=;
        b=gH3AnFb7TW7v5xchMEYeB6iF67eXL2TUTq2sW3LjpIge2qLwgBqUns53k/EKN7shV6
         u1Ok7Sm9MZA6FOiuUqKs4FLWwlnQFicGTkw89XOkFaQ+C7T/+j2FJfdGk3m6cgyJXb1S
         +foop3jAr2p4rybxsX49/8TEps+zLWsAnp06v/28JhKdvB44HaHs3rc10RWRISseyGu7
         8hVbkMMMIWfDkeTnwuYF0ppfGSePt6rxbiuK3R196Oi7wc2qxIuxWVZ3qbUokqIJ/2DJ
         v/TVkYi+iayPi2jsWY5/c4vvBpMMZLT5W0oCv0pctjzbGaokD4PNpdocYhYJm6WV2brP
         uPJg==
X-Forwarded-Encrypted: i=1; AHgh+RofsJCbEe470Kb576ByWmpUttptKiPVUoHOhILNjoHQu+mKTEmeF2w6vi1iRt2LXW2j0JrsRRogGdKR/O83q0dP@lists.infradead.org
X-Gm-Message-State: AOJu0YxFdFWs8A8/t+1IGMmhLCkxKsLvhJbSJg3djNkMWt15mSzgpYVM
	xEU4ndsmYjvGFEvBCeBkYHeM9I4pEvJYQIUqas7c84AsINDjsBsDqJUksoHB8MSI
X-Gm-Gg: AR+sD13wZ5pmpq77952CbWIbbmob1GUH+zWtlaCS8/OSblVsbrBJwkkh1yYDBxoN8sK
	lB2wPlslbzOw6mcxQgcu650HRwZY3kX03zT0TsnKIXHzPrQ14DPdRfIyMAwf7D1v900DRac6hGw
	l3fHSodzEyQo41d+VGlwEtFoIuZP4cWa7IqetKGycQJw+j9CH+5juz94us4GH6t14Hto5guPTgE
	41KWiZZnW3KAltHZ1FJmANCCa4YkX2VCxzZaBQh6akGzjwuUWm9J6bCpZdl8PmSMPa5L83oF22O
	OV3+asR5bKGknjlAcEugcRS6kLaWkR7uhoUDvu8db+qMAzCmpDhLGfUhMThyNnbOk0oKcPbDskc
	w9lZCg/JuqHXgPhE4As6ZMh/vUi98fgF/PkO5w+fMpQ+go+iNcUXWS5VR8T46Yan9k29sufBjKG
	ZW3BxmmZCqmHwSMomTKLW7yVjSonT5fyVWTtL82NM/WjvqQ3lSw+8xn+j1N+7uitpooTmURhtcC
	jd2XLuuTc5oguL5oBn5inri8g==
X-Received: by 2002:a05:6102:41a9:b0:74d:ceb4:5efd with SMTP id ada2fe7eead31-762af96fce7mr1403531137.8.1786095901008;
        Fri, 07 Aug 2026 02:45:01 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-764013edfc2sm643325137.11.2026.08.07.02.45.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 02:45:00 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7377dde7bc6so1151979137.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq3zj+fQDkLxj86SWDeN5D6wVB8qfVriURAxduUgCzrbUBFt2Ud6xMSFzPKwd/mKonwWJsRD0PgrXTCDBO6FEla@lists.infradead.org
X-Received: by 2002:a05:6102:568b:b0:634:2450:7998 with SMTP id
 ada2fe7eead31-762aea86b92mr1369250137.4.1786095899940; Fri, 07 Aug 2026
 02:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260807093058.42840-1-phucduc.bui@gmail.com>
In-Reply-To: <20260807093058.42840-1-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 11:44:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
X-Gm-Features: AUfX_mxQEzl3jQmvMQf06PTnHIHBcMyX38xj7RfXUAwYPkdJFJKwvIXHn2A4lc8
Message-ID: <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	niklas.soderlund@ragnatech.se, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_024502_817637_8E90FFCF 
X-CRM114-Status: GOOD (  24.13  )
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

Hi Phuc,

On Fri, 7 Aug 2026 at 11:31, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns -ENXIO when the optional IRQ is not
> specified. Treat -ENXIO as a valid absence of an optional IRQ, while
> propagating other errors.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for your patch!

> --- a/drivers/thermal/renesas/rcar_gen3_thermal.c
> +++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
> @@ -491,7 +491,7 @@ static int rcar_gen3_thermal_request_irqs(struct rcar_gen3_thermal_priv *priv,
>
>         for (i = 0; i < 2; i++) {
>                 irq = platform_get_irq_optional(pdev, i);
> -               if (irq < 0)
> +               if (irq < 0 && irq != -ENXIO)
>                         return irq;
>

So the code may continue using -ENXIO as an interrupt number (and fail)?

Why is this change needed at all?
The caller of rcar_gen3_thermal_request_irqs() knows how to handle
failures, as IRQs are optional.

>                 irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:ch%d",

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

