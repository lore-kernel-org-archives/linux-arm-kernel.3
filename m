Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840A0C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 04:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iLLyWC6nrOMFW7D3x/zOmB5QAqAJCqqQG7pB75N2Jc=; b=KrkKUbvEPdesU5Mc9WZxr4B+al
	zhntq0s072DxSORImFNQ6bjL6mHSzb4kP0u4A2ZvYp9DA31gf2m396eDPDR43w+eHDw+Qb/EzWqmO
	JBbuElzjziNgmhKFMoozDVK47OLScm5ewi9xJouPu4RqkcbiHP8vJ86lPSHsX/iIfrL6RbwlzDFnu
	Uxvwn2ADuW2Rx+LOpoArV5SGIg1JYqNPk0lmo/zmgVMBjeDPNPeLpH5cjsKewk2KMxa+b94Z00l26
	6N2Y66daJTufRGeIiSOVbDXcWAbwlFhAQ+K1WzMInb80r1rEQ3q17OBDHnO3xWV9TNE/tiY6CV7ZJ
	4zOi5Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzo9v-000000056VN-2EKg;
	Fri, 28 Aug 2026 04:25:43 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzo9s-000000056V2-288l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 04:25:42 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e7109321dso536610a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 21:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787891139; x=1788495939; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iLLyWC6nrOMFW7D3x/zOmB5QAqAJCqqQG7pB75N2Jc=;
        b=ROmSTRwRlhQcfUSK5sGKL03EU5cJGx2G+aE4FOcV0e+xdBoHsPqKh9SjYl7g6eLXr/
         zus7Nb44fxGd7lPriWDPOhFGEHxSB5PBTlZNsniOXGYuwmzH8fXDoNXzyIPa8sxXJiQH
         BPvqzlnmJr4GTTk9t049GTqWKNgK1q7vN+cGZPyG6dESMJq6IFFk2hdeYhStcwweqIOa
         PEPedrFSQSz5apfwI0w0N2n6g1Vqzi4xHjdLUc7WPexn9dQm1/A4aTCQlK6phFetxkFE
         54kv784hj7WEgVrQIGIJ+E1nHj6XQ+XYe9DPcXf8NVKAfj+EmwCT/jEqNHD9UHJIPOGf
         yAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787891139; x=1788495939;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2iLLyWC6nrOMFW7D3x/zOmB5QAqAJCqqQG7pB75N2Jc=;
        b=aIMD8X8BVK5fiP6HOjmpiVKcrAngdlgN55JSQeujY9Qwf8/au8vuxejXyKoaiJQ+1Y
         2BLWDQ1V+lJ75H74y05bkKxcouMm3bjZiyb4AlX0zevm5PgdbYZkFC0MaAq7YnwsxEmA
         TO2VNxpCePvwk6KW42jWDElP3UG28oBuud0G5Bq0ow2wGQ21xJwhUte0Nl9gtCcgPcuy
         MoLld+jrPKnl7rsOfoHlrgDqjGAJXy9FiRfKIDiIMdUQf1R1zWrzRs5cRrj6ZmVcCgaq
         XMIWut2XSU8NH2YLbpImu5zkgREZE8tgLlB3qJIOHXznudn2wLzOnR2KqUcppIwo/YFa
         LoIw==
X-Forwarded-Encrypted: i=1; AHgh+RoQ+jSasEA1TpFKjeAi6iBPfuutGZzRtnKeRDPX18qr1GD5mPVz5nNQwD70JVK7ERygSgpR546RYqIYsKuWBqdL@lists.infradead.org
X-Gm-Message-State: AFuF++m2ckdyOsfWIID6feRqOy71J6GJiMqaNGGsid1FUTYu6HH1uUy+
	KsKPflYpy5ABFYKWAKpGoczQDx1MgyIpzDHRidPB5+6BI0MtHuEkMiFF6p1fWg==
X-Gm-Gg: AR+sD12vaoGyOuIziPSe9qUgDQa1h6TvuIMz2fuZxrj2FQpdapJJ6S2M2pLU0fSMckv
	U+FbcLCpfnXmIWw2dKRSHtV1ym1yYa5Dp5Hy6tl0Hd/MQjvPNruZXlSbbGKvN/NUcC9OuswjJ4W
	X8JpZ7casw9FYz9Aa3OYCOyovuVmqZHyGS2LPzgDUSLn2hNamZxmHizXm+ucSCMebz7+kqHyJgC
	vNtR/23ANAwrIHSMwOmaYYAjjTXxg7Oxh69EXct3kdFXkg96y6CzHbauS5XkPSXGK2D9ftFjf/o
	Idr092gEaEsz8FQ1cS6ZE/yImYsiLPcs3tbpdQqnTyr6TTcydKEs6jkdgqTtFt/ocy5R9yPJlLy
	rJXNPkDdatgAQAsS1lymxA1A7YYDZUy79SRDV6fcu2zvboIFCfCyu+d08Esdi69K95jqtT9NvEU
	tiCIsBLQ40zddtHICaZfvxLSmEoz+0ujyHMRbajLkhjLsCQWTFOmhcwQA28/MUifd58kccgkMmn
	HVCY7YklJ3oPRrW78kjzNdapYR+pFxrCnbZ9A==
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr7322515a91.7.1787891139532;
        Thu, 27 Aug 2026 21:25:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm1604156eec.9.2026.08.27.21.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 21:25:38 -0700 (PDT)
Message-ID: <1f04a4bc-f43d-4a97-9703-29cd254ff322@roeck-us.net>
Date: Thu, 27 Aug 2026 21:25:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sunxi_wdt: preserve boot-enabled watchdog
To: James Hilliard <james.hilliard1@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Carlo Caione <carlo.caione@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260827-submit-sunxi-wdt-boot-enabled-v1-v1-1-d16f934cc809@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260827-submit-sunxi-wdt-boot-enabled-v1-v1-1-d16f934cc809@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_212540_582027_06E740E3 
X-CRM114-Status: GOOD (  29.75  )
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

On 8/27/26 16:42, James Hilliard wrote:
> sunxi_wdt_probe() unconditionally stops the watchdog even when firmware
> left it running. This opens an unprotected interval during boot and
> prevents CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED from taking over the active
> watchdog.
> 
> Detect an enabled watchdog and decode its programmed interval. Preserve
> that timeout while setting the Linux reset mode and pinging the watchdog;
> use the configured timeout only when the hardware interval cannot be
> represented. The enable bit remains set throughout. Mark it as
> hardware-running before registration so the watchdog core services it
> until userspace takes control. Keep the existing stop operation when the
> watchdog was disabled.
> 
> Fixes: d00680ed0026 ("watchdog: sunxi: New watchdog driver for Allwinner A10/A13")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   drivers/watchdog/sunxi_wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b6c761acc3de..1f3da1d47fa5 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -128,6 +128,38 @@ static int sunxi_wdt_ping(struct watchdog_device *wdt_dev)
>   	return 0;
>   }
>   
> +static bool sunxi_wdt_is_running(struct watchdog_device *wdt_dev)
> +{
> +	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
> +	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
> +
> +	return readl(sunxi_wdt->wdt_base + regs->wdt_mode) & WDT_MODE_EN;
> +}
> +
> +static unsigned int sunxi_wdt_get_timeout(struct watchdog_device *wdt_dev)
> +{
> +	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
> +	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
> +	unsigned int timeout;
> +	u32 interval;
> +
> +	interval = readl(sunxi_wdt->wdt_base + regs->wdt_mode);
> +	interval >>= regs->wdt_timeout_shift;
> +	interval &= WDT_TIMEOUT_MASK;
> +	/* The 0.5-second interval cannot be represented by wdt_dev->timeout. */
> +	if (!interval)
> +		return 0;
> +

Why 0 and not 1 ? If I understand correctly, this sets the timeout
to  WDT_MAX_TIMEOUT or 16 seconds. It is not immediately obvious why
that would be desirable.

> +	for (timeout = WDT_MIN_TIMEOUT;
> +	     timeout < ARRAY_SIZE(wdt_timeout_map); timeout++) {
> +		if (wdt_timeout_map[timeout] == interval)
> +			return timeout;
> +	}
> +
> +	/* Reserved interval encoding. */
> +	return 0;
> +}
> +
>   static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   		unsigned int timeout)
>   {
> @@ -259,6 +291,7 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct sunxi_wdt_dev *sunxi_wdt;
> +	unsigned int running_timeout;
>   	int err;
>   
>   	sunxi_wdt = devm_kzalloc(dev, sizeof(*sunxi_wdt), GFP_KERNEL);
> @@ -286,7 +319,19 @@ static int sunxi_wdt_probe(struct platform_device *pdev)
>   
>   	watchdog_set_drvdata(&sunxi_wdt->wdt_dev, sunxi_wdt);
>   
> -	sunxi_wdt_stop(&sunxi_wdt->wdt_dev);
> +	if (sunxi_wdt_is_running(&sunxi_wdt->wdt_dev)) {
> +		running_timeout = sunxi_wdt_get_timeout(&sunxi_wdt->wdt_dev);
> +		if (running_timeout)
> +			sunxi_wdt->wdt_dev.timeout = running_timeout;
> +
> +		err = sunxi_wdt_start(&sunxi_wdt->wdt_dev);
> +		if (err)
> +			return err;
> +
> +		set_bit(WDOG_HW_RUNNING, &sunxi_wdt->wdt_dev.status);
> +	} else {
> +		sunxi_wdt_stop(&sunxi_wdt->wdt_dev);

Why is this necessary ? The watchdog is known to be stopped, why
stop it again ?

Thanks,
Guenter

> +	}
>   
>   	watchdog_stop_on_reboot(&sunxi_wdt->wdt_dev);
>   	err = devm_watchdog_register_device(dev, &sunxi_wdt->wdt_dev);
> 
> ---
> base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
> change-id: 20260827-submit-sunxi-wdt-boot-enabled-v1-94cd6be885d2
> 
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>


