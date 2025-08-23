Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED16CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mw7qDMq4IWv3isIdSX8wUcFvOZfQTQyXCeO+c5P2T+M=; b=th1M3xDQNRKgMnOY642oBkeRzl
	zBXlqWVwn3+CtwEmkFCqp9uS4fgQQlt6Esx1WeYyOmpkYwzeCrot70ixK3ILGVI8mW5PMdRhMlhHa
	4tqtoJiiq4h1dx80AxdyWaRWYsAOE8hX7MEcFk0+XjMBS2BtyvRSPkCzNeH94ndrluqQBsL+ZXU4g
	fNtKgLflaFW6kr8REiLt49fCGdz+5lE/eq4qNEwvQHDXLzACOOY9noYghYlw6TX6+JYktkQ3DPvr8
	Kb6kCj8xfAZ4PXwx5yj4qGudGuvd28Uaiw1zjtaHNuK6vjhbP8jgGcE8HNeQMgbAIY+rbZW6tlfOy
	hol+17ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upu58-00000005FeZ-07Oz;
	Sat, 23 Aug 2025 19:39:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upu1A-00000005FPS-3hAH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 19:35:14 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755977710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mw7qDMq4IWv3isIdSX8wUcFvOZfQTQyXCeO+c5P2T+M=;
	b=kpjjSYAsTSUY3GXZCMttuvjGqpNgxP+ddkVzLzo/ix0+flOM+MxhZ+KsSWkki/X+1aiwlK
	6J0DavZA+6BKF/xQLanEnIvPZVqtj71VOCJYpzPq4cKhoqvB7oH2HSumqbBxYiJSxKDujx
	ZZzUhnGMznWT/EZnIC6pd5giuTQFIe4/dY85Q5ksrhrYCIF9laJtv36kHTCvmLmjXss4TZ
	UdY8IDoF38IXcsZ5MxYzDaOCNBOKs0EiU1b565/PVVzi8AqP8oCfUoRvH/Lf3RXdJrmLZY
	Q3LDWgEnGDM4zErpZrbUlFWWI3b43X6ACV25JKXEBr0YwyV1/gImImVYTVe4MQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755977710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mw7qDMq4IWv3isIdSX8wUcFvOZfQTQyXCeO+c5P2T+M=;
	b=LhBHeOCd5VeYkfaw+9+QtECtxroT5M1Y5XwXSvzEZe/huRteaZZNKHV6o26rJRLLbdzo41
	ReW+aTBm+jypKJBQ==
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
In-Reply-To: <877byt4yub.ffs@tglx>
References: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
 <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
 <62be0896-6c90-4a27-81cb-7bd897d0e6f2@grenoble.cnrs.fr>
 <877byt4yub.ffs@tglx>
Date: Sat, 23 Aug 2025 21:35:09 +0200
Message-ID: <874itx4ys2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_123513_064066_89D7BBC7 
X-CRM114-Status: GOOD (  13.31  )
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

On Sat, Aug 23 2025 at 21:33, Thomas Gleixner wrote:
> On Thu, Aug 14 2025 at 17:28, Edgar Bonet wrote:
>>> I think the conversions in
>>> drivers/irqchip/irq-atmel-aic.c:aic_irq_domain_xlate() and
>>> drivers/irqchip/irq-loongson-liointc.c:liointc_set_type()
>>> are also wrong, and need a similar change.
>
>> The one in irq-atmel-aic.c looks indeed strikingly similar.
>
> Yes. My bad.
>
> I missed the fact, that this can be invoked during early boot when
> interrupts are still disabled. After early boot they are always enabled
> when xlate() is invoked.
>
>> The one in irq-loongson-liointc.c is slightly different
>> though. Instead of:
>>
>>     irq_gc_lock_irqsave() -> guard(raw_spinlock_irq)
>>
>> it does:
>>
>>     irq_gc_lock_irqsave() -> guard(raw_spinlock)
>>
>> I don't know what the implications are though.
>
> That's in the set_type() callback which is always invoked with the
> interrupt decriptor lock held and interrupts disabled, so doing the
> 'save/restore' dance there is pointless.
>
> Can you send a patch for that atmel-aic thing too please?

Nah. Let me just fold it into your patch and be done with it.

