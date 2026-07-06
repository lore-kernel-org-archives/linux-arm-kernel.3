Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlt7gyOtAmEFrvc2qOzoMo9OkzF+3UzobU8kULMEyjE=; b=y0G+C5Xt+4HpIevw1wbS7EA3TU
	gXXRHc3EidZlkmHE/rlAlslrA7Z4Izy04ARhuMDsiV9SpiUYo4MIRzvy4W7YuWtwJ2UZdF+8KNU2O
	zXb83OhDHbcE/0mutw186jN07DPn+cT2Gzfb/jAvNP6+W24DdDMZwBoXek2sEOe2YkuSnfSRJkdew
	cSlKc9X2kVONXuysE3WWYmEHdkfgnajcy0Fbn0U/ex+UI3TRLpX4u0zo2fm/ZH2n9eibVv+q4Xx/N
	PyPM2GPQWqxLDXsQeoKrUkXQptSFMVmoCSdEUrdLNWtB89nn0YaIsRo0mEZ0CfoOp50BvdwEfNVfF
	mY0P/l0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjtA-0000000Cg9c-2t0W;
	Mon, 06 Jul 2026 14:01:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjt8-0000000Cg9A-1NmM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:01:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA6892BCB;
	Mon,  6 Jul 2026 07:01:28 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F79E3F7B4;
	Mon,  6 Jul 2026 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783346493; bh=+oN658RgH9K/lAIMCdUeIY2Kt33aA1hzIvXPSf3IE5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lEFY1Rdig2oEpz4BrvC0JKnSfTlRJptRPbVsfRu2RwWrm1wSluz9NtO4DHEzW5khu
	 AtYbRZv5jnqRrGXEWAFWUDxH6i1d0KYXPavUNPM9vsnePRaj+osYyterI5ho0/r5IJ
	 nWgHLLRf+GGC3pRJDorVzlXs2O2xEvuLeG00NEDQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	liuyonglong@huawei.com,
	Jonathan.Cameron@huawei.com,
	yezhenyu2@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v3 3/5] KVM: arm64: Add support for FEAT_HDBSS
Date: Mon,  6 Jul 2026 15:01:28 +0100
Message-ID: <aku1N23Szkta9uA6@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <22abfaf8-8636-4ed3-9a5c-fb4fdef1bc19@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com> <20260225040421.2683931-4-zhengtian10@huawei.com> <ahzUUDAMoHtDFJD3@inochi.infowork> <864ijmvdpy.wl-maz@kernel.org> <ah1KLrpYBXSMM91H@inochi.infowork> <22abfaf8-8636-4ed3-9a5c-fb4fdef1bc19@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_070134_448647_022B0560 
X-CRM114-Status: GOOD (  46.15  )
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

On Fri, Jun 05, 2026 at 04:29:49PM +0800, Tian Zheng wrote:
> 
> On 6/1/2026 5:05 PM, Inochi Amaoto wrote:
> > On Mon, Jun 01, 2026 at 09:58:49AM +0100, Marc Zyngier wrote:
> > > On Mon, 01 Jun 2026 01:50:22 +0100,
> > > Inochi Amaoto <inochiama@gmail.com> wrote:
> > > > On Wed, Feb 25, 2026 at 12:04:19PM +0800, Tian Zheng wrote:
> > > > > From: eillon <yezhenyu2@huawei.com>
> > > > > 
> > > > > Armv9.5 introduces the Hardware Dirty Bit State Structure (HDBSS) feature,
> > > > > indicated by ID_AA64MMFR1_EL1.HAFDBS == 0b0100. A CPU capability is added
> > > > > to notify the user of the feature.
> > > > > 
> > > > > Add KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl and basic framework for
> > > > > ARM64 HDBSS support. Since the HDBSS buffer size is configurable and
> > > > > cannot be determined at KVM initialization, an IOCTL interface is
> > > > > required.
> > > > > 
> > > > > Actually exposing the new capability to user space happens in a later
> > > > > patch.
> > > > > 
> > > > > Signed-off-by: eillon <yezhenyu2@huawei.com>
> > > > > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > > > > ---
> > > > >   arch/arm64/include/asm/cpufeature.h |  5 +++++
> > > > >   arch/arm64/kernel/cpufeature.c      | 12 ++++++++++++
> > > > >   arch/arm64/tools/cpucaps            |  1 +
> > > > >   include/uapi/linux/kvm.h            |  1 +
> > > > >   tools/include/uapi/linux/kvm.h      |  1 +
> > > > >   5 files changed, 20 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > > > > index 4de51f8d92cb..dcc2e2cad5ad 100644
> > > > > --- a/arch/arm64/include/asm/cpufeature.h
> > > > > +++ b/arch/arm64/include/asm/cpufeature.h
> > > > > @@ -856,6 +856,11 @@ static inline bool system_supports_haft(void)
> > > > >   	return cpus_have_final_cap(ARM64_HAFT);
> > > > >   }
> > > > > 
> > > > > +static inline bool system_supports_hdbss(void)
> > > > > +{
> > > > > +	return cpus_have_final_cap(ARM64_HAS_HDBSS);
> > > > > +}
> > > > > +
> > > > >   static __always_inline bool system_supports_mpam(void)
> > > > >   {
> > > > >   	return alternative_has_cap_unlikely(ARM64_MPAM);
> > > > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > > > index c31f8e17732a..348b0afffc3e 100644
> > > > > --- a/arch/arm64/kernel/cpufeature.c
> > > > > +++ b/arch/arm64/kernel/cpufeature.c
> > > > > @@ -2124,6 +2124,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> > > > >   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
> > > > >   }
> > > > > 
> > > > > +static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int cope)
> > > > > +{
> > > > > +	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, cope);
> > > > > +}
> > > > > +
> > > > >   bool cpu_supports_bbml2_noabort(void)
> > > > >   {
> > > > >   	/*
> > > > > @@ -2759,6 +2764,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> > > > >   		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
> > > > >   	},
> > > > >   #endif
> > > > > +	{
> > > > > +		.desc = "Hardware Dirty state tracking structure (HDBSS)",
> > > > > +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > > > > +		.capability = ARM64_HAS_HDBSS,
> > > > > +		.matches = has_vhe_hdbss,
> > > > > +		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HDBSS)
> > > > > +	},
> > > > >   	{
> > > > >   		.desc = "CRC32 instructions",
> > > > >   		.capability = ARM64_HAS_CRC32,
> > > > > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > > > > index 7261553b644b..f6ece5b85532 100644
> > > > > --- a/arch/arm64/tools/cpucaps
> > > > > +++ b/arch/arm64/tools/cpucaps
> > > > > @@ -68,6 +68,7 @@ HAS_VA52
> > > > >   HAS_VIRT_HOST_EXTN
> > > > >   HAS_WFXT
> > > > >   HAS_XNX
> > > > > +HAS_HDBSS
> > > > >   HAFT
> > > > >   HW_DBM
> > > > >   KVM_HVHE
> > > > 
> > > > > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > > > > index 65500f5db379..15ee42cdbd51 100644
> > > > > --- a/include/uapi/linux/kvm.h
> > > > > +++ b/include/uapi/linux/kvm.h
> > > > > @@ -985,6 +985,7 @@ struct kvm_enable_cap {
> > > > >   #define KVM_CAP_ARM_SEA_TO_USER 245
> > > > >   #define KVM_CAP_S390_USER_OPEREXEC 246
> > > > >   #define KVM_CAP_S390_KEYOP 247
> > > > > +#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248
> > > > > 
> > > > >   struct kvm_irq_routing_irqchip {
> > > > >   	__u32 irqchip;
> > > > > diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
> > > > > index dddb781b0507..93e0a1e14dc7 100644
> > > > > --- a/tools/include/uapi/linux/kvm.h
> > > > > +++ b/tools/include/uapi/linux/kvm.h
> > > > > @@ -974,6 +974,7 @@ struct kvm_enable_cap {
> > > > >   #define KVM_CAP_GUEST_MEMFD_FLAGS 244
> > > > >   #define KVM_CAP_ARM_SEA_TO_USER 245
> > > > >   #define KVM_CAP_S390_USER_OPEREXEC 246
> > > > > +#define KVM_CAP_ARM_HW_DIRTY_STATE_TRACK 248
> > > > > 
> > > > >   struct kvm_irq_routing_irqchip {
> > > > >   	__u32 irqchip;
> > > > > --
> > > > > 2.33.0
> > > > > 
> > > > Instead of having these architecture specific capability, I wonder if
> > > > we can add a generic capability like "KVM_CAP_HW_DIRTY_STATE", so
> > > > other architecture supports similar things can reuse this capability,
> > > What of the existing stuff doing the same thing? x86's PML, to start
> > > with?
> > > 
> > In fact I think the HDBSS is the first one with non-fixed size.
> > Although there is a in process RISC-V extension for it, there will
> > be a long story to make it ratified.
> > 
> > > > For this generic thing I suggest, the getter returns the max support
> > > > entry count (or the buffer size) it supports like the dirty ring
> > > > capability. And the setter just let the architecture set the parameters
> > > > based on the user request.
> > > This looks wrong on a number of levels.
> > > 
> > > - If you want something generic, there is the existing dirty
> > >    log/bitmap. How this stuff is populated is none of the user's
> > >    business (trapping write accesses, dirty bit collection from the
> > >    PTs, or HW-generated log), and we don't need an extra feature for
> > >    it. Performance will obviously suck, but that's what you pay for
> > >    something abstracted and cross-architecture.
> > > 
> > > - If you want something architecture specific, then it can't be
> > >    generic, by definition. You get the raw speed and compatibility with
> > >    other arch-specific extensions.
> > > 
> > OK, I agree, it is better to keep this thing arch-specific. Doing a
> > generic thing does not benefit too much, I have made a mistake on
> > it. Thanks for your kindly explanation.
> 
> 
> Awesome. Thanks for the review.
> 
> I agree with Marc—keeping this ARM-specific is the right approach.
> Also, in v4 we're removing the ioctl interface entirely. HDBSS will be
> auto-enabled during migration setup and auto-disabled when migration
> completes, so the capability naming issue becomes moot.
> 
> I plan to post v4 with the updated approach soon.

Hi Tian,

Any updates in the v4?
Please let me know if you want help in any kind, in regards to this 
patchset. 

Thanks!
Leo

