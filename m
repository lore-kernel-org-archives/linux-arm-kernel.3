Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E0AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=junBISS3Tt6j4kdPS050wNsAUI54JZob33DsbSVLiDw=; b=dNGbYCb3nQm+UCHocWQ431FIGe
	vrnJumkLYwqnWWtTRZPisF7ExjjHPrXahVTVWg7vu0sVHuo9bbe47tlDUn3UOA/1zJqAvIWqOHNIc
	HaswnPmNt7HyHOKCh/GAHu3aLI37f886mpQ/T9exC7rERuHRubMG6a9IqMZAmqMWdPfvj+FszqSX4
	XzBRJHsLv4WWqh8M7XemODAKQM2VMhrjmle1+HBlSop7rzUgq76wcL4Na8YiEPEx5PLWdfmupniD4
	1A0wpYDhI6DIHG5w+ydnzf+rvXCu4+F+YmjSoMNyubO6A09mOllMm4Z3eHWOTKcwCTGnnVb6hZ1jc
	aHelKDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1jP-00000003AJ2-2Pql;
	Sun, 12 Jan 2025 17:26:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1SJ-000000037iE-43ip
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:08:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DF36A40ACA;
	Sun, 12 Jan 2025 17:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1F6C4CEE3;
	Sun, 12 Jan 2025 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736701733;
	bh=Za1PNQ3sjrTQ/q3busy2dbutshSkyGMY6U7X8BZk2rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=akdndvHbizH1adBJFnbJdsv7SBE1JvpGTD/nHYN03vIf1KuhNHOVqxeYqUWdDxsBM
	 nRg23H+Pk7egt2x/v8qb3qOTtA2/q+CC2L9PZxQgwY1IobgsEfAj3zCkgQ7uuAecz0
	 UDaZa/kPJRW+Alb6wnWE7hTy4xoJbBMMrGGlHgnOuFJnilR0AGBQat1ISRrI4qUzGk
	 rBbiPGF3MxKdKCNmb1EN0lgZ4w/93pGgZvYIWy6oF+ddyuDsiMzaSORfbKIDmexm2/
	 Hpt8l6VUqpOQpQgqwGpMcj2egzBT79qWPQxY5lVCohr0h2Q95zp5XsYwnKxPIz4g5e
	 hJgBmgxcCZjjg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1SF-00BNxR-VH;
	Sun, 12 Jan 2025 17:08:52 +0000
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
Subject: [PATCH v2 14/17] KVM: arm64: nv: Propagate used_lrs between L1 and L0 contexts
Date: Sun, 12 Jan 2025 17:08:42 +0000
Message-Id: <20250112170845.1181891-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112170845.1181891-1-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090856_107006_EBFC6A0F 
X-CRM114-Status: GOOD (  14.68  )
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


