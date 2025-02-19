Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EECC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py62NjgHyqePD/1xxiF47Ojj/UAYgJgEPILXJQHYeUw=; b=2nQ2XRvI7wN5gi5+zaRxSfVfN2
	2cR05rmFQfoAPVmYmXUYDjUa7QfGKPYlmhI8dFqVRCmgEs9QL0dePHx+S1cZGcVeuHwnaAVCAOZ46
	rRQfGiU36swZK1jiUtgHg4TGI9igB5jQTA6b8DfNqpTShaR54cEsIOFeUhFEUqWEaVetA51UNN8Y+
	U/8plEZVS4hTzU80i9j4mDx+DYE2twLoBZdb6EL6RXsFKxSAKbnFoH7gpXdDWBCX2rpgG/gZo43Mk
	bEFL7IpfqwDzD5q59w8n5NQ21PHf1ZDJ1VCRYol3wUkiqHuMBjse+vZVvEb/1LifDEv1don2Y9aA6
	1PE9+rmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpxe-0000000EheC-0BOO;
	Wed, 19 Feb 2025 19:42:22 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpf1-0000000EbGA-3R44
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 19:23:10 +0000
Date: Wed, 19 Feb 2025 11:22:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739992982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=py62NjgHyqePD/1xxiF47Ojj/UAYgJgEPILXJQHYeUw=;
	b=wpbGXpA9K426wUIeTQaneUGsyJ2aLTd7V1pWeTS2jiBxCc8g047ll176UouBJ5WeCFvdv3
	koB6l5gRLjQaWG28qTOndotTu4GRwC/XZDb5Oy5fGRzjhBSsE0AMirgk9sMV4KrHwnJQns
	j3sPE519Ckg/6+GNw5nq70IOFWFCTL8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 07/14] KVM: arm64: Use a cpucap to determine if system
 supports FEAT_PMUv3
Message-ID: <Z7YvkHpm3w__HnkO@linux.dev>
References: <20250203183111.191519-1-oliver.upton@linux.dev>
 <20250203183111.191519-8-oliver.upton@linux.dev>
 <864j0psuas.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864j0psuas.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_112307_994398_0960F89D 
X-CRM114-Status: GOOD (  20.36  )
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

On Wed, Feb 19, 2025 at 05:44:59PM +0000, Marc Zyngier wrote:
> > +static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
> > +{
> > +	u64 dfr0 = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
> > +	unsigned int pmuver;
> > +
> > +	pmuver = cpuid_feature_extract_unsigned_field(dfr0,
> > +						      ID_AA64DFR0_EL1_PMUVer_SHIFT);
> > +	if (pmuver == ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
> > +		return false;
> > +
> > +	return pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP;
> 
> Given that PMUVer is a signed field, how about using
> cpuid_feature_extract_signed_field() and do a signed comparison instead?

I'm happy to include a comment, but the PMUVer field is not signed. Any value
other than 0xF is meant to be treated as an unsigned quantity.

DDI047L.a D24.1.3.2 is where this is coming from.

> > +}
> > +
> >  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
> >  #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
> >  
> > @@ -2999,6 +3012,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >  		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
> >  	},
> >  #endif
> > +	{
> > +		.desc = "PMUv3",
> > +		.capability = ARM64_HAS_PMUV3,
> > +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > +		.matches = has_pmuv3,
> > +	},
> 
> This cap is probed unconditionally (without any configuration
> dependency)...
> 
> >  	{},
> >  };
> >  
> > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > index f838a45665f2..0edc7882bedb 100644
> > --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> > +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > @@ -244,7 +244,7 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
> >  	 * counter, which could make a PMXEVCNTR_EL0 access UNDEF at
> >  	 * EL1 instead of being trapped to EL2.
> >  	 */
> > -	if (kvm_arm_support_pmu_v3()) {
> > +	if (system_supports_pmuv3()) {
> 
> ... but kvm_arm_support_pmu_v3() is conditional on
> CONFIG_HW_PERF_EVENTS.  Doesn't this create some sort of new code path
> that we didn't expect?

Yep. It ought to be benign, but pointless. I'll condition this correctly
next time around.

Thanks,
Oliver

