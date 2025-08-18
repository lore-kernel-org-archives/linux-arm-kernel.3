Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436E8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxQvwWaMlHtmDIk/5Uaxuyq2WHRIQZy/jLZ2tazpre4=; b=A2qECjIIZi/mkTdr7+byBm57+6
	ayXKhABmD+Iw3sw+mY0tDg/K355IDEn1xV78rG6Vn7wY2bCwIg6cSsLasDG+K6q3Cbj1EHfadRbYl
	5oOlELErrjk31BD1qdnp+L49OPPDxdjbVp0pobL98jLXVTmLl/VV8xBRnXc1wtgYtJVXZHkEeMvc4
	KzatzpClLeZ8DRwQe2JsKVdWTwG8dxpbQHK0RvlndNPdYta3Q4BE1I22cYzaVNbPjeYS7RyXNdsIS
	01hLBZ3sZbzoJNHNtRRER03knbBS+SZfbKWb/sp1554Pl45z6qD0xZhSsvILQj7AIqa8LnCcC/U5I
	cEJx5gyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1A0-00000007oDM-3xQS;
	Mon, 18 Aug 2025 14:48:32 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unva1-00000006ysL-49eG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:51:03 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55ZV6vqDz9sVP;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hybM51rxMvV; Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55ZV5jRkz9sVL;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A2A4C8B764;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bcNwoLJxTpMP; Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 715818B763;
	Mon, 18 Aug 2025 10:33:06 +0200 (CEST)
Message-ID: <d085efdd-fe8b-4efa-92e1-34573c55ade5@csgroup.eu>
Date: Mon, 18 Aug 2025 10:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
 <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_015102_192561_89220401 
X-CRM114-Status: GOOD (  20.17  )
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



Le 12/08/2025 à 16:21, Bartosz Golaszewski a écrit :
> On Tue, 12 Aug 2025 13:02:53 +0200, Christophe Leroy
> <christophe.leroy@csgroup.eu> said:
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>
>> Here is an exemple for port B of mpc8323 which has IRQs for
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>> 	qe_pio_b: gpio-controller@1418 {
>> 		#gpio-cells = <2>;
>> 		compatible = "fsl,mpc8323-qe-pario-bank";
>> 		reg = <0x1418 0x18>;
>> 		interrupts = <4 5 6 7>;
>> 		fsl,qe-gpio-irq-mask = <0x01400050>;
>> 		interrupt-parent = <&qepic>;
>> 		gpio-controller;
>> 	};
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
>> index b502377193192..59145652ad850 100644
>> --- a/drivers/soc/fsl/qe/gpio.c
>> +++ b/drivers/soc/fsl/qe/gpio.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/err.h>
>>   #include <linux/io.h>
>>   #include <linux/of.h>
>> +#include <linux/of_irq.h>
>>   #include <linux/gpio/legacy-of-mm-gpiochip.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/gpio/driver.h>
>> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>>
>>   	/* saved_regs used to restore dedicated functions */
>>   	struct qe_pio_regs saved_regs;
>> +
>> +	int irq[32];
>>   };
>>
>>   static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
>> @@ -141,6 +144,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>>   	return 0;
>>   }
>>
>> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
>> +
>> +	return qe_gc->irq[gpio] ? : -ENXIO;
>> +}
>> +
>>   struct qe_pin {
>>   	/*
>>   	 * The qe_gpio_chip name is unfortunate, we should change that to
>> @@ -304,6 +314,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>   	struct qe_gpio_chip *qe_gc;
>>   	struct of_mm_gpio_chip *mm_gc;
>>   	struct gpio_chip *gc;
>> +	u32 mask;
>>
>>   	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
>>   	if (!qe_gc) {
>> @@ -313,6 +324,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>
>>   	spin_lock_init(&qe_gc->lock);
>>
>> +	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {
> 
> AFAICT: you can drop the of.h include and just use
> device_property_present() here.

This line reads the value of the mask, I can't see how it can be 
replaced by device_property_present().

> 
>> +		int i, j;
>> +
>> +		for (i = 0, j = 0; i < 32; i++)
>> +			if (mask & (1 << (31 - i)))
>> +				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
>> +	}
>> +
>>   	mm_gc = &qe_gc->mm_gc;
>>   	gc = &mm_gc->gc;
>>
>> @@ -323,6 +342,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>>   	gc->get = qe_gpio_get;
>>   	gc->set = qe_gpio_set;
>>   	gc->set_multiple = qe_gpio_set_multiple;
>> +	gc->to_irq = qe_gpio_to_irq;
>>
>>   	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>>   	if (!ret)
>> --
>> 2.49.0
>>
>>
> 
> Bart


