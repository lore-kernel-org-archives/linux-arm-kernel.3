Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1D7C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQKyNwSgEBS1FdQPCr0BFf1gJZ2ngUj/l5kLW14oFV0=; b=00oiUpAvgWWK+EYfYNNupuvy6K
	nE08gFj1fItNgF6zR1FNmLKgp0/nPbcBjM1SSR5y4Lx8EVMfbE155Ss+IbOSQT6j+6QyiLVOf7ngS
	MMLBFJ1sYQsexQOUJOjVHDzotM5icoOS04XL0XckI8KW9gJPdNNXqo+khrP2x9Ie6KHsWeyo5RzpY
	n16BV8n5+eQcqvtldo8WLS9xVFXN9neecTVhnaWuJFbmd6JX6MKghpyl0XwLpDcHoAw8S5/X2CPK2
	21raFQgUpL5gC/+XWungNV3KmG/YYD/L98bDOiIE9XydmclwlszDwbjTfXQIoEadcmKX0oInRjrkH
	Lg8+Y/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY5W-00000003dxb-2CTR;
	Wed, 05 Aug 2026 09:39:02 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY5U-00000003dwA-0UJG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:39:01 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785922735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQKyNwSgEBS1FdQPCr0BFf1gJZ2ngUj/l5kLW14oFV0=;
	b=XSd/mzkQQdJGkHoN7Z37EQc8KlR+Bm3kkIGiiyx1VrQ3/P/xPt2409QuZZt37dZWQkGSnh
	09YUxF4ay+gMmOyBWfcYtZaykjNlwbiT9YHz6BZVURE9Yxj9yMJVlhUihAdGiVrYVquQmW
	X7C6sgB8nl//JT6bvcSppeLE3hA/GdE=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] KVM: arm64: vgic: Don't leak the SPI array when init is retried
Date: Wed,  5 Aug 2026 10:38:27 +0100
Message-Id: <20260805093828.3626610-3-fuad.tabba@linux.dev>
In-Reply-To: <20260805093828.3626610-1-fuad.tabba@linux.dev>
References: <20260805093828.3626610-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_023900_338631_BAD8F1C0 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

Nothing latches a failed vgic_init(), so userspace can retry
KVM_DEV_ARM_VGIC_CTRL_INIT after a failure past kvm_vgic_dist_init().
kvm_vgic_setup_default_irq_routing() is the reachable case, running on
every configuration. Each retry overwrites dist->spis and only the last
allocation is freed at teardown, leaking up to 960 struct vgic_irq,
about 90KB, per attempt.

Return early when the array is already allocated, as
vgic_allocate_private_irqs_locked() and vgic_v4_init() do.

Fixes: ad275b8bb1e65 ("KVM: arm/arm64: vgic-new: vgic_init: implement vgic_init")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 907057881b26a..d4cf143f3ae6b 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -210,6 +210,9 @@ static int kvm_vgic_dist_init(struct kvm *kvm, unsigned int nr_spis)
 	struct kvm_vcpu *vcpu0 = kvm_get_vcpu(kvm, 0);
 	int i;
 
+	if (dist->spis)
+		return 0;
+
 	dist->active_spis = (atomic_t)ATOMIC_INIT(0);
 	dist->spis = kzalloc_objs(struct vgic_irq, nr_spis, GFP_KERNEL_ACCOUNT);
 	if (!dist->spis)
-- 
2.39.5


