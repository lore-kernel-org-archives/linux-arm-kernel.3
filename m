Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06DEC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V1OJe/PA8FnxE9FSJvdQpOlWo3h8Hc8FZ6ajz7FeFDU=; b=UaXeMLCPbHf+dRTGt7hk67v391
	ph5AtBjwn2NF71ftNYOO2U1+Pb03rGZks5+h7ESkY12pLQZ6mvpP3WaobB55SkkC6ANQrxhOc+CbO
	Jyuk9YlMS83m+MObnYDX6sJbBzX0IFQdHuUxY/Rfg6jJVGPnUOeAM2HxOsmWLeK0/PyjLT+VSCQT9
	n50+Nn9R8a8+sKHK5x+bk/B1WIgZ4KLnM37TZC0jAwAz49rtpYZgtY4NMXq6IbHNue1dBJenjyzeX
	g02+oawj3bjFrdv4+eNVtfV5ue5/QEGnWqB2/qLfm+bBFtklsqMhoUMO9gf9gxP0GfuaEL5XDvWUp
	TzR0jSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOC0-0000000DCrT-0v8Y;
	Tue, 20 May 2025 14:43:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHO9t-0000000DCQk-1AR9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 14:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7480862A2B;
	Tue, 20 May 2025 14:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CCDC4CEE9;
	Tue, 20 May 2025 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747752092;
	bh=c6QyZgO3sFxt8cd7kKsM7NkPczhKjzK8imzKP37Lmms=;
	h=From:To:Cc:Subject:Date:From;
	b=AsNaiSBkLzeja5cdsVrAxHQp9eo8wSoGVBl13A/nxgWXE4px0E1foWrckPlDpOIj3
	 Rcb2FIGOIZEgA9weQ0G8K/Rv9CikcDnliCiJoVeXykI2/MHd6fiA4HC9Pq5ijdxGHG
	 E2KDhEY9UOcJvFWEhdYGwALbcbNwa7BEnCTqLSFaG0xcZ2o0j/xSNKnKMMEKwDGFhi
	 u7jpG593iPRDIiIX8ilepulujVsxNgbYa355KFMXr4S3OtcxnCWlPehHO4naQNsYCR
	 KHacbor01tHpfd6d9E2a8tfs3eeWNPkFLOIrzODZFv+Uew4ZYL3PyI8yubQazWvTIZ
	 JOlr3UhNoXFow==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uHO9p-00GbpR-TB;
	Tue, 20 May 2025 15:41:29 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: nv: Hold mmu_lock when invalidating VNCR SW-TLB before translating
Date: Tue, 20 May 2025 15:41:16 +0100
Message-Id: <20250520144116.3667978-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

When translating a VNCR translation fault, we start by marking the
current SW-managed TLB as invalid, so that we can populate it
in place. This is, however, done without the mmu_lock held.

A consequence of this is that another CPU dealing with TLBI
emulation can observe a translation still flagged as valid, but
with invalid walk results (such as pgshift being 0). Bad things
can result from this, such as a BUG() in pgshift_level_to_ttl().

Fix it by taking the mmu_lock for write to perform this local
invalidation, and use invalidate_vncr() instead of open-coding
the write to the 'valid' flag.

Fixes: 069a05e535496 ("KVM: arm64: nv: Handle VNCR_EL2-triggered faults")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 6a9fd4e0e789c..56b732003caa7 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1179,13 +1179,24 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
 
 	vt = vcpu->arch.vncr_tlb;
 
-	vt->wi = (struct s1_walk_info) {
-		.regime	= TR_EL20,
-		.as_el0	= false,
-		.pan	= false,
-	};
-	vt->wr = (struct s1_walk_result){};
-	vt->valid = false;
+	/*
+	 * If we're about to walk the EL2 S1 PTs, we must invalidate the
+	 * current TLB, as it could be sampled from another vcpu doing a
+	 * TLBI *IS. A real CPU wouldn't do that, but we only keep a single
+	 * translation, so not much of a choice.
+	 *
+	 * We also prepare the next walk wilst we're at it.
+	 */
+	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
+		invalidate_vncr(vt);
+
+		vt->wi = (struct s1_walk_info) {
+			.regime	= TR_EL20,
+			.as_el0	= false,
+			.pan	= false,
+		};
+		vt->wr = (struct s1_walk_result){};
+	}
 
 	guard(srcu)(&vcpu->kvm->srcu);
 
-- 
2.39.2


