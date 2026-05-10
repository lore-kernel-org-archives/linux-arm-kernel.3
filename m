Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E641CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26aJsmg0dcLFvlEBKL7cU1+eSu7KvJyN0hObqWs5yNk=; b=3DuPc6OqC3vhCvlcNqOu5k4Dfv
	ZBsxXWwCUn95UjbIfuVKK9fc+QdrSV+N/8e6vZbGFbZVpVkBnPKR8m/5PR3z0aLWfsehbvkFAxBFJ
	GJWooWuCDr32mxzRNqJXqAxapc4rtikX5RT9EAZ4br4t/NW/ZWrRQE1AKZUYcD/gYT4RZDoatvuBO
	cVPIMo5jtK8ZGcS0NcK8fYe3R+av9ab03tvPs3KYASJloseiTC5e1hIxarTsibgWQRDWbv4xDw+Sq
	GW/gOLLov0OPDq+uuih8FmTOQELs7WMjeE07GHEDImwlUQFTLweChfH29gvNIZrZchF0JPxak1z0O
	wKY+2o2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fU-0000000B7AW-3Sco;
	Sun, 10 May 2026 16:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM6fR-0000000B78w-1jHr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 16:06:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89BE827B5;
	Sun, 10 May 2026 09:06:03 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 446173F836;
	Sun, 10 May 2026 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778429168; bh=Yvl5e0/bXtH3DqoJuR+H+WomG2HEBPx9dK1/VFX327c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmII/EMT+K0ivX+5X1kyLo0EW7NzboZzHQfElWwz9ap5aR17PpmAlfSIzVPQlvDAm
	 4qtayWkWca51phdrVavqtMi7DejboyMIyRh7ZhbmvcvbfdmUcmetZcl5HCrEjVf2z3
	 qYG13l6rVzb3c/Rb0nWST/k4jiB/HOPUXXz2De/Y=
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
Subject: [PATCH v2 4/4] firmware: arm_scmi: optee: Rework transport probe sequence
Date: Sun, 10 May 2026 17:05:27 +0100
Message-ID: <20260510160527.3537474-5-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510160527.3537474-1-cristian.marussi@arm.com>
References: <20260510160527.3537474-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_090609_532020_ED371BBE 
X-CRM114-Status: GOOD (  15.40  )
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
v1 -> v2
 - fixed __MUTEX_INITILIAZER() usage
 - use common generic supplier definitions
 - get rid of init/cleanup wrappers
 - use proper barrier on scmi_optee_agent
---
 drivers/firmware/arm_scmi/transports/optee.c | 46 +++++++++++++++-----
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmware/arm_scmi/transports/optee.c
index 07ae18d5279d..dbe32e141748 100644
--- a/drivers/firmware/arm_scmi/transports/optee.c
+++ b/drivers/firmware/arm_scmi/transports/optee.c
@@ -154,6 +154,8 @@ static struct scmi_transport_core_operations *core;
 /* There can be only 1 SCMI service in OP-TEE we connect to */
 static struct scmi_optee_agent *scmi_optee_private;
 
+static DEFINE_SCMI_TRANSPORT_SUPPLIER(scmi_optee_supplier);
+
 /* Open a session toward SCMI OP-TEE service with REE_KERNEL identity */
 static int open_session(struct scmi_optee_agent *agent, u32 *tee_session)
 {
@@ -522,7 +524,7 @@ static struct scmi_desc scmi_optee_desc = {
 };
 
 static const struct of_device_id scmi_of_match[] = {
-	{ .compatible = "linaro,scmi-optee" },
+	{ .compatible = "linaro,scmi-optee", .data = &scmi_optee_supplier.th},
 	{ /* Sentinel */ },
 };
 
@@ -561,18 +563,20 @@ static int scmi_optee_service_probe(struct tee_client_device *scmi_pta)
 	if (ret)
 		goto err;
 
-	/* Ensure agent resources are all visible before scmi_optee_private is */
+	/* Ensure initialized scmi_optee_private is visible */
 	smp_mb();
 	scmi_optee_private = agent;
 
-	ret = platform_driver_register(&scmi_optee_driver);
-	if (ret) {
-		scmi_optee_private = NULL;
-		goto err;
-	}
+	ret = scmi_transport_supplier_put(&scmi_optee_supplier.th, agent->dev);
+	if (ret)
+		goto err_put;
 
 	return 0;
 
+err_put:
+	/* Ensure cleared reference is visible before resources are released */
+	smp_store_mb(scmi_optee_private, NULL);
+
 err:
 	tee_client_close_context(tee_ctx);
 
@@ -586,13 +590,12 @@ static void scmi_optee_service_remove(struct tee_client_device *scmi_pta)
 	if (!scmi_optee_private)
 		return;
 
-	platform_driver_unregister(&scmi_optee_driver);
-
 	if (!list_empty(&scmi_optee_private->channel_list))
 		return;
 
 	/* Ensure cleared reference is visible before resources are released */
 	smp_store_mb(scmi_optee_private, NULL);
+	scmi_transport_supplier_put(&scmi_optee_supplier.th, agent->dev);
 
 	tee_client_close_context(agent->tee_ctx);
 }
@@ -616,7 +619,30 @@ static struct tee_client_driver scmi_optee_service_driver = {
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


