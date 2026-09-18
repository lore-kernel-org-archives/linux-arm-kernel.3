Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE595C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUadRvtTRwf/90/kezmgXzTksbWqnPXbUgezkbnF2dU=; b=SbDm20ll6tZhLQW/7uBl6/ZsyV
	VNqxvVUNH+fa74+62nsKMW7uttesTq2E4OVMN8TmQiTCK2Ez+hJW0YOoMVmW/2+Qy9kJVhfM19tQo
	NK51dafyfOC3gcQAmFdj7HVLOXqbsxYvvjmA+Bk/ce9nHMbmU5rhat85Nj3Z4LstHjrixSn2H4RuY
	Rp2QjjA97rBk3g31G1GrXCCIm/xXXEZb96v0c2w8HG7p15Rg57oDeu+io8cfeoJ+GXWqSjuCZl1N9
	aZNZBi7uFHfr3v5Smz7yohi19lv7iFf5uZShXacwoMik2zuLCQBr3IUShpnhjD1kuRXOCuchCX87B
	h/y6bbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TsR-0000000DndR-1UpD;
	Fri, 18 Sep 2026 08:23:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TsQ-0000000Dnct-0hbj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BUadRvtTRwf/90/kezmgXzTksbWqnPXbUgezkbnF2dU=; b=SpscRmdzBNjXxcQKvlWJzCiu7w
	PwD5N8v1DMeaZxTeEeGeDsBGgxrG52WPAG9FlEEOxzhH4pm6qtXOwFdDAvtzLoE7+mBTmW52igPAv
	brT7PrMUnzg7p90YC38HxwCq5ahhBMyi66J8Qk59Ng5/MWlLAfVyUScwgobC5j8YIsqlflizK8mDv
	SgXvTP0usOH5lz50D21nyun4yknknZ7aZ9bTl/qwJ7/RPVrNK6lf6v8JSxFiMfz13uASJkrF/6sg2
	tAFeG3cJsU8uKu3yN0Ym+ap8s84A8Xz4y2bNvivwXuJ1aYUXt1gKQ9c9/6TmaavtzICFsBx8QB2Qg
	kyQCdQDQ==;
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7TsM-00000009mb7-0R9X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:23:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BUadRvtTRwf/90/kezmgXzTksbWqnPXbUgezkbnF2dU=;
	b=LKawxbqagWZtqKJ5OfXIClN6O5kePR6fYGJ74aEwh84a/T/Y6nW+MwMqraUa96Hs3rCAUYE4L
	e3YromFj41MQ1QR/1DzTU2NtAEqgOwwTS8A2TDqaQdQr6pqLUX4vufA3nrXV52IcZ6sg//WDD0x
	GvD2QUiOebSHiyWA35VoJPQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hmQLV3kJ8zpSy8;
	Fri, 18 Sep 2026 16:11:14 +0800 (CST)
Received: from dggpemr200003.china.huawei.com (unknown [7.185.36.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 897A04057A;
	Fri, 18 Sep 2026 16:23:03 +0800 (CST)
Received: from huawei.com (10.50.159.234) by dggpemr200003.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 18 Sep
 2026 16:23:02 +0800
From: Yize Wang <wangyize7@huawei.com>
To: <maz@kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <oupton@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<fuad.tabba@linux.dev>, <joey.gouly@arm.com>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <yuzenghui@huawei.com>, <mark.rutland@arm.com>,
	<zhengchuan@huawei.com>, <jiangjiacheng@huawei.com>, <wangyize7@huawei.com>,
	<yize_w1110@163.com>
Subject: [PATCH 2/2] KVM: arm64: Add VGIC v3 batch register access implementation
Date: Fri, 18 Sep 2026 16:18:15 +0800
Message-ID: <20260918081930.4014735-3-wangyize7@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918081930.4014735-1-wangyize7@huawei.com>
References: <20260918081930.4014735-1-wangyize7@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.159.234]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr200003.china.huawei.com (7.185.36.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_092319_510025_D3A5B920 
X-CRM114-Status: GOOD (  19.47  )
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

Add vgic_v3_batch_access() to allow userspace to read or write
multiple VGIC registers in a single system call.

Introduce KVM_DEV_ARM_VGIC_ATTR_FLAG_LOCKED to modify the locking
and unlocking logic in vgic_v3_attr_regs_access to prevent repeated
locking and unlocking.

Wire up KVM_DEV_ARM_VGIC_GRP_BATCH_REGS in vgic_v3_set_attr(),
vgic_v3_get_attr(), and vgic_v3_has_attr().

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Yize Wang <wangyize7@huawei.com>
---
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 113 ++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 90be99443df3..ef0b2e8f68b2 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -566,14 +566,21 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 			return -EFAULT;
 	}
 
-	mutex_lock(&dev->kvm->lock);
+	/* If the caller has not indicated that it already holds the necessary locks
+	 * (e.g., via KVM_DEV_ARM_VGIC_ATTR_FLAG_LOCKED), we must acquire the VM lock
+	 * and pause all VCPUs to ensure consistent access to VGIC state. This prevents
+	 * race conditions with concurrent interrupt injection or VCPU execution.
+	 */
+	if (attr->flags != KVM_DEV_ARM_VGIC_ATTR_FLAG_LOCKED) {
+		mutex_lock(&dev->kvm->lock);
 
-	if (kvm_trylock_all_vcpus(dev->kvm)) {
-		mutex_unlock(&dev->kvm->lock);
-		return -EBUSY;
-	}
+		if (kvm_trylock_all_vcpus(dev->kvm)) {
+			mutex_unlock(&dev->kvm->lock);
+			return -EBUSY;
+		}
 
-	mutex_lock(&dev->kvm->arch.config_lock);
+		mutex_lock(&dev->kvm->arch.config_lock);
+	}
 
 	if (!(vgic_initialized(dev->kvm) || reg_allowed_pre_init(attr))) {
 		ret = -EBUSY;
@@ -611,9 +618,15 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 	}
 
 out:
-	mutex_unlock(&dev->kvm->arch.config_lock);
-	kvm_unlock_all_vcpus(dev->kvm);
-	mutex_unlock(&dev->kvm->lock);
+	/* Release the locks acquired at the beginning of this function,
+	 * but only if we actually acquired them.
+	 * The order of unlocking must be the reverse of locking.
+	 */
+	if (attr->flags != KVM_DEV_ARM_VGIC_ATTR_FLAG_LOCKED) {
+		mutex_unlock(&dev->kvm->arch.config_lock);
+		kvm_unlock_all_vcpus(dev->kvm);
+		mutex_unlock(&dev->kvm->lock);
+	}
 
 	if (!ret && uaccess && !is_write) {
 		u32 __user *uaddr = (u32 __user *)(unsigned long)attr->addr;
@@ -623,6 +636,81 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 	return ret;
 }
 
+/* vgic_v3_batch_access - Batch access to VGIC registers
+ *
+ * @dev: The VGIC device
+ * @attr: The device attribute containing the batch entries
+ * @is_write: True for write, false for read
+ *
+ * This function allows userspace to read or write multiple VGIC registers
+ * in a single system call, reducing overhead during live migration.
+ *
+ * Returns: 0 on success, or the first error encountered.
+ * Individual entry errors are stored in entries[i].error.
+ */
+static int vgic_v3_batch_access(struct kvm_device *dev,
+				struct kvm_device_attr *attr, bool is_write)
+{
+	struct kvm_dev_arm_vgic_batch_entry __user *uentries;
+	struct kvm_dev_arm_vgic_batch_entry *entries;
+	struct kvm_device_attr sub_attr;
+	u32 count = attr->attr;
+	int ret = 0, i;
+
+	if (!count || count > KVM_DEV_ARM_VGIC_BATCH_MAX)
+		return -EINVAL;
+
+	entries = kvmalloc_array(count, sizeof(*entries), GFP_KERNEL);
+	if (!entries)
+		return -ENOMEM;
+
+	uentries = (void __user *)attr->addr;
+	if (copy_from_user(entries, uentries, count * sizeof(*entries))) {
+		kvfree(entries);
+		return -EFAULT;
+	}
+
+	mutex_lock(&dev->kvm->lock);
+	if (kvm_trylock_all_vcpus(dev->kvm)) {
+		mutex_unlock(&dev->kvm->lock);
+		kvfree(entries);
+		return -EBUSY;
+	}
+	mutex_lock(&dev->kvm->arch.config_lock);
+
+	/* Process each entry in the batch */
+	for (i = 0; i < count; i++) {
+		int err;
+
+		sub_attr.group = entries[i].group;
+		sub_attr.attr = entries[i].attr;
+		sub_attr.addr = (unsigned long)uentries +
+			i * sizeof(struct kvm_dev_arm_vgic_batch_entry) +
+			offsetof(struct kvm_dev_arm_vgic_batch_entry, val);
+
+		/* Set flag to indicate that locks are already held.
+		 * This prevents vgic_v3_attr_regs_access from acquiring locks again,
+		 * avoiding deadlock and overhead.
+		 */
+		sub_attr.flags = KVM_DEV_ARM_VGIC_ATTR_FLAG_LOCKED;
+
+		err = vgic_v3_attr_regs_access(dev, &sub_attr, is_write);
+
+		if (err) {
+			pr_err("group %d attr %lld get err %d\n",
+				sub_attr.group, sub_attr.attr, err);
+			ret = err;
+		}
+	}
+
+	mutex_unlock(&dev->kvm->arch.config_lock);
+	kvm_unlock_all_vcpus(dev->kvm);
+	mutex_unlock(&dev->kvm->lock);
+
+	kvfree(entries);
+	return ret;
+}
+
 static int vgic_v3_set_attr(struct kvm_device *dev,
 			    struct kvm_device_attr *attr)
 {
@@ -649,6 +737,8 @@ static int vgic_v3_set_attr(struct kvm_device *dev,
 		dev->kvm->arch.vgic.mi_intid = val;
 		return 0;
 	}
+	case KVM_DEV_ARM_VGIC_GRP_BATCH_REGS:
+		return vgic_v3_batch_access(dev, attr, true);
 	default:
 		return vgic_set_common_attr(dev, attr);
 	}
@@ -669,6 +759,8 @@ static int vgic_v3_get_attr(struct kvm_device *dev,
 		guard(mutex)(&dev->kvm->arch.config_lock);
 		return put_user(dev->kvm->arch.vgic.mi_intid, uaddr);
 	}
+	case KVM_DEV_ARM_VGIC_GRP_BATCH_REGS:
+		return vgic_v3_batch_access(dev, attr, false);
 	default:
 		return vgic_get_common_attr(dev, attr);
 	}
@@ -707,6 +799,9 @@ static int vgic_v3_has_attr(struct kvm_device *dev,
 		case KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES:
 			return 0;
 		}
+		break;
+	case KVM_DEV_ARM_VGIC_GRP_BATCH_REGS:
+		return 0;
 	}
 	return -ENXIO;
 }
-- 
2.43.0


