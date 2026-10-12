Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAD8CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWNY32PVovjhg8jwlUhiX9dWWep1pvzN5pazxTw3+kE=; b=jvIPGiigJ5/lD5Ya4xHYAyp1+V
	2knRMEBOognAaGp2OwTRpz7M+mKm/PJWu0E+d0c5Pvrd5pna18X3ix1/iu8ciNhJSG4WiT9Lqiu2K
	y1WjhLRveb9LM+VfDU6qWBsG3rPtJ8HOKwen7cUAMLpkFrlEw6i7q3jJ1nT8hBNj+cDdQmA21ENES
	kA15+CYSEIQhgp3ifjYVgITyUEVGq2tKEnHLUS/4gHDZDOnwwWtBOpiscwlTJUoqYAbud9OowKEZk
	kZdQPoo5jH7iy8ZP6OVVorRuYLG5WUFQ5hPN3tRXAKLMoqNZZfK5zMNHD/uO8AByiV1F0MBQZDxpk
	Q19z7vyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIh0-0000000AwB1-2ylo;
	Mon, 12 Oct 2026 16:16:02 +0000
Received: from out-92.mta0.migadu.com ([2001:41d0:1004:224b::5c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGIgj-0000000Aw58-0LOM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:15:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=o7DFXgB7gt6JJSGpUWCP61Fwkd7G9jFVrpvO58x0yzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791821743; v=1; x=1792426543;
 b=v1I7JqKv0A4pu4KQCydGJ/aRNeXNNUp6kEFfLJPQSyfRH3tLXG+SDPpHrVL0S7MQQrz0Zaj8
 tr25OBH8mVLd1F6fXR599w28M1QgmNHtQM7aOkr3hbC2WV/R/fYqJzunL12paHdpsWpv4oNhBpj
 t/W3m+mnwZQ/9WFEKyAw4Lfo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 14a0d496e56a0a12;
	Mon, 12 Oct 2026 16:15:43 +0000
X-Mizu-Trace-ID: 14a0d496e56a0a12
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
Subject: [PATCH v3 4/5] KVM: arm64: vgic: Do not access the GICv5 CPU interface from EL1
Date: Mon, 12 Oct 2026 17:15:23 +0100
Message-Id: <20261012161524.4016464-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261012161524.4016464-1-fuad.tabba@linux.dev>
References: <20261012161524.4016464-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_091546_348790_7F7F13F0 
X-CRM114-Status: GOOD (  13.05  )
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

can_access_vgic_from_kernel() requires VHE only for the GICv3 system
register interface, so on a native GICv5 system without
FEAT_GCIE_LEGACY it returns true under nVHE. The kernel then saves and
restores the CPU interface from EL1, where ICH_VMCR_EL2 and the
ICH_PPI_* registers are UNDEFINED, and running a vCPU oopses the host.
The nVHE world switch already does that work at EL2.

Anything that requires EL2 system registers or instructions is out of
reach of a kernel running at EL1, which leaves GICv2, the one
memory-mapped CPU interface. Allow GICv2 from EL1 and require VHE for
everything else.

Fixes: 9b8e3d4ca0e73 ("KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore")
Suggested-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index b25303d9919fd..fe5b14a8b1214 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -1045,11 +1045,10 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 static inline bool can_access_vgic_from_kernel(void)
 {
 	/*
-	 * GICv2 can always be accessed from the kernel because it is
-	 * memory-mapped, and VHE systems can access GICv3 EL2 system
-	 * registers.
+	 * GICv2 is memory-mapped. Every other CPU interface uses EL2 system
+	 * registers, which only VHE can access from the kernel.
 	 */
-	return !static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif) || has_vhe();
+	return has_vhe() || kvm_vgic_global_state.type == VGIC_V2;
 }
 
 static inline void vgic_save_state(struct kvm_vcpu *vcpu)
-- 
2.39.5


