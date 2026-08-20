Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF40C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bU5n6dgbSv+cz4ZLskhIbv2MV+MfnJNqIoF0O+PkuAA=; b=jj/vrWIdPzcj4uNHHiY8+wesjW
	rAMnqWyd4bgtGduZBfflNiZWB/RFfYD0AdyM1EFNMyWM3B38F8nMrlhzktSIfNymRriVmbYwhOCQa
	O8scftfJOGuyex7ShX99Oop91r8arMNGCJTmGrXtRt6raOGMIQ2Vt5vwKwWNnQf7YrlMHlEuM47Pl
	7ncflJCvo2ysdtwcPOm7KH1vMSDQt1g8byx06VAxGtxRgnAxQ9sPaqYwsVx8IpafXvIu3dpJSoX5c
	Z+346eIqWIuMrpZKbKscGSldPLyEnNn+ug09D1r41RYFDzxhxnEEz/Rt/0ct3UkZOAN0kkWn3IW7n
	8MDIHcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Ep-0000000BZnE-158M;
	Thu, 20 Aug 2026 12:51:19 +0000
Received: from out-127.mta0.migadu.com ([2001:41d0:1004:224b::7f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Ec-0000000BZib-245u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:51:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+OVYGds3T77EelMLOPm4dGH+mQ9alxNzuYkC0tWP/eU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787230264; v=1; x=1787835064;
 b=PvK+pHJI8clCwWkypiKruyzbDI2xkP/naswqdUzblHXWTHix22MphV6DghqE2UcirHC8023B
 2jZG00d/PPKaPxNfRNGXj8jkkeEeYdRJdozQ2WmSOUF/CxWX7Oz1obH4IRw+QldsDkcq/9dp4uZ
 aSB6SEP+vf2Cn0r6Fuw2hvSs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id f82f72450b457568;
	Thu, 20 Aug 2026 12:51:04 +0000
X-Mizu-Trace-ID: f82f72450b457568
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
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] KVM: arm64: vgic: Tear down what vgic_init() created when it fails
Date: Thu, 20 Aug 2026 13:50:53 +0100
Message-Id: <20260820125053.2951078-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260820125053.2951078-1-fuad.tabba@linux.dev>
References: <20260820125053.2951078-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_055108_185811_AFB8D96D 
X-CRM114-Status: GOOD (  11.25  )
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
vgic_v4_init() has also succeeded, which today means only
kvm_vgic_setup_default_irq_routing(), leaves the vPE array behind as
well.

A failed vgic_init() leaves kvm_arch_vcpu_precreate() admitting new
vCPUs, so a retry of KVM_DEV_ARM_VGIC_CTRL_INIT reaches
vgic_v4_init()'s early return with an array that no longer covers every
vCPU, and vgic_v3_load()'s WARN_ON(vgic_v4_load()) fires on the first
one it misses.

Release both on the two paths that can reach them, so the ioctl is all
or nothing and a retry starts from scratch. dist->nr_spis stays frozen,
since the SPI count cannot change once vgic_init() has supplied it.

Fixes: 74fe55dc9ab7 ("KVM: arm/arm64: GICv4: Add init/teardown of the per-VM vPE irq domain")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260807105558.73D701F000E9@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-init.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 4012df6002ea6..7493fded53acc 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -462,7 +462,7 @@ int vgic_init(struct kvm *kvm)
 		if (vgic_supports_direct_irqs(kvm)) {
 			ret = vgic_v4_init(kvm);
 			if (ret)
-				return ret;
+				goto out_teardown;
 		}
 	} else {
 		ret = vgic_v5_init(kvm);
@@ -475,12 +475,19 @@ int vgic_init(struct kvm *kvm)
 
 	ret = kvm_vgic_setup_default_irq_routing(kvm);
 	if (ret)
-		return ret;
+		goto out_teardown;
 
 	vgic_debug_init(kvm);
 	dist->initialized = true;
 
 	return 0;
+
+out_teardown:
+	vgic_v4_teardown(kvm);
+	kfree(dist->spis);
+	dist->spis = NULL;
+
+	return ret;
 }
 
 static void kvm_vgic_dist_destroy(struct kvm *kvm)
-- 
2.39.5


