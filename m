Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B67CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0VyEbGv3GHcGbrmOxk3gbG53UoU2VyJ9oiiW4aj4lQ=; b=yaoLrImi627GsO+FUTrLsXIzbe
	eUy9nq2hNS5c2sga1OAG8CWVNMKrEeZF2rRWwfkCF/xjVsdsUhHS2WdI3xbq3EZRdDs1AEGh6EJ4M
	CFtXAiekVW9Wu+4k27x4ybE6bdAvkXmpRHO8hXTJMgcarnpAQZVRQ5Vq2g8QY0BGoZepTkmpxYfuT
	aRavY96uHzIa343BMVFdCYPrt33iZaXUlzy8D6XDFCFroXRp3V4WWioS7DDtFnUubYfJt5c8WDQb5
	lgnlazTqEX1jtqxdhLiQ5AfleK9S4BP/nuPDOYni3xfoJ6OU81jiuNYWEaDXNa3VOfE0esQ1wjapr
	WQCUhDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERkP-0000000474A-0pmo;
	Thu, 30 Oct 2025 12:27:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERkH-00000004708-1Ker
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:27:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1A6C44B72;
	Thu, 30 Oct 2025 12:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913F2C4CEFF;
	Thu, 30 Oct 2025 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761827232;
	bh=QP7tdwQd4OxeSGfWsVqm9Zb2T1wUSpsY0DId1bNFcO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GDTWIEl7dRwqX5FLwLXig5AWQ+CJHxhp9h9vIvTwBbpV+pexoRdlxpe1Z87KO83Gn
	 wn09GM4J4n3aiOmsM/ndwhOFKLd3SSJ1HIemA/UUdXmzrBAuc7kmtMTs0yNAdY+F9j
	 +JJHC2CjAgme30ypZEsFDxPZaPB4EWvhtNckebu08nyFAu4qd2RCX2WJwX02wxuMov
	 /dGLiQ+LKhMaVpOqBHv8yOGExoTExl3c39tjD+t3furbnOd7R4JrlCpd850od53XEI
	 9MU51fKSBKDGK//FulYK2e1icg9klKg98g5SxT22YGjTn2PBv0io+Zk+6j/qwU0ZO3
	 MPODi/EshA2eA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vERkE-00000000yNP-2HBu;
	Thu, 30 Oct 2025 12:27:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/3] KVM: arm64: Set ID_{AA64PFR0,PFR1}_EL1.GIC when GICv3 is configured
Date: Thu, 30 Oct 2025 12:27:06 +0000
Message-ID: <20251030122707.2033690-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030122707.2033690-1-maz@kernel.org>
References: <20251030122707.2033690-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_052713_477107_69B90DBE 
X-CRM114-Status: GOOD (  12.18  )
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

Drive the idreg fields indicating the presence of GICv3 directly from
the vgic code. This avoids having to do any sort of runtime clearing
of the idreg.

Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-init.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 1796b1a22a72a..ca411cce41409 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -71,6 +71,7 @@ static int vgic_allocate_private_irqs_locked(struct kvm_vcpu *vcpu, u32 type);
 int kvm_vgic_create(struct kvm *kvm, u32 type)
 {
 	struct kvm_vcpu *vcpu;
+	u64 aa64pfr0, pfr1;
 	unsigned long i;
 	int ret;
 
@@ -161,10 +162,19 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 
 	kvm->arch.vgic.vgic_dist_base = VGIC_ADDR_UNDEF;
 
-	if (type == KVM_DEV_TYPE_ARM_VGIC_V2)
+	aa64pfr0 = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1) & ~ID_AA64PFR0_EL1_GIC;
+	pfr1 = kvm_read_vm_id_reg(kvm, SYS_ID_PFR1_EL1) & ~ID_PFR1_EL1_GIC;
+
+	if (type == KVM_DEV_TYPE_ARM_VGIC_V2) {
 		kvm->arch.vgic.vgic_cpu_base = VGIC_ADDR_UNDEF;
-	else
+	} else {
 		INIT_LIST_HEAD(&kvm->arch.vgic.rd_regions);
+		aa64pfr0 |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, GIC, IMP);
+		pfr1 |= SYS_FIELD_PREP_ENUM(ID_PFR1_EL1, GIC, GICv3);
+	}
+
+	kvm_set_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1, aa64pfr0);
+	kvm_set_vm_id_reg(kvm, SYS_ID_PFR1_EL1, pfr1);
 
 	if (type == KVM_DEV_TYPE_ARM_VGIC_V3)
 		kvm->arch.vgic.nassgicap = system_supports_direct_sgis();
-- 
2.47.3


