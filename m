Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA602E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=991tB+KrATkxyFgYXmjsDZn2iQIdVKyCRHT9jNM7+f8=; b=yftWHZ2f5nxol24XT+wkFiFrUu
	Yg8MI80B0RFayzr8tP9MlR0y9zhBt0M++W4xqYS8+Ci5VY9M/TJuM5pneB/E4+n3gee31KN6OhVFN
	ZIbx7IzpRGTRM2Xkk7ohSilM8e7rUDdp7hzCs6u8ju6B8y7tsrNh0i003bupz5/nYnWLpCRVI3PCg
	ZMcz7cfVEvI1iRzOnNb32iXZsXtnlqR7tkvcDhPgSas1V8IpZJKw6KiZ6WJUg0CmwlKIpXLIvJjo3
	hcAhGitpl9QMK/FEZJnIIVHFRvq+9/aXsDrjT9bbYhy4mrqVjgZUzEAtCRwEzlbh/+z1msjXC4ajv
	GrXk5V8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7rF-00000009bgg-1kwi;
	Mon, 16 Dec 2024 09:57:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7q9-00000009bRW-0qPn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:56:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF870113E;
	Mon, 16 Dec 2024 01:57:02 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33B8E3F58B;
	Mon, 16 Dec 2024 01:56:33 -0800 (PST)
Date: Mon, 16 Dec 2024 09:56:30 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: Marc Zyngier <maz@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Carol Soto <csoto@nvidia.com>
Subject: Re: [PATCH] irqchip/gic-v3: Allow unused SGIs for drivers/modules
Message-ID: <Z1_5TjlvyZl5ynGz@bogus>
References: <20240813033925.925947-1-sdonthineni@nvidia.com>
 <86zfpgztmt.wl-maz@kernel.org>
 <Zrs2i9Iyrlqc-a4K@bogus>
 <1885f74b-5bfb-46a3-a65f-521d974d023f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1885f74b-5bfb-46a3-a65f-521d974d023f@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_015637_328331_5A28FA84 
X-CRM114-Status: GOOD (  43.71  )
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

On Mon, Dec 16, 2024 at 10:25:29AM +0800, Kai-Heng Feng wrote:
> Hi Sudeep,
> 
> On 2024/8/13 6:33 PM, Sudeep Holla wrote:
> > On Tue, Aug 13, 2024 at 09:58:34AM +0100, Marc Zyngier wrote:
> > > On Tue, 13 Aug 2024 04:39:25 +0100,
> > > Shanker Donthineni <sdonthineni@nvidia.com> wrote:
> > > > 
> > > > The commit 897e9e60c016 ("firmware: arm_ffa: Initial support for scheduler
> > > > receiver interrupt") adds support for SGI interrupts in the FFA driver.
> > > > However, the validation for SGIs in the GICv3 is too strict, causing the
> > > > driver probe to fail.
> > > 
> > > It probably is a good thing that I wasn't on Cc for this patch,
> > > because I would have immediately NAK'd it. Sudeep, please consider
> > > this a retrospective NAK!
> > > 
> > 
> > Sure, I am happy to work on any suggestions to replace it with better/cleaner
> > solution.
> > 
> > > > 
> > > > This patch relaxes the SGI validation check, allowing callers to use SGIs
> > > > if the requested SGI number is greater than or equal to MAX_IPI, which
> > > > fixes the TFA driver probe failure.
> > > > 
> > > > This issue is observed on NVIDIA server platform with FFA-v1.1.
> > > >   [    7.918099] PTP clock support registered
> > > >   [    7.922110] EDAC MC: Ver: 3.0.0
> > > >   [    7.945063] ARM FF-A: Driver version 1.1
> > > >   [    7.949068] ARM FF-A: Firmware version 1.1 found
> > > >   [    7.977832] GICv3: [Firmware Bug]: Illegal GSI8 translation request
> > > >   [    7.984237] ARM FF-A: Failed to create IRQ mapping!
> > > >   [    7.989220] ARM FF-A: Notification setup failed -61, not enabled
> > > >   [    8.000198] ARM FF-A: Failed to register driver sched callback -95
> > > >   [    8.011322] scmi_core: SCMI protocol bus registered
> > > > 
> > > > Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> > > > ---
> > > >   arch/arm64/include/asm/arch_gicv3.h | 17 +++++++++++++++++
> > > >   arch/arm64/kernel/smp.c             | 17 -----------------
> > > >   drivers/irqchip/irq-gic-v3.c        |  2 +-
> > > >   3 files changed, 18 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/include/asm/arch_gicv3.h b/arch/arm64/include/asm/arch_gicv3.h
> > > > index 9e96f024b2f19..ecf81df2915c7 100644
> > > > --- a/arch/arm64/include/asm/arch_gicv3.h
> > > > +++ b/arch/arm64/include/asm/arch_gicv3.h
> > > > @@ -188,5 +188,22 @@ static inline bool gic_has_relaxed_pmr_sync(void)
> > > >   	return cpus_have_cap(ARM64_HAS_GIC_PRIO_RELAXED_SYNC);
> > > >   }
> > > > +enum ipi_msg_type {
> > > > +	IPI_RESCHEDULE,
> > > > +	IPI_CALL_FUNC,
> > > > +	IPI_CPU_STOP,
> > > > +	IPI_CPU_CRASH_STOP,
> > > > +	IPI_TIMER,
> > > > +	IPI_IRQ_WORK,
> > > > +	NR_IPI,
> > > > +	/*
> > > > +	 * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
> > > > +	 * with trace_ipi_*
> > > > +	 */
> > > > +	IPI_CPU_BACKTRACE = NR_IPI,
> > > > +	IPI_KGDB_ROUNDUP,
> > > > +	MAX_IPI
> > > > +};
> > > > +
> > > >   #endif /* __ASSEMBLY__ */
> > > >   #endif /* __ASM_ARCH_GICV3_H */
> > > > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > > > index 5e18fbcee9a20..373cd815d9a43 100644
> > > > --- a/arch/arm64/kernel/smp.c
> > > > +++ b/arch/arm64/kernel/smp.c
> > > > @@ -64,23 +64,6 @@ struct secondary_data secondary_data;
> > > >   /* Number of CPUs which aren't online, but looping in kernel text. */
> > > >   static int cpus_stuck_in_kernel;
> > > > -enum ipi_msg_type {
> > > > -	IPI_RESCHEDULE,
> > > > -	IPI_CALL_FUNC,
> > > > -	IPI_CPU_STOP,
> > > > -	IPI_CPU_CRASH_STOP,
> > > > -	IPI_TIMER,
> > > > -	IPI_IRQ_WORK,
> > > > -	NR_IPI,
> > > > -	/*
> > > > -	 * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
> > > > -	 * with trace_ipi_*
> > > > -	 */
> > > > -	IPI_CPU_BACKTRACE = NR_IPI,
> > > > -	IPI_KGDB_ROUNDUP,
> > > > -	MAX_IPI
> > > > -};
> > > > -
> > > >   static int ipi_irq_base __ro_after_init;
> > > >   static int nr_ipi __ro_after_init = NR_IPI;
> > > >   static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
> > > > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > > > index c19083bfb9432..0d2038d8cd311 100644
> > > > --- a/drivers/irqchip/irq-gic-v3.c
> > > > +++ b/drivers/irqchip/irq-gic-v3.c
> > > > @@ -1655,7 +1655,7 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> > > >   		if(fwspec->param_count != 2)
> > > >   			return -EINVAL;
> > > > 
> > > > -		if (fwspec->param[0] < 16) {
> > > > +		if (fwspec->param[0] < MAX_IPI) {
> > > >   			pr_err(FW_BUG "Illegal GSI%d translation request\n",
> > > >   			       fwspec->param[0]);
> > > >   			return -EINVAL;
> > > 
> > > No. This is the wrong approach, and leads to inconsistent behaviour if
> > > we ever change this MAX_IPI value. It also breaks 32 bit builds, and
> > > makes things completely inconsistent between ACPI and DT.
> > > 
> > > I don't know how the FFA code was tested, because I cannot see how it
> > > can work.
> > > 
> > > *IF* we are going to allow random SGIs being requested by random
> > > drivers, we need to be able to do it properly. Not as a side hack like
> > > this.
> > 
> > I am open for any ideas as FF-A spec authors/architects decided to allow
> > secure world to donate one of its SGI to the normal world for FF-A
> > notifications.
> 
> Is there any progression on this issue? Do you think it's reasonable to
> revert commit 897e9e60c016 as a temporary measure?
> 

I haven't started on this yet, but I plan to do that in a week or so.
Revert may not be trivial at this point. We can disable it until it is
fixed properly instead of all possible conflicts with reverts.

-- 
Regards,
Sudeep

