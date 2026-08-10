Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51728C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggSi8bPf1JKq8vN9txCDt8QvIFF25PaT6AGNa8esBnE=; b=M8eO7M7c7y6nmITH927rWpLPpj
	2KYzkERLuvtRj/nVxu6m7ef5i7bvncBvuqTQOZfws794Fxs7NgMxC0J0RAJ6Ah+vuS2dfMI8g7nr8
	1OGlwaemH45LtOTeTlSGWzY+1GZsQzZ0cC53Ri7kpG5n9N0iO+rUZZtlL9ZYCjAVWGaqOUCJG1+WR
	8N6u9d2HmiOr2OjHpi62U3ol3+NJxNiKmDW0Kk1myBbnc1h9qD4nTm5zOAdIdKYfBYSPyMCqXGBum
	j9g2eflif3JLifFmx2dpwOS0sF/INXlINHZbBkles5jnkE1njutdSmvH40gnes3uN5ZMsUQaV9h0Y
	DuIiSF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPVh-0000000Bpon-0X6p;
	Mon, 10 Aug 2026 12:53:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPVg-0000000BpoU-2frp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 12:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9CF640A64;
	Mon, 10 Aug 2026 12:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB111F000E9;
	Mon, 10 Aug 2026 12:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786366423;
	bh=ggSi8bPf1JKq8vN9txCDt8QvIFF25PaT6AGNa8esBnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8EDdQUV5kH2eVQOz/UDiKLq3A01r7kF6tY0KN3IsSVG3Bh0/YFzj0vkxo+gkISTL
	 MYyei/B2kjuXK64Z1yLObejYiVM77jdFEYT+S8Uw456UrXABuD2VQqwJaDzM94ivE+
	 iHdckeLYoftrE34Yg8eflT/VbmqcDM5oFeMQBzVZawkW1THwPqcQ2cFQvHiV7YFGdh
	 CPLoNSoTieIQQRGeW4RBmD63vHBlPqT5fft2bbjvBWBLkdJPaHUdZGlbMbcUhAJk1a
	 IjSAgc7JUG2mhpGgPCCas34MLatyJxfWRJ7hXB6REhiG1wgBEySDoFvaBbLgecYwxm
	 KBVCjqdPUEmBw==
Date: Mon, 10 Aug 2026 13:53:38 +0100
From: Will Deacon <will@kernel.org>
To: Aman Priyadarshi <amanp@apple.com>
Subject: Re: [PATCH] arm64: archrandom: avoid trapping ID register read in
 __cpu_has_rng()
Message-ID: <annJ0oDB2HObQC5j@willie-the-truck>
References: <20260720140615.99343-1-amanp@apple.com>
 <amy0dVzgY-uPTTtU@google.com>
 <97FF53B9-993A-4E73-9C6B-0DA514AD0778@apple.com>
 <anH9kVWFN_dqA0c1@willie-the-truck>
 <2EEBC3D5-55E8-4E89-A0D3-E2816038BEC2@apple.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2EEBC3D5-55E8-4E89-A0D3-E2816038BEC2@apple.com>
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
Cc: Jason@zx2c4.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 04, 2026 at 04:50:35PM +0100, Aman Priyadarshi wrote:
> > On 4 Aug 2026, at 15:56, Will Deacon <will@kernel.org> wrote:
> > On Fri, Jul 31, 2026 at 06:26:44PM +0100, Aman Priyadarshi wrote:
> >>> On 31 Jul 2026, at 15:43, Will Deacon <will@kernel.org> wrote:
> >>> On Mon, Jul 20, 2026 at 03:06:15PM +0100, Aman Priyadarshi wrote:
> >>>> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> >>>> index 8babfbe31f95..8067e9a35641 100644
> >>>> --- a/arch/arm64/include/asm/archrandom.h
> >>>> +++ b/arch/arm64/include/asm/archrandom.h
> >>>> @@ -61,8 +61,22 @@ static inline bool __arm64_rndrrs(unsigned long *v)
> >>>> 
> >>>> static __always_inline bool __cpu_has_rng(void)
> >>>> {
> >>>> - if (unlikely(!system_capabilities_finalized() && !preemptible()))
> >>>> - return this_cpu_has_cap(ARM64_HAS_RNG);
> >>>> + if (unlikely(!system_capabilities_finalized() && !preemptible())) {
> >>>> + /*
> >>>> + * Until the ARM64_HAS_RNG alternative is patched we can't use
> >>>> + * the static-branch form, so consult the feature register
> >>>> + * directly. Don't use this_cpu_has_cap() here: it reads
> >>>> + * ID_AA64ISAR0_EL1 from hardware on every call, under
> >>>> + * virtualization each ID register read traps to the hypervisor
> >>>> + * (HCR_EL2.TID3) -- producing a storm of vmexits during boot.
> >>>> + * The sanitised value is cached in memory.
> >>>> + */
> >>>> + u64 isar0 = read_sanitised_ftr_reg(SYS_ID_AA64ISAR0_EL1);
> >>>> +
> >>>> + return cpuid_feature_extract_unsigned_field(isar0,
> >>>> + ID_AA64ISAR0_EL1_RNDR_SHIFT) >=
> >>>> + ID_AA64ISAR0_EL1_RNDR_IMP;
> >>>> + }
> >>> 
> >>> You can probably rewrite this a little more cleanly along the lines of
> >>> the (not even compile-tested) diff below. I was about to do that, but
> >>> then I got a bit confused by the whole thing. The preemptible() check is
> >>> presumably not needed if we're accessing the in-memory feature registers
> >>> rather than the per-CPU id registers, but then how do you handle races
> >>> with concurrent updates to the "safe value" made by CPUs concurrently
> >>> coming online?
> >> 
> >> I kept preemptible() check for this exact reason: the updates made by CPUs
> >> concurrently coming online will always take the downgrade path (a secondary
> >> CPU can clear RNDR, never set it), and therefore by taking the non-preemptible
> >> branch I can guarantee that the pinned CPU supports the said feature.
> >> I agree, this assumes that a secondary CPU folds its own ID registers into sys_val
> >> before it can ever be a randomness consumer, but looking at the code that seems
> >> the case, please feel free to correct me.
> >> Besides, in my opinion, it's hard to argue correctness of this code without
> >> preemptible() check.
> > 
> > My point is that this change introduces a data race on 'reg->sys_val' for
> > the ID_AA64ISAR0_EL1 entry in the arm64_ftr_regs array.
> 
> Agreed, you're right. My reasoning was that existing read_sanitised_ftr_reg() callers
> already race with sys_val updates during hotplug CPU bringup, so this wasn't a
> new problem. But I agree it's not much of a defence.

I think system_capabilities_finalized() is supposed to handle that race:

  * If the capabilities are not finalised, you shouldn't query the sanitised
    feature registers and they will be updated by CPUs coming online.

  * If the capabailities are finalised, you can query the sanitised feature
    registers and CPUs coming online must be compatible with them.

That's not to say we're bug-free here, though. The hw_breakpoint code
queries the sanitised view of SYS_ID_AA64DFR0_EL1 before it should and
you're trying to add another caller in the random code.

> It looks like an easy fix, though: mark the reader and the writer. What do you think
> of the patch below? I'm happy to post it as a separate patch ahead of this fix once
> you confirm it works for you.

I don't think we should try to make this thread safe. It would be much
better if this_cpu_has_cap() could query the saved id registers in
this_cpu_ptr(&cpu_data) instead of reading the id registers again.

Something along the lines of the untested and incomplete diff below...

Will

--->8

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a57870fa96db..b72e9e22ca79 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -641,7 +641,6 @@ void __init setup_user_features(void);
 void check_local_cpu_capabilities(void);
 
 u64 read_sanitised_ftr_reg(u32 id);
-u64 __read_sysreg_by_encoding(u32 sys_id);
 
 static inline bool cpu_supports_mixed_endian_el0(void)
 {
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..6462863fb78b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1533,11 +1533,7 @@ EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
 #define read_sysreg_case(r)    \
        case r:         val = read_sysreg_s(r); break;
 
-/*
- * __read_sysreg_by_encoding() - Used by a STARTING cpu before cpuinfo is populated.
- * Read the system register on the current CPU
- */
-u64 __read_sysreg_by_encoding(u32 sys_id)
+static u64 __read_sysreg_by_encoding(struct cpuinfo_arm64 *info, u32 sys_id)
 {
        struct arm64_ftr_reg *regp;
        u64 val;
@@ -1578,7 +1574,9 @@ u64 __read_sysreg_by_encoding(u32 sys_id)
        read_sysreg_case(SYS_ID_AA64MMFR2_EL1);
        read_sysreg_case(SYS_ID_AA64MMFR3_EL1);
        read_sysreg_case(SYS_ID_AA64MMFR4_EL1);
-       read_sysreg_case(SYS_ID_AA64ISAR0_EL1);
+       case SYS_ID_AA64ISAR0_EL1:
+               val = info->reg_id_aa64isar0;
+               break;
        read_sysreg_case(SYS_ID_AA64ISAR1_EL1);
        read_sysreg_case(SYS_ID_AA64ISAR2_EL1);
        read_sysreg_case(SYS_ID_AA64ISAR3_EL1);
@@ -1639,11 +1637,19 @@ feature_matches(u64 reg, const struct arm64_cpu_capabilities *entry)
 static u64
 read_scoped_sysreg(const struct arm64_cpu_capabilities *entry, int scope)
 {
-       WARN_ON(scope == SCOPE_LOCAL_CPU && preemptible());
-       if (scope == SCOPE_SYSTEM)
+       switch (scope) {
+       case SCOPE_SYSTEM:
                return read_sanitised_ftr_reg(entry->sys_reg);
-       else
-               return __read_sysreg_by_encoding(entry->sys_reg);
+       case SCOPE_LOCAL_CPU:
+               WARN_ON(preemptible());
+               fallthrough;
+       case SCOPE_BOOT_CPU:
+               return __read_sysreg_by_encoding(this_cpu_ptr(&cpu_data),
+                                                entry->sys_reg);
+       default:
+               BUG();
+               return 0;
+       }
 }
 
 static bool
@@ -2232,7 +2238,7 @@ static bool has_address_auth_cpucap(const struct arm64_cpu_capabilities *entry,
        if (scope & SCOPE_BOOT_CPU)
                return boot_val >= entry->min_field_value;
        /* Now check for the secondary CPUs with SCOPE_LOCAL_CPU scope */
-       sec_val = cpuid_feature_extract_field(__read_sysreg_by_encoding(entry->sys_reg),
+       sec_val = cpuid_feature_extract_field(read_scoped_sysreg(entry, SCOPE_LOCAL_CPU),
                                              entry->field_pos, entry->sign);
        return (sec_val >= entry->min_field_value) && (sec_val == boot_val);
 }


