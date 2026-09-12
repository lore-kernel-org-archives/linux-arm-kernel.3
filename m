Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F93FC88E59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeEAQcYq8edHpB4unIjz9Fmm5hDTDyg9JL0bqDTzrr4=; b=Cbq/hzR6iVh9y2J1kQtsoG7n4H
	xDumQssAx7Mkh19gD3WcEepdE9xO2RLxKHFS3k/3pwhJSXHgcMSqSD0QihwjSathxEywySzaYdMhR
	RRNmXy9Ett0+YLs2FsnxDGuYJdt+WYU4z5XgdzaF5kDajYoGrRd04HOwVXrqrTUP0uIam6i7PuSVV
	gUpNnr98gPysbX0xdyFbZQ0Let/imRdgLUabbqYvibqkmMx69RQY4VxfwYOxr7dXDRU1Yp584mFM4
	OoMDhoqrnWDvzmq2oGR3POHqq7TTUFUW3SsOad6IQNxQdShXZ2MpDXqiJDb+zB7gv295Vgp/ZiUBC
	I2ntZpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHo-00000000nYW-2Z49;
	Sat, 12 Sep 2026 10:48:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5LHm-00000000nXs-3nmD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 10:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13CD542E5E;
	Sat, 12 Sep 2026 10:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C1B1F0089C;
	Sat, 12 Sep 2026 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789210122;
	bh=jeEAQcYq8edHpB4unIjz9Fmm5hDTDyg9JL0bqDTzrr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h9JE2u97Nl4LrsEiV1VoVM6cGQcWs8oWcZvj+ui8A3YhwFnywJO80L8TN+JZupXFI
	 bUlu4j+YTE2IG1WiR4jX11o+uiNzeYG48FFGj5hZMI3oKfPcrjyQoSEwi2+PSsVtnC
	 dzztPMwvlUnqcwasxNgc+L133d1RvPu3BvwfZNxtm6HuVhLRGp1X4AsH2gXrml/D9I
	 Y+ydJacDBOXS26hhC99JmmtOixPNpFLbOMEl9uF7Vj+upLk7KjkryTijUztreqUL7l
	 uENNTXNDfJZhgLUzTj91rwtF3PyTyVZz7PDxgmKaSyGOgQ0fa7R/GSxEGi3CERdHvE
	 xlHZt/n5MyaGw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x5LHk-000000084hK-0g5y;
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
Subject: [PATCH 3/4] KVM: arm64: nv: Move full s2_mmu unmap over to kvm_stage2_unmap_all()
Date: Sat, 12 Sep 2026 11:48:33 +0100
Message-ID: <20260912104834.3093878-4-maz@kernel.org>
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

Now that we have kvm_stage2_unmap_all(), use it when getting rid of a
shadow S2 MMU.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index d60f6f69e293d..ebd8d23df0757 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1295,7 +1295,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
-			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
+			kvm_stage2_unmap_all(mmu, may_block);
 	}
 
 	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
@@ -2014,7 +2014,7 @@ void check_nested_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		write_lock(&vcpu->kvm->mmu_lock);
 		if (mmu->pending_unmap) {
-			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), true);
+			kvm_stage2_unmap_all(mmu, true);
 			mmu->pending_unmap = false;
 		}
 		write_unlock(&vcpu->kvm->mmu_lock);
-- 
2.47.3


