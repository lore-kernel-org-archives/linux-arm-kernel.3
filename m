Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA84AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 00:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKxQUSmpTCdRhHeB+mUzyq09Je0k79BxYRE2H27YH/E=; b=4qHPQ7CW4wliaNBl1ujYOxAUhU
	BrtTMMZdmQLWoI2LjkzKl5J+01h0qR4V8HMNGuwbg+ASNeoVAfybT/9F/nT8VJuYCTzvIbWBeTiVS
	SntSRld++qItVjaOdNGIycVunRJdXfdZoX31OMx/FPWdHUphNBV3DMeoGBvd57BGxXW9xcLil1xQF
	Qss428qcRGhffTMlhfDsBQGJVXTQ7sPAA/2Tx/sE1n0NEtSxsWs9lE4O3mtlPrWTzMiASSSZ7pRsA
	UTf9wKaurweU+BsodCTt6ZXyu3UUNIcFebKhSWYr6k14/+DWb/HkvecT+hP7Bj+tKC0ei+1OE7f/e
	ZSLPndnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukX9z-00000003uxf-3Gft;
	Sat, 09 Aug 2025 00:10:07 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukWCM-00000003qid-1uTE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 23:08:32 +0000
Date: Fri, 8 Aug 2025 16:08:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754694507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dKxQUSmpTCdRhHeB+mUzyq09Je0k79BxYRE2H27YH/E=;
	b=uh8iDmv79ewEgnftriRVVLaUf8NnoGiKpNpDcqs/ZBuvIoGlELbgtdqdFDYNIIl66czDB2
	ounj7qjpP4ivL4I5uV6iItD2v9UdS/JHTEAoVVhAFztQ0ArM3UnQkhb34cFPXj+J6QH7y7
	918JoUjZXL5FuLYycMvc4LkU3Y1Gz2Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/2] KVM: arm64: PMU: Introduce
 KVM_ARM_VCPU_PMU_V3_COMPOSITION
Message-ID: <aJaDYhme_St2b2sM@linux.dev>
References: <20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
 <20250806-hybrid-v2-1-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
 <aJOO99xUrhsrvLwl@linux.dev>
 <276fdfb8-f1ca-44ad-b310-a811684b265a@rsg.ci.i.u-tokyo.ac.jp>
 <aJQJdElbZJ6KzQxD@linux.dev>
 <62494f54-13c6-4b9f-86a1-9a19ce58e91f@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62494f54-13c6-4b9f-86a1-9a19ce58e91f@rsg.ci.i.u-tokyo.ac.jp>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_160830_709153_6A7CE65C 
X-CRM114-Status: GOOD (  28.99  )
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

On Thu, Aug 07, 2025 at 11:06:21PM +0900, Akihiko Odaki wrote:
> > The only cross-PMU events we will support are the fixed counters, my
> > strong preference is that we do not reverse-map architectural events to
> > generic perf events for all counters.
> 
> I wonder if there is a benefit to special case PERF_COUNT_HW_CPU_CYCLES
> then; the current logic of kvm_map_pmu_event() looks sufficient for me.

I'd rather we just use the generic perf events and let the driver remap
things on our behalf. These are fixed counters, using constant events
feels like the right way to go about that.

kvm_map_pmu_event() is trying to solve a slightly different problem
where we need to map programmable PMUv3 events into a non-PMUv3 event
space, like on the M1 PMU.

> > This isn't what I meant. What I mean is that userspace either can use
> > the SET_PMU ioctl or the COMPOSITION ioctl. Once one of them has been
> > used the other ioctl returns an error.
> > 
> > We're really bad at getting ioctl ordering / interleaving right and
> > syzkaller has a habit of finding these mistakes. There's zero practical
> > value in using both of these ioctls on the same VM, let's prevent it.
> 
> The corresponding RFC series for QEMU uses KVM_ARM_VCPU_PMU_V3_SET_PMU to
> probe host PMUs, and falls back to KVM_ARM_VCPU_PMU_V3_COMPOSITION if none
> covers all CPUs. Switching between SET_PMU and COMPOSITION is useful during
> such probing.
> 
> COMPOSITION is designed to behave like just another host PMU that is set
> with SET_PMU. SET_PMU allows setting a different host PMU even if SET_PMU
> has already been invoked so it is also allowed to set a host PMU even if
> COMPOSITION has already been invoked, maintaining consistency with
> non-composed PMUs.
> 
> You can find the QEMU patch at:
> https://lore.kernel.org/qemu-devel/20250806-kvmq-v1-1-d1d50b7058cd@rsg.ci.i.u-tokyo.ac.jp/
> 
> (look up KVM_ARM_VCPU_PMU_V3_SET_PMU for the probing code)

Having both of these attributes return success when probed with
KVM_HAS_DEVICE_ATTR is fine; what I mean is that once KVM_SET_DEVICE_ATTR
has been called on an attribute the other fails.

> > On a system that has FEAT_PMUv3_ICNTR, userspace can still use this
> > ioctl and explicitly de-feature ICNTR by writing to the ID register
> > after initialization.
> 
> Now I understand better.
> 
> Currently, KVM_ARM_VCPU_PMU_V3_COMPOSITION sets supported_cpus to ones that
> have cycle counters compatible with PMU emulation.
> 
> If FEAT_PMUv3_ICNTR is set to the ID register, I guess
> KVM_ARM_VCPU_PMU_V3_COMPOSITION will set supported_cpus to ones that have
> compatible cycle and instruction counters. If so, the naming
> KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY indeed makes sense.

Perfect. Ideally SOC vendors do the sensible thing and ensure that
FEAT_PMUv3_ICNTR is consistent on all implementations in a machine. We
will hide the feature in KVM if it is not.

Thanks,
Oliver

