Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEDFF54AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFRqlxeeyykhaJI/khL2v43cZNHelaq/AadAUzt7MIY=; b=gb9aUq3+BtABsU1m9oqNQM+yd4
	LodeWhjP3PuOCqjwbxhDGv3aI4cAY9rPHSBcBPUJ+E78YEvzWaEaHyZ5kxJCBVYy4ixYQV/561lN4
	y9GnDewgKxe98bymMBbUfFj/bC8a573dOwJf7XNlr4xplKLF8/hzXwtatLonu1anYyJWutxnelbkm
	Kly/gl/rdHqRe1HAWxo0o6UlO0ik2QMxfP8edZ/tWRVh8lCAeEG43Y/0PlGxY8xNoH79mhCjoFEGR
	wtA7VSQNhGhWibPZQxP/ZeRuA2MG8XdyYKhlqS1AoBjv8GBIVA0nTqqEMAX6yd01L1Wog3o5OKyht
	Cky3k5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52ej-00000001dBl-3bJI;
	Tue, 24 Mar 2026 14:22:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52eh-00000001dBH-1kST
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 14:22:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9713E1476;
	Tue, 24 Mar 2026 07:22:42 -0700 (PDT)
Received: from [10.1.39.145] (e142021.arm.com [10.1.39.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAA9E3F915;
	Tue, 24 Mar 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774362168; bh=BRixHAQA2z9Hj9TZCLXffWZs4Yn9gMucoyh7Xwxggps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HsoDCgbG9zB/ghH2tlXyXDN06ILn05wImehmd9AjdFed04GolZiQso8LbleM54Svg
	 HkL2jQE9Qs899fjFiF0e2Fw8s/9ffOWSsaXf7E5meEhDw7uY+GtTkDsgZoBw5Rt1lb
	 iCwtI+z1wumxYBndEENICdwRcA27ceLzc+2oJXIc=
Message-ID: <6ae6d412-84c0-402b-bb25-bad98e97969f@arm.com>
Date: Tue, 24 Mar 2026 14:22:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] pinctrl: sunxi: a523: add missing IRQ bank (plus old
 DT workaround)
To: wens@kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260323110151.2352832-1-andre.przywara@arm.com>
 <20260323110151.2352832-6-andre.przywara@arm.com>
 <CAGb2v648WLXK9KjXcCRKy_mQGMkn8mhxKHSukh-WC4i=sXZGbg@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v648WLXK9KjXcCRKy_mQGMkn8mhxKHSukh-WC4i=sXZGbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_072251_655999_36569280 
X-CRM114-Status: GOOD (  32.00  )
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

Hi Chen-Yu,

many thanks for having a look!

On 3/23/26 18:41, Chen-Yu Tsai wrote:
> On Mon, Mar 23, 2026 at 7:02 PM Andre Przywara <andre.przywara@arm.com> wrote:
>>
>> The Allwinner A532 SoC implements 10 GPIO banks, each of which is
>> interrupt capable. However the first bank (PortA) is skipped, so the
>> indicies of those banks range from 1 to 10, not 0 to 9.
>> We described the skipped bank correctly, but missed that for the IRQ
>> banks, where we rely on the IRQ bank index to be aligned with the MMIO
>> register offset, starting at 0x200.
>>
>> Correct that by increasing the number of IRQ banks to 11, to cover both
>> the first skipped one, but also the last one (PortK). This fixes a bug
>> where the interrupt numbers would be off-by-one, due to that
>> mis-enumeration.
>> The big caveat is that now old DTs break the kernel, since they only
>> provide 10 interrupts, and the driver bails out entirely due to the last
>> missing one. So add a workaround for this particular case, where we
>> detect the requirement for 11 banks, but only 10 interrupts provided,
>> and continue with 10 IRQs, albeit emitting a warning about a DT update.
>> This would still be broken in terms of interrupt assignment, but it was
>> broken the whole time before, so it's not a regression.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c |  2 +-
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 22 +++++++++++++--------
>>   2 files changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
>> index b6f78f1f30ac..a1d157de53d2 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
>> @@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
>>   /*       PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>>          {  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
>>
>> -static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
>> +static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
> 
> Actually you don't even need this, since this is a linear mapping.
> 
>  From sunxi_irq_hw_bank_num():
> 
>      if (!desc->irq_bank_map)
>              return bank;
>      else
>              return desc->irq_bank_map[bank];

Yeah, I was wondering about that as well, and there are other cases were 
we wouldn't need the map, espeically in the PRMC pinctrl instances. I 
might add a separate patch for that.

>>   static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
>>   /*       PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> index 6a86b7989b25..ffee79397590 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/irqdomain.h>
>>   #include <linux/of.h>
>>   #include <linux/of_clk.h>
>> +#include <linux/of_irq.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/slab.h>
>> @@ -1582,6 +1583,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>          struct sunxi_pinctrl *pctl;
>>          struct pinmux_ops *pmxops;
>>          int i, ret, last_pin, pin_idx;
>> +       int num_irq_banks;
>>          struct clk *clk;
>>
>>          pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
>> @@ -1715,16 +1717,20 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>                  goto gpiochip_error;
>>          }
>>
>> -       pctl->irq = devm_kcalloc(&pdev->dev,
>> -                                pctl->desc->irq_banks,
>> -                                sizeof(*pctl->irq),
>> -                                GFP_KERNEL);
>> +       num_irq_banks = pctl->desc->irq_banks;
>> +       /* Workaround for old A523 DT, exposing one less interrupt. */
>> +       if (num_irq_banks == 11 && of_irq_count(node) < 11) {
>> +               num_irq_banks = 10;
>> +               pr_warn("Not enough PIO interrupts, please update your DT!\n");
>> +       }
> 
> I would probably make the check universal, and also use dev_warn().
> 
>      num_irq_banks = of_irq_count(node);
>      if (num_irq_banks != pctrl->desc->irq_banks) {
>          dev_warn(&pdev->dev, "Incorrect number of PIO interrupts,
> please update your DT!\n");
>          num_irq_banks = min(num_irq_banks, pctrl->desc->irq_banks);
>      }

Ah, nice one, that's of course much better. But I see that there is 
other code using desc->irq_banks, and if the array allocation is 
different, that will not end well. I will check how we can use 
num_irq_banks there as well.

Thanks!
Andre



> 
> Otherwise,
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> 
> 
>> +       pctl->irq = devm_kcalloc(&pdev->dev, num_irq_banks,
>> +                                sizeof(*pctl->irq), GFP_KERNEL);
>>          if (!pctl->irq) {
>>                  ret = -ENOMEM;
>>                  goto gpiochip_error;
>>          }
>>
>> -       for (i = 0; i < pctl->desc->irq_banks; i++) {
>> +       for (i = 0; i < num_irq_banks; i++) {
>>                  pctl->irq[i] = platform_get_irq(pdev, i);
>>                  if (pctl->irq[i] < 0) {
>>                          ret = pctl->irq[i];
>> @@ -1733,7 +1739,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>          }
>>
>>          pctl->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev),
>> -                                               pctl->desc->irq_banks * IRQ_PER_BANK,
>> +                                               num_irq_banks * IRQ_PER_BANK,
>>                                                  &sunxi_pinctrl_irq_domain_ops, pctl);
>>          if (!pctl->domain) {
>>                  dev_err(&pdev->dev, "Couldn't register IRQ domain\n");
>> @@ -1741,7 +1747,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>                  goto gpiochip_error;
>>          }
>>
>> -       for (i = 0; i < (pctl->desc->irq_banks * IRQ_PER_BANK); i++) {
>> +       for (i = 0; i < (num_irq_banks * IRQ_PER_BANK); i++) {
>>                  int irqno = irq_create_mapping(pctl->domain, i);
>>
>>                  irq_set_lockdep_class(irqno, &sunxi_pinctrl_irq_lock_class,
>> @@ -1751,7 +1757,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
>>                  irq_set_chip_data(irqno, pctl);
>>          }
>>
>> -       for (i = 0; i < pctl->desc->irq_banks; i++) {
>> +       for (i = 0; i < num_irq_banks; i++) {
>>                  /* Mask and clear all IRQs before registering a handler */
>>                  writel(0, pctl->membase +
>>                            sunxi_irq_ctrl_reg_from_bank(pctl->desc, i));
>> --
>> 2.43.0
>>
>>


