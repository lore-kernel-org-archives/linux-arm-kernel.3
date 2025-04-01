Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5CEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+JX59BInfmhT7du7K07qLTaPfnjypHJuL6q9XFWL9w=; b=vuxKBHOB7SH8tNGTnWFKV14RBc
	VGUi1sAlO1E50wJ41c5jT5Z2xKgTAGYmLOMPukNNyXjy+7w0aOGts7T74TQP0IB9pKt32pWKYXUk+
	BeCNC83SwWgQv+z6aqN/+ixxF2iw7fqA4amwN1ocgV2wJpiLP9q6+AGUCCK9kyPbnSvVKDv/hWmR6
	x3UTZlT/awN9qVbuVa2ho+llsnJHYxkWmt/LYdN+ctKabTJaDtNXjE7g6MbWqfHPTCer5xfkqCawH
	VS4uW+/3Ihl/ELq6+0KPBkmYVKL7M1xfv12Y1o3KnRaoZW3j3OXzhfOW5NvyHJ5Oss0vUQTUUmXAx
	s/Y7ZsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzayS-00000003KnK-0uEc;
	Tue, 01 Apr 2025 12:44:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzah9-00000003BEC-1N9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 12:26:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6565F1AC1;
	Tue,  1 Apr 2025 05:26:22 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 206773F63F;
	Tue,  1 Apr 2025 05:26:15 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 2/3] firmware: arm_scmi: Add Quirks framework
Date: Tue,  1 Apr 2025 13:25:44 +0100
Message-ID: <20250401122545.1941755-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250401122545.1941755-1-cristian.marussi@arm.com>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_052619_458678_BE488D38 
X-CRM114-Status: GOOD (  31.60  )
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

Add a common framework to describe SCMI quirks and associate them with a
specific platform or a specific SCMI firmware version.

All the matching SCMI quirks will be enabled when the SCMI core stack
probes and afer all the needed SCMI firmware versioning information was
retrieved using Base protocol.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/Kconfig  |  12 ++
 drivers/firmware/arm_scmi/Makefile |   1 +
 drivers/firmware/arm_scmi/base.c   |  14 +++
 drivers/firmware/arm_scmi/driver.c |   3 +
 drivers/firmware/arm_scmi/quirks.c | 191 +++++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h |  40 ++++++
 6 files changed, 261 insertions(+)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index dabd874641d0..ddebba0e2fb0 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -69,6 +69,18 @@ config ARM_SCMI_DEBUG_COUNTERS
 	  such useful debug counters. This can be helpful for debugging and
 	  SCMI monitoring.
 
+config ARM_SCMI_QUIRKS
+	bool "Enable SCMI Quirks framework"
+	depends on JUMP_LABEL
+	help
+	  Enables support for SCMI Quirks framework to workaround SCMI platform
+	  firmware bugs on system already deployed in the wild.
+
+	  The framework allows the definition of platform-specific code quirks
+	  that will be associated and enabled only on the desired platforms
+	  depending on the SCMI firmware advertised versions and/or machine
+	  compatibles.
+
 source "drivers/firmware/arm_scmi/transports/Kconfig"
 source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 9ac81adff567..780cd62b2f78 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -3,6 +3,7 @@ scmi-bus-y = bus.o
 scmi-core-objs := $(scmi-bus-y)
 
 scmi-driver-y = driver.o notify.o
+scmi-driver-$(CONFIG_ARM_SCMI_QUIRKS) += quirks.o
 scmi-driver-$(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) += raw_mode.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_SHMEM) = shmem.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_MSG) += msg.o
diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 86b376c50a13..298820196e4e 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -8,10 +8,12 @@
 #define pr_fmt(fmt) "SCMI Notifications BASE - " fmt
 
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/scmi_protocol.h>
 
 #include "common.h"
 #include "notify.h"
+#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x20001
@@ -376,8 +378,10 @@ static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
 	int id, ret;
 	u8 *prot_imp;
 	u32 version;
+	const char *compatible = NULL;
 	char name[SCMI_SHORT_NAME_MAX_SIZE];
 	struct device *dev = ph->dev;
+	struct device_node *root;
 	struct scmi_revision_info *rev = scmi_revision_area_get(ph);
 
 	ret = ph->xops->version_get(ph, &version);
@@ -404,6 +408,16 @@ static int scmi_base_protocol_init(const struct scmi_protocol_handle *ph)
 
 	scmi_setup_protocol_implemented(ph, prot_imp);
 
+	root = of_find_node_by_path("/");
+	if (root) {
+		of_property_read_string(root, "compatible", &compatible);
+		of_node_put(root);
+	}
+
+	/* Enable applicable quirks */
+	scmi_quirks_enable(dev, compatible,
+			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
+
 	dev_info(dev, "SCMI Protocol v%d.%d '%s:%s' Firmware version 0x%x\n",
 		 rev->major_ver, rev->minor_ver, rev->vendor_id,
 		 rev->sub_vendor_id, rev->impl_ver);
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3855a9791f4a..4266ef852c48 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -38,6 +38,7 @@
 
 #include "common.h"
 #include "notify.h"
+#include "quirks.h"
 
 #include "raw_mode.h"
 
@@ -3401,6 +3402,8 @@ static struct dentry *scmi_debugfs_init(void)
 
 static int __init scmi_driver_init(void)
 {
+	scmi_quirks_initialize();
+
 	/* Bail out if no SCMI transport was configured */
 	if (WARN_ON(!IS_ENABLED(CONFIG_ARM_SCMI_HAVE_TRANSPORT)))
 		return -EINVAL;
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
new file mode 100644
index 000000000000..83798bc3b043
--- /dev/null
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) Message Protocol Quirks
+ *
+ * Copyright (C) 2025 ARM Ltd.
+ */
+
+#include <linux/ctype.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/hashtable.h>
+#include <linux/static_key.h>
+#include <linux/types.h>
+
+#include "quirks.h"
+
+#define SCMI_QUIRKS_HT_SZ	4
+
+struct scmi_quirk {
+	bool enabled;
+	const char *name;
+	char *compatible;
+	char *vendor;
+	char *sub_vendor_id;
+	u32 impl_ver;
+	struct static_key_false *key;
+	struct hlist_node hash;
+	unsigned int hkey;
+};
+
+#define __DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)	\
+	static struct scmi_quirk scmi_quirk_entry_ ## _qn = {		\
+		.name = __stringify(quirk_ ## _qn),			\
+		.compatible = _comp,					\
+		.vendor = _ven,						\
+		.sub_vendor_id = _sub,					\
+		.impl_ver = _impl,					\
+		.key = &(scmi_quirk_ ## _qn),				\
+	}
+
+#define __DECLARE_SCMI_QUIRK_ENTRY(_qn)		(&(scmi_quirk_entry_ ## _qn))
+
+/*
+ * Define a quirk by name (_qn) and provide the matching tokens where:
+ *
+ *  _comp : compatible string, NULL means any.
+ *  _ven : SCMI Vendor ID string, NULL means any.
+ *  _sub : SCMI SubVendor ID string, NULL means any.
+ *  _impl : SCMI Implementation version, 0 means any.
+ *
+ *  This implicitly define a properly named global static-key that will be
+ *  used to dynamically enable the quirk at initialization time.
+ *
+ *  Note that it is possible to associate multiple quirks to the same
+ *  matching pattern, if your firmware quality is really astounding :P
+ */
+#define DEFINE_SCMI_QUIRK(_qn, _comp, _ven, _sub, _impl)		\
+	DEFINE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn);			\
+	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
+
+/*
+ * Same as DEFINE_SCMI_QUIRK but EXPORTED: this is meant to address quirks
+ * that possibly reside in code that is included in loadable kernel modules
+ * that needs to be able to access the global static keys at runtime to
+ * determine if enabled or not. (see SCMI_QUIRK to understand usage)
+ */
+#define DEFINE_SCMI_QUIRK_EXPORTED(_qn, _comp, _ven, _sub, _impl)	\
+	DEFINE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn);			\
+	EXPORT_SYMBOL_GPL(scmi_quirk_ ## _qn);				\
+	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
+
+/* Global Quirks Definitions */
+
+/*
+ * Quirks Pointers Array
+ *
+ * This is filled at compile-time with the list of pointers to all the currently
+ * defined quirks descriptors.
+ */
+static struct scmi_quirk *scmi_quirks_table[] = {
+	NULL
+};
+
+/*
+ * Quirks HashTable
+ *
+ * A run-time populated hashtable containing all the defined quirks descriptors
+ * hashed by matching pattern.
+ */
+static DEFINE_READ_MOSTLY_HASHTABLE(scmi_quirks_ht, SCMI_QUIRKS_HT_SZ);
+
+/* TODO
+ * This is brutally copied from vendor modules matching logic, should be
+ * refactored and unified.
+ */
+static unsigned int
+scmi_quirk_signature(const char *compat, const char *vend, const char *sub_vend,
+		     u32 impl)
+{
+	char *signature, *p;
+	unsigned int hash32;
+	unsigned long hash = 0;
+
+	/* vendor_id/sub_vendor_id guaranteed <= SCMI_SHORT_NAME_MAX_SIZE */
+	signature = kasprintf(GFP_KERNEL, "%s|%s|%s|0x%08X",
+			      compat ?: "", vend ?: "", sub_vend ?: "", impl);
+	if (!signature)
+		return 0;
+
+	pr_debug("SCMI Quirk Signature >>>%s<<<\n", signature);
+
+	p = signature;
+	while (*p)
+		hash = partial_name_hash(tolower(*p++), hash);
+	hash32 = end_name_hash(hash);
+
+	kfree(signature);
+
+	return hash32;
+}
+
+void scmi_quirks_initialize(void)
+{
+	struct scmi_quirk *quirk;
+	int i;
+
+	for (i = 0, quirk = scmi_quirks_table[0]; quirk;
+	     i++, quirk = scmi_quirks_table[i]) {
+		quirk->hkey = scmi_quirk_signature(quirk->compatible,
+						   quirk->vendor,
+						   quirk->sub_vendor_id,
+						   quirk->impl_ver);
+
+		hash_add(scmi_quirks_ht, &quirk->hash, quirk->hkey);
+
+		pr_debug("Registered SCMI [%s] -- %p - Key [0x%08X] - %s/%s/%s/0x%08X\n",
+			 quirk->name, quirk, quirk->hkey, quirk->compatible,
+			 quirk->vendor, quirk->sub_vendor_id, quirk->impl_ver);
+	}
+
+	pr_debug("SCMI Quirks initialized\n");
+}
+
+void scmi_quirks_enable(struct device *dev, const char *compat,
+			const char *vend, const char *subv, const u32 impl)
+{
+	dev_info(dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
+		 compat, vend, subv, impl);
+
+	/*
+	 * TODO Lookup logic is cumbersome/over-engineered and can be simplified
+	 *
+	 * Lookup into scmi_quirks_ht using 2 loops: with/without compatible
+	 */
+	for (int k = 1; k >= 0 ; k--) {
+		const char *compat_sel = k > 0 ? compat : NULL;
+
+		for (int i = 4; i > 0; i--) {
+			struct scmi_quirk *quirk;
+			unsigned int hkey;
+			int j = 0;
+
+			if (!compat_sel && i <= 1)
+				break;
+
+			hkey = scmi_quirk_signature(compat_sel,
+						    i > 1 ? vend : NULL,
+						    i > 2 ? subv : NULL,
+						    i > 3 ? impl : 0);
+
+			/*
+			 * Note that there could be multiple matches so we
+			 * will enable multiple quirk part of an hash collision
+			 * domain...BUT we cannot assume that ALL quirks on the
+			 * same collision domain are a full match.
+			 */
+			hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
+				if (quirk->enabled || quirk->hkey != hkey)
+					continue;
+
+				dev_info(dev,
+					 "[%d] Enabling [%s] - %s/%s/%s/0x%08X\n",
+					 j++, quirk->name, quirk->compatible, quirk->vendor,
+					 quirk->sub_vendor_id, quirk->impl_ver);
+
+				static_branch_enable(quirk->key);
+				quirk->enabled = true;
+			}
+		}
+	}
+}
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
new file mode 100644
index 000000000000..0f1a14b13ba5
--- /dev/null
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * System Control and Management Interface (SCMI) Message Protocol Quirks
+ *
+ * Copyright (C) 2025 ARM Ltd.
+ */
+#ifndef _SCMI_QUIRKS_H
+#define _SCMI_QUIRKS_H
+
+#include <linux/static_key.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_ARM_SCMI_QUIRKS
+
+#define DECLARE_SCMI_QUIRK(_qn)						\
+	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
+
+#define SCMI_QUIRK(_qn, _blk)						\
+	do {								\
+		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
+			(_blk);						\
+	} while (0)
+
+void scmi_quirks_initialize(void);
+void scmi_quirks_enable(struct device *dev, const char *compat,
+			const char *vend, const char *subv, const u32 impl);
+
+#else
+
+#define DECLARE_SCMI_QUIRK(_qn)
+#define SCMI_QUIRK(_qn, _blk)
+
+static inline void scmi_quirks_initialize(void) { }
+static inline void scmi_quirks_enable(struct device *dev, const char *compat,
+				      const char *vend, const char *sub_vend,
+				      const u32 impl) { }
+
+#endif /* CONFIG_ARM_SCMI_QUIRKS */
+
+#endif /* _SCMI_QUIRKS_H */
-- 
2.47.0


