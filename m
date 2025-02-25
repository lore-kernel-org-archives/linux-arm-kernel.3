Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC2EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7px0Ndhq9lUrgjQFROlw953RzIYIbSKavntnqGmD0o=; b=dGg1oE1BwJcpQa+Ibnwdjqow2/
	S/IXdtRYsLXsuEqmET8dpqSkU65jNBPWt8yoqll5uknFWoyU3bzTBgsCWfm1npmIn5mJINgLYQwN2
	lHIrbjfiRNKRwNQsIEuf0dlKYCswH7eLNcfonWVAG2sFJmbDHne4r8mcQoYxenGKMyLewi94NwYjv
	EpfB/QW9fg7NNGjw9BmHM4egk2Rsu0d2QpU4r+AiHH5EM0xnYyUc91YGs4jzNIb1veUF70DAo4WZB
	EADAHmt7dZKxlv6im51bgRLzpUxWLEbvoSoy70g2PAew5JxOWJ+MQsoRMJsUGtNSrCKexPFiml1KT
	DnKedZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2s2-00000001c9K-3atj;
	Tue, 25 Feb 2025 21:53:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2q1-00000001bkw-0YXj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:51:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220dc3831e3so3664095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 13:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740520296; x=1741125096; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=h7px0Ndhq9lUrgjQFROlw953RzIYIbSKavntnqGmD0o=;
        b=R0eOvOATBTQ8swzrqcbA2Pv0oTT7ocZc6NfG8R3TCHz9sIWEs9FpRwrfZimaNjO/TM
         IwiSdi+sxR8f7tijtcMnhcc0AXg+msj5dqTWYKKPGzNSqjt9WVmThwXrL+/Y8YxcjVzf
         r2tyczv1XwYgD4EOBN38Mrj4/ynu02IcXtFRumY1QKPyrOpUsI2101cBN7evySgUJneg
         CzvGD/4pFrQKQ2kCwMCo7T8uDdcjT9vnhrpj4Fde2so/FDsQNN2tnYD4cGh5tbf9yTY5
         yR5wE+16tUbH7+SafZsGW9sbk8cHvdhZT+G4irSwYSLbl6kaMqy9T/WnNQlNU0P5APF2
         Qf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740520296; x=1741125096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7px0Ndhq9lUrgjQFROlw953RzIYIbSKavntnqGmD0o=;
        b=a/IQ9ydKCTFAeLRQqL9f59MhCHBqyHcDcJhqOHist4uOwdzIKkTOEmNpWC5OIO2Nzs
         6E3E9mfiw02MGn9eJhhCoEcXRs5QGDAC+CYEjF+k6hQUF7flDjNNxIiuRnWbyD19ljq1
         /KPbYbwOw14gUnFqhyXaoOyh9UglvyyLknJKP4k0CVgM7Lgn6Y79JimbQ5Dyyd6J6sg8
         P7q3eOJ+6Dpl1VCgiJo/gvUWiqaiZAPVdS85j+c3c+IVezcDUC8iAPcXws5ka8hV8and
         jizyCTI6ebFSbx8ZyrWaJtP3rxnbpy7kPQ3g+QhoYCG2AB0hUw+dP9oflgENr3Bw5B91
         ZQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXn+QgTYj4pKUqXJ0qhlf5u8aR/Gr0dzFldlU7/jNotwdiLI73PBFVOkvSZt7btdzshOHwfoCC36zCJJzBOVcz@lists.infradead.org
X-Gm-Message-State: AOJu0YzYt6enEwxQ7R9EGeaI7AM2skYiRbKl2Wsd7uB8lsJclDagKrBU
	pnc41olWNPwJV2iwkYBkvm/Br+/znB4T0bq5GMGAH/+fkhwxOWX2
X-Gm-Gg: ASbGnctFrue/CymYy2cIO19N31fHvs0wepdSy5YDvsaRGerLHBno0IU35lFQL7xENED
	4gcoODeVRCsDdWZnbY57P7j7MCY1TGdtlebAfBYRhHcCriKntje6eCs5/sWkD9w5lOHzW6whtrB
	XQRYlVYvtHOA36bwAXXpNCji31/b6YPymftHMvPjaJm/RNLme4lxkjRSQTH7pP69/qfLZHnyP9p
	z15NOKjAtS5TEDT59lrmMvkvMnqq3IyZz76vBm3QQhsvPqhM0JufBhGnHdDf77kK14Wl8MYD9VO
	Q0MG96W0Ebf/B9JFOoQ4mVBeEP7rO15J19NU0WI5uAZbwDjDlKNcBvQOc5jhsYBl20gnTUfwmOY
	=
X-Google-Smtp-Source: AGHT+IFDUxCf16vlokyauZ7By83P4bZv10+rmxrvEgQvW7LhaUGLdE7Sqg2syC9gOosegx4KhIy6Dg==
X-Received: by 2002:a05:6a21:150b:b0:1ee:c8a4:c329 with SMTP id adf61e73a8af0-1eee2c8c34cmr36492575637.0.1740520295994;
        Tue, 25 Feb 2025 13:51:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aeda75a0bb7sm1883945a12.12.2025.02.25.13.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:51:34 -0800 (PST)
Message-ID: <2547277e-d9c0-4138-abaa-7afbff1ba3ca@roeck-us.net>
Date: Tue, 25 Feb 2025 13:51:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled
 after probe
To: Regis Dargent <regis.dargent@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250225143638.1989755-1-regis.dargent@gmail.com>
 <20250225143638.1989755-2-regis.dargent@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250225143638.1989755-2-regis.dargent@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_135137_177322_28B5E32B 
X-CRM114-Status: GOOD (  21.92  )
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

On 2/25/25 06:36, Regis Dargent wrote:
> If the watchdog is already running during probe, let it run on, read its
> configured timeout, and set its status so that it is correctly handled by the
> kernel.
> 
> Signed-off-by: Regis Dargent <regis.dargent@gmail.com>
> 
> --
> 
> Changelog v1..v2:
> - add sunxi_wdt_read_timeout function
> - add signed-off-by tag
> 
> Changelog v2..v3:
> - WDIOF_SETTIMEOUT was set twice, and other code cleanup
> ---
>   drivers/watchdog/sunxi_wdt.c | 45 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
> index b85354a99582..d509dbcb77ce 100644
> --- a/drivers/watchdog/sunxi_wdt.c
> +++ b/drivers/watchdog/sunxi_wdt.c
> @@ -140,6 +140,7 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   		timeout++;
>   
>   	sunxi_wdt->wdt_dev.timeout = timeout;
> +	sunxi_wdt->wdt_dev.max_hw_heartbeat_ms = 0;
>   
>   	reg = readl(wdt_base + regs->wdt_mode);
>   	reg &= ~(WDT_TIMEOUT_MASK << regs->wdt_timeout_shift);
> @@ -152,6 +153,32 @@ static int sunxi_wdt_set_timeout(struct watchdog_device *wdt_dev,
>   	return 0;
>   }
>   
> +static int sunxi_wdt_read_timeout(struct watchdog_device *wdt_dev)
> +{
> +	struct sunxi_wdt_dev *sunxi_wdt = watchdog_get_drvdata(wdt_dev);
> +	void __iomem *wdt_base = sunxi_wdt->wdt_base;
> +	const struct sunxi_wdt_reg *regs = sunxi_wdt->wdt_regs;
> +	int i;
> +	u32 reg;
> +
> +	reg = readl(wdt_base + regs->wdt_mode);
> +	reg >>= regs->wdt_timeout_shift;
> +	reg &= WDT_TIMEOUT_MASK;
> +
> +	/* Start at 0 which actually means 0.5s */
> +	for (i = 0; (i < WDT_MAX_TIMEOUT) && (wdt_timeout_map[i] != reg); i++)

Unnecessary (). On top of that, its complexity is unnecessary.
The timeout in seconds, except for reg == 0, is wdt_timeout_map[reg],
with values of 0x0c..0x0f undefined. Worse, the above code can access
beyond the size of wdt_timeout_map[] if reg >= 0x0c.

> +		;
> +	if (i == 0) {
> +		wdt_dev->timeout = 1;
> +		wdt_dev->max_hw_heartbeat_ms = 500;

This is an unacceptable API abuse. max_hw_heartbeat_ms, if set,
should be 16000, not 500. You could set the timeout to 1 second instead.

Guenter


