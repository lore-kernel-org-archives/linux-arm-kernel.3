Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47C2D78333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvILQC5jtN259ynW3O+0qLF7vU9xM53R8fRt1lnpcCw=; b=A/urcxXRzBnFeLVlQJkSVDOrbs
	EsqrjJIWp4F6JTUMaNTx7de0vgVh23D2J/DgBeCPZ4X+UZ1YHnyvpjkbmI41KH1718FwOcZvZ00S0
	Z88ZXzEsLdgW0GkSue8a5ejDO5vRG8n6gNJGcBtiBy7HiHWhGTRqboXhgJ21w+P7b06SKRGIqACEt
	qaoycMNzyFoca1vhAxN2YnF9M8xc3O0e2VCBT1ITwHImOj25Pw9KBqFbkwbKbBlWXH8Q83Dr2g6y/
	TREwCIy/n0emmgAibqIBpHXSCRSoq2BYA8VQxe2ZCV7/TS1WcN73XfojXFNsT2l4PvZhcCTIT7841
	sT5srfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9a1-00000006uqL-2qMe;
	Mon, 02 Dec 2024 16:47:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9X8-00000006uIR-3PDo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733157866; x=1764693866;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Kov19Kcf5hBRpnDlYC0mQmJZQDHLQKXhh4VXSpk7UlE=;
  b=1CtCOvtnusEbMrTO07GtYIhpwc96TOaTc5mUzESsXITDSA+Ttk+cBc0f
   YwWf/AXaOzxwJXacxCTd4Xxlb1hqV6UGY3cYR9D2r5H5vRW/+H57LNMrO
   MB8+P6xEQTafnvGKLzBMxxZwwnvrHPL2tfmIJrNs/oOq8P0PTaSCmlhrK
   QbhbmTv1XKkjDJ+eISn4y4wmL+fjKWMLYnHKkA21aQ2KitxFt6mPH+QKz
   bDOcXmKaE/tcA87hd/drngDhGczvuPaJzZoZcYkB7cnQyNd0Dse96wuz3
   CIYwnnlFPlOpOvGw3PRnla1G62DtDVT8KuqKnN/AiqscSNaaI5tovOpuS
   w==;
X-CSE-ConnectionGUID: VXJLcTK3S827uIOuKWwAmg==
X-CSE-MsgGUID: 3CVsFPfDSQ2L2zwHmwYC3g==
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="202476758"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Dec 2024 09:44:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 2 Dec 2024 09:44:22 -0700
Received: from [10.171.248.21] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 2 Dec 2024 09:44:21 -0700
Message-ID: <24069031-9ed4-4592-af98-ff53222caf03@microchip.com>
Date: Mon, 2 Dec 2024 17:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: at91: pm: change BU Power Switch to automatic mode
Content-Language: en-US, fr-FR
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>
References: <20241125165648.509162-1-nicolas.ferre@microchip.com>
 <34a5b77b-e732-4393-a469-d9c719afa879@tuxon.dev>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <34a5b77b-e732-4393-a469-d9c719afa879@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_084427_024494_6B43A0E3 
X-CRM114-Status: GOOD (  25.52  )
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

On 02/12/2024 at 09:05, Claudiu Beznea wrote:
> Hi, Nicolas,
> 
> On 25.11.2024 18:56, nicolas.ferre@microchip.com wrote:
>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>
>> Change how the Backup Unit Power is configured and force the
>> automatic/hardware mode.
>> This change eliminates the need for software management of the power
>> switch, ensuring it transitions to the backup power source before
>> entering low power modes.
>>
>> This is done in the only locaton where this swich was configured. It's
> 
> s/locaton/location
> 
>> usually done in the bootloader.
>>
>> Previously, the loss of the VDDANA (or VDDIN33) power source was not
>> automatically compensated by an alternative power source. This resulted
>> in the loss of Backup Unit content, including Backup Self-refresh low
>> power mode information, OTP emulation configuration, and boot
>> configuration, for instance.
> 
> Should we add a fixes for this?

Not so easy to tell as there's a loose dependency with the bootloader. 
But it's true that switching to automatic never harm. So probably yes.

>> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>> ---
>>   arch/arm/mach-at91/pm.c | 31 ++++++++++++++++++++-----------
>>   1 file changed, 20 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
>> index b9b995f8a36e..05a1547642b6 100644
>> --- a/arch/arm/mach-at91/pm.c
>> +++ b/arch/arm/mach-at91/pm.c
>> @@ -598,7 +598,21 @@ static int at91_suspend_finish(unsigned long val)
>>        return 0;
>>   }
>>
>> -static void at91_pm_switch_ba_to_vbat(void)
>> +/**
>> + * at91_pm_switch_ba_to_auto() - Configure Backup Unit Power Switch
>> + * to automatic/hardware mode.
>> + *
>> + * The Backup Unit Power Switch can be managed either by software or hardware.
>> + * Enabling hardware mode allows the automatic transition of power between
>> + * VDDANA (or VDDIN33) and VDDBU (or VBAT, respectively), based on the
>> + * availability of these power sources.
>> + *
>> + * If the Backup Unit Power Switch is already in automatic mode, no action is
>> + * required. If it is in software-controlled mode, it is switched to automatic
>> + * mode to enhance safety and eliminate the need for toggling between power
>> + * sources.
>> + */
>> +static void at91_pm_switch_ba_to_auto(void)
>>   {
>>        unsigned int offset = offsetof(struct at91_pm_sfrbu_regs, pswbu);
>>        unsigned int val;
>> @@ -609,24 +623,19 @@ static void at91_pm_switch_ba_to_vbat(void)
>>
>>        val = readl(soc_pm.data.sfrbu + offset);
>>
>> -     /* Already on VBAT. */
>> -     if (!(val & soc_pm.sfrbu_regs.pswbu.state))
>> +     /* Already on auto/hardware. */
>> +     if (!(val & soc_pm.sfrbu_regs.pswbu.ctrl))
>>                return;
>>
>> -     val &= ~soc_pm.sfrbu_regs.pswbu.softsw;
> 
> It seems that softsw and state members of at91_pm_sfrbu_regs.pswbu along
> with their initialization could be dropped. What do you think?

I think that I tried when writing the patch but I think that there's a 
little difference with sama5d2 register layout. Give me a couple more 
days to come back to this and verify.

> I can do it while applying, if any.
> 
> Thank you,
> Claudiu
> 
> 
>> -     val |= soc_pm.sfrbu_regs.pswbu.key | soc_pm.sfrbu_regs.pswbu.ctrl;
>> +     val &= ~soc_pm.sfrbu_regs.pswbu.ctrl;
>> +     val |= soc_pm.sfrbu_regs.pswbu.key;
>>        writel(val, soc_pm.data.sfrbu + offset);
>> -
>> -     /* Wait for update. */
>> -     val = readl(soc_pm.data.sfrbu + offset);
>> -     while (val & soc_pm.sfrbu_regs.pswbu.state)
>> -             val = readl(soc_pm.data.sfrbu + offset);
>>   }
>>
>>   static void at91_pm_suspend(suspend_state_t state)
>>   {
>>        if (soc_pm.data.mode == AT91_PM_BACKUP) {
>> -             at91_pm_switch_ba_to_vbat();
>> +             at91_pm_switch_ba_to_auto();
>>
>>                cpu_suspend(0, at91_suspend_finish);
>>


