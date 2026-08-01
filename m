Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACBCC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xk1tj8UdOa+0rxIkU73il1OAVkAO8SsQO8ZeKapXV9c=; b=LBAWbNKHj6/BMooGF9TInDQ2Nc
	IDfeW+KGbbs+NtcJgfqUDoAcV8tx5ovZd+yzGu86B6PHCt8V0HxfvzIBxlKFm+6XRiluzaJcJfxz0
	Me/3Ig+wr/YlVHVV/C6TLEbVZ2MxwKZcD5ILELhS8GW00jyVeItY/Qu7WCWE3Q6/AOpaaJApB8dc8
	tXk5r5qgFjTLG/AyUixEXiDYIV3GFHuXiIXqt9PncoWAfvFQwS4hrfivV1OjqqE5HUdUqKcua7dCm
	s0M5Iv30vOMG+BQIhMIPI2uq66jE6IvM3MAjKnnK/9CngKNbTHjg0OIaOtPn8ylcLqU2RnS0MepvJ
	y42EdvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98u-0000000EfCh-1yPh;
	Sat, 01 Aug 2026 12:48:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98s-0000000EfAd-3hRI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 211604397E;
	Sat,  1 Aug 2026 12:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CEC1F00AC4;
	Sat,  1 Aug 2026 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785588522;
	bh=xk1tj8UdOa+0rxIkU73il1OAVkAO8SsQO8ZeKapXV9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SUG8zk/43e39gitA6FnAldx+K6KvyRBHfVLouk2VyZ1X+PNtsCuUSGphVXI/l9mHG
	 FIkgNa4XP9fIkmhxMcKCiSIwHwu8+rKA84ymtBQuh9GnP6Fet9m3+g8qu/JvgMUQRs
	 cWpKZ2jm+zpJHSjEF2HUDyY3rJt6rKIbOkE7ldpryr3YijByfaeZHdLSj0VpV+I9m0
	 gDJozrqHyLRO7KYTXaalNHYapX8PU71QjFH0jMPtlJj1RzcV6TQq1Biwg2BLcnoHV8
	 u+AUH/Ne4519+nzJ/skAaE4/+SHC8GgdewunPkCIF21AHNQj2L2cZlQY+loBxC9urE
	 T/8ORtuIxXejQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wq98q-0000000BGK2-1Mca;
	Sat, 01 Aug 2026 12:48:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: [PATCH 5/6] KVM: arm64: Couple VNCR fixmap clearing and CPU number invalidation
Date: Sat,  1 Aug 2026 13:48:17 +0100
Message-ID: <20260801124818.366274-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801124818.366274-1-maz@kernel.org>
References: <20260801124818.366274-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com
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

A mapped VNCR translation must indicate which CPU it is resident.
Unmapping such a translation must make this CPU number -1.

Couple the unmap and the setting to -1 in a helper, so that we
are always sure they are done together.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 47d61d3cf053c..84915e2cff604 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -894,6 +894,12 @@ void kvm_vcpu_load_hw_mmu(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void unmap_l1_vncr(struct vncr_tlb *vt)
+{
+	clear_fixmap(vncr_fixmap(vt->cpu));
+	vt->cpu = -1;
+}
+
 static void this_cpu_reset_vncr_fixmap(struct kvm_vcpu *vcpu)
 {
 	if (!host_data_test_flag(L1_VNCR_MAPPED))
@@ -902,8 +908,7 @@ static void this_cpu_reset_vncr_fixmap(struct kvm_vcpu *vcpu)
 	BUG_ON(vcpu->arch.vncr_tlb->cpu != smp_processor_id());
 	BUG_ON(is_hyp_ctxt(vcpu));
 
-	clear_fixmap(vncr_fixmap(vcpu->arch.vncr_tlb->cpu));
-	vcpu->arch.vncr_tlb->cpu = -1;
+	unmap_l1_vncr(vcpu->arch.vncr_tlb);
 	host_data_clear_flag(L1_VNCR_MAPPED);
 }
 
@@ -996,7 +1001,7 @@ static void invalidate_vncr(struct vncr_tlb *vt)
 {
 	vt->valid = false;
 	if (vt->cpu != -1)
-		clear_fixmap(vncr_fixmap(vt->cpu));
+		unmap_l1_vncr(vt);
 }
 
 static bool vncr_tlb_intersects(struct vncr_tlb *vt, u64 addr,
-- 
2.47.3


