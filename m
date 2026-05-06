Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B772CCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwcx8kzQtEt+MjGxw4HHHvAXvVOas61hy1Z/q1OQ/Ss=; b=af/ugna0kUWuD1XNGo59FV2sFk
	iYW06Cn25S+FEBgYQzkMWH8P/O4NtopsQ3WfJaYojRaEStifzTJRQ0MwOYeeKC0myaLje8ht8OzZ6
	KAQAX088NJ+9dfKFBetYl41jh8VhHHafmExaOFdhezXVFIpmn/P6vWps6HK3CRkkld611DSLxN9ny
	+w6dC3gO4V9HzfIBbhKaETcW+C9w4P4gwAyHjSDROqczpcQgrv7lEQ3TFchY3g2epM3vuyLGUqUkT
	nXBr54poGEcgGOiDCjwSmNdXbjHzcdRJFswQNzUwETCpMyRG5lFUYtNa1KqWlqVDnv8xgogO7bkZ/
	GpcqNcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgZt-00000001j1Q-0EsU;
	Wed, 06 May 2026 18:02:33 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgZr-00000001j0y-3jWm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 18:02:32 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-837cd669be0so2549693b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778090551; x=1778695351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dwcx8kzQtEt+MjGxw4HHHvAXvVOas61hy1Z/q1OQ/Ss=;
        b=ZEXfq7dDYVy2NQz72YjAc7YXZBWQBx/t9D9xaxV+7HiQPQ4viGOZdv7e/hJ1fEdq2J
         hYAHFzPV/xWOeH/ijqUGU94lNs1cNYXr0iyQRCDjAHoNBluSBoXkzVBqGIwIOGNHF6pF
         7TDeRiGmSmr76YGwJxK4ftVBT553zQq4oJnSxPVN4S3Bsa2l7MOScZV4SK+nZ4eNGTNH
         mCuUA8frWunzDGsif9t4ZbYK2ha+tEtimKm9s9IXmXtmz+b03BgvIZLB9OwNxAXsuiam
         xxeZ8xN6A3BR6/3MrwwaPTU1RwogYMcPfc6b2KxI9P+kGFXWxVxY5VZuilay+tGgMTCA
         D1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778090551; x=1778695351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwcx8kzQtEt+MjGxw4HHHvAXvVOas61hy1Z/q1OQ/Ss=;
        b=ciJjn+DdjkZKp6V8mgOZre5us4L86cfwxk6BVXQM9cdWE7tGAbpC88Kg+t8z9b2YNF
         5zj/3n4Ub1/Q1fcm0KKNT02QyMrzgRsNpoIsX7GpXnp6jdaHY+MAy4jY9pJBtjhk/PcR
         b8rYyJgV605v8szpdPOgtIzrGPh9xDqidnYZ9lRYwtwz6qClbbeJGDCmsTL1t0O1hsHo
         y22uhss3JeeKrfIqTWO/p0evpyocR25UCqFRV7MKEbPrETBF6X/4Q6W6WA5KbR/D332c
         rOg4XCQkAU3s9Hzjk6CtSOQAWNzNywsMz5fLU6tWZ8lfBKIbEDBniJr4lfn51Rn2otDu
         xt0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8SXapWIqggJWD1hbWvKQPzy1q75xvjXYG1znpXfY4YFL73fqkPe/dMhIjiZEAYgVKLdbM3D0R5WNjcLENiqcLK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/DLJ4y1Rf/7ddFrxKzhYt+eJbWJvJz4k4FcLSIPbGjm4Z0EoP
	1K5ol6QrLj3C5AmOCwDaX6LPGKvXJroDOtGbsQ5TaCGB3P/cx6QnOOqn
X-Gm-Gg: AeBDies9NyQoZ1KxRh2i2X5GsEIgV39VgjEs5D8xPhgvjVk7EYOm+kGtu25SOSOaDqc
	wn4lDrJGBgTTZgBuKMoFpCe+eBaU52s3wrYNxJgb/4HQTSyJIrTzTQz5YXpVGln3F5NETlt9BZR
	gm7ifYPe3fwQWDmMELMfKSod+a1F62ci6uG2AjCmRxQ5oiq8E0ieAuNcdg7cvxqENLgBzHyScJK
	ymeLTcrZtPWQQmG406Azdh4j9ADTaFfUWou56VY/TbIodIuLQEkg2WoV/Gwf5u6wuE3oVeUUEHM
	imrua0slEAoeqXx0hIZ2nR/HER/pmRucKb2u3o53zv0tn+iNd9ZDiyMldtQ3QGI9z5rEJo/Qo5M
	wrajxdO6tDs0iR2+bfgfRQpN0vih42FSCJ6lgR+4Ztbo+DF16ONJcou5lUlspgR/EssYuTThEVF
	X/vQSm7+CG2tZUM58k5+q5V/d/ShL+xer5aWMZBDwNScY4d86II3th+ACUp42J/8zNcXaCJR8At
	fDHmAwS3RI=
X-Received: by 2002:a05:6a00:2d12:b0:835:6d99:3f94 with SMTP id d2e1a72fcca58-83a5d873770mr4297969b3a.25.1778090550462;
        Wed, 06 May 2026 11:02:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm7687050b3a.3.2026.05.06.11.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:02:29 -0700 (PDT)
Message-ID: <773c47f5-6d88-48d8-a0c5-e18aaec98485@roeck-us.net>
Date: Wed, 6 May 2026 11:02:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
 <02b810ab-12b8-4d44-91c2-ce6bf8ad894f@roeck-us.net>
 <CAD++jLmO935+DC+Bjjo1huipkZ5Nu-y8amMLWCSfX+0atdY9xw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAD++jLmO935+DC+Bjjo1huipkZ5Nu-y8amMLWCSfX+0atdY9xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_110232_259739_E77E8854 
X-CRM114-Status: GOOD (  17.69  )
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

On 5/5/26 14:25, Linus Walleij wrote:
> On Tue, May 5, 2026 at 11:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> I actually stopped testing the integratorcp qemu emulation
>> because it no longer works reliably, not even with gcc 9.x,
>> since the timer-sp804 patches were applied.
>>
>> Given that apparently no one but me ever hit that problem,
>> I wonder if it is time to remove support for that machine entirely.
> 
> I actually have the hardware, even several of them, I've been keeping
> them as a base reference for old 32bit ARM. Ethernet broke on the
> one I had out so I need to bring a new one (yeah, as in factory-new)
> from a box.
> 

If those still worked with recent kernels, it just kind of confirms
that trying to run the integratorcp qemu emulation with a recent kernel
is futile ...

Note: With this patch applied on top of mainline, I get the following
backtrace when trying to boot from qemu.

=============================^M
[ BUG: Invalid wait context ]^M
7.1.0-rc1-00002-gdbd65c72b68b #1 Not tainted^M
-----------------------------^M
swapper/0/1 is trying to lock:^M
c1d25410 (syscon:117:(&syscon_config)->lock){....}-{3:3}, at: regmap_lock_spinlock+0xc/0x18^M
other info that might help us debug this:^M
context-{2:2}^M
1 lock held by swapper/0/1:^M
  #0: c12874b8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x28/0x40^M
stack backtrace:^M
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.1.0-rc1-00002-gdbd65c72b68b #1 PREEMPT ^M
Hardware name: ARM Integrator/CP (Device Tree)^M
Call trace: ^M
  unwind_backtrace from show_stack+0x10/0x18^M
  show_stack from dump_stack_lvl+0x44/0x6c^M
  dump_stack_lvl from __lock_acquire+0x11b0/0x2dbc^M
  __lock_acquire from lock_acquire+0x114/0x3dc^M
  lock_acquire from _raw_spin_lock_irqsave+0x5c/0x7c^M
  _raw_spin_lock_irqsave from regmap_lock_spinlock+0xc/0x18^M
  regmap_lock_spinlock from regmap_read+0x30/0x6c^M
  regmap_read from intcp_read_sched_clock+0x34/0x6c^M
  intcp_read_sched_clock from sched_clock+0x48/0x114^M
  sched_clock from update_rq_clock+0x50/0x2f0^M
  update_rq_clock from sched_tick+0x64/0x32c^M
  sched_tick from update_process_times+0x7c/0x1a8^M
  update_process_times from tick_periodic.constprop.0+0x34/0x134^M
  tick_periodic.constprop.0 from tick_handle_periodic+0x20/0x8c^M
  tick_handle_periodic from sp804_timer_interrupt+0x28/0x38^M
  sp804_timer_interrupt from __handle_irq_event_percpu+0xb8/0x498^M

... and the image hangs randomly.

Guenter


