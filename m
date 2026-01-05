Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44613CD041E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP3TKn35fuKWSrYkUT4P8AjhyfJ/uEDWn4TeWwqGKdg=; b=oWRhzs6I1vZDqI7hZtlbU0Jgsp
	pz/pFQ+7JaLz2fXfS/f6F75sylKWv/f7Vk7qNQzoUycqp4+IJNdb4tjLoFpw+dgu4W8pbuNg/06Sz
	2rMB8WEGwsLYTg3iBKDwYdoqWqiLc0rJQzzImJODc7K83ZmuUf90Jd15r9YpDK41a4r7WQhsS4LsK
	opktNyNWvFNLbJXDMM8+cjU3Pn8kpYIGtVK0i7NN/ljvrbwi/ekVkPeTNRmp0UiZ9HArL6JAvlEz4
	Ngej5BCLWn/oDmNoq8F8jH1mxj15A/Al7WbHjUd6Dltqxctq3fneCidNuO2ke5LZq0gbGF9uYRjTw
	CecOMpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vct3V-0000000CA0W-40Rd;
	Mon, 05 Jan 2026 22:28:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vct3T-0000000C9zp-1USM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:28:04 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so4087795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767652081; x=1768256881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tP3TKn35fuKWSrYkUT4P8AjhyfJ/uEDWn4TeWwqGKdg=;
        b=LCHdZx2LreBJDezovJ7l25KufRpFohxlgJM1bHVRLYalUdcd72kZ8+b1H0wLIHWJYZ
         Z6ZTLk4f/PGjNIfsSJiwu1P2JGevK8wqHDNB/0ie38BVTiSG8kqbb+O1ggZbN4O9UHUJ
         YLX8BO9nWaG85qq3qMRVeq5RiSoFZslUbtpJhCGvwSdKtSTcTIzDmOFDOuxyB+RKzCyo
         LBbivJu/B4IAZoYWcQeDk90FADczIDeM0USJrXdfqHVFcnhiR3nGhxadmil4Rm1MxN/m
         +r0knf03QLhjo6ShAKbq/r2j/Y1l3XK8DayXUHbBGgbGstKCiYxOWeyxKjiMXt6/f10G
         CshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767652081; x=1768256881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tP3TKn35fuKWSrYkUT4P8AjhyfJ/uEDWn4TeWwqGKdg=;
        b=ubAv6bcwkDPSRWIanMpR1k57rxsKCWo1R3Y2yAcGL7LG8k4BYSEKMOyUFskdxIU7aD
         GRbSebNsywFj2W4RTqLo0wbgMxjAS7Iw7BthZxlmHL8lP4knmK/pyCzmeM7jQL4/auQz
         zoOS1rYi/+9WBKu2PxNc6cKoVRb7rAw+Py8KpOR5PYg69zcdf2VFPZ6EUmZ0DVJsOd68
         bC7ohXcKoHIJ7ZwXw6r87GiowHUfJ8DToci1MhK6QuBTfyn2QyufWbIehrKXFad3CICR
         4Twe/R90rx5aB0OnesKmYqxCJvDAmzSsVckIpr3p8kCcum3dwbb4aOTudPkDpOuILAn0
         LMlw==
X-Forwarded-Encrypted: i=1; AJvYcCVO+G0LBZ0OyTX/eMesRmyFiiTZnSsJnBxlqvB5z+GDQ186T3Y5mIRBxqTk7Gh7qdRjo5hlLwMfFPJHGp8VcVPD@lists.infradead.org
X-Gm-Message-State: AOJu0YzBz5KbJ7AmW4uMwA95xhlu0Hy3fz8yb2DeN0+DBva6xnL3lH+D
	2FSKdExWAlrIt5gssCNu8YaUt+R1XSynYhW2tcmXEM3Aterqw4G494e1
X-Gm-Gg: AY/fxX4DX8Zw7iGhISixZueK1PD77zSdv0H4tc4e+Wvod9TBmXJoVQrEKMOc/cvKaJU
	SVZJiLPw57IaOZFA1qaNP834aT5h1Jyzn9UJknnqD+Fgc34zg52qmpDEzoUJIY6n69RsRRK9qZI
	dySYF4u0PV3OcEiVTK2NpNxSMKipp5mwpiWkMq4D9cis7bK1+Afa8ZPdA9o+/ogXV3sbOTrjj10
	TK28SgkNT+wrUqzgJ7D3AOdoYspe4cNIyh9ikTNpWfi83LhBoNEkU88D0G2u2dp+mJOfOMVv5AV
	bmUWh9Hz66jhAVcgnUMUs/PF1ae246vzetec/5OVVl3mSqCgs6/xbXtUuZmRGx8L2Zv5qXBiKcR
	Rrnsgu6obC/NheS0CqIA3XVyQji3RQvUUgauHkrFiHk60juIp9Z7LEAZkZIGtNgK52TJQQmNiNV
	PgNh79PyncdN0ovSHhQmlgBqNWXrou3WcjoI4Kbl2SqL0B8iFl08my
X-Google-Smtp-Source: AGHT+IHQ2jumI7ob3RSLeH/S99yo8OIt0/2N7w2n2pE1KCHuEJ1chMCDPXq93Nmz5uhJL4PGy4W++A==
X-Received: by 2002:a05:600c:848c:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47d7f075bb8mr12511695e9.16.1767652081057;
        Mon, 05 Jan 2026 14:28:01 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm10123945e9.13.2026.01.05.14.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 14:28:00 -0800 (PST)
Date: Mon, 5 Jan 2026 22:27:55 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] thermal: broadcom: Use clamp to simplify
 bcm2835_thermal_temp2adc
Message-ID: <20260105222755.305787f7@pumpkin>
In-Reply-To: <20260105121308.1761-1-thorsten.blum@linux.dev>
References: <20260105121308.1761-1-thorsten.blum@linux.dev>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_142803_416515_A63A9494 
X-CRM114-Status: GOOD (  19.11  )
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

On Mon,  5 Jan 2026 13:13:03 +0100
Thorsten Blum <thorsten.blum@linux.dev> wrote:

> Use clamp() to simplify bcm2835_thermal_temp2adc() and improve its
> readability. Explicitly cast BIT() to int to prevent a signedness error.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/thermal/broadcom/bcm2835_thermal.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
> index 685a5aee5e0d..c5105dfc6ec9 100644
> --- a/drivers/thermal/broadcom/bcm2835_thermal.c
> +++ b/drivers/thermal/broadcom/bcm2835_thermal.c
> @@ -11,6 +11,7 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -80,12 +81,7 @@ static int bcm2835_thermal_temp2adc(int temp, int offset, int slope)
>  	temp -= offset;
>  	temp /= slope;
>  
> -	if (temp < 0)
> -		temp = 0;
> -	if (temp >= BIT(BCM2835_TS_TSENSSTAT_DATA_BITS))
> -		temp = BIT(BCM2835_TS_TSENSSTAT_DATA_BITS) - 1;
> -
> -	return temp;
> +	return clamp(temp, 0, (int)BIT(BCM2835_TS_TSENSSTAT_DATA_BITS) - 1);

Hmmm....
I wonder if I can get 'statically_true(lo >= 0)' into the type check so that
cast isn't necessary.
	signed_val < 0 ? 0 : signed_val > unsigned_val ? unsigned_val : signed_val
is fine.
Would mean swapping the order of the tests - which shouldn't break anything.
But will need a full audit - various bits of code have relied on the order
of the comparisons.

	David

>  }
>  
>  static int bcm2835_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
> 


