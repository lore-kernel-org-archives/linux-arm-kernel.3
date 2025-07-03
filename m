Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC6C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTC597t48bncltdn47anMKlxgf1mIXgbQUWYTJlSUZI=; b=bsGBsNCUmj16rnrR+L2GwXK3rj
	vGCMCLLtKQESjMLTvQ28eap2AXI3zFdPhsHTBR8IiUGwGhDgA77dpvM4Y4z13vZVj+FHPBSqJ7AEM
	5+AXZAGxGN1u9mdzsbOEbEcQgVfKOlrgycqcC27Fl+mDH+HGve+Sisa0XAG39QriAJnnCEsbmh0ic
	bQYrtTD9w1cDCYOjjfrAGjd3nXrNA04Lt8XJ0U3/LzfnzvQmAMRNDhFfC/I01Zoud1tc3IJXQwDQ2
	eYsXFxdZnh1mepd495whNnlCDzUK3rL5DfOBRupDseti19luqepab1QMKK12v8q/7mWZy1q6Mc3Sh
	GrqEbOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKPa-0000000BYsY-2sNJ;
	Thu, 03 Jul 2025 13:55:38 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIuv-0000000BImL-1ioQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:19:54 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e8187601f85so7167699276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751545192; x=1752149992; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qTC597t48bncltdn47anMKlxgf1mIXgbQUWYTJlSUZI=;
        b=IVtBU7OF4KjE/js2+y59IRg8ZfRsltgK6zdDNtK/QAulm0/VyrBhCuf1xfMgOgLpYD
         L3mhzad1RvI5FjDo4gdVQT+lGOK01y60+y9AziHK91WGId7fQ48SX/2FhcsK4ATWIbfO
         tS9hYCc0ElWGUL/DKHFMf7kax+hbUtJig1+krNIlF0reDsesv5+jQCdMkXVpcZbKF0Xb
         ELt+hPvY0pvZ0L0gK5kAv3/VemRva/wMxNw928B/1JE098mnL7L0KGcLv4XeBmdrubrA
         2cCUdnuKwZjxNz8PDijlNAOrzgZ9ZBZSzNw0KTOGVsGlGCXVkVYxvlClxZ9RoSRa7x60
         mOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545192; x=1752149992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTC597t48bncltdn47anMKlxgf1mIXgbQUWYTJlSUZI=;
        b=R+dsAVyvPglHS15ZAJLLSH85QVAK0sX9PPbWrFG36jCiZyoE1+1YluN02gYwGOzvk5
         y1fl2i1yBSx2z9RlYQ4wC6TqpspSsyWoTPl4fRY1d97EGSsl+gmGHMRspuWa83cPRDrL
         4CAo2jaGHX1Ltz5S7A+BqQiVi4BCuuID7AESRKohtoKRG1pt6PSU56meblOaLUoAf8Mx
         Xw+wqv4iKF2FQwwMl67CB6eLTFQaOUuO/YmZxwD9aY0R61c3O2qxNFPBD7rmqnyddNlj
         UBkbsEhUV+vWhnsj8Uc+AjCxnCARj9Ck5c96TlX6p0mV3CCjH053o0NmsgmfnyE2Gowf
         xyeA==
X-Forwarded-Encrypted: i=1; AJvYcCWFehP4JP67shaSyRUPOEwxg8FoIq6gelb/vn81r24Wwo6iVIvw5xLDyWNCl9z3b7lAFhal4U50BmYTCZ38h38j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0d/LP/Bqr1V55Zqr4+KReI5i1AuJmuWx2Hhg0AKLFhU/kaKpj
	IRAPyCpEAyHzphE4x38z+AmtDofk4eWmdqKH23SKYpCXvOp92v1wlsg/mCMiIj6kKPwKEAHhc0B
	eQYi5YT3ryK4lYQFFxpuvCbjPgXM6TNDfHjHW7qfZng==
X-Gm-Gg: ASbGncu3i2o01f9b+1+TczuDEG9KpbzSRlNrcWAxg9EOab25KJxcR7TVjvNngYns979
	NAGz1lZtixpJEwUxtoCfly49R5/Z7s7qbYqn8+NoKkMyuh4RF5l5pVKCzqqqeWScQqCT536AglL
	6E+Soz+3RxaGqX4TaFPHAUsajjLnatkN2xehgK3QXz4d2y
X-Google-Smtp-Source: AGHT+IEwi+jGBSSdoJm9iL9oKLTvyrTQHOBeWUAEM9l7fKOqqBksvPOst1zV7M7DzNv8oipsKvDD/lmQ+H+HLHXKg+Q=
X-Received: by 2002:a05:690c:61ca:b0:710:edf9:d940 with SMTP id
 00721157ae682-7164d5755b7mr87945397b3.36.1751545191877; Thu, 03 Jul 2025
 05:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250620043517.172705-1-lidong@vivo.com>
In-Reply-To: <20250620043517.172705-1-lidong@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 14:19:15 +0200
X-Gm-Features: Ac12FXzM1OH6jEp4Aj99iKPDBaVLgh5QaSjxOO1gOJ_img1HJBSw-vdI_UPPTnc
Message-ID: <CAPDyKFp+w5UvpGKPtehqUrZHsAJ+tivLKtBcn8vJgOm1ZxWJrQ@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: Convert ternary operator to str_true_false() helper
To: Li Dong <lidong@vivo.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, opensource.kernel@vivo.com, 
	rongqianfeng@vivo.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_051953_461900_96F501F9 
X-CRM114-Status: GOOD (  14.74  )
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

On Fri, 20 Jun 2025 at 06:35, Li Dong <lidong@vivo.com> wrote:
>
> Replace direct ternary condition check with existing helper function
> str_true_false() to improve code readability and maintain consistency.
>
> Signed-off-by: Li Dong <lidong@vivo.com>

Applied for next, thanks!

Note that I am applying this since $subject patch takes care of *all*
possible conversions (it just happens to one in this case) to
str_true_false() for the mmc subsystem.

Kind regards
Uffe


> ---
>  drivers/mmc/host/atmel-mci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 0e0666c0bb6e..1f11626c8f47 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -38,6 +38,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/io.h>
>  #include <linux/unaligned.h>
> +#include <linux/string_choices.h>
>
>  #define ATMCI_MAX_NR_SLOTS     2
>
> @@ -2264,7 +2265,7 @@ static int atmci_init_slot(struct atmel_mci *host,
>                 "slot[%u]: bus_width=%u, detect_pin=%d, "
>                 "detect_is_active_high=%s, wp_pin=%d\n",
>                 id, slot_data->bus_width, desc_to_gpio(slot_data->detect_pin),
> -               !gpiod_is_active_low(slot_data->detect_pin) ? "true" : "false",
> +               str_true_false(!gpiod_is_active_low(slot_data->detect_pin)),
>                 desc_to_gpio(slot_data->wp_pin));
>
>         mmc->ops = &atmci_ops;
> --
> 2.34.1
>

