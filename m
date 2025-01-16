Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433A0C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cq17V7TKcOXY8rkVaBXd5FKLy5zi8np6ziTknWTBm3c=; b=1sGcYwibepG6UF6dChKb/ku7El
	I8tkg6ItIbdZXSMvvdiNz2mxAsH3ho5Hc67F0ga2BhqdA4F6JrYpo4kOeougkOHirTKHv5to12psm
	Cp5TAwCri1qW1Il2gPY00dkUrKoz07erqPC7TL6IBIYJtofBIXjdDLqbJH4SmBYd8MSt/T/ENqTL3
	v47ArE54Tqy5ou/w8btImiRsK4bzqvMezSDdEja/lPYwBD7Q8OTddTa0DcvzIDh+ofHQcD6amqMrg
	mjYo3bUjdRBDkAZ6scY79DTWNjC4BlWehIaR/gT+Cvy0Fk2QqogQgPvKPjtK1ujOA1SCML8o6U/D/
	tN1FkHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYX4m-0000000G6RQ-3DLV;
	Thu, 16 Jan 2025 21:06:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYX3R-0000000G6N2-22uW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 21:05:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737061526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cq17V7TKcOXY8rkVaBXd5FKLy5zi8np6ziTknWTBm3c=;
	b=xB4gYf1RlNHjYqtilfa3fbyYulReCNWkuQNzbFZbffQ/m7ZRlq5auWTy03oZy0OS3LIuHY
	S7hCtYIy+aKzWYruSdT6xashJqQ9R0UH01cMJy52BpqGX8e3rN+k8XJqPPpMBI3isSUhrb
	AlTLQEWhyCfPYe6BCHg92jqMMdxjJeIQUlPqpWD8NyzWTC6pLC3iOEp4lHJ43IzmBFNTNf
	hgb2DB6LAzWm4km0eyXNV5Zpnxryiff8ku7fM0m2WV+E8saFj/XEPkYgqCgtFXk2XTcdCr
	JTVuzQqK+zhC2IqvYHaZn7UXzfTkncB6tqQ6V9QppYD7SO1X/p1wUefERjBbQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737061526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cq17V7TKcOXY8rkVaBXd5FKLy5zi8np6ziTknWTBm3c=;
	b=uzCaAeKQlzcGCks1boGfl0TO1bjra6w/9/WkttEJh9QKtQ++StVP0X5eHif5kjb7b7Sz4r
	pv4ZSTpmUMT96bCA==
To: Stefan Eichenberger <eichest@gmail.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, shivamurthy.shastri@linutronix.de,
 anna-maria@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and nsr
In-Reply-To: <Z4k-DkMt8XQYs_kf@eichest-laptop>
References: <20241217111623.92625-1-eichest@gmail.com> <87frlkcx2b.ffs@tglx>
 <Z4k-DkMt8XQYs_kf@eichest-laptop>
Date: Thu, 16 Jan 2025 22:05:25 +0100
Message-ID: <87tt9ya2qy.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_130529_695750_97FA7215 
X-CRM114-Status: GOOD (  21.23  )
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

Hi!

On Thu, Jan 16 2025 at 18:12, Stefan Eichenberger wrote:
> On Wed, Jan 15, 2025 at 09:15:24AM +0100, Thomas Gleixner wrote:
>> And looking at the potential platform MSI providers for MVEBU, then it
>> turns out that GICP and SEI both have the irq_set_type() callback
>> populated, though ODMI has not. So either this has never worked or there
>> is something else fishy.
>> 
>> Can you please enable CONFIG_GENERIC_IRQ_DEBUGFS, build/boot a 6.10
>> kernel and provide the output of
>> 
>> cat /sys/kernel/debug/irq/irq/$N
>> 
>> where $N is the interrupt number of the thermal sensor.
>> 
>> Then provide the same information for a current kernel with your patch
>> applied.
>
> You are right I somehow didn't look back far enough. I tested once with
> kernel 6.12.5 and my patch applied:

> root@localhost:~# uname -a
> Linux localhost.localdomain 6.12.5+ #157 SMP PREEMPT Thu Jan 16 17:32:21 CET 2025 aarch64 GNU/Linux
> root@localhost:~# cat /proc/interrupts |grep thermal
>  35:          0          0          0          0    AP SEI  18 Level     f06f8000.system-controller:thermal-sensor@80
>  90:          0          0          0          0  SEI-ICU-SEI-f21e0000.interrupt-controller:inter 116 Edge      f2400000.system-controller:thermal-sensor@70
>  91:          0          0          0          0  SEI-ICU-SEI-f61e0000.interrupt-controller:inter 116 Edge      f6400000.system-controller:thermal-sensor@70
> root@localhost:~# cat /sys/kernel/debug/irq/irqs/90
> handler:  handle_edge_irq
> device:   f21e0000.interrupt-controller:interrupt-controller@50
> status:   0x00000000
> istate:   0x00004000
> ddepth:   0
> wdepth:   0
> dstate:   0x02400204
>             IRQ_TYPE_LEVEL_HIGH
>             IRQD_ACTIVATED
>             IRQD_IRQ_STARTED
>             IRQD_DEFAULT_TRIGGER_SET
> node:     -1
> affinity: 0-3
> effectiv:
> domain:  :cp0:config-space@f2000000:interrupt-controller@1e0000:interrupt-controller@50-16
>  hwirq:   0x74
>  chip:    SEI-ICU-SEI-f21e0000.interrupt-controller:inter
>   flags:   0x80
>              IRQCHIP_SUPPORTS_LEVEL_MSI
>  parent:
>     domain:  :ap807:config-space@f0000000:interrupt-controller@3f0200-2
>      hwirq:   0x0
>      chip:    CP SEI

Ok. That explains it. CP SEI has:

static int mvebu_sei_cp_set_type(struct irq_data *data, unsigned int type)
{
        if ((type & IRQ_TYPE_SENSE_MASK) != IRQ_TYPE_EDGE_RISING)
                return -EINVAL;
        return 0;
}                                                                        

But the DT configuration requests:

>             IRQ_TYPE_LEVEL_HIGH

  IRQ_TYPE_LEVEL_HIGH     = 0x00000004,

>  genirq: Setting trigger mode 4 for irq 85 failed (irq_chip_set_type_parent+0x0/0x34)

which is not supported by CP SEI.

With your patch the type request is just stored in the data, but no
actual type setting happens. That's default behaviour for chips which do
not have a set_type() callback.

> root@localhost:~# cat /sys/kernel/debug/irq/irqs/90
> handler:  handle_edge_irq
> device:   (null)
>
> It seems with kernel 6.10 the controller device was not set correctly,
> probably it was ignoring irq_set_type because of this. 

No. That's not related.

> Do you by chance have an idea how to properly fix this or should I do
> some more research?

It's unclear to me how the 6.10 kernel survives that. Do you have a
different device tree for those kernels?

Thanks,

        tglx

