Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4A2CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhbMU6v+jjbb6Z6LM8sDFyUeJpRkw18OGXHOosKZUjc=; b=K+4mUQbOPYRkKakDe8mH9di2+C
	0PDDgGLy6fuDT9ebp1lhKnsHgX+MpHmmkP1a7NLWScknxrhQo1/0t51vUfEOUfe/W96vSh9LSYB/K
	fjyT/pCbEWtIUILW80DXJGOM3zuRIIGz1zak/GsPqnjl3HmLjPLRrD6PocghmDj6QuxTzwnVMLZej
	7si8dGfHn8+3rB8dxnN6FjjV/YdYUiJxuKr2dcQMRu86WhoOLCrcphSJ49+JOg9cLPYEuOljc/hEF
	UVCIglFZDAjOd/OyIB9QYRCSHwGP4IxXSmQMdHiTeLBpu6GdI7HwDLZZXJ1HD34RWYiby6+2nde91
	ry2bgPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDst-00000000keh-1k2L;
	Thu, 21 Aug 2025 22:35:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Ir-0000000HPRq-2eaV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:34:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e39ec6f30so1112347b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790452; x=1756395252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhbMU6v+jjbb6Z6LM8sDFyUeJpRkw18OGXHOosKZUjc=;
        b=KNuuWwI7ZdLvrUY368aGIML97spSR8V3uHOlOgNrNLGZ1nMArjbjO6Xs8X/ZaxaFuS
         dYNmHzPb6RDhaVJ9KoLZE4BAKpY+uaYCY51U1I7/rLf43XYZT95bG4lFM2FK2lm1ods9
         ZjcJ1yPMQDaC5enE146hjy4+Qq2Mtn07B4oE7CdF/i3t8VaIg+4NgPCweoVLMUCulWJQ
         1lxGx2gJocfMaV0aRaW96OJacpv0IZn8iovxeyr77wOJ7rGcQOp9PIikqRfHJinMz+jQ
         SfPwfXFUwJHSs1KZGrsBFftdu7idX42LbOGA0Ir6gdTkMSukSfiZA6iYNH5I2IF4K8wP
         /nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790452; x=1756395252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhbMU6v+jjbb6Z6LM8sDFyUeJpRkw18OGXHOosKZUjc=;
        b=jhdITtrH6F7+EGl9TraKaKaNGdgQD2EeeUZ+RCg9mfjwkwq/JZgEEh4zpsBI5c0EFI
         oBZ+g7cbnCJjjP9aaKzM+lxSd2ofVV0rqrKsx7loeRiCoL85A+X7mJrEBJwN7bOCPue6
         g9N06dWz0qFxUisR0RtgbrrSA3lXSno9niOVldUwZP2n+cpn/tPx6JuoL/gnwuuSmr8C
         b96dQAHuEHzj7P1NxICXhz89HlyfkoKgINrwEjUKjg/hJg4bQ7cEMUURwC2zjGvDQl2l
         w/xJyXtwUKjhY3XuJE0AEQbM7CHCOa7216VGc0BE90FxY3pmkO8M9DMJaErPLXkiywTf
         vSdg==
X-Forwarded-Encrypted: i=1; AJvYcCXrpjLVZxzESdHNwpRmweWXJmgTYgZmIOLUIRuTla8TKiwbLEsvaFWnhV0yByVsk1c/8PYtjnAh8zX3zrqM0KdI@lists.infradead.org
X-Gm-Message-State: AOJu0YyHMwXrcg47AOl2OO99WUCyy6olao0ZBr7fHUvYcxEOx5hUT5oU
	dNnB1avC22NKYm3HWuTQZDKB2AlBDfAgkn84F7Vrc8oCBQ2f9VyckSzn
X-Gm-Gg: ASbGnctpUNcI1ANnEFPcMA0Feg9502FMXsCNooJ/D3Ns3rQ7WSK+iIPOHXXpLqYRsUp
	Wk7G9j5BucHFU/cw2vmyMvzBaQNOfXlXclRClsjqUFDVzDjBuyenzxY35pe5UL1cKWxu8mbKFYo
	J0LHBH4iwP3gMRnvLtVERY7refLviwW8P/f0VP0pjXFHWMIvfriRmJTEfUCxDdLgB55WlC9XR9D
	EpRyqFuuP3RRY+FPfGgyaGsU8s6ObdXhKw57G+Hsu7HRah3L7u1Nqt2xH2XqQVQQ01tX/m6Uf75
	pK2xWNhoEpNL2uSurcVz88OE48XbPLiYwSoMFki4LriuEcUWU3SHtjv1dPQerELOK7z42/9f45d
	7fAisoIwcPBVQgFTEWeodSCj4tm2dyj4bTAfSruaWRCC6uvM2D+AN+uq1
X-Google-Smtp-Source: AGHT+IEfixcJibn3sKeBVf1yb6GiXC8iqzvWoYUmwD9JZea+OYTONZjvXbmz56Cn68D44vOXlPbaiQ==
X-Received: by 2002:a05:6a00:4c92:b0:76f:9e0a:f790 with SMTP id d2e1a72fcca58-76f9e0af8d5mr2510888b3a.19.1755790452337;
        Thu, 21 Aug 2025 08:34:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d11c8bcsm8603434b3a.33.2025.08.21.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:34:11 -0700 (PDT)
Date: Thu, 21 Aug 2025 08:34:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] watchdog: s3c2410_wdt: Replace hardcoded values
 with macro definitions
Message-ID: <c9306682-6f99-488e-bfc9-4552a06cdce9@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p2a14d0a2ebe8c421dc63ddc8371f8bc50@epcas2p2.samsung.com>
 <20250818021826.623830-2-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-2-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_083413_668315_287FAC4B 
X-CRM114-Status: GOOD (  18.18  )
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

On Mon, Aug 18, 2025 at 11:18:22AM +0900, Sangwook Shin wrote:
> Modify the code to utilize macro-defined values instead of hardcoded
> values. The value 0x100 in the s3c2410wdt_set_heartbeat function represents
> S3C2410_WTCON_PRESCALE_MAX + 1, but it is hardcoded, making its meaning
> difficult to understand and reducing code readability.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 40901bdac426..95f7207e390a 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -587,7 +587,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
>  	if (count >= 0x10000) {
>  		divisor = DIV_ROUND_UP(count, 0xffff);
>  
> -		if (divisor > 0x100) {
> +		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>  			dev_err(wdt->dev, "timeout %d too big\n", timeout);
>  			return -EINVAL;
>  		}
> -- 
> 2.25.1
> 
> 

