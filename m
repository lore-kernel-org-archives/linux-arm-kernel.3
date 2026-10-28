Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0u4YpqZr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=siSl1Hy3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dNmOFP2cirQx+YDQEQMQpytQ7cOmuEPmcGGZd0DDSf0=; b=0u4YpqZrwcWEtW
	fGUIGAl1vQ/DqkO6VFB7UA5G4l3EAxZSjl9lnwJUoJccDXBBNFgzLPmzuVyNeaYi9XGSSwtZp2LO9
	E4q8xoC4C11zUa7+KBJ/5WRMAsol/fJrpUAeOPid1uqqVHV7BPH3FjrOhMFUhjcHcDV1JN4phh0i2
	kV5IblcdrTB+dr/vnuVklaw3VMkXC9i0QjoG9AO2BMA4oqNdBVO9kb6+cxkTnWNK5P1URcyJCdN2d
	2gjfgFPKdtOMR9DwFBMk9w2Ugm6kSUOeabs1XYesojiiLjP8/ucJULEh80FuNicWr94wOEr9LN83+
	fTZlKXUoyRRpZqyQy/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Wr-00000007fju-24hI;
	Wed, 28 Oct 2026 17:33:37 +0000
Received: from out-159.mta0.migadu.com ([2001:41d0:1004:224b::9f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7Wn-00000007fiI-2XUp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:33:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BTGGQc4FPmp0Xx9SreLWs1ULHPHd2vAigHga5ye70II=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793208811; v=1; x=1793813611;
 b=siSl1Hy3Cwsxg40/OJDoYSjJpFes5gt8chCTV0GO4pMSayCuyMok4eG3NgMyPrP59zJl0NV5
 2y1vrzBIJprMVWchPdoQHYoO+8T6kKuukG0f90BMbGJMV5IsRINV4z8yWSHQ4Oyw7p1xzah/tBe
 odDrPKg+Ue0dV2+WHT9WAG2I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d53de949a052cfc7;
	Wed, 28 Oct 2026 17:33:31 +0000
X-Mizu-Trace-ID: d53de949a052cfc7
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: vgic-its: Clear an unqueued LPI before dropping its lock
Date: Wed, 28 Oct 2026 17:33:18 +0000
Message-ID: <20261028173319.1807811-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028173319.1807811-1-fuad.tabba@linux.dev>
References: <20261028173319.1807811-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_103333_785424_5F4181F6 
X-CRM114-Status: GOOD (  13.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DISCARD reads which vCPU's AP list holds the LPI, drops the irq lock to
pause that vCPU, and takes the lock again to clear the pending state.
When no list holds the LPI there's nothing to pause, yet the lock is
still dropped. In between, vgic_queue_irq_unlock() can list the LPI (for
an MSI that had already made it pending, or a GICR_INVLPIR write
enabling it while latched) and its vCPU can load it into a list
register. The guest then takes an LPI it has discarded.

Clear an LPI that no list holds before dropping the lock.

Fixes: e99ff76f4a02b ("KVM: arm64: vgic-its: Remove the pending state of a discarded LPI")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 37059d1338406..42dc71495ad98 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -842,22 +842,24 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 		 * Only an LPI on a vCPU's AP list can be in its list registers,
 		 * which the exit path folds back, and that exit moves the LPI
 		 * to its target vCPU if the target has changed: pause both.
+		 * Clear an LPI on no AP list before dropping the lock, so that
+		 * nothing can put it in a list register first.
 		 */
 		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock) {
 			vcpu = irq->vcpu;
 			target = irq->target_vcpu;
+			if (!vcpu)
+				irq->pending_latch = false;
 		}
 
 		if (vcpu) {
 			if (target != vcpu)
 				kvm_pause_vcpu(target);
 			kvm_pause_vcpu(vcpu);
-		}
 
-		scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
-			irq->pending_latch = false;
+			scoped_guard(raw_spinlock_irqsave, &irq->irq_lock)
+				irq->pending_latch = false;
 
-		if (vcpu) {
 			kvm_resume_vcpu(vcpu);
 			if (target != vcpu)
 				kvm_resume_vcpu(target);
-- 
2.47.3


