Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19EEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxfuQK0/LO5goJEcowNYBVg9zB9o21O16uM3ARXCVbg=; b=1/Xx926Guj/bR0ZWsS0RfsC3qE
	W/+gKDtYZfEob5fDBzxzrSOvIqgM+Ia5rIl1l/za6akW2ePM9+1b2HWin8aFVNFXYYVggfs0rwR2p
	I4NhzXT7BwLeiS6bPVQ8E4zgESTISlMjJvg+xzqIrM3CF8yLURWATBngssESumegXZA9HgL8cHwzV
	CVKDCT+bHHHz/C+G/GReZlpKhTtCFyeBlqcZBofwPBMeHHqKDTydy0O7plR1LzE4DLcr32w+gcFoU
	gF6+Jl+3s/SNuu3uwapUCjT0Jdr+4KFAfFsV7uEzjMAuxDjBbqfsvY280NmSYIWKcMMNI5ZGZ7eYh
	K8MsTogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wec7E-0000000HYoE-3CgZ;
	Tue, 30 Jun 2026 17:19:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wec7B-0000000HYns-3JVz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:19:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80366302A;
	Tue, 30 Jun 2026 10:19:11 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA8F93F66F;
	Tue, 30 Jun 2026 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782839955; bh=aazyiOP5gAY0bGpQA8a3lTuATbta7rr4eQjJ8XAQf3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jjk8ATcJ/w4lQ2tQuYzbPDUWPKAvdrvCuZPd0MuwQFPa6Xl1hy6DH++N0pV1P9m+f
	 5d9nE7JFlgLUZGnzlF8YRqgMBaujBQ//Vn3nB1O3zYaLLmzdB9Xpmkf6rnW9sTJYG9
	 Hp+DDsFHjmc1R83uBUDzYElhivgIw5vK3F9ZanQg=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>,
	Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [PATCH v2 05/13] KVM: arm64: Detect (via ACPI) and initialize HACDBSIRQ
Date: Tue, 30 Jun 2026 18:19:08 +0100
Message-ID: <akP6jAargbR5jUUu@LeoBrasDK>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <akPoyAGX5_ankwWD@kernel.org>
References: <20260629111820.1873540-1-leo.bras@arm.com> <20260629111820.1873540-6-leo.bras@arm.com> <akKpxDulRN7zDrgM@kernel.org> <akPXqZQBKET1SyvN@LeoBrasDK> <akPoyAGX5_ankwWD@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_101917_927779_3EC1D86D 
X-CRM114-Status: GOOD (  43.21  )
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

On Tue, Jun 30, 2026 at 09:03:20AM -0700, Oliver Upton wrote:
> On Tue, Jun 30, 2026 at 03:50:17PM +0100, Leonardo Bras wrote:
> > On Mon, Jun 29, 2026 at 10:22:12AM -0700, Oliver Upton wrote:
> > > If we need to initialize the IRQ I'd really like to see device tree
> > > bindings for HACDBSIRQ as well. Pretty much any system us plebs can get
> > > our hands on is gonna be DT anyway.
> > 
> > Agree. I started out with ACPI because that's what the main target is, as 
> > dirty-logging is focused in Live Migration, which is usually more 
> > appreciated in the server space, which generally uses ACPI.
> > 
> > I spoke to some people, and I could not hear of anyone releasing a product 
> > based in DT that would implement this yet, so I postponed the DT 
> > enablement.
> 
> Nested virt is always a good example. In some distant future KVM could
> expose FEAT_HACDBS to the L1 hypervisor, and the VMM may be using DT
> instead of ACPI (like kvmtool).

Oh, good point.

> 
> > > 
> > > > +static irqreturn_t hacdbsirq_handler(int irq, void *pcpu)
> > > > +{
> > > > +	u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
> > > > +	unsigned long err = FIELD_GET(HACDBSCONS_EL2_ERR_REASON, cons);
> > > > +
> > > > +	switch (err) {
> > > > +	case HACDBSCONS_EL2_ERR_REASON_NOF:
> > > > +		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> > > > +		break;
> > > > +	case HACDBSCONS_EL2_ERR_REASON_IPAHACF:
> > > > +		/* When size not a power of two >= 4k, exit with reserved TTLW */
> > > > +		int index = FIELD_GET(HACDBSCONS_EL2_INDEX, cons);
> > > > +
> > > > +		if (index >= this_cpu_read(hacdbs_pcp.size)) {
> > > > +			this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> > > > +			break;
> > > > +		}
> > > > +		fallthrough;
> > > > +	case HACDBSCONS_EL2_ERR_REASON_STRUCTF:
> > > > +	case HACDBSCONS_EL2_ERR_REASON_IPAF:
> > > > +		this_cpu_write(hacdbs_pcp.status, HACDBS_ERROR);
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	return IRQ_HANDLED;
> > > > +}
> > > 
> > > I have a pretty extreme distaste for creating a state machine between
> > > the callsite and the IRQ handler. The callsite should poll HACDBS for
> > > completion. The thread has nothing better to do anyway.
> > 
> > Well, there is one argument it could just wait and save some energy, but I 
> > agree it is not relevant in server space.
> 
> I wouldn't suggest polling in a tight loop :) I'd say use something like
> __mdelay() to get the core into a low-power state w/o using a naked WFI.
> In fact, that already uses WFxT under the hood.

Awesome!

> 
> > The main reason I did this is 
> > because I am planning on later doing an improved version of this that would 
> > clean the dirty-bit *while* running the guest, and having the IRQ is needed 
> > for exiting guest so we can notify userspace the cleaning is done. So I 
> > laid the HACDBSIRQ infra here so we don't have both polling and IRQ options 
> > happening. 
> > 
> > That idea would require us to add new API (a return value for 'cleaned'), 
> > and also a new flag for the clean ioctl. We also need the VMM to 
> > implement that, but then we get a proper cpu usage of cleaning time.
> >
> > I wanted to start with a backwards compatible version, and do the above 
> > idea once I put my hands in hardware that implements HACDBS, so I can 
> > properly measure how much performance we get on above strategy.
> > 
> > What do you think?
> 
> Yeah, I'd want to see some extremely compelling performance numbers for
> this approach before considering it, alongside the necessary VMM patches
> to actually activate it.
> 
> Seems likely to me that the VMM will want the background thread back
> ASAP that calls the clean ioctl so you'll need to work out how to cope
> with idle vCPUs in that case.

Fair point, HACDBS should be disabled if the vcpu gets scheduled-out, so we 
would need to be sure the vcpus stay scheduled, or the cleaning may take 
too long.

> 
> Even still, with this hypothetical approach I'd expect KVM to inspect
> the HACDBS state on every exit. The IRQ is just a convenient kick back
> out to the main KVM_RUN loop.

Got it. Will use the HACDBSCONS register instead to get that info on 
stopping.

Thanks!
Leo

