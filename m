Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1065CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iH3rO19odGUqCMhpZ/xU1p2BIeedWHGic3C9w+3oAVE=; b=SNXr2tb67Ut2AbUZiiXBis8kEL
	yXXGl2giFCGwr3dg3Hq3ins0raWU7t8FRrpCEQaH8VKlZhQOxCCPSqFoQsps9P3ZcleY+gyKiW/yd
	Yu7sQafVnx1Hzq5tovD160t0WUGXL+aVw9FXSm9CPkJVko+XmuN1wibndGE3E0FYXINdtC1tjEhfB
	Lo2ILFKnV/YdrHV9NieYIVjjj3IT+0DtpoBnQjf0e9TN4JJl+USmlr8sY9ugSU6ZKB2SSWZJ7Vu1c
	C20dyeaGp+Qoy8UQ2GnVOPhZyFBSdPb4DvOMlwv5I6qVQtYK+CV5F3aZSHeyX2Sq3z6EVpJhXJuZP
	MsOr4sWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRFF-0000000Dqnw-2Pnk;
	Mon, 11 May 2026 14:04:29 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRFB-0000000Dqmc-2PwC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:04:27 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1329507c387so7380312c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508264; x=1779113064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iH3rO19odGUqCMhpZ/xU1p2BIeedWHGic3C9w+3oAVE=;
        b=Xz9vcW33Y21JUeWy/uD8ZQO92iwLqrv2GQj6EQ6aLqAEh+JMdoUz4fv4R78hMqG/Wa
         paj2CEFe52I65wOqJGRS0GhRqze5gsK8ZM06n111yMEI3u3wfize8CJffLRjnmGEdfSr
         WIPq/2p4nqEUyE5WznBuOtW+tB+yM3dUTQgzm4k5wbHbZYc/BahnggVJ1n93U+cFUFjM
         8IqxbTj4WNC8ciOeLg1Oo6f0jC7Jm+VGu/6G2xvK1s/tgxxt9TPSg6kOGGjW0d9nBYBJ
         nc1HcjWHBD3Ktqdwy8XVnoNEZXG3bPm4RpuRE2gRyMzZxIoldsa2cnSOudf0nrgAjRo1
         phbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508264; x=1779113064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iH3rO19odGUqCMhpZ/xU1p2BIeedWHGic3C9w+3oAVE=;
        b=qXis3N1GC+i6Uycw8joPBD9EukOTEc6mWaOoiO85FnZwkl3T3n8M7N6LQ5H2nD7NrA
         qJjrlIX34dNvYaAYboZtea/2b7acRcCcJiKGyHuIXEb6LUjw932sI3buCbKef2ptfWyM
         OhET0fnUsr0LqLiqOMD2YmiVf4vHIiBqbvnLP5THm7GvNwCXoTbFZrzoqB3aIHgkglB4
         Z6Po07yN6693h8Bxjv/OKETUE2y72RMAxBXdML2SMHK0nELtfbgg9lQnKbFv4hr/q0S+
         yMHTJjMRiZHGY+f8rug+2E6D+fcvE8GWDkF1/xfhooEz4A3yc5wGfdUsbRy8N9fDQWtS
         kHdw==
X-Forwarded-Encrypted: i=1; AFNElJ8kClW4kJnYfmKWzqTBMxQbfJBr6Hka0UkVQOiVp/kENiplz7evK06ZvG6t97xQ7EZCiKXbizXq3uXSvmA7QIYm@lists.infradead.org
X-Gm-Message-State: AOJu0YzjKsElWt/S4iki2ljnev5kdJox1PElLZHfj3nzyst+IrMUHNyn
	U09jADEgD9597AXBZ1KQBmRL3uG5cDHlzZ9NCLN2xfeiZtQOEtWG/qZc
X-Gm-Gg: Acq92OGNI6ZefNuweeNrw3Z4TDF+XIdtrFPcGsL3GH8SfV08vWirTuDy/V0LhDJ+aGj
	8byve8pRZd0aESYTeCvrJ74ZF9czc2u0hCmuhFbAaw+pnCkvbJpvTF848LK/5lphqEnxCdH7+hh
	nOa0+ODDikyTsN28G7iV//diJC6q4LibTB3wKch0OTcatzwD8SCeBtFzeheVdFxyMfT9wWpTldG
	EieSQ+BkEJgwc2QjE8G6BIzdxVxsIfQ7xFz3T7cyAW+t3MOnrwZkwdfYg97Ij/oamhVfrpCNGco
	7u4MDDsTh/h4gRJVQ6DWlUDYwK+zB69bI0fkyzmy4mOUUJL5PRUwhQIJdUdAfbZ6h0tSo2N2GkG
	bek1azztu6U8fo5RoVHxKkj4nr85KysS89ZXRat3JkxLxQmbnCCU9DQ66g+pxsuo7fCLKQdkxL0
	6GRrY+UvjQ2til0edfUfWFMq69ZCaAGckiqB3Y
X-Received: by 2002:a05:7022:ea22:b0:12d:de3f:d844 with SMTP id a92af1059eb24-1319ce5634cmr12752150c88.39.1778508262863;
        Mon, 11 May 2026 07:04:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm18373850c88.11.2026.05.11.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:04:21 -0700 (PDT)
Date: Mon, 11 May 2026 07:04:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
Message-ID: <87766879-ca5e-44cc-a341-87b2afa70910@roeck-us.net>
References: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_070425_618155_761867F6 
X-CRM114-Status: GOOD (  19.60  )
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
> Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my hwmon-next branch.

Thanks,
Guenter

> ---
> This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
> device trees in [2].
> 
> 2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
> 
> Best regards,
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

