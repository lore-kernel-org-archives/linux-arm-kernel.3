Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25121C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RatKvAJcD32MvFcTfJjNC+HdyA4yohSnyhYlOf4tvao=; b=3cGAZuvPBwqwOP+3EmCz/EwBrZ
	CS1CoRW6YAjXUYrNjHmVcFfpJtRHQChMvlXxbrvK4htEMUiBKgW09Gvpmw7Bwgh2UKc8DSDfvaSJs
	cMBecbMZJzAwr6dAZljuJDOgwhfa4hZfwzxBby2KbpZx3PxH1cPPo6vp4o/XF0RjVmk+xCnktk4ES
	ZNEV/oaiJD2zQV6EUhNVI2rXjoCeFBusjA7GASzTnAWDlZd4dWlfEJNFnNkuzScPH2qFyr9fI/hJi
	ghD3eSt5/ja0EAHEGrzDqgIbummJfFB6xcOHs09WeqQNwd0MB2b5r8Ryexqvis49f7fAs2Q6BIgw6
	889RPr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqic-00000001266-033c;
	Fri, 17 Jan 2025 18:05:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqhL-000000011zF-0G1H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:04:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1275309f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 10:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737137037; x=1737741837; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RatKvAJcD32MvFcTfJjNC+HdyA4yohSnyhYlOf4tvao=;
        b=WgfeST/Q232vwPQhJlvHu5b1/nd4DnKq+OZRlwpJN6Jheh0XJxkoyyyG9PXuZovw13
         LVN7CzE0+eHmOGZWe579Z2LYZPcM7GSYuSJDaT7wR/KCWS4ksSCpt8DVxfcK3rAI6Uii
         XRWbCX/IkIV5lKWlabTGl/6XG2IR/2QmFRAhppPrLl2t3K6XFdpMmDBXfBcQdkIs9bXE
         rc4iUQ6egwaQrONKeZ7XDxVgg5xZ3bP8ygB2vAsoFyfvIdjOoi4Y3UHJ+q500m7eiR3U
         P/u7FYPXyG55P/ruCV/2/Hx03XqaAYyKRYC9c9TCGXqFaURMMoNWuPiVjpSWyzVeCGcD
         DPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737137037; x=1737741837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RatKvAJcD32MvFcTfJjNC+HdyA4yohSnyhYlOf4tvao=;
        b=nisW9ixmkT2EDaLWPf/X8scwAVA9ZtskNtSOIx1C+MtTtYSXkul0+4Of8VGq7jaoFX
         Sz438J1KhmVsH86eUylTb0P6oqdyeQhI9XoIRbPRGdDo7iWXIcjMYw8GReFfbw9D8Dl4
         UkJ4JdsXcUYefW/jTQb3ipwGHOFfvhLzpVo6+9Fp2QyfxKvz6fjMOD92eAbTxqbu+zrm
         C2Psnf1mrXKvENwz1NV1CMN3kJrdOaLnQ2sSYOkyZKY/LxPYXP4XqJFqz3MrT77nvzxh
         eOTQ7a8PRdoOFflVtX5fUPu6t7XwbJOlasE+4IOuckRUxBHS3+PYPJY0lW+wcIiig7/X
         FSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMsSZdu0/E6oZwk70CDLsNuelnBM53XNgI1FXhM8f5HWi+R2KMtN7wekuTtk5l4r4y18jBewfXDYQFaAnAdzrE@lists.infradead.org
X-Gm-Message-State: AOJu0YyMnfwvAGB4L4kDFRM0It2n7HxYVFG0c7pTcy45YK4uRkw8cV6u
	mHpH5nB3e5p7rP4o3zZcX2OXmd6OhlIL1hqpadK47avMtSJge2+o
X-Gm-Gg: ASbGncvjn8Z9rA9+xi6+Yr4FQYwTl3kUITYUWF9encFHGzIIqeU97Iuq7IXfieHs83o
	lH/pCiC0a2ix43QBDoHUduiVPsd3UslKLzA86RbtFlVfxHEUucLutaAzGJFs1151pGMJA2tAIzv
	iAgsY1toUmpuqhqC3kCg09jijUwvD5D8qwZZtGkmZG5ShoSqHxcqhDsWpy0JCPZu56MdVXVTeGC
	5beP/fdInzpA1A4Ns+Xw//WF3ZNSxlVNBy+LdsVDi4yWZQRrE9EuJK1
X-Google-Smtp-Source: AGHT+IFNuc0bhE3QCtGngxDAAK7Ch517eRBZhc6hiiQQ+1TBfNiGOINQJUhPKIa3NHjKppEtZfy04A==
X-Received: by 2002:a5d:64a1:0:b0:38a:39ad:3e2f with SMTP id ffacd0b85a97d-38bf565573dmr3662790f8f.2.1737137036896;
        Fri, 17 Jan 2025 10:03:56 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:a17a:6a28:e744:9a06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e118sm3011964f8f.82.2025.01.17.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:03:56 -0800 (PST)
Date: Fri, 17 Jan 2025 19:03:54 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, shivamurthy.shastri@linutronix.de,
	anna-maria@linutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] irqchip/irq-mvebu-icu: Fix irq_set_type for sei and
 nsr
Message-ID: <Z4qbioby2DK2Dddl@eichest-laptop>
References: <20241217111623.92625-1-eichest@gmail.com>
 <87frlkcx2b.ffs@tglx>
 <Z4k-DkMt8XQYs_kf@eichest-laptop>
 <87tt9ya2qy.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt9ya2qy.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_100359_101884_CFD828AF 
X-CRM114-Status: GOOD (  40.65  )
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

On Thu, Jan 16, 2025 at 10:05:25PM +0100, Thomas Gleixner wrote:
> Hi!
> 
> On Thu, Jan 16 2025 at 18:12, Stefan Eichenberger wrote:
> > On Wed, Jan 15, 2025 at 09:15:24AM +0100, Thomas Gleixner wrote:
> >> And looking at the potential platform MSI providers for MVEBU, then it
> >> turns out that GICP and SEI both have the irq_set_type() callback
> >> populated, though ODMI has not. So either this has never worked or there
> >> is something else fishy.
> >> 
> >> Can you please enable CONFIG_GENERIC_IRQ_DEBUGFS, build/boot a 6.10
> >> kernel and provide the output of
> >> 
> >> cat /sys/kernel/debug/irq/irq/$N
> >> 
> >> where $N is the interrupt number of the thermal sensor.
> >> 
> >> Then provide the same information for a current kernel with your patch
> >> applied.
> >
> > You are right I somehow didn't look back far enough. I tested once with
> > kernel 6.12.5 and my patch applied:
> 
> > root@localhost:~# uname -a
> > Linux localhost.localdomain 6.12.5+ #157 SMP PREEMPT Thu Jan 16 17:32:21 CET 2025 aarch64 GNU/Linux
> > root@localhost:~# cat /proc/interrupts |grep thermal
> >  35:          0          0          0          0    AP SEI  18 Level     f06f8000.system-controller:thermal-sensor@80
> >  90:          0          0          0          0  SEI-ICU-SEI-f21e0000.interrupt-controller:inter 116 Edge      f2400000.system-controller:thermal-sensor@70
> >  91:          0          0          0          0  SEI-ICU-SEI-f61e0000.interrupt-controller:inter 116 Edge      f6400000.system-controller:thermal-sensor@70
> > root@localhost:~# cat /sys/kernel/debug/irq/irqs/90
> > handler:  handle_edge_irq
> > device:   f21e0000.interrupt-controller:interrupt-controller@50
> > status:   0x00000000
> > istate:   0x00004000
> > ddepth:   0
> > wdepth:   0
> > dstate:   0x02400204
> >             IRQ_TYPE_LEVEL_HIGH
> >             IRQD_ACTIVATED
> >             IRQD_IRQ_STARTED
> >             IRQD_DEFAULT_TRIGGER_SET
> > node:     -1
> > affinity: 0-3
> > effectiv:
> > domain:  :cp0:config-space@f2000000:interrupt-controller@1e0000:interrupt-controller@50-16
> >  hwirq:   0x74
> >  chip:    SEI-ICU-SEI-f21e0000.interrupt-controller:inter
> >   flags:   0x80
> >              IRQCHIP_SUPPORTS_LEVEL_MSI
> >  parent:
> >     domain:  :ap807:config-space@f0000000:interrupt-controller@3f0200-2
> >      hwirq:   0x0
> >      chip:    CP SEI
> 
> Ok. That explains it. CP SEI has:
> 
> static int mvebu_sei_cp_set_type(struct irq_data *data, unsigned int type)
> {
>         if ((type & IRQ_TYPE_SENSE_MASK) != IRQ_TYPE_EDGE_RISING)
>                 return -EINVAL;
>         return 0;
> }                                                                        
> 
> But the DT configuration requests:
> 
> >             IRQ_TYPE_LEVEL_HIGH
> 
>   IRQ_TYPE_LEVEL_HIGH     = 0x00000004,
> 
> >  genirq: Setting trigger mode 4 for irq 85 failed (irq_chip_set_type_parent+0x0/0x34)
> 
> which is not supported by CP SEI.
> 
> With your patch the type request is just stored in the data, but no
> actual type setting happens. That's default behaviour for chips which do
> not have a set_type() callback.
> 
> > root@localhost:~# cat /sys/kernel/debug/irq/irqs/90
> > handler:  handle_edge_irq
> > device:   (null)
> >
> > It seems with kernel 6.10 the controller device was not set correctly,
> > probably it was ignoring irq_set_type because of this. 
> 
> No. That's not related.
> 
> > Do you by chance have an idea how to properly fix this or should I do
> > some more research?
> 
> It's unclear to me how the 6.10 kernel survives that. Do you have a
> different device tree for those kernels?

I used the same device tree for the 6.10 kernel as I did for kernel
6.12. I didn't even recompile it. Unfortunately, I couldn't figure out
what exactly is different so far. However, on the 6.10 kernel I got the
following trace:
root@localhost:/sys/kernel/tracing# cat trace
# tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 1)               |  devm_request_threaded_irq() {
 1)               |    request_threaded_irq() {
 0)               |      __irq_set_trigger() {
 0)               |        irq_chip_set_type_parent() {
 0)               |          irq_chip_set_type_parent() {
 0)   2.560 us    |            mvebu_sei_cp_set_type(); /* = 0x0 */
 0)   8.640 us    |          } /* irq_chip_set_type_parent = 0x0 */
 0) + 14.400 us   |        } /* irq_chip_set_type_parent = 0x0 */
 0) + 24.320 us   |      } /* __irq_set_trigger = 0x0 */
 0) * 13601.60 us |    } /* request_threaded_irq = 0x0 */
 0) * 13617.44 us |  } /* devm_request_threaded_irq = 0x0 */

It seems that irq_chip_set_type_parent is not failing. By adding some
debug messages to kernel/irq/manage.c I found that irqd_get_trigger_type
returns IRQF_TRIGGER_RISING even though it should return
IRQF_TRIGGER_HIGH according to the device tree. Maybe this was fixed
between 6.10 and 6.12 but I need to analyze that again in more detail.
[   91.069407] genirq: __setup_irq - kernel/irq/manage.c:1530, flags: 0x0
[   91.076042] genirq: __setup_irq - kernel/irq/manage.c:1533, flags: 0x1

For a possible solution, should I just change the device tree so that
IRQF_TRIGGER_RISING is used instead of IRQF_TRIGGER_HIGH?

Regards,
Stefan

