Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120ED606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z3TjU5Tn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y5K5R5Xk;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=imU63BJE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fs9LalPG6tctEl9e2f+TtNVQ04mzgeGOHJxPR5QG5SQ=; b=Z3TjU5TnVNUt37
	bQn+dLB1gI8uR9HkAMccsyrYEqLkcRM2148zhdCnuVlkKi/Mkp+YkUYTey0TIV6GteQ0NeQGanHZo
	a42x8WQYOxtUQNxJCPQ6s32H1XRlEhvASYLwGM9Kg94T5bFrhZMhwwsGJszvATo66T2IilXmjjHTb
	doIB/yRISzEE/EQcIOl1uiej8nv3VAb/Mdm9bjnpnhCIvQbe4scnrjUuJfyKa4Q/ba2ZbsohizLZz
	uVdDQ3KhEYBZmjjPjo6fiUevpD5i7h61IWW/BDHjt1zC/q5skI2p2xYBW0GmWYZXlh3tlAEJ4Ildu
	sPPQFUA5yq9/N8veoISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxz9-00000000AZ9-1hXJ;
	Mon, 02 Nov 2026 19:46:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyS-0000000095L-2hmV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 19:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Fs9LalPG6tctEl9e2f+TtNVQ04mzgeGOHJxPR5QG5SQ=; b=Y5K5R5XksB1z1xxC7THuStCvIO
	4YbfV7ei2m3lIJ+LsqF9E7M9MVqUWOnc1oaZa9Xmpo4bzFUhd3ZgpxqOmDzMILICKybl0jWCWper4
	ngFymrsPBJ8KGtPur9atcq6isPUbu7tfGP1DSIIrVZmDOs/tbf5KiBcF/AwdPwkC36ex7GNqIz5Kc
	HQ+oNnUYgOw9dj3gsuOKxwqKVJDbfJurkffGoFkm5KFM0eXok+8s03A4OdGeW3H/iQcm5DA/YFsii
	JTvpty1q6uSWTolSB6DT+yXJpOlAD1dGgTnVH4bALUbz43ivVj+arVbfVc6J40WZ4pX0ZXPeTea7j
	LuV05xNg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyP-000000031IM-2q7X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:45:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB326175D;
	Mon,  2 Nov 2026 11:45:36 -0800 (PST)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B1383F673;
	Mon,  2 Nov 2026 11:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793648739; bh=6v38axxJ/XbAVMWvise5pVC+JPhLT7WfSeCYyoPi7Tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imU63BJEJg2gesHdzC9AZ8kL9e3wKJJnnpBVKuj1Kgn5VCAsJ/w86lEHc2ur/Ihln
	 xkl/G2ghxVLi4QdsINmw2d8oCrUCuKHL27CF1g+1Gh97R7DNiA468/mq2TYwkwZ/B2
	 2KT6/H/a6re5mugt2BxHfAcKdjH+Bi/7Y8hzgZV8=
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
Subject: [PATCH v2 08/16] KVM: arm64: gic-v5: Add ITS translation cache maintenance
Date: Mon,  2 Nov 2026 19:44:46 +0000
Message-Id: <20261102194454.4086911-9-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102194454.4086911-1-sascha.bischoff@arm.com>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_194542_022655_16A18FFA 
X-CRM114-Status: GOOD (  26.27  )
X-Spam-Score: -2.5 (--)
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

Walking the guest DT and ITTs on every MSI or ITS event is unnecessary
once a DeviceID/EventID pair has been resolved. Add an XArray indexed
by the DeviceID/EventID pair to cache resolved translations as a
disposable acceleration structure, avoiding repeated walks of guest
memory.

Cache entries hold references to the resolved struct vgic_irq objects
stored in the VM-wide LPI xarray. Lookups use RCU to access entries in
interrupt context without taking a raw spinlock, and take an IRQ
reference before returning an entry to the caller. Cache eviction drops
the reference held by the cache and defers freeing the entry until RCU
readers have finished. This keeps the cache tied to the normal LPI
object lifetime instead of storing raw LPI numbers.

Invalidate cached translations when the table configuration or guest
invalidation commands make them stale. Changes to DT_BASER or DT_CFGR
drop the entire cache, while writes of unchanged values leave it intact.
INV_EVENTR removes either one event or the events covered by an L1 ITT
entry, and INV_DEVICER removes the translations covered by either an L2
DT entry or an L1 DT entry.

The cache is not part of any userspace ABI and is never authoritative:
entries can always be rebuilt from guest memory on the next lookup.

The vgic_irq objects for LPIs track valid translations rather than
mirror interrupt state. Mirroring that state would require querying
the GIC on every guest exit. Once direct injection is added, the
objects also record whether an LPI is mapped into the host ITT.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-its-v5.c | 219 ++++++++++++++++++++++++++++--
 include/kvm/arm_vgic.h            |   3 +
 2 files changed, 208 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
index caa68c4680d02..9f4783b243221 100644
--- a/arch/arm64/kvm/vgic/vgic-its-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-its-v5.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kvm_host.h>
+#include <linux/rcupdate.h>
 #include <linux/slab.h>
 
 #include <asm/kvm_arm.h>
@@ -19,6 +20,153 @@
 #define VITS_V5_DEVICE_ID_BITS		16
 #define VITS_V5_EVENT_ID_BITS		16
 
+struct its_cache_translation_entry {
+	struct rcu_head rcu;
+	struct vgic_irq *irq;
+};
+
+/* Put EventID in the low bits so each device's events form one range. */
+static unsigned long its_cache_key(u32 device_id, u16 event_id)
+{
+	return ((unsigned long)device_id << VITS_V5_EVENT_ID_BITS) | event_id;
+}
+
+static void its_cache_drop_translation(struct kvm *kvm,
+				       struct its_cache_translation_entry *entry)
+{
+	struct vgic_irq *irq = entry->irq;
+
+	vgic_put_irq(kvm, irq);
+	/* An interrupt-context lookup may still be using the erased entry. */
+	kfree_rcu(entry, rcu);
+}
+
+static void its_cache_erase_translation(struct vgic_v5_its *its,
+					unsigned long key)
+{
+	struct its_cache_translation_entry *entry;
+
+	entry = xa_erase(&its->translation_cache, key);
+	if (entry)
+		its_cache_drop_translation(its->dev->kvm, entry);
+}
+
+static void its_cache_erase_range(struct vgic_v5_its *its,
+				  unsigned long first, unsigned long last)
+{
+	struct its_cache_translation_entry *entry;
+	unsigned long key;
+
+	xa_for_each_range(&its->translation_cache, key, entry, first, last)
+		its_cache_erase_translation(its, key);
+}
+
+static void its_cache_erase_span(struct vgic_v5_its *its,
+				unsigned long key, unsigned int bits)
+{
+	unsigned long mask = (1UL << bits) - 1;
+	unsigned long first = key & ~mask;
+
+	its_cache_erase_range(its, first, first | mask);
+}
+
+static int its_cache_add_translation(struct kvm *kvm, struct vgic_v5_its *its,
+				     u32 device_id, u16 event_id,
+				     struct vgic_irq *irq)
+{
+	unsigned long key = its_cache_key(device_id, event_id);
+	struct its_cache_translation_entry *entry;
+	struct its_cache_translation_entry *old;
+
+	entry = kzalloc_obj(*entry, GFP_KERNEL_ACCOUNT);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->irq = irq;
+
+	old = xa_store(&its->translation_cache, key, entry,
+		       GFP_KERNEL_ACCOUNT);
+	if (xa_is_err(old)) {
+		kfree(entry);
+		return xa_err(old);
+	}
+
+	if (old)
+		its_cache_drop_translation(kvm, old);
+
+	return 0;
+}
+
+static void its_cache_clear_translations(struct vgic_v5_its *its)
+{
+	struct its_cache_translation_entry *entry;
+	unsigned long key;
+
+	xa_for_each(&its->translation_cache, key, entry)
+		its_cache_erase_translation(its, key);
+}
+
+static int its_cache_look_up_translation(struct vgic_v5_its *its,
+					 u32 device_id, u16 event_id,
+					 struct vgic_irq **irq)
+{
+	unsigned long key = its_cache_key(device_id, event_id);
+	struct its_cache_translation_entry *entry;
+	int ret = -ENXIO;
+
+	rcu_read_lock();
+	entry = xa_load(&its->translation_cache, key);
+	if (entry && vgic_try_get_irq_ref(entry->irq)) {
+		*irq = entry->irq;
+		ret = 0;
+	}
+	rcu_read_unlock();
+
+	return ret;
+}
+
+static int its_cache_l2sz_bits(u8 l2sz)
+{
+	if (l2sz > GICV5_ITS_DT_ITT_CFGR_L2SZ_64k)
+		return -EINVAL;
+
+	/* L2SZ 0, 1, and 2 encode 4K, 16K, and 64K tables of 8-byte entries. */
+	return 9 + 2 * l2sz;
+}
+
+static void its_cache_handle_inv_devicer(struct vgic_v5_its *its)
+{
+	unsigned int bits = its->inv_devicer.event_id_bits;
+	int l2_bits;
+
+	if (its->inv_devicer.l1 && its->dt_cfgr.structure) {
+		l2_bits = its_cache_l2sz_bits(its->dt_cfgr.l2sz);
+		if (l2_bits < 0)
+			return;
+		/* An L1 DTE covers the L2 DT's devices and all their EventIDs. */
+		bits = l2_bits + VITS_V5_EVENT_ID_BITS;
+	} else if (bits > VITS_V5_EVENT_ID_BITS) {
+		bits = VITS_V5_EVENT_ID_BITS;
+	}
+
+	its_cache_erase_span(its, its_cache_key(its->didr.device_id, 0), bits);
+}
+
+static void its_cache_handle_inv_eventr(struct vgic_v5_its *its)
+{
+	int bits = 0;
+
+	if (its->inv_eventr.l1) {
+		/* An L1 ITTE covers the EventIDs in its L2 ITT. */
+		bits = its_cache_l2sz_bits(its->inv_eventr.itt_l2sz);
+		if (bits < 0)
+			return;
+	}
+
+	its_cache_erase_span(its, its_cache_key(its->didr.device_id,
+						  its->eidr.event_id), bits);
+}
+
 static int parse_linear_dt(struct kvm *kvm, gpa_t dt_base, u32 device_id,
 			   gpa_t *itt_base, bool *two_level_itt,
 			   unsigned int *event_id_bits, unsigned int *itt_l2sz)
@@ -230,6 +378,10 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
 		return -ENXIO;
 	}
 
+	ret = its_cache_look_up_translation(its, device_id, event_id, irq);
+	if (!ret)
+		return 0;
+
 	if (WARN_ON_ONCE(kvm->mm != get_current()->mm))
 		return -EWOULDBLOCK;
 
@@ -262,7 +414,14 @@ static int __vgic_v5_its_resolve_lpi(struct kvm *kvm, struct vgic_v5_its *its,
 	if (IS_ERR(*irq))
 		return PTR_ERR(*irq);
 
-	return 0;
+	vgic_get_irq_ref(*irq);
+	ret = its_cache_add_translation(kvm, its, device_id, event_id, *irq);
+	if (ret) {
+		vgic_put_irq(kvm, *irq);
+		return 0;
+	}
+
+	return ret;
 }
 
 static void vgic_v5_its_inject_lpi(struct kvm *kvm, struct vgic_irq *irq)
@@ -392,7 +551,12 @@ static void vgic_v5_mmio_write_its_misc(struct kvm *kvm, void *dev, gpa_t addr,
 
 	switch (offset) {
 	case GICV5_ITS_CR0:
-		its->enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, val);
+		if (FIELD_GET(GICV5_ITS_CR0_ITSEN, val)) {
+			its->enabled = true;
+		} else {
+			its->enabled = false;
+			its_cache_clear_translations(its);
+		}
 		return;
 	case GICV5_ITS_CR1:
 		its->cr1.sh = FIELD_GET(GICV5_ITS_CR1_SH, val);
@@ -409,21 +573,39 @@ static void vgic_v5_mmio_write_its_misc(struct kvm *kvm, void *dev, gpa_t addr,
 static void vgic_v5_write_its_dt_reg(struct vgic_v5_its *its, size_t offset,
 				     unsigned long val)
 {
+	lockdep_assert_held(&its->its_lock);
+
 	switch (offset) {
-	case GICV5_ITS_DT_CFGR:
-		its->dt_cfgr.device_id_bits =
-			FIELD_GET(GICV5_ITS_DT_CFGR_DEVICEID_BITS, val);
-		its->dt_cfgr.l2sz =
-			FIELD_GET(GICV5_ITS_DT_CFGR_L2SZ, val);
-		its->dt_cfgr.structure =
-			FIELD_GET(GICV5_ITS_DT_CFGR_STRUCTURE, val);
-		return;
-	case GICV5_ITS_DT_BASER:
-		its->dt_baser.addr =
-			FIELD_GET(GICV5_ITS_DT_BASER_ADDR_MASK, val)
-			<< GICV5_ITS_DT_BASER_ADDR_SHIFT;
+	case GICV5_ITS_DT_CFGR: {
+		u8 device_id_bits = FIELD_GET(GICV5_ITS_DT_CFGR_DEVICEID_BITS, val);
+		u8 l2sz = FIELD_GET(GICV5_ITS_DT_CFGR_L2SZ, val);
+		bool structure = FIELD_GET(GICV5_ITS_DT_CFGR_STRUCTURE, val);
+
+		if (its->dt_cfgr.device_id_bits == device_id_bits &&
+		    its->dt_cfgr.l2sz == l2sz &&
+		    its->dt_cfgr.structure == structure)
+			return;
+
+		its->dt_cfgr.device_id_bits = device_id_bits;
+		its->dt_cfgr.l2sz = l2sz;
+		its->dt_cfgr.structure = structure;
+		break;
+	}
+	case GICV5_ITS_DT_BASER: {
+		u64 base = FIELD_GET(GICV5_ITS_DT_BASER_ADDR_MASK, val)
+			   << GICV5_ITS_DT_BASER_ADDR_SHIFT;
+
+		if (its->dt_baser.addr == base)
+			return;
+
+		its->dt_baser.addr = base;
+		break;
+	}
+	default:
 		return;
 	}
+
+	its_cache_clear_translations(its);
 }
 
 static u64 vgic_v5_read_its_dt_baser(struct vgic_v5_its *its)
@@ -530,6 +712,8 @@ static void vgic_v5_mmio_write_its_dt_itt(struct kvm *kvm, void *dev,
 			FIELD_GET(GICV5_ITS_INV_DEVICER_EVENTID_BITS, val);
 		its->inv_devicer.i =
 			FIELD_GET(GICV5_ITS_INV_DEVICER_I, val);
+		if (its->inv_devicer.i)
+			its_cache_handle_inv_devicer(its);
 		return;
 	case GICV5_ITS_DIDR:
 	case GICV5_ITS_DIDR + 4:
@@ -546,6 +730,8 @@ static void vgic_v5_mmio_write_its_dt_itt(struct kvm *kvm, void *dev,
 		its->inv_eventr.itt_l2sz =
 			FIELD_GET(GICV5_ITS_INV_EVENTR_ITT_L2SZ, val);
 		its->inv_eventr.i = FIELD_GET(GICV5_ITS_INV_EVENTR_I, val);
+		if (its->inv_eventr.i)
+			its_cache_handle_inv_eventr(its);
 		return;
 	case GICV5_ITS_SYNCR:
 		return;
@@ -743,6 +929,7 @@ static void vgic_v5_its_reset(struct vgic_v5_its *its)
 	its->gen_event_eidr.event_id = 0;
 	its->gen_event_didr.device_id = 0;
 
+	its_cache_clear_translations(its);
 }
 
 static int vgic_v5_its_create(struct kvm_device *dev, u32 type)
@@ -766,6 +953,8 @@ static int vgic_v5_its_create(struct kvm_device *dev, u32 type)
 		return -ENODEV;
 	}
 
+	xa_init(&its->translation_cache);
+
 	its->vgic_v5_its_base = VGIC_ADDR_UNDEF;
 	its->dev = dev;
 
@@ -782,6 +971,8 @@ static void vgic_v5_its_destroy(struct kvm_device *kvm_dev)
 {
 	struct vgic_v5_its *its = kvm_dev->private;
 
+	its_cache_clear_translations(its);
+	xa_destroy(&its->translation_cache);
 	kfree(its);
 	kfree(kvm_dev);
 }
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 53aa5c857e295..376c6efa9779e 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -584,6 +584,9 @@ struct vgic_v5_its {
 		u32 device_id;
 	} gen_event_didr;
 
+	/* Caches DeviceID/EventID translations. */
+	struct xarray translation_cache;
+
 	/* Protects the device in general */
 	struct mutex		its_lock;
 };
-- 
2.34.1


