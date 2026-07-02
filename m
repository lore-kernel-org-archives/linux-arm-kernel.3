Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C036AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 00:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKy0RFu7xgDEI2dGgMG+Dk1HrsGATT053SdOOOQC+b8=; b=undzNHjcX3gbgHv7uaCX7dgJiG
	xixVTNhpBrIOyWskaw/wea1yVdAWWO5oepOvxBnnJhLpPhaQt0dDBdgfv25UEUaVXM0p7y7EPP0YF
	8HFCsgxhSKNI3HXcnHhO954SvYQZba5C46yRwFZ68A0zyI8rK5QWYOgUK5yII9VrPz8wXrTkwPX6J
	kluhWo9RSKJinoqqFqVgPcBJM2K8xydRp8SUJybVoIjeOCsCrIjvZChgs6QEhoxYrR5HWZ+qIWalW
	ur8k0+UI1+RGM2qMrvUbu9CA/+gjfTHCIlOOg+B77CEu3cXdZQU8FEHttMmOv/TBaUKuK4SOUSn1s
	Iykg4fDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4s3-00000003GBX-0BRY;
	Thu, 02 Jul 2026 00:01:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4s1-00000003GBQ-3lXC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 00:01:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71C31404FC;
	Thu,  2 Jul 2026 00:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C21B1F000E9;
	Thu,  2 Jul 2026 00:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950493;
	bh=MKy0RFu7xgDEI2dGgMG+Dk1HrsGATT053SdOOOQC+b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GCSLWpmDDEHjrlT+KseVQxpcJoSLCpI5ureoFaRX4IN4pf2ZgYy3CJqjibEizrE32
	 firSuVyH/BMLdcDdau8xWogD+IbYcegGky7KTpXk87Hn0jidAODsZ8sJZ8MSnxGyj3
	 m1QsTW6pUMkFDv+iRUxIqSGHUXmwKziEl3FQZGRm/SWvCEP2eNtnKHTZVrsvb8Z3OP
	 w2BVPcDPvygS8saTkLyd1vvvqKEcW5Sfb1pZasSYrSjIU68xhp5WWKs5irdDTAEEOd
	 mDmhjE4e0JjyGcoEWpSSLr2n1hQqOYrI6T4wK0lrOcmgjI2WDTAZxf5nSNV8OwPt/X
	 KZ6gil7BYJPvQ==
Date: Wed, 1 Jul 2026 17:01:32 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: stable@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Backport ARM64 VHE boot fixes to 6.6.y
Message-ID: <akWqXBJrJ1n34BQ5@kernel.org>
References: <20260701204342.2654385-1-coltonlewis@google.com>
 <akWhad3U5VNjWzxu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akWhad3U5VNjWzxu@kernel.org>
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

Circling back around...

On Wed, Jul 01, 2026 at 04:23:21PM -0700, Oliver Upton wrote:
> The subject prefix should be "[PATCH 6.6 0/5]" so people know right up
> front where this is going.
> 
> On Wed, Jul 01, 2026 at 08:43:37PM +0000, Colton Lewis wrote:
> > This series backports VHE CPU boot fixes to the 6.6.y stable branch.
> > 
> > These fixes are already present in the 6.12.y stable branch (and
> > newer), but are missing in 6.6.y. They are required to enable booting
> > L1 guests with nested virtualization enabled (kvm-arm.mode=nested).
> 
> It's a bit worse than this. The architecture retroactively made
> FEAT_E2H0 an optional feature, there are now implementations in the wild
> that do not support the feature.
> 
> > Without these patches, a 6.6.y guest boots with HCR_EL2.E2H
> > incorrectly configured (because it misses VHE-only detection or early
> > initialization), causing early boot hangs/trap loops.
> > 
> > Conflict resolutions:
> > - Patch 4 (KVM: arm64: Initialize HCR_EL2.E2H early) had conflicts in
> >   arch/arm64/kvm/hyp/nvhe/hyp-init.S due to differences in state
> >   initialization. Resolved by extracting EL2 state initialization into
> >   __kvm_init_el2_state.
> > - Patch 5 (arm64: Revamp HCR_EL2.E2H RES1 detection) had conflicts in
> >   arch/arm64/include/asm/el2_setup.h. Resolved by using raw msr hcr_el2
> >   instead of the missing msr_hcr_el2 macro.
> > 
> > 
> > Marc Zyngier (4):
> >   arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
> >   arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is
> >     negative
> >   arm64: Fix early handling of FEAT_E2H0 not being implemented
> >   arm64: Revamp HCR_EL2.E2H RES1 detection
> > 
> > Mark Rutland (1):
> >   KVM: arm64: Initialize HCR_EL2.E2H early

Please go through and correct all of the SHA1s for the cherry-picks,
smells like some LLM just hallucinated some bits given how close they
are to the real deal.

I also want to see that all KVM modes have been tested (nVHE, hVHE, VHE,
protected) before this gets picked up. Overall though taking this to
stable seems like the right thing to do.

Any reason why you've only done 6.6? The kernel was first aware of
E2H=RES1 as far back as 5.13.

Thanks,
Oliver

