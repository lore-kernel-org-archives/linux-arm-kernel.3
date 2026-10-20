Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=41sXICyc;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vzFWNsmG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi8oSibcZwtyoLuWKyzPA4tpvz247HUgC+oOA7GlrD4=; b=41sXICycVCtGttP2REhalF+oPL
	onwklCfAQSdxQ7XaOJa+kLWYGzqh0nTxUoA8P0FL8kacpXzJjgEKVWQgguQPjWyD/TrRqAwra0Wz0
	eahr+8Ty3jsXv6QpFtws6iWPANkch2n0nVlQQurBWbyQdwjZNtjFfPgd6ZIJHccpwfpKDhfml3vD1
	F+xnLQUNi/GN0v/Ys8A6AlaUqVX0oEHNGalmK00FWvCaX54kN/rAo+88yjZf3190O8mSgh/iUAqss
	o4R2zCBF6z2Wp2byqq1dxaz1FWHANDiwMqW3lIwZECW7yylmMqZvLy/58qKxfH4ulb5E8JOFlkxff
	vZNhvO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCsM-0000000AD2L-1DKK;
	Tue, 20 Oct 2026 16:39:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCsD-0000000ACxp-20IC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:39:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225CC2103;
	Tue, 20 Oct 2026 09:39:33 -0700 (PDT)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0FAD3F7D8;
	Tue, 20 Oct 2026 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792514376; bh=FMTfj2vF1JMjc7DiD/wvEGGwmJATcyNhrtDtTJY35Rk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vzFWNsmGyfqlqYZgBHNykBmswcdj5BNC/SheX2YGkd6385/hb21gKmlvZmWIk+k1w
	 XJXFIx1R5OBJHW7F5BLopTQUe3hERi4bwVnLghR6DCISgjah6peOlmCp/dCXyf87g9
	 Y8BtnUJFp9gjYqmTUFU/lLkMYDJRUdw25qXjfJX8=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Subject: [PATCH v3 1/2] KVM: arm64: vgic: Require matching VGIC and ITS models
Date: Tue, 20 Oct 2026 17:39:22 +0100
Message-Id: <20261020163923.1407856-2-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020163923.1407856-1-sascha.bischoff@arm.com>
References: <20261020163923.1407856-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_093937_597976_B4CD9B90 
X-CRM114-Status: GOOD (  20.06  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a GICv5 host with legacy support, KVM registers both VGICv3 and
VGICv5 devices. Without a model check, a VM can create a GICv3 ITS
alongside an incompatible VGIC, regardless of creation order.

The same problem exists for GICv2 on hosts that support a GICv3 ITS.
KVM used to allow userspace to create both devices in either order,
then ignored the ITS.

Record the VGIC model required by an ITS. Reject an ITS if the VM
already has an incompatible VGIC, and reject a VGIC if an existing
ITS requires a different model. These checks apply on every host:
a GICv2 VGIC and a GICv3 ITS now fail with -ENODEV in either order.
Allow either creation order when the models match.

Have vgic_has_its() require matching VGIC and ITS models, and drop
the separate has_its flag.

As part of this change, swap the type of vgic_model from u32 to enum
kvm_device_type. This requires updating the switch cases in
kvm_vgic_vcpu_init() and kvm_vgic_dist_destroy() to include default
cases, which we mark as unreachable().

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-init.c    | 17 +++++++++++++++++
 arch/arm64/kvm/vgic/vgic-its.c     | 15 ++++++++++++++-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c |  5 +----
 include/kvm/arm_vgic.h             |  5 +++--
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index b5ea1e39c6862..e499cec70e607 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -125,6 +125,11 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
 		goto out_unlock;
 	}
 
+	if (kvm->arch.vgic.its_model && kvm->arch.vgic.its_model != type) {
+		ret = -ENODEV;
+		goto out_unlock;
+	}
+
 	if (kvm_id_regs_final(kvm))
 		goto out_unlock;
 	ret = 0;
@@ -437,6 +442,8 @@ int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu)
 		return ret;
 
 	switch (dist->vgic_model) {
+	case KVM_DEV_TYPE_ARM_VGIC_V2:
+		break;
 	case KVM_DEV_TYPE_ARM_VGIC_V3:
 		/*
 		 * If we are creating a VCPU with a GICv3 we must also register
@@ -455,6 +462,9 @@ int kvm_vgic_vcpu_init(struct kvm_vcpu *vcpu)
 		 */
 		if (vcpu->vcpu_id >= kvm_vgic_global_state.max_gicv5_vcpus)
 			return -EINVAL;
+		break;
+	default:
+		unreachable();
 	}
 
 	return ret;
@@ -554,6 +564,10 @@ static void kvm_vgic_dist_destroy(struct kvm *kvm)
 	dist->nr_spis = 0;
 	dist->vgic_dist_base = VGIC_ADDR_UNDEF;
 
+	/* A VM may be destroyed without ever creating a VGIC. */
+	if (!dist->vgic_model)
+		goto out;
+
 	switch (dist->vgic_model) {
 	case KVM_DEV_TYPE_ARM_VGIC_V2:
 		dist->vgic_cpu_base = VGIC_ADDR_UNDEF;
@@ -571,8 +585,11 @@ static void kvm_vgic_dist_destroy(struct kvm *kvm)
 		kfree(dist->vgic_v5_irs_data);
 		dist->vgic_v5_irs_data = NULL;
 		break;
+	default:
+		unreachable();
 	}
 
+out:
 	xa_destroy(&dist->lpi_xa);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index e5657cb603567..7df5869cff990 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1875,6 +1875,19 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
 
 	mutex_lock(&dev->kvm->arch.config_lock);
 
+	/*
+	 * Reject creation of a GICv3 ITS if:
+	 * - The VM already has a VGIC other than GICv3.
+	 * - An existing ITS requires a VGIC model other than GICv3.
+	 */
+	if ((irqchip_in_kernel(dev->kvm) && !vgic_is_v3(dev->kvm)) ||
+	    (dev->kvm->arch.vgic.its_model &&
+	     dev->kvm->arch.vgic.its_model != KVM_DEV_TYPE_ARM_VGIC_V3)) {
+		mutex_unlock(&dev->kvm->arch.config_lock);
+		kfree(its);
+		return -ENODEV;
+	}
+
 	if (vgic_initialized(dev->kvm)) {
 		ret = vgic_v4_init(dev->kvm);
 		if (ret < 0) {
@@ -1902,7 +1915,7 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
 	xa_init(&its->translation_cache);
 
 	dev->kvm->arch.vgic.msis_require_devid = true;
-	dev->kvm->arch.vgic.has_its = true;
+	dev->kvm->arch.vgic.its_model = KVM_DEV_TYPE_ARM_VGIC_V3;
 	its->enabled = false;
 	its->dev = dev;
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5ab789accc9d4..08f867ebc0df4 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -42,10 +42,7 @@ bool vgic_has_its(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
 
-	if (dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
-		return false;
-
-	return dist->has_its;
+	return dist->its_model && dist->its_model == dist->vgic_model;
 }
 
 bool vgic_supports_direct_msis(struct kvm *kvm)
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 7be81b936bf10..cad74eaff0a7e 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -502,7 +502,9 @@ struct vgic_dist {
 	bool			initialized;
 
 	/* vGIC model the kernel emulates for the guest (GICv2 or GICv3) */
-	u32			vgic_model;
+	enum kvm_device_type	vgic_model;
+	/* VGIC model required by the VM's ITS devices. */
+	enum kvm_device_type	its_model;
 
 	/* Implementation revision as reported in the GICD_IIDR */
 	u32			implementation_rev;
@@ -547,7 +549,6 @@ struct vgic_dist {
 	struct vgic_io_device	dist_iodev;
 	struct vgic_io_device	cpuif_iodev;
 
-	bool			has_its;
 	bool			table_write_in_progress;
 
 	/*
-- 
2.34.1


