Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A666ECD9BC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 02:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnwBnnXwTbGKc64te5moRcqi85iIUqtFB+6L7f67Qeg=; b=Q848ZR/4mkD2gw+Q1D0NwWfPqf
	OBw1H03whcHQaDzBpbxOm+PkiLhZRviz3itwTihEfKxkkU559iyBf99GjVTyQU7fg6pihFA+raiF2
	x2efLMmHqFx6ghGB6JTfYm5V3hpEm8ZgF1l7fnkVoAls48mVl12ACF3id6BO4P6uHdTBqcPQk8AuG
	rDA2oZ5T4zpJXe/36RO+Xn7GFnCYk2FRSK3HGMPmRnrgK5SYvyo6VnV1clsdiyKsjJX2VkvO3WO7z
	ZHM6UJ6oVbWzM6n/o9ulo4gqOXlD9U/LpzUUiK/sSwnt+3+5+6ddskmFwPIT1wxq/eSYckM7uO6Or
	ST+ivpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBwh-0000000AmVl-0sK0;
	Fri, 06 Feb 2026 02:51:47 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voBwe-0000000AmVG-1Jnc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 02:51:45 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-45efde72438so1081055b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 18:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770346302; x=1770951102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dnwBnnXwTbGKc64te5moRcqi85iIUqtFB+6L7f67Qeg=;
        b=kwZk0pUR0E0fP2QQf5hR0eCvTmJbFJtIa09qRj9helntaix2m6eoLGnKSIjLHwSUj/
         mnjWegUESBSb+g+T6CEzl8dbMkEFsUriBsPuFs3SgbID0tRNbsGAAzg0L+7Nsq3tctVh
         pCEGETBQQ4SlU5Fh81YHu+pwXeWDk+QRE08pBQ17FA6Zb4x+bZ6Txv8lztLJoTjEGBp/
         vskFQoaa6JMoiKDhrOPL/L2qhTw/Ih0y26on6Z5XmWAkuZHpql5jbt5D9/iemdfBeFoI
         iagRugOR+htf9cUabql5EdS/gmhZDEsiOzM71CCUtymDEc1SdhKIzShDvfsE7Dad3WfG
         R2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770346302; x=1770951102;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnwBnnXwTbGKc64te5moRcqi85iIUqtFB+6L7f67Qeg=;
        b=MbOGx1BtnFQmQU8Uq0oE00ugoFotHlI+ayb5puoNqOItqVAKH1jVKJdu4PKqbU9ZtR
         Up+7RxXiVtQfRdJoQu6mA3zULntyiTgXvNtRRHEwq3kmfZjznMkTUj+pjfY/W6cRd8qS
         7g6GO64ztMObQPawHwR/mEMwmn2uQztg15zq7H00oH9uxQi4vlHiDn9CH0AoR15iylG7
         GPuRi3z/R8WJBVOTuFKcd27p5gAD+AUPVVk92dh0tXRQpsr6mP51RehCfGluG+FylGPK
         9tKgtb50p56ZS3O3imDlyGKtMwlsDV9RC3/BZWAGDJ2EzcEz9n3SF0N+q9UbocuC8i5f
         zwPw==
X-Forwarded-Encrypted: i=1; AJvYcCXoyOXIWJBowpjeCeYhqPI7XqBix+6tQtafwdG7xwuQWyDyUBAjc66hi5WcHYRTPM1t1LGgrw/R2z0UUy1RwBYj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz31zV/wmNrQBZScQGHQHe1h1yjG4mSFsNSf025920n7xQgvfka
	yyDx7ehU3OGodk2pC0MTK0yMhpXzPgwWcPazUoqpfo7oDnmu7g4AUl8mPOSo4lEY
X-Gm-Gg: AZuq6aIFRxmZYeL8VAj68uQEsN5Ct0wM8kWitY4q/9pCQiFm7qSCdHhdET6+OQhgUZa
	G8uSyufuGtA3tQQRLRWXs7q5XUpS9AlUD2wffIunEeyi3ieFL90rM4ihQtl2zUQfbcUqYdxV5l1
	KWI7t0RdGDqYmtAM44fXUen9nttmbnCMCloyTKXDQVIeONyvPi1szVft+4WnMVIN70ifLbikqfb
	2kmL6oLK+cqpfiZHnev8cr3vKZJudFi1SaZ9ZUBSXzuxC81ea0D7y1SVz7AQvAsF+V2sVBq7v+r
	YJgajH1vH8FddOMv6jX3UMcK02kS+XEk0oB0u0z/AsqY30p/sB+ZXrDuP2IkHv/RJgMj3Jvdqt/
	X8r+dqUYvjnJdQ8s2pLBrEC8AReEUgJqqS/BMIn03b2dclhU/5Ycc4jpJfOL0w3UId3yYrtCA9k
	0BJkosBG3W4qfwf2IhsOuVPF2Q6Zc06cVCMv+78VKDuOftCgAsOImmhB/UWPkm
X-Received: by 2002:a05:7022:4390:b0:11b:a514:b64f with SMTP id a92af1059eb24-127040120b4mr517321c88.13.1770340320161;
        Thu, 05 Feb 2026 17:12:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm987181c88.8.2026.02.05.17.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 17:11:59 -0800 (PST)
Message-ID: <1ded7e75-67e6-48ab-b63b-e9e38559f26b@roeck-us.net>
Date: Thu, 5 Feb 2026 17:11:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
 Peng Fan <peng.fan@nxp.com>
References: <20260206-imx94-wdog-v2-1-4dd725faec1f@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260206-imx94-wdog-v2-1-4dd725faec1f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_185144_375553_8FF0921B 
X-CRM114-Status: GOOD (  25.66  )
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

On 2/5/26 16:23, Peng Fan (OSS) wrote:
> From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> 
> On i.MX94, watchdog sources clock from bus clock that will be always on
> during the lifecycle of Linux. There is a Low Power Clock Gating(LPCG)
> between the bus clock and watchdog, but the LPCG is not exported for
> software to control, it is hardware automatically controlled. When
> Cortex-A55 executes WFI during suspend flow, the LPCG will automatically
> gate off the clock to stop watchdog and resume clock when Cortex-A55 is
> woke up.
> 
> So watchdog could always be alive to protect Linux, except Cortex-A
> platform WFI is executed in Linux suspend flow.
> 
> Introduce a new hardware feature flag to indicate CPU low-power-mode
> auto clock gating support, and use it to avoid stopping the watchdog
> during suspend when LPCG can safely keep it running.
> 
> Add i.MX94-specific watchdog hardware data and DT compatible entry to
> enable this behavior.
> 
> Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> [peng.fan@nxp.com: rewrite commit log for clarity]
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> - Update commit log for clarity
> - Link to v1: https://lore.kernel.org/r/20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 03479110453ce78a6a89ce8d351ba9ece2f5e2c5..0ae4c0c00138e89854f14edca0fd5fa84591c2d2 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -56,6 +56,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>   struct imx_wdt_hw_feature {
>   	bool prescaler_enable;
>   	bool post_rcs_wait;
> +	bool cpu_lpm_auto_cg;
>   	u32 wdog_clock_rate;
>   };
>   
> @@ -360,7 +361,8 @@ static int __maybe_unused imx7ulp_wdt_suspend_noirq(struct device *dev)
>   {
>   	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
>   
> -	if (watchdog_active(&imx7ulp_wdt->wdd))
> +
> +	if (watchdog_active(&imx7ulp_wdt->wdd) && !imx7ulp_wdt->hw->cpu_lpm_auto_cg)
>   		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
>   
>   	clk_disable_unprepare(imx7ulp_wdt->clk);
> @@ -408,10 +410,17 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>   	.wdog_clock_rate = 125,
>   };
>   
> +static const struct imx_wdt_hw_feature imx94_wdt_hw = {
> +	.prescaler_enable = true,
> +	.wdog_clock_rate = 125,
> +	.cpu_lpm_auto_cg = true,
> +};
> +
>   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
>   	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
>   	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
>   	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> +	{ .compatible = "fsl,imx94-wdt", .data = &imx94_wdt_hw, },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
> 
> ---
> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> change-id: 20260203-imx94-wdog-1e0aa14d661b
> 
> Best regards,


