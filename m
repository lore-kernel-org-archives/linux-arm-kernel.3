Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B314CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpUZE8/qlLMjm/C7jl3/P3b52rdYlLRsKnKK3VROqQw=; b=xe07Xfz62rDGC14iPu1B61vNxG
	lGX36UvQHsEPrJo9h7eYaBORuIEKpBBuurnwc1Bq4qxrtoYMNtbGSyuw8MLpy0LETfRFd1E6Q/17t
	PTloWyDriF0mriRPyGD6oxPgET53sCZAPk5bHjeD4MgIvNTV+JjsyBiXMgpyR7nuyOyPrckpqCRJS
	oGKz8uk86iEIpFjRdgvAd+k3D55qmgEJM2M2lKGlOgR96PRqsPoSm8vNaXRuwiOEySJ+fdkM8ISSt
	Y1DDtrinNI+dTFGaGX+jZsIXwbrpT3aZAfE9X6S27w5rwB/N5n768lgcQaNEGBsVOUxqrE7+e5wX7
	HdNwJpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFufi-000000098Rf-2ekk;
	Sun, 11 Oct 2026 14:37:06 +0000
Received: from out-168.mta0.migadu.com ([2001:41d0:1004:224b::a8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFufa-000000098Om-1iAB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 14:37:02 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=W/CBcZgzrCyfWkw/en5F1F87whMpeCt6l2XK9zwdnwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791729416; v=1; x=1792334216;
 b=u9WvkEiJYfVKNfKXd/Kz8sjtH/nxhG6NTWk+/gObY2YPMB9muWhzrnnQ087g/ov4il8fdUoh
 e8qv+nva89gGEnY27NsciUFWaQpqkPCdBW1B9mCIv6DWDnxatsggwBphqpnKwXTfj+nCKivfiyn
 LPfQKs+Zw1GcfEiYsNmB5cXU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d34b3f25e440f7c0;
	Sun, 11 Oct 2026 14:36:56 +0000
X-Mizu-Trace-ID: d34b3f25e440f7c0
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
Subject: [PATCH v2 4/5] KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
Date: Sun, 11 Oct 2026 15:36:47 +0100
Message-Id: <20261011143648.211337-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261011143648.211337-1-fuad.tabba@linux.dev>
References: <20261011143648.211337-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_073701_447788_93C3CCCE 
X-CRM114-Status: GOOD (  12.51  )
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
UNDEFINED, so running a vCPU oopses the host. The nVHE world switch
already does that work at EL2.

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


