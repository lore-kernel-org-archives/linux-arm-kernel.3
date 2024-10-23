Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B549CF539F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngteDkwX9NpDZdFOcQPifmAdhkHyYdZoglWEcX2W8qM=; b=25KmoWuABDD+8TDVS72ykWRzma
	FmJLFM4HXKSzSQKYd35QGXmcT8O3snZTv8HBzLZ4orkVeYAnSmrnJrzBIgDLr/bb9SB/zUlhZpxVS
	haOdVGLa4rra1go61aCC5pYpzHywaFQTzMyoheTSFPkj1FH9b4Nwve5o56v2ZoS96w2np8d7lL1GK
	cEOxjgkR4Ot+kRQwD8oIf7rmqyCdfJCnJOvd3aCeAHs0PcyOw+LvT/3zGt8WusnX2fCj3c7PDtm1A
	PniYbjfYl9kdNu0EiWMyajhmfTuydYpk0efnVw/NzdTPQf1cgIR6HxzZS6h7Oj2Ut8mdj44FhBIWJ
	Ms6VeO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ctF-0000000Erqx-3NG6;
	Wed, 23 Oct 2024 15:03:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckD-0000000EpGw-2GnY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56239A45010;
	Wed, 23 Oct 2024 14:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18349C4CEEF;
	Wed, 23 Oct 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695232;
	bh=V2gaNQUIj9Ndd/20OKV+EYyMNIrQ8wsENOpxc4LklRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0B8yTgzGNwJHYrGwRf0JjQznwLRz2V1Bt9j9a4HhaV87egqSEeA1KQgflKtvYYA2
	 GCmQJGQUHXbnapg6tB/mEvkZ7uhXiHK1yUuZhStg7LqpbNa9r0pTKUo7qJQXX1Vx3N
	 EOrApQSDffDR1e2/UkhW/PFeE1IHUu7OB1KoOrcvMyzakigDfZ22Rlflio38Zu7TPX
	 PUfIC2o5Czw0JnG+NpUl1Z1TXhNlnMG7PSCa7gs8pEe4FMq+q9vXsjbsIIPlOWijus
	 vRDdGZk0RUnBK8yn7iLxkaKWHdaYWxEY0PWDcMIlpEXY+Rb8EjCxM9RhULA39pSkn8
	 0CI+t6GTRuoPA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckA-0068vz-9o;
	Wed, 23 Oct 2024 15:53:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 04/37] KVM: arm64: Drop useless struct s2_mmu in __kvm_at_s1e2()
Date: Wed, 23 Oct 2024 15:53:12 +0100
Message-Id: <20241023145345.1613824-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075353_718135_1286CF5D 
X-CRM114-Status: GOOD (  10.20  )
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

__kvm_at_s1e2() contains the definition of an s2_mmu for the
current context, but doesn't make any use of it. Drop it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 39f0e87a340e8..f04677127fbc0 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -992,12 +992,9 @@ void __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	 * switching context behind everybody's back, disable interrupts...
 	 */
 	scoped_guard(write_lock_irqsave, &vcpu->kvm->mmu_lock) {
-		struct kvm_s2_mmu *mmu;
 		u64 val, hcr;
 		bool fail;
 
-		mmu = &vcpu->kvm->arch.mmu;
-
 		val = hcr = read_sysreg(hcr_el2);
 		val &= ~HCR_TGE;
 		val |= HCR_VM;
-- 
2.39.2


