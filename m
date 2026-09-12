Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAA4C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPsS2T1yv9TxZ62g74tWsPG1tgtql7lQ5uggCY+tQEU=; b=E2XWzgDvM6wE3gL63cnOmAbN9e
	6uWdHH0DyER1NWKgyOg2O/FOvHmYSURIu0H7kxM3xFsGF14WQlVXgsm3DAqDzGzlS+p3T+Brr/hr0
	pnZnc6QVK9N3gRPfxVRAQqEP34z4NKXdhhRQsSLJbKNR5I7o/h/OdLkn1xe+awDeZ9yXeCAcDeihV
	5K597bBeXAXeBDJdD6au08dN1vdHXQABhb6ioXRB85tYAcZ09MmkFBibVQIQHnXEg0Edt+ydQn231
	iIsK+ucQBHH8n6g5eaOU1TCuuz69yvv6qbEVePIpLhc3NroyuxRVEmfb5g2t0ZUsHvRhyTyO8dww+
	38/Dy/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHo-00000000nYe-3IXa;
	Sat, 12 Sep 2026 10:48:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHn-00000000nXr-0GTe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 10:48:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AA09444F8;
	Sat, 12 Sep 2026 10:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8C81F0089E;
	Sat, 12 Sep 2026 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789210122;
	bh=uPsS2T1yv9TxZ62g74tWsPG1tgtql7lQ5uggCY+tQEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B9TY/W/0OP8qWw2t6DM+wQ8UFUdvSqe9ASPSPQnmRKY44ylNK2HS0rkKDJSkVzIN8
	 Zr7PhT5iDmkyJGeIWFUy1tVAHetvMOBAqXGJahsiJASSpE5G/unf/0gIagfAoF632B
	 1UzyDjE/0bFgVih2M4UqC+ka3uADtwH8vTMQ4l1xnCKO3uTWbywGyuK0bStTiJ5eQu
	 cUJSUcZYHujVmIu2Gfw+okU7pILxDEvoF/WmDnr7iaDV5plawYS5SydaFBeHOBMy6R
	 UkCPya5xjGCqpJCIwlTENMqSVj9uId8vb6+eG/wfafSHomsUjkCMzQRP8I3bVsZCZA
	 jKhY4dY/O7Dog==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x5LHk-000000084hK-1hgD;
	Sat, 12 Sep 2026 10:48:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH 4/4] KVM: arm64: nv: Move TLBI VMALLS12E1* emulation over to kvm_stage2_unmap_all()
Date: Sat, 12 Sep 2026 11:48:34 +0100
Message-ID: <20260912104834.3093878-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260912104834.3093878-1-maz@kernel.org>
References: <20260912104834.3093878-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, weilin.chang@arm.com, wanghan@linux.alibaba.com, xueshuai@linux.alibaba.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev
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

Instead of emulating TLBI VMALLS12E1* with a range invalidation, use
kvm_stage2_unmap_all() which is more efficient, specially in deeply
nested cases.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 44aae52c473d7..2c90e185c6e8e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4124,26 +4124,24 @@ static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 	kvm_stage2_unmap_range(mmu, info->range.start, info->range.size, true);
 }
 
+static void s2_mmu_unmap_all(struct kvm_s2_mmu *mmu,
+			     const union tlbi_info *info)
+{
+	kvm_stage2_unmap_all(mmu, true);
+}
+
 static bool handle_vmalls12e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 				const struct sys_reg_desc *r)
 {
 	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
-	u64 limit, vttbr;
+	u64 vttbr;
 
 	if (!kvm_supported_tlbi_s12_op(vcpu, sys_encoding))
 		return undef_access(vcpu, p, r);
 
 	vttbr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
-	limit = BIT_ULL(kvm_get_pa_bits(vcpu->kvm));
 
-	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm, get_vmid(vttbr),
-				   &(union tlbi_info) {
-					   .range = {
-						   .start = 0,
-						   .size = limit,
-					   },
-				   },
-				   s2_mmu_unmap_range);
+	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm, get_vmid(vttbr), NULL, s2_mmu_unmap_all);
 
 	return true;
 }
-- 
2.47.3


