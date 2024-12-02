Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D506DD10DB5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 08:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt9G7KmSxpaO4MDaESLiYEAxzFatOQtvUL6niYdnua4=; b=boGs7bz5ixtMBm1+el2EiVkZgy
	L0UmVFHj0BOhUtqUejsZjAbVjEpB8Jvn/Cm9l5M7NRQY9PbowjyowZl854BZK91RV8bxm/PUlS/B9
	0hDQZockFxiiVOyrVrBpZ4S93tAUjpjKq175eIfFrMg0vY8uaSq7+JbsdlePEHdyl8cVwDf2fB5nF
	rTGrMeylmszBhhUgRBS1VX7ABkKS24RwN7A3zaTRoO/QlT8/255m2tlD8qRhxvIpKEzG8i8gorWQN
	m5ZD8w3+NgiSjODwjpgJnBufXApqoKvn0CqrlxocZ5p6aVfT2Hb8pgWNaZqttYf2in57PqXBjKHSM
	VKZWp/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Rj-00000005N7I-2RlS;
	Mon, 02 Dec 2024 08:06:19 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Qk-00000005MxU-02en
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 08:05:19 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so52031921fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 00:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733126716; x=1733731516; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nt9G7KmSxpaO4MDaESLiYEAxzFatOQtvUL6niYdnua4=;
        b=otMET0AHhmoDJZzp5Yx6MykVKtIcKcbTCP1Mm1MwJY/LKpTegk//TAQB8l7jaAhwSt
         RwsPoz/oyqkQy7qhgCIevbUtGaDPZSssdq9coLGcMZGrZBd7b/YnnVSahu5WwBqnO3yY
         HrOuT9UaEABtIzY3whXIAZwpwRzcPZPbrBQHbvALipFqyB/PYUc+0oQvn1Ws0L2txa1d
         HDVZBLwJ5pPf2+eldv2nB9jYkC32F6YGX8Yc4q5x0KXDMrasqjJD7+NEw8D6zB9e8JAx
         DnbvsevRX4PdL/2wBNX72XY665/g7ewnFLAvBr7eM8ABLR4x3P9tJOpcUe0bhno0S/sB
         CbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733126716; x=1733731516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt9G7KmSxpaO4MDaESLiYEAxzFatOQtvUL6niYdnua4=;
        b=hpoWsdj27IOT4FKbUc9KKux2LM5kW29UQHNmkAMYsYaKBH6o2t3zX8bsxJSYtEOUD1
         hHBBQq9aINtv0jTAyEawyZr8jyohHeWR7HIoX8itGgClrwpkcbFumwX+mdfKhqoYzh4L
         NaGgxCkZnkYJ3OC3CIjvPivB96+pxv1wliGjTssCoBjPta8wXZvHDAsnuDUD7Z+gGY0c
         cLXtsFL5UtqQ0o3rM+/+miEB0mBbITHesWDGu2a0JKgT0SCo0+49uQPfxe04IQA+1UB6
         yZXKgQB1W8b8rHvQ4QtoL+cABLsnVmzTSlspmvS64qqctaTwAH57K8+fbh8MrDDGRi33
         pQCA==
X-Gm-Message-State: AOJu0YzX0NgVwT3fiK3FOSsCIHvHioAw4ZFLqEXCN4NuRAb1F7Pf2ap5
	ar+adE/uN/KEwHC0TFIDOoHhPyyzIDy/Ru/UhAO2MLFBtkAg/90tQwGE7x9YbuI=
X-Gm-Gg: ASbGncs0vMiRWSFpNepdPAsxbR8kGuv1CD52ilms3gytLV8UNKlGAcEsYQ0DKxOCf0w
	3IqfkAlHtehD/3M4m99bxzOCakT23/nm+LzFzwlxloQG+jvm+0fU9RnvyHHoCbiiIYd9Xpy4gBF
	FqVn9/DUDZHzlvFeBNp6uO153TaAr5y+s7pM0RyTq3qfzM8XMYzSBV8sxLECqAd0KpYO+YUDwp+
	RKLh7KMMziuc3Iji+6VPRV/8n1UU1THz+hmLGKz1mS0B2GPlccMFMFbSg==
X-Google-Smtp-Source: AGHT+IFUfZ5e2F1fAB4ao3/fokEu8MgM9xJJBXI2ftiU7+MWrxZpJdyaH0ok5YzBfo7DCvJTbQZ7iA==
X-Received: by 2002:a2e:be25:0:b0:2ff:96dc:af29 with SMTP id 38308e7fff4ca-2ffd5ffe050mr116068701fa.10.1733126715444;
        Mon, 02 Dec 2024 00:05:15 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f327casm144987935e9.27.2024.12.02.00.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 00:05:14 -0800 (PST)
Message-ID: <34a5b77b-e732-4393-a469-d9c719afa879@tuxon.dev>
Date: Mon, 2 Dec 2024 10:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: pm: change BU Power Switch to automatic mode
Content-Language: en-US
To: nicolas.ferre@microchip.com,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Cristian Birsan <cristian.birsan@microchip.com>
References: <20241125165648.509162-1-nicolas.ferre@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241125165648.509162-1-nicolas.ferre@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_000518_220152_5BBC4552 
X-CRM114-Status: GOOD (  26.18  )
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

Hi, Nicolas,

On 25.11.2024 18:56, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Change how the Backup Unit Power is configured and force the
> automatic/hardware mode.
> This change eliminates the need for software management of the power
> switch, ensuring it transitions to the backup power source before
> entering low power modes.
> 
> This is done in the only locaton where this swich was configured. It's

s/locaton/location

> usually done in the bootloader.
> 
> Previously, the loss of the VDDANA (or VDDIN33) power source was not
> automatically compensated by an alternative power source. This resulted
> in the loss of Backup Unit content, including Backup Self-refresh low
> power mode information, OTP emulation configuration, and boot
> configuration, for instance.

Should we add a fixes for this?

> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  arch/arm/mach-at91/pm.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index b9b995f8a36e..05a1547642b6 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -598,7 +598,21 @@ static int at91_suspend_finish(unsigned long val)
>  	return 0;
>  }
>  
> -static void at91_pm_switch_ba_to_vbat(void)
> +/**
> + * at91_pm_switch_ba_to_auto() - Configure Backup Unit Power Switch
> + * to automatic/hardware mode.
> + *
> + * The Backup Unit Power Switch can be managed either by software or hardware.
> + * Enabling hardware mode allows the automatic transition of power between
> + * VDDANA (or VDDIN33) and VDDBU (or VBAT, respectively), based on the
> + * availability of these power sources.
> + *
> + * If the Backup Unit Power Switch is already in automatic mode, no action is
> + * required. If it is in software-controlled mode, it is switched to automatic
> + * mode to enhance safety and eliminate the need for toggling between power
> + * sources.
> + */
> +static void at91_pm_switch_ba_to_auto(void)
>  {
>  	unsigned int offset = offsetof(struct at91_pm_sfrbu_regs, pswbu);
>  	unsigned int val;
> @@ -609,24 +623,19 @@ static void at91_pm_switch_ba_to_vbat(void)
>  
>  	val = readl(soc_pm.data.sfrbu + offset);
>  
> -	/* Already on VBAT. */
> -	if (!(val & soc_pm.sfrbu_regs.pswbu.state))
> +	/* Already on auto/hardware. */
> +	if (!(val & soc_pm.sfrbu_regs.pswbu.ctrl))
>  		return;
>  
> -	val &= ~soc_pm.sfrbu_regs.pswbu.softsw;

It seems that softsw and state members of at91_pm_sfrbu_regs.pswbu along
with their initialization could be dropped. What do you think?

I can do it while applying, if any.

Thank you,
Claudiu


> -	val |= soc_pm.sfrbu_regs.pswbu.key | soc_pm.sfrbu_regs.pswbu.ctrl;
> +	val &= ~soc_pm.sfrbu_regs.pswbu.ctrl;
> +	val |= soc_pm.sfrbu_regs.pswbu.key;
>  	writel(val, soc_pm.data.sfrbu + offset);
> -
> -	/* Wait for update. */
> -	val = readl(soc_pm.data.sfrbu + offset);
> -	while (val & soc_pm.sfrbu_regs.pswbu.state)
> -		val = readl(soc_pm.data.sfrbu + offset);
>  }
>  
>  static void at91_pm_suspend(suspend_state_t state)
>  {
>  	if (soc_pm.data.mode == AT91_PM_BACKUP) {
> -		at91_pm_switch_ba_to_vbat();
> +		at91_pm_switch_ba_to_auto();
>  
>  		cpu_suspend(0, at91_suspend_finish);
>  

