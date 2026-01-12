Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B38CC9EC90
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEtMmgPNhmFaINe9TnjsfyUKoDihi7X8JmYghahaSFU=; b=0xlBddPGQNceb2vaiOaWJJkP5C
	WcEZFv1BYww4mtvcgQAqPPwMffqv2H0i5BOIuNfhA8J5YJ+JJEENLrdDWeHYnv7sxqCA5ck4JGBtW
	/5J1bkQzj30GsrvaXDSUOgwLoUP0dR2EXe3bi7ZVgK5L9G5O8iff9aE5xoFQJUOjE54JFZg32Sdfp
	X3p9y29gHxrvKqBcI1OZtMqd86cW7/eEJL0K3jWHJK4qLYcm03li+YprHbrLV9ndo93ZeEKvYnuy3
	JT8FLEf2sTjVouriW3ixcC1F4+VSfp8Ct4TjF0ZnB2mQP93kzZTxz19mtEmDEezMBbrWV8AVy83Yp
	MMqRIBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIb8-00000005UXG-0lEk;
	Mon, 12 Jan 2026 14:08:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIb4-00000005UW7-2irb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:08:44 +0000
Date: Mon, 12 Jan 2026 15:08:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768226918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEtMmgPNhmFaINe9TnjsfyUKoDihi7X8JmYghahaSFU=;
	b=EL7IjEAQL3SnBdHEXZ161o6oRQFDktiZDyNkUrKcIKlyDu5GwM9SQLqkWYOECzR+VG3MnB
	EoGtkmESbzAS+CHzneoJO1KlR2556+FQ8rbFGUHLEngSiaYW3BCUpKS6M9tqVq4vfxaxmF
	3clyfKOzonX26sdu65/37e6HRjq2KMN7EX5tMZkjQiGJzh9/Wl/GqQh2Cr8Ox1FbMNFtho
	MjrIw/uOy14ucVKURdAjMgKmPKvJPGgtF8XflgCCAq6Yl1CaebqxHXocjsyiMrIit4Fle8
	Az8NOaDz47CTgd+Fppqas0L/BHM55FWMVefF222dBdEJsCnSgAgDMC70luILFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768226918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEtMmgPNhmFaINe9TnjsfyUKoDihi7X8JmYghahaSFU=;
	b=/B0UsT/BcB8QPv+DLxXgzn7yvdimvI4jTGw3fJ+4ZXYdsQ2T1IBeg4FExn2gbiupPIntpB
	/L2vFySG5YjiGPAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marc Zyngier <maz@kernel.org>
Cc: Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
Message-ID: <20260112140837.UNQYT563@linutronix.de>
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org>
 <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org>
 <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
 <87pl7gglya.ffs@tglx>
 <86tswrkrh4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <86tswrkrh4.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_060842_835862_E0FA6A54 
X-CRM114-Status: GOOD (  35.14  )
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

On 2026-01-12 11:20:07 [+0000], Marc Zyngier wrote:
> On Sun, 11 Jan 2026 16:20:45 +0000,
> Thomas Gleixner <tglx@kernel.org> wrote:
> >=20
> > On Sun, Jan 11 2026 at 10:38, Marc Zyngier wrote:
> > > On Sun, 11 Jan 2026 09:39:07 +0000,
> > > Thomas Gleixner <tglx@kernel.org> wrote:
> > >>=20
> > >> On Fri, Jan 09 2026 at 16:13, Marc Zyngier wrote:
> > >> > On Thu, 08 Jan 2026 22:11:33 +0000,
> > >> > Thomas Gleixner <tglx@kernel.org> wrote:
> > >> >> At the point where a CPU is brought up, the topology should be kn=
own
> > >> >> already, which means this can be allocated on the control CPU _be=
fore_
> > >> >> the new CPU comes up, no?
> > >> >
> > >> > No. Each CPU finds *itself* in the forest of redistributors, and f=
rom
> > >> > there tries to find whether it has some shared resource with a CPU
> > >> > that has booted before it. That's because firmware is absolutely a=
wful
> > >> > and can't present a consistent view of the system.
> > >>=20
> > >> Groan....
> > >>
> > >> > Anyway, I expect it could be solved by moving this part of the ini=
t to
> > >> > an ONLINE HP callback.
> > >>=20
> > >> Which needs to be before CPUHP_AP_IRQ_AFFINITY_ONLINE, but even that
> > >> might be to late because there are callbacks in the STARTING section,
> > >> i.e. timer, perf, which might rely on interrupts being accessible.
> > >
> > > Nah. This stuff is only for direct injection of vLPIs into guests, so
> > > as long as this is done before we can schedule a vcpu on this physical
> > > CPU, we're good. No physical interrupt is concerned with this code.
> >=20
> > That's fine then. vCPUs are considered "user-space" tasks and can't be
> > scheduled before CPUHP_AP_ACTIVE sets the CPU active for the scheduler.
>=20
> Waiman, can you please give the following hack a go on your box? The
> machines I have are thankfully limited to a single ITS group, so I
> can't directly reproduce your issue.
>=20
> Thanks,
>=20
> 	M.
>=20
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index ada585bfa4517..20967000f2348 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -2896,7 +2896,7 @@ static bool allocate_vpe_l2_table(int cpu, u32 id)
>  	return true;
>  }
> =20
> -static int allocate_vpe_l1_table(void)
> +static int allocate_vpe_l1_table(unsigned int cpu)
>  {
>  	void __iomem *vlpi_base =3D gic_data_rdist_vlpi_base();
>  	u64 val, gpsz, npg, pa;
> @@ -3012,10 +3012,11 @@ static int allocate_vpe_l1_table(void)
> =20
>  out:
>  	gicr_write_vpropbaser(val, vlpi_base + GICR_VPROPBASER);
> -	cpumask_set_cpu(smp_processor_id(), gic_data_rdist()->vpe_table_mask);
> +	cpumask_set_cpu(cpu, gic_data_rdist()->vpe_table_mask);
> +	dsb(sy);
> =20
>  	pr_debug("CPU%d: VPROPBASER =3D %llx %*pbl\n",
> -		 smp_processor_id(), val,
> +		 cpu, val,
>  		 cpumask_pr_args(gic_data_rdist()->vpe_table_mask));
> =20
>  	return 0;
> @@ -3264,15 +3265,9 @@ static void its_cpu_init_lpis(void)
>  		val =3D its_clear_vpend_valid(vlpi_base, 0, 0);
>  	}
> =20
> -	if (allocate_vpe_l1_table()) {
> -		/*
> -		 * If the allocation has failed, we're in massive trouble.
> -		 * Disable direct injection, and pray that no VM was
> -		 * already running...
> -		 */
> -		gic_rdists->has_rvpeid =3D false;
> -		gic_rdists->has_vlpis =3D false;
> -	}
> +	if (smp_processor_id() =3D=3D 0)
> +		cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "irqchip/arm/gicv3:vpe",
> +				  allocate_vpe_l1_table, NULL);

If you move it the online state then you could also
s/GFP_ATOMIC/GFP_KERNEL.

Also previously you checked the error code set has_rvpeid, has_vlpis on
failure. Now you you should the same in case of a failure during
registration.
This also happens happens on CPU hotplug and I don't see how you avoid a
second allocation. But I also don't understand why this registrations
happens on CPU0. It might be just a test patch=E2=80=A6

> =20
>  	/* Make sure the GIC has seen the above */
>  	dsb(sy);

Sebastian

