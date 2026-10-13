Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5F6CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p337RtICNQShYL36JlSwVaoBUn2srpdUyS7IausLBHw=; b=ii3YTmLwLnLK3VGB8Y2zdHV6aR
	s7amUN7oXjE2Yh9UEJCtYsLAAEXTiYrWnms0Jlu36etX7kaNvn/54qkjDIl3G5GgraUcolUBcGXH1
	cXxgSh+Y3sgsqy4bQu2GYefg+1sxne85Vwz35yNMv8XI5f9HjEdXjLNimqd4FINHj8KVtwIIWM0GW
	UWjB0bjbbp4AxsAiXIUJ19PsYD0SLCZK+5rBBmbvnKzJoni2kf18hklm4MGw4ag6QpJMpAlEELlay
	+teDT/0J02/o5Heh+lRSKS82HErfHbE5E+6jtI5RwWp4U74UCiiOM0OMhkjcahNwtsR8uuPm0LK9L
	nXfByhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXh8-0000000CIku-2pad;
	Tue, 13 Oct 2026 08:17:10 +0000
Received: from out-87.mta1.migadu.com ([2001:41d0:203:375::57] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXh0-0000000CIhr-30CP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 08:17:08 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=QOyVRTmWh+YT7G+cpGvL66+aoL8H82+I49NPk8LYl+U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791879420; v=1; x=1792484220;
 b=Gp2nP+pHOe5Lp/et1yJeGbgH/+x9cN0DXk8zE3PXvHDZ4kolbcGb/VVt3+a32LtfaNmlG0rC
 3yT5yPU+6WVoTvrjgSgvU+sLUh5AUf/9uFh8ANALqX9BbmKu1J1Kq5TEenVeGrqi3Xbf0mQxJb9
 E9gJ30yAG8X/yBCVyYXjcF7g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3790d623399d7862;
	Tue, 13 Oct 2026 08:17:00 +0000
X-Mizu-Trace-ID: 3790d623399d7862
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
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: vgic-its: Remove the pending state of a discarded LPI
Date: Tue, 13 Oct 2026 09:16:46 +0100
Message-Id: <20261013081646.933312-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013081646.933312-1-fuad.tabba@linux.dev>
References: <20261013081646.933312-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_011705_413919_C2AE24B8 
X-CRM114-Status: GOOD (  13.66  )
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

DISCARD removes the mapping of an event and instructs the Redistributor
to remove the pending state of its LPI (IHI 0069H.b, 5.3.4). KVM only
frees the ITE, so an LPI that is pending when the guest discards it
stays queued on its target vCPU, and the guest still takes it.

Clear the pending state before freeing the ITE. A queued LPI can be
pending in a running vCPU's list register, so halt the guest first when
the LPI is queued, to fold that state back. A forwarded LPI already
loses its pending state in its_free_ite(), whose unmap from the vPE
sends a DISCARD to the host ITS.

Fixes: df9f58fbea9bc ("KVM: arm64: vgic-its: Implement ITS command queue command handlers")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 44b92c01bc727..3b8e0e5b097e0 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -829,13 +829,27 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 		struct its_device *device = find_its_device(its, device_id);
 		int ite_esz = vgic_its_get_abi(its)->ite_esz;
 		gpa_t gpa = device->itt_addr + ite->event_id * ite_esz;
-		/*
-		 * Though the spec talks about removing the pending state, we
-		 * don't bother here since we clear the ITTE anyway and the
-		 * pending state is a property of the ITTE struct.
-		 */
+		struct vgic_irq *irq = ite->irq;
+		bool queued;
+
 		vgic_its_invalidate_cache(its);
 
+		/*
+		 * A queued LPI can be pending in a running vCPU's list register,
+		 * which the exit path folds back: halt the guest before clearing.
+		 */
+		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
+			queued = irq->vcpu;
+
+		if (queued)
+			kvm_arm_halt_guest(kvm);
+
+		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
+			irq->pending_latch = false;
+
+		if (queued)
+			kvm_arm_resume_guest(kvm);
+
 		its_free_ite(kvm, ite);
 
 		return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
-- 
2.39.5


