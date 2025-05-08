Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA2AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aEAaERozZNOaFKg49GQvdELufAIHV25IGpLa/b08J8=; b=DAdFtl5NJsUcnNK0/W075AL0lD
	JYLqxqDQw6qjIKxvg4Rg1ndzy7VF7YHdrhdJJOWW5/KZFvb4ZkohHDWPd+3uft57/CabYo5CBJg9V
	yiplyzQL3+aNH7+5Q1Ia9Gfx8C63X/NCvEYcG6io1B/HsWyEaRVo3b/dBRO8l+JbjKvXh+9IUL3CE
	gH2100LwDcgwSBrsaZG/ecuxAxWdj2GPzOzJz/FCzmY4CaCpYDDNVW4LSIiUkQPEQBtTm1KPHS/t5
	diYFKv8DCu3L8OCc7M6wd8DMCGUAU8goYFTbzJd12rdw+2dyCJsFskLDG3MJ2B3g0MVBALwyA5qBU
	TI2mIeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCymv-00000000Qrl-1MK3;
	Thu, 08 May 2025 10:47:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCykJ-00000000QQW-09DD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51CFA629EA;
	Thu,  8 May 2025 10:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3043C4CEE7;
	Thu,  8 May 2025 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746701094;
	bh=xqnW9kopq8l64iCs7XUKDphBW5xsrquQhMRe7SGLz5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWJmVqVjUrPhFLOrmOrc8VrQDhLMQb1iYqhL9i4oEafgAhAvl/TqYIXHy3Ufs9UBJ
	 xeiq9bCza5XLv4OV8VeSS5XZT84c7tpc8G6sjbaA/vipFOsT7FmLU4aoP2wdBbQXpC
	 yt4XbnmbN0lIavQMNQQUKrLQE/Hyh3SxrRShDR0uWIMcXh3wdiKMC38xIgtYG3qpmu
	 lcWWbhY2GdZuGSkXJ6E80ecvj+sD/Bqu1OZGdzIp/6n5Y3mQnbxo/7W3Dc/1dDzdTt
	 2JXOUM3wqyOVSyrZP2pVpD3hZjyvD97cIYXiu6E/i8imGyuSvvt3JCj6aZJYsQnrsG
	 XByNzTryEvqMw==
Date: Thu, 8 May 2025 12:44:45 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aByLHdktOLUk8HCN@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
 <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
 <874ixwmpto.ffs@tglx>
 <aBxgceQBRA6vBK7o@lpieralisi>
 <864ixvh4ss.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ixvh4ss.wl-maz@kernel.org>
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

On Thu, May 08, 2025 at 09:42:27AM +0100, Marc Zyngier wrote:
> On Thu, 08 May 2025 08:42:41 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Wed, May 07, 2025 at 04:57:07PM +0200, Thomas Gleixner wrote:
> > > On Wed, May 07 2025 at 14:52, Marc Zyngier wrote:
> > > > On Wed, 07 May 2025 14:42:42 +0100,
> > > > Thomas Gleixner <tglx@linutronix.de> wrote:
> > > >> 
> > > >> On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
> > > >> > On Tue, 06 May 2025 16:00:31 +0100,
> > > >> > Thomas Gleixner <tglx@linutronix.de> wrote:
> > > >> >> 
> > > >> >> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
> > > >> >> tests for level, no? So the test is interesting at best ...
> > > >> >
> > > >> > There is no distinction between HIGH and LOW, RISING and FALLING, in
> > > >> > any revision of the GIC architecture.
> > > >> 
> > > >> Then pretending that there is a set_type() functionality is pretty daft
> > > >
> > > > You still need to distinguish between level and edge when this is
> > > > programmable (which is the case for a subset of the PPIs).
> > > 
> > > Fair enough, but can we please add a comment to this function which
> > > explains this oddity.
> > 
> > Getting back to this, I would need your/Marc's input on this.
> > 
> > I think it is fair to remove the irq_set_type() irqchip callback for
> > GICv5 PPIs because there is nothing to set, as I said handling mode
> > for these IRQs is fixed. I don't think this can cause any trouble
> > (IIUC a value within the IRQF_TRIGGER_MASK should be set on requesting
> > an IRQ to "force" the trigger to be programmed and even then core code
> > would not fail if the irq_set_type() irqchip callback is not
> > implemented).
> > 
> > I am thinking about *existing* drivers that request GICv3 PPIs with
> > values in IRQF_TRIGGER_MASK set (are there any ? Don't think so but you
> > know better than I do), when we switch over to GICv5 we would have no
> > irq_set_type() callback for PPIs but I think we are still fine, not
> > implementing irqchip.irq_set_type() is correct IMO.
> 
> Nobody seems to use a hardcoded trigger (well, there is one exception,
> but that's to paper over a firmware bug).

That's what I get if I remove the PPI irq_set_type() callback (just one
timer, removed others because they add nothing) and enable debug for
kernel/irq/manage.c (+additional printout):

 genirq: No set_type function for IRQ 70 (GICv5-PPI)
  __irq_set_trigger+0x13c/0x180
  __setup_irq+0x3d8/0x7c0
  __request_percpu_irq+0xbc/0x114
  arch_timer_register+0x84/0x140
  arch_timer_of_init+0x180/0x1d0
  timer_probe+0x74/0x124
  time_init+0x18/0x58
  start_kernel+0x198/0x384
  __primary_switched+0x88/0x90

 arch_timer: check_ppi_trigger irq 70 flags 8
 genirq: enable_percpu_irq irq 70 type 8
 genirq: No set_type function for IRQ 70 (GICv5-PPI)
  __irq_set_trigger+0x13c/0x180
  enable_percpu_irq+0x100/0x140
  arch_timer_starting_cpu+0x54/0xb8
  cpuhp_issue_call+0x254/0x3a8
  __cpuhp_setup_state_cpuslocked+0x208/0x2c8
  __cpuhp_setup_state+0x50/0x74
  arch_timer_register+0xc4/0x140
  arch_timer_of_init+0x180/0x1d0
  timer_probe+0x74/0x124
  time_init+0x18/0x58
  start_kernel+0x198/0x384
  __primary_switched+0x88/0x90

I noticed that, if the irq_set_type() function is not implemented,
we don't execute (in __irq_set_trigger()):

irq_settings_set_level(desc);
irqd_set(&desc->irq_data, IRQD_LEVEL);

which in turn means that irqd_is_level_type(&desc->irq_data) is false
for PPIs (ie arch timers, despite being level interrupts).

An immediate side effect is that they show as edge in:

/proc/interrupts

but that's just what I could notice.

Should I set them myself in PPI translate/alloc functions ?

Removing the irq_set_type() for PPIs does not seem so innocuous, it is a
bit complex to check all ramifications, please let me know if you spot
something I have missed.

> > On the other hand, given that on GICv5 PPI handling mode is fixed,
> > do you think that in the ppi_irq_domain_ops.translate() callback,
> > I should check the type the firmware provided and fail the translation
> > if it does not match the HW hardcoded value ?
> 
> Why? The fact that the firmware is wrong doesn't change the hardware
> integration. It just indicates that whoever wrote the firmware didn't
> read the documentation.
> 
> Even more, I wonder what the benefit of having that information in the
> firmware tables if the only thing that matters in the immutable HW
> view. Yes, having it in the DT/ACPI simplifies the job of the kernel
> (only one format to parse). But it is overall useless information.

Yes, that I agree but it would force firmware bindings to special case
PPIs to remove the type (#interrupt-cells and co.).

From what I read I understand I must ignore the PPI type provided by
firmware.

> > Obviously if firmware exposes the wrong type that's a firmware bug
> > but I was wondering whether it is better to fail the firmware-to-Linux
> > IRQ translation if the firmware provided type is wrong rather than carry
> > on pretending that the type is correct (I was abusing the irq_set_type()
> > callback to do just that - namely, check that the type provided by
> > firmware matches HW but I think that's the wrong place to put it).
> 
> I don't think there is anything to do. Worse case, you spit a
> pr_warn_once() and carry on.

Thanks,
Lorenzo

