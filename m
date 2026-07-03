Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E53C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/9FN+wfWdlHfdf3CNCjehuS7y8C+zSoZKGlcipZ1es=; b=LjViPv4Ln3R83WJqVapKO9MQ+z
	1OA0fEnQttViVuTVerr0o7dQHGUCNMsHiQH1TDgK1qcGd2lyppsORaIOa65WxD7SwX/D64jj87nwx
	AY7ehuth3C+V163D7BTJBe5Izcpe7LL4e1MpiMT/0tdFxofL0SmqfACssm/MwA+sskHRV4KDIPPOu
	KYIVO2yfc0UXyV2zeKMb32bhcLd+MNRKBm34cMiRViAtGc06YyLFgIdYecsCf0Smo6L8cLU/aBse2
	xoOeQ3FQ/sxLiXWbD2c/LGLauyKFV11Yd8I98XUgQ6RIgn/xIjp2d/ZsN7dtkrx9T8hrzYLRC/YS0
	y/ejxqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9E-00000006xlr-0ngJ;
	Fri, 03 Jul 2026 12:37:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9B-00000006xfq-0lNt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Jul 2026 12:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c/9FN+wfWdlHfdf3CNCjehuS7y8C+zSoZKGlcipZ1es=; b=J9YHvQT2CnqQJ+doxPpdEaHwhB
	0tkedDuLjQ3zjHOPiPabAPl7ZGO/lD/uHqeETg+TZPyj6Xa4iVw6tmmLFjcKL/c57EwXC6CcotSAK
	J5KVIZPAv86dlaCK8WrVsbvHmlSMkhfi2Rx7q2r0kFyAc5YbUToa0sPeF608mmIeorRjLodSbbR0Q
	KABH4NSf7wrt9QgaapiZ0iIzT26OhCXQGZ3UBjdYHBe5kZXva8dDaqW3RvfyTg/JevJqXH7YmSD37
	1Khjs4DkW6COlTi+noyvsWVA7OXi55lKZHsH+E/f+sRik7LwQ9IzPeDxMH3CE0VL4VqQ+agZHsUJL
	+eGlvCqg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfd97-00000004oxG-3ztU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:37:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF1B21F60;
	Fri,  3 Jul 2026 05:37:22 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 255EC3F905;
	Fri,  3 Jul 2026 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082246; bh=+g8iNsr3diBgnLCTy6PLZDZrMvospiQB6qob2wscLQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X2hX5hZCFWvCO9VHTccn9hX+cWDFS0U9YCdNDcxA12U0oi05TCNtZhcZAsjewBlrL
	 uPPKQwqJpcC8NhVOOT/XfWv88pTboj+eg3tAU7w5KTZ7ufATu7fFx9Z8wx6KYtQqBq
	 fvOsNmtiVg1xJanjffgpeaTdFgGc4zMMJiOBo5+M=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
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
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 15/23] firmware: arm_scmi: Add common per-protocol debugfs support
Date: Fri,  3 Jul 2026 13:35:53 +0100
Message-ID: <20260703123601.381275-16-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133730_368444_B13ABD7A 
X-CRM114-Status: GOOD (  19.99  )
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
 drivers/firmware/arm_scmi/Kconfig     | 14 +++++++++++++
 drivers/firmware/arm_scmi/common.h    |  2 ++
 drivers/firmware/arm_scmi/driver.c    | 29 +++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/protocols.h |  6 ++++++
 include/linux/scmi_protocol.h         | 12 ++++++++++-
 5 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index e3fb36825978..06d2319420a0 100644
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
index b9cd542302fb..8582e56ec488 100644
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
index f933b8b9e29c..d54d155e69a8 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -18,6 +18,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/cleanup.h>
+#include <linux/dcache.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/export.h>
@@ -99,6 +100,8 @@ struct scmi_xfers_info {
  *			has completed.
  * @ph: An embedded protocol handle that will be passed down to protocol
  *	initialization code to identify this instance.
+ * @dbg: An optional reference to this protocol top debugfs directory; it will
+ *	 be automatically recursively removed on protocol de-initialization.
  *
  * Each protocol is initialized independently once for each SCMI platform in
  * which is defined by DT and implemented by the SCMI server fw.
@@ -112,6 +115,7 @@ struct scmi_protocol_instance {
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
+	struct dentry			*dbg;
 };
 
 #define ph_to_pi(h)	container_of(h, struct scmi_protocol_instance, ph)
@@ -2085,6 +2089,25 @@ static void scmi_common_fastchannel_db_ring(struct scmi_fc_db_info *db)
 		SCMI_PROTO_FC_RING_DB(64);
 }
 
+static struct dentry *
+scmi_debugfs_proto_dentry_get(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_protocol_instance *pi = ph_to_pi(ph);
+	struct scmi_info *info = handle_to_scmi_info(pi->handle);
+
+	if (!IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
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
@@ -2095,6 +2118,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
+	.debugfs_proto_dentry_get = scmi_debugfs_proto_dentry_get,
 };
 
 /**
@@ -2389,6 +2413,8 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 	if (refcount_dec_and_test(&pi->users)) {
 		void *gid = pi->gid;
 
+		debugfs_remove_recursive(pi->dbg);
+
 		if (pi->proto->events)
 			scmi_deregister_protocol_events(handle, protocol_id);
 
@@ -3111,6 +3137,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
 		scmi_debugfs_counters_setup(dbg, trans);
 
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_PROTOCOLS))
+		dbg->protos = debugfs_create_dir("protocols", top_dentry);
+
 	dbg->top_dentry = top_dentry;
 
 	if (devm_add_action_or_reset(info->dev,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index cc67e512fb6a..29dc6f14ee6d 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -11,6 +11,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
@@ -280,6 +281,9 @@ struct scmi_fc_info {
  *		      gathering FC descriptions from the SCMI platform server.
  * @fastchannel_db_ring: A common helper to ring a FC doorbell.
  * @get_max_msg_size: A common helper to get the maximum message size.
+ * @debugfs_proto_dentry_get: A common helper to get a per-protocol debugfs top
+ *			      directory to use as a root. It will be
+ *			      recursively removed on protocol de-initialization.
  */
 struct scmi_proto_helpers_ops {
 	int (*extended_name_get)(const struct scmi_protocol_handle *ph,
@@ -303,6 +307,8 @@ struct scmi_proto_helpers_ops {
 				 u32 *rate_limit);
 	void (*fastchannel_db_ring)(struct scmi_fc_db_info *db);
 	int (*get_max_msg_size)(const struct scmi_protocol_handle *ph);
+	struct dentry *(*debugfs_proto_dentry_get)
+		(const struct scmi_protocol_handle *ph);
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index de6b3c7cc959..c932390b9a09 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1126,6 +1126,12 @@ struct scmi_notify_ops {
  *			 never sleep and act accordingly.
  *			 An optional atomic threshold value could be returned
  *			 where configured.
+ * @debugfs_entry_get: method to get, and possibly create, a debugfs dentry
+ *		       rooted under the top debugfs directory for the SCMI
+ *		       instance referred by handle.
+ * @debugfs_entry_put: method to put, and possibly destroy, a debugfs dentry
+ *		       rooted under the top debugfs directory for the SCMI
+ *		       instance referred by handle.
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
@@ -1140,7 +1146,11 @@ struct scmi_handle {
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
 	bool (*is_transport_atomic)(const struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
-
+	struct dentry __must_check *
+		(*debugfs_entry_get)(const struct scmi_handle *handle,
+				     const char *name);
+	void (*debugfs_entry_put)(const struct scmi_handle *handle,
+				  struct dentry *dentry);
 	const struct scmi_notify_ops *notify_ops;
 };
 
-- 
2.54.0


