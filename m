Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7B3C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 20:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg2P5N/lgAa+Pjwmt6Xv30iT0//GYcryM47I3itLJEs=; b=wLYXfx+B9bZ8odE9OQfpln+gEi
	BJgd7RmHk6gSMSewwVm02BivI7zzEOLi9MIKpDeE5UKsbLPr6Hgr6owMD09snhS5Zv19n19LgIN1U
	0c/WhsyFmh/HLMDuNK81v4NTEhOmRC9XPH3QAqGkVTFpLXMvBHU5gi8o2FlJzl2BIV/hdRfWRSext
	+1+p4wF/qIkyYxIipTKPMehp/2nxQLqC+XxGNxobMfxvpZsdl2kIr9zo73uWNBAJBbOSnPWgoBrBV
	QIV4JnkZ2GDCrYJL4o+GJcWnMClbs25bQGsIg4EIRR0fMdWmxqweRw1wmNLLyrBZsnNqzwsiv/OS0
	YpnmjJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXZo-00000009Zgy-1Bsc;
	Wed, 26 Mar 2025 20:42:16 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXY3-00000009ZVw-2ZEt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 20:40:29 +0000
Date: Wed, 26 Mar 2025 13:40:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743021623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wg2P5N/lgAa+Pjwmt6Xv30iT0//GYcryM47I3itLJEs=;
	b=tiut/nE5Sd50+xXN1DOthjMja5xf6A769EkXEIuON8c27ybVj1FLwM/UIPbk4rdmXybG84
	MMf9m+ycBH8XC+mocUwwkhYuTmxb62uNkK5Q8sdlZMjJf2WeVJy1t7AgzpI1pZFHYMrCT/
	k9ZPVoxbEfJk42i66cO5qQ4rwyy9WmI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Clark <james.clark@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>, kvm@vger.kernel.org,
	robh@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com,
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	pbonzini@redhat.com, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v3 5/8] KVM: arm64: Introduce module param to
 partition the PMU
Message-ID: <Z-RmMLkTuwsea7Uk@linux.dev>
References: <gsnt1pulnepv.fsf@coltonlewis-kvm.c.googlers.com>
 <f7d543f6-2660-460f-88ac-741dd47ed440@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d543f6-2660-460f-88ac-741dd47ed440@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_134027_922766_09762B7E 
X-CRM114-Status: GOOD (  30.78  )
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

On Wed, Mar 26, 2025 at 05:38:34PM +0000, James Clark wrote:
> On 25/03/2025 6:32 pm, Colton Lewis wrote:
> > > I don't know if this is a stupid idea, but instead of having a fixed
> > > number for the partition, wouldn't it be nice if we could trap and
> > > increment HPMN on the first guest use of a counter, then decrement it on
> > > guest exit depending on what's still in use? The host would always
> > > assign its counters from the top down, and guests go bottom up if they
> > > want PMU passthrough. Maybe it's too complicated or won't work for
> > > various reasons, but because of BRBE the counter partitioning changes go
> > > from an optimization to almost a necessity.
> > 
> > This is a cool idea that would enable useful things. I can think of a
> > few potential problems.
> > 
> > 1. Partitioning will give guests direct access to some PMU counter
> > registers. There is no reliable way for KVM to determine what is in use
> > from that state. A counter that is disabled guest at exit might only be
> > so temporarily, which could lead to a lot of thrashing allocating and
> > deallocating counters.

KVM must always have a reliable way to determine if the PMU is in use.
If there's any counter in the vPMU for which kvm_pmu_counter_is_enabled()
is true would do the trick...

Generally speaking, I would like to see the guest/host context switch in
KVM modeled in a way similar to the debug registers, where the vPMU
registers are loaded onto hardware lazily if either:

  1) The above definition of an in-use PMU is satisfied

  2) The guest accessed a PMU register since the last vcpu_load()

> > 2. HPMN affects reads of PMCR_EL0.N, which is the standard way to
> > determine how many counters there are. If HPMN starts as a low number,
> > guests have no way of knowing there are more counters
> > available. Dynamically changing the counters available could be
> > confusing for guests.
> > 
> 
> Yes I was expecting that PMCR would have to be trapped and N reported to be
> the number of physical counters rather than how many are in the guest
> partition.

I'm not sure this is aligned with the spirit of the feature.

Colton's aim is to minimize the overheads of trapping the PMU *and*
relying on the perf subsystem for event scheduling. To do dynamic
partitioning as you've described, KVM would need to unconditionally trap
the PMU registers so it can pack the guest counters into the guest
partition. We cannot assume the VM will allocate counters sequentially.

Dynamic counter allocation can be had with the existing PMU
implementation. The partitioned PMU is an alternative userspace can
select, not a replacement for what we already have.

Thanks,
Oliver

