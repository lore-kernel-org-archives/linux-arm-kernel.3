Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80082C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSzqVjtaPX+zB08auG+dlPNx36Rmc7kG2yhCglLs8/A=; b=wr/H0PSTVTssBFYf2ly3AkoFJb
	w9aJubayzZgM2LGg69t9tD4/GeI1d9PytWIWXvdJZrrkYU42jhGatZ+eAGtevlW1zPzzJ8Fg8x5bJ
	XLn+8yLsnuYbVCDBycShUWnI6+28+L080Kiz+Jcj39sNUDDNeprdmR2jNuZP+/2hR9SxEyNkoDCkA
	wlZSwJSap58+Dxef/2yfZqwEbsl69B6+s4LPvGLsPRJwto9bANqVe/eI+03I+dDbzFG+bF9SKxz0A
	LkRkLkZdlcJUdc4Ct9lnWqKUXm7ixBATV9QWo2zSfiX/OpNfZOCDFEZFoFgSdNxsB8Hpbdyc/wFRb
	8PKOlIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRn-00000006YK5-2mpc;
	Tue, 15 Sep 2026 12:39:39 +0000
Received: from out-115.mta0.migadu.com ([2001:41d0:1004:224b::73] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRb-00000006XrH-0P8G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mk/b5DyxXxNpCbd83Px4peQhwwVpCq5zT28oWAat7Ks=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789475964; v=1; x=1790080764;
 b=vwIpTL7zc9ryqRPcM1w7yPToWxwzyigM8QBSjrGZYrWEDKlS75L8FG05sgwmFH3IKKWLW1fL
 At5Zn/OdiUPCygvyVh/P3X01avu8glio9qGivjDEnjMpuU002W3OF251KNGgK/Prw5l5W6c8Dah
 4IAfGbC1kuWomOHMvKeu7/bA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ef04c9e2fcffe17a;
	Tue, 15 Sep 2026 12:39:24 +0000
X-Mizu-Trace-ID: ef04c9e2fcffe17a
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
Subject: [PATCH 6/7] KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
Date: Tue, 15 Sep 2026 13:38:45 +0100
Message-Id: <20260915123846.2317931-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915123846.2317931-1-fuad.tabba@linux.dev>
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053927_313907_A0B71A2B 
X-CRM114-Status: GOOD (  13.30  )
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

can_access_vgic_from_kernel() excludes only the GICv3 system register
interface, so on a native GICv5 system without FEAT_GCIE_LEGACY it
returns true under nVHE. The kernel then saves and restores the CPU
interface from EL1, where ICH_VMCR_EL2 and the ICH_PPI_* registers are
UNDEFINED, and the nVHE world switch already does that work at EL2.

Require VHE for GICv5 as for GICv3.

Fixes: 9b8e3d4ca0e73 ("KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore")
Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index b25303d9919fd..da72779d3b3ee 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -1045,11 +1045,15 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 static inline bool can_access_vgic_from_kernel(void)
 {
 	/*
-	 * GICv2 can always be accessed from the kernel because it is
-	 * memory-mapped, and VHE systems can access GICv3 EL2 system
-	 * registers.
+	 * GICv3 and GICv5 drive the CPU interface through EL2 system
+	 * registers, so only VHE reaches them from the kernel. GICv2 is
+	 * memory-mapped and always reachable.
 	 */
-	return !static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif) || has_vhe();
+	if (static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif) ||
+	    kvm_vgic_global_state.type == VGIC_V5)
+		return has_vhe();
+
+	return true;
 }
 
 static inline void vgic_save_state(struct kvm_vcpu *vcpu)
-- 
2.39.5


