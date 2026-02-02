Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8195E73146
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLZMuDSaLum3lZeNGFbi2PdhCi3/HMn1WnF6o814fEI=; b=DeqNfJM4GXLDWoAD8nMP3wXFW4
	vLIO1zm+mJWzWMpkAcaK/ddYZ4fk7IOfmBNE9AYkZRg40yR27t2XdBqZYoKtbnD95sPQtaG+aKwHt
	Qkor22DWOJ8HznZjYqA37Kl7JpmVHZE9gRfOe4LAKoAPx7ZVrBhps0k9n3qW3hf6d2Ocon0+HqWso
	eNXb7Qi3t1o7sEcPkaTaXOTViOcbZ6EicdSDTEW6Jw0FKje8a9ouU/L3XDKS9jyAVwp4yNvPeYuwu
	DHXYPeeIS8+W96E9jWDes/6Gem3Efed+cW/yvJ2bS5FvmzpzS97Zr0k+RwCc2Nvp3vOxp84sJg9F4
	k0c204Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkQ-00000004fkC-281n;
	Mon, 02 Feb 2026 08:57:30 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpkM-00000004fhd-1tPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:57:27 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477c49f273fso41327665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 00:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770022644; x=1770627444; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLZMuDSaLum3lZeNGFbi2PdhCi3/HMn1WnF6o814fEI=;
        b=DGma2nTNK98KTxmNYpTdGHjnJBHfjy7bcwzJ5oKKip1wCZG8Mc49RggfYaHfOmadMe
         hiTJjYF2k/1wYJpSZ+ZpB0bJtMk/sGZE+VvUgrEnH+0RFUPAXyhBq7VEs1SCx0BN084k
         RBwJMu7olrv5jrPEeiuKOZrbKgXueZ9cYR8o7KQggIz94Wujywb2uPZHlFvsQKl7VzR4
         S598Z/O0+f2oXdjIe2r/1hmnf5pHgNGqwSWVmP6N59yA6rOXYx4Ceg6BoOrexJN4Gh+J
         ZQ7NkBZ0+cz8rbpEpHHohqyX8dYaaLQHr5sMcDZ3tuTXkjm+KmtySAqOWq8lgTCliDEb
         iYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770022644; x=1770627444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLZMuDSaLum3lZeNGFbi2PdhCi3/HMn1WnF6o814fEI=;
        b=fX3FLeKAr6tcRnHvJ5w79a5K4UjAbmt1R4uW0Xq0+YNs5F0Bf5cc9zScLdA6uBx6IB
         Qkp6TnrgydCSr5xXb8B0HeZCxSV8+UMHB5Qs9h2evs6N8R8UpZHWggdd+cE6hOTv1us/
         z2gTTIe5kL5rseyqoKn8e88V8hC6KI5ezQ6ww7b2XlnQgGte7Di1wNEBKHc+ixTDEX0Q
         HxLhFMpK+7geTiXTfUOQqymS9XPlWz78xj4AlnorEuh+YSy9szFVL9bTMU8KKfhkCNvw
         2JmOCMvFy5oY+SUG4WLB34JLLo4+sq7e6R+I2XH2wUoVuicufXWJhNfZVjzUx82hQ+hw
         L+2A==
X-Forwarded-Encrypted: i=1; AJvYcCVffAYeOQDlYZYB5eKmOLYiryPnjhGMZAjfN0Hu/yN3QrytvFfkwqgSVt6uvflv3MOnAVvJFRay9DRVxUxonDiN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy35HDYiDw5ztgWhyT7YRpRpzXBHOj2GbFAtCmQIi8soDlhYYtF
	YkEQyt61zMk9Rey3Sm9SCT2MT1e/S4OhkMyYvhmsEQbYtGRoh7Hz/M01t9f8NWHgzVTNW/oU5h7
	aaw==
X-Received: from wmi9.prod.google.com ([2002:a05:600c:209:b0:480:4a03:7b77])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8716:b0:47e:d943:ec08
 with SMTP id 5b1f17b1804b1-482db4919a6mr128609935e9.28.1770022644456; Mon, 02
 Feb 2026 00:57:24 -0800 (PST)
Date: Mon,  2 Feb 2026 08:57:20 +0000
In-Reply-To: <20260202085721.3954942-1-tabba@google.com>
Mime-Version: 1.0
References: <20260202085721.3954942-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260202085721.3954942-3-tabba@google.com>
Subject: [PATCH v1 2/3] KVM: arm64: Reimplement vgic-debug XArray iteration
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_005726_517880_13BB4489 
X-CRM114-Status: GOOD (  21.34  )
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

The vgic-debug interface implementation uses XArray marks
(`LPI_XA_MARK_DEBUG_ITER`) to "snapshot" LPIs at the start of iteration.
This modifies global state for a read-only operation and complicates
reference counting, leading to leaks if iteration is aborted or fails.

Reimplement the iterator to use dynamic iteration logic:

- Remove `lpi_idx` from `struct vgic_state_iter`.
- Replace the XArray marking mechanism with dynamic iteration using
  `xa_find_after(..., XA_PRESENT)`.
- Wrap XArray traversals in `rcu_read_lock()`/`rcu_read_unlock()` to
  ensure safety against concurrent modifications (e.g., LPI unmapping).
- Handle potential races where an LPI is removed during iteration by
  gracefully skipping it in `show()`, rather than warning.
- Remove the unused `LPI_XA_MARK_DEBUG_ITER` definition.

This simplifies the lifecycle management of the iterator and prevents
resource leaks associated with the marking mechanism, and paves the way
for using a standard seq_file iterator.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/vgic/vgic-debug.c | 68 ++++++++++----------------------
 include/kvm/arm_vgic.h           |  1 -
 2 files changed, 20 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-debug.c b/arch/arm64/kvm/vgic/vgic-debug.c
index bb92853d1fd3..ec3d0c1fe703 100644
--- a/arch/arm64/kvm/vgic/vgic-debug.c
+++ b/arch/arm64/kvm/vgic/vgic-debug.c
@@ -25,11 +25,9 @@
 struct vgic_state_iter {
 	int nr_cpus;
 	int nr_spis;
-	int nr_lpis;
 	int dist_id;
 	int vcpu_id;
 	unsigned long intid;
-	int lpi_idx;
 };
 
 static void iter_next(struct kvm *kvm, struct vgic_state_iter *iter)
@@ -45,13 +43,15 @@ static void iter_next(struct kvm *kvm, struct vgic_state_iter *iter)
 	 * Let the xarray drive the iterator after the last SPI, as the iterator
 	 * has exhausted the sequentially-allocated INTID space.
 	 */
-	if (iter->intid >= (iter->nr_spis + VGIC_NR_PRIVATE_IRQS - 1) &&
-	    iter->nr_lpis) {
-		if (iter->lpi_idx < iter->nr_lpis)
-			xa_find_after(&dist->lpi_xa, &iter->intid,
-				      VGIC_LPI_MAX_INTID,
-				      LPI_XA_MARK_DEBUG_ITER);
-		iter->lpi_idx++;
+	if (iter->intid >= (iter->nr_spis + VGIC_NR_PRIVATE_IRQS - 1)) {
+		if (iter->intid == VGIC_LPI_MAX_INTID + 1)
+			return;
+
+		rcu_read_lock();
+		if (!xa_find_after(&dist->lpi_xa, &iter->intid,
+				   VGIC_LPI_MAX_INTID, XA_PRESENT))
+			iter->intid = VGIC_LPI_MAX_INTID + 1;
+		rcu_read_unlock();
 		return;
 	}
 
@@ -61,44 +61,21 @@ static void iter_next(struct kvm *kvm, struct vgic_state_iter *iter)
 		iter->intid = 0;
 }
 
-static int iter_mark_lpis(struct kvm *kvm)
+static int vgic_count_lpis(struct kvm *kvm)
 {
 	struct vgic_dist *dist = &kvm->arch.vgic;
-	unsigned long intid, flags;
 	struct vgic_irq *irq;
+	unsigned long intid;
 	int nr_lpis = 0;
 
-	xa_lock_irqsave(&dist->lpi_xa, flags);
-
-	xa_for_each(&dist->lpi_xa, intid, irq) {
-		if (!vgic_try_get_irq_ref(irq))
-			continue;
-
-		__xa_set_mark(&dist->lpi_xa, intid, LPI_XA_MARK_DEBUG_ITER);
+	rcu_read_lock();
+	xa_for_each(&dist->lpi_xa, intid, irq)
 		nr_lpis++;
-	}
-
-	xa_unlock_irqrestore(&dist->lpi_xa, flags);
+	rcu_read_unlock();
 
 	return nr_lpis;
 }
 
-static void iter_unmark_lpis(struct kvm *kvm)
-{
-	struct vgic_dist *dist = &kvm->arch.vgic;
-	unsigned long intid, flags;
-	struct vgic_irq *irq;
-
-	xa_for_each_marked(&dist->lpi_xa, intid, irq, LPI_XA_MARK_DEBUG_ITER) {
-		xa_lock_irqsave(&dist->lpi_xa, flags);
-		__xa_clear_mark(&dist->lpi_xa, intid, LPI_XA_MARK_DEBUG_ITER);
-		xa_unlock_irqrestore(&dist->lpi_xa, flags);
-
-		/* vgic_put_irq() expects to be called outside of the xa_lock */
-		vgic_put_irq(kvm, irq);
-	}
-}
-
 static void iter_init(struct kvm *kvm, struct vgic_state_iter *iter,
 		      loff_t pos)
 {
@@ -108,8 +85,6 @@ static void iter_init(struct kvm *kvm, struct vgic_state_iter *iter,
 
 	iter->nr_cpus = nr_cpus;
 	iter->nr_spis = kvm->arch.vgic.nr_spis;
-	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
-		iter->nr_lpis = iter_mark_lpis(kvm);
 
 	/* Fast forward to the right position if needed */
 	while (pos--)
@@ -121,7 +96,7 @@ static bool end_of_vgic(struct vgic_state_iter *iter)
 	return iter->dist_id > 0 &&
 		iter->vcpu_id == iter->nr_cpus &&
 		iter->intid >= (iter->nr_spis + VGIC_NR_PRIVATE_IRQS) &&
-		(!iter->nr_lpis || iter->lpi_idx > iter->nr_lpis);
+		iter->intid > VGIC_LPI_MAX_INTID;
 }
 
 static void *vgic_debug_start(struct seq_file *s, loff_t *pos)
@@ -178,7 +153,6 @@ static void vgic_debug_stop(struct seq_file *s, void *v)
 
 	mutex_lock(&kvm->arch.config_lock);
 	iter = kvm->arch.vgic.iter;
-	iter_unmark_lpis(kvm);
 	kfree(iter);
 	kvm->arch.vgic.iter = NULL;
 	mutex_unlock(&kvm->arch.config_lock);
@@ -188,13 +162,14 @@ static void print_dist_state(struct seq_file *s, struct vgic_dist *dist,
 			     struct vgic_state_iter *iter)
 {
 	bool v3 = dist->vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3;
+	struct kvm *kvm = s->private;
 
 	seq_printf(s, "Distributor\n");
 	seq_printf(s, "===========\n");
 	seq_printf(s, "vgic_model:\t%s\n", v3 ? "GICv3" : "GICv2");
 	seq_printf(s, "nr_spis:\t%d\n", dist->nr_spis);
 	if (v3)
-		seq_printf(s, "nr_lpis:\t%d\n", iter->nr_lpis);
+		seq_printf(s, "nr_lpis:\t%d\n", vgic_count_lpis(kvm));
 	seq_printf(s, "enabled:\t%d\n", dist->enabled);
 	seq_printf(s, "\n");
 
@@ -291,16 +266,13 @@ static int vgic_debug_show(struct seq_file *s, void *v)
 	if (iter->vcpu_id < iter->nr_cpus)
 		vcpu = kvm_get_vcpu(kvm, iter->vcpu_id);
 
-	/*
-	 * Expect this to succeed, as iter_mark_lpis() takes a reference on
-	 * every LPI to be visited.
-	 */
 	if (iter->intid < VGIC_NR_PRIVATE_IRQS)
 		irq = vgic_get_vcpu_irq(vcpu, iter->intid);
 	else
 		irq = vgic_get_irq(kvm, iter->intid);
-	if (WARN_ON_ONCE(!irq))
-		return -EINVAL;
+
+	if (!irq)
+		return 0;
 
 	raw_spin_lock_irqsave(&irq->irq_lock, flags);
 	print_irq_state(s, irq, vcpu);
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index b261fb3968d0..d32fafbd2907 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -300,7 +300,6 @@ struct vgic_dist {
 	 */
 	u64			propbaser;
 
-#define LPI_XA_MARK_DEBUG_ITER	XA_MARK_0
 	struct xarray		lpi_xa;
 
 	/* used by vgic-debug */
-- 
2.53.0.rc1.225.gd81095ad13-goog


