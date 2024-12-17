Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B52E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8W7tTgiBrNfexZNIpctnHPhQnDvFu0N18Np0AytvX2k=; b=Xi5E57c5Q93kvPbsE1kUoPy1Nr
	jswt6BrI51X2ISnk+ZnHsMkNL8WrFCSVEVIwj8h6PG+6IHevjX7evcZsL4iC29sffp7EMuW6ImUw8
	uYu7bo9ziw8tLP5qXD6IsxiLuqin6SKGZsLm+QBiFJyXkNPQ6E7Dob4e88+ZZ9C9/IIzcCG/MkSeL
	rbBRPetZWY6dUiTQcQFT97d8bdJmMLtvMp960UhxDIhIEDtOep9Lxe896nk3IV0Ug5/Bp3A5CKLT5
	jn5V1UIWBjnDdwC7Rm70wGQd829fMTa5VFW1rrIc+sSBY9dssue28/hD2cxWDFktRqjczU5iVdPNY
	WaB+doeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZVi-0000000Dxek-3WVc;
	Tue, 17 Dec 2024 15:29:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZGz-0000000DuWM-3iZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 747BEA4192F;
	Tue, 17 Dec 2024 15:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04290C4CED3;
	Tue, 17 Dec 2024 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734448447;
	bh=Qpdg/3uNo56RDMPdNnLA2ilJVAUDi/+rZ7z3fY9T0KQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVWolua/pSI8gyo6SMN9UC0Vh2Z2MG7SKiP6r696TfG11xLzf53P9FMlWRYlVJBeY
	 AWk0e0Q6XPM9nEjtBBNDHiagSGHTmnBVTumFJ/h7mpYnuK6OSDClIjWKG7VdP3Ah0Y
	 zuuiKXk7q1KLVcwF4hVFEEo9e7/bFoXSgR6FpGX6Y6FEZHWdrqjWkxO8pyWF2h013m
	 R+lIgo7XT1RHYcCVFtZDSXE+Fu5ASaj+xJ/EWI79v19X00mBsxE7rzR/oSqqUmcWij
	 n+/w5+anQLWzXC179NIEHd7s57sa/zHHnzplO2l70mxjGPBpKpaSnhMqV4f1V+igxR
	 eLrPuHhv/Q/4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNZGv-004bWV-AR;
	Tue, 17 Dec 2024 15:14:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 14/16] KVM: arm64: nv: Propagate used_lrs between L1 and L0 contexts
Date: Tue, 17 Dec 2024 15:13:29 +0000
Message-Id: <20241217151331.934077-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217151331.934077-1-maz@kernel.org>
References: <20241217151331.934077-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eauger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_071410_124040_39CA2A4F 
X-CRM114-Status: GOOD (  14.09  )
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

We have so far made sure that L1 and L0 vgic contexts were
totally independent. There is however one spot of bother with
this approach, and that's in the GICv3 emulation code required by
our fruity friends.

The issue is that the emulation code needs to know how many LRs
are in flight. And while it is easy to reach the L0 version through
the vcpu pointer, doing so for the L1 is much more complicated,
as these structures are private to the nested code.

We could simply expose that structure and pick one or the other
depending on the context, but this seems extra complexity for not
much benefit.

Instead, just propagate the number of used LRs from the nested code
into the L0 context, and be done with it. Should this become a burden,
it can be easily rectified.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index fba499a20aec8..b81bfa85ebb19 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -323,6 +323,12 @@ void vgic_v3_load_nested(struct kvm_vcpu *vcpu)
 	__vgic_v3_activate_traps(cpu_if);
 
 	__vgic_v3_restore_state(cpu_if);
+
+	/*
+	 * Propagate the number of used LRs for the benefit of the HYP
+	 * GICv3 emulation code. Yes, this is a pretty sorry hack.
+	 */
+	vcpu->arch.vgic_cpu.vgic_v3.used_lrs = cpu_if->used_lrs;
 }
 
 void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
@@ -358,6 +364,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 	}
 
 	shadow_if->lr_map = 0;
+	vcpu->arch.vgic_cpu.vgic_v3.used_lrs = 0;
 }
 
 /*
-- 
2.39.2


