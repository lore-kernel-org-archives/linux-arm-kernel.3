Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A54DC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQqiSZO3fx3adtnIdc5I/MvS+K6iENknw9kqrM50+do=; b=SDzFjplDjTP5M9SRCsk1QezBmw
	XKDXcDe77+ZUk+LYHkXCSfonQuB2AaUeYv+0ycMVy4DAWPUguJv6hEMTYfJDD3zEZ49zQQpjENj0e
	KQk+woKURYjPzXME4hJExzNvRA68us75x4tu2V5nhnmGZAT+b3XfO1MENC8B36MK+EZEsyEq2LK64
	0tuUSUrC7GZfIZi2+3aWA6jNTbUul/8sb0QI1jxsbQHrwBavu5eLMCVHtQxO2ftR3IDeNn+xx2rxv
	725J3349I/dyMKZ5APdCPIFoWHXKNEZUpMY5AMR3WnVfr8vzzWVXEW+bKBzv73P5gHf8/Cs/c2k5Y
	GAPKuiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNnB-00000004I4Z-1Xs1;
	Sat, 15 Aug 2026 23:27:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvNn0-00000004HsW-3NFo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 23:27:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 588B21595;
	Sat, 15 Aug 2026 16:27:42 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC9B73F673;
	Sat, 15 Aug 2026 16:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786836466; bh=yDbtMu1UCmtAu3x4JWy7C1qq5hS+guw+bfiIhkUrmcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pi/w3afzR4WgBPCjIZAJzM8GjOt5BQOLSnZOzyo94zROnSFLuk9AigrglUBQeyPwk
	 j4xDYtDA1hQVR3JHGGndtsIA5OlpSvPE4YOiFoyW2jtVA6nWyF2lGK3R5ewYSzdUMx
	 2E37opXlUoIuAcmG4M1yw8DL72gqsBBiBqMG9v14=
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
Subject: [PATCH v10 19/24] firmware: arm_scmi: Add un-managed methods to get/put protocols operations
Date: Sun, 16 Aug 2026 00:25:59 +0100
Message-ID: <20260815232604.3730754-20-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815232604.3730754-1-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_162747_619619_ED6CD376 
X-CRM114-Status: GOOD (  12.74  )
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

Add a couple of simple common methods to be able to manually get and put
protocol operations to address situation in which devres managed methods
cannot be used.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 39 ++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  7 ++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index e02b4bfb4e4d..fd17adeed2d9 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2570,6 +2570,31 @@ scmi_devm_protocol_get(struct scmi_device *sdev, u8 protocol_id,
 	return pi->proto->ops;
 }
 
+/**
+ * scmi_protocol_operations_get  - UnManaged get protocol operations
+ *
+ * @handle: A reference to the SCMI platform instance.
+ * @protocol_id: The protocol being released.
+ * @ph: A pointer reference used to pass back the associated protocol handle.
+ */
+static const void __must_check *
+scmi_protocol_operations_get(const struct scmi_handle *handle, u8 protocol_id,
+			     struct scmi_protocol_handle **ph)
+{
+	struct scmi_protocol_instance *pi;
+
+	if (!ph)
+		return ERR_PTR(-EINVAL);
+
+	pi = scmi_get_protocol_instance(handle, protocol_id);
+	if (IS_ERR(pi))
+		return pi;
+
+	*ph = &pi->ph;
+
+	return pi->proto->ops;
+}
+
 /**
  * scmi_devm_protocol_acquire  - Devres managed helper to get hold of a protocol
  * @sdev: A reference to an scmi_device whose embedded struct device is to
@@ -2626,6 +2651,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
 	WARN_ON(ret);
 }
 
+/**
+ * scmi_protocol_operations_put  - UnManaged gut protocol operations
+ *
+ * @handle: A reference to the SCMI platform instance.
+ * @protocol_id: The protocol being released.
+ */
+static void scmi_protocol_operations_put(const struct scmi_handle *handle,
+					 u8 protocol_id)
+{
+	scmi_protocol_release(handle, protocol_id);
+}
+
 /**
  * scmi_is_transport_atomic  - Method to check if underlying transport for an
  * SCMI instance is configured as atomic.
@@ -3340,6 +3377,8 @@ static int scmi_probe(struct platform_device *pdev)
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
 	handle->devm_protocol_get = scmi_devm_protocol_get;
 	handle->devm_protocol_put = scmi_devm_protocol_put;
+	handle->protocol_get = scmi_protocol_operations_get;
+	handle->protocol_put = scmi_protocol_operations_put;
 	handle->is_transport_atomic = scmi_is_transport_atomic;
 
 	/* Setup all channels described in the DT at first */
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index a85c00bf72f2..11ed0b95536e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1137,6 +1137,9 @@ struct scmi_notify_ops {
  * @devm_protocol_get: devres managed method to acquire a protocol and get specific
  *		       operations and a dedicated protocol handler
  * @devm_protocol_put: devres managed method to release a protocol
+ * @protocol_get: unmanaged method to acquire a protocol and get specific
+ *		  operations and a dedicated protocol handler
+ * @protocol_put: unmanaged method to release a protocol
  * @is_transport_atomic: method to check if the underlying transport for this
  *			 instance handle is configured to support atomic
  *			 transactions for commands.
@@ -1159,6 +1162,10 @@ struct scmi_handle {
 		(*devm_protocol_get)(struct scmi_device *sdev, u8 proto,
 				     struct scmi_protocol_handle **ph);
 	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
+	const void __must_check *
+		(*protocol_get)(const struct scmi_handle *handle, u8 proto,
+				struct scmi_protocol_handle **ph);
+	void (*protocol_put)(const struct scmi_handle *handle, u8 proto);
 	bool (*is_transport_atomic)(const struct scmi_handle *handle,
 				    unsigned int *atomic_threshold);
 	const struct scmi_notify_ops *notify_ops;
-- 
2.54.0


