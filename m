Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F667C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBlwLqwzUEDK8LmlbdGa4KPnn2/wvRxA6qOCulxWpug=; b=KAAkFMIWggb9fCQGYrbosx7ClJ
	9NJiLpshXGwAmFZtXeJc7sexAHBAwkHCq+qB5XquNmEdLYgq3CAuRZ0W6F+3pf322Zr6Vox8RyfMK
	o1+7nSvhO3JiR/qkWLXsFaQD06HT/CReE1eTogXBHTKveGgfQRYwNtp1zR8Q98+z1f5jUGslV8KPN
	9d3D0KTF0IR4Lr/cz6Wby81Qeh5TL/nPBjTfCyfOM9sNljH9uXmSkoc0h26h8OKWYVJFmvnD5Iq57
	i0w1zz2X9SDuAGR84j+W3COFiCddWuNuk2lDM8BoumUd7deJ0mApoErfEjIjhtDUn/nPBwsk4X0ON
	fu/I+vSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHB4-0000000Gb2A-2RHj;
	Fri, 24 Jul 2026 14:47:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHB1-0000000GazM-2WVd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 14:47:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AFB81477;
	Fri, 24 Jul 2026 07:46:57 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 855D13F66F;
	Fri, 24 Jul 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784904421; bh=MtMui1/C+LzbgsLio7B/p/5PShR97yA+5VPZG+67X4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=snCrgNaqilDZubCcKLG/HT1mAM4R483bagK/PO/mK7EiFPcmY3rKwCqZFQZqqt/e6
	 cM8lHHGUEe9kRQQCm94mMOqDsDUhCDn5TiQonjiF29p1nL7DasEnHC9Y+rHGbjqlZm
	 1CmbNf2HImHLAKX8IbbvwcTgUBEQvbL4Lo5o/pTw=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	david@kernel.org,
	subrahmanya.lingappa@oss.qualcomm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v6 14/22] firmware: arm_scmi: Add common per-protocol debugfs support
Date: Fri, 24 Jul 2026 15:44:22 +0100
Message-ID: <20260724144430.1440170-15-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724144430.1440170-1-cristian.marussi@arm.com>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_074703_966954_FAF9D948 
X-CRM114-Status: GOOD (  20.85  )
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

Allow interested SCMI protocols to register their own specific debugfs
entries under a common per-instance and per-protocol subtree rooted
at /sys/kernel/debug/scmi/<N>/protocols/<PROTO_ID>/

Expose a helper to enable protocol initialization code to get access to
such per-protocol/per-instance dentries in order to be able to install
their own dedicated debugfs entries.

Per-protocol debugfs support is configurable and default off.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v5 --> v6
 - bail out of dentry_get helper when SCMI debug susbsytem failed to init
 - remove stale SCMI protocol operations
 - add a preoper clean up of debugfs when protocol init fails
---
 drivers/firmware/arm_scmi/Kconfig     | 14 +++++++++++++
 drivers/firmware/arm_scmi/common.h    |  2 ++
 drivers/firmware/arm_scmi/driver.c    | 30 +++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/protocols.h |  6 ++++++
 include/linux/scmi_protocol.h         |  1 -
 5 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29..f506c4d1d96a 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -69,6 +69,20 @@ config ARM_SCMI_DEBUG_COUNTERS
 	  such useful debug counters. This can be helpful for debugging and
 	  SCMI monitoring.
 
+config ARM_SCMI_DEBUG_PROTOCOLS
+	bool "Enable SCMI protocols debug"
+	select ARM_SCMI_NEED_DEBUGFS
+	depends on DEBUG_FS
+	default n
+	help
+	  Enables per-protocol specific debug features, where available.
+	  When provided, such per-protocol debugfs entries are grouped
+	  inside a common a subtree named by the protocol number and rooted
+	  under a per-instance 'protocols' directory.
+
+	  Such per-protocol entries subtree structure is freely defined
+	  within the related protocol code.
+
 config ARM_SCMI_QUIRKS
 	bool "Enable SCMI Quirks framework"
 	depends on JUMP_LABEL || COMPILE_TEST
diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index f8fbb1a46482..d34fa7fd5253 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -322,6 +322,7 @@ enum debug_counters {
 /**
  * struct scmi_debug_info  - Debug common info
  * @top_dentry: A reference to the top debugfs dentry
+ * @protos: A reference to the top debugfs protocols subdirectory
  * @name: Name of this SCMI instance
  * @type: Type of this SCMI instance
  * @is_atomic: Flag to state if the transport of this instance is atomic
@@ -329,6 +330,7 @@ enum debug_counters {
  */
 struct scmi_debug_info {
 	struct dentry *top_dentry;
+	struct dentry *protos;
 	const char *name;
 	const char *type;
 	bool is_atomic;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4c200b6168a9..d209b3ca0174 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -18,6 +18,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
+#include <linux/dcache.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -101,6 +102,8 @@ struct scmi_xfers_info {
  *			has completed.
  * @ph: An embedded protocol handle that will be passed down to protocol
  *	initialization code to identify this instance.
+ * @dbg: An optional reference to this protocol top debugfs directory; it will
+ *	 be automatically recursively removed on protocol de-initialization.
  *
  * Each protocol is initialized independently once for each SCMI platform in
  * which is defined by DT and implemented by the SCMI server fw.
@@ -115,6 +118,7 @@ struct scmi_protocol_instance {
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
+	struct dentry			*dbg;
 };
 
 #define ph_to_pi(h)	container_of(h, struct scmi_protocol_instance, ph)
@@ -2095,6 +2099,25 @@ static void scmi_common_fastchannel_db_ring(struct scmi_fc_db_info *db)
 		SCMI_PROTO_FC_RING_DB(64);
 }
 
+static struct dentry *
+scmi_debugfs_proto_dentry_get(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	struct scmi_info *info = handle_to_scmi_info(pi->handle);
+
+	if (!IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS) || !info->dbg)
+		return ERR_PTR(-ENODEV);
+
+	if (!pi->dbg) {
+		char proto_dir[8];
+
+		snprintf(proto_dir, 8, "0x%02X", pi->proto->id);
+		pi->dbg = debugfs_create_dir(proto_dir, info->dbg->protos);
+	}
+
+	return pi->dbg;
+}
+
 static const struct scmi_proto_helpers_ops helpers_ops = {
 	.extended_name_get = scmi_common_extended_name_get,
 	.get_max_msg_size = scmi_common_get_max_msg_size,
@@ -2105,6 +2128,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
+	.debugfs_proto_dentry_get = scmi_debugfs_proto_dentry_get,
 };
 
 /**
@@ -2317,6 +2341,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	return pi;
 
 clean:
+	debugfs_remove_recursive(pi->dbg);
 	/* Take care to put the protocol module's owner before releasing all */
 	scmi_protocol_put(proto);
 	devres_release_group(handle->dev, gid);
@@ -2428,6 +2453,8 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 	if (refcount_dec_and_test(&pi->users)) {
 		void *gid = pi->gid;
 
+		debugfs_remove_recursive(pi->dbg);
+
 		if (pi->proto->events)
 			scmi_deregister_protocol_events(handle, protocol_id);
 
@@ -3150,6 +3177,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
 		scmi_debugfs_counters_setup(dbg, trans);
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		dbg->protos = debugfs_create_dir("protocols", top_dentry);
+
 	dbg->top_dentry = top_dentry;
 
 	if (devm_add_action_or_reset(info->dev,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 1f9925b8f495..04e196a9fbf4 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -11,6 +11,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -284,6 +285,9 @@ struct scmi_fc_info {
  *		      gathering FC descriptions from the SCMI platform server.
  * @fastchannel_db_ring: A common helper to ring a FC doorbell.
  * @get_max_msg_size: A common helper to get the maximum message size.
+ * @debugfs_proto_dentry_get: A common helper to get a per-protocol debugfs top
+ *			      directory to use as a root. It will be
+ *			      recursively removed on protocol de-initialization.
  */
 struct scmi_proto_helpers_ops {
 	int (*extended_name_get)(const struct scmi_protocol_handle *ph,
@@ -307,6 +311,8 @@ struct scmi_proto_helpers_ops {
 				 u32 *rate_limit);
 	void (*fastchannel_db_ring)(struct scmi_fc_db_info *db);
 	int (*get_max_msg_size)(const struct scmi_protocol_handle *ph);
+	struct dentry *(*debugfs_proto_dentry_get)
+		(const struct scmi_protocol_handle *ph);
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5b1d6eede287..8ff5ee9d6ac0 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1141,7 +1141,6 @@ struct scmi_handle {
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
 	bool (*is_transport_atomic)(const struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
-
 	const struct scmi_notify_ops *notify_ops;
 };
 
-- 
2.54.0


