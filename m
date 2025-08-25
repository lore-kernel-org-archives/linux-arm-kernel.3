Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E53CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTYgnCmP9oD8OuiGNmeY050nf7aChPZg0Y9l/Nu+cAQ=; b=jc4wvf6ttylvVkNPNZXPd3OJoZ
	Kalpo6AZ2fMN0oALmHWzRkNrxxt7OKG4O5PGp+G+SntSs7rcetI8/31ROx3o+EvZOppSeJD4DzeoB
	oReRRPF9m3lJQFpQx/byAcorXtR/sx8dV4T8IlA4ud094DboB5TI0CODuDP9Xzo+Mtfnj8tgwAEU+
	Pxezt5OXH63PFUy5AQF6ngo9Gv3bybY2/5Hq3mjlYHhBPnO9lr15F8/g1DWUHUgEYnJgH+l+KROBF
	mOk2iSLSvR1WjwSzPLbQvlAtO077pgOTk21NNZbrvlQc/0h4U/FUKUvmbrqN8vkhU19+wliSX0wqv
	jtRRDHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYlI-00000008Rmi-1IgU;
	Mon, 25 Aug 2025 15:05:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXuI-00000008CsG-349H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 14:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756131046; x=1787667046;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=JYLoJUwGKBDQEO1UVLrz1emWoAwB4K2kdLEIX8eP7tE=;
  b=iYkXnnF4ZIO2BBNWr1PueV+yClSFBiA8ipVrhRpRh7qcuvA8kjMzQM4N
   j/3q0MBnvA5Cefm64GH5XLFC1gyB9U4PaKJzsVgocUY1Lm+2artAOCgq2
   SwGYp/RgqI2VqRzwAYBw9eeI5AdZ+G1mpzdP+mdbL1GNgHCvpiGYqOchS
   z8h1DXmkV0BTCOzgChQHROLPT4UTNi3LGV464Dpb2WLWL+AXv7Aq9T2a3
   6fTcd1qgy9pR7hv3mpb0yQ/me6+MCI7QkCOPiH+QIUVIHzr4FcT47hN1s
   3qnWnCskqVPDP8prKHF+nBpO2QCJBMbZ+iwS9qNp6LdvIeqhNGdiMU7b7
   A==;
X-CSE-ConnectionGUID: cdlPPhXJQGaFbMdbODqVXg==
X-CSE-MsgGUID: X+/vD80ySrWUJey6ExoCDQ==
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="213036058"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 07:10:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 07:10:30 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 25 Aug 2025 07:10:28 -0700
Message-ID: <786c7e37-f8d0-45ca-9a8f-c1468318ac2a@microchip.com>
Date: Mon, 25 Aug 2025 16:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
From: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
 <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
 <62be0896-6c90-4a27-81cb-7bd897d0e6f2@grenoble.cnrs.fr>
 <e3199e23-0973-44d2-a882-405892290e73@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <e3199e23-0973-44d2-a882-405892290e73@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_071046_949500_758C22F5 
X-CRM114-Status: GOOD (  14.88  )
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

On 25/08/2025 at 14:35, Nicolas Ferre wrote:
> On 14/08/2025 at 17:28, Edgar Bonet wrote:
>> Hello Geert, and thanks for you prompt review!
> 
> Yep, Geert, many thanks!
> 
>>> I think the conversions in
>>> drivers/irqchip/irq-atmel-aic.c:aic_irq_domain_xlate() and
>>> drivers/irqchip/irq-loongson-liointc.c:liointc_set_type()
>>> are also wrong, and need a similar change.
>>
>> The one in irq-atmel-aic.c looks indeed strikingly similar. The one in
>> irq-loongson-liointc.c is slightly different though. Instead of:
>>
>>       irq_gc_lock_irqsave() -> guard(raw_spinlock_irq)
>>
>> it does:
>>
>>       irq_gc_lock_irqsave() -> guard(raw_spinlock)
>>
>> I don't know what the implications are though.
>>
>>> Unfortunately I have no hardware to verify.
>>
>> Neither do I.
> 
> I'm on it. Expect feedback later today...

Answering to myself: tested working okay on at91sam9x35ek board (with 
IRQ controller matching compatible string "atmel,at91rm9200-aic" 
(handled by file irq-atmel-aic.c) and your modification:

--- a/drivers/irqchip/irq-atmel-aic.c
+++ b/drivers/irqchip/irq-atmel-aic.c
@@ -188,7 +188,7 @@ static int aic_irq_domain_xlate(struct irq_domain *d,

         gc = dgc->gc[idx];

-       guard(raw_spinlock_irq)(&gc->lock);
+       guard(raw_spinlock_irqsave)(&gc->lock);
         smr = irq_reg_readl(gc, AT91_AIC_SMR(*out_hwirq));
         aic_common_set_priority(intspec[2], &smr);
         irq_reg_writel(gc, smr, AT91_AIC_SMR(*out_hwirq));

Thanks, best regards,
   Nicolas



> Thanks so much for the heads-up.
> 
> Best regards,
>     Nicolas
> 


