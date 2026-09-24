Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1C7C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mz1zAfbdgLMlTpPSTC2s+r3ackw98q6OqF4ufc8tI0=; b=O3lZXBlr0jffKNsBvSHgDckvWS
	pfp96ZID8jdnL5HXz4W806XjXqROqC7f+VUC6aHf3fntQF3w0wBEMiovbFbDGXOhgCuaFIC9Gr1kN
	AsRZEG2aOVGwZLLG0cyphr3Uz1K4fGtTQ4XCNkzCPYEtDZ0NrwEPPGyXiWX78cEffbY2zWBpBcbdT
	ipCg2AIUBjAAxFTuaU73ecXgKIeQHeIZeLKE79LpBOm+DWOLIiFbtFGpmkFOZiWOh0zwuozcYESbB
	ZSo6tCtNjrFarVicMYo5DG2of5X9QboAWfEke9mQIV0Pp1Wau2Dc7JRlta7EdD/AuvqYCesxrQmlT
	01YmVYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fJV-0000000AWnG-0s4H;
	Thu, 24 Sep 2026 09:00:21 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fJS-0000000AWmE-4C7p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:00:20 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-484366874b0so1131932f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790240416; x=1790845216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3mz1zAfbdgLMlTpPSTC2s+r3ackw98q6OqF4ufc8tI0=;
        b=V2VYQDcftJoSQ7usI1R+truXoS88wUlijMr2bGdIBdCxK07f12CDbFFERlQQ9NLzEg
         Xj7TLgq+cF+O2n5Ej3sI9A7vwA4N9/sHBF4KX/GyRQY6l8d3pTjME2MEm4V6/6dQ2VgA
         p1RLqHiKeAtKp0fy5xumVTeg/V0+LHG4vcWI14bhP0QBRep8Y3gm+GMLOABL4XUMyJlJ
         OAuqkVUNbGBl7D1ihs6cbLBz1Dhgsbx+jKO93ofN0oqggdqH4xbRqUfGub2Rbm2ZCJev
         PvlvX8m09SdeD3JL4ynph+aYxwcSnxMaVOJcpUF0FfpJ6aYT5UKwvArW0+dnjRdd1Www
         xBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240416; x=1790845216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mz1zAfbdgLMlTpPSTC2s+r3ackw98q6OqF4ufc8tI0=;
        b=tygb7/516MKFTSbUFLrhSl1iU1CJG+ezutze/EpWOl3Qak1GLtJxUve4i7K0FvpDPe
         BPVEFtKTajU5tBQHc5EW9K/sHsHOFoRNS410ywqUOKAJTmCo+SlrBtqxPHIsMH0rxmNq
         2HU7Ynufx86UX6rRJe/jjqKd6M8r/hdwXR8MIIfpjX34vN8/UxALhuRespExtfX1LD5H
         ndAY7tmIpkvwbpnO5I4C47weIWr4ijKZK+njgaVn5IAgDq4k3e1zmQxS4z4k7agMQ9cF
         5oicnD9JIPC3zpcxgYjt+FYFJe6xVGxIzYDjrueegkPcWF/weimCYOo9mAKFntgGStpd
         yMEA==
X-Forwarded-Encrypted: i=1; AKwUvBwJnRPd/6iyensnpo1kxL+rMIfsYhxUXlyrhOrybllZOg6rlpPni31VLiav2VDn5UNoeu7Gri0BbggAgEzraKII@lists.infradead.org
X-Gm-Message-State: AFuF++kDLOsFoGyTKXcvFuBhfMMSzYvUxdvhBIYJAiLZxOog5AvDBFtj
	tFtbLIRQO0WD3r6iqljc4Qr3SqsnKCcW9jMXonKNDVwFUKO2+6N92vNp+9ZOnQt4u0s=
X-Gm-Gg: AYBFou1j4a2yFXH8bT2K4V45tZrzXp24ktUaCU9NEVu22mwsl92Oo+2yCzSakPCSWXO
	NetSYcKQmsFe35OgzYz1zYNARAngVWONq/8RMUY7kNvKTLajRLpUeqrkuse3/lDn9JvxMqUir5H
	1F06k1Ebo796sRmqolP9cJj0KxZisNfoTt/44Br7fc/M6mt0nljMAZIlfOMACyp1lPbwv5/wLO1
	yDSDx5TMGg4n1kIniu9vymrSm9Q/qPuCaBi84N4NHsykSt+9klRFyJloX3FvD2fQCiLww7LUz1O
	4wJg0kkrhszK7ZRHH1W5t5C+fPcHLQulzXhOvmE6ABrxOwN/I6ORAqDfLom+Z6P0aRtXpX8HpJv
	g15467OWWVD+FwIv/LjvDvjTdt8ARNtQ7GtG9RdFHAhoMValJmqGj8pKNyKNH6nP0JZNTUzq1nT
	jSwRGRNbO26IoAJVVWX+ziYQc3bXLomqTSwANkwouugC3UiGzEQGTVuwzN+pcfbND67v4KScM=
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr2905347f8f.27.1790240415781;
        Thu, 24 Sep 2026 02:00:15 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682676c7sm12445415f8f.3.2026.09.24.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:00:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 24 Sep 2026 11:03:56 +0200
To: Marc Zyngier <maz@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: smp: Signal EOI after handling IPI_CPU_STOP*
Message-ID: <arTnfHPBf2qLDLOT@apocalypse>
References: <20260922140109.12780-1-andrea.porta@suse.com>
 <arPzNkDD69ZKFT99@willie-the-truck>
 <86se2z4yje.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86se2z4yje.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_020019_088856_D1A66BF4 
X-CRM114-Status: GOOD (  53.72  )
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

Hi Will and Marc,

On 19:23 Wed 23 Sep     , Marc Zyngier wrote:
> On Wed, 23 Sep 2026 16:41:42 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > [+Marc]
> > 
> > On Tue, Sep 22, 2026 at 04:01:09PM +0200, Andrea della Porta wrote:
> > > On kdump/kexec, the boot CPU triggers an IPI_CPU_STOP (and subsequently
> > > an IPI_CPU_STOP_NMI if the first one does not respond) to the secondary
> > > CPUs, and the IPI handler eventually calls the firmware to shut down
> > > each CPU. Since the IPI is never acknowledged via EOI, the interrupt
> > > remains in an active state when the CPU goes idle.
> > > 
> > > In a virtualized environment, if the hypervisor does not reset the
> > > interrupt state, this causes the crashkernel (with cmdline option
> > > maxcpus > 1) to be unable to synchronize between the boot CPU and
> > > secondary CPUs via IPI_CALL_FUNC, leading the kernel to wait indefinitely
> > > for the CPUs to respond. This has been observed with the Hyper-V
> > > implementation.
> > 
> > Hmm, how is this different from panic()ing inside an interrupt
> > handler?

It is not, in fact I should have put the EOI in all cases, but I just
focused on the crash driver by IPI only. The patch should be extended
but from the following discussion it does not seem relevant anymore.

> 
> Also, what is the architectural requirement for the hypervisor to do
> *anything* on the state of the interrupts? This doesn't happen on HW,
> and there is no reason to impose this on a hypervisor either.
> 
> The expectations are that the guest kernel should reset the interrupt
> state on boot, and it feels that this is missing somehow, see below.

Ack.

> 
> > 
> > > Both the Linux kernel and the Hyper-V firmware appear to violate the
> > > PSCI specification:
> > > 
> > > - The PSCI spec states that the OS kernel must migrate any interrupt away
> > > from the CPU that is about to be shut down via CPU_OFF, which by extension
> > > implies that no active interrupts are allowed. The kernel does not
> > > currently do this in the kdump crash path.
> 
> No. This is strictly about affinity, nothing else. It is there so that
> global devices can continue to have their interrupts handled. This
> evidently can't affect CPU-local interrupts.

Noted.

> 
> > > 
> > > - The PSCI spec also states that the PSCI firmware must reset the CPU
> > > registers to their default values when turning on a CPU via the CPU_ON
> > > command.
> 
> CPU registers. Not external peripherals such as the GIC.

True. Those are distributor related.

> 
> > > 
> > > Fixing this on the kernel side has the advantage of being
> > > hypervisor-agnostic.
> > > 
> > > Signal EOI at the end of the crash handler to prevent the subsequent
> > > crashkernel from hanging.
> > > 
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > ---
> > >  arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > > index a61dc3016a117..cc7f3261fe537 100644
> > > --- a/arch/arm64/kernel/smp.c
> > > +++ b/arch/arm64/kernel/smp.c
> > > @@ -988,6 +988,27 @@ void kgdb_roundup_cpus(void)
> > >  }
> > >  #endif
> > >  
> > > +static void ipi_eoi(int ipinr)
> > > +{
> > > +	unsigned int cpu = smp_processor_id();
> > > +	struct irq_desc *desc;
> > > +	struct irq_chip *chip;
> > > +	struct irq_data *d;
> > > +
> > > +	if (ipinr >= MAX_IPI)
> > > +		return;
> > > +
> > > +	desc = get_ipi_desc(cpu, ipinr);
> > > +
> > > +	if (desc) {
> > > +		chip = irq_desc_get_chip(desc);
> > > +		d = irq_desc_get_irq_data(desc);
> > > +
> > > +		if (chip && chip->irq_eoi)
> > > +			chip->irq_eoi(d);
> > > +	}
> > > +}
> > 
> > Doesn't this hard-code the flow handler for the irqchip? It feels like it
> > would be better for the GIC driver to get a callback during the kexec
> > sequence (if it doesn't already) to prepare itself.
> 
> Yeah, that's not an acceptable approach.

We're in a non returning handler which is about to shutdown the CPU in a few
instructions, so I'm not sure how to callback into the GIC driver.

> 
> The other observation is that the GIC drivers already clear the active
> state at boot time (gic_cpu_init()). So what isn't that working?
> 
> Could it be that the hypervisor doesn't correctly handle the writes to
> GICR_ICACTIVER0 to nuke the active state? Because this works correctly
> on KVM as is.

That's what I suppose, but obviously I have no access to the implementation
so I canot add more. This is currently under investigation by the folks who
can, though...

So the bottom line is that we need to wait for a patch from the hypervisor 
vendor (and from any vendor that *could* suffer from the same issue), I guess?

Many thanks,
Andrea

> 
> Thanks,
> 
> 	M.
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.

