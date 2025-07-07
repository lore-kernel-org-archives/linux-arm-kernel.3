Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFF1C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jGaD8c3ubRcJrs9E7PPKpi1NHgV8be7gu6+Mc5pNTw=; b=p0xjNYS86Bv+npB96ODmWdA6bL
	+7lZxmuTL2KdRfiKQcMWgd2j1y2c0AekvhSpuvPNEpY8rh33420+Yiy+kFcRC6CpmgwpCmxC8q2lA
	zsjo0bYYCaYYVQ9tfLPXRED+GWCT+CTZgxBS34GUOeahQRt59ASNrPmWRf8LY40UT9GVx4YPh3p3x
	I9hsdGYFv95kzW/3GpI4bMcW90KLYN9cxs1LVdNzKr+n5Vt6Ppk8RfB+jY1PMtc+RyEX87KIwxYpm
	jrsldqLra9/AGCCL8//Ao7j0kLnWL/s9lmlmUYZm37ZWRpacyxP/H3dTYM2DPS+qHfpiou1TMgH8V
	l4HJqLWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrHp-00000003Q4y-0L8Q;
	Mon, 07 Jul 2025 19:13:57 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrBT-00000003Ov4-00rE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 19:07:24 +0000
Date: Mon, 7 Jul 2025 12:07:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751915238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2jGaD8c3ubRcJrs9E7PPKpi1NHgV8be7gu6+Mc5pNTw=;
	b=aobMN78gUyxXzBZrku/l0hi14PBGY/TRhvSw5ZW677kY73Urv0Jo6skIl8SFHlE1+v7WLh
	HWODbBjgI3VI0Sd7XDIPDmZpD9eRkDhHBjm19CQeBICmRcbomFiKQW7gQFBIXMIZFDW2Ir
	oJoOWO0Vob31Jguq+jObCoOe5w83Kb0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 06/22] perf: arm_pmuv3: Introduce method to partition
 the PMU
Message-ID: <aGwa2DGJq3FyxyEK@linux.dev>
References: <20250626200459.1153955-1-coltonlewis@google.com>
 <20250626200459.1153955-7-coltonlewis@google.com>
 <aGv8arq8NgaRCu7h@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGv8arq8NgaRCu7h@J2N7QTR9R3>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_120723_470727_E8A6EC2F 
X-CRM114-Status: GOOD (  31.34  )
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

On Mon, Jul 07, 2025 at 05:57:14PM +0100, Mark Rutland wrote:
> On Thu, Jun 26, 2025 at 08:04:42PM +0000, Colton Lewis wrote:
> > For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
> > counters into two ranges where counters 0..HPMN-1 are accessible by
> > EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
> > EL2.
> > 
> > Create module parameter reserved_host_counters to reserve a number of
> > counters for the host. This number is set at boot because the perf
> > subsystem assumes the number of counters will not change after the PMU
> > is probed.
> > 
> > Introduce the function armv8pmu_partition() to modify the PMU driver's
> > cntr_mask of available counters to exclude the counters being reserved
> > for the guest and record reserved_guest_counters as the maximum
> > allowable value for HPMN.
> > 
> > Due to the difficulty this feature would create for the driver running
> > at EL1 on the host, partitioning is only allowed in VHE mode. Working
> > on nVHE mode would require a hypercall for every counter access in the
> > driver because the counters reserved for the host by HPMN are only
> > accessible to EL2.
> 
> It would be good if we could elaborate on this last point. When exactly
> do we intend to configure HPMN (e.g. is that static, dynamic at
> load/put, or dynamic at finer granularity)?
> 
> I ask becuase it's not immediately clear to me how this would break nVHE
> without also breaking direct userspace access on VHE, unless we flip
> HPMN dynamically at load/put, and this is only broken in some transient
> windows on nVHE.

Agree that KVM's HPMN can only take effect between vcpu_load() /
vcpu_put().

The changelog isn't correct regarding the complications of nVHE, though.
In order to support a 'partitioned' PMU on nVHE we'd need to explicitly
disable guest counters on every exit and reset HPMN to place all
counters in the 'first range'. Unless someone has a use case for this
stuff on nVHE I'm not too bothered by the VHE-only limitation.

> > 
> > Signed-off-by: Colton Lewis <coltonlewis@google.com>
> > ---
> >  arch/arm/include/asm/arm_pmuv3.h   | 14 ++++++
> >  arch/arm64/include/asm/arm_pmuv3.h |  5 ++
> >  arch/arm64/include/asm/kvm_pmu.h   |  6 +++
> >  arch/arm64/kvm/Makefile            |  2 +-
> >  arch/arm64/kvm/pmu-part.c          | 23 ++++++++++
> 
> Maybe I'll contradict Oliver and Marc here (and whatever they say
> rules), but IMO it'd be nice to spell out "partition" rather than "part"
> here for clarity.

I'm not too big of a fan of the naming here either. I'd prefer something
like "pmu-direct". Partitioning is just a side effect of how we're
allocating counters currently and most of this implementation could be
reused if we pass the entire PMU to the guest in the future.

With that being said -- Colton I'd focus on getting these patches in
shape while we figure out what color we want it ;-)

Thanks,
Oliver

