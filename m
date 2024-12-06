Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F66E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Efiav3Pc6fLJoWeXk3xEu3V2Nc/AkgjH0ShhQvQUVv0=; b=wIbkDO6963xArJnkd+pLpAEQRE
	ZNu40Umb5S470URjHJ4/7zMMZQytxGLPkAqVwIcgacMb4turAd36MP8rWd6uZWeGkItvxxG+3umZA
	wzY0Pzc/KHovNOwJUehNR5RqT7IxUskX9pPFsUZnDy23jpLFiy2zIWe2auEVwJYZclYmJSRg34yhZ
	xR9QYLBBmWNGy5assBUYNVy3X800JpBqtVYitf/g9MiL9AAXYPt96QAATbFRVzB1nWaOEuWVvfAkh
	0efqvOE1Huj05KerKUQPnFkb9/0Q11sMT5jhSrDDtklrbThFG4ZZjwC/Mg3q9P3RpuVCorGWig3R8
	OOCh/51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZ7T-00000001qI0-1cJr;
	Fri, 06 Dec 2024 14:15:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZ6R-00000001qB6-2rCI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 14:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733494483; x=1765030483;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=S9ZuMJHhQfi2ySmApw4QqUCGnkxfvXkwr5pJnt7ri04=;
  b=j6gsVOIFfUeYzzjYr/v3kRtZOmIVjgKtYvN6LkzqZvzvzXO+nj50W0Is
   aUji4fziRF57qEmWNbIf7jdo1RXCae2/mQBthph+C9ylIMSX/9D9V84Ws
   xUR2fXhx7EjvhOkCRUZcbp5ZhibX5pR+cCgpQpRkFGEZguz22Jkzmj3tZ
   n1JEpRv7xG0hk6m5XDbpCDpTt9IEMG8P2l+93GTBxprtD/SMn/0pP2Zep
   TTAlkf7jo49iKa/3/2Is9mslCUq0LktctCgFi2G1EZjsDz1x/KfgRFfM/
   GHZbLD7JQqdIizHCivZgH0U7IUluRKEzk41Od21evd/9YTMB+vYVNODyq
   Q==;
X-CSE-ConnectionGUID: LNqYZ07gQL+lqwuz+ksYkA==
X-CSE-MsgGUID: +JKe+NVQQ1asrSyShs1RmQ==
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="34914261"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 07:14:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 07:14:01 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 6 Dec 2024 07:14:00 -0700
Message-ID: <c7ad1f03-f2a9-4706-ae87-2843b93de040@microchip.com>
Date: Fri, 6 Dec 2024 15:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: pm: change BU Power Switch to automatic mode
Content-Language: en-US, fr-FR
From: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>
References: <20241125165648.509162-1-nicolas.ferre@microchip.com>
 <34a5b77b-e732-4393-a469-d9c719afa879@tuxon.dev>
 <24069031-9ed4-4592-af98-ff53222caf03@microchip.com>
Organization: microchip
In-Reply-To: <24069031-9ed4-4592-af98-ff53222caf03@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_061443_876780_C203815E 
X-CRM114-Status: GOOD (  23.04  )
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

Claudiu,

On 02/12/2024 at 17:44, Nicolas Ferre wrote:
> On 02/12/2024 at 09:05, Claudiu Beznea wrote:
>> Hi, Nicolas,
>>
>> On 25.11.2024 18:56, nicolas.ferre@microchip.com wrote:
>>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>
>>> Change how the Backup Unit Power is configured and force the
>>> automatic/hardware mode.
>>> This change eliminates the need for software management of the power
>>> switch, ensuring it transitions to the backup power source before
>>> entering low power modes.
>>>
>>> This is done in the only locaton where this swich was configured. It's
>>
>> s/locaton/location
>>
>>> usually done in the bootloader.
>>>
>>> Previously, the loss of the VDDANA (or VDDIN33) power source was not
>>> automatically compensated by an alternative power source. This resulted
>>> in the loss of Backup Unit content, including Backup Self-refresh low
>>> power mode information, OTP emulation configuration, and boot
>>> configuration, for instance.
>>
>> Should we add a fixes for this?
> 
> Not so easy to tell as there's a loose dependency with the bootloader.
> But it's true that switching to automatic never harm. So probably yes.
> 
>>> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>> ---
>>>    arch/arm/mach-at91/pm.c | 31 ++++++++++++++++++++-----------
>>>    1 file changed, 20 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
>>> index b9b995f8a36e..05a1547642b6 100644
>>> --- a/arch/arm/mach-at91/pm.c
>>> +++ b/arch/arm/mach-at91/pm.c
>>> @@ -598,7 +598,21 @@ static int at91_suspend_finish(unsigned long val)
>>>         return 0;
>>>    }
>>>
>>> -static void at91_pm_switch_ba_to_vbat(void)
>>> +/**
>>> + * at91_pm_switch_ba_to_auto() - Configure Backup Unit Power Switch
>>> + * to automatic/hardware mode.
>>> + *
>>> + * The Backup Unit Power Switch can be managed either by software or hardware.
>>> + * Enabling hardware mode allows the automatic transition of power between
>>> + * VDDANA (or VDDIN33) and VDDBU (or VBAT, respectively), based on the
>>> + * availability of these power sources.
>>> + *
>>> + * If the Backup Unit Power Switch is already in automatic mode, no action is
>>> + * required. If it is in software-controlled mode, it is switched to automatic
>>> + * mode to enhance safety and eliminate the need for toggling between power
>>> + * sources.
>>> + */
>>> +static void at91_pm_switch_ba_to_auto(void)
>>>    {
>>>         unsigned int offset = offsetof(struct at91_pm_sfrbu_regs, pswbu);
>>>         unsigned int val;
>>> @@ -609,24 +623,19 @@ static void at91_pm_switch_ba_to_vbat(void)
>>>
>>>         val = readl(soc_pm.data.sfrbu + offset);
>>>
>>> -     /* Already on VBAT. */
>>> -     if (!(val & soc_pm.sfrbu_regs.pswbu.state))
>>> +     /* Already on auto/hardware. */
>>> +     if (!(val & soc_pm.sfrbu_regs.pswbu.ctrl))
>>>                 return;
>>>
>>> -     val &= ~soc_pm.sfrbu_regs.pswbu.softsw;
>>
>> It seems that softsw and state members of at91_pm_sfrbu_regs.pswbu along
>> with their initialization could be dropped. What do you think?
> 
> I think that I tried when writing the patch but I think that there's a
> little difference with sama5d2 register layout. Give me a couple more
> days to come back to this and verify.

Ok, I remember now: I was wondering if I needed to remove the whole 
sfrbu_regs.xxx mechanism and define more generically the content of 
include/soc/at91/sama7-sfrbu.h for sama5d2, but if we need one day to 
use the STATE bit or even the SMCTRL bit of sama5d2, then it should be kept.

So, now that the mechanism is in place, I would prefer that we keep it: 
okay for you?

Do you want me to re-spin a v2 for the rest?

Best regards,
   Nicolas

>> I can do it while applying, if any.
>>
>> Thank you,
>> Claudiu
>>
>>
>>> -     val |= soc_pm.sfrbu_regs.pswbu.key | soc_pm.sfrbu_regs.pswbu.ctrl;
>>> +     val &= ~soc_pm.sfrbu_regs.pswbu.ctrl;
>>> +     val |= soc_pm.sfrbu_regs.pswbu.key;
>>>         writel(val, soc_pm.data.sfrbu + offset);
>>> -
>>> -     /* Wait for update. */
>>> -     val = readl(soc_pm.data.sfrbu + offset);
>>> -     while (val & soc_pm.sfrbu_regs.pswbu.state)
>>> -             val = readl(soc_pm.data.sfrbu + offset);
>>>    }
>>>
>>>    static void at91_pm_suspend(suspend_state_t state)
>>>    {
>>>         if (soc_pm.data.mode == AT91_PM_BACKUP) {
>>> -             at91_pm_switch_ba_to_vbat();
>>> +             at91_pm_switch_ba_to_auto();
>>>
>>>                 cpu_suspend(0, at91_suspend_finish);
>>>
> 
> 


