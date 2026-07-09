Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB6FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZbe8dDzrobU1GpUf47INZqHOOZGfLshNlOdorjkLhw=; b=ZUxdN7zzVHu48e7otH9xGSkqhp
	le3EFCuR5GbufvsIr0jE+JV9uQEUl3qwPp7HTibQyABCD0xjboavY9LhLB1Rf/mRdaPL7I9SgioOh
	FGx2kd0PdBnHFi1EsNO+qHg2yQfFO/x8Jv99tUScN3DE01i5AloPBveYoK2rLg4bfAHlL5WkJ6IYU
	v4CKvIa2ATWu2xsJMTFcFzrFuHN7SzeiVKKdLQRW25dmR3HVVE6CgtUlCdK124vB0wvHwRD8QZ8OB
	Y8p3EKAgtA/zgwL56KTacLCyGrfat1S40uo1Kgfw+sFYuPc4hIJHMUckN2zf32af2V5CG9ZrMy7EO
	qP9DTx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkK3-00000001SGl-419u;
	Thu, 09 Jul 2026 08:41:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkK2-00000001SFa-3eQg;
	Thu, 09 Jul 2026 08:41:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87DF342AFA;
	Thu,  9 Jul 2026 08:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B851F00A3D;
	Thu,  9 Jul 2026 08:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783586490;
	bh=gZbe8dDzrobU1GpUf47INZqHOOZGfLshNlOdorjkLhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B2BCUndEYfCRkn1bUVhMNR+GA5bN9Hj9s1V9kV+jxA/fDorXabidLuWbRy6lykFxL
	 PR5rlleJ5iW5wdYZMgwIDWfNxfKjwXhGw9/RSGEW6zJzhd2XAehAGHNo3tYpMgSX9N
	 uUXWN12x1qJ0sseigIa8+nm9wOFQuO6ZQoTevbWhY/hx9mHsHdTA6u+RLxBXRC1wpA
	 mTstUQyzBDH8OuS/EfdcPgmJSZ3FDNINF2OK8FQyLhVL5wkLahLY0iZnOA3YXfAEuj
	 n30f5EYVZJgQ96IO9YXeS0NQszzqrTYvnXWUrejrYUsHhdFKPNcX/jD5YeofTOu6Jf
	 aluv4SXWDIUoQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 09 Jul 2026 10:40:16 +0200
Subject: [PATCH v4 6/7] ACPI/IORT: Implement ACPI infrastructure to enable
 GICv5 IWB probe deferral
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-6-48dae790f871@kernel.org>
References: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
In-Reply-To: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
X-Mailer: b4 0.15.2
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

Implement an IORT ACPI hook to retrieve the acpi_handle of the interrupt
controller handling a specific GSI (if any, on GICv5 systems only the IWB
is represented in firmware with an ACPI device object) and add the IWB to
the list of devices whose dependencies can be detected (and cleared) in
ACPI core to guarantee that probe dependencies for the IWB can be
satisfied.

Enable autodep detection for arm64 by adding the arch_acpi_add_auto_dep()
callback in the ACPI IORT driver.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Acked-by: "Rafael J. Wysocki" (Intel) <rafael@kernel.org> # ACPI: scan.c
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
---
 drivers/acpi/arm64/iort.c    | 22 +++++++++++++++++++---
 drivers/acpi/scan.c          |  1 +
 drivers/irqchip/irq-gic-v5.c |  2 +-
 include/linux/acpi_iort.h    |  3 ++-
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index af7a9b2fd5bc..34412cd697d8 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -789,11 +789,9 @@ struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
 	return irq_find_matching_fwnode(handle, bus_token);
 }
 
-struct fwnode_handle *iort_iwb_handle(u32 iwb_id)
+acpi_handle iort_iwb_handle(u32 iwb_id)
 {
-	struct fwnode_handle *fwnode;
 	struct acpi_iort_node *node;
-	struct acpi_device *device;
 	struct acpi_iort_iwb *iwb;
 	acpi_status status;
 	acpi_handle handle;
@@ -808,6 +806,19 @@ struct fwnode_handle *iort_iwb_handle(u32 iwb_id)
 	if (ACPI_FAILURE(status))
 		return NULL;
 
+	return handle;
+}
+
+struct fwnode_handle *iort_iwb_handle_fwnode(u32 iwb_id)
+{
+	struct fwnode_handle *fwnode;
+	struct acpi_device *device;
+	acpi_handle handle;
+
+	handle = iort_iwb_handle(iwb_id);
+	if (!handle)
+		return NULL;
+
 	device = acpi_get_acpi_dev(handle);
 	if (!device)
 		return NULL;
@@ -2090,6 +2101,11 @@ static void __init iort_init_platform_devices(void)
 	}
 }
 
+u32 arch_acpi_add_auto_dep(acpi_handle handle)
+{
+	return acpi_irq_add_auto_dep(handle);
+}
+
 void __init acpi_iort_init(void)
 {
 	acpi_status status;
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 9a7ac2eb9ce0..25d09474f889 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -854,6 +854,7 @@ static const char * const acpi_ignore_dep_ids[] = {
 
 /* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
 static const char * const acpi_honor_dep_ids[] = {
+	"ARMH0003", /* ARM GICv5 IWB */
 	"INT3472", /* Camera sensor PMIC / clk and regulator info */
 	"INTC1059", /* IVSC (TGL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */
diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index b9f648d8e0f0..7ea39cb19f75 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1226,7 +1226,7 @@ static struct fwnode_handle *gsi_domain_handle;
 static struct fwnode_handle *gic_v5_get_gsi_domain_id(u32 gsi)
 {
 	if (FIELD_GET(GICV5_GSI_IC_TYPE, gsi) == GICV5_GSI_IWB_TYPE)
-		return iort_iwb_handle(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
+		return iort_iwb_handle_fwnode(FIELD_GET(GICV5_GSI_IWB_FRAME_ID, gsi));
 
 	return gsi_domain_handle;
 }
diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
index 17bb3374f4ca..931eaa7bbf6a 100644
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -27,7 +27,8 @@ int iort_register_domain_token(int trans_id, phys_addr_t base,
 			       struct fwnode_handle *fw_node);
 void iort_deregister_domain_token(int trans_id);
 struct fwnode_handle *iort_find_domain_token(int trans_id);
-struct fwnode_handle *iort_iwb_handle(u32 iwb_id);
+acpi_handle iort_iwb_handle(u32 iwb_id);
+struct fwnode_handle *iort_iwb_handle_fwnode(u32 iwb_id);
 
 #ifdef CONFIG_ACPI_IORT
 u32 iort_msi_map_id(struct device *dev, u32 id);

-- 
2.34.1


