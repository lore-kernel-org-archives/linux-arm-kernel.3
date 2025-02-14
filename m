Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93012C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pu+yCU8a3zHiD33i1SjhqECQAo1I4nsEwt4OD4Fy6ew=; b=rplAXVd8IxDf8eblE6raFsZa/1
	jfzaMFnsf72Vb5ZcF1nSVYYJV1ltGJ3HvPYADt79JkmHlZNqxnol3xUIi0FEvqk2x8X9dNQOIKgWM
	LE5PZKhUjS/nhmunSkl4VbZtXXVMmb0y0F8SGmefjNjI7uGnhhISO8fr/dlIo5r8QMx1iVBYzqvPM
	ct4xCdNd7ALP7ebAYoX+AOxZouSbmfFCdebvisSEm4ndvLfTM+Ps67gvN0t/uQ661l9IqegvC67gw
	IXdn5V+PDhd/4oKXZ2CA1b8HxlbEPMlK7RQ4U4AQCZF8MdTaLNUbQb/Nn106SMyxM4AZLIAu23je6
	O75qfykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilfY-0000000DNxe-3bD3;
	Fri, 14 Feb 2025 02:43:08 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til2l-0000000DFsk-42Z9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:03:05 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21f7f00c75eso29384435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 18:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739498582; x=1740103382; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pu+yCU8a3zHiD33i1SjhqECQAo1I4nsEwt4OD4Fy6ew=;
        b=bz1RzBg3JvGtABpZdSv4sM0wQYWBN76GOayl8YgWmeU/HTyJLc2f3p6qHg4LHCDXTV
         XT+B1o7x23R1hIKN5eT0ck+8Zg0vlGNLJOjA9amgUB7Y9+TW1wkviqKhZ/WoOS27ITf/
         bs7QUKfbIn2/HxUm/G9fTv5UfKFDbLOxP5C9DNNoRz2mIR+p/WONA4jzq2zkdcoxUxQA
         qvzh3CB7FhLi5UN/zyGIHlx8gFwUb87Cot6bEKR+wTsEpta6lMjMixm8Xbgokx6v21dM
         1nbsUQIw+ITrVUVaoalL7a/cBwozy77iHBAoOM4JWHSJUQBNRJ9N1JZRyAyajsztmEgu
         vZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739498582; x=1740103382;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pu+yCU8a3zHiD33i1SjhqECQAo1I4nsEwt4OD4Fy6ew=;
        b=V7JkiT9/DQ9UvVvCRQi83Hkymguq5icPS/3IBKgYx2wpChVP1Kyt1N1XtWxIoet0Zc
         KFWWLPRU+l4rth4FjwGhGGuLv5aE+JucLGubnf+MPzgCgjRx4d9uGTpUc8fbNhX7l6xT
         ZYqQbAGzMx9Mp7I1xYqgODHRy4oyaTWbOS8aRkN2PZFoHRdKcRiUvE17ATiF5n40YtI/
         bLABmB5ue9xlFqwTZUakHMSjOTl+MmLp7gZy82941lVWJi5EVM49ZSExLsGLvmZ2Fo3a
         O1aDp2jVdUQa9Cq3cqfjOO4TH0L350viNFjMEIwU0RXO0CaVzlGDPidrvly0+MzfPDfr
         P6+g==
X-Forwarded-Encrypted: i=1; AJvYcCXdKN3FBdTAVZB9MF2LXq3Ytlbe7WoXj2lLpx9AOTuqgQzXOcn9Hz4nvlpkgWk8JRJkNS4tS20emEFSG1SNdE6E@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5uINro01TBH3bHTJdSJc0/cVcPJsFcEQoKEeYsxVmYggFCkVD
	jnsRglVHBBL6P4+xDc/Junb3HpGxpYLmlQneDE8FAr3XzRUhYbqaVMs4A6PCz+LgOsAOpUapjSg
	c+FUIWk8w04nZYGuehv15tg==
X-Google-Smtp-Source: AGHT+IGDKMv9Ge+LtmxttXGfU0XRYxQrxU7yp68UK4PfQ4QF6cygJ52uXtFtg4A3ivblm2asbdQbQxNdGvLwybi7kA==
X-Received: from pgka3.prod.google.com ([2002:a63:e843:0:b0:ad5:4a28:559a])
 (user=jingzhangos job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a05:b0:1ed:8cd8:77fb with SMTP id adf61e73a8af0-1ee5c739d63mr14674047637.16.1739498582541;
 Thu, 13 Feb 2025 18:03:02 -0800 (PST)
Date: Thu, 13 Feb 2025 18:02:58 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250214020258.2436469-1-jingzhangos@google.com>
Subject: [PATCH v1] KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables
From: Jing Zhang <jingzhangos@google.com>
To: KVMARM <kvmarm@lists.linux.dev>, ARMLinux <linux-arm-kernel@lists.infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180304_023969_76571F67 
X-CRM114-Status: GOOD (  33.15  )
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

This commit introduces a debugfs interface to display the contents of the
VGIC Interrupt Translation Service (ITS) tables.

The ITS tables map Device/Event IDs to Interrupt IDs and target processors.
Exposing this information through debugfs allows for easier inspection and
debugging of the interrupt routing configuration.

The debugfs interface presents the ITS table data in a tabular format:

  Device ID: 0, Event ID Range: [0 - 65535]
  EVENT_ID    INTID  HWINTID   TARGET   COL_ID HW
  -----------------------------------------------
         0       32        0        0        0  0
         1       33        0        0        0  0
         2       34        0        0        0  0
       ...      ...      ...      ...      ... ..

The output is generated using the seq_file interface, allowing for efficient
handling of potentially large ITS tables.

This interface is read-only and does not allow modification of the ITS
tables. It is intended for debugging and informational purposes only.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
rfc -> v1:
 - Rebase on to v6.14-rc2.
 - Retained only the debugfs interface patch from the original RFC [1].

[1] https://lore.kernel.org/all/20250113193128.1533449-1-jingzhangos@google.com
---
 arch/arm64/kvm/Makefile              |   2 +-
 arch/arm64/kvm/vgic/vgic-its-debug.c | 234 +++++++++++++++++++++++++++
 arch/arm64/kvm/vgic/vgic-its.c       |  39 +----
 arch/arm64/kvm/vgic/vgic.h           |  33 ++++
 4 files changed, 276 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/kvm/vgic/vgic-its-debug.c

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 3cf7adb2b5038..b1e7b9c29589c 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -23,7 +23,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-v3.o vgic/vgic-v4.o \
 	 vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
-	 vgic/vgic-its.o vgic/vgic-debug.o
+	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-its-debug.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
diff --git a/arch/arm64/kvm/vgic/vgic-its-debug.c b/arch/arm64/kvm/vgic/vgic-its-debug.c
new file mode 100644
index 0000000000000..1ff0dd0137939
--- /dev/null
+++ b/arch/arm64/kvm/vgic/vgic-its-debug.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vgic-its-debug.c - Debugfs interface for exposing VGIC ITS tables.
+ *
+ * Copyright (C) 2025 Google
+ *
+ * This file provides a debugfs interface to display the contents of the
+ * VGIC Interrupt Translation Service (ITS) tables. This allows for
+ * inspection of the mapping between Event IDs, Interrupt IDs, and target
+ * processors. The information is presented in a tabular format through a
+ * seq_file interface.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/kvm_host.h>
+#include <linux/seq_file.h>
+#include <kvm/arm_vgic.h>
+#include "vgic.h"
+
+/**
+ * struct vgic_its_iter - Iterator for traversing VGIC ITS tables.
+ * @dev: Pointer to the current its_device being processed.
+ * @ite: Pointer to the current its_ite within the device being processed.
+ *
+ * This structure is used to maintain the current position during iteration
+ * over the ITS tables. It holds pointers to both the current device and the
+ * current ITE within that device.
+ */
+struct vgic_its_iter {
+	struct its_device *dev;
+	struct its_ite *ite;
+};
+
+/**
+ * end_of_iter - Checks if the iterator has reached the end of the ITS tables.
+ * @iter: The iterator to check.
+ *
+ * Return: True if the iterator is at the end, false otherwise.
+ */
+static inline bool end_of_iter(struct vgic_its_iter *iter)
+{
+	return !iter->dev && !iter->ite;
+}
+
+/**
+ * iter_next - Advances the iterator to the next entry in the ITS tables.
+ * @its: The VGIC ITS structure.
+ * @iter: The iterator to advance.
+ *
+ * This function moves the iterator to the next ITE within the current device,
+ * or to the first ITE of the next device if the current ITE is the last in
+ * the device. If the current device is the last device, the iterator is set
+ * to indicate the end of iteration.
+ */
+static void iter_next(struct vgic_its *its, struct vgic_its_iter *iter)
+{
+	struct its_device *dev = iter->dev;
+	struct its_ite *ite = iter->ite;
+
+	if (!ite || list_is_last(&ite->ite_list, &dev->itt_head)) {
+		if (list_is_last(&dev->dev_list, &its->device_list)) {
+			dev = NULL;
+			ite = NULL;
+		} else {
+			dev = list_next_entry(dev, dev_list);
+			ite = list_first_entry_or_null(&dev->itt_head,
+						       struct its_ite,
+						       ite_list);
+		}
+	} else {
+		ite = list_next_entry(ite, ite_list);
+	}
+
+	iter->dev = dev;
+	iter->ite = ite;
+}
+
+/**
+ * vgic_its_debug_start - Start function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @pos: The starting position (offset).
+ *
+ * This function initializes the iterator to the beginning of the ITS tables
+ * and advances it to the specified position. It acquires the its_lock mutex
+ * to protect shared data.
+ *
+ * Return: An iterator pointer on success, NULL if no devices are found or
+ *         the end of the list is reached, or ERR_PTR(-ENOMEM) on memory
+ *         allocation failure.
+ */
+static void *vgic_its_debug_start(struct seq_file *s, loff_t *pos)
+{
+	struct vgic_its *its = s->private;
+	struct vgic_its_iter *iter;
+	struct its_device *dev;
+	loff_t offset = *pos;
+
+	mutex_lock(&its->its_lock);
+
+	dev = list_first_entry_or_null(&its->device_list,
+				       struct its_device, dev_list);
+	if (!dev)
+		return NULL;
+
+	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
+	if (!iter)
+		return ERR_PTR(-ENOMEM);
+
+	iter->dev = dev;
+	iter->ite = list_first_entry_or_null(&dev->itt_head,
+					     struct its_ite, ite_list);
+
+	while (!end_of_iter(iter) && offset--)
+		iter_next(its, iter);
+
+	if (end_of_iter(iter)) {
+		kfree(iter);
+		return NULL;
+	}
+
+	return iter;
+}
+
+/**
+ * vgic_its_debug_next - Next function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @v: The current iterator.
+ * @pos: The current position (offset).
+ *
+ * This function advances the iterator to the next entry and increments the
+ * position.
+ *
+ * Return: An iterator pointer on success, or NULL if the end of the list is
+ *         reached.
+ */
+static void *vgic_its_debug_next(struct seq_file *s, void *v, loff_t *pos)
+{
+	struct vgic_its *its = s->private;
+	struct vgic_its_iter *iter = v;
+
+	++*pos;
+	iter_next(its, iter);
+
+	if (end_of_iter(iter)) {
+		kfree(iter);
+		return NULL;
+	}
+	return iter;
+}
+
+/**
+ * vgic_its_debug_stop - Stop function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @v: The current iterator.
+ *
+ * This function frees the iterator and releases the its_lock mutex.
+ */
+static void vgic_its_debug_stop(struct seq_file *s, void *v)
+{
+	struct vgic_its *its = s->private;
+	struct vgic_its_iter *iter = v;
+
+	if (!IS_ERR_OR_NULL(iter))
+		kfree(iter);
+	mutex_unlock(&its->its_lock);
+}
+
+/**
+ * vgic_its_debug_show - Show function for the seq_file interface.
+ * @s: The seq_file structure.
+ * @v: The current iterator.
+ *
+ * This function formats and prints the ITS table entry information to the
+ * seq_file output.
+ *
+ * Return: 0 on success.
+ */
+static int vgic_its_debug_show(struct seq_file *s, void *v)
+{
+	struct vgic_its_iter *iter = v;
+	struct its_device *dev = iter->dev;
+	struct its_ite *ite = iter->ite;
+
+	if (list_is_first(&ite->ite_list, &dev->itt_head)) {
+		seq_printf(s, "\n");
+		seq_printf(s, "Device ID: %u, Event ID Range: [0 - %llu]\n",
+			   dev->device_id, BIT_ULL(dev->num_eventid_bits) - 1);
+		seq_printf(s, "EVENT_ID    INTID  HWINTID   TARGET   COL_ID HW\n");
+		seq_printf(s, "-----------------------------------------------\n");
+	}
+
+	if (ite && ite->irq && ite->collection) {
+		seq_printf(s, "%8u %8u %8u %8u %8u %2d\n",
+			   ite->event_id, ite->irq->intid, ite->irq->hwintid,
+			   ite->collection->target_addr,
+			   ite->collection->collection_id, ite->irq->hw);
+	}
+
+	return 0;
+}
+
+static const struct seq_operations vgic_its_debug_sops = {
+	.start = vgic_its_debug_start,
+	.next  = vgic_its_debug_next,
+	.stop  = vgic_its_debug_stop,
+	.show  = vgic_its_debug_show
+};
+
+DEFINE_SEQ_ATTRIBUTE(vgic_its_debug);
+
+/**
+ * vgic_its_debug_init - Initializes the debugfs interface for VGIC ITS.
+ * @dev: The KVM device structure.
+ *
+ * This function creates a debugfs file named "vgic-its-state@%its_base"
+ * to expose the ITS table information.
+ *
+ * Return: 0 on success.
+ */
+int vgic_its_debug_init(struct kvm_device *dev)
+{
+	struct vgic_its *its = dev->private;
+	char name[32];
+
+	snprintf(name, sizeof(name), "vgic-its-state@%llx", (u64)its->vgic_its_base);
+	debugfs_create_file(name, 0444, dev->kvm->debugfs_dentry, its, &vgic_its_debug_fops);
+
+	return 0;
+}
+
+void vgic_its_debug_destroy(struct kvm_device *dev)
+{
+}
+
diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index fb96802799c6f..569f9da9049fe 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -154,36 +154,6 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
 	return irq;
 }
 
-struct its_device {
-	struct list_head dev_list;
-
-	/* the head for the list of ITTEs */
-	struct list_head itt_head;
-	u32 num_eventid_bits;
-	gpa_t itt_addr;
-	u32 device_id;
-};
-
-#define COLLECTION_NOT_MAPPED ((u32)~0)
-
-struct its_collection {
-	struct list_head coll_list;
-
-	u32 collection_id;
-	u32 target_addr;
-};
-
-#define its_is_collection_mapped(coll) ((coll) && \
-				((coll)->target_addr != COLLECTION_NOT_MAPPED))
-
-struct its_ite {
-	struct list_head ite_list;
-
-	struct vgic_irq *irq;
-	struct its_collection *collection;
-	u32 event_id;
-};
-
 /**
  * struct vgic_its_abi - ITS abi ops and settings
  * @cte_esz: collection table entry size
@@ -1938,6 +1908,8 @@ static void vgic_its_destroy(struct kvm_device *kvm_dev)
 
 	mutex_lock(&its->its_lock);
 
+	vgic_its_debug_destroy(kvm_dev);
+
 	vgic_its_free_device_list(kvm, its);
 	vgic_its_free_collection_list(kvm, its);
 	vgic_its_invalidate_cache(its);
@@ -2771,7 +2743,12 @@ static int vgic_its_set_attr(struct kvm_device *dev,
 		if (ret)
 			return ret;
 
-		return vgic_register_its_iodev(dev->kvm, its, addr);
+		ret = vgic_register_its_iodev(dev->kvm, its, addr);
+		if (ret)
+			return ret;
+
+		return vgic_its_debug_init(dev);
+
 	}
 	case KVM_DEV_ARM_VGIC_GRP_CTRL:
 		return vgic_its_ctrl(dev->kvm, its, attr->attr);
diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index 122d95b4e2845..c2891d7b5e62e 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -172,6 +172,36 @@ struct vgic_reg_attr {
 	gpa_t addr;
 };
 
+struct its_device {
+	struct list_head dev_list;
+
+	/* the head for the list of ITTEs */
+	struct list_head itt_head;
+	u32 num_eventid_bits;
+	gpa_t itt_addr;
+	u32 device_id;
+};
+
+#define COLLECTION_NOT_MAPPED ((u32)~0)
+
+struct its_collection {
+	struct list_head coll_list;
+
+	u32 collection_id;
+	u32 target_addr;
+};
+
+#define its_is_collection_mapped(coll) ((coll) && \
+				((coll)->target_addr != COLLECTION_NOT_MAPPED))
+
+struct its_ite {
+	struct list_head ite_list;
+
+	struct vgic_irq *irq;
+	struct its_collection *collection;
+	u32 event_id;
+};
+
 int vgic_v3_parse_attr(struct kvm_device *dev, struct kvm_device_attr *attr,
 		       struct vgic_reg_attr *reg_attr);
 int vgic_v2_parse_attr(struct kvm_device *dev, struct kvm_device_attr *attr,
@@ -353,4 +383,7 @@ static inline bool kvm_has_gicv3(struct kvm *kvm)
 	return kvm_has_feat(kvm, ID_AA64PFR0_EL1, GIC, IMP);
 }
 
+int vgic_its_debug_init(struct kvm_device *dev);
+void vgic_its_debug_destroy(struct kvm_device *dev);
+
 #endif

base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.48.1.601.g30ceb7b040-goog


