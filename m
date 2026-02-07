Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F6BEE0ADC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7mw2REIi5YvReIN1++C/n4doj/HVhTauIRAe2doeMY=; b=1Hqks3ZYL6R5bFsAwwYaMZslHy
	8jNDrbb8it2abInYPLCHD9bB57/Aaye5gvsdH3EWjucR7rRO7HAcCpfj+zawtE23SJq6BB4TBGSl0
	ZHUdwcu1bVyK9ywy5WnePrFS4JysjzjGknTdyy5Oe1gQwQu7cHv3exyDyTWQtUKAjUOmR70tnSxVL
	lKDWxg7CvibbuT8JdGL7wrNLPAOddfj66E3rDmegWd5zOPbD63QxkaXg0ietvB/gH6rQJBcrLiZmy
	JgDmX9Ek1gsxfBGkD1Dt4Dp4TOfr+p2PHlfX5gfOT6sOjCdgQgfuezYW9S+wctBzGCQxFSAIagZ+x
	XMv/amnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vohcF-0000000CRQ4-0mnj;
	Sat, 07 Feb 2026 12:40:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vohcD-0000000CRPb-11hs;
	Sat, 07 Feb 2026 12:40:46 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770468039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7mw2REIi5YvReIN1++C/n4doj/HVhTauIRAe2doeMY=;
	b=IHUEfbEs7jatAyG0QJUXYH7tn0JLEYfYurUxGzjGRBE5e/M9QAME/qZ7DMNVU5XfxXe65N
	f9JmkBPSVMEEpywPQHJlcAHkoea0xia8FeK1YwmlHfg5SM/Q69haYUN/oIIUq+Y8TIifmg
	O1e3UdPaw/6WwgB9BH2nDW+Vv8ZvdQ/NXAoAZ9GOBi1KpVg7uenYmJ+o77Dm4KJYRxK0a2
	hD3R0XP6AmRTUpJIa+Fer1KHRIazZqiquew3rMZdN9FUwaTMu4Zwy0B3g2rFqAi8JxlzDr
	YYYivOb1WjwDFuNz/lLzSxgeOyDgRBipZqqfA/B5NakR621s/EYifdFxOZzDZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770468039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7mw2REIi5YvReIN1++C/n4doj/HVhTauIRAe2doeMY=;
	b=QRPaRJuX/plnEzL6PBt2E45uECSGwK6YLL3plNVB/bNviWky8Y5y7+9Uu94qN9CMnFSj6E
	XRbiA86rYYsGjXAA==
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 2/4] irqchip/ast2700-intcx: Add AST2700 INTC0/INTC1 support
In-Reply-To: <TY2PPF5CB9A1BE6CC5EEC90EBF13B083D1EF267A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
 <20260205-irqchip-v1-2-b0310e06c087@aspeedtech.com> <87h5ru14xx.ffs@tglx>
 <TY2PPF5CB9A1BE6CC5EEC90EBF13B083D1EF267A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Date: Sat, 07 Feb 2026 13:40:38 +0100
Message-ID: <87sebczpyx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_044045_461588_460660D7 
X-CRM114-Status: GOOD (  10.16  )
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

On Sat, Feb 07 2026 at 03:50, Ryan Chen wrote:
>> -----Original Message-----
>> From: Thomas Gleixner <tglx@linutronix.de>
>> Sent: Friday, February 6, 2026 7:34 PM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Rob Herring <robh@kernel.org>;
>> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Joel Stanley <joel@jms.id.au>; Andrew Jeffery
>> <andrew@codeconstruct.com.au>; Paul Walmsley <pjw@kernel.org>; Palmer
>> Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>;
>> Alexandre Ghiti <alex@ghiti.fr>
>> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-aspeed@lists.ozlabs.org;
>> linux-riscv@lists.infradead.org; Ryan Chen <ryan_chen@aspeedtech.com>
>> Subject: Re: [PATCH 2/4] irqchip/ast2700-intcx: Add AST2700 INTC0/INTC1
>> support

Please fix your email client to not copy all mail headers. If you can't
fix it, remove them manually and replace it with the usual:

On Fri, Feb 06 2026 at ...., Thomas Gleixner wrote:
>> > +	guard(raw_spinlock_irqsave)(&intc0->intc_lock);
>> 
>> s/_irqsave// Interrupts are disabled when this is invoked.
> Sorry, do you mean when this function been call.
> Ther have desc->lock to do the raw_spin_lock_irqsave.

The core always holds irq_desc::lock with interrupts disabled when it
invokes those irqchip callbacks. So trying to disable interrupts in them
again is a pointless exercise.



