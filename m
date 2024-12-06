Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF39E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwHfTrGKe1Ng6qTTv8m18Y45pZvy2+0tveAWJarX1a0=; b=k1vF3RGWyuUu6QzXH6o9ckRVFL
	VUErGJIh3tq62hrYQRwQp3g7ErMqdjd7y9truPKUCAPQcb03N2g8pqXPgVTIWXy/r/2z7O6o6EVXt
	eBCHLTWjZfEZVOfACSHIBEgohmd5yMJJ5uCmYLZTR0gqA2JA54nDkF1bqrnLNq5Z+OOcOvPdUOIvg
	8VxiMQMOrc4kFUvKLPdl/ZhhUAY+GwnFd8Fj71PiA4Phst4NZsONUzpqVpYU2nk5Vltu6qxVOGRIN
	k91qzGkJQ0P+VnlhL6X9UjJQinB87Piz5n1VJCB5HEv0eXmNs3e37EysfPM6eMB2eTghblc/04OQy
	Nx3Stp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZGo-00000001rLc-3SWr;
	Fri, 06 Dec 2024 14:25:26 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZFn-00000001rCZ-2FVa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 14:24:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d0bf77af4dso2188898a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 06:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733495061; x=1734099861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwHfTrGKe1Ng6qTTv8m18Y45pZvy2+0tveAWJarX1a0=;
        b=QB5XvvH1vY+2Sc8mixO37M50cnp7mmROA795jicaYhQ/XkhzEBVppxvP98EohiILBL
         Z2n4Dko/OK1z6dgpelWWRR5HwDKJyYqnStL+xbkmQY+R/Yw+M7Zk2YQLWlFHGQbrC8sF
         qJYhNKaE1XZO+e9L4B6q5SRQEimWczIvgcRmSyWdMWI3PUCe3IK2d24AdVQhrX/9SKq5
         Ci0n55rNQb1lg1HWJKVECksZNarb4zuzt+MhQfWlMPlZKHuPWwOgpU29QNOdVlZzHDb0
         wShnh0LyLM22I3kx8Ml28U9vnPzmOL+VRRSLSQbYMX3je7ptFXwc1g0QCG6dlUvo5vGF
         kg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733495061; x=1734099861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwHfTrGKe1Ng6qTTv8m18Y45pZvy2+0tveAWJarX1a0=;
        b=cDkfzjet3IuxnCE2w7vxnkb/To6/9JvB9DB9LuYavLLTfn/HOuBed408EReJFnqvZO
         bVApQWhro4LvTc8LzG0UqyZPcD5RTJfAWsQek+UuR3I+zGhfKjTnkFU64yGg4iAMT42O
         8BrOTnMOgggp95NUkVdCny6UsrW8XoTNatNV7QANiwKCXLvqLTCYufNq7yauMG7NxuTF
         YlWFSfKH55t07D+VmaHuG8nDMHwp1XIYTQrcHh69m0XVPm7nOuVaV6UrgOz1BsMigYg2
         YMqQsonDE4BZpJfz0+scQYP1lu0QycTY3aYGjNxd034kjTwVh54aM4Z9m+YFnG8fs6Ch
         3DxQ==
X-Gm-Message-State: AOJu0YzYMZyLwiRCXH+9OpBghhc4B0dmCTNiKj87XST5QqkLsLphHUWP
	uzSulP+DwDk/QZNn6YgdRY0VYctpVQCFaQ3UhNESY1UI7nXaOIvC2M3qtw8Hykg=
X-Gm-Gg: ASbGncvzQD5bteq0ekmq8pPdCeOgt0agX8Hyq7jPLnr+u62EzWA9fzb6z3kXOjBSSXD
	AKxmlF5Se2eh7jTy+NAUmJEMGtOp3FW53ioLrjUHK0+L7YM7aDPMcpKIM6Tqvd0o8ZeXsTzTA8S
	ceMGo4KfEovFIa7aCKssU6JHeLm2ScOtKoZ6sn4zrAbCe7Y05/y80L51kuCEiNerZPW5mt80Aai
	o0j4iGjfpFGedKPW0sEa8C40mIuEeMmSt84CxKxPYH7j/u9xVtvdoU1BRm1flQ=
X-Google-Smtp-Source: AGHT+IEcTcffeDUZkl+nKBkgYPiYpxv1W8zJJQYjH/nBa4yD5QQ4BKGe/griAaUczS+I795ml4xtxA==
X-Received: by 2002:a17:906:4c9:b0:aa5:d06:4578 with SMTP id a640c23a62f3a-aa63a15a016mr199717266b.28.1733495060824;
        Fri, 06 Dec 2024 06:24:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e92a58sm248149066b.48.2024.12.06.06.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 06:24:20 -0800 (PST)
Message-ID: <9b9f5daa-2456-4ad0-9e56-a6978c35b197@tuxon.dev>
Date: Fri, 6 Dec 2024 16:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: pm: change BU Power Switch to automatic mode
Content-Language: en-US
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Cristian Birsan <cristian.birsan@microchip.com>
References: <20241125165648.509162-1-nicolas.ferre@microchip.com>
 <34a5b77b-e732-4393-a469-d9c719afa879@tuxon.dev>
 <24069031-9ed4-4592-af98-ff53222caf03@microchip.com>
 <c7ad1f03-f2a9-4706-ae87-2843b93de040@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c7ad1f03-f2a9-4706-ae87-2843b93de040@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_062423_577442_AA7DAD82 
X-CRM114-Status: GOOD (  26.19  )
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

On 06.12.2024 16:14, Nicolas Ferre wrote:
> Claudiu,
> 
> On 02/12/2024 at 17:44, Nicolas Ferre wrote:
>> On 02/12/2024 at 09:05, Claudiu Beznea wrote:
>>> Hi, Nicolas,
>>>
>>> On 25.11.2024 18:56, nicolas.ferre@microchip.com wrote:
>>>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>>
>>>> Change how the Backup Unit Power is configured and force the
>>>> automatic/hardware mode.
>>>> This change eliminates the need for software management of the power
>>>> switch, ensuring it transitions to the backup power source before
>>>> entering low power modes.
>>>>
>>>> This is done in the only locaton where this swich was configured. It's
>>>
>>> s/locaton/location
>>>
>>>> usually done in the bootloader.
>>>>
>>>> Previously, the loss of the VDDANA (or VDDIN33) power source was not
>>>> automatically compensated by an alternative power source. This resulted
>>>> in the loss of Backup Unit content, including Backup Self-refresh low
>>>> power mode information, OTP emulation configuration, and boot
>>>> configuration, for instance.
>>>
>>> Should we add a fixes for this?
>>
>> Not so easy to tell as there's a loose dependency with the bootloader.
>> But it's true that switching to automatic never harm. So probably yes.
>>
>>>> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>> ---
>>>>    arch/arm/mach-at91/pm.c | 31 ++++++++++++++++++++-----------
>>>>    1 file changed, 20 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
>>>> index b9b995f8a36e..05a1547642b6 100644
>>>> --- a/arch/arm/mach-at91/pm.c
>>>> +++ b/arch/arm/mach-at91/pm.c
>>>> @@ -598,7 +598,21 @@ static int at91_suspend_finish(unsigned long val)
>>>>         return 0;
>>>>    }
>>>>
>>>> -static void at91_pm_switch_ba_to_vbat(void)
>>>> +/**
>>>> + * at91_pm_switch_ba_to_auto() - Configure Backup Unit Power Switch
>>>> + * to automatic/hardware mode.
>>>> + *
>>>> + * The Backup Unit Power Switch can be managed either by software or
>>>> hardware.
>>>> + * Enabling hardware mode allows the automatic transition of power
>>>> between
>>>> + * VDDANA (or VDDIN33) and VDDBU (or VBAT, respectively), based on the
>>>> + * availability of these power sources.
>>>> + *
>>>> + * If the Backup Unit Power Switch is already in automatic mode, no
>>>> action is
>>>> + * required. If it is in software-controlled mode, it is switched to
>>>> automatic
>>>> + * mode to enhance safety and eliminate the need for toggling between
>>>> power
>>>> + * sources.
>>>> + */
>>>> +static void at91_pm_switch_ba_to_auto(void)
>>>>    {
>>>>         unsigned int offset = offsetof(struct at91_pm_sfrbu_regs, pswbu);
>>>>         unsigned int val;
>>>> @@ -609,24 +623,19 @@ static void at91_pm_switch_ba_to_vbat(void)
>>>>
>>>>         val = readl(soc_pm.data.sfrbu + offset);
>>>>
>>>> -     /* Already on VBAT. */
>>>> -     if (!(val & soc_pm.sfrbu_regs.pswbu.state))
>>>> +     /* Already on auto/hardware. */
>>>> +     if (!(val & soc_pm.sfrbu_regs.pswbu.ctrl))
>>>>                 return;
>>>>
>>>> -     val &= ~soc_pm.sfrbu_regs.pswbu.softsw;
>>>
>>> It seems that softsw and state members of at91_pm_sfrbu_regs.pswbu along
>>> with their initialization could be dropped. What do you think?
>>
>> I think that I tried when writing the patch but I think that there's a
>> little difference with sama5d2 register layout. Give me a couple more
>> days to come back to this and verify.
> 
> Ok, I remember now: I was wondering if I needed to remove the whole
> sfrbu_regs.xxx mechanism and define more generically the content of
> include/soc/at91/sama7-sfrbu.h for sama5d2, but if we need one day to use
> the STATE bit or even the SMCTRL bit of sama5d2, then it should be kept.
> 
> So, now that the mechanism is in place, I would prefer that we keep it:
> okay for you?

OK

> 
> Do you want me to re-spin a v2 for the rest?

No, I can handle the insignificant typo while applying.

Thank you,
Claudiu

> 
> Best regards,
>   Nicolas
> 
>>> I can do it while applying, if any.
>>>
>>> Thank you,
>>> Claudiu
>>>
>>>
>>>> -     val |= soc_pm.sfrbu_regs.pswbu.key | soc_pm.sfrbu_regs.pswbu.ctrl;
>>>> +     val &= ~soc_pm.sfrbu_regs.pswbu.ctrl;
>>>> +     val |= soc_pm.sfrbu_regs.pswbu.key;
>>>>         writel(val, soc_pm.data.sfrbu + offset);
>>>> -
>>>> -     /* Wait for update. */
>>>> -     val = readl(soc_pm.data.sfrbu + offset);
>>>> -     while (val & soc_pm.sfrbu_regs.pswbu.state)
>>>> -             val = readl(soc_pm.data.sfrbu + offset);
>>>>    }
>>>>
>>>>    static void at91_pm_suspend(suspend_state_t state)
>>>>    {
>>>>         if (soc_pm.data.mode == AT91_PM_BACKUP) {
>>>> -             at91_pm_switch_ba_to_vbat();
>>>> +             at91_pm_switch_ba_to_auto();
>>>>
>>>>                 cpu_suspend(0, at91_suspend_finish);
>>>>
>>
>>
> 

