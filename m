Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBCECD343C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCHgyC0BhiRCmgl36Zu440ZWPFQeNkt6EfZQa/Geuwk=; b=esKCDyobC+BrvmEqOopxZzRv4i
	jJ5BPKd7xeDcaVaoo8NwTTbPPlRaWsNRf0oexmSsKn6LajQzYYPdaHIMMXBPRwV292Wu/388PqqqH
	pXa5QE+X6p5nfBtBNh4496o8C2jw7iqGTyfKMDl8AFxNBHu10NVD7y6UBggxz9fCKudMO5rCUKHcS
	MYttVSI7QGNabKZVK42jnnIbIq34UT21+ecJXjoIr3jFQZJUwIKofvh3k038GvNNqm9qtHZ9O4DCS
	DDr7eyC8yQm9vEJ16SuDTH+Eegxt6sJGtTijIATVoqUFwZrNUqV/7o4z+5nU4V7ioI687zw+bmqDP
	lzRhqQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwWy-0000000DlK8-25Sg;
	Mon, 04 May 2026 16:52:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwWw-0000000DlIV-19Rd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:52:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DB4E1691;
	Mon,  4 May 2026 09:52:19 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4C4E3F763;
	Mon,  4 May 2026 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913545; bh=b1TfSp8pJ8Zlwfe8b5wy069zWBg5zqbxvqUZ5fMpVtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aE8ymg7J003652yTbbJuowZD3DnZam5JFGJ5kay2wilqWsmGHAkT7hqx9FRPx39/M
	 QnpIn0TS2aAOMVkhdjPcgTplHHeNo9ZO2Nvdfk1GHCXLoueeO8yCW+ouA+3cU+y2Pu
	 +3YqiA4oDaABhYisye+ZwNng56qwYA1QxYpHo4oA=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	gatien.chevallier@foss.st.com,
	u.kleine-koenig@baylibre.com,
	dakr@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v1 3/3] firmware: arm_scmi: optee: Rework transport probe sequence
Date: Mon,  4 May 2026 17:52:04 +0100
Message-ID: <20260504165204.639499-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260504165204.639499-1-cristian.marussi@arm.com>
References: <20260504165204.639499-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_095226_415352_ECD3322B 
X-CRM114-Status: GOOD (  19.23  )
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

Use the new per-instance transport handles helpers to synchronize and
optionally defer the core SCMI driver probe up until the transport driver
has completely been initialized and it is fully operational as a supplier.

Introduce proper module init/exit routines while removing the ugly trick of
registering a driver from within the probe sequence of another one, just to
avoid to have to deal with probe deferrals.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/optee.c | 118 +++++++++++++++++--
 1 file changed, 105 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07ae18d5279d..6950089fb659 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -154,6 +154,79 @@ static struct scmi_transport_core_operations *core;
 /* There can be only 1 SCMI service in OP-TEE we connect to */
 static struct scmi_optee_agent *scmi_optee_private;
 
+/**
+ * struct scmi_optee_suppliers  - Transport descriptor
+ * @mtx: A mutex to protect @available
+ * @available: A reference to an initialized transport device ready to use
+ *	       which  will cycle through the following 3 states:
+ *	       1. PTR_ERR(-EPROBE_DEFER) at start before transport is ready
+ *	       2. <supplier_dev> when transport is initialized, ready for use,
+ *	          but still unused
+ *	       3. PTR_ERR(-EBUSY) when transport supplier device is in use
+ * @th: An embedded transport handle object that embeds the helpers
+ *	implementing the above mentioned logic
+ *
+ * Note that this transport driver enforces single instance probing.
+ */
+struct scmi_optee_suppliers {
+	/* Protect @available */
+	struct mutex mtx;
+	struct device *available;
+	const struct scmi_transport_handle th;
+};
+
+#define to_osup(t)	container_of(t, struct scmi_optee_suppliers, th)
+
+static int scmi_optee_supplier_init(const struct scmi_transport_handle *th,
+				    struct device *dev)
+{
+	struct scmi_optee_suppliers *osup = to_osup(th);
+
+	guard(mutex)(&osup->mtx);
+	/* Was any transport already registered ? */
+	if (!IS_ERR(osup->available))
+		return -EBUSY;
+
+	osup->available = dev;
+
+	return 0;
+}
+
+static struct device *
+scmi_optee_supplier_get(const struct scmi_transport_handle *th)
+{
+	struct scmi_optee_suppliers *osup = to_osup(th);
+	struct device *supplier;
+
+	guard(mutex)(&osup->mtx);
+	supplier = osup->available;
+	if (!IS_ERR(supplier))
+		osup->available = ERR_PTR(-EBUSY);
+
+	return supplier;
+}
+
+static void scmi_optee_supplier_put(const struct scmi_transport_handle *th,
+				    struct device *supplier)
+{
+	struct scmi_optee_suppliers *osup = to_osup(th);
+
+	guard(mutex)(&osup->mtx);
+	osup->available = supplier;
+}
+
+static void scmi_optee_supplier_cleanup(const struct scmi_transport_handle *th)
+{
+	scmi_optee_supplier_put(th, ERR_PTR(-EPROBE_DEFER));
+}
+
+static struct scmi_optee_suppliers scmi_transport_suppliers = {
+	.mtx = __MUTEX_INITIALIZER(mutexname),
+	.available = INIT_ERR_PTR(-EPROBE_DEFER),
+	.th.supplier_get = scmi_optee_supplier_get,
+	.th.supplier_put = scmi_optee_supplier_put,
+};
+
 /* Open a session toward SCMI OP-TEE service with REE_KERNEL identity */
 static int open_session(struct scmi_optee_agent *agent, u32 *tee_session)
 {
@@ -522,7 +595,7 @@ static struct scmi_desc scmi_optee_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "linaro,scmi-optee" },
+	{ .compatible = "linaro,scmi-optee", .data = &scmi_transport_suppliers.th},
 	{ /* Sentinel */ },
 };
 
@@ -561,15 +634,12 @@ static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 	if (ret)
 		goto err;
 
-	/* Ensure agent resources are all visible before scmi_optee_private is */
-	smp_mb();
-	scmi_optee_private = agent;
-
-	ret = platform_driver_register(&scmi_optee_driver);
-	if (ret) {
-		scmi_optee_private = NULL;
+	ret = scmi_optee_supplier_init(&scmi_transport_suppliers.th, agent->dev);
+	if (ret)
 		goto err;
-	}
+
+	/* Ensure initialized scmi_optee_private is visible */
+	smp_store_mb(scmi_optee_private, agent);
 
 	return 0;
 
@@ -586,13 +656,12 @@ static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
 	if (!scmi_optee_private)
 		return;
 
-	platform_driver_unregister(&scmi_optee_driver);
-
 	if (!list_empty(&scmi_optee_private->channel_list))
 		return;
 
-	/* Ensure cleared reference is visible before resources are released */
+	/* Ensure scmi_optee_private is visible as NULL */
 	smp_store_mb(scmi_optee_private, NULL);
+	scmi_optee_supplier_cleanup(&scmi_transport_suppliers.th);
 
 	tee_client_close_context(agent->tee_ctx);
 }
@@ -616,7 +685,30 @@ static struct tee_client_driver scmi_optee_service_driver = {
 	},
 };
 
-module_tee_client_driver(scmi_optee_service_driver);
+static int __init scmi_transport_optee_init(void)
+{
+	int ret;
+
+	ret = tee_client_driver_register(&scmi_optee_service_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&scmi_optee_driver);
+	if (ret) {
+		tee_client_driver_unregister(&scmi_optee_service_driver);
+		return ret;
+	}
+
+	return ret;
+}
+module_init(scmi_transport_optee_init);
+
+static void __exit scmi_transport_optee_exit(void)
+{
+	platform_driver_unregister(&scmi_optee_driver);
+	tee_client_driver_unregister(&scmi_optee_service_driver);
+}
+module_exit(scmi_transport_optee_exit);
 
 MODULE_AUTHOR("Etienne Carriere <etienne.carriere@foss.st.com>");
 MODULE_DESCRIPTION("SCMI OPTEE Transport driver");
-- 
2.53.0


