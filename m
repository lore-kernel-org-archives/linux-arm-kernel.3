Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE668CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwcOLTiS3FgAs5voG7hlDBUSpfaU9WePAAtQwdnr1Ok=; b=No+BHRn2jdEivgifq4WLi+Bh/o
	QUHex7hu7IxQn4Gm5NNQVbwE0w4dQEhzmJH6uf5YHJAcWQwAEmW0Uu/TkHfhUOZ0BVhfvYJFUB60G
	yBULxUY/0vSzJ2IiKknwwJmt+1E3SZdlota7EOfc1puLz4gSssuCsPT47wMyPfTJHBN0swENJ4RLd
	4qJdWMoJfp6/GRQByUqYvhzmOez6hp0cmz6is+s0b9o2eZPwpGEmheeuBSlxq9JHiCtWnYmiT6LhV
	q0EJXM8o05FMuaEbcpmY+zFsVkzm0o/yIiR7+EGqH5gzc8miE9sTKuVpuh14UFOtLmHu5IQhQt9mj
	c+UZd3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91y-00000004CRY-3qYX;
	Sun, 09 Nov 2025 17:16:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91m-00000004CCJ-2rnb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CFC660051;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7BDC19421;
	Sun,  9 Nov 2025 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708593;
	bh=v01Vg22EJGqDANe+d5iFLhgxo6rRA09Yj1ZORRZolzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MUubn1ZJ+zSf+4NyOFWohrK/U48k0KxuO3ckPFA1E6UeuG/YGGh3l3wtzZAussoQM
	 C1L3lFJMGCnBK0BchXpoLdk/QmOAi3T982NTiJDB8/ohSP/irTaVLRXtng+zYM5Iuw
	 e6VBg6C8l7CUM28RWIrHo0lp24frv4MKHEaSy+V1cZ4+BYp12P5MYa5U8MSLYzpfcS
	 tTc1rPLeGrKkrd/qPzXq/riU7uKwePTv9+R5CYAG8O8foKj8MnGPBq4+oyoQbwuC4V
	 5txj2gAXm9vpIewYJC8YQwnmJte4Bq8rLVkQOb0+J/JoCtzzoeMJvo+tXcZbe95l2E
	 avU8gopj+1RxA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91j-00000003exw-2gnG;
	Sun, 09 Nov 2025 17:16:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 14/45] KVM: arm64: GICv2: Preserve EOIcount on exit
Date: Sun,  9 Nov 2025 17:15:48 +0000
Message-ID: <20251109171619.1507205-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
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

EOIcount is how the virtual CPU interface signals that the guest
is deactivating interrupts outside of the LRs when EOImode==0.

We therefore need to preserve that information so that we can find
out what actually needs deactivating, just like we already do on
GICv3.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 74efacba38d42..5cfbe58983428 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -437,6 +437,12 @@ void vgic_v2_save_state(struct kvm_vcpu *vcpu)
 		return;
 
 	if (used_lrs) {
+		if (vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr & GICH_HCR_LRENPIE) {
+			u32 val = readl_relaxed(base + GICH_HCR);
+
+			vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr &= ~GICH_HCR_EOICOUNT;
+			vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr |= val & GICH_HCR_EOICOUNT;
+		}
 		save_lrs(vcpu, base);
 		writel_relaxed(0, base + GICH_HCR);
 	}
-- 
2.47.3


