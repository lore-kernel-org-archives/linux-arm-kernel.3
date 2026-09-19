Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FF1C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdU6io/hRJ66f3mSnZH2JasywPl3rJU2sHZr8MAb3MY=; b=h+XyllzC0X8mr6USaS36Sha/Xp
	DjZnWXj5kZur0GPVV7S3Iimr0KDyyCZkeZ4XASJVmpNEPdKpZmHBXYb93PjMRQw77Ju7P7v0A1Og5
	i6QTCOMnN8JM0TmG7aGmrZ0h7uBrtlSQqcJSKmuLixyJYQ2BqDVb4xWXqSV0mWfAd+O94SpOEMhdy
	iWAhl0Pu0jXOruO+jFmh9EdOroXAK2EgAKy4gA5mW8AMuOz+MzjP8KOuDi6gCS+XX+nunExPvsFWJ
	O5nAq1ryoaSgsr4usXJ2rrAvB68fAkc/wvzY3rapVczB9XICYCqvAROHM9x0L7w+el4ardj4wpQdu
	KvyBxvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEX-0000000GFdB-3kxT;
	Sat, 19 Sep 2026 12:31:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7uEW-0000000GFcA-0y5R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 12:31:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9480F43C87;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8EE1F0089B;
	Sat, 19 Sep 2026 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789821115;
	bh=xdU6io/hRJ66f3mSnZH2JasywPl3rJU2sHZr8MAb3MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OJwB1mZGlmiD14uHL6wkrimerKGtUfsGCMAK1GxjlJqOg/H1egC+i/4P6cTx+zE2D
	 zF4xr4gjOWlPaJ3IBkW74RM7AR+9uPrPuPGU75aIGCSgbNeIk7PWKfHYrxDDxX5jem
	 9t1PgKBCXyXi6irqHx7MuVvqdiiDq7EA23JhXxrZ18OXu1FIDVHgWCoXqsXOIhXNyp
	 oVNeP2VVQGwxPMVvMU+5i3OTCtfk/ccY4T08Zsvcn3qGkGSKCpd4WPVK5pCSgOzyHp
	 wuLHbj3Z7LJOBjl1QXBbA9aHRq7L9RnvP/dqCeqV5OnXfClgZu/1AMONP5ulaaDzoy
	 nm8O4sXykMUAw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x7uET-0000000AwvV-3BF9;
	Sat, 19 Sep 2026 12:31:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH 3/4] KVM: arm64: vgic-v5: Tidy-up programming of vpe descriptor address
Date: Sat, 19 Sep 2026 13:31:49 +0100
Message-ID: <20260919123150.3283606-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919123150.3283606-1-maz@kernel.org>
References: <20260919123150.3283606-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, sascha.bischoff@arm.com
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

Assigning an address calculation to a vpe_entry is poor practice, and
results in sparse moaning loudly. Tidy things up by computing the
physical address as such, and performing the cpu_to_le64() on that.

Whilst at it, simplify the computing of that address, avoiding the
shifting back and forth, and kill the pointless GICV5_VPED_ADDR_SHIFT
definition.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5-tables.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
index d7196ed5d1bfd..2c8d0f360506c 100644
--- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
+++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
@@ -63,7 +63,6 @@ static DEFINE_XARRAY(vm_info);
 /* Virtual PE Table Entry */
 #define GICV5_VPE_VALID			BIT_ULL(0)
 /* Note that there is no shift for the address by design. */
-#define GICV5_VPED_ADDR_SHIFT		3ULL
 #define GICV5_VPED_ADDR			GENMASK_ULL(55, 3)
 
 /* L2 Interrupt State Table Entry */
@@ -725,7 +724,7 @@ int vgic_v5_vmte_alloc_vpe(struct kvm_vcpu *vcpu)
 	u32 vm_id = vgic_v5_vm_id(vcpu->kvm);
 	u16 vpe_id = vgic_v5_vpe_id(vcpu);
 	struct vgic_v5_vm_info *vmi;
-	vpe_entry tmp, *vpet_base;
+	vpe_entry *vpet_base;
 	void *vped;
 
 	/* Make sure we're not over what the hardware supports */
@@ -751,10 +750,9 @@ int vgic_v5_vmte_alloc_vpe(struct kvm_vcpu *vcpu)
 	vped = (u8 *)vmi->vped_base +
 		(size_t)vcpu->vcpu_idx * vmt_info->vped_size;
 
-	tmp = FIELD_PREP(GICV5_VPED_ADDR, virt_to_phys(vped) >> GICV5_VPED_ADDR_SHIFT);
-
 	scoped_guard(raw_spinlock_irqsave, &vgic_v5_irs_lock) {
-		WRITE_ONCE(vpet_base[vpe_id], cpu_to_le64(tmp));
+		phys_addr_t paddr = virt_to_phys(vped) & GICV5_VPED_ADDR;
+		WRITE_ONCE(vpet_base[vpe_id], cpu_to_le64(paddr));
 		vgic_v5_clean_inval(vpet_base + vpe_id, sizeof(vpe_entry));
 	}
 
-- 
2.47.3


