Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74EECFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fSThLT+HCKSoOJiWs40mRyAwBBxDVJCSCuzNEhZbSE=; b=EV55ceuovfX4rmXHO4xCMbVdQq
	m6tjlN/4fmlhM49RnmgHsGlGJ43WJRnEVWC2NUMPpvS04cVgqNqlR6MKAs99P4ue7SUBuSR/Tg3dt
	I2Kt0fCO0DD5lUFM5BTchuEiiLALluNJ+PThKJeAmSNOo98kRP9BUEBcwRnwKIvKQp626VZ8Rmh2F
	tEu5hHI1Wwuio08sl8TOrNbHHs3XqtoDylPNCeTBSkHaoYUCZxGjGn46MvHMTekNVtPaDt2XGQW08
	2NjxNGAhnkQZGkNyTjut5raYDJNFnwc8qswpt28Z20+KibgTDJPXDa2GcWm0cRdTVPWZIerQF3H/r
	542hI4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGmn-0000000AgkY-1oCZ;
	Sun, 23 Nov 2025 20:34:17 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNGmk-0000000Agjy-1bjn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 20:34:15 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so2477274a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 12:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763930053; x=1764534853; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+fSThLT+HCKSoOJiWs40mRyAwBBxDVJCSCuzNEhZbSE=;
        b=Oji47LONOoLLu7YwYAOBuZSKmMm9XLRUzg3wHAMWGONh3cohdIFYypK0azH6Si82Az
         3jIruYUyMdGjeKP9pVJdSona8I2plhA8ZEyfh+P34DErOnsXIdTGIS5KtI/lbwIKYSNk
         2DV4YCEkYn9+B2SbF4iuxC+Zas7B1UUe33rUeJWI6sL/spxWX4s2r5xyJoPsooHsHOfk
         fRzWV8KfXjiJxamXRSizhji8HCRsBEJw7joMgLQ2BI69udseqvI/1CMegltQR4yamDuU
         o1AhgYy1bttfAhcSVDy0WFV88eoG0bJ5D/9tv8OiGSRlimUCDWZsb5Sq++1Ch3c3++o7
         8qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763930053; x=1764534853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fSThLT+HCKSoOJiWs40mRyAwBBxDVJCSCuzNEhZbSE=;
        b=kZ37hpNoehXx/S/1gnMNsTf6T6tOfIVwets7CAJgkdhobG+omIB4Dn6tYfmwnlGoVX
         L+fljGbQop3QirEovodbIBse7dgtxBKrwhGLG5/YtQRiucx4iYyu1bDXevrD1UqxLJRY
         kXWz6jrj+mvRP1XB5A/tms44t6iM+KuoDpNe7uRGzr/J7AB5cg+7gm6j2loyDRb9U5OT
         HAtLaYKgpdBGVgdPa9CnRAvC022sxCZ0kDIEzVlHMgSBeTW9cuFUC+mCSmcXhwVdMcBy
         YE/JAUBQQG/L9LG/TgfrY3yLOFQwxxW8L+xI2mjykIgyM8Ah/PhopSZmjb/TEq+Nhuwt
         Bw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqGvTYRdDqw2cHjOzODerLlYGURywGWLyjScYXyIrnDrUs5WnUYZGV/bm8u9a1aad7pz+DPcm6U4vwpEEjHja5@lists.infradead.org
X-Gm-Message-State: AOJu0YwYdw+onXjMZzYzqLnAqm4DKiAnVD4jB7+Eaaa0Ii8r9QV0kPeh
	oBWUQgWFSes/utNyClKwk49V9bwJ80+xuwEg2tsTt6wpX9Bx/xj0B9AA+otzAg==
X-Gm-Gg: ASbGncssjFEdH3py88UHaVYZ0quwwks+9+6BeaZm/uJH/pR6Z3lEkhhNKRbYHzY+Gio
	pUecaNbqTIHVnbcHaT/HmEiUHMngw7mZnWKrhMH/ks/oCKaxUnGVlhtt0GWhcF5fJm4/hD8nSrA
	pDMUHn/YFtvMJSyQFNbTQvSdZIek7oqVBtbxAQEGNzHukIbuEUnwMrK3ICELsdC0O36RTfLZx8b
	yYcjirnP7qlsZzqz7INfoNxI/bqoQtngTa8bhzG6CcSJROO+2/V3/hS6lfh6HwHIyPARpjGEnbn
	58e61r48N0LvIYxsLhsExD6XO3FoCVR7Dz2wf135Cug9Ia5u9ePLlzZhieHxmbQ3pOtRijo2Dyd
	rpAPW9B/+XhhYlCg/PfwVBOSLRiR8Ki2fnvX/yA08Bv/ue2wrNVfZvL418w7un2dSTC+rCz3Oct
	BCKv3b1rcFf/H9ZUS4P5V/a6BQ3MeeFo0nLJBqMdry6WJ/WrVKJ7egfJYUi8A=
X-Google-Smtp-Source: AGHT+IENFg36XExTmHzXNRjVdPqu1iJ06vazccIkuJC7qGzrG4lLe7OGnlxSbQIq5oVJJazmLmViQg==
X-Received: by 2002:a05:7300:b593:b0:2a4:617a:419f with SMTP id 5a478bee46e88-2a7194a9af6mr6582890eec.2.1763930053224;
        Sun, 23 Nov 2025 12:34:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc5e3750sm40707867eec.6.2025.11.23.12.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 12:34:12 -0800 (PST)
Message-ID: <ca42bf49-47a7-40c5-9b39-1651feaa29b9@roeck-us.net>
Date: Sun, 23 Nov 2025 12:34:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx7ulp_wdt: handle the nowayout option
To: Oleksandr Suvorov <cryosay@gmail.com>, linux-kernel@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20251123202437.2340955-1-cryosay@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251123202437.2340955-1-cryosay@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_123414_437980_F9797005 
X-CRM114-Status: GOOD (  14.13  )
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

On 11/23/25 12:24, Oleksandr Suvorov wrote:
> The module parameter `nowayout` indicates whether the watchdog should ever
> be allowed to stop, but the driver currently ignores this option.
> 
> Pass the `nowayout` parameter to the watchdog core by setting the
> WDOG_NO_WAY_OUT flag accordingly.
> 
> Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> 
>   drivers/watchdog/imx7ulp_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 0f13a30533574..03479110453ce 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -346,6 +346,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>   	watchdog_stop_on_reboot(wdog);
>   	watchdog_stop_on_unregister(wdog);
>   	watchdog_set_drvdata(wdog, imx7ulp_wdt);
> +	watchdog_set_nowayout(wdog, nowayout);
>   
>   	imx7ulp_wdt->hw = of_device_get_match_data(dev);
>   	ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);


