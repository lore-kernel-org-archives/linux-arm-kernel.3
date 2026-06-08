Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F36ECD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7NWfcHA0wjAt4NBRQYEf+KO3ie3ZCCu2Li2S83po9c=; b=dCOByXrq5U1ho2M5UUwJapqyVb
	TDy/rDcxsQ3XpGztS+dnMuO55h0DPhXSi1xdhO1jZvhvYTJu42dox3qJjYbM+7M1OfJc+88lEhKap
	VEVSd3W9SwIKpVWXsYLzioNMbp4RpK9+0oZNQIcfYwO3uYkF7QroOWuukCBl4ZZ0tyQABoYSym3Zx
	+kNh6ITdb4IJM180E/VvgNi3lxhvjQ5Y/i/6tqSyruU9n8zCduuK0da584ykoaYaw4BSJaOpe75Hu
	K0dLu4JRuHdodm+2GGdQcWub2zrAQla7532qP8I3a4Rhh9R0FeI3ZwEQdf9ByME8SAUboRimx16v7
	hWIZRedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadr-00000003hPq-2dO6;
	Mon, 08 Jun 2026 14:07:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWado-00000003hMN-2ymE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so47708065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780927666; x=1781532466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7NWfcHA0wjAt4NBRQYEf+KO3ie3ZCCu2Li2S83po9c=;
        b=EcyTJFAt2kB1aeOmLLcMGrer+HtncarB7tfdXBR1eLzIVfqrjR5vpomVIm2ns7/vfr
         +8v4kRz+wzJAripe01SrFguJW/Bo/0uc/8ltGTITPXPnri0/9rWqn8B0EpDh4kmvZ3ZB
         ufBhVipHkYGIORMuFnNJUDSzYYh0ZmtkRh3G3O6OVt6/duUdEEe/cRzH0q3qwEsL8VLX
         fXJD3RfesXNzVapICC2F6u8q4IVwMcEfvRG9FswIkehVmWEklSHMjJ2PVUayKzC+lgL/
         dwH13ePz3/3FiTE6LT/hro3t5JU1IBwHvpys/nRAi2grRXUt+zNnMj3ipYQK+7ChlQjq
         6vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927666; x=1781532466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7NWfcHA0wjAt4NBRQYEf+KO3ie3ZCCu2Li2S83po9c=;
        b=X4bCneKNZ9u/1+048AZllEU2Eyt6NxGE3D7Oq38GI/04/GdfCfqqqK1HmoUV4JVrYA
         FICo6FH3lWPgF4T0x5lHKs5tzpk1T8PPHiJK85r9ELzDdwyQrz7WW65RKlhs0LqioWf0
         yz3C7Urb54IHjDqRBiMsPdN65Zt3Uc9Cy2qTExayixCA0qDHb7cs0OKagvv7uvj5Snno
         s+yNu44Ac/QFsIQM1nRK0YM2a9uxAM1W0ZWSYVpcxTtn5sDmGxpQ/PvxdgX3U4ObDWQp
         q1uPmDPM+HxC5UhVxtpnLK0cc1FR0fWsx6k6grKx6RfZwO+UyMVLK5SfJFgXoXalY9uU
         yMJg==
X-Forwarded-Encrypted: i=1; AFNElJ81IfgU1QwMbwadYaeIqRPOcxXbad909YLTdE0DSdSsMXsCDyPUS1Ro2c0H6HN0cGI2fr4Yq+KBHkh8FOGBZ45u@lists.infradead.org
X-Gm-Message-State: AOJu0YyGk6MLxEI9eikCJP9K3tUgLc0/S4tTIjKDmhsT4L4WRFEGnFNO
	dJ5NparVng7rsSVO4ZumQWoksf/0o1pSidB6POZ0AuAehsXYzYT34qs+Fy8EayywyobdfhCvoJe
	PUyZz
X-Gm-Gg: Acq92OFeixiqDmzJ51l0S0fUXvhWw6FE/Q+AM3MTQLuE9nZSW5WDpWs2VwcDo47KcLU
	Rf3XMMBecy8daibqCyxYAccOzsQn7RvopTaXGvj+kZdexZSsaxkaIagrKeUAlvTJ+McNkD2ngtZ
	8sS8Kr+V9fYrzYlfPSYoNZK3ucKmlrhMYGWoxnvYcY4GYKFHnDmN1PZFsEocxmWFNcH/YtS727l
	mISLpS05RItT1FHPRW8wlQnIDQvGaTf7TPhNYU9yZAHfSXBbu32lkKCJYjPHkrcpHUjyDvNPDOP
	n82jN1ZN5gSLHZ0qV4/k9WgGYPcEbuQDDrm7JxOtVq9S/Wgqp2NOKed/hORMX/JS6vPUdH4hki4
	r+HuqGcwynUIHU2FmgsUnjEs7K/DfCZiX0ffnVf5Gc9DGERo67AOqXJwSsmYKyD23IZYjWaJkc4
	B3nkUlHYiKYirNOpcuD8cKD4gS96q07oQNG+BIzfMbDfEIbiw=
X-Received: by 2002:a05:600c:154c:b0:490:9ea0:c11f with SMTP id 5b1f17b1804b1-490c25afa50mr262456145e9.5.1780927666052;
        Mon, 08 Jun 2026 07:07:46 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cc140sm475559525e9.9.2026.06.08.07.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:45 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:07:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <aibMr16r55xE26rU@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070748_769362_1EB4DB4B 
X-CRM114-Status: GOOD (  26.12  )
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

On Mon 2026-06-01 00:17:38, Andrew Murray wrote:
> The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> are two distinct mechanisms for providing similar functionality which add a
> delay prior to each printed printk message.
> 
> boot_delay provides a kernel parameter for delaying printk output from
> kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> configurable only via sysctl and thus is only used post boot.
> 
> Let's deprecate the boot_delay feature in favour of printk_delay. In order
> to preserve functionality, we'll also extend printk_delay such that it can
> additionally configured via a kernel parameter.

I would make it clear and say: "via an early kernel parameter".

Note that there are also kernel parameters which can be modified at runtime
via /sys/module/kernel/paramters/<parameter>

Also I would make it clear that this changes the behavior, for
example:

<proposal>
Behavior change:

The delay enabled by both "boot_delay" and "printk_delay" continues
working even in SYSTEM_RUNNING state. It must be explicitly stopped
by setting printk_delay=0 via sysctl.

The delay is skipped when the message is suppressed in all system
states. It used to skipped only for the boot_delay.
</proposal>

> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1339,11 +1327,34 @@ static void boot_delay_msec(int level)
>  	}
>  }
>  #else
> -static inline void boot_delay_msec(int level)
> +static inline void __init printk_delay_calculate(void)
> +{
> +}
> +
> +static inline void early_boot_delay_msec(void)
>  {

It would be nice to print a warning that the early boot delay
does not work, something like:

	pr_warn_once("Early boot delay does not work without CONFIG_GENERIC_CALIBRATE_DELAY enabled.\n");

>  }
>  #endif
>  
> +static int __init printk_delay_setup(char *str)
> +{
> +	get_option(&str, &printk_delay_msec);
> +	if (printk_delay_msec > 10 * 1000)
> +		printk_delay_msec = 0;

Sashiko AI warns that this code accepts negative values.
It might cause long delays, see
https://sashiko.dev/#/patchset/20260601-deprecate_boot_delay-v1-0-c34c187142a6%40thegoodpenguin.co.uk

The problem has already been there even before. But it would be nice
to fix it.

> +
> +	printk_delay_calculate();
> +
> +	return 0;
> +}
> +early_param("printk_delay", printk_delay_setup);
> +
> +static int __init boot_delay_setup(char *str)
> +{
> +	pr_warn("boot_delay will soon be deprecated, please use printk_delay instead");
> +	return printk_delay_setup(str);
> +}
> +early_param("boot_delay", boot_delay_setup);
> +
>  static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
>  module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);

Otherwise, it looks good to me.

Best Regards,
Petr

