Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB99C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svZmExDa3Xr6fZleJM/TObh9/UQFSNvfIDP1Soa6yB8=; b=Pxy6xeA2FSCnyX8o0igFDgjZSD
	f9xa5Lp8NTXqUI+bzkrGpSX48PhwknlO7buD+4lbSs7TW68PUt2py7DANeybXeH6ucbrD3+90jYzA
	JwQdUAqE6rpFeeI3YFk4iq6C14cdj+4q9ASvLrcKMWe84YUGzyVzmhtnn6qMao49wTOCFof4SsNZB
	xywIXaHboTw3gTkhyURAhOLjL5vabckP4UTfCeOOmityyaDuPaTUJ9QjTzuF8KcnHFu/mtsFGnPXq
	C7TwxKjRBV5ssvmWMbEudD3ZDnAA5J5EnzW9ocfrSbzaIKF801js8Uv2Mzr1sTtdrRYughyd5zxO4
	oN2gAxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNm8-00000004HE0-35n7;
	Sat, 15 Aug 2026 23:26:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNm5-00000004HCj-2VRX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 23:26:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC3715A1;
	Sat, 15 Aug 2026 16:26:44 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E4663F673;
	Sat, 15 Aug 2026 16:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836408; bh=Vp4O4gKuoNZ6BeIdjo/Ssh6lYNuA06DyRY1OW21RU5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kF7ne4dRiv91mlysfdK5z8ggCnUNiWki8N0BSJAR0e7IdqXjLyjG2RsdZ8xOFQxmj
	 sbovNl5fMAD33HCzJI0v+lso3yotqIeBQXngiY2aJHLBdjH1h1ouf5Hhgszf4aI9OW
	 4ovB8F2jGMXontSOu/n6H7V4NNzJg8yDUb9f+BUk=
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
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v10 03/24] firmware: arm_scmi: Introduce protocol instance notifiers
Date: Sun, 16 Aug 2026 00:25:43 +0100
Message-ID: <20260815232604.3730754-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815232604.3730754-1-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_162649_735275_4934DECA 
X-CRM114-Status: GOOD (  26.45  )
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

SCMI Protocol notifications are typically used by SCMI drivers to detect
and react to particular conditions: this was the assumption and the classic
usage scenario upon which the SCMI notification framework was built.

Some protocols like Telemetry, though, could be interested in enabling and
registering for such notifications: in such a scenario each initialized
protocol instance could want to register a common protocol notifier.

In order to reuse the existing SCMI Notifications machinery, allow
protocols themselves to register for their own notifications and provide
their own notifier callbacks.

Each protocol, at the end of its initialization phase, can now provide one
unique per-protocol-instance notifier block, which will be registered, by
the core SCMI stack, on the related notification chain: such notifier will
be automatically removed during the protocol de-initialization phase.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v8 --> v9
 - Added membarrier comment
v7 --> v8
 - Reworked logic around protocol notifier registration to address
   possible races as pointed out by Sashiko
 - Reviewed commit message
v5 -->v6
 - move protocol notifier registration out of proto_init
v2-->v3
 - split out unrelated changes on event sizing
v1-->v2
 - Fixed multiline comment format
---
 drivers/firmware/arm_scmi/common.h    | 22 +++++++
 drivers/firmware/arm_scmi/driver.c    | 89 +++++++++++++++++++++------
 drivers/firmware/arm_scmi/notify.c    | 34 ++++++++++
 drivers/firmware/arm_scmi/protocols.h | 10 +++
 4 files changed, 136 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index d9db4a4d17dc..e0a2549423ee 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -18,6 +18,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/property.h>
+#include <linux/notifier.h>
 #include <linux/refcount.h>
 #include <linux/scmi_protocol.h>
 #include <linux/spinlock.h>
@@ -685,8 +686,29 @@ static struct platform_driver __drv = {					       \
 	.probe = __tag##_probe,						       \
 }
 
+struct scmi_protocol_notifier {
+	u8 proto_id;
+	u8 evt_id;
+	const u32 *src_id;
+	struct notifier_block *nb;
+	bool registered;
+};
+
 void scmi_notification_instance_data_set(const struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
+
+int scmi_protocol_notifier_register(const struct scmi_handle *handle,
+				    struct scmi_protocol_notifier *pno);
+int scmi_protocol_notifier_unregister(const struct scmi_handle *handle,
+				      struct scmi_protocol_notifier *pno);
+
+static inline bool
+scmi_protocol_notifier_registered(struct scmi_protocol_notifier *pno)
+{
+	/* Ensure registered is visible */
+	return smp_load_acquire(&pno->registered);
+}
+
 int scmi_inflight_count(const struct scmi_handle *handle);
 #endif /* _SCMI_COMMON_H */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..3a405db9bb79 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -90,6 +90,8 @@ struct scmi_xfers_info {
  * @gid: A reference for per-protocol devres management.
  * @users: A refcount to track effective users of this protocol.
  * @priv: Reference for optional protocol private data.
+ * @pno: A protocol instance notifier descriptor: active only when the
+ *	 included notifier block @nb is non-NULL.
  * @version: Protocol version supported by the platform as detected at runtime.
  * @negotiated_version: When the platform supports a newer protocol version,
  *			the agent will try to negotiate with the platform the
@@ -109,6 +111,7 @@ struct scmi_protocol_instance {
 	void				*gid;
 	refcount_t			users;
 	void				*priv;
+	struct scmi_protocol_notifier   pno;
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
@@ -1655,6 +1658,24 @@ static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
 	return pi->priv;
 }
 
+static int
+scmi_register_instance_notifier(const struct scmi_protocol_handle *ph, u8 evt_id,
+				const u32 *src_id, struct notifier_block *nb)
+{
+	struct scmi_protocol_instance *pi = ph_to_pi(ph);
+
+	pi->pno.proto_id = pi->proto->id;
+	pi->pno.evt_id = evt_id;
+	pi->pno.src_id = src_id;
+	/*
+	 * Ensure the descriptor fields are visibile when the notifier block is
+	 * made available
+	 */
+	smp_store_release(&pi->pno.nb, nb);
+
+	return 0;
+}
+
 static const struct scmi_xfer_ops xfer_ops = {
 	.xfer_get_init = xfer_get_init,
 	.reset_rx_to_maxsz = reset_rx_to_maxsz,
@@ -2255,6 +2276,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	pi->ph.hops = &helpers_ops;
 	pi->ph.set_priv = scmi_set_protocol_priv;
 	pi->ph.get_priv = scmi_get_protocol_priv;
+	pi->ph.instance_notifier_register = scmi_register_instance_notifier;
 	refcount_set(&pi->users, 1);
 
 	/*
@@ -2317,24 +2339,34 @@ static struct scmi_protocol_instance * __must_check
 scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_protocol_instance *pi;
+	struct notifier_block *proto_notifier_nb = NULL;
 	struct scmi_info *info = handle_to_scmi_info(handle);
 
-	mutex_lock(&info->protocols_mtx);
-	pi = idr_find(&info->protocols, protocol_id);
+	scoped_guard(mutex, &info->protocols_mtx) {
+		pi = idr_find(&info->protocols, protocol_id);
+		if (pi) {
+			refcount_inc(&pi->users);
+		} else {
+			const struct scmi_protocol *proto;
 
-	if (pi) {
-		refcount_inc(&pi->users);
-	} else {
-		const struct scmi_protocol *proto;
+			/* Fails if protocol not registered on bus */
+			proto = scmi_protocol_get(protocol_id, &info->version);
+			if (!proto)
+				return ERR_PTR(-EPROBE_DEFER);
 
-		/* Fails if protocol not registered on bus */
-		proto = scmi_protocol_get(protocol_id, &info->version);
-		if (proto)
 			pi = scmi_alloc_init_protocol_instance(info, proto);
-		else
-			pi = ERR_PTR(-EPROBE_DEFER);
+			if (IS_ERR(pi))
+				return pi;
+
+			proto_notifier_nb = READ_ONCE(pi->pno.nb);
+		}
+	}
+
+	if (proto_notifier_nb) {
+		if (scmi_protocol_notifier_register(pi->handle, &pi->pno))
+			dev_warn(handle->dev,
+				 "Failed to register protocol notifier\n");
 	}
-	mutex_unlock(&info->protocols_mtx);
 
 	return pi;
 }
@@ -2365,13 +2397,35 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
 void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 {
 	struct scmi_info *info = handle_to_scmi_info(handle);
+	struct notifier_block *proto_notifier_nb = NULL;
 	struct scmi_protocol_instance *pi;
 
-	mutex_lock(&info->protocols_mtx);
-	pi = idr_find(&info->protocols, protocol_id);
-	if (WARN_ON(!pi))
-		goto out;
+	scoped_guard(mutex, &info->protocols_mtx) {
+		pi = idr_find(&info->protocols, protocol_id);
+		if (WARN_ON(!pi))
+			return;
 
+		/*
+		 * If a protocol notifier was registered and this is the
+		 * last istance releasing the protocol, mark the notifier
+		 * for un-registration: note that the notifier itself counts
+		 * as one user, as for any other regular notification, so if a
+		 * protocol notifier is registered and there are only 2 users
+		 * active we can derive that this is the last protocol
+		 * instance de-registering.
+		 */
+		if (scmi_protocol_notifier_registered(&pi->pno) &&
+		    refcount_read(&pi->users) == 2)
+			proto_notifier_nb = READ_ONCE(pi->pno.nb);
+	}
+
+	if (proto_notifier_nb) {
+		if (scmi_protocol_notifier_unregister(pi->handle, &pi->pno))
+			dev_err(handle->dev,
+				"Failed to release protocol notifier\n");
+	}
+
+	guard(mutex)(&info->protocols_mtx);
 	if (refcount_dec_and_test(&pi->users)) {
 		void *gid = pi->gid;
 
@@ -2389,9 +2443,6 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
-
-out:
-	mutex_unlock(&info->protocols_mtx);
 }
 
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 8995dd1b12aa..6687a7c3bfaf 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1420,6 +1420,22 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
 	return ret;
 }
 
+int scmi_protocol_notifier_register(const struct scmi_handle *handle,
+				    struct scmi_protocol_notifier *pno)
+{
+	int ret;
+
+	ret = scmi_notifier_register(handle, pno->proto_id, pno->evt_id,
+				     pno->src_id, pno->nb);
+	if (ret)
+		return ret;
+
+	/* Make sure registration is visible */
+	smp_store_release(&pno->registered, true);
+
+	return 0;
+}
+
 /**
  * scmi_notifier_unregister()  - Unregister a notifier_block for an event
  * @handle: The handle identifying the platform instance against which the
@@ -1477,6 +1493,24 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
 	return 0;
 }
 
+int scmi_protocol_notifier_unregister(const struct scmi_handle *handle,
+				      struct scmi_protocol_notifier *pno)
+{
+	int ret;
+
+	/* Make sure de-registration is visible BEFORE calling unregister */
+	smp_store_release(&pno->registered, false);
+	ret = scmi_notifier_unregister(handle, pno->proto_id, pno->evt_id,
+				       pno->src_id, pno->nb);
+	if (WARN_ON(ret)) {
+		/* Make sure rollback is visible */
+		smp_store_release(&pno->registered, true);
+		return ret;
+	}
+
+	return 0;
+}
+
 struct scmi_notifier_devres {
 	const struct scmi_handle *handle;
 	u8 proto_id;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 15ad5162e37a..b7f29003a7dc 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -166,6 +166,13 @@ struct scmi_proto_helpers_ops;
  *	  can be used by the protocol implementation to generate SCMI messages.
  * @set_priv: A method to set protocol private data for this instance.
  * @get_priv: A method to get protocol private data previously set.
+ * @instance_notifier_register: A method to register interest for specific
+ *				notifications from within a protocol
+ *				implementation unit: ONLY one instance notifier
+ *				can be registered per-protocol.
+ *				The related notifier block will be registered
+ *				right after the protocol is initialized and
+ *				automatically removed on protocol release.
  *
  * This structure represents a protocol initialized against specific SCMI
  * instance and it will be used as follows:
@@ -185,6 +192,9 @@ struct scmi_protocol_handle {
 	const struct scmi_proto_helpers_ops *hops;
 	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv);
 	void *(*get_priv)(const struct scmi_protocol_handle *ph);
+	int (*instance_notifier_register)(const struct scmi_protocol_handle *ph,
+					  u8 evt_id, const u32 *src_id,
+					  struct notifier_block *nb);
 };
 
 /**
-- 
2.54.0


