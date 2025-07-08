Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E0C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUTTwY48fDvDZYjl06ruhJ00SdfCQX7AaZXvZrCeAXs=; b=K6hHBt4tN3BpPUCRtDPekzxin/
	8WYQjR6UyqsIM3qqSasIkOCTg6X4LJiTA8AMKSKWMHJW+QGbTclBBSvyXCoEk/QyXwwACtDIVZh+G
	txVo2ZjMgrOh4/kR6Hiir+Q1hUjaBJ+U6TaSKsjzGP+G52fw5kawPRvpJg3Ust882PjLPTJW08qE5
	U1U+h1/+ZzwdYdMf+PpIZpl4ymRbo9GIrjqXHxWiZo/k5v0eXyHdc25d064R8zWFYEmesflWXN4D1
	TsaauHjzBcxoajFCNNKO+ij2WZYbn/y3/v7phSpjUad8rfoEa/2UiJNdhJu6pTpYAFrgJj6imlXar
	VunlIuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZH6D-00000006pVh-33oc;
	Tue, 08 Jul 2025 22:47:41 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZH0A-00000006owD-1os5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:41:27 +0000
Date: Tue, 8 Jul 2025 15:41:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752014483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jUTTwY48fDvDZYjl06ruhJ00SdfCQX7AaZXvZrCeAXs=;
	b=OHsE8WEpEXtiMI/CHyPeW896o0JqQQ66MUNJICSl5/kENXlqtqli0M3MswSRaUHkjj6QjD
	J9MTtpxZKs4VGZxVz/1tori3XdTeKl9TFvOmpds6s932LjkLV61G8YZSc7JpfwDaWwvWbs
	Lpvvm1xn4UvyKTdkhH/85b3B8eJQYqw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: mark.rutland@arm.com, kvm@vger.kernel.org, pbonzini@redhat.com,
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, mizhang@google.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	shuah@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 06/22] perf: arm_pmuv3: Introduce method to partition
 the PMU
Message-ID: <aG2eiEr63suouHga@linux.dev>
References: <aGwa2DGJq3FyxyEK@linux.dev>
 <gsnty0syz4t0.fsf@coltonlewis-kvm.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsnty0syz4t0.fsf@coltonlewis-kvm.c.googlers.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_154126_684010_9B81421E 
X-CRM114-Status: GOOD (  42.31  )
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

On Tue, Jul 08, 2025 at 10:38:35PM +0000, Colton Lewis wrote:
> Oliver Upton <oliver.upton@linux.dev> writes:
> 
> > On Mon, Jul 07, 2025 at 05:57:14PM +0100, Mark Rutland wrote:
> > > On Thu, Jun 26, 2025 at 08:04:42PM +0000, Colton Lewis wrote:
> > > > For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
> > > > counters into two ranges where counters 0..HPMN-1 are accessible by
> > > > EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
> > > > EL2.
> > > >
> > > > Create module parameter reserved_host_counters to reserve a number of
> > > > counters for the host. This number is set at boot because the perf
> > > > subsystem assumes the number of counters will not change after the PMU
> > > > is probed.
> > > >
> > > > Introduce the function armv8pmu_partition() to modify the PMU driver's
> > > > cntr_mask of available counters to exclude the counters being reserved
> > > > for the guest and record reserved_guest_counters as the maximum
> > > > allowable value for HPMN.
> > > >
> > > > Due to the difficulty this feature would create for the driver running
> > > > at EL1 on the host, partitioning is only allowed in VHE mode. Working
> > > > on nVHE mode would require a hypercall for every counter access in the
> > > > driver because the counters reserved for the host by HPMN are only
> > > > accessible to EL2.
> 
> > > It would be good if we could elaborate on this last point. When exactly
> > > do we intend to configure HPMN (e.g. is that static, dynamic at
> > > load/put, or dynamic at finer granularity)?
> 
> > > I ask becuase it's not immediately clear to me how this would break nVHE
> > > without also breaking direct userspace access on VHE, unless we flip
> > > HPMN dynamically at load/put, and this is only broken in some transient
> > > windows on nVHE.
> 
> > Agree that KVM's HPMN can only take effect between vcpu_load() /
> > vcpu_put().
> 
> > The changelog isn't correct regarding the complications of nVHE, though.
> > In order to support a 'partitioned' PMU on nVHE we'd need to explicitly
> > disable guest counters on every exit and reset HPMN to place all
> > counters in the 'first range'. Unless someone has a use case for this
> > stuff on nVHE I'm not too bothered by the VHE-only limitation.
> 
> I'll fix this.
> 
> > > >
> > > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
> > > > ---
> > > >  arch/arm/include/asm/arm_pmuv3.h   | 14 ++++++
> > > >  arch/arm64/include/asm/arm_pmuv3.h |  5 ++
> > > >  arch/arm64/include/asm/kvm_pmu.h   |  6 +++
> > > >  arch/arm64/kvm/Makefile            |  2 +-
> > > >  arch/arm64/kvm/pmu-part.c          | 23 ++++++++++
> 
> > > Maybe I'll contradict Oliver and Marc here (and whatever they say
> > > rules), but IMO it'd be nice to spell out "partition" rather than "part"
> > > here for clarity.
> 
> > I'm not too big of a fan of the naming here either. I'd prefer something
> > like "pmu-direct". Partitioning is just a side effect of how we're
> > allocating counters currently and most of this implementation could be
> > reused if we pass the entire PMU to the guest in the future.
> 
> Sure.
> 
> > With that being said -- Colton I'd focus on getting these patches in
> > shape while we figure out what color we want it ;-)
> 
> > Thanks,
> > Oliver
> 
> Trust me I'm working on it.

I know you are -- this comment wasn't meant to add pressure to you. Just
noting that we might bikeshed a bit further on the naming here but I
wouldn't worry much about it for the time being.

sed isn't _that_ difficult :)

Thanks,
Oliver

