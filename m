Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E312C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icYDUZZ3YW64RLX5dJIbK7N+IzWrT7OHvyOM8fKUNEM=; b=C/coDTe4Y26KkXRiyaVwX+l7jh
	nA4XA/b2KgN1BR2rWPJNNx9zKbwxpNpdbXW1RwdDWWJ2/U+7ZLtEwVTn/6uHUSVA+Th01MOqe1ypR
	17P+zD/Fb4jqrl9hJvS8dB+p/9mDygeyHD6tMiHWkFl1XfnpbxEVzUqwKEnXRVxv87v7bHEDPnt59
	7IfB8RTdvtnNLin/WUvZt9HUJN+vjYxXP7Kp0zrkRR53pOhKVh60q5Nm8HBegNmYDqFYAn+PPPtcU
	PDNgdnbhNJEJJYOX5xNPuwy6PfsztR5pXEQWdoKm8IOSrSiNM/Vmc8oUNmDur7UrIpCRXOPHAD3R+
	CuJtuUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubF3v-00000001iGH-42k4;
	Mon, 14 Jul 2025 09:01:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubF1S-00000001hwQ-2Ezx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:58:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35E5C1764;
	Mon, 14 Jul 2025 01:58:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1528E3F694;
	Mon, 14 Jul 2025 01:58:50 -0700 (PDT)
Date: Mon, 14 Jul 2025 09:58:49 +0100
From: Leo Yan <leo.yan@arm.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] perf: arm_spe: Disable buffer before writing to
 PMBPTR_EL1 or PMBSR_EL1
Message-ID: <20250714085849.GC1093654@e132581.arm.com>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-2-52a2cd223d00@linaro.org>
 <20250704155016.GI1039028@e132581.arm.com>
 <b77f12e7-ea3f-4c57-9706-ff8e32721cc8@linaro.org>
 <20250707153710.GB2182465@e132581.arm.com>
 <aG4_uYJgpMXo3QHQ@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG4_uYJgpMXo3QHQ@raptor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_015854_664055_BC6BFDCA 
X-CRM114-Status: GOOD (  33.53  )
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

Hi Alexandru,

On Wed, Jul 09, 2025 at 11:08:57AM +0100, Alexandru Elisei wrote:

[...]

> > > > >   	case SPE_PMU_BUF_FAULT_ACT_OK:
> > > > >   		/*
> > > > > @@ -679,18 +692,14 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
> > > > >   		 * PMBPTR might be misaligned, but we'll burn that bridge
> > > > >   		 * when we get to it.
> > > > >   		 */
> > > > > -		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED)) {
> > > > > +		if (!(handle->aux_flags & PERF_AUX_FLAG_TRUNCATED))
> > > > >   			arm_spe_perf_aux_output_begin(handle, event);
> > > > > -			isb();
> > > > 
> > > > I am a bit suspecious we can remove this isb().
> > > > 
> > > > As a reference to the software usage PKLXF in Arm ARM (DDI 0487 L.a),
> > > > after enable TRBE trace unit, an ISB is mandatory. Maybe check a bit
> > > > for this?
> > >
> > > Wasn't this isb() to separate the programming of the registers with the
> > > status register clear at the end of this function to enable profiling?
> > 
> > Enabling profiling buffer followed an isb() is not only for separating
> > other register programming.
> > 
> > As described in section D17.9, Synchronization and Statistical Profiling
> > in Arm ARM:
> > 
> >   "A Context Synchronization event guarantees that a direct write to a
> >   System register made by the PE in program order before the Context
> >   synchronization event are observable by indirect reads and indirect
> >   writes of the same System register made by a profiling operation
> >   relating to a sampled operation in program order after the Context
> >   synchronization event."
> > 
> > My understanding is: after the ARM SPE profiling is enabled, the
> > followed ISB is a Synchronization to make sure the system register
> > values are observed by SPE. And we cannot rely on ERET, especially if
> > we are tracing the kernel mode.
> 
> Thought about this some more.
> 
> Before:
> 
> arm_spe_pmu_buf_get_fault_act:
>   <drain buffer>
>   ISB
> arm_spe_perf_aux_output_begin:
>   PMBLIMITR_EL1.E = 1
> ISB
> PMBSR_EL1.S = 0
> ERET
> 
> Now:
> 
> PMBLIMITR_EL1 = 0
> ISB
> 
> PMBSR_EL1.S = 0
> arm_spe_perf_aux_output_begin:
>   ISB
>   PMBLIMITR_EL1.E = 1
> ERET
> 
> I don't see much of a difference between the two sequences - the point after
> which we can be sure that profiling is enabled remains the ERET from the
> exception return.  The only difference is that, before this change, the ERET
> synchronized clearing the PMBSR_EL1.S bit, now it synchronizes setting the
> PMBLIMITR_EL1.E bit.
> 
> Thoughts?

To make the discussion easier, I'll focus on the trace enabling flow
in this reply.

My understanding of a sane flow would be:

  arm_spe_pmu_irq_handler() {
    arm_spe_perf_aux_output_begin() {
          SYS_PMBPTR_EL1 = base;

          ISB // Synchronization between SPE register setting and
              // enabling profiling buffer.
          PMBLIMITR_EL1.E = 1;
    }
    ISB // Context synchronization event to ensure visibility to SPE
  }

  ... start trace ... (Bottom half, e.g., softirq, etc)

  ERET

In the current code, arm_spe_perf_aux_output_begin() is followed by an
ISB, which serves as a context synchronization event to ensure
visibility to the SPE. After that, it ensures that the trace unit will
function correctly.

I understand that the Software Usage PKLXF recommends using an ERET as
the synchronization point. However, between enabling the profiling
buffer and the ERET, the kernel might execute other operations (e.g.,
softirqs, tasklets, etc.).

Therefore, it seems to me that using ERET as the synchronization point
may be too late. This is why I think we should keep an ISB after
arm_spe_perf_aux_output_begin().

Thanks,
Leo

