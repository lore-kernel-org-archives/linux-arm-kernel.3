Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1BACD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uxivZrj2/t8sbrW9mdJoZ9CAU5lPMxafXV5wRYUamE=; b=E+gQ4N6NaIJVuVJQWzePlJ0Bge
	2qOtccmtTxUuhkaKIttgwoAdLbHt9+LDirj7JoUq4KTquDog0EnFOSdj7S120erWRlh2DtrJcc80w
	eXSOJzUruaAYg32lH40It1EMFwmmW2aOZIDlcPRKpczE5N3hI9a3EgUG6iyyF2/NYsqE44SN5xdYR
	3Ioo8p2FaLsRewgLM5yc5mHAJAfQYIT6R/jsX8ISujubFGB4VwtgRm7TMnmqm3ISTGFZi8xJ6boWU
	GIv2wVc/kBOCBa/tvMlN2l8aQS2yq4a8XcIeCSrnKc0GiAsGjL76Igu1ZWdfh8KWBt7GMZc8rgjg0
	6/Ic00Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB6F-00000003ha9-2IbE;
	Wed, 27 May 2026 10:02:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB6C-00000003hYr-1I49
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:02:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 796BA600B0;
	Wed, 27 May 2026 10:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63911F000E9;
	Wed, 27 May 2026 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779876171;
	bh=3uxivZrj2/t8sbrW9mdJoZ9CAU5lPMxafXV5wRYUamE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kU0m3y1S1LD1hmX0JboaPc9LoPL+4EZMEiGvoau1C360oqYGFmfxpuwS5aYYd4+vo
	 6+zVUzLC+Cn5BG7EmFLB7w8ztsrVz3+7nFtgYZBoaqTH8DDAc4SxIPexxi9gbOuMmY
	 etb0KW/y7QpmVffstCEbblnb18udsQU9sjZ039DHGDkBD/ANdA/Z+gk6+v2i+R6pF7
	 mCV7XrcVlklIn7OKWLfXms1hFGiE57jmzqHX9hKu7gO1a3kfyVnbkH5diij8use44I
	 8L/QW4qllFbVQp16QbjtN/Fj1bOcMwSynUsWXPpnI5n/66kvLp6KeMt62pMLmqlR+L
	 4fvTfcQ0kRGrg==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: [PATCH v6 1/4] firmware: smccc: Add an Arm SMCCC bus
Date: Wed, 27 May 2026 15:32:30 +0530
Message-ID: <20260527100233.428018-2-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527100233.428018-1-aneesh.kumar@kernel.org>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

SMCCC-discovered firmware services are currently represented by separate
platform devices, such as smccc_trng and arm-cca-dev. Those devices do not
represent independent DT/ACPI-described platform resources; they are
features of the SMCCC firmware interface.

Add an Arm SMCCC bus for services discovered through the SMCCC firmware
interface. The bus provides SMCCC device and driver registration helpers,
name-based matching, modalias generation, and a sysfs modalias attribute so
SMCCC service drivers can bind to discovered firmware services and autoload
as modules.

Follow-up changes can then register SMCCC firmware services as arm-smccc
devices instead of creating independent per-feature platform devices.

Based on arm_ffa code

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 drivers/firmware/smccc/smccc.c    | 158 ++++++++++++++++++++++++++++++
 include/linux/arm-smccc-bus.h     |  49 +++++++++
 include/linux/mod_devicetable.h   |  13 +++
 scripts/mod/devicetable-offsets.c |   3 +
 scripts/mod/file2alias.c          |   8 ++
 5 files changed, 231 insertions(+)
 create mode 100644 include/linux/arm-smccc-bus.h

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index bdee057db2fd..695c920a8087 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -10,10 +10,15 @@
 #include <linux/arm-smccc.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/idr.h>
+#include <linux/slab.h>
+
 #include <asm/archrandom.h>
 
 static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
 static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
+static DEFINE_IDA(arm_smccc_bus_id);
 
 bool __ro_after_init smccc_trng_available = false;
 s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
@@ -81,6 +86,159 @@ bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
 }
 EXPORT_SYMBOL_GPL(arm_smccc_hypervisor_has_uuid);
 
+static int arm_smccc_bus_match(struct device *dev,
+		const struct device_driver *drv)
+{
+	const struct arm_smccc_device_id *id_table;
+	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	id_table = to_arm_smccc_driver(drv)->id_table;
+	if (!id_table)
+		return 0;
+
+	while (id_table->name[0]) {
+		if (!strcmp(smccc_dev->name, id_table->name))
+			return 1;
+		id_table++;
+	}
+
+	return 0;
+}
+
+static int arm_smccc_bus_probe(struct device *dev)
+{
+	struct arm_smccc_driver *smccc_drv = to_arm_smccc_driver(dev->driver);
+
+	return smccc_drv->probe(to_arm_smccc_device(dev));
+}
+
+static void arm_smccc_bus_remove(struct device *dev)
+{
+	struct arm_smccc_driver *smcc_drv = to_arm_smccc_driver(dev->driver);
+
+	if (smcc_drv->remove)
+		smcc_drv->remove(to_arm_smccc_device(dev));
+}
+
+static int arm_smccc_bus_uevent(const struct device *dev,
+		struct kobj_uevent_env *env)
+{
+	const struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	return add_uevent_var(env, "MODALIAS=" ARM_SMCCC_MODULE_PREFIX "%s",
+			      smccc_dev->name);
+}
+
+static ssize_t modalias_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	return sysfs_emit(buf, ARM_SMCCC_MODULE_PREFIX "%s\n", smccc_dev->name);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *arm_smccc_device_attrs[] = {
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(arm_smccc_device);
+
+const struct bus_type arm_smccc_bus_type = {
+	.name = "arm_smccc",
+	.match = arm_smccc_bus_match,
+	.probe = arm_smccc_bus_probe,
+	.remove = arm_smccc_bus_remove,
+	.uevent = arm_smccc_bus_uevent,
+	.dev_groups = arm_smccc_device_groups,
+};
+EXPORT_SYMBOL_GPL(arm_smccc_bus_type);
+
+int arm_smccc_driver_register(struct arm_smccc_driver *driver,
+		struct module *owner, const char *mod_name)
+{
+	if (!driver->probe)
+		return -EINVAL;
+
+	driver->driver.bus = &arm_smccc_bus_type;
+	driver->driver.name = driver->name;
+	driver->driver.owner = owner;
+	driver->driver.mod_name = mod_name;
+
+	return driver_register(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(arm_smccc_driver_register);
+
+void arm_smccc_driver_unregister(struct arm_smccc_driver *driver)
+{
+	driver_unregister(&driver->driver);
+}
+EXPORT_SYMBOL_GPL(arm_smccc_driver_unregister);
+
+static void arm_smccc_release_device(struct device *dev)
+{
+	struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+
+	ida_free(&arm_smccc_bus_id, smccc_dev->id);
+	kfree(smccc_dev);
+}
+
+struct arm_smccc_device *arm_smccc_device_register(const char *name)
+{
+	struct arm_smccc_device *smccc_dev;
+	int id, ret;
+
+	id = ida_alloc_min(&arm_smccc_bus_id, 1, GFP_KERNEL);
+	if (id < 0)
+		return ERR_PTR(id);
+
+	smccc_dev = kzalloc_obj(*smccc_dev);
+	if (!smccc_dev) {
+		ida_free(&arm_smccc_bus_id, id);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	smccc_dev->id = id;
+	if (strscpy(smccc_dev->name, name) < 0) {
+		kfree(smccc_dev);
+		ida_free(&arm_smccc_bus_id, id);
+		return ERR_PTR(-EINVAL);
+	}
+	smccc_dev->dev.bus = &arm_smccc_bus_type;
+	smccc_dev->dev.release = arm_smccc_release_device;
+
+	ret = dev_set_name(&smccc_dev->dev, "%s-%d", smccc_dev->name, id);
+	if (ret) {
+		kfree(smccc_dev);
+		ida_free(&arm_smccc_bus_id, id);
+		return ERR_PTR(ret);
+	}
+
+	ret = device_register(&smccc_dev->dev);
+	if (ret) {
+		put_device(&smccc_dev->dev);
+		return ERR_PTR(ret);
+	}
+
+	return smccc_dev;
+}
+EXPORT_SYMBOL_GPL(arm_smccc_device_register);
+
+void arm_smccc_device_unregister(struct arm_smccc_device *smccc_dev)
+{
+	if (!smccc_dev)
+		return;
+
+	device_unregister(&smccc_dev->dev);
+}
+EXPORT_SYMBOL_GPL(arm_smccc_device_unregister);
+
+static int __init arm_smccc_bus_init(void)
+{
+	return bus_register(&arm_smccc_bus_type);
+}
+subsys_initcall(arm_smccc_bus_init);
+
 static int __init smccc_devices_init(void)
 {
 	struct platform_device *pdev;
diff --git a/include/linux/arm-smccc-bus.h b/include/linux/arm-smccc-bus.h
new file mode 100644
index 000000000000..188891441e57
--- /dev/null
+++ b/include/linux/arm-smccc-bus.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Arm Limited
+ */
+#ifndef __LINUX_ARM_SMCCC_BUS_H
+#define __LINUX_ARM_SMCCC_BUS_H
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+struct arm_smccc_device {
+	int id;
+	char name[ARM_SMCCC_NAME_SIZE];
+	struct device dev;
+};
+
+#define to_arm_smccc_device(d) container_of(d, struct arm_smccc_device, dev)
+
+struct arm_smccc_driver {
+	const char *name;
+	int (*probe)(struct arm_smccc_device *sdev);
+	void (*remove)(struct arm_smccc_device *sdev);
+	const struct arm_smccc_device_id *id_table;
+
+	struct device_driver driver;
+};
+
+#define to_arm_smccc_driver(d) \
+	container_of_const(d, struct arm_smccc_driver, driver)
+
+int arm_smccc_driver_register(struct arm_smccc_driver *driver,
+		struct module *owner, const char *mod_name);
+void arm_smccc_driver_unregister(struct arm_smccc_driver *driver);
+struct arm_smccc_device *arm_smccc_device_register(const char *name);
+void arm_smccc_device_unregister(struct arm_smccc_device *smcc_dev);
+
+#define arm_smccc_register(driver) \
+	arm_smccc_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
+#define arm_smccc_unregister(driver) \
+	arm_smccc_driver_unregister(driver)
+
+#define module_arm_smccc_driver(__arm_smccc_driver) \
+	module_driver(__arm_smccc_driver, arm_smccc_register, \
+		      arm_smccc_unregister)
+
+extern const struct bus_type arm_smccc_bus_type;
+
+#endif /* __LINUX_ARM_SMCCC_BUS_H */
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 23ff24080dfd..c9cee8c5a0b2 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -876,6 +876,19 @@ struct auxiliary_device_id {
 	kernel_ulong_t driver_data;
 };
 
+#define ARM_SMCCC_NAME_SIZE 40
+#define ARM_SMCCC_MODULE_PREFIX "arm_smccc:"
+
+/**
+ * struct arm_smccc_device_id - Arm SMCCC bus device identifier
+ * @name: SMCCC device name
+ * @driver_data: driver data
+ */
+struct arm_smccc_device_id {
+	char name[ARM_SMCCC_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
 /* Surface System Aggregator Module */
 
 #define SSAM_MATCH_TARGET	0x1
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index b4178c42d08f..a485011ff137 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -254,6 +254,9 @@ int main(void)
 	DEVID(auxiliary_device_id);
 	DEVID_FIELD(auxiliary_device_id, name);
 
+	DEVID(arm_smccc_device_id);
+	DEVID_FIELD(arm_smccc_device_id, name);
+
 	DEVID(ssam_device_id);
 	DEVID_FIELD(ssam_device_id, match_flags);
 	DEVID_FIELD(ssam_device_id, domain);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 4e99393a35f1..0ce4fb049711 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1296,6 +1296,13 @@ static void do_auxiliary_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, AUXILIARY_MODULE_PREFIX "%s", *name);
 }
 
+static void do_arm_smccc_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD_ADDR(symval, arm_smccc_device_id, name);
+
+	module_alias_printf(mod, false, ARM_SMCCC_MODULE_PREFIX "%s", *name);
+}
+
 /*
  * Looks like: ssam:dNcNtNiNfN
  *
@@ -1466,6 +1473,7 @@ static const struct devtable devtable[] = {
 	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
 	{"mhi_ep", SIZE_mhi_device_id, do_mhi_ep_entry},
 	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
+	{"arm_smccc", SIZE_arm_smccc_device_id, do_arm_smccc_entry},
 	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
 	{"ishtp", SIZE_ishtp_device_id, do_ishtp_entry},
-- 
2.43.0


