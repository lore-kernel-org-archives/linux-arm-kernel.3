Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF2F606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ncBKcsiW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E80LcTNN;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NmK2GtGJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=61OnxPWIOl0SBfgH14SW36eRMsyA/CyEvSNcHeQuje8=; b=ncBKcsiWT4+K2v
	oDipaKXjFtW+aOkW+4lPtxIYOG0isVEga8l6g8l/cjV4l7BDwaoqOMquvNzmlRdjm6HEI6oNNOM5p
	vQ4M4AB/eXUsgO3v95MzGOtvywqMHdUegjJR+bpXRXkjZJjIFXCP2pgUO0Pd9lbkPtgTStmX9edrU
	cA23cpd+U9fJOChgt8iGBK69HGg9xjVZDgca89eoOgV1eXGcHPYTbY8h34qIjtmSxDKxAb1EuYga3
	Udmw+5AHupyVmSJ9iVdqFuAVMdbVWHwAmmDyCj0bsle3pbnUtdYtCswO0HtgrGt2HbFehq0VxOBnq
	CTMnnxGIJnr3Z+jlxOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxzA-00000000Aa9-0AoU;
	Mon, 02 Nov 2026 19:46:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyb-000000009Dp-42r5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 19:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=61OnxPWIOl0SBfgH14SW36eRMsyA/CyEvSNcHeQuje8=; b=E80LcTNNk7x8LNv4+bEUL/Mna/
	OLhcyG7OizQPvBBCFfkCcRxFZLk65PxVQp5GaaKTXX5GXAfhLimbK0KpydtPzcYJs/U36J4gNSk4e
	Jk9qQBchRQlZ/wOxnHe94V33f4hGJ/sSTjL9lUukfTLFwYKb1LoRdok6r3rp+gWYceXdMxv5ibSik
	27+BjM0mqZizPSbj1jIlxhzmu/dNTt7RtwUG7uWDXu2PJrxU/jow2MU1QV6gKLYNM479cV42Aq9v3
	/33m39ujMcn6q1hW3Y8QEfYv/e0CFP5H3ucO4lD0aB9YhOQHB6WOBDN/nIsqy97lVuIHJHHuQZc8L
	kic4sRPw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxyY-000000031Kb-1RTY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:45:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C409E175D;
	Mon,  2 Nov 2026 11:45:45 -0800 (PST)
Received: from e133894.cambridge.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43B773F673;
	Mon,  2 Nov 2026 11:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793648748; bh=XNXL2rh2PFKC69FRZUf4CXkWdEGDiTwBxzwFwejt0sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NmK2GtGJ+KvFBtubEvIXB/yZqgnhU9EASydovoCTstH2voMWni2FS8LwNB+oKpiXp
	 heMhc+Q86ERQeKnBmtCfTSs0OsNOyYVV4Ylkni+cJ+g+v3kkZZat/gDxsBm0yWuJ8+
	 QpnPgEN4iP2H8IkWrtgpE6+XvzNI9psKNJhFo4Jg=
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
Subject: [PATCH v2 10/16] KVM: arm64: gic-v5: Add ITS userspace register access
Date: Mon,  2 Nov 2026 19:44:48 +0000
Message-Id: <20261102194454.4086911-11-sascha.bischoff@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102194454.4086911-1-sascha.bischoff@arm.com>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_194551_340884_F09FEA08 
X-CRM114-Status: GOOD (  22.98  )
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

Userspace needs access to the emulated GICv5 ITS MMIO state in order
to inspect and restore the device state around VM reset and migration.
Expose the GICv5 ITS register frame through KVM_DEV_ARM_VGIC_GRP_ITS_REGS.

Reuse the same MMIO register descriptors used by the guest-facing
IODEV, but apply the usual userspace access constraints: the ITS base
address must have been configured, the register offset must map to an
emulated ITS register, and userspace accesses must use the natural
32-bit or 64-bit register alignment.

Add control handling for KVM_DEV_ARM_ITS_CTRL_RESET. The reset is
performed while all vCPUs are stopped and while holding the ITS lock,
so it cannot race with guest MMIO updates or translation lookups. The
reset clears guest-programmed state and cached translations while
preserving the advertised ITS capability defaults.

Do not expose GICv5 ITS SAVE_TABLES or RESTORE_TABLES controls. For
GICv5, the guest-owned DT and ITTs are the authoritative translation
state, and the KVM translation cache is disposable state that can be
rebuilt from guest memory.

Restore guest read-only IDR0-IDR2 through dedicated userspace writes,
validating the advertised capabilities before changing them. Also
allow userspace to restore READ_EVENT_DATAR while keeping guest writes
to that result register ignored.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-its-v5.c | 371 ++++++++++++++++++++++++++----
 1 file changed, 322 insertions(+), 49 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
index b69a1d107c0ae..638ee47f6e27d 100644
--- a/arch/arm64/kvm/vgic/vgic-its-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-its-v5.c
@@ -688,6 +688,70 @@ static void vgic_v5_mmio_write_its_misc(struct kvm *kvm, void *dev, gpa_t addr,
 	}
 }
 
+static int vgic_v5_uaccess_write_its_idr(struct kvm *kvm, void *dev,
+					gpa_t addr, unsigned int len,
+					unsigned long val)
+{
+	struct vgic_v5_its *its = dev;
+	size_t offset = addr & (SZ_64K - 1);
+	u64 mmfr0;
+
+	guard(mutex)(&its->its_lock);
+
+	switch (offset) {
+	case GICV5_ITS_IDR0:
+		if (FIELD_GET(GICV5_ITS_IDR0_DOM, val) !=
+		    GICV5_ITS_IDR0_DOMAIN_NON_SECURE ||
+		    (val & ~(GICV5_ITS_IDR0_ITSID |
+			     GICV5_ITS_IDR0_PA_RANGE | GICV5_ITS_IDR0_DOM)))
+			return -EINVAL;
+
+		mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
+		if (FIELD_GET(GICV5_ITS_IDR0_PA_RANGE, val) >
+		    cpuid_feature_extract_unsigned_field(mmfr0,
+					ID_AA64MMFR0_EL1_PARANGE_SHIFT))
+			return -EINVAL;
+
+		its->idr0.pa_range = FIELD_GET(GICV5_ITS_IDR0_PA_RANGE, val);
+		its->idr0.its_id = FIELD_GET(GICV5_ITS_IDR0_ITSID, val);
+		return 0;
+	case GICV5_ITS_IDR1:
+		if ((val & ~(GICV5_ITS_IDR1_L2SZ |
+			     GICV5_ITS_IDR1_ITT_LEVELS |
+			     GICV5_ITS_IDR1_DT_LEVELS |
+			     GICV5_ITS_IDR1_DEVICEID_BITS)) ||
+		    FIELD_GET(GICV5_ITS_IDR1_DEVICEID_BITS, val) >
+		    VITS_V5_DEVICE_ID_BITS)
+			return -EINVAL;
+
+		/*
+		 * Userspace can change the DeviceID limit after translations have
+		 * been cached. Drop them so the old limit cannot remain in effect.
+		 */
+		if (its->idr1.device_id_bits !=
+		    FIELD_GET(GICV5_ITS_IDR1_DEVICEID_BITS, val))
+			its_cache_clear_translations(its);
+
+		its->idr1.device_id_bits = FIELD_GET(GICV5_ITS_IDR1_DEVICEID_BITS,
+							 val);
+		its->idr1.dt_levels = !!(val & GICV5_ITS_IDR1_DT_LEVELS);
+		its->idr1.itt_levels = !!(val & GICV5_ITS_IDR1_ITT_LEVELS);
+		its->idr1.l2sz = FIELD_GET(GICV5_ITS_IDR1_L2SZ, val);
+		return 0;
+	case GICV5_ITS_IDR2:
+		if ((val & ~GICV5_ITS_IDR2_EVENTID_BITS) ||
+		    FIELD_GET(GICV5_ITS_IDR2_EVENTID_BITS, val) >
+		    VITS_V5_EVENT_ID_BITS)
+			return -EINVAL;
+
+		its->idr2.event_id_bits = FIELD_GET(GICV5_ITS_IDR2_EVENTID_BITS,
+							 val);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static void vgic_v5_write_its_dt_reg(struct vgic_v5_its *its, size_t offset,
 				     unsigned long val)
 {
@@ -732,6 +796,37 @@ static u64 vgic_v5_read_its_dt_baser(struct vgic_v5_its *its)
 			  its->dt_baser.addr >> GICV5_ITS_DT_BASER_ADDR_SHIFT);
 }
 
+static int vgic_v5_uaccess_write_its_dt_itt(struct kvm *kvm, void *dev,
+					    gpa_t addr, unsigned int len,
+					    unsigned long val)
+{
+	struct vgic_v5_its *its = dev;
+	size_t offset = addr & (SZ_64K - 1);
+
+	guard(mutex)(&its->its_lock);
+
+	vgic_v5_write_its_dt_reg(its, offset, val);
+	return 0;
+}
+
+static int vgic_v5_uaccess_write_its_event_datar(struct kvm *kvm, void *dev,
+						gpa_t addr, unsigned int len,
+						unsigned long val)
+{
+	struct vgic_v5_its *its = dev;
+
+	guard(mutex)(&its->its_lock);
+
+	its->read_event_datar.valid = !!(val & GICV5_ITS_READ_EVENT_DATAR_VALID);
+	its->read_event_datar.lpi_id = FIELD_GET(GICV5_ITS_READ_EVENT_DATAR_LPI_ID,
+							 val);
+	its->read_event_datar.virt = !!(val & GICV5_ITS_READ_EVENT_DATAR_VIRT);
+	its->read_event_datar.vm_id = FIELD_GET(GICV5_ITS_READ_EVENT_DATAR_VM_ID,
+							 val);
+
+	return 0;
+}
+
 static unsigned long vgic_v5_mmio_read_its_dt_itt(struct kvm *kvm, void *dev,
 						  gpa_t addr, unsigned int len)
 {
@@ -901,13 +996,26 @@ static void vgic_v5_mmio_write_its_wi(struct kvm *kvm, void *dev, gpa_t addr,
 		.its_read = rd, .its_write = wr,                       \
 	}
 
+#define REGISTER_ITS_V5_DESC_UACCESS(off, rd, wr, uwr, length, acc)    \
+	{                                                              \
+		.reg_offset = off, .len = length, .access_flags = acc, \
+		.its_read = rd, .its_write = wr,                       \
+		.uaccess_its_write = uwr,                              \
+	}
+
 static const struct vgic_register_region vgic_v5_its_registers[] = {
-	REGISTER_ITS_V5_DESC(GICV5_ITS_IDR0, vgic_v5_mmio_read_its_misc,
-			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
-	REGISTER_ITS_V5_DESC(GICV5_ITS_IDR1, vgic_v5_mmio_read_its_misc,
-			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
-	REGISTER_ITS_V5_DESC(GICV5_ITS_IDR2, vgic_v5_mmio_read_its_misc,
-			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
+	REGISTER_ITS_V5_DESC_UACCESS(GICV5_ITS_IDR0, vgic_v5_mmio_read_its_misc,
+				     vgic_v5_mmio_write_its_wi,
+				     vgic_v5_uaccess_write_its_idr, 4,
+				     VGIC_ACCESS_32bit),
+	REGISTER_ITS_V5_DESC_UACCESS(GICV5_ITS_IDR1, vgic_v5_mmio_read_its_misc,
+				     vgic_v5_mmio_write_its_wi,
+				     vgic_v5_uaccess_write_its_idr, 4,
+				     VGIC_ACCESS_32bit),
+	REGISTER_ITS_V5_DESC_UACCESS(GICV5_ITS_IDR2, vgic_v5_mmio_read_its_misc,
+				     vgic_v5_mmio_write_its_wi,
+				     vgic_v5_uaccess_write_its_idr, 4,
+				     VGIC_ACCESS_32bit),
 	REGISTER_ITS_V5_DESC(GICV5_ITS_IIDR, vgic_v5_mmio_read_its_misc,
 			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
 	REGISTER_ITS_V5_DESC(GICV5_ITS_AIDR, vgic_v5_mmio_read_its_misc,
@@ -916,14 +1024,16 @@ static const struct vgic_register_region vgic_v5_its_registers[] = {
 			     vgic_v5_mmio_write_its_misc, 4, VGIC_ACCESS_32bit),
 	REGISTER_ITS_V5_DESC(GICV5_ITS_CR1, vgic_v5_mmio_read_its_misc,
 			     vgic_v5_mmio_write_its_misc, 4, VGIC_ACCESS_32bit),
-	REGISTER_ITS_V5_DESC(GICV5_ITS_DT_BASER,
-			     vgic_v5_mmio_read_its_dt_itt,
-			     vgic_v5_mmio_write_its_dt_itt, 8,
-			     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
-	REGISTER_ITS_V5_DESC(GICV5_ITS_DT_CFGR,
-			     vgic_v5_mmio_read_its_dt_itt,
-			     vgic_v5_mmio_write_its_dt_itt, 4,
-			     VGIC_ACCESS_32bit),
+	REGISTER_ITS_V5_DESC_UACCESS(GICV5_ITS_DT_BASER,
+				     vgic_v5_mmio_read_its_dt_itt,
+				     vgic_v5_mmio_write_its_dt_itt,
+				     vgic_v5_uaccess_write_its_dt_itt, 8,
+				     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
+	REGISTER_ITS_V5_DESC_UACCESS(GICV5_ITS_DT_CFGR,
+				     vgic_v5_mmio_read_its_dt_itt,
+				     vgic_v5_mmio_write_its_dt_itt,
+				     vgic_v5_uaccess_write_its_dt_itt, 4,
+				     VGIC_ACCESS_32bit),
 	REGISTER_ITS_V5_DESC(GICV5_ITS_DIDR, vgic_v5_mmio_read_its_dt_itt,
 			     vgic_v5_mmio_write_its_dt_itt, 8,
 			     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
@@ -939,9 +1049,10 @@ static const struct vgic_register_region vgic_v5_its_registers[] = {
 	REGISTER_ITS_V5_DESC(GICV5_ITS_READ_EVENTR, vgic_v5_mmio_read_its_raz,
 			     vgic_v5_mmio_write_its_dt_itt, 4,
 			     VGIC_ACCESS_32bit),
-	REGISTER_ITS_V5_DESC(GICV5_ITS_READ_EVENT_DATAR,
+	REGISTER_ITS_V5_DESC_UACCESS(GICV5_ITS_READ_EVENT_DATAR,
 			     vgic_v5_mmio_read_its_dt_itt,
-			     vgic_v5_mmio_write_its_wi, 8,
+			     vgic_v5_mmio_write_its_wi,
+			     vgic_v5_uaccess_write_its_event_datar, 8,
 			     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
 	REGISTER_ITS_V5_DESC(GICV5_ITS_STATUSR, vgic_v5_mmio_read_its_dt_itt,
 			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
@@ -1130,64 +1241,226 @@ static int vgic_v5_register_its_iodev(struct kvm *kvm, struct vgic_v5_its *its,
 	return ret;
 }
 
+static int vgic_v5_its_has_attr_regs(struct kvm_device *dev,
+				     struct kvm_device_attr *attr)
+{
+	const struct vgic_register_region *region;
+	gpa_t offset = attr->attr;
+	int align;
+
+	region = vgic_find_mmio_region(vgic_v5_its_registers,
+				       ARRAY_SIZE(vgic_v5_its_registers),
+				       offset);
+	if (!region)
+		return -ENXIO;
+
+	align = region->access_flags & VGIC_ACCESS_64bit ? 0x7 : 0x3;
+	if (offset & align)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int vgic_v5_its_attr_regs_access(struct kvm_device *dev,
+					struct kvm_device_attr *attr,
+					u64 *reg, bool is_write)
+{
+	const struct vgic_register_region *region;
+	struct vgic_v5_its *its = dev->private;
+	gpa_t offset = attr->attr;
+	unsigned int len;
+	gpa_t addr;
+	int align;
+	int ret = 0;
+
+	mutex_lock(&dev->kvm->lock);
+
+	if (kvm_trylock_all_vcpus(dev->kvm)) {
+		mutex_unlock(&dev->kvm->lock);
+		return -EBUSY;
+	}
+
+	mutex_lock(&dev->kvm->arch.config_lock);
+
+	if (IS_VGIC_ADDR_UNDEF(its->vgic_v5_its_base)) {
+		ret = -ENXIO;
+		goto out;
+	}
+
+	region = vgic_find_mmio_region(vgic_v5_its_registers,
+				       ARRAY_SIZE(vgic_v5_its_registers),
+				       offset);
+	if (!region) {
+		ret = -ENXIO;
+		goto out;
+	}
+
+	/*
+	 * Although the spec supports upper/lower 32-bit accesses to
+	 * 64-bit ITS registers, the userspace ABI requires 64-bit
+	 * accesses to all 64-bit wide registers.
+	 */
+	align = region->access_flags & VGIC_ACCESS_64bit ? 0x7 : 0x3;
+	len = region->access_flags & VGIC_ACCESS_64bit ? 8 : 4;
+
+	if (offset & align) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	addr = its->vgic_v5_its_base + offset;
+
+	if (is_write) {
+		if (region->uaccess_its_write)
+			ret = region->uaccess_its_write(dev->kvm, its, addr,
+							len, *reg);
+		else
+			region->its_write(dev->kvm, its, addr, len, *reg);
+	} else {
+		*reg = region->its_read(dev->kvm, its, addr, len);
+	}
+out:
+	mutex_unlock(&dev->kvm->arch.config_lock);
+	kvm_unlock_all_vcpus(dev->kvm);
+	mutex_unlock(&dev->kvm->lock);
+
+	return ret;
+}
+
+static int vgic_v5_its_ctrl(struct kvm *kvm, struct vgic_v5_its *its, u64 attr)
+{
+	int ret = 0;
+
+	if (attr == KVM_DEV_ARM_VGIC_CTRL_INIT)
+		return 0;
+
+	mutex_lock(&kvm->lock);
+
+	if (kvm_trylock_all_vcpus(kvm)) {
+		mutex_unlock(&kvm->lock);
+		return -EBUSY;
+	}
+
+	mutex_lock(&kvm->arch.config_lock);
+	mutex_lock(&its->its_lock);
+
+	switch (attr) {
+	case KVM_DEV_ARM_ITS_CTRL_RESET:
+		vgic_v5_its_reset(its);
+		break;
+	default:
+		ret = -ENXIO;
+		break;
+	}
+
+	mutex_unlock(&its->its_lock);
+	mutex_unlock(&kvm->arch.config_lock);
+	kvm_unlock_all_vcpus(kvm);
+	mutex_unlock(&kvm->lock);
+
+	return ret;
+}
+
 static int vgic_v5_its_set_attr(struct kvm_device *dev,
 				struct kvm_device_attr *attr)
 {
 	struct vgic_v5_its *its = dev->private;
-	u64 __user *uaddr = (u64 __user *)(long)attr->addr;
-	unsigned long type = (unsigned long)attr->attr;
-	u64 addr;
 	int ret;
 
-	if (attr->group != KVM_DEV_ARM_VGIC_GRP_ADDR)
-		return -ENXIO;
+	switch (attr->group) {
+	case KVM_DEV_ARM_VGIC_GRP_ADDR: {
+		u64 __user *uaddr = (u64 __user *)(long)attr->addr;
+		unsigned long type = (unsigned long)attr->attr;
+		u64 addr;
 
-	if (type != KVM_VGIC_V5_ADDR_TYPE_ITS)
-		return -ENODEV;
+		if (type != KVM_VGIC_V5_ADDR_TYPE_ITS)
+			return -ENODEV;
 
-	if (copy_from_user(&addr, uaddr, sizeof(addr)))
-		return -EFAULT;
+		if (copy_from_user(&addr, uaddr, sizeof(addr)))
+			return -EFAULT;
 
-	ret = vgic_check_iorange(dev->kvm, its->vgic_v5_its_base, addr,
-				 SZ_64K, KVM_VGIC_V5_ITS_SIZE);
-	if (ret)
-		return ret;
+		ret = vgic_check_iorange(dev->kvm, its->vgic_v5_its_base,
+					 addr, SZ_64K, KVM_VGIC_V5_ITS_SIZE);
+		if (ret)
+			return ret;
+
+		return vgic_v5_register_its_iodev(dev->kvm, its, addr);
+	}
+	case KVM_DEV_ARM_VGIC_GRP_CTRL:
+		return vgic_v5_its_ctrl(dev->kvm, its, attr->attr);
+	case KVM_DEV_ARM_VGIC_GRP_ITS_REGS: {
+		u64 __user *uaddr = (u64 __user *)(long)attr->addr;
+		u64 reg;
+
+		if (get_user(reg, uaddr))
+			return -EFAULT;
 
-	return vgic_v5_register_its_iodev(dev->kvm, its, addr);
+		return vgic_v5_its_attr_regs_access(dev, attr, &reg, true);
+	}
+	}
+
+	return -ENXIO;
 }
 
 static int vgic_v5_its_get_attr(struct kvm_device *dev,
 				struct kvm_device_attr *attr)
 {
-	struct vgic_v5_its *its = dev->private;
-	u64 __user *uaddr = (u64 __user *)(long)attr->addr;
-	unsigned long type = (unsigned long)attr->attr;
-	u64 addr = its->vgic_v5_its_base;
+	switch (attr->group) {
+	case KVM_DEV_ARM_VGIC_GRP_ADDR: {
+		struct vgic_v5_its *its = dev->private;
+		u64 __user *uaddr = (u64 __user *)(long)attr->addr;
+		unsigned long type = (unsigned long)attr->attr;
+		u64 addr = its->vgic_v5_its_base;
 
-	if (attr->group != KVM_DEV_ARM_VGIC_GRP_ADDR)
-		return -ENXIO;
+		if (type != KVM_VGIC_V5_ADDR_TYPE_ITS)
+			return -ENODEV;
 
-	if (type != KVM_VGIC_V5_ADDR_TYPE_ITS)
-		return -ENODEV;
+		if (copy_to_user(uaddr, &addr, sizeof(addr)))
+			return -EFAULT;
+
+		return 0;
+	}
+	case KVM_DEV_ARM_VGIC_GRP_ITS_REGS: {
+		u64 __user *uaddr = (u64 __user *)(long)attr->addr;
+		u64 reg;
+		int ret;
 
-	if (copy_to_user(uaddr, &addr, sizeof(addr)))
-		return -EFAULT;
+		ret = vgic_v5_its_attr_regs_access(dev, attr, &reg, false);
+		if (ret)
+			return ret;
 
-	return 0;
+		if (put_user(reg, uaddr))
+			return -EFAULT;
+
+		return 0;
+	}
+	}
+
+	return -ENXIO;
 }
 
 static int vgic_v5_its_has_attr(struct kvm_device *dev,
 				struct kvm_device_attr *attr)
 {
-	if (attr->group != KVM_DEV_ARM_VGIC_GRP_ADDR)
-		return -ENXIO;
-
-	switch (attr->attr) {
-	case KVM_VGIC_V5_ADDR_TYPE_ITS:
-		return 0;
-	default:
-		return -ENXIO;
+	switch (attr->group) {
+	case KVM_DEV_ARM_VGIC_GRP_ADDR:
+		switch (attr->attr) {
+		case KVM_VGIC_V5_ADDR_TYPE_ITS:
+			return 0;
+		}
+		break;
+	case KVM_DEV_ARM_VGIC_GRP_CTRL:
+		switch (attr->attr) {
+		case KVM_DEV_ARM_VGIC_CTRL_INIT:
+		case KVM_DEV_ARM_ITS_CTRL_RESET:
+			return 0;
+		}
+		break;
+	case KVM_DEV_ARM_VGIC_GRP_ITS_REGS:
+		return vgic_v5_its_has_attr_regs(dev, attr);
 	}
+
+	return -ENXIO;
 }
 
 static struct kvm_device_ops kvm_arm_vgic_v5_its_ops = {
-- 
2.34.1


