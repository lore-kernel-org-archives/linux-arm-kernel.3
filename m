Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B85C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3S2poz7UmuzQNE0KnSIBmguQesr8Wp2egthXDvqh2KU=; b=g2lAR88X958My75tPqiUnGNxKd
	W5jJZR3HZv/OBmT95+TC6IoR/HsKrYXx9odLoTb5x4HwXGGvzzcsYgy/jEcZDmfhYm8bSJPY24v4t
	fLfzJpHxrLkbeAUwzUECSxAiM3N+XwTKYUapRz/31TuElYzZ8XSVQ+WSlDtbNYUp47L/48WwsSRtT
	1dC0ZvBVMfh+GZCGrXMvd31WkwOfL0iqM5P5R39AxpilYexwZrEhdzI51dF4y0dJ4XxiIrQziXkAT
	wXaD5O6IkMXqWMb4zZgBou2FrLs2jqtK6bQMEr14Xnl17BCjRe77gsNSIvsBHDf2R8dJBnWDCK2aF
	V6kUg8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrux5-00000005UXw-3RSk;
	Thu, 06 Aug 2026 10:03:51 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-173.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrux2-00000005UXH-3qvw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:03:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786010625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3S2poz7UmuzQNE0KnSIBmguQesr8Wp2egthXDvqh2KU=;
	b=T/DPOHR7R2QA6bW5ci/d19NVL8nHVaurYq58LS4jLB5oIyswzXsehzzCXxYdxWadCWnRfn
	69K/WBeQ3T9eVYEQineEW9nT4mvPQKY0KL4kdxMOtHLfYn2jpcF8Mk60Qi6JF5QlEbrsgb
	V2IlsUkO1NuwIjroY4kZPRx2moygjOg=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: [PATCH v1 0/4] KVM: arm64: Fix unguarded GICv5 CPU interface accesses
Date: Thu,  6 Aug 2026 11:02:52 +0100
Message-Id: <20260806100256.371164-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030349_242215_11BBC476 
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

Hi folks,

This series stops KVM reaching GICv5 CPU interface registers on hardware
that does not implement them, in three places with no guard.

Under pKVM the first two are reachable from an untrusted host. EL2
copies vgic_model out of the host's struct kvm without validating it,
and the nVHE world switch dispatches on that field with no cpucap
guard, so a host writing KVM_DEV_TYPE_ARM_VGIC_V5 steers EL2 into
ICC_ICSR_EL1 and the ICH_PPI_* registers. Separately, __vgic_v5_save_apr
and __vgic_v5_restore_vmcr_apr sit in the hypercall band the
de-privileged host may still call, and pKVM never registers a GICv5
vgic, so neither has a valid caller in protected mode. Without
FEAT_GCIE those registers are UNDEFINED at EL2, so either path panics
the hypervisor. Both need a compromised host kernel rather than host
userspace, so this is hardening and not a guest-reachable hole.

I had said these paths were unreachable under pKVM because
vgic_v5_probe() skips GICv5 registration in protected mode [1]. That was
wrong. The skip is host-side only, and does not constrain what a
malicious host can call.

The third one is not pKVM. can_access_vgic_from_kernel() excludes only
the GICv3 system register interface, so on a native GICv5 system
without FEAT_GCIE_LEGACY the kernel reaches EL2-only registers from EL1
under nVHE, and the world switch does the same work at EL2 anyway.

The last patch drops the VGICv3 reference from two nVHE world switch
comments that cover GICv5 too. No functional change.

Tested on QEMU. I also checked the first one with a local host patch
that hands EL2 a GICv5 model: it panics at __vgic_v5_restore_state
before the series and boots cleanly after.

Based on Linux 7.2-rc6 (075b74841bd00). It also applies cleanly to
kvmarm/next and kvmarm/fixes.

I really should stop looking at the GIC, but I won't be able to anytime
soon I'm afraid...

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA%2BEHjTyGULmVCgyoya3bXG4gRj0OYFE1gnJLhNE6kvCrZFtXyQ@mail.gmail.com/

Fuad Tabba (4):
  KVM: arm64: Validate the host-provided vgic model in pKVM
  KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
  KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
  KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch

 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  6 ++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 16 ++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/switch.c   |  4 ++--
 arch/arm64/kvm/vgic/vgic.c         | 12 ++++++++----
 4 files changed, 30 insertions(+), 8 deletions(-)


base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.39.5


