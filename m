Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733C5CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bqDOAwSMJoESa7IGvpvNsqYJH+0SnO+WSGpdq05dVb0=; b=nYQ2gquXzYtmj6SF7bHuBXr+tP
	ACo+qmXJhy7tY/hOB8M3kHRwzPyeVc0z8JXbJXgLZWUPPODWBVuOAWPnShi2HKg1L7Df4CYYrUk1T
	JVoIefRk3cpZ7+8kj/ezJiCoTtC9MxTWIjdn3+ceG2dPdortoSRfGyixsEgR9CeINhLsbfFITIhRU
	EXF1g338SePB55D1IC7KqQBTaIkJemj6s2WAfYubhH8/tqreXjzHxKhs/Ll8sWpgMjcTBZLCOHB4q
	Et1OwrAnrRML7CM/KU6j2DW2h2tE8oHrLVKIyGWG8fgMkI+yPejRtmfiJe7VOENuhMi45u7LBrZEQ
	bZpa3Cag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBhI-00000009z7v-22dG;
	Mon, 12 Oct 2026 08:47:52 +0000
Received: from out-53.mta1.migadu.com ([2001:41d0:203:375::35] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBhF-00000009z6x-3PKV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:47:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SEZ6etcTUGf9RNiXMMSRKfIgUoYwJmmBOcXlKCaLB1c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791794866; v=1; x=1792399666;
 b=LifUpA1OiIiDsoTE2x+/KfBOlpw5lBYJmid7KmgnX26wU7RSeNLTCIwLjTY3ssOWJWLi1PBX
 u35Uy39rnR0B6wIACwpoR99Q/bFmB+dCdWDXXN3/YZ0JoJU+rz0uVM1bm2ch7364Yazc9LiOyeI
 fQdoCSbveYyVF2dbY2DrY7oQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ea7dd119e4327306;
	Mon, 12 Oct 2026 08:47:46 +0000
X-Mizu-Trace-ID: ea7dd119e4327306
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v1] KVM: arm64: vgic-v4: Don't forward an LPI with no target vCPU
Date: Mon, 12 Oct 2026 09:47:43 +0100
Message-Id: <20261012084743.2228612-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_014749_991078_8BA38C92 
X-CRM114-Status: GOOD (  12.60  )
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

KVM keeps one vgic_irq per LPI. The MAPTI that creates it sets its
target vCPU from that MAPTI's collection, and a later MAPTI of the same
LPI leaves the target alone. Mapping one LPI from two events is
UNPREDICTABLE (IHI 0069H.b, 5.2.10), but nothing stops a guest doing
it. If the first MAPTI names a collection the guest never maps and the
second a mapped one, the LPI translates through the second event with
a NULL target vCPU.

When the VMM routes an assigned device's MSI to that event on a host
with GICv4 enabled, kvm_vgic_v4_set_forwarding() takes the vPE from the
NULL target vCPU and the host oopses:

  Unable to handle kernel paging request at virtual address 0000000000001980
  [...]
  Call trace:
   its_build_vmapti_cmd (drivers/irqchip/irq-gic-v3-its.c:943) (P)
   its_irq_set_vcpu_affinity (drivers/irqchip/irq-gic-v3-its.c:1380)
   irq_set_vcpu_affinity (kernel/irq/manage.c:670)
   its_map_vlpi (drivers/irqchip/irq-gic-v4.c:326)
   kvm_vgic_v4_set_forwarding (arch/arm64/kvm/vgic/vgic-v4.c:485)
   kvm_arch_irq_bypass_add_producer (arch/arm64/kvm/arm.c:2977)
   irq_bypass_register_consumer (virt/lib/irqbypass.c:44)
   kvm_irqfd (arch/arm64/kvm/../../../virt/kvm/eventfd.c:496)
   kvm_vm_ioctl (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:5270)

Leave such an LPI to the software path, which copes with a NULL target,
as kvm_vgic_v4_set_forwarding() already does when the MSI doesn't
translate.

Fixes: 196b136498b35 ("KVM: arm/arm64: GICv4: Wire mapping/unmapping of VLPIs in VFIO irq bypass")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Tested on QEMU, which emulates the GICv4 ITS, with a local reproducer
that sets up the two MAPTIs and forwards a vfio-pci MSI to the LPI. It
oopses without the fix and passes with it. Not tested on GICv4 hardware.

Based on v7.3-rc3.

 arch/arm64/kvm/vgic/vgic-v4.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d7..545e55317c863 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -466,6 +466,13 @@ int kvm_vgic_v4_set_forwarding(struct kvm *kvm, int virq,
 	if (irq->hw)
 		goto out_unlock_irq;
 
+	/*
+	 * Silently exit if the LPI has no target vCPU, as one mapped by
+	 * multiple ITEs (UNPREDICTABLE) can have.
+	 */
+	if (!irq->target_vcpu)
+		goto out_unlock_irq;
+
 	/*
 	 * Emit the mapping request. If it fails, the ITS probably
 	 * isn't v4 compatible, so let's silently bail out. Holding

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


