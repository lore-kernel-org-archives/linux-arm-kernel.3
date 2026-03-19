Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCE01090253
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tosmS1K+wCI+SplCeVdx/MgoVRI8vvv6FqforZSsTo=; b=UWxfEc/odcqpICxO+GbGehfxK9
	xdY5+5q0oXLbFPLBCFQgPxoFtqvUH4G28sp143/CBX1U4fqYnz0Ia/SPseh5Ltc9PUkMbVVcMbb+8
	3iiCj241oOucfoiZ68FZWyAM8NpSL38zQVnQlvGybYSupNPxluGXV1X+1sRfNevRcJTWzUnMMIt2h
	vpcJI04lvUxFo9EquiNKgVizE8fEYG8gsSyb6vmeCoPeYqXArrPkaD6Cv8RT42N2mxCTjzm01euYD
	JeLApXHDb4mv4F5LBA01jFoi63fgfVnNux88UqquYOHaU4q9s8Fij3a1AhdAvnfqTE5YnZqIc6uj3
	rA3MeNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GeY-0000000B7dw-0GVw;
	Thu, 19 Mar 2026 16:55:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GeW-0000000B7dU-1drh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:55:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A156216F2;
	Thu, 19 Mar 2026 09:55:09 -0700 (PDT)
Received: from [10.57.84.77] (unknown [10.57.84.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B6E53F7BD;
	Thu, 19 Mar 2026 09:55:13 -0700 (PDT)
Message-ID: <de634edc-0fc6-4a32-b0f9-77d87df2bbb3@arm.com>
Date: Thu, 19 Mar 2026 17:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: wens@kernel.org, Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
 <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
 <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v65c7A7V05ih-GkHxs1tik892Fgt8HhT49_2xHeL91Sh_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_095520_550567_255BD466 
X-CRM114-Status: GOOD (  22.30  )
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

Hi Michal,

thanks for the very quick turnaround!

On 3/19/26 17:44, Chen-Yu Tsai wrote:
> On Fri, Mar 20, 2026 at 12:10 AM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
>>
>> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>>
>> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
>> is in unitialized state.
> 
>          ^ uninitialized
> 
>>
>> Solution is to set pinmux to GPIO INPUT in
>> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
>> earlier.
>>
>> Tested on Orange Pi Zero 3.
>>
>> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>> ---
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++++++++++
>>   drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> index 685b79fc0bf8..321ee97f5745 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
>> @@ -1092,13 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
>>   {
>>          struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
>>          struct sunxi_desc_function *func;
>> +       unsigned int offset;
>> +       u32 reg, shift, mask;
>> +       u8 muxval;
>>          int ret;
>> +       bool is_new_layout;
>> +       bool is_reset_mux;
>>
>>          func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
>>                                          pctl->irq_array[d->hwirq], "irq");
>>          if (!func)
>>                  return -EINVAL;
>>
>> +       offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
>> +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
>> +       muxval = (readl(pctl->membase + reg) & mask) >> shift;
>> +
>> +       /* Change muxing to GPIO INPUT mode if at reset value */
>> +       is_new_layout = pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT;
> 
> You would want
> 
>      !!(pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
> 
> here to normalize it to a bool value. This is quite common in kernel code.

The whole expression above is a bit cumbersome (though correct). And 
since is_reset_mux isn't really needed, I'd suggest something like:

	u8 disabled_mux;
....
	if (pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
		disabled_mux = SUN4I_FUNC_DISABLED_NEW;
	else
		disabled_mux = SUN4I_FUNC_DISABLED_OLD;
	if (muxval == disabled_mux)
....

But yeah, in general this was what I had in mind.

Cheers,
Andre


	
> 
>> +       is_reset_mux = (!is_new_layout && muxval == SUN4I_FUNC_DISABLED_OLD) ||
>> +                      (is_new_layout && muxval == SUN4I_FUNC_DISABLED_NEW);
>> +
>> +       if (is_reset_mux) {
>> +               sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
>> +                             SUN4I_FUNC_INPUT);
>> +       }
> 
> Nit: the curly braces aren't needed.
> 
>> +
>>          ret = gpiochip_lock_as_irq(pctl->chip,
>>                          pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
> 
> Nit: you probably want to replace this with "offset" as well.
> 
> 
> Just minor issues, otherwise
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> 
>>          if (ret) {
>> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> index 22bffac1c3f0..0daf7600e2fb 100644
>> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
>> @@ -86,6 +86,8 @@
>>
>>   #define SUN4I_FUNC_INPUT       0
>>   #define SUN4I_FUNC_IRQ         6
>> +#define SUN4I_FUNC_DISABLED_OLD 7
>> +#define SUN4I_FUNC_DISABLED_NEW 15
>>
>>   #define SUNXI_PINCTRL_VARIANT_MASK     GENMASK(7, 0)
>>   #define SUNXI_PINCTRL_NEW_REG_LAYOUT   BIT(8)
>>
>> --
>> 2.43.0
>>
>>
> 


