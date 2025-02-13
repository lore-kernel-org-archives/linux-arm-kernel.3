Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA920C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BA4Rrz13yIvgpUnDYRiUiQn6eNCsiZnBZO/XX9ez/vw=; b=E+04+eIhDs5YDze3gt6bjr1sIM
	Yi9itz+0lDKRqeAGWR+xtiN0/tIZOycErqTzQo8CPZLWEC/vLDRSXWBE529ytC+VDtufY96oMpsxP
	8O9YJTb84EkVFSysktdYupBi53SkxjB8qi6CyBNycR7yjq7dskZGaYuQBL57K5REIssH8ySQCULn0
	kteiZKcBegUpHxlWYsIaQn5NSC+nAPzUKoFMthKHTVOHkPSL2rnME9tHPY0bULNMpFS7r2+WB5mwt
	u2PQQ/s4UFz9TRnmeu5cKA5xpcssbkIXgEyFn+IeKd+T3dsXs1Y1cdb+H53/aJd8evFbvXdobzpdz
	N5fg1xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXaP-0000000AtVZ-1hoK;
	Thu, 13 Feb 2025 11:40:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXYy-0000000At9q-0Ihh;
	Thu, 13 Feb 2025 11:39:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739446761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BA4Rrz13yIvgpUnDYRiUiQn6eNCsiZnBZO/XX9ez/vw=;
	b=Y7JnLtuqeGi0rmpxv/vPGQORRne7WWYG8Nl9lt0zUfE0AtlFVTrlYLco4+gwrSa4T/udny
	sdVjF3BoP51h3fU+3huj2IGTdvA7fUI4AB+Ubve+pXXudLG2O+Uu/OD7LENer5x2XsPhuo
	X7qf9gFnCvRtDBJXCVj3KZY9fTJnpdvSZO5k7hIgyMDXAlBTI2h/KMrjx2Cy32AO7a+nR+
	n/MlV/ID0vKF92mrKH+D7UiYJ07Wu3x3zTTtlxfLNZFhr/c4+nBxTArOiZKQwem4BX31BW
	k4Yy3J1kqpfIhhAyv5vW5xn/2b/rUct9zPfS5x6w7KkZaAUuPGVWIsNBWaLWyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739446761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BA4Rrz13yIvgpUnDYRiUiQn6eNCsiZnBZO/XX9ez/vw=;
	b=pyXptmk6f4o5MyrZck6ChWgS+VS+YZIexkO70mru2gCXgb+M0EOct+hRlwQoOGWGl6zsf4
	zWHi8vQeC42cOXCg==
To: Bo Ye <bo.ye@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dicken.ding@mediatek.com, hanks.chen@mediatek.com,
 xiujuan.tan@mediatek.co, Bosser Ye <bo.ye@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] genirq: clear IRQS_PENDING in irq descriptor
In-Reply-To: <20250211023040.180330-1-bo.ye@mediatek.com>
References: <20250211023040.180330-1-bo.ye@mediatek.com>
Date: Thu, 13 Feb 2025 12:39:21 +0100
Message-ID: <871pw2kr9y.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_033924_257274_514B7674 
X-CRM114-Status: GOOD (  15.20  )
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

On Tue, Feb 11 2025 at 10:30, Bo Ye wrote:
> In the kernel-6.6 IRQ subsystem, there is a case of IRQ retrigger:

How is kernel 6.6 relevant here?

> Due to the possibility of electrical signal glitches causing false
> interrupts for edge-triggered type IRQs, it is necessary to clear any
> potential false interrupts or re-triggered interrupt signals from the
> interrupt source between disabling and enabling the edge-triggered
> IRQ.

This claim is just wrong.

A disable_irq(); enable_irq(); sequence must preserve the pending bit so
that interrupts do not get lost. The lazy disabling mechanism is there
to guarantee that.

> When the module using this IRQ may disable the IRQ as needed and then
> If the disabled IRQ is triggered, the IRQ subsystem will set the
> istate of the corresponding IRQ descriptor to pending.

Rightfully so.

> After the module using this IRQ completes other tasks, it clears the
> pending state on the GIC using irq_set_irqchip_state().

So this is a problem related to a specific out of tree driver and the
GIC, right? 

> However, the pending state in the IRQ descriptor's istate is not
> cleared, which leads to the module receiving the IRQ again after
> enabling it, even though the interrupt source has not triggered,
> because the IRQ subsystem retriggers the interrupt based on the
> pending state in the IRQ descriptor.

What's the actual problem here? A driver has to be able to handle
spurious interrupts at any given time.

> Solution: the corresponding upstream patch modifies the
> irq_set_irqchip_state(...) in the IRQ subsystem.

Which corresponding upstream patch?

> The purpose is to clear the pending state in the IRQ descriptor's
> istate when successfully clearing the corresponding IRQ on the GIC.

Sure that's the purpose, but you fail to explain the actual problem and
the interaction with irq_set_irqchip_state().

Thanks,

        tglx

