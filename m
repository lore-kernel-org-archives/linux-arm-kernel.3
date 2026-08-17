Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E49C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tFqlyreEuCcIrDILwmNfx4T0BGM62Ibh8RjYUs1f+xY=; b=rpKgS4Yz6Qw6keLsEx++CoBdbG
	2gqPyxaCV7tpxK33raxeylwhJ29oiZIrqBOHUDr9fyB8wv3jrq1f+GX0DS+2QrAgbHNX3I3aOJM/R
	bbdnCwYQgSn9/BzuWdmkVCsewPtXTRt7tu87bHpgIppzdhZXzXOBBTcggMZkT7OTE55dcAVNiqLrz
	dzFyrcRjYjoMqMUSaPKUCDz99dBPiWpy8DRBEedOKFz/+UB8sCDUmisBwXKK7jSPKhqI4aizXaDuf
	aX1Bn/oaz0C4AvfWzQ8ysOa1R3VVtqJoQfK8B4lZ1tar8aFOwiHKFjxYU17CwktI1wd10L1tRzubZ
	bjytzoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvudx-00000005vy5-3Lbi;
	Mon, 17 Aug 2026 10:32:37 +0000
Received: from out-150.mta1.migadu.com ([2001:41d0:203:375::96] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvudu-00000005vxg-3nOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:32:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YrQ+5Ek+FlurOmzHQ7gb21A41dW+jGsFylmIBQ2cRiY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786962752; v=1; x=1787567552;
 b=ldiadiYODNGpW3y2EueZsa8mdgwjBFTDWq04ObllGlhVylhB22cN+AM0qzYgXR7AUTqftM4a
 CSWvbXa+KDm0ezhseiczq3hEWLOa3BgRYbHoUFPdLUQAoq/GRw1KONWSmW9Le0ZgUKAOc9Xn4vD
 CMZY+Cmuj1UdYri9Gkq0vDTw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 4750f82dee378e17;
	Mon, 17 Aug 2026 10:32:32 +0000
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: [PATCH v2 0/4] KVM: arm64: Fix unguarded GICv5 CPU interface accesses
Date: Mon, 17 Aug 2026 11:32:24 +0100
Message-Id: <20260817103228.1203140-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_033235_083170_9551B2EF 
X-CRM114-Status: GOOD (  12.32  )
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

Changes since v1 [1]:
  - Reject anything that is not VGIC_V3 rather than listing the models,
    which drops the VGIC_V2 case. (Sascha)
  - Tightened the UNDEF sentence in patch 2's commit message. No code
    change.
  - Collected Sascha's Reviewed-by on patches 2 to 4, thanks for the
    reviews.
  - Rebased onto Linux 7.2.

This series stops KVM reaching GICv5 CPU interface registers on hardware
that does not implement them, in three places with no guard.

Under pKVM the first two are reachable from an untrusted host. EL2
copies vgic_model out of the host's struct kvm without validating it,
and the nVHE world switch dispatches on that field with no cpucap guard,
so a host writing KVM_DEV_TYPE_ARM_VGIC_V5 steers EL2 into ICC_ICSR_EL1
and the ICH_PPI_* registers. Separately, __vgic_v5_save_apr and
__vgic_v5_restore_vmcr_apr sit in the hypercall band the de-privileged
host may still call, and pKVM never registers a GICv5 vgic, so neither
has a valid caller in protected mode. Without FEAT_GCIE those registers
are UNDEFINED at EL2, so either path panics the hypervisor. Both need a
compromised host kernel rather than host userspace, so this is hardening
and not a guest-reachable hole.

I had said these paths were unreachable under pKVM because
vgic_v5_probe() skips GICv5 registration in protected mode [2]. That was
wrong. The skip is host-side only, and does not constrain what a
malicious host can call.

The third one is not pKVM. can_access_vgic_from_kernel() excludes only
the GICv3 system register interface, so on a native GICv5 system without
FEAT_GCIE_LEGACY the kernel reaches EL2-only registers from EL1 under
nVHE, and the world switch does the same work at EL2 anyway.

The last patch drops the VGICv3 reference from two nVHE world switch
comments that cover GICv5 too. No functional change.

Tested on QEMU. I also checked the first one with a local host patch
that hands EL2 a GICv5 model: it panics at __vgic_v5_restore_state
before the series and boots cleanly after.

Based on Linux 7.2 (8d3ae59288f1e). It also applies cleanly to
kvmarm/next and kvmarm/fixes.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260806100256.371164-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/CA%2BEHjTyGULmVCgyoya3bXG4gRj0OYFE1gnJLhNE6kvCrZFtXyQ@mail.gmail.com/

Fuad Tabba (4):
  KVM: arm64: Validate the host-provided vgic model in pKVM
  KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
  KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
  KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch

 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  6 ++++++
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 11 +++++++++--
 arch/arm64/kvm/hyp/nvhe/switch.c   |  4 ++--
 arch/arm64/kvm/vgic/vgic.c         | 12 ++++++++----
 4 files changed, 25 insertions(+), 8 deletions(-)

-- 
2.39.5


