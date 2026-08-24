Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C11C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8ffWZJHAKCibKIEixOwx/vrIswu7sKhFmLGSiMO2s4=; b=pOGHqbKJjlmeLnDHKEx3uMYTgF
	dZ8adt0yNyVBgzV6/ElcVw0uYIDy65/wp8V3YvAueQE+Q2fAWvAnlGHkNQyTbYwi4wNVJeub/fd0O
	5HvXk0O5nZckBjHCjLetp7VhQ+dQuFYJO2EMkKXAckRztJH9RWSbnclz6X19WZEhfVNBi5tjdbEH8
	UJDJwtb0tR5caIQnKlaWUNi/I4qjhbCPgzBYJ+riID3gpwFdoueyuz3St/+M6Vpyxit9cFjrdmxXB
	GUDS0eOfz5iYN0ZmI8b3agRB3zKswU+n1MVN8USCHggvwRRCyseuy/QJJVljULurmnlnKRaw42/Lv
	YQLV1+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycrf-0000000HR4X-3Dfc;
	Mon, 24 Aug 2026 22:09:59 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycrZ-0000000HR4A-32VI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 22:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1787609393; x=1819145393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H8ffWZJHAKCibKIEixOwx/vrIswu7sKhFmLGSiMO2s4=;
  b=N6o8/lx3Zgsn3mlfs4NovO0IpY0svbSI9klW3nyddsyiTkQHnyWjdIPF
   SUyNhRaZwWF8a6AxNK8E3NzG3Lh0rBsXN+FxE3PHfz9s8Uikz4nV1L+5I
   qkv9Nw8bt6VnF319HvVuJ6OrXluOSBWdLlarPCETMOZNV17x+RI3rclut
   THlLJo4F5DOUGGBsvlsKLliVYUBSf0ELF/kozV3YogTiSLdGHPrg+4Rq6
   KlMscQrV+Sft+z5pgltuG2w/F+9QlDe4TckfqKW6KJRcTGvPXrkCqEVCZ
   zr6kF32ho3mrsR2hitcXd4KTl3AEUiIs8b/Eg1RyqiFSLBe+3js2gTNQW
   g==;
X-CSE-ConnectionGUID: jykr5GVcTwWILbkQCozZ2g==
X-CSE-MsgGUID: PkAFrbNHQUG1NzN62m/LGw==
X-IronPort-AV: E=Sophos;i="6.25,241,1779148800"; 
   d="scan'208";a="26896985"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 22:09:45 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:30984]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.145:2525] with esmtp (Farcaster)
 id 6d6357b8-9ef4-4b4a-b9be-6c8b75124b35; Mon, 24 Aug 2026 22:09:44 +0000 (UTC)
X-Farcaster-Flow-ID: 6d6357b8-9ef4-4b4a-b9be-6c8b75124b35
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Mon, 24 Aug 2026 22:09:44 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Mon, 24 Aug 2026 22:09:43 +0000
From: Bjoern Doebel <doebel@amazon.de>
To: Marc Zyngier <maz@kernel.org>
CC: Bjoern Doebel <doebel@amazon.de>, <stable@vger.kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, "Ali
 Saidi" <alisaidi@amazon.com>, David Arinzon <darinzon@amazon.com>, "Zeev
 Zilberman" <zeev@amazon.com>
Subject: Re: [PATCH] irqchip/gic-v3-its: Reconfigure ITS from software state on resume
Date: Mon, 24 Aug 2026 22:09:17 +0000
Message-ID: <aozBAe+rQr7Li+4F@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <875x2p7p5u.wl-maz@kernel.org>
References: <20260507183102.1897629-1-doebel@amazon.de> <akZPM6SeJiM8th0N@amazon.de> <875x2p7p5u.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.169.119.5]
X-ClientProxiedBy: EX19D035UWB004.ant.amazon.com (10.13.138.104) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_150953_870864_2CD6D1C1 
X-CRM114-Status: GOOD (  33.81  )
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

Hi Marc,

thanks for your response and apologies for my delay (I'm paying for this
by having to page all this back into my head).

> >   - I reproduced the original failure on *stock* v7.2-rc1. On EC2
> >     Graviton instances, hibernation resume fails 100% of the time: the
> >     ITS comes back reset, MAPD/MAPTI are never replayed, and the ENA
> >     NIC silently loses its LPIs:
> > 
> >       ena 0000:00:05.0: ... didn't receive a MSI-X interrupt (cmd 3)
> >       ena 0000:00:05.0: Failed to create IO CQ. error: -62
> >
> 
> But how did the resumed kernel get there the first place? Surely you
> had interrupts to load it, right?

Pre-hibernate we had a correctly configured guest (VM-1) on a KVM host,
including properly setup ITS etc. Then we hibernated this VM, that is
the guest wrote all its memory content into a snapshot and powered down.
While this contains some guest-side GIC state, it does not contain the
host-side virtual GIC state KVM stores.

Now we resume, that is we launch a new VM (VM-2), potentially on a
different host. This VM configures the underlying vGIC and has working
devices. At some point it then loads the hibernated memory image and
jumps into the resumed kernel. At this point, we are running a VM
configured by VM-2, but we just restored the in-guest ITS state from
VM-1. After this, the network driver no longer receives interrupts from
the device because it relies on mappings VM-1 established while the 2nd
vGIC was never told about them.

The solution to this problem is to replay VM-1's MAPD, MAPC and MAPTI
commands, which re-programs the 2nd vGIC with the mappings VM-1 had
before.

> >     The instance then has no networking after resume.
> > 
> >   - With this patch applied, the same kernel survives hibernate/resume
> >     cleanly: 9/9 cycles with zero failures, across all three Graviton
> >     generations (Graviton 2/3/4, i.e. Neoverse N1/V1/V2), networking
> >     fully restored on every resume.
> > 
> > As described in the previous message, this is the fallout from 713335b6ee29
> > ("irqchip/gic-v3-its: Implement .msi_teardown() callback"): device
> > teardown no longer happens across a suspend/resume that keeps the MSI
> > domain, so the ITS is never reprogrammed and drops interrupts after the
> > hardware has been reset.
> > 
> > Could you take a look when you get a chance?
> 
> What I don't immediately see is how this particular patch influences
> anything, given that at this point it isn't doing anything.
> 
> Beside that, how does hibernation actually influences LPIs being
> released? Can you at least describe the sequence of events?

Before 6.16 this worked "by accident". On suspend, we call ena_suspend()
-> ena_destroy_device() -> ena_disable_msix() -> pci_free_irq_vectors().
This ends up freeing all IRQ vectors and eventually calling
its_irq_domain_free(). This function releases the events from the event
map, finds the event map has run empty, and then tears the its_device
down with its_lpi_free() -> MAPD(V=0) -> its_free_device(). This happens
while devices are frozen, before the snapshot is taken. Hence, no
its_device for the NIC is stored within the hibernation snapshot.

On resume, its_msi_prepare() would then not find anything for that
DeviceID and therefore call its_create_device(). This allocates ITT and
LPI range, and issues MAPD. Eventually, we end up with VM-2's vGIC being
reconfigured from scratch.

6.16 changed the lifetime of the its_device. 713335b6ee29
("irqchip/gic-v3-its: Implement .msi_teardown() callback") moved the
its_device teardown out of its_irq_domain_free() into a new
.msi_teardown() hook, and 03c298760ed9 ("genirq/msi: Engage the
.msi_teardown() callback on domain removal") tied that hook to domain
removal. The empty event map went from being the condition that
triggered teardown to a WARN_ON_ONCE precondition. As 713335b6ee29
explains, coupling the its_device to the event count was wrong, since
drivers legitimately drop to zero MSIs and reallocate.

Our hibernation was relying on exactly that teardown. Suspend still
frees all vectors and empties the event map, but it does not remove the
MSI domain. .msi_teardown() never runs. The its_device survives with
an empty event map, and it therefore ends up in the snapshot. On resume
its_msi_prepare() finds it again via its_find_device(), marks it shared
and returns without issuing MAPD, so its_create_device() is never
reached. VM-2's vGIC is never told about the DeviceID. 

So before 6.16, the snapshot had no its_device and we got full
reconfiguration for free. Since 6.16 the snapshot has an its_device and
nothing reprograms the vGIC. All of this was never meant to support
hibernation. We should always have been restoring ITS state explicitly
on resume.

My patch reconstructs the ITS hardware state from the software state
restored with the image. That state is all present at syscore_resume()
time and does not depend on any device having resumed.
its_restore_enable() already performs the first three steps of the GICv3
ITS §5.6.1 enable sequence and stops short of the fourth, configuring
devices, collections and translations with ITS commands. So we walk
its_device_list and for each device issue MAPD(V=0), zero and flush the
ITT, then issue MAPD(V=1), since §5.3.10 makes MAPD(V=1) with a non-zero
ITT UNPREDICTABLE. Per-event MAPTI replay is deferred to
its_cpu_init_collection(), since an event's target collection has to be
MAPC'd before its MAPTI can be issued. All of it completes before
dpm_resume() runs the driver .resume callbacks, so the ITS is programmed
before any device raises an MSI.

> The other thing that worries me is that in general, (bare metal) GICv3
> is unable to deal with hibernation, given that you can't reprogram the
> property and pending table addresses. Yes, it *may* work if you are
> lucky enough that the boot kernel and the resumed one use the same
> memory regions, but this only show that you like playing Russian
> roulette.

Point taken. This patch is not trying to make hibernation work on bare
metal. It restores ITS command state only and does not touch
GICR_PROPBASER/GICR_PENDBASER, which cannot be re-pointed once
GICR_CTLR.EnableLPIs is set. If a redistributor lost power, replaying
ITS commands will not be enough. I am happy to state that limitation in
the commit message.

Best regards
Bjoern


