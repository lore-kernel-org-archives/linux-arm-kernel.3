Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60ADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiKmqO0wNrjJu7zzb5rGyi5QeG0KP1hAbxpV1oyAAlE=; b=CW10nEDa1Y2CBJk/i8+AWKm7l9
	+zLt7VzMpPOEZxJohmTY3bs/aStQyVv8W7tNfmY4FCiQv14/UajB5fsHB817r0P63ukCVnhXgmKcP
	8iT/9Ehcq2Kb0JKszgNUTSV2X7zPMnfbxm64JDJHByATPZnI2tGQbZgzbmkMur+TPnfSMDypiuJWw
	fjYL3ajEiGsVc9AFVhLYVjNIuRQ3sopnDJfo8quATRiZsoLCJa2Tgiy3Sk4gDCPfVJJy9wJL3dpXi
	QokpANqstwqBdYPJY0EBqVnFm9gFKKljf2FP5i36jnu0IRXLkEGA23ZFvVu3mRtdaf2MO6EJBP2zD
	lle5NI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4H7-000000038xE-14Fl;
	Wed, 01 Jul 2026 23:23:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4H5-000000038x5-3gB1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 23:23:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BE1343241;
	Wed,  1 Jul 2026 23:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076651F000E9;
	Wed,  1 Jul 2026 23:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782948203;
	bh=hiKmqO0wNrjJu7zzb5rGyi5QeG0KP1hAbxpV1oyAAlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYWMuWjTlBwaME+x1eFSgn+qz2xUyBupMvSmK+RxOlCo3VhCvVTCNWw7Pbhta2G6S
	 vhnTm9ONyh2F7530Zd9GZFgrHkTBNbUCSJGVfe3bgnOTyXL746UtovbEKzL8cp8YBl
	 DNp8gCYtzVL2yrbTy0lFZFUUlzncCkOK9l2wTKQvXOUaEK8Qc7bXze/znzBF/y/0Hy
	 akIizP07KoORUuOhhkQJ6gfRSon37f7Q7oAJdHu0F7xuAFQajfGpzVXsbaxyWt0sTU
	 v3GnLxXouW6CcrzBBZ2YUnGAWiBNO8XJYP3y/qWbFwsy1PN1U2ugbp7URnBPcGdnEv
	 Hw9JJ4NdkGRZg==
Date: Wed, 1 Jul 2026 16:23:21 -0700
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
Message-ID: <akWhad3U5VNjWzxu@kernel.org>
References: <20260701204342.2654385-1-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701204342.2654385-1-coltonlewis@google.com>
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

The subject prefix should be "[PATCH 6.6 0/5]" so people know right up
front where this is going.

On Wed, Jul 01, 2026 at 08:43:37PM +0000, Colton Lewis wrote:
> This series backports VHE CPU boot fixes to the 6.6.y stable branch.
> 
> These fixes are already present in the 6.12.y stable branch (and
> newer), but are missing in 6.6.y. They are required to enable booting
> L1 guests with nested virtualization enabled (kvm-arm.mode=nested).

It's a bit worse than this. The architecture retroactively made
FEAT_E2H0 an optional feature, there are now implementations in the wild
that do not support the feature.

> Without these patches, a 6.6.y guest boots with HCR_EL2.E2H
> incorrectly configured (because it misses VHE-only detection or early
> initialization), causing early boot hangs/trap loops.
> 
> Conflict resolutions:
> - Patch 4 (KVM: arm64: Initialize HCR_EL2.E2H early) had conflicts in
>   arch/arm64/kvm/hyp/nvhe/hyp-init.S due to differences in state
>   initialization. Resolved by extracting EL2 state initialization into
>   __kvm_init_el2_state.
> - Patch 5 (arm64: Revamp HCR_EL2.E2H RES1 detection) had conflicts in
>   arch/arm64/include/asm/el2_setup.h. Resolved by using raw msr hcr_el2
>   instead of the missing msr_hcr_el2 macro.
> 
> 
> Marc Zyngier (4):
>   arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
>   arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is
>     negative
>   arm64: Fix early handling of FEAT_E2H0 not being implemented
>   arm64: Revamp HCR_EL2.E2H RES1 detection
> 
> Mark Rutland (1):
>   KVM: arm64: Initialize HCR_EL2.E2H early
> 
>  arch/arm64/include/asm/el2_setup.h | 52 ++++++++++++++++++++++++++++++
>  arch/arm64/kernel/head.S           | 17 +++-------
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S | 16 +++++++--
>  arch/arm64/tools/sysreg            | 37 +++++++++++++++++++++
>  4 files changed, 107 insertions(+), 15 deletions(-)
> 
> 
> base-commit: d1cfde2d5d15be14123bdd1689162bd27f995a90
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
> 

