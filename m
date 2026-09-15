Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CD1C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=adr6bIcZ9Ra7g51I3aOOtyaarHG12NwHmAmurm04PUg=; b=whJyDc42DHi5ISV9DHXjkjW+W/
	GJJyLDsXAErg9Pe/W6NJKeskGDrAgbbS2CN2jU3l/2UjBq0NDf00xzxBarEVn1tvKVJikT+Qe3abj
	zATYStEfs4kTTwejaT0TYk/3LDme/XMjLTdcuBR2nYAMYA347JSXtw4Y0c0JppYYgXDkjfr/wdSV1
	oDqAQJDDdekPD9Hffiw6HCGOtr0oCy1Jt4Htuh7BbWT1RMWIzyN4tHulLK6+l512R00G1b6aR8mv4
	uQPx7jmKg6+ZvQhnnvFqo6duhz9CAX1p5JlLndjXd2CYFJv0iw/3+sziyn+mLSdseuN50BBsEL2OL
	JdWMo1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRO-00000006XVR-18fH;
	Tue, 15 Sep 2026 12:39:14 +0000
Received: from out-23.mta0.migadu.com ([2001:41d0:1004:224b::17] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SR4-00000006Wtg-00e1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9BK6KSWU/pNCdY7VOPXtWIpA+Tq/NOwuoRA+4C/MS3w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789475931; v=1; x=1790080731;
 b=CcZ8qJLThzDjrfhqDCYCRRWFtKc63foPJvNXHo57GxcjdmYs96KpNVVLrN/7AKL+JklT9FEC
 Vz5xcTQeB7FQOaTFvLp2kdOqHLkonqiM5/LJeNxDfYigLBD4Nh5R39BeZbEubQ+u57QbUuBfuNV
 Y36miWvUtqeNaDz2ur0SZQ48=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2862c013ce371715;
	Tue, 15 Sep 2026 12:38:50 +0000
X-Mizu-Trace-ID: 2862c013ce371715
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Sascha.Bischoff@arm.com,
	steven.price@arm.com,
	tabba@google.com
Subject: [PATCH 0/7] KVM: arm64: pKVM host hypercall and GICv5 CPU interface fixes
Date: Tue, 15 Sep 2026 13:38:39 +0100
Message-Id: <20260915123846.2317931-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053854_198924_54B68A9C 
X-CRM114-Status: GOOD (  16.21  )
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

This series consolidates three postings, which it supersedes:
  - The stage-2 MMU pointer hypercall rejection [1]: patch 2, reworked
    to move the hypercalls out of the always-available band instead of
    guarding each handler, and covering __kvm_flush_vm_context() too
    (Marc). __kvm_flush_cpu_context() stays in the set, which the
    sketch on the thread left out.
  - The GICv5 CPU interface series [2]: its hypercall patch reworked
    the same way, as patch 1, and its other three as patches 3, 6 and
    7, with 3's comment and 7's message trimmed and 6 unchanged.
    Sascha's Reviewed-by on the reworked patch isn't carried, the code
    having changed.
  - The __kvm_adjust_pc() host pointer fixes [3]: patches 4 and 5,
    with Vincent's and Joey's nits taken and their Reviewed-by
    collected. (thanks!)

Under pKVM, EL2 still trusts the host at the hypercall boundary in a
few places: hypercalls the host has no use for in protected mode stay
callable, the __kvm_adjust_pc() hypercall it does use takes a host
vCPU nothing pins or validates, and the vgic model EL2 copies out of
the host's struct kvm goes unchecked.

Patches 1 and 2 move the GICv5 CPU interface save/restore and the
stage-2 flushes into the band the dispatcher rejects once pKVM has
finalised. Patch 3 validates the vgic model EL2 copies from the host.
Patches 4 and 5 fix two host pointers dereferenced unvalidated on the
__kvm_adjust_pc() path, the vCPU's VM and the vCPU itself: either
panics the hypervisor if unmapped, and the VM read leaks a bit of hyp
memory through PSR_TCO on MTE hardware. Both carry Cc: stable. The
pKVM core series [4] carries the same two fixes as its patches 2 and
3, in the form posted before Vincent's nits, so that it applies as
is. Patches 6 and 7 are the rest of [2]: the EL1 side of the GICv5
access on nVHE, and a comment fix.

Patch 2 carries no Fixes: tag, no in-tree host path reaching those
hypercalls under pKVM; patch 1 keeps the one it was posted with.

The GICv5 residency and VDPEND hypercalls queued for 7.4 carry the
per-handler check the superseded GICv5 patch used, and can move the
same way.

Superseded postings:
  - 20260914174521.832575-1-fuad.tabba@linux.dev
  - 20260817103228.1203140-1-fuad.tabba@linux.dev (and its v1,
    20260806100256.371164-1-fuad.tabba@linux.dev)
  - 20260915070418.3209779-1-fuad.tabba@linux.dev (and its v1,
    20260914065136.3418404-1-fuad.tabba@linux.dev)

Based on v7.3-rc3 (fd73f4a665989). On kvmarm/next, patches 1 and 2
conflict with the new GICv5 hypercall IDs and patch 5 with the typed
hypercall handlers.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914174521.832575-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260817103228.1203140-1-fuad.tabba@linux.dev/
[3] https://lore.kernel.org/all/20260915070418.3209779-1-fuad.tabba@linux.dev/
[4] https://lore.kernel.org/all/20260914113338.159227-1-fuad.tabba@linux.dev/

Fuad Tabba (7):
  KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
  KVM: arm64: Reject the stage-2 flush hypercalls under pKVM
  KVM: arm64: Validate the host-provided vgic model in pKVM
  KVM: arm64: Validate the host vCPU's VM before reading it under pKVM
  KVM: arm64: Pin the host vCPU before adjusting its PC under pKVM
  KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
  KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch

 arch/arm64/include/asm/kvm_asm.h           | 16 ++++----
 arch/arm64/kvm/hyp/exception.c             |  5 ++-
 arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 28 +++++++++++++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h     |  2 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c         | 36 +++++++++++++----
 arch/arm64/kvm/hyp/nvhe/pkvm.c             | 47 +++++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/switch.c           |  4 +-
 arch/arm64/kvm/vgic/vgic.c                 | 12 ++++--
 8 files changed, 125 insertions(+), 25 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


