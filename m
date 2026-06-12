Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27112CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mT672/IMevaYST6CWt+JKBxqXTjFm3gPFB3llZWgphQ=; b=fwXpHa7OoJdiTRI/RXjkVjEdjg
	No79sKgqaW/6py0cuHeh1UDXddHTyPpEY74UJVbXXb2NsF4l5gL6iDr0y5g2HTmeAYfAhc4m7Wd96
	DQ/wXgkVypD8I444jy4/f14PjwLlxzZUMx7kGd7O+V18iN2udIyLfODaajWSZyVJUv6SzTOC/kkJp
	Qi+1eCdtRlAlKXIC9rNlSLSUEV7/pHs1Dmul/iqkiIiT9N2WocltK2m1aK9KXke+fXsPi8WJsl9Su
	ci5m2vKNaOFkX9lGIJ/l3NPfk5o6Qk9bIADvYGOeHe3FSxA7XtHF0k+CreI9NNHnXnkclQ15dp3SN
	g3tk6t0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAWd-0000000BfhV-33Vw;
	Fri, 12 Jun 2026 22:38:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAWb-0000000BfgG-3Y29
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:38:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11D873543;
	Fri, 12 Jun 2026 15:38:47 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCF3D3FB7F;
	Fri, 12 Jun 2026 15:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781303931; bh=p6Z5R8DzBSxE8iFKvSb4MXuejkzEqd+ajGV7yNSK0DA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ETCz3WKborCpggGRHY246hKQnYye/WmY33VZRwittAbQMn17fOZTtc/pV5rXpuC3/
	 e259WANOMz+HyzkOQoPLngaxn86a6bRgoma9GUkzdPm40ryCKivMHLqZPy7vchxAqI
	 WQCMgnTy5ywIiDAeYGazSYRxycLaLtJOvQQ1iPLM=
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
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 04/31] firmware: arm_scmi: Allow protocols to register for notifications
Date: Fri, 12 Jun 2026 23:37:34 +0100
Message-ID: <20260612223802.1337232-5-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_153853_965735_94B35BAD 
X-CRM114-Status: GOOD (  16.27  )
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

Allow protocols themselves to register for their own notifications and
provide their own notifier callbacks.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2-->v3
 - split out unrelated changes on event sizing
v1-->v2
 - Fixed multiline comment format
---
 drivers/firmware/arm_scmi/common.h    |  4 ++++
 drivers/firmware/arm_scmi/driver.c    | 12 ++++++++++++
 drivers/firmware/arm_scmi/notify.c    |  6 +++---
 drivers/firmware/arm_scmi/protocols.h |  6 ++++++
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index abe2fa3d41dd..a8a45bacfa3f 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -17,6 +17,7 @@
 #include <linux/hashtable.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/refcount.h>
 #include <linux/scmi_protocol.h>
 #include <linux/spinlock.h>
@@ -533,5 +534,8 @@ static struct platform_driver __drv = {					       \
 void scmi_notification_instance_data_set(const struct scmi_handle *handle,
 					 void *priv);
 void *scmi_notification_instance_data_get(const struct scmi_handle *handle);
+int scmi_notifier_register(const struct scmi_handle *handle, u8 proto_id,
+			   u8 evt_id, const u32 *src_id,
+			   struct notifier_block *nb);
 int scmi_inflight_count(const struct scmi_handle *handle);
 #endif /* _SCMI_COMMON_H */
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 2ee4cad1f93d..9c1ab9925b1d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1655,6 +1655,17 @@ static void *scmi_get_protocol_priv(const struct scmi_protocol_handle *ph)
 	return pi->priv;
 }
 
+static int
+scmi_register_instance_notifier(const struct scmi_protocol_handle *ph,
+				u8 evt_id, const u32 *src_id,
+				struct notifier_block *nb)
+{
+	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
+
+	return scmi_notifier_register(pi->handle, pi->proto->id,
+				      evt_id, src_id, nb);
+}
+
 static const struct scmi_xfer_ops xfer_ops = {
 	.xfer_get_init = xfer_get_init,
 	.reset_rx_to_maxsz = reset_rx_to_maxsz,
@@ -2223,6 +2234,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
 	pi->ph.hops = &helpers_ops;
 	pi->ph.set_priv = scmi_set_protocol_priv;
 	pi->ph.get_priv = scmi_get_protocol_priv;
+	pi->ph.notifier_register = scmi_register_instance_notifier;
 	refcount_set(&pi->users, 1);
 
 	/*
diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index 3e4c97ab7b61..2a8efdf0bab8 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -1389,9 +1389,9 @@ static int scmi_event_handler_enable_events(struct scmi_event_handler *hndl)
  *
  * Return: 0 on Success
  */
-static int scmi_notifier_register(const struct scmi_handle *handle,
-				  u8 proto_id, u8 evt_id, const u32 *src_id,
-				  struct notifier_block *nb)
+int scmi_notifier_register(const struct scmi_handle *handle,
+			   u8 proto_id, u8 evt_id, const u32 *src_id,
+			   struct notifier_block *nb)
 {
 	int ret = 0;
 	u32 evt_key;
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index f51245aca259..3e7b6f8aa72c 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -166,6 +166,9 @@ struct scmi_proto_helpers_ops;
  *	  can be used by the protocol implementation to generate SCMI messages.
  * @set_priv: A method to set protocol private data for this instance.
  * @get_priv: A method to get protocol private data previously set.
+ * @notifier_register: A method to register interest for notifications from
+ *		       within a protocol implementation unit: notifiers can
+ *		       be registered only for the same protocol.
  *
  * This structure represents a protocol initialized against specific SCMI
  * instance and it will be used as follows:
@@ -185,6 +188,9 @@ struct scmi_protocol_handle {
 	const struct scmi_proto_helpers_ops *hops;
 	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv);
 	void *(*get_priv)(const struct scmi_protocol_handle *ph);
+	int (*notifier_register)(const struct scmi_protocol_handle *ph,
+				 u8 evt_id, const u32 *src_id,
+				 struct notifier_block *nb);
 };
 
 /**
-- 
2.54.0


