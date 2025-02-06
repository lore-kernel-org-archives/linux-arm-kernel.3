Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38725C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=junBISS3Tt6j4kdPS050wNsAUI54JZob33DsbSVLiDw=; b=cWCxOrIMZgqqS3bs4mZYtWuJe4
	9H/iLG5PSrVUGmMDp4hSTlGeSRsL88uuuaGiFo//uZRlKW7V8JR4atlTbV4a56iyKbRti4RQeUynL
	1WUrQ0fYwNsfwsBfFq7grm/I0J+xD+FyP8CpJE05T/9RkeLcEfr5ej6uSn+Y3PM5dXfdsmvZh9Pxv
	p6zmZrV/WCA893ikxEz+yKax4oraPiz86DK+6SCyFLLt273DVRffsZvpOTANJSeE7tNkADTYK3pC6
	AhNwzJKKDHQ+UT7qiXpT6G+YqIo4D9kgRsLJazKUWHSiXjIS1TKfq7hnt0YnvzdZGuhqIz/PmEqrO
	vea10Q3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4RD-00000006nqv-15tB;
	Thu, 06 Feb 2025 16:09:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg48P-00000006kz2-0tcn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 899485C63F9;
	Thu,  6 Feb 2025 15:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA10C4CEEA;
	Thu,  6 Feb 2025 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738856984;
	bh=Za1PNQ3sjrTQ/q3busy2dbutshSkyGMY6U7X8BZk2rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mOOnxG3nup72Q6gGZjimtqvdVUyJzHKD8AgyHMeJrUh3yZbowxgc7X5G2CL2iyky5
	 58JrGNwAv73EcBJd6tltXH03nXoG20Yz8VAHUh00tEoP4MjdS4Fa7m5+GJnVzL2xuL
	 Vz/IyhDfISOtDEDwlFtnayN2DqPuZK5FcB8nAPVkT0rlUN6n1zbe6+sqSNEBR5TmKE
	 gHOJxZld2txz8Miry8RoehoTvT+QWZkcZ1Q1fS/tZZHYDu3S0oeTBagMxcn5OnQ398
	 BdE1GKNbUcysLZfIznedOrWxQdM6cYSU7UE+NU+A0a4XN7oIgJsnQTcn810vX/P8ZR
	 zovZXYkJBba/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg48M-001BOX-92;
	Thu, 06 Feb 2025 15:49:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 13/16] KVM: arm64: nv: Propagate used_lrs between L1 and L0 contexts
Date: Thu,  6 Feb 2025 15:49:22 +0000
Message-Id: <20250206154925.1109065-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206154925.1109065-1-maz@kernel.org>
References: <20250206154925.1109065-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_074945_332920_F043824B 
X-CRM114-Status: GOOD (  14.42  )
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
index e72be14d99d55..643bd8a8e0669 100644
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


