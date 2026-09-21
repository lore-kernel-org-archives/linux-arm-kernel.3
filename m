Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C08C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InD//8wX1Jbm+phmbGpHqC8yJX438VvAtgqa4meSBR8=; b=pF87zJLS/Dp6LIklbEM8DK0DXr
	0jLz9kF10zMZA8+buIshi8/qhDHPezBKYYbtUvyfU+NtHRIrHHe9Hp2xahHP3ERIuolfWNh/COXpx
	KPS1K0mlzQBy1aQr/6XVLHOUIYdgNHw7leVeit971QeQj9v86yELdjZLpIfgJJrQP76OUrcbPeHL/
	9jiFlbbcGzD6anBEyD/YFk5dxjNxrzp8bVXTlHA8lHzpJB6DNYxVCgsSdXMOsTfeTtcwvX1g9ce9U
	qLsxpoum7GgCdcs7UesvpKsDB0ePjw4uqc7EITqvOeoE8qtOX2lMfjw88MDnfz5QXlHuKFjEBaA6K
	nCiNp0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YTr-00000001DWE-0jKr;
	Mon, 21 Sep 2026 07:30:27 +0000
Received: from out-120.mta0.migadu.com ([2001:41d0:1004:224b::78] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YTl-00000001DST-1rwY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:30:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=y65DU0zqn/mUcvtSk0T3Mz/Mz/7Zq8kcpJPr4FrcEdE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789975819; v=1; x=1790580619;
 b=bgRIeKeS4n1ul2c9W0BP3vcQyVxJKHMzCN+OBdnOQI1gmBFQTCueEqh9RNISFP9pFzCnPNeD
 S3zigjAXYZZrZQdR0Vrohlx/NT1KnndvO7iiN/8KDP/ddLGfivPjtxWLt3bViTJoKEi1mNbXmdi
 J3PFU6GR6TkiT2hhl/ECJRQQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id be837298a217f5ce;
	Mon, 21 Sep 2026 07:30:11 +0000
X-Mizu-Trace-ID: be837298a217f5ce
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] KVM: arm64: vgic: Tear down what vgic_init() created when it fails
Date: Mon, 21 Sep 2026 08:29:57 +0100
Message-Id: <20260921072958.2918477-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921072958.2918477-1-fuad.tabba@linux.dev>
References: <20260921072958.2918477-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_003021_647177_41E90CBD 
X-CRM114-Status: GOOD (  12.52  )
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

Once kvm_vgic_dist_init() has succeeded, every later failure in
vgic_init() returns with the SPI array still allocated. A failure after
vgic_v4_init() has also succeeded, which means only
kvm_vgic_setup_default_irq_routing(), leaves the vPE array behind as
well.

A failed vgic_init() leaves kvm_arch_vcpu_precreate() admitting new
vCPUs, so a retry of KVM_DEV_ARM_VGIC_CTRL_INIT reaches
vgic_v4_init()'s early return with an array that no longer covers every
vCPU, and vgic_v3_load()'s WARN_ON(vgic_v4_load()) fires on the first
one it misses.

Release each on the paths that can reach it, so the ioctl is all or
nothing and a retry starts from scratch. vgic_v4_init() unwinds its own
state on every error return, so its failure leaves only the SPI array
to free. dist->nr_spis stays frozen, since the SPI count cannot change
once vgic_init() has supplied it.

Fixes: 180ae7b11823 ("KVM: arm/arm64: Enable irqchip routing")
Fixes: 74fe55dc9ab7 ("KVM: arm/arm64: GICv4: Add init/teardown of the per-VM vPE irq domain")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260807105558.73D701F000E9@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-init.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 1537f4d20318e..67d1e8ce2aa2f 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -513,7 +513,7 @@ int vgic_init(struct kvm *kvm)
 		if (vgic_supports_direct_irqs(kvm)) {
 			ret = vgic_v4_init(kvm);
 			if (ret)
-				return ret;
+				goto out_free_spis;
 		}
 	} else {
 		if (!dist->nr_spis)
@@ -528,17 +528,24 @@ int vgic_init(struct kvm *kvm)
 		kvm_vgic_vcpu_reset(vcpu);
 
 	ret = kvm_vgic_setup_default_irq_routing(kvm);
-	if (ret) {
-		if (vgic_is_v5(kvm))
-			vgic_v5_teardown(kvm);
-
-		return ret;
-	}
+	if (ret)
+		goto out_teardown;
 
 	vgic_debug_init(kvm);
 	dist->initialized = true;
 
 	return 0;
+
+out_teardown:
+	if (vgic_is_v5(kvm))
+		vgic_v5_teardown(kvm);
+	else
+		vgic_v4_teardown(kvm);
+out_free_spis:
+	kfree(dist->spis);
+	dist->spis = NULL;
+
+	return ret;
 }
 
 static void kvm_vgic_dist_destroy(struct kvm *kvm)
-- 
2.39.5


