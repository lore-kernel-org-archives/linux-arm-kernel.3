Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FF2CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pd1fhLL+GVsRg46oAn3Js7dlB2NaSHd/8Rv1J0NuXKs=; b=Y8mQbQiS93GM52vuNeJu7+C0oJ
	4IyFPQhgB2el0D/d0u2gmUC2OnpiDjE/QzeuAqgbh0lDISN8N4uZ8zrLJmZov5HIae/OHF9EWJbuQ
	Yo3BlnDx5z4vZuFKzY/naE6R8LMxN25OwIWN9Ev5DvEZJka/DL/KGNYkaig6OzpJ7yBABFgpEMzTr
	cO949vsX+1CmqdtV4zrIKs2AwIRR/VwixyO4pYYEfxW7BolehMriDUplGpA6csqU4TfAuhFE1EAuI
	RNSc3xojDcqXIuosHZ37B9Kr/UEdysGaapc0JUPq9sqNUjrJ0FX0ixGWkJaG+d3gLPrArY6pALPku
	Tg1D2BjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzaJ-0000000ErKL-2Waf;
	Wed, 17 Sep 2025 21:21:03 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzaG-0000000ErIb-2EDT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:21:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758144057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pd1fhLL+GVsRg46oAn3Js7dlB2NaSHd/8Rv1J0NuXKs=;
	b=S/a30xtARsCmkTyo3bGBxURya23Qgz70j2RC/jO311BRlsh3Bz3MCqREH3mRVBuICGhHS1
	c/aYXmH0aHL4Fs0QG7RJ+rOGpPg/Kpr+rXSkiKWBQQpVwLgJ57FkLzL3H3X11oYTipH6rp
	KrWZ7DYDVD8SGu+HYwfSbSWqBOIq/nQ=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 00/13] KVM: arm64: selftests: Run selftests in VHE EL2
Date: Wed, 17 Sep 2025 14:20:30 -0700
Message-ID: <20250917212044.294760-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_142100_980583_F3373E88 
X-CRM114-Status: GOOD (  12.14  )
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

I've been working on some MMU-related features that are unused by KVM
meaning they're somewhat annoying to test. Because of that, I found the
time / patience to port our existing selftests infrastructure over to
running in VHE EL2, opportunistically promoting tests when the stars
align.

Creating a VGIC is a hard requirement of enabling EL2 for a VM. As a
consequence of this, I need to eat my words from my earlier conversation
with Sean on this topic and hammer in a default VGICv3. This requires
some participation from the arch-neutral code given the ordering
constraints on vCPU and VGIC creation.

At the tail end of this series is a sanity test for EL2 but nothing is
actually running nested (yet). Despite that, running in EL2 has proven
valuable already as it has uncovered a bug [*].

This is all _very_ lightly tested on an M2 :) Applies to 6.17-rc4

[*]: https://lore.kernel.org/kvmarm/20250917203125.283116-1-oliver.upton@linux.dev/

Oliver Upton (13):
  KVM: arm64: selftests: Provide kvm_arch_vm_post_create() in library
    code
  KVM: arm64: selftests: Initialize VGICv3 only once
  KVM: arm64: selftests: Add helper to check for VGICv3 support
  KVM: arm64: selftests: Add unsanitised helpers for VGICv3 creation
  KVM: arm64: selftests: Create a VGICv3 for 'default' VMs
  KVM: arm64: selftests: Alias EL1 registers to EL2 counterparts
  KVM: arm64: selftests: Provide helper for getting default vCPU target
  KVM: arm64: selftests: Select SMCCC conduit based on current EL
  KVM: arm64: selftests: Use hyp timer IRQs when test runs at EL2
  KVM: arm64: selftests: Use the vCPU attr for setting nr of PMU
    counters
  KVM: arm64: selftests: Initialize HCR_EL2
  KVM: arm64: selftests: Enable EL2 by default
  KVM: arm64: selftests: Add basic test for running in VHE EL2

 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../testing/selftests/kvm/arm64/arch_timer.c  | 13 +--
 .../kvm/arm64/arch_timer_edge_cases.c         | 13 +--
 tools/testing/selftests/kvm/arm64/hello_el2.c | 58 ++++++++++++
 .../testing/selftests/kvm/arm64/hypercalls.c  |  2 +-
 tools/testing/selftests/kvm/arm64/kvm-uuid.c  |  2 +-
 .../testing/selftests/kvm/arm64/no-vgic-v3.c  |  2 +
 tools/testing/selftests/kvm/arm64/psci_test.c | 13 +--
 .../testing/selftests/kvm/arm64/set_id_regs.c | 20 ++--
 .../selftests/kvm/arm64/smccc_filter.c        | 17 +++-
 tools/testing/selftests/kvm/arm64/vgic_init.c |  2 +
 tools/testing/selftests/kvm/arm64/vgic_irq.c  |  4 +-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  8 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c | 75 +++++++--------
 .../selftests/kvm/dirty_log_perf_test.c       | 35 -------
 tools/testing/selftests/kvm/dirty_log_test.c  |  1 +
 tools/testing/selftests/kvm/get-reg-list.c    |  9 +-
 .../selftests/kvm/include/arm64/arch_timer.h  | 24 +++++
 .../kvm/include/arm64/kvm_util_arch.h         |  5 +-
 .../selftests/kvm/include/arm64/processor.h   | 73 +++++++++++++++
 .../selftests/kvm/include/arm64/vgic.h        |  3 +
 .../testing/selftests/kvm/include/kvm_util.h  |  7 +-
 .../selftests/kvm/lib/arm64/processor.c       | 91 ++++++++++++++++---
 tools/testing/selftests/kvm/lib/arm64/vgic.c  | 64 +++++++++----
 tools/testing/selftests/kvm/lib/kvm_util.c    | 15 ++-
 .../testing/selftests/kvm/lib/x86/processor.c |  2 +-
 tools/testing/selftests/kvm/s390/cmma_test.c  |  2 +-
 tools/testing/selftests/kvm/steal_time.c      |  2 +-
 28 files changed, 395 insertions(+), 168 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/hello_el2.c


base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
-- 
2.47.3


