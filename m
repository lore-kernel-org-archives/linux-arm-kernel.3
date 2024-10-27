Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DA0D13564
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A3lbsEM7HKz9vAURuZDu+UknulQsKtxt8b5QEI9hvQ=; b=o+xfzoVSFwiGOz1njfjJ5gad/n
	i7fjwVwBTO6CQtTmEtz2wMYC9Sjz66eE2AbVPrYTeHABfdLbFLaTd+OhF99hA16HyIIyt6tFzwi24
	jfbeZA6I28ZQayioM6MTd5PIhVrtMpS1kXUtEezdvpPNGlT/YrMD/K0voYj0Y5bTsbHAeNw6K0lkj
	EvZ0rYGfnMraRQomQxdqT8a5BFzs4hk/0o7ej6qFqMQnaeuBNXoQKEPurdeqvB+pBVYO109xSjOSr
	4PT4lSaT4AA9tK0p40xzzHQDfMrQKUsHW/Chgoyfpov6ncfQ7X/Osh4Z2FQnknfU5+PBdBfNon64+
	RiybEusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54Hi-00000008NyG-0tcR;
	Sun, 27 Oct 2024 14:30:26 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54G1-00000008NPf-2BPV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 14:28:42 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7c1324be8easo3094438a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039320; x=1730644120; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7A3lbsEM7HKz9vAURuZDu+UknulQsKtxt8b5QEI9hvQ=;
        b=IClGdfoa0cRPfHr1r7VizXxuR7vWRSjKFIKcMW241t9TM7dplT5suJMBXzZxQijGCF
         wo6HyVtK3VmDuHVvIpJ12BwD5v2lfGyfCpLQJkk631RDQFmDFr8oFPCVjEKrt9URnvU3
         OiVtMmYhWkLXahiQLHUvJOHQHk7sTzzblZzLh3CMtIvzcdmTk9D0U7vzT5xCRPoEHBnj
         scfokFkMJm8vHsjHtBUJEYCPUJ/3ACcx+e1O22K/iLUkwbbXzb6JPs3ZB5hFUSPi5oLm
         yH2gcq5IeCxunyJXu9yg8b+xasi7XerKFBYO/oyFgSwI/YNYM3yGMbDCzUSWKWgyD6N5
         AenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039320; x=1730644120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A3lbsEM7HKz9vAURuZDu+UknulQsKtxt8b5QEI9hvQ=;
        b=ZbEGDM8IVihPDnIuZCxFNniS3BA8upvvI6SgP5kz9UqfP1SUYyvwawDQA99tOIA5A7
         IqcWS64CttlQ1okoyBMm1aznvqjiQj/GDB5xhLQcrC+AevZTSfGqhf/L+uIub69XpWq8
         M+JA7Al2JW9X6W8rVA/3oai6dNGBuXsURt9aK0rCfmYhRYhZgXghYkJ8VPsbxlSfg4JD
         42zoo+XpdcpmjFgv3jhVHtmg0aIoMSx4bQ5PQKzcMZ+PTRFCm+OeGo9cfpZuPsgJn9ys
         jwKOObip1PjfWMl9JJeoxAnQuNXCz2K4Phym4OjWYblew9idBXG3e03UQFGY5d3XNeUW
         dj6A==
X-Forwarded-Encrypted: i=1; AJvYcCWGUrwQyUNYAGIKESF2WjPIyyvF1+zCxQSHbAkGW5wE3HazbLP0sIFtzpXsnCA5BVWuzZfmPJYnaT+hddc7t106@lists.infradead.org
X-Gm-Message-State: AOJu0YzKlVEX1aEF0QR6gwxiqb4nny1ppxj5D0Tr53q3xBCTcI74DXjn
	UuCdi3Uvbb2Nd0yRX9slalgWNUX2TVEOkWQfIKqt1QDWx7ubBxLT
X-Google-Smtp-Source: AGHT+IEddC7mt3S+zIgad3iK7xrMPQBFENvpB2vP99X6e/sU/fDdtOXzTrC5bdqxPz4evOD0/cdxvg==
X-Received: by 2002:a17:903:2307:b0:20b:723a:cba1 with SMTP id d9443c01a7336-20fb884fc0dmr183973465ad.1.1730039320157;
        Sun, 27 Oct 2024 07:28:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a3e2a4sm4177619a12.88.2024.10.27.07.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 07:28:39 -0700 (PDT)
Message-ID: <fb93ba0f-d414-4f7f-aff9-cd958c715e23@roeck-us.net>
Date: Sun, 27 Oct 2024 07:28:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: imx7ulp_wdt: Clarify timing units
To: Stefan Wahren <wahrenst@gmx.net>, Alice Guo <alice.guo@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241027105323.93699-1-wahrenst@gmx.net>
 <20241027105323.93699-2-wahrenst@gmx.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241027105323.93699-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_072841_598724_ABC6A970 
X-CRM114-Status: GOOD (  22.11  )
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

On 10/27/24 03:53, Stefan Wahren wrote:
> imx7ulp_wdt mixes a lot of timing units (frequency, clocks, seconds)
> in a not obvious way. So improve readability of imx7ulp_wdt by
> clarifying the relevant units.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   drivers/watchdog/imx7ulp_wdt.c | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 0f13a3053357..0f92d2217088 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -19,7 +19,7 @@
>   #define WDOG_CS_PRES		BIT(12)
>   #define WDOG_CS_ULK		BIT(11)
>   #define WDOG_CS_RCS		BIT(10)
> -#define LPO_CLK			0x1
> +#define LPO_CLK			0x1	/* 32 kHz */

This configures the clock source to be the LPO clock, which according to the
chip datasheets is a 1kHz clock for all chips except IMX93. It is only 32kHz
for IMX93, and the prescaler is enabled for that chip.

The comment is not only misleading because it selects the clock source,
not the rate, but wrong, because it only selects a 32kHz clock for IMX93,
and that value is then prescaled.

>   #define LPO_CLK_SHIFT		8
>   #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
>   #define WDOG_CS_EN		BIT(7)
> @@ -39,8 +39,8 @@
>   #define UNLOCK_SEQ1	0xD928
>   #define UNLOCK		((UNLOCK_SEQ1 << 16) | UNLOCK_SEQ0)
> 
> -#define DEFAULT_TIMEOUT	60
> -#define MAX_TIMEOUT	128
> +#define DEFAULT_TIMEOUT	60	/* seconds */
> +#define MAX_TIMEOUT	128	/* seconds */
>   #define WDOG_CLOCK_RATE	1000
>   #define WDOG_ULK_WAIT_TIMEOUT	1000
>   #define WDOG_RCS_WAIT_TIMEOUT	10000
> @@ -240,7 +240,8 @@ static const struct watchdog_info imx7ulp_wdt_info = {
>   		    WDIOF_MAGICCLOSE,
>   };
> 
> -static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout, unsigned int cs)
> +static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
> +			     unsigned int timeout_clks, unsigned int cs)

I don't think "_clks" adds any clarity because the value doesn't set a "clock".
"_ticks", maybe.

>   {
>   	u32 val;
>   	int ret;
> @@ -263,7 +264,7 @@ static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeou
>   		goto init_out;
> 
>   	/* set an initial timeout value in TOVAL */
> -	writel(timeout, wdt->base + WDOG_TOVAL);
> +	writel(timeout_clks, wdt->base + WDOG_TOVAL);
>   	writel(cs, wdt->base + WDOG_CS);
>   	local_irq_enable();
>   	ret = imx7ulp_wdt_wait_rcs(wdt);
> @@ -275,7 +276,8 @@ static int _imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeou
>   	return ret;
>   }
> 
> -static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout)
> +static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt,
> +			    unsigned int timeout_clks)
>   {
>   	/* enable 32bit command sequence and reconfigure */
>   	u32 val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE |
> @@ -296,11 +298,11 @@ static int imx7ulp_wdt_init(struct imx7ulp_wdt_device *wdt, unsigned int timeout
>   	}
> 
>   	do {
> -		ret = _imx7ulp_wdt_init(wdt, timeout, val);
> +		ret = _imx7ulp_wdt_init(wdt, timeout_clks, val);
>   		toval = readl(wdt->base + WDOG_TOVAL);
>   		cs = readl(wdt->base + WDOG_CS);
>   		cs &= ~(WDOG_CS_FLG | WDOG_CS_ULK | WDOG_CS_RCS);
> -	} while (--loop > 0 && (cs != val || toval != timeout || ret));
> +	} while (--loop > 0 && (cs != val || toval != timeout_clks || ret));
> 
>   	if (loop == 0)
>   		return -EBUSY;
> --
> 2.34.1
> 


