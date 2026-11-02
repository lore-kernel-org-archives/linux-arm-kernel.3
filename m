Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A860850A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RXntKPmL;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jz5k6nBm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3ygiqX61PrFH9HwNeh9XfilPxDP9qCP4o+ydEiPw9Bk=; b=RXntKPmLSaYAO6
	pY6t8OigXPFheQyqJLxtfojM8cXv/UKCaav0S31lwLW85XrGGaydtLWBd67D4b2r7uPex0IzhpHuc
	6Id9FpIqABdBnWiGPZoxdAQofy4a6gNVxzKph3YiQVDt4r3YH7AFs41+JmLqhh7wW3YwsuXazc8Vp
	VCXAT/ltBrGEm6SjtLT7tNL6hvr9+iC9H5zzoL3+zzXjFyRiyzjYtkrELmzC4iOJiJMPJucbIdJM9
	a3/7EoOYEcG21uAMHCUHrCqpsna0UlEIcW1HegaRGWru3eOxjXn3HbRsiHKE+HpCZIGEaJlQt4GcW
	m0zui6Q9Tjr0zAUibPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxu-000000008Ne-21xV;
	Mon, 02 Nov 2026 19:45:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxxs-000000008M8-2DmV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:45:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF3A3175D;
	Mon,  2 Nov 2026 11:45:04 -0800 (PST)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21A643F673;
	Mon,  2 Nov 2026 11:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793648707; bh=ZuYr6qVTm1wwSQygOFIq7lWk/77FuQwOyMFBHE73dr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jz5k6nBm/Xaq84x/5pG9Jfi3QGvXwl4d+Y5Xadru0YNR8EzOD8+0iUUG708It8KxS
	 wsm0+/5Xv39qyMuk+f2ec0y0lFI6LSwJrnU/m/nRaNiEOu/Xb4doLl/XXXav2RI1rP
	 puR2xt/SkYk/AdDo5gJ3f7XHc4PlOf7HzZtiXvDI=
From: Sascha Bischoff <sascha.bischoff@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	peter.maydell@linaro.org,
	lpieralisi@kernel.org,
	timothy.hayes@arm.com,
	fuad.tabba@linux.dev
Subject: [PATCH v2 01/16] KVM: arm64: vgic: Split out common LPI allocation
Date: Mon,  2 Nov 2026 19:44:39 +0000
Message-Id: <20261102194454.4086911-2-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102194454.4086911-1-sascha.bischoff@arm.com>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_114508_663249_AC687182 
X-CRM114-Status: GOOD (  25.03  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GICv3 ITS code currently owns vgic_add_lpi(), even though the
first half of the helper is not ITS specific. It allocates or finds
the VM-wide vgic_irq object in lpi_xa and initialises the common LPI
state before the GICv3 ITS code reads the property table and pending
state.

GICv5 needs to reuse the same LPI object lifetime and refcounting, but
without reading the GICv3 property table. Move the allocation and
xarray insertion path into vgic_alloc_lpi() in vgic.c. Both
vgic_add_lpi() and the GICv3 ITS wrapper perform an initial lookup,
then call this helper on a miss. The ITS wrapper continues to load the
property and pending state, while GICv5 can use the common allocator
without GICv3 setup.

Keeping the lookup outside vgic_alloc_lpi() preserves GICv3 behaviour
when another caller inserts the LPI during allocation: the ITS wrapper
still performs its setup on the returned LPI. A second lookup inside
the allocator could instead treat it as already initialised and skip
that setup.

Initialise LPIs as Group 1 before publishing them in lpi_xa. GICv3
LPIs are Group 1, and another vCPU can find a new LPI as soon as it is
published. GICv5 does not use the group field.

This preserves the intended GICv3 behaviour while making the common
LPI storage usable by other VGIC users.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 75 ++++---------------------------
 arch/arm64/kvm/vgic/vgic.c     | 82 ++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic.h     |  4 ++
 3 files changed, 95 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 7e9b265b1f521..34c1c89bfbfe1 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -66,76 +66,19 @@ static int update_lpi_config(struct kvm *kvm, struct vgic_irq *irq,
 		__ret;							\
 	})
 
-/*
- * Creates a new (reference to a) struct vgic_irq for a given LPI.
- * If this LPI is already mapped on another ITS, we increase its refcount
- * and return a pointer to the existing structure.
- * If this is a "new" LPI, we allocate and initialize a new struct vgic_irq.
- * This function returns a pointer to the _unlocked_ structure.
- */
-static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
-				     struct kvm_vcpu *vcpu)
+static struct vgic_irq *vgic_its_add_lpi(struct kvm *kvm, u32 intid,
+					 struct kvm_vcpu *vcpu)
 {
-	struct vgic_dist *dist = &kvm->arch.vgic;
-	struct vgic_irq *irq = vgic_get_irq(kvm, intid), *oldirq;
-	unsigned long flags;
+	struct vgic_irq *irq;
 	int ret;
 
-	/* In this case there is no put, since we keep the reference. */
+	irq = vgic_get_irq(kvm, intid);
 	if (irq)
 		return irq;
 
-	irq = kzalloc_obj(struct vgic_irq, GFP_KERNEL_ACCOUNT);
-	if (!irq)
-		return ERR_PTR(-ENOMEM);
-
-	ret = xa_reserve_irq(&dist->lpi_xa, intid, GFP_KERNEL_ACCOUNT);
-	if (ret) {
-		kfree(irq);
-		return ERR_PTR(ret);
-	}
-
-	INIT_LIST_HEAD(&irq->ap_list);
-	raw_spin_lock_init(&irq->irq_lock);
-
-	irq->config = VGIC_CONFIG_EDGE;
-	refcount_set(&irq->refcount, 1);
-	irq->intid = intid;
-	irq->target_vcpu = vcpu;
-	irq->group = 1;
-
-	xa_lock_irqsave(&dist->lpi_xa, flags);
-
-	/*
-	 * There could be a race with another vgic_add_lpi(), so we need to
-	 * check that we don't add a second list entry with the same LPI.
-	 */
-	oldirq = xa_load(&dist->lpi_xa, intid);
-	if (vgic_try_get_irq_ref(oldirq)) {
-		/* Someone was faster with adding this LPI, lets use that. */
-		kfree(irq);
-		irq = oldirq;
-	} else {
-		/*
-		 * The entry is either empty or contains a dead LPI (refcount=0)
-		 * from the deferred release path, pending cleanup by
-		 * vgic_release_deleted_lpis(). Evict and free it if present.
-		 */
-		oldirq = __xa_store(&dist->lpi_xa, intid, irq,
-				    GFP_NOWAIT | __GFP_ACCOUNT);
-		ret = xa_err(oldirq);
-		if (ret) {
-			xa_unlock_irqrestore(&dist->lpi_xa, flags);
-			kfree(irq);
-
-			return ERR_PTR(ret);
-		}
-
-		if (oldirq && !WARN_ON_ONCE(refcount_read(&oldirq->refcount)))
-			kfree_rcu(oldirq, rcu);
-	}
-
-	xa_unlock_irqrestore(&dist->lpi_xa, flags);
+	irq = vgic_alloc_lpi(kvm, intid, vcpu);
+	if (IS_ERR(irq))
+		return irq;
 
 	/*
 	 * We "cache" the configuration table entries in our struct vgic_irq's.
@@ -1133,7 +1076,7 @@ static int vgic_its_cmd_handle_mapi(struct kvm *kvm, struct vgic_its *its,
 	if (its_is_collection_mapped(collection))
 		vcpu = collection_to_vcpu(kvm, collection);
 
-	irq = vgic_add_lpi(kvm, lpi_nr, vcpu);
+	irq = vgic_its_add_lpi(kvm, lpi_nr, vcpu);
 	if (!IS_ERR(irq) && !vgic_its_map_lpi(kvm, ite, irq, vcpu))
 		irq = ERR_PTR(-EEXIST);
 	if (IS_ERR(irq)) {
@@ -2269,7 +2212,7 @@ static int vgic_its_restore_ite(struct vgic_its *its, u32 event_id,
 	if (its_is_collection_mapped(collection))
 		vcpu = kvm_get_vcpu_by_id(kvm, collection->target_addr);
 
-	irq = vgic_add_lpi(kvm, lpi_id, vcpu);
+	irq = vgic_its_add_lpi(kvm, lpi_id, vcpu);
 	if (IS_ERR(irq)) {
 		its_free_ite(kvm, ite);
 		return PTR_ERR(irq);
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index bea848c93a990..d1a1a2cea386e 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -79,6 +79,88 @@ static struct vgic_irq *vgic_get_lpi(struct kvm *kvm, u32 intid)
 	return irq;
 }
 
+/* Allocate an LPI or acquire one inserted by a concurrent caller. */
+struct vgic_irq *vgic_alloc_lpi(struct kvm *kvm, u32 intid,
+				struct kvm_vcpu *vcpu)
+{
+	struct vgic_dist *dist = &kvm->arch.vgic;
+	struct vgic_irq *irq, *oldirq;
+	unsigned long flags;
+	int ret;
+
+	irq = kzalloc_obj(struct vgic_irq, GFP_KERNEL_ACCOUNT);
+	if (!irq)
+		return ERR_PTR(-ENOMEM);
+
+	ret = xa_reserve_irq(&dist->lpi_xa, intid, GFP_KERNEL_ACCOUNT);
+	if (ret) {
+		kfree(irq);
+		return ERR_PTR(ret);
+	}
+
+	INIT_LIST_HEAD(&irq->ap_list);
+	raw_spin_lock_init(&irq->irq_lock);
+
+	irq->config = VGIC_CONFIG_EDGE;
+	refcount_set(&irq->refcount, 1);
+	irq->intid = intid;
+	irq->target_vcpu = vcpu;
+	irq->group = 1;
+
+	xa_lock_irqsave(&dist->lpi_xa, flags);
+
+	/*
+	 * There could be a race with another vgic_add_lpi(), so we need to
+	 * check that we don't add a second list entry with the same LPI.
+	 */
+	oldirq = xa_load(&dist->lpi_xa, intid);
+	if (vgic_try_get_irq_ref(oldirq)) {
+		/* Someone was faster with adding this LPI, lets use that. */
+		kfree(irq);
+		irq = oldirq;
+	} else {
+		/*
+		 * The entry is either empty or contains a dead LPI (refcount=0)
+		 * from the deferred release path, pending cleanup by
+		 * vgic_release_deleted_lpis(). Evict and free it if present.
+		 */
+		oldirq = __xa_store(&dist->lpi_xa, intid, irq,
+				    GFP_NOWAIT | __GFP_ACCOUNT);
+		ret = xa_err(oldirq);
+		if (ret) {
+			xa_unlock_irqrestore(&dist->lpi_xa, flags);
+			kfree(irq);
+
+			return ERR_PTR(ret);
+		}
+
+		if (oldirq && !WARN_ON_ONCE(refcount_read(&oldirq->refcount)))
+			kfree_rcu(oldirq, rcu);
+	}
+
+	xa_unlock_irqrestore(&dist->lpi_xa, flags);
+
+	return irq;
+}
+
+/*
+ * Creates a new (reference to a) struct vgic_irq for a given LPI.
+ * If this LPI already exists, we increase its refcount and return it.
+ * If this is a "new" LPI, we allocate and initialize a new struct vgic_irq.
+ * This function returns a pointer to the _unlocked_ structure.
+ */
+struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
+			      struct kvm_vcpu *vcpu)
+{
+	struct vgic_irq *irq = vgic_get_irq(kvm, intid);
+
+	/* In this case there is no put, since we keep the reference. */
+	if (irq)
+		return irq;
+
+	return vgic_alloc_lpi(kvm, intid, vcpu);
+}
+
 /*
  * This looks up the virtual interrupt ID to get the corresponding
  * struct vgic_irq. It also increases the refcount, so any caller is expected
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 97fc3bdf520e5..8792953057bb7 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -280,6 +280,10 @@ vgic_get_mmio_region(struct kvm_vcpu *vcpu, struct vgic_io_device *iodev,
 		     gpa_t addr, int len);
 struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid);
 struct vgic_irq *vgic_get_vcpu_irq(struct kvm_vcpu *vcpu, u32 intid);
+struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
+			      struct kvm_vcpu *vcpu);
+struct vgic_irq *vgic_alloc_lpi(struct kvm *kvm, u32 intid,
+				struct kvm_vcpu *vcpu);
 void vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq);
 struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq);
 bool vgic_get_phys_line_level(struct vgic_irq *irq);
-- 
2.34.1


