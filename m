Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122DFC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIYmKH9WVPFu1g1xwUin2jx6GqbH0tjFsWZDL7mkaAo=; b=D2fJsX0OitzWt3iH2M86OVKLGz
	LjJkSt0vdd7vPV2vzaQP870bXaFJvO4lqgvSzNrbTbcnPjKnZJA3N4KjD91+Q3H5fcVvWkaMy2zZ7
	3GPOR5+1LiMGAQRRsqsyRNaIWBfGkJzrA0WxoS/TYg6S+/6tpfnGvJ3UmoHaAgbeX50VIvWwJGnKb
	IRwfkgv8zPirG8Y8wL7SLnTlMGB7RogaPzxR3BDmWTBF4J8zn/2WS5EYJrcQwGNy6EL+3OsoiipPL
	zR75F2D8JLQSUjlQNvbwmyw4F2DQdRVemmNNZhn2XuuYmZmVVAmjRziGWNP71lYB5higcINmIwvT6
	xTQelZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZnH-0000000HItr-1JiI;
	Tue, 30 Jun 2026 14:50:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZnE-0000000HItB-0fRW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:50:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44C282ED2;
	Tue, 30 Jun 2026 07:50:24 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A158A3F85F;
	Tue, 30 Jun 2026 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782831028; bh=FmGcRpgqVH1Jyet3amoELywEs1aHDjFjiXmR4Ai9K98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DEus4bOrMtPLgrSAGt0EtnVJSrPt183sUxeCw5swqIK7G/W+bDiUNlIa/ENsn1q9S
	 Ix+mwplKNj5DpeBcrAHKKzV8K/1MCOx6g4fV2IBjAXx7Kuo0F4lJTHOlnrbbqtsCKY
	 2dyl9M0CURgvFIFZVqY/6Inv2dcOymDf4jQSKr4o=
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
Date: Tue, 30 Jun 2026 15:50:17 +0100
Message-ID: <akPXqZQBKET1SyvN@LeoBrasDK>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <akKpxDulRN7zDrgM@kernel.org>
References: <20260629111820.1873540-1-leo.bras@arm.com> <20260629111820.1873540-6-leo.bras@arm.com> <akKpxDulRN7zDrgM@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_075032_467364_ADE8711D 
X-CRM114-Status: GOOD (  33.48  )
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

On Mon, Jun 29, 2026 at 10:22:12AM -0700, Oliver Upton wrote:
> On Mon, Jun 29, 2026 at 12:17:53PM +0100, Leonardo Bras wrote:
> > Find via ACPI [1] the Id for HACDBSIRQ, initialize it as a per-cpu IRQ
> > and make sure any cpu able to run virtualization has it active.
> > 
> > Introduce a per-cpu structure used by the HACDBSIRQ handler to keep track
> > of entries size and the status of HACDBS. Size is used to detect end of
> > processing in case the number of entries being processed is different of
> > the supported entries size.
> > 
> > Status may look easily replaceable by checking HACDBS registers now, but
> > will make the OFF/IDLE detection easier in next patches.
> > 
> > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> > 
> > [1] https://github.com/tianocore/edk2/issues/12409
> 
> Reference the ACPI specification instead please.

It's not accepted yet, unfortunately. I commented that into the cover 
letter, but forgot to add it here.

> Any link you want to
> include in a changelog should use the Link: footer, the linkage to the
> inline citation will be obvious.

Sure, will remember that in the future.

> 
> If we need to initialize the IRQ I'd really like to see device tree
> bindings for HACDBSIRQ as well. Pretty much any system us plebs can get
> our hands on is gonna be DT anyway.

Agree. I started out with ACPI because that's what the main target is, as 
dirty-logging is focused in Live Migration, which is usually more 
appreciated in the server space, which generally uses ACPI.

I spoke to some people, and I could not hear of anyone releasing a product 
based in DT that would implement this yet, so I postponed the DT 
enablement.

> 
> > +static irqreturn_t hacdbsirq_handler(int irq, void *pcpu)
> > +{
> > +	u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
> > +	unsigned long err = FIELD_GET(HACDBSCONS_EL2_ERR_REASON, cons);
> > +
> > +	switch (err) {
> > +	case HACDBSCONS_EL2_ERR_REASON_NOF:
> > +		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> > +		break;
> > +	case HACDBSCONS_EL2_ERR_REASON_IPAHACF:
> > +		/* When size not a power of two >= 4k, exit with reserved TTLW */
> > +		int index = FIELD_GET(HACDBSCONS_EL2_INDEX, cons);
> > +
> > +		if (index >= this_cpu_read(hacdbs_pcp.size)) {
> > +			this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> > +			break;
> > +		}
> > +		fallthrough;
> > +	case HACDBSCONS_EL2_ERR_REASON_STRUCTF:
> > +	case HACDBSCONS_EL2_ERR_REASON_IPAF:
> > +		this_cpu_write(hacdbs_pcp.status, HACDBS_ERROR);
> > +		break;
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> 
> I have a pretty extreme distaste for creating a state machine between
> the callsite and the IRQ handler. The callsite should poll HACDBS for
> completion. The thread has nothing better to do anyway.

Well, there is one argument it could just wait and save some energy, but I 
agree it is not relevant in server space. The main reason I did this is 
because I am planning on later doing an improved version of this that would 
clean the dirty-bit *while* running the guest, and having the IRQ is needed 
for exiting guest so we can notify userspace the cleaning is done. So I 
laid the HACDBSIRQ infra here so we don't have both polling and IRQ options 
happening. 

That idea would require us to add new API (a return value for 'cleaned'), 
and also a new flag for the clean ioctl. We also need the VMM to 
implement that, but then we get a proper cpu usage of cleaning time.

I wanted to start with a backwards compatible version, and do the above 
idea once I put my hands in hardware that implements HACDBS, so I can 
properly measure how much performance we get on above strategy.

What do you think?

Thanks!
Leo

  

