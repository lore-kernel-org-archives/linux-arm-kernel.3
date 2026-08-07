Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1125C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQKyNwSgEBS1FdQPCr0BFf1gJZ2ngUj/l5kLW14oFV0=; b=QQTxsc5xaLrbf1w+diWuzgPRpq
	lK5Vs1HQoKuu1uP2MbsIwOyU+FyVkgP+FvUxAd0gmM6Jbuw3ZjFwZ3i1NI/wQ9+3esr3Ua3CRw7DF
	RAqoE2oYyBt8cwUDEgSIiIS79Bbr5zjqBQC2WhYYMV9UX5o4WD52CsIW8otY4FQYjPD9TLN+Se0np
	tluWAmrnMXKACZMZ1/dGDU1n+RMynkT66CJ1WuOzSaAPkReh7q+xBhkEbS6soaU0Md1d36edbMTOt
	t4clO0FFhgISlQGvPQPLCgoKPxypvr2FJnafTXg+vKrKFWbmUO6+4pTPhscduDP7CjhrnTV3GiBjY
	XrwgCYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI15-00000007hVN-1PUS;
	Fri, 07 Aug 2026 10:41:31 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsI0z-00000007hRM-2gmj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:41:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786099282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQKyNwSgEBS1FdQPCr0BFf1gJZ2ngUj/l5kLW14oFV0=;
	b=Wtq+/WRRi/zWxjokWMWgph4XGTpP8G+/C6SbMsAxCylqKbM1bC3IA/Eeqsia7zfqs2owWV
	wNilawhsI6w/KNzH57TCNK6r0UjGjMehcMgDmNaFgvx7zFuX/Lz4+KKePzwJ7YkkXn7j6J
	YoK1Lk+t4XnPRIz6KWtAbely2w+dXhs=
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
Subject: [PATCH v2 2/4] KVM: arm64: vgic: Don't leak the SPI array when init is retried
Date: Fri,  7 Aug 2026 11:41:00 +0100
Message-Id: <20260807104102.2410744-3-fuad.tabba@linux.dev>
In-Reply-To: <20260807104102.2410744-1-fuad.tabba@linux.dev>
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_034125_814362_95AC5C18 
X-CRM114-Status: UNSURE (   9.38  )
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


