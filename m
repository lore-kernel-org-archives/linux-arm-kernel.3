Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B77C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TggLMT3+F7itwf+DvlzlyHIk418MFet76SpTzoneX04=; b=DJ27aBXJe2qxz82+HdwGvi1Bgq
	B7cYcDl2AlylIk5UzOUijREIL02WIkudn6t2zBqb1zZgrUMiwo/nXVFtUREFqVWBcz4ezCnuJYIgy
	15Vo378hppRRZlttj+531XEx28DG4OcfJ5NAz7DJiU9xCDSjRUJaNcAiErIVSxXwI9fUDzJ5wz00F
	vhtBaZgrx+ACwULldiZeIHQt1qukRzJ4xzRTqnBd0jNLRNOUfz/u8WXeyU598SNamF34J6uUzKq+9
	SfSq7Ir3We536gSYWx7NxbvKhfAgZbHMxxLRk6KE3sqSCSagjj3Bok25RrmYe3Fg3SFzxBqXiEjSh
	9WcGia3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrr-00000009ZRb-2KPN;
	Wed, 25 Jun 2025 18:29:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR66-00000008y0v-2t0Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:27:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C2B1113E;
	Wed, 25 Jun 2025 07:27:16 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5889D3F66E;
	Wed, 25 Jun 2025 07:27:32 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Chao Gao <chao.gao@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Salman Nabi <salman.nabi@arm.com>
Subject: [RFC PATCH 1/1] firmware: smccc: Add support for Live Firmware Activation (LFA)
Date: Wed, 25 Jun 2025 15:27:22 +0100
Message-Id: <20250625142722.1911172-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625142722.1911172-1-andre.przywara@arm.com>
References: <20250625142722.1911172-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072734_814704_3F5D0EBA 
X-CRM114-Status: GOOD (  29.83  )
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

From: Salman Nabi <salman.nabi@arm.com>

The Arm Live Firmware Activation (LFA) is a specification [1] to describe
activating firmware components without a reboot. Those components
(like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
usual way: via fwupd, FF-A or other secure storage methods, or via some
IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
at system runtime, without requiring a reboot.
The specification covers the SMCCC interface to list and query available
components and eventually trigger the activation.

Add a new directory under /sys/firmware to present firmware components
capable of live activation. Each of them is a directory under lfa/,
and is identified via its GUID. The activation will be triggered by echoing
"1" into the "activate" file:
==========================================
/sys/firmware/lfa # ls -l . 6c*
.:
total 0
drwxr-xr-x    2 0 0         0 May 30 13:31 47d4086d-4cfe-9846-9b95-2950cbbd5a00
drwxr-xr-x    2 0 0         0 May 30 13:31 6c0762a6-12f2-4b56-92cb-ba8f633606d9
drwxr-xr-x    2 0 0         0 May 30 13:31 d6d0eea7-fcea-d54b-9782-9934f234b6e4

6c0762a6-12f2-4b56-92cb-ba8f633606d9:
total 0
--w-------    1 0        0             4096 May 30 13:31 activate
-r--r--r--    1 0        0             4096 May 30 13:31 activation_capable
-r--r--r--    1 0        0             4096 May 30 13:31 activation_pending
--w-------    1 0        0             4096 May 30 13:31 cancel
-r--r--r--    1 0        0             4096 May 30 13:31 cpu_rendezvous
-r--r--r--    1 0        0             4096 May 30 13:31 may_reset_cpu
-r--r--r--    1 0        0             4096 May 30 13:31 name
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
grep: activate: Permission denied
activation_capable:1
activation_pending:1
grep: cancel: Permission denied
cpu_rendezvous:1
may_reset_cpu:0
name:rmm
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
[ 2825.797871] Arm LFA: firmware activation succeeded.
/sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
==========================================

[1] https://developer.arm.com/documentation/den0147/latest/

Signed-off-by: Salman Nabi <salman.nabi@arm.com>
[Andre: add actual activation routine, cleanups]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/Kconfig  |   7 +
 drivers/firmware/smccc/Makefile |   1 +
 drivers/firmware/smccc/lfa_fw.c | 411 ++++++++++++++++++++++++++++++++
 3 files changed, 419 insertions(+)
 create mode 100644 drivers/firmware/smccc/lfa_fw.c

diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
index 15e7466179a62..48b98c14f7700 100644
--- a/drivers/firmware/smccc/Kconfig
+++ b/drivers/firmware/smccc/Kconfig
@@ -23,3 +23,10 @@ config ARM_SMCCC_SOC_ID
 	help
 	  Include support for the SoC bus on the ARM SMCCC firmware based
 	  platforms providing some sysfs information about the SoC variant.
+
+config ARM_LFA
+	tristate "Arm Live Firmware activation support"
+	depends on HAVE_ARM_SMCCC_DISCOVERY
+	help
+	  Include support for triggering Live Firmware Activation, which
+	  allows to upgrade certain firmware components without a reboot.
diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
index 40d19144a8607..a6dd01558a94a 100644
--- a/drivers/firmware/smccc/Makefile
+++ b/drivers/firmware/smccc/Makefile
@@ -2,3 +2,4 @@
 #
 obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
 obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
+obj-$(CONFIG_ARM_LFA) += lfa_fw.o
diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
new file mode 100644
index 0000000000000..4eecd33ff95a2
--- /dev/null
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -0,0 +1,411 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Arm Limited
+ */
+
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/stop_machine.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/arm-smccc.h>
+#include <linux/psci.h>
+#include <uapi/linux/psci.h>
+#include <linux/uuid.h>
+#include <linux/array_size.h>
+
+/* LFA v1.0b0 specification */
+#define LFA_1_0_FN_BASE			0xc40002e0
+#define LFA_1_0_FN(n)			(LFA_1_0_FN_BASE + (n))
+
+#define LFA_1_0_FN_GET_VERSION		LFA_1_0_FN(0)
+#define LFA_1_0_FN_CHECK_FEATURE	LFA_1_0_FN(1)
+#define LFA_1_0_FN_GET_INFO		LFA_1_0_FN(2)
+#define LFA_1_0_FN_GET_INVENTORY	LFA_1_0_FN(3)
+#define LFA_1_0_FN_PRIME		LFA_1_0_FN(4)
+#define LFA_1_0_FN_ACTIVATE		LFA_1_0_FN(5)
+#define LFA_1_0_FN_CANCEL		LFA_1_0_FN(6)
+
+/* LFA return values */
+#define LFA_SUCCESS			0
+#define LFA_NOT_SUPPORTED		-1
+#define LFA_BUSY			-2
+#define LFA_AUTH_ERROR			-3
+#define LFA_NO_MEMORY			-4
+#define LFA_CRITICAL_ERROR		-5
+#define LFA_DEVICE_ERROR		-6
+#define LFA_WRONG_STATE			-7
+#define LFA_INVALID_PARAMETERS		-8
+#define LFA_COMPONENT_WRONG_STATE	-9
+#define LFA_INVALID_ADDRESS		-10
+#define LFA_ACTIVATION_FAILED		-11
+
+enum image_attr_names {
+	LFA_ATTR_NAME,
+	LFA_ATTR_ACT_CAPABLE,
+	LFA_ATTR_ACT_PENDING,
+	LFA_ATTR_MAY_RESET_CPU,
+	LFA_ATTR_CPU_RENDEZVOUS,
+	LFA_ATTR_ACTIVATE,
+	LFA_ATTR_CANCEL,
+	LFA_ATTR_NR_IMAGES
+};
+
+static struct image_props {
+	const char *image_name;
+	int fw_seq_id;
+	int activation_capable;
+	int activation_pending;
+	int may_reset_cpu;
+	int cpu_rendezvous;
+	struct kobject *image_dir;
+	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
+} *lfa_fw_images;
+
+/* A UUID split over two 64-bit registers */
+struct uuid_regs {
+	u64 uuid_lo;
+	u64 uuid_hi;
+};
+
+static const struct fw_image_uuid {
+	const char *name;
+	const char *uuid;
+} fw_images_uuids[] = {
+	{
+		.name = "BL31 runtime",
+		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
+	},
+	{
+		.name = "BL33 non-secure payload",
+		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
+	},
+	{
+		.name = "RMM",
+		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
+	},
+};
+
+static struct kobject *lfa_dir;
+static long num_of_components;
+
+static int get_nr_lfa_components(void)
+{
+	struct arm_smccc_res res = { 0 };
+
+	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INFO, 0x0, &res);
+	if (res.a0 != LFA_SUCCESS)
+		return res.a0;
+
+	return res.a1;
+}
+
+static int call_lfa_activate(void *data)
+{
+	struct image_props *attrs = data;
+	struct arm_smccc_res res = { 0 };
+
+	do {
+		/*
+		 * As we do not support updates requiring a CPU reset (yet),
+		 * we pass 0 in x2 and x3, holding the entry point and context
+		 * ID.
+		 */
+		arm_smccc_1_1_invoke(LFA_1_0_FN_ACTIVATE, attrs->fw_seq_id,
+				     0, 0, 0, &res);
+	} while (res.a0 == 0 && res.a1 == 1);
+
+	return res.a0;
+}
+
+static int activate_fw_image(struct image_props *attrs, int cpu_rendezvous)
+{
+	struct arm_smccc_res res = { 0 };
+	int ret;
+
+	/*
+	 * LFA_PRIME/ACTIVATE will return 1 in res.a1 if the firmware
+	 * priming/activation is still in progress. In that case
+	 * LFA_PRIME/ACTIVATE will need to be called again.
+	 * res.a1 will become 0 once the prime/activate process completes.
+	 */
+	do {
+		arm_smccc_1_1_invoke(LFA_1_0_FN_PRIME, attrs->fw_seq_id, &res);
+		if (res.a0 != LFA_SUCCESS) {
+			pr_err("LFA_PRIME failed: %ld\n", (long)res.a0);
+
+			return -EIO;
+		}
+	} while (res.a1 == 1);
+
+	if (cpu_rendezvous)
+		ret = stop_machine(call_lfa_activate, attrs, cpu_online_mask);
+	else
+		ret = call_lfa_activate(attrs);
+
+	return ret;
+}
+
+static void update_image_flags(int seq_id)
+{
+	struct image_props *attrs = &lfa_fw_images[seq_id];
+	struct arm_smccc_res res = { 0 };
+
+	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INVENTORY, seq_id, &res);
+	if (res.a0 == LFA_SUCCESS) {
+		attrs->activation_capable = !!(res.a3 & BIT(0));
+		attrs->activation_pending = !!(res.a3 & BIT(1));
+		attrs->may_reset_cpu = !!(res.a3 & BIT(2));
+		/* cpu_rendezvous_optional uses inverse logic in the spec */
+		attrs->cpu_rendezvous = !(res.a3 & BIT(3));
+	}
+}
+
+static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct image_props *attrs = container_of(attr, struct image_props,
+						 image_attrs[LFA_ATTR_NAME]);
+
+	return sysfs_emit(buf, "%s\n", attrs->image_name);
+}
+
+static ssize_t activation_capable_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct image_props *attrs = container_of(attr, struct image_props,
+						 image_attrs[LFA_ATTR_ACT_CAPABLE]);
+
+	return sysfs_emit(buf, "%d\n", attrs->activation_capable);
+}
+
+static ssize_t activation_pending_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	struct image_props *attrs = container_of(attr, struct image_props,
+						 image_attrs[LFA_ATTR_ACT_PENDING]);
+
+	/*
+	 * Activation pending status can change anytime thus we need to update
+	 * and return its current value
+	 */
+	update_image_flags(attrs->fw_seq_id);
+
+	return sysfs_emit(buf, "%d\n", attrs->activation_pending);
+}
+
+static ssize_t may_reset_cpu_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct image_props *attrs = container_of(attr, struct image_props,
+						 image_attrs[LFA_ATTR_MAY_RESET_CPU]);
+
+	return sysfs_emit(buf, "%d\n", attrs->may_reset_cpu);
+}
+
+static ssize_t cpu_rendezvous_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	struct image_props *attrs = container_of(attr, struct image_props,
+						 image_attrs[LFA_ATTR_CPU_RENDEZVOUS]);
+
+	return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous);
+}
+
+/* TODO: Properly refresh the list of firmware images. */
+static void refresh_firmware_components(void)
+{
+	for (int i = 0; i < num_of_components; i++)
+		update_image_flags(i);
+}
+
+static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct image_props *attrs = container_of(attr, struct image_props,
+						 image_attrs[LFA_ATTR_ACTIVATE]);
+	int ret;
+
+	if (attrs->may_reset_cpu) {
+		pr_err("Arm LFA: Firmware component requires unsupported CPU reset\n");
+
+		return -EINVAL;
+	}
+
+	/*
+	 * For now we always force a CPU rendezvous, even when it's not
+	 * strictly required, as we cannot guarantee that the kernel won't
+	 * use any firmware services during the activation process.
+	 */
+	ret = activate_fw_image(attrs, true);
+	if (ret) {
+		pr_err("Arm LFA: Firmware activation failed: %d\n", ret);
+
+		return -EIO;
+	}
+
+	pr_info("Arm LFA: Firmware activation succeeded\n");
+
+	refresh_firmware_components();
+	return count;
+}
+
+static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct image_props *attrs = container_of(attr, struct image_props,
+						 image_attrs[LFA_ATTR_CANCEL]);
+	struct arm_smccc_res res = { 0 };
+
+	arm_smccc_1_1_invoke(LFA_1_0_FN_CANCEL, attrs->fw_seq_id, &res);
+
+	/*
+	 * When firmware activation is called with "skip_cpu_rendezvous=1",
+	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
+	 * cancelled.
+	 */
+	if (res.a0 == LFA_SUCCESS) {
+		pr_info("Arm LFA: Activation cancelled for image %s\n",
+			attrs->image_name);
+	} else {
+		pr_err("Arm LFA: Firmware activation could not be cancelled: %ld\n",
+		       (long)res.a0);
+		return -EIO;
+	}
+
+	return count;
+}
+
+static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
+	[LFA_ATTR_NAME]			= __ATTR_RO(name),
+	[LFA_ATTR_ACT_CAPABLE]		= __ATTR_RO(activation_capable),
+	[LFA_ATTR_ACT_PENDING]		= __ATTR_RO(activation_pending),
+	[LFA_ATTR_MAY_RESET_CPU]	= __ATTR_RO(may_reset_cpu),
+	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
+	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
+	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
+};
+
+static void clean_fw_images_tree(void)
+{
+	for (int i = 0; i < num_of_components; i++)
+		kobject_put(lfa_fw_images[i].image_dir);
+
+	kfree(lfa_fw_images);
+}
+
+static int create_fw_inventory(char *fw_uuid, int seq_id, int bit_fields)
+{
+	struct image_props *attrs = &lfa_fw_images[seq_id];
+	const char *image_name = "(unknown)";
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
+		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
+			image_name = fw_images_uuids[i].name;
+	}
+
+	attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
+	if (!attrs->image_dir)
+		return -ENOMEM;
+
+	attrs->image_name = image_name;
+	attrs->fw_seq_id = seq_id;
+	attrs->activation_capable = !!(bit_fields & BIT(0));
+	attrs->activation_pending = !!(bit_fields & BIT(1));
+	attrs->may_reset_cpu = !!(bit_fields & BIT(2));
+	/* cpu_rendezvous_optional uses inverse logic in the spec */
+	attrs->cpu_rendezvous = !(bit_fields & BIT(3));
+
+	/*
+	 * The attributes for each sysfs file are constant (handler functions,
+	 * name and permissions are the same within each directory), but we
+	 * need a per-directory copy regardless, to get a unique handle
+	 * for each directory, so that container_of can do its magic.
+	 * Also this requires an explicit sysfs_attr_init(), since it's a new
+	 * copy, to make LOCKDEP happy.
+	 */
+	memcpy(attrs->image_attrs, image_attrs_group,
+	       sizeof(attrs->image_attrs));
+	for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++) {
+		struct attribute *attr = &attrs->image_attrs[i].attr;
+
+		sysfs_attr_init(attr);
+		ret = sysfs_create_file(attrs->image_dir, attr);
+		if (ret) {
+			pr_err("Arm LFA: creating sysfs file for uuid %s: %d\n",
+			       fw_uuid, ret);
+			clean_fw_images_tree();
+
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int create_fw_images_tree(void)
+{
+	struct arm_smccc_res res = { 0 };
+	struct uuid_regs image_uuid;
+	char image_id_str[40];
+	int ret;
+
+	lfa_fw_images = kcalloc(num_of_components,
+				sizeof(*lfa_fw_images), GFP_KERNEL);
+
+	for (int i = 0; i < num_of_components; i++) {
+		arm_smccc_1_1_invoke(LFA_1_0_FN_GET_INVENTORY, i, &res);
+		if (res.a0 == LFA_SUCCESS) {
+			image_uuid.uuid_lo = res.a1;
+			image_uuid.uuid_hi = res.a2;
+
+			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
+				 &image_uuid);
+			ret = create_fw_inventory(image_id_str, i, res.a3);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int __init lfa_init(void)
+{
+	struct arm_smccc_res res = { 0 };
+	int err;
+
+	arm_smccc_1_1_invoke(LFA_1_0_FN_GET_VERSION, &res);
+	if (res.a0 == LFA_NOT_SUPPORTED) {
+		pr_err("Arm Live Firmware activation(LFA): no firmware agent found\n");
+		return -ENODEV;
+	}
+
+	pr_info("Arm Live Firmware Activation (LFA): detected v%ld.%ld\n",
+		res.a0 >> 16, res.a0 & 0xffff);
+	num_of_components = get_nr_lfa_components();
+
+	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
+	if (!lfa_dir)
+		return -ENOMEM;
+
+	err = create_fw_images_tree();
+	if (err != 0)
+		kobject_put(lfa_dir);
+
+	return err;
+}
+module_init(lfa_init);
+
+static void __exit lfa_exit(void)
+{
+	clean_fw_images_tree();
+	kobject_put(lfa_dir);
+}
+module_exit(lfa_exit);
+
+MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
+MODULE_LICENSE("GPL");
-- 
2.25.1


