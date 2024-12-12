Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8292FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKDQJpTRFu3+KgGxhqTH4mLREYb5/OF2yZ5YcR8q86M=; b=OW8UTrN3A8/AVFIyxoOioRIGBb
	0TZWhG0f1oDGskArDV6dD6qeD/NRJQlbhtlixrMshxzEurkFaWWl7+8UkXegt0oYFyAju9mP/jBY4
	Zir+45g/+VVD0jBlgLE363feLDbl6a+PuWheYbZ6YEal4j13aIF2on5enVFVijTIMjRPH7LNsu0bY
	H2TssSEz5EZMoPJQ04mz7gPM6lRY+ChK7rN76l8XkaDPLCk5X4Qjse7oCDV1+QrNOZSWosGEBl5WH
	2fSmO7I+cf4AGkOvZELmxt9Gcu7mtK9ojkr1TEr8f9RCKRmnLOPTvXs/DcbHgbFwwIgDHCQ8PSyN3
	Pdg+faZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpEY-00000001i10-2Etx;
	Thu, 12 Dec 2024 19:52:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpDR-00000001hrR-12TS;
	Thu, 12 Dec 2024 19:51:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734033074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yKDQJpTRFu3+KgGxhqTH4mLREYb5/OF2yZ5YcR8q86M=;
	b=EwQQl462TwmW12Fa0HrvaDXIO4Vr6mVq7kh76oTpOl6+58IJ2zr9OSR6en9SVBe7n48iqz
	zhtQ2e/Z8f/736P10Y0VQufETsZRK3MpkdN0vf58KJXqtjmebUGdjFir0gy9igmKALcH8l
	G8xx5ZEcbADAeOjONhxC7oy4L5Xumm0GAWn4Ev6JIhEBhjHGpdqKta0ZjO6mUI2SvlwNmb
	bFDgQtONNCdzTWIP4y4oPLsRmipJFFHUPevPVekcN3MdkrcAe2CzuhfE4iMqgoAd2SMykQ
	o1oqKzkpNzggwVFUlJu0k6JYhFhHXcOdZj2BJNYPXfZ6IM9ZBpAnU7t6ojjzQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734033074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yKDQJpTRFu3+KgGxhqTH4mLREYb5/OF2yZ5YcR8q86M=;
	b=nRSIBmKOJsIWm1vKA+byWzwCOqL7uTD6Gwqh/fIzqbH0RwijulwepNUt7Ucc75lS3yjWOc
	GawF7JcNeJdOrwAA==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
In-Reply-To: <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
 <87r06gq2di.ffs@tglx>
 <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
Date: Thu, 12 Dec 2024 20:51:13 +0100
Message-ID: <877c84ade6.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_115117_426004_3A54B311 
X-CRM114-Status: GOOD (  12.62  )
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

On Thu, Dec 12 2024 at 22:11, Anup Patel wrote:
>> --- a/kernel/irq/chip.c
>> +++ b/kernel/irq/chip.c
>> @@ -47,6 +47,13 @@ int irq_set_chip(unsigned int irq, const
>>                 return -EINVAL;
>>
>>         desc->irq_data.chip = (struct irq_chip *)(chip ?: &no_irq_chip);
>> +
>> +       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) {
>> +               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
>> +                       irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +               else
>> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +       }
>
> We need similar changes in irq_domain_set_hwirq_and_chip()
> because we use IRQ_DOMAIN_HIERARCHY in RISC-V.

Grr, you are right. Let me add that to the base patch.

>>         irq_put_desc_unlock(desc, flags);
>>         /*
>>          * For !CONFIG_SPARSE_IRQ make the irq show up in
>> @@ -1114,16 +1121,21 @@ void irq_modify_status(unsigned int irq,
>>         trigger = irqd_get_trigger_type(&desc->irq_data);
>>
>>         irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
>> -                  IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
>> +                  IRQD_TRIGGER_MASK | IRQD_LEVEL);
>>         if (irq_settings_has_no_balance_set(desc))
>>                 irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>>         if (irq_settings_is_per_cpu(desc))
>>                 irqd_set(&desc->irq_data, IRQD_PER_CPU);
>> -       if (irq_settings_can_move_pcntxt(desc))
>> -               irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>>         if (irq_settings_is_level(desc))
>>                 irqd_set(&desc->irq_data, IRQD_LEVEL);
>>
>> +       /* Keep this around until x86 is converted over */
>> +       if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
>> +               irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +               if (irq_settings_can_move_pcntxt(desc))
>> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>> +       }
>> +
>
> These changes in irq_modify_status() need to be dropped to support
> the above changes in irq_domain_set_hwirq_and_chip().

Why? With CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS enabled this hunk is
compiled out. So nothing is modifying PCNTXT here. That's the whole
point.

Thanks,

        tglx



