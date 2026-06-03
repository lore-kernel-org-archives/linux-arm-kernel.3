Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9083CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXGjepFLBlF5CYmJKu9nzonog+TjUvQLSqr6dGfFK2E=; b=Wv1qLufO3edieT0eh48gL4D8vN
	B7W+qCN5Y02jrqTwe6RiyBR4pbfHkYqElfKerQn1FlSpGUk1+cpBsw0sHZZI5ZXjCQc9CQA09jSVP
	crZgcS+G+I+9CziWVrCyP/ER/U2nvAs7OAbonmJVGe8+O2upJNzZPLvHpNCMhfOWTBqE3bWFkUJuB
	2vxZBNPHbeQkleWwElHmkjStfoYQzHxmvjesQJYn2kZJ0F/M3ecOE1gB110LOlOitkRQwzqsiCz/F
	ekQy82wgBnd+ad0sHXiFQoCXWbwbl8w4kzGREH/28HJtXMCC3qBQ/wAFn/ot3gYC+ekPlKz21R5Sr
	x54WqZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgrL-0000000EZg5-2eHS;
	Wed, 03 Jun 2026 08:21:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgrJ-0000000EZe2-3wx7;
	Wed, 03 Jun 2026 08:21:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6360460239;
	Wed,  3 Jun 2026 08:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AE91F00893;
	Wed,  3 Jun 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780474913;
	bh=ZXGjepFLBlF5CYmJKu9nzonog+TjUvQLSqr6dGfFK2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ABBhZrjqOU3o537lh2MnRYUpYMrAMI0ROn0RsyvtsI8PXipIkR061ks9udXEF2C0h
	 If3i0UetpaEvv3OrWUZmz4KSy5bQw4ttj0XV5p8H3AqqM7/KgXEDY/YmOhiUrI0GAG
	 FN2f8lQQNU9nuQTNyBN9u8N2HfgXpZt7imZnGJlYPEtqXYUr5W7wh+S2eDopa987I1
	 3kIHecyEJsrk3xPW9OyOuJhGNieglEb8tZX+2QzifZQckprT5MvOTYLMMSHNJ5HZY2
	 EF0ucrZb2UKmy77Rp6L4/gRBiE0L2kZZYsmUHc16Urh7rw7/dKM50uBu4pQ+7nM77Y
	 aucxO+nLtV0rQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 03 Jun 2026 10:21:01 +0200
Subject: [PATCH v2 5/6] ACPI/IORT: Implement ACPI infrastructure to enable
 GICv5 IWB probe deferral
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-5-23ffa16b6ebb@kernel.org>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
In-Reply-To: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>
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
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
---
 drivers/acpi/arm64/iort.c | 22 +++++++++++++++++++---
 drivers/acpi/scan.c       |  1 +
 include/linux/acpi_iort.h |  3 ++-
 3 files changed, 22 insertions(+), 4 deletions(-)

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
index 530547cda8b2..ba15da9058dc 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -856,6 +856,7 @@ static const char * const acpi_ignore_dep_ids[] = {
 
 /* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
 static const char * const acpi_honor_dep_ids[] = {
+	"ARMH0003", /* ARM GICv5 IWB */
 	"INT3472", /* Camera sensor PMIC / clk and regulator info */
 	"INTC1059", /* IVSC (TGL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */
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
2.54.0


