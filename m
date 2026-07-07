Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A324C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 22:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRwsNtR9CmtI1lg+FRZhNFP3aUE1T9mC+krBoHEi9x4=; b=1r++tTuFS83EsP6ozJvrLbiOKT
	sYcJA6ErQI6XqyfetTKS8YWDmBX7zxQ2C+xP/bOhg+gurMrxAJilCMr9qs222VRtwEhTedsG9eSM8
	5hPMIgM0Jt5wbuENFbsF8zItqLI1RFiuPiPSrDbEtUpKvoBcSiWDtiIZEIUya1OlqAuP+Cef3xwmn
	78A4+FoihoT/3bbh1Lvc1I9YJJ0RbhLQp1EJYVWSGJTHKkLiU153cvDpJ2YUTVvMmioh5EoU/kZlp
	OV8D1Smgo+wOesVOR0raqaugnYtpaiopR3s9BcK44xivJfUA9u18KR1f65YgU/4ZSAujm9VMsoTyR
	crKMHKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whEHV-0000000FyNf-1COj;
	Tue, 07 Jul 2026 22:28:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whEHS-0000000FyNU-4A0b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 22:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EECF42D77;
	Tue,  7 Jul 2026 22:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC171F000E9;
	Tue,  7 Jul 2026 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783463321;
	bh=gRwsNtR9CmtI1lg+FRZhNFP3aUE1T9mC+krBoHEi9x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FOBVJ4rD5rTTQo3ydEtA3gAO9+lIGI/CrNJ8ssAZ4DAYgwFZpMeoTFKCV+sJUEuae
	 7VC5wJWuZ8EgPLQfZzDm3hsFwOzJ8GaZw2t+XEGov7LfPlSe+HL+8/iYeQtjJ3G5UF
	 WDdG6dFwpxpBhr0i+IhPPtJRFSDOmz6C/LG+zOeA4im1A8BgNLOjeiYsK64Dv0QnHd
	 cdeaWbicwd1r9Ua/g/c4bLWDvHNgWjKX2VB7e9xd4sM1fZBlXqUTlxLs67iJImtLZu
	 zC/fXH/oT8idmoroS8l7xYg8cfuP+AtXx4KDFhWDOdm81Sg0CKjHW++PKrsa7xZhTp
	 pjx7Fw2TwUmyQ==
Date: Tue, 7 Jul 2026 15:28:40 -0700
From: Oliver Upton <oupton@kernel.org>
To: Congkai Tan <congkai@amazon.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Haris Okanovic <harisokn@amazon.com>,
	Geoff Blake <blakgeof@amazon.com>,
	Stanislav Spassov <stanspas@amazon.de>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Message-ID: <ak19mPPWcupFwfuE@kernel.org>
References: <20260702190421.420992-1-congkai@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702190421.420992-1-congkai@amazon.com>
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

Hi Congkai,

Thanks for respinning.

On Thu, Jul 02, 2026 at 07:04:18PM +0000, Congkai Tan wrote:
> Today when the perf tool runs in a guest on cores with PMUv3p4, it fails
> to parse the default metrics with "Failure to read '#slots'", since perf
> can only read 0 from sysfs caps/slots, which is backed by PMMIR_EL1.SLOTS
> that KVM traps as RAZ/WI.
> 
> Taking into account backward compatibility and heterogeneous systems, the
> exposure of PMMIR_EL1.SLOTS is gated behind a new vCPU feature flag:
> 
> - Patch 1 adds the new flag KVM_ARM_VCPU_PMU_V3_STRICT. When set, KVM does
>   not create a default PMU during vCPU init, and the VMM must select one
>   explicitly via KVM_ARM_VCPU_PMU_V3_SET_PMU before the first KVM_RUN.
> - Patch 2 exposes PMMIR_EL1.SLOTS of the selected PMU under the flag, and
>   adds userspace get/set for PMMIR_EL1 so that SLOTS can be reset to 0
>   for backward compatibility.
> - Patch 3 stops masking STALL_SLOT* in PMCEID1 under the flag.

I think the series is starting to shape up. Few more things to address:

 - Didn't mention it in v1, but writes to PMCR_EL0.N should be ignored
   when V3_STRICT is set. We now have a vCPU attribute for configuring
   event counters and the register-based thing is just broken :)

 - The vCPU feature flag needs a corresponding KVM_CAP so userspace can
   detect it

 - In terms of patch ordering, the vCPU flag / KVM_CAP exposure should
   come last after all the behavior changes are implemented (and
   flag-guarded)

 - Move enforcement of a non-NULL arm_pmu to kvm_arm_pmu_v3_init() since
   userspace must call KVM_ARM_VCPU_PMU_V3_INIT before KVM_RUN

 - Prevent the PMU event filter from being configured until a hardware
   PMU has been selected

I've addressed all of this locally and pushed to my tree [*]. Untested,
as always :) Would you be able to give it a spin?

Also, do you have VMM patches for using the new feature flag?

[*]: https://git.kernel.org/pub/scm/linux/kernel/git/oupton/linux.git/log/?h=kvm-arm64/pmu-7.3

Thanks,
Oliver

