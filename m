Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C75CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wENZ3i9tC9+RDHB+p2t0V3ZRm53mzWH8zU2INR+yrxk=; b=cVTB5lkUO9I/X45tkfcaJtRZhJ
	5FTaRxM5OqOCDWhmymoY1RhmiKO1VVIOMIzs6o+dUDlLPX/vsNsA3FxMKkuZHLiX0qFYMDFaf10qX
	CBhNZkcFrLAvH6RZ4mbgqFAZfn3xkSfzgXvgr81e7/r6EcQ6XZ8pEXD8IAHvYkVw2mbLwNbTb4COM
	pN9t/uTbXv34R1jAeNPn+75m3o/Zkh2YkdNtDRlaq8tcUH8uG6EtiaqNN6uQKOZG0nlz/STS0RTlp
	00vGCYtwURQKmLT80Ab2RJFEzMsuDyRUUqD4+F615N3ePzY/6nvJPXSu/lw98oBE+gIfcDaewwH+9
	OGLhEbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHAu-0000000EVLW-31g1;
	Sun, 04 Oct 2026 08:02:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHAq-0000000EVHz-0yZG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:02:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AC821A9A;
	Sun,  4 Oct 2026 01:02:16 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E756B3F85F;
	Sun,  4 Oct 2026 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100939; bh=1qYB9QZEjQRn+o44FXqNYc/xoj2mNauz+LBOPKAu8zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DtniltSQnH+4Ssr+xEMWSsxKfz7Y+MxI5FhdpLpCkDDi1b/pmhuQJYlyfyujQttA1
	 aMKuMlTtsgj+iAJ7HCmTm/haRwNEJ+C4gnA00NVisCHK6+pzexCYBxYW/P4++Tsk1N
	 jLlBKFONfAYhP6dm3uLcgjBlt999DlVMvpSBnAVE=
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
	jonathan.cameron@oss.qualcomm.com,
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
Subject: [PATCH v13 03/25] firmware: arm_scmi: Introduce protocol instance notifiers
Date: Sun,  4 Oct 2026 09:00:44 +0100
Message-ID: <20261004080106.3355393-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_010220_374783_BE3733BB 
X-CRM114-Status: GOOD (  26.61  )
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

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
NOTE THAT albeit functional as it is now, this patch is undergoing
consistent rework to address residual races pointed out by Sashiko
in the v14

v12 --> v13
 - refactored a few IFs
v10 -->v11
 - added a few dev_dbg
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

[FIX Instance_NOTIFIERS]: Refactor IFs
---
 drivers/firmware/arm_scmi/common.h    | 22 +++++++
 drivers/firmware/arm_scmi/driver.c    | 85 +++++++++++++++++++++------
 drivers/firmware/arm_scmi/notify.c    | 40 +++++++++++++
 drivers/firmware/arm_scmi/protocols.h | 10 ++++
 4 files changed, 138 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 678258bc7a93..4776e80f6556 100644
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
@@ -687,8 +688,29 @@ static struct platform_driver __drv = {					       \
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
index a666ad39acdf..1cabed4614ff 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -91,6 +91,8 @@ struct scmi_xfers_info {
  * @gid: A reference for per-protocol devres management.
  * @users: A refcount to track effective users of this protocol.
  * @priv: Reference for optional protocol private data.
+ * @pno: A protocol instance notifier descriptor: active only when the
+ *	 included notifier block @nb is non-NULL.
  * @version: Protocol version supported by the platform as detected at runtime.
  * @negotiated_version: When the platform supports a newer protocol version,
  *			the agent will try to negotiate with the platform the
@@ -110,6 +112,7 @@ struct scmi_protocol_instance {
 	void				*gid;
 	refcount_t			users;
 	void				*priv;
+	struct scmi_protocol_notifier   pno;
 	unsigned int			version;
 	unsigned int			negotiated_version;
 	struct scmi_protocol_handle	ph;
@@ -1656,6 +1659,24 @@ static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
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
@@ -2256,6 +2277,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	pi->ph.hops = &helpers_ops;
 	pi->ph.set_priv = scmi_set_protocol_priv;
 	pi->ph.get_priv = scmi_get_protocol_priv;
+	pi->ph.instance_notifier_register = scmi_register_instance_notifier;
 	refcount_set(&pi->users, 1);
 
 	/*
@@ -2318,24 +2340,32 @@ static struct scmi_protocol_instance * __must_check
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
 	}
-	mutex_unlock(&info->protocols_mtx);
+
+	if (proto_notifier_nb &&
+	    scmi_protocol_notifier_register(pi->handle, &pi->pno))
+		dev_warn(handle->dev, "Failed to register protocol notifier\n");
 
 	return pi;
 }
@@ -2366,13 +2396,33 @@ int scmi_protocol_acquire(const struct scmi_handle *handle, u8 protocol_id)
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
+		 * last instance releasing the protocol, mark the notifier
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
+	if (proto_notifier_nb &&
+	    scmi_protocol_notifier_unregister(pi->handle, &pi->pno))
+		dev_err(handle->dev, "Failed to release protocol notifier\n");
+
+	guard(mutex)(&info->protocols_mtx);
 	if (refcount_dec_and_test(&pi->users)) {
 		void *gid = pi->gid;
 
@@ -2390,9 +2440,6 @@ void scmi_protocol_release(const struct scmi_handle *handle, u8 protocol_id)
 		dev_dbg(handle->dev, "De-Initialized protocol: 0x%X\n",
 			protocol_id);
 	}
-
-out:
-	mutex_unlock(&info->protocols_mtx);
 }
 
 void scmi_setup_protocol_implemented(const struct scmi_protocol_handle *ph,
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 7d1bb424a723..7d0dcd8c77a2 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1417,6 +1417,25 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
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
+	dev_dbg(handle->dev,
+		"Registered SCMI protocol [0x%X] notifier\n", pno->proto_id);
+
+	return 0;
+}
+
 /**
  * scmi_notifier_unregister()  - Unregister a notifier_block for an event
  * @handle: The handle identifying the platform instance against which the
@@ -1474,6 +1493,27 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
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
+	dev_dbg(handle->dev,
+		"Unregistered SCMI protocol [0x%X] notifier\n", pno->proto_id);
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


