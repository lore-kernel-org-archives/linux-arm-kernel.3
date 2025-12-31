Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07DBEE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMV6DeeoDol5vW6Ifpd5XnY16YMsP6em2WlQ7TohT2g=; b=vZXkPcLDUwwHyq+CVTCwHrdRPC
	vigMiDJFqYH37D6v5nbqcKe5Jcc60PHBtpXN9eeoDcoUO1x3jJvo95BlPNU0bi0YSPhzzjQmAteRL
	DS8leKGHLLxNXJk4gedChGdzzV/vlWpTNuYLLSLee4K20DncaaJrlHuq0y3zrhdjePPGoKVlFAbEV
	/S/JbyuN29H8lLE0ietA55QTFFIozLF655M/vmF+mfR56kaayvQ04zEOrqVdt4QaKzXZ/2BzxS968
	2hiw2ZhRtsnNkRuILY7l7QGsl1lb4QWdy/x5vt8Fr8l0Kj7PVmLROYhadgyWYFO2a2EwRsOaSoRWd
	4mAm8WxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxBW-000000062Ud-098O;
	Wed, 31 Dec 2025 14:28:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaxBT-000000062Tp-3WN7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 14:28:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0d0788adaso97876085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767191298; x=1767796098; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMV6DeeoDol5vW6Ifpd5XnY16YMsP6em2WlQ7TohT2g=;
        b=aGs7/8lHCNzVZBSZiZKgKA1/omytqqAPdT+cABNGFP4XVjokOgJ4bNRQDsSO/5d5w4
         QwOnPDrH3QYtNwgh0Zua/n6hGP4QP5K56rIrY25qQ5umgDUj2lGVMZvJ8POtRZkaij6Z
         mDu41tkxc0JT0glKBVH9vIu09LwoI0TksmOh+CQoVgxSYzEZcK9d+7vzU6FPpX+sLzzL
         QCh5DzYZNf9QIiqoSmUf96eh12nlY19m03HNeCr3Dfv0RUoiUbDAqzbtVcQ8gHENYI/F
         r7sY/6dfa5N2QzCIsrlpxCb6MirUScACvpBTiFPc6mfPRsfVYC41CLeqdyVW55N1hA/h
         xOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191298; x=1767796098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMV6DeeoDol5vW6Ifpd5XnY16YMsP6em2WlQ7TohT2g=;
        b=C6c75skhv6yPna1d4m1S5uMtQOVaT7Y3o7eDm3ssl4VcrVBbzndSkPMcSA+ugcWxXO
         /0S+4VKCUJcAXUbGY40m/onM/fVuKtFI03oVI3RZ0tbkjNOPBlGjNJvjejfCiz00SFrD
         Xlg4vsaz479+raVA2mCLjdk30kLf3jka3hCZsPr5vvv6AQgvlnbjKG/cVjR52W9INnuL
         j2tXKWgfkhAkZenzO8yj5wQuDMTKv4y2tIRZkeXm12Nw+xO6QBPtgdXrHptyD29An7wv
         WizT5jdZVxA3ZY5GFgmNEibcHSuKeGKFHQxyZIxgKpuOfqKuEVkAbpD1yvYZMMYLBwSb
         RSsw==
X-Forwarded-Encrypted: i=1; AJvYcCXTmSCrOv+oBeHIvTbKaGBGoatgcFtc5DbryBga4VLjGMGZoTuc4OipztoD+O+fjgCxm8MG4Au9Q3p/AqGxJg36@lists.infradead.org
X-Gm-Message-State: AOJu0YyXCl/DtcA9AG2SA0kxDuy3/P6F2JV6qvC6Kkh4r2QFBaMO2lch
	UvruJcZ4kf9djgPwf6du2JkDqhwBFQ1k0LdsQuJ6s4mPlIaEUHcKnJJl
X-Gm-Gg: AY/fxX5AMtoGxAQsWB6AfJqcf1RaDxX+eJkKyvdzQ6G77XZHoUPvhEV5sa2dQP1cGE+
	dHkUb+xaO7gP1GzvlLG7GRj5y5bxs5Kp6XiDVG7k7cLQJurEc/qOUCnYUYrKavyYVsKyQ+kcs/5
	JNKKvoxTlR1oWWz8IUdMftczZKGHmrZVrh34zguLgjb6A/2YQmpSnFelGb0wp9W0t5U/0TiLFCA
	bMIeGdXFyqkH1uDlDBJLNa9jrSywfLkqcjJTxToamOMfvCM6KgI/b8yr1mXz66nXvrflXKfoESQ
	HnyN9DL+ULzvYkOm9qbY3ZqBf11Wos3kR8TIDgzAWHjxvvDwW87Wdu+UBzAYcyr1ViVY2HS9bD4
	pLsldIROU1r3/jFrNFm3att5nlInRfZ5G/hmOL8sO5PuZJ53fe2Fi+Is191itljkWq+Vu6kiqEy
	y1fXK6rf+EntmJGb1liJ2p4w2C
X-Google-Smtp-Source: AGHT+IHT1LbcUINYNqMyB9CX8YBrFNHzxw864OFLPJDnx9s6IC7xwrB55T2EWxDGNkf6J10kosGXXw==
X-Received: by 2002:a05:7022:f698:b0:11d:bea3:c93d with SMTP id a92af1059eb24-121722eba22mr29428274c88.29.1767191298434;
        Wed, 31 Dec 2025 06:28:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm135194664c88.15.2025.12.31.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:28:17 -0800 (PST)
Date: Wed, 31 Dec 2025 06:28:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
Message-ID: <68e8bd60-85b1-4b4a-8a82-f47640ad0ad9@roeck-us.net>
References: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_062819_882964_37CD7F79 
X-CRM114-Status: GOOD (  20.64  )
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

On Wed, Dec 31, 2025 at 01:07:21PM +0100, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,wdt" anymore [1]. Use
> "apple,t8103-wdt" as base compatible as it is the SoC the driver and
> bindings were written for.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
I don't understand the rationake from the reference. This patch will need
an Ack from a DT maintainer.

Thanks,
Guenter

> Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
> device trees in [2].
> 
> 2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
>  
>  static const struct of_device_id apple_wdt_of_match[] = {
> +	{ .compatible = "apple,t8103-wdt" },
>  	{ .compatible = "apple,wdt" },
>  	{},
>  };
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 

