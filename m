Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12243F483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0GAOT31zHh72w1WblHiFiy1VHQGY48OqHBlC7Rh+oAw=; b=SB3gsXSAGoMXuyPi+s2xz4XWxi
	AZcHbNDQF6H1F2gQ7UQoFmFFPJTPvA06jUJLBxTomOkD8k8Ohu4PRPruTQE4KL9D7YyRiQupyqqzf
	87hYFBR4RkHn8WPKHXYc1RwlQSC1ShQGeU/g/W5SO1y2ycKxVLG96dZGKHTk32j8Ai5dTCqj4JUe9
	GJAwSRX/JNpxXWGaBzXXCWQuTMcV9a906gpj4urDJ967mFC1cGMa+nBhLFOQv7F5BT4dv3wbVZmQ+
	Pes5JIyJ9EVUCTvOo+rY8eE56ijefITNpslUUANrdeKBaL+C7TxUEH6d3LlN2r8YeO7LzmOM0uqoe
	Km6Kv9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jN3-0000000HG9K-08D5;
	Mon, 23 Mar 2026 17:47:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jN2-0000000HG8W-0mK1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40D5E600CB;
	Mon, 23 Mar 2026 17:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3266C4CEF7;
	Mon, 23 Mar 2026 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774288039;
	bh=Zy4puHzdO9fdFncJD3haPPVzqpmQid8Z6DA7NwACs8k=;
	h=From:To:Cc:Subject:Date:From;
	b=AXtk4lWs9dxuSKQzTKdqZgWd7CkMEQl4IDtwnmCzU+V5yBNI/8F+ZXwjVVlpF3n5j
	 8vTW4Hrc8im8BwwYo7Rz/Ppk3ei9BTrjRWlmNNBgke6uows+5x9KY88ICvn3luxGLH
	 ohIEWEeRqU7IUcdVE7O4l2bCa2xaMPRfmLtKgqH3QAHBytwf3nGUxGhRwhk9UWo6HE
	 gkUG6m+NwTo6UTTNoW6AcIiNJ3DW9CbcwdqL4yVaCmMzXC01jRnUfdM9AjZFupflrT
	 cf9rgGnUhsC8Xkktg4Zibx93XwYR9r+hm7OwzOolGyalfLXLcJjgn35PuOHlyXtW0o
	 kIRjOBXGU4IdA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w4jMy-00000004pxw-30GE;
	Mon, 23 Mar 2026 17:47:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: vgic: Don't reset cpuif/redist addresses at finalize time
Date: Mon, 23 Mar 2026 17:47:13 +0000
Message-ID: <20260323174713.3183111-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

Although we are OK with rewriting idregs at finalize time, resetting
the guest's cpuif (GICv3) or redistributor (GICv3) addresses once
we start running the guest is a pretty bad idea.

Move back this initialisation to vgic creation time.

Fixes: a258a383b9177 ("KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 47169604100f2..fd872079f2a24 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -147,6 +147,15 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 	kvm->arch.vgic.implementation_rev = KVM_VGIC_IMP_REV_LATEST;
 	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
 
+	switch (type) {
+	case KVM_DEV_TYPE_ARM_VGIC_V2:
+		kvm->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
+		break;
+	case KVM_DEV_TYPE_ARM_VGIC_V3:
+		INIT_LIST_HEAD(&kvm->arch.vgic.rd_regions);
+		break;
+	}
+	
 	/*
 	 * We've now created the GIC. Update the system register state
 	 * to accurately reflect what we've created.
@@ -684,10 +693,8 @@ void kvm_vgic_finalize_idregs(struct kvm *kvm)
 
 	switch (type) {
 	case KVM_DEV_TYPE_ARM_VGIC_V2:
-		kvm->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
 		break;
 	case KVM_DEV_TYPE_ARM_VGIC_V3:
-		INIT_LIST_HEAD(&kvm->arch.vgic.rd_regions);
 		aa64pfr0 |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, GIC, IMP);
 		pfr1 |= SYS_FIELD_PREP_ENUM(ID_PFR1_EL1, GIC, GICv3);
 		break;
-- 
2.47.3


