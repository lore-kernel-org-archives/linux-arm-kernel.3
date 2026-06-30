Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03964C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5orsAk4mxkk0xAiwGeSLhKn5054x2lo0gntH314gJng=; b=HhmtKFrQT4iLk2gZ1K1E/ptwhm
	jSnfQ26eggCeXXLKFlqSi0FbW5iPs7ZLSoKTq6cL0fzp5VbboJY+IkF1THjgiDMAA6zlKB8iNl/TP
	lNewqzq3RK7GHbkZF+FtJ8WHZEv+5YNusHP7Bdy0jyZbJoFrPnlJQZ6eULtdNaCprvUB8bhj1h3XQ
	xqeg7/m40ipifdi5k2syxEoVxUooqRla9Cmq9ybYW4qsRZNS/go6kynNamVVvt7m4daUKPitIKA+A
	DSilz9npAAg2IjbqcBSEWraHwWVYQrYAm5fPxnF8pRqSY3U8DCVyYn+DdLEx0IKWwjsG1rBxgcpcR
	GWAzCHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weavk-0000000HR4c-23vY;
	Tue, 30 Jun 2026 16:03:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weavj-0000000HR4N-10fh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:03:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAB94601C7;
	Tue, 30 Jun 2026 16:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2431F000E9;
	Tue, 30 Jun 2026 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782835402;
	bh=5orsAk4mxkk0xAiwGeSLhKn5054x2lo0gntH314gJng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QVWIo26AMO7GP6c94JvYh/Y7RzmhCi07mxsA6UYNrJbFnIynTHhPa0jmUuQSrg8QL
	 Hbzo3P8h/Riz1MauTUCNiy9zCP8H1OiRPBun55CjzObt8N3SYJv1appZ++ltSy8T8c
	 8Ubj0ttWvKMGw8Qmyr91ofP4GGc2WRW5qnMmVyBsf+b9Pw7eW79+bjWaGuqH0N4FYq
	 mn5xRtyDidGKpUKiLbZpcUA6ouvS2lxYQ6AosYDPrnOnB+h31btCpOIs3DVTYHfPl/
	 pXgeHKU+FtWHm++YApJL9TmkDQVdpctUyqUeXEXUfG6wY6O1dS3va+gW/hheUHWrV3
	 1sNwAqk1ECFAQ==
Date: Tue, 30 Jun 2026 09:03:20 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>, Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>, Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 05/13] KVM: arm64: Detect (via ACPI) and initialize
 HACDBSIRQ
Message-ID: <akPoyAGX5_ankwWD@kernel.org>
References: <20260629111820.1873540-1-leo.bras@arm.com>
 <20260629111820.1873540-6-leo.bras@arm.com>
 <akKpxDulRN7zDrgM@kernel.org>
 <akPXqZQBKET1SyvN@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPXqZQBKET1SyvN@LeoBrasDK>
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

On Tue, Jun 30, 2026 at 03:50:17PM +0100, Leonardo Bras wrote:
> On Mon, Jun 29, 2026 at 10:22:12AM -0700, Oliver Upton wrote:
> > If we need to initialize the IRQ I'd really like to see device tree
> > bindings for HACDBSIRQ as well. Pretty much any system us plebs can get
> > our hands on is gonna be DT anyway.
> 
> Agree. I started out with ACPI because that's what the main target is, as 
> dirty-logging is focused in Live Migration, which is usually more 
> appreciated in the server space, which generally uses ACPI.
> 
> I spoke to some people, and I could not hear of anyone releasing a product 
> based in DT that would implement this yet, so I postponed the DT 
> enablement.

Nested virt is always a good example. In some distant future KVM could
expose FEAT_HACDBS to the L1 hypervisor, and the VMM may be using DT
instead of ACPI (like kvmtool).

> > 
> > > +static irqreturn_t hacdbsirq_handler(int irq, void *pcpu)
> > > +{
> > > +	u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
> > > +	unsigned long err = FIELD_GET(HACDBSCONS_EL2_ERR_REASON, cons);
> > > +
> > > +	switch (err) {
> > > +	case HACDBSCONS_EL2_ERR_REASON_NOF:
> > > +		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> > > +		break;
> > > +	case HACDBSCONS_EL2_ERR_REASON_IPAHACF:
> > > +		/* When size not a power of two >= 4k, exit with reserved TTLW */
> > > +		int index = FIELD_GET(HACDBSCONS_EL2_INDEX, cons);
> > > +
> > > +		if (index >= this_cpu_read(hacdbs_pcp.size)) {
> > > +			this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> > > +			break;
> > > +		}
> > > +		fallthrough;
> > > +	case HACDBSCONS_EL2_ERR_REASON_STRUCTF:
> > > +	case HACDBSCONS_EL2_ERR_REASON_IPAF:
> > > +		this_cpu_write(hacdbs_pcp.status, HACDBS_ERROR);
> > > +		break;
> > > +	}
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > 
> > I have a pretty extreme distaste for creating a state machine between
> > the callsite and the IRQ handler. The callsite should poll HACDBS for
> > completion. The thread has nothing better to do anyway.
> 
> Well, there is one argument it could just wait and save some energy, but I 
> agree it is not relevant in server space.

I wouldn't suggest polling in a tight loop :) I'd say use something like
__mdelay() to get the core into a low-power state w/o using a naked WFI.
In fact, that already uses WFxT under the hood.

> The main reason I did this is 
> because I am planning on later doing an improved version of this that would 
> clean the dirty-bit *while* running the guest, and having the IRQ is needed 
> for exiting guest so we can notify userspace the cleaning is done. So I 
> laid the HACDBSIRQ infra here so we don't have both polling and IRQ options 
> happening. 
> 
> That idea would require us to add new API (a return value for 'cleaned'), 
> and also a new flag for the clean ioctl. We also need the VMM to 
> implement that, but then we get a proper cpu usage of cleaning time.
>
> I wanted to start with a backwards compatible version, and do the above 
> idea once I put my hands in hardware that implements HACDBS, so I can 
> properly measure how much performance we get on above strategy.
> 
> What do you think?

Yeah, I'd want to see some extremely compelling performance numbers for
this approach before considering it, alongside the necessary VMM patches
to actually activate it.

Seems likely to me that the VMM will want the background thread back
ASAP that calls the clean ioctl so you'll need to work out how to cope
with idle vCPUs in that case.

Even still, with this hypothetical approach I'd expect KVM to inspect
the HACDBS state on every exit. The IRQ is just a convenient kick back
out to the main KVM_RUN loop.

Thanks,
Oliver

