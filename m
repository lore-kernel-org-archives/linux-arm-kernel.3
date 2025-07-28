Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DD6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vujkvhJSsWBmwddZ5ZvjZfc/b3IwDMz5JLn5GQ9I5KQ=; b=DTCUjRbkVnx6P6JjMHqhMjN4ll
	3lxYxRT6+f70nbi4u6zWmC0WOUV23/n7UbwvQYsmf5s3JjxlXtQ0XUbjpx2Gjgg3PVOJLEAC/x5x7
	DoehDJ5VdUjbLEkVNNXb/ubIeOCypGBDp1BtN3nG6xvP0QEEbrzengQb9ZjjbraoIa2slikO5eOFo
	vFPGmgbw9P0F+DVao0BVTaOslljXl6HJ5QUQpsHPdQoAwY2d+yeWK46a3a2XYjfSuHSVg5wIxxuCe
	xmZ+1zblrxUW6DuB7XWWjIEDnj0yaUwgiZcOYVra8Y7QhmO6hDYcCNTRT0ssSYJC8pISQLVozZF2f
	U/boQEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTig-0000000FHqy-3QuG;
	Mon, 28 Jul 2025 19:41:10 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2g-0000000F8tR-2E8L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:43 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so2258370f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725220; x=1754330020; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vujkvhJSsWBmwddZ5ZvjZfc/b3IwDMz5JLn5GQ9I5KQ=;
        b=mMI8L58sIVorwQpDE/4Xh0Rbhx8LlXu1YwhhKI7EFAwWBv0Q1x0RTSpLXAC42Pp61b
         hsv4hnBghO50Bj6KU3NT3VEA1+CwhctuNim2GECqgSDlmi9A99o2ecy+3cmwfyYLpnKa
         /jFX/45kSAXrpLaho8/MwsEqntWn0X0lD1LFj5I4Wbmd0304g+/UHpHDkXvTiCRFpJsr
         F++lkYjb9hZN08GjI2lRJYBHHCH4CXoXd3H+/8FEgBYMHS0rU84QxR10HELtFTZQ3Sv1
         7qYRytHXDUd6ExAN9O39zeSU4qDascW5Trs7U1me0w1oSIIlIsOpICCMnEGoe32GtswI
         aQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725220; x=1754330020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vujkvhJSsWBmwddZ5ZvjZfc/b3IwDMz5JLn5GQ9I5KQ=;
        b=q6lbTx9nxMtMDziY7W49NH7wD3GgnMxoNBY1xcdsqHnQx38H3D18Yw24rzyBOaOqvi
         oK+bhD/Giop7HS8faPsDDyHXHVFR4FRQR025AzejmzQA/8Yx9hiK1JwANybBDAi1HKH3
         6/XUu6kIgEnedwi6UM9cGsJcYRuXXhYt4p6fu21UwhEG/oP3RDiDU5OAR4AQ4ZTZ+Zub
         cV/j4U0xzSJ9SD6hdD1m+ItUg9uEkzAPWwsjnaq2RxQU/2BarZtka2lL0QzI2NEJzj3v
         iWP45cFBqVJPnqYdECuDVi+K0t9ni/XYfJ6hgcKhARV6vBh5vmEzOUe+/75QGgHFvN2P
         l9ww==
X-Forwarded-Encrypted: i=1; AJvYcCWS/A5FfX16/T+XaTFH+F7ClCn28d2pa/sE9oCbifzIUI7PTryPkTgKAGGtq6KcF0Qegrhh3SOtfslWm3QCDcAQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyG98IgudDAVR7GNB6y7empnEfA01Uy4NVmNjcimV3c+a4dLKU3
	2G08lPHNJakZK8zn9yi37nG/METeOtyy9NSWK2dzUE5hUMi5pMVYwAAH8upYhHtXTR7V18X8Qf1
	Adf+rz0MeTvlG5A==
X-Google-Smtp-Source: AGHT+IGNOLfTiSfMRn+M4tw62En1bzCedWhazV44Vqap8ApoFH0f09yhQKfwE6kwSUKyFgXsPHn8Kkhbtx6mfg==
X-Received: from wmsr9.prod.google.com ([2002:a05:600c:8b09:b0:458:6a87:d662])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40da:b0:3b5:f7a3:3960 with SMTP id ffacd0b85a97d-3b7767765aemr9195924f8f.33.1753725220377;
 Mon, 28 Jul 2025 10:53:40 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:52:57 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-11-smostafa@google.com>
Subject: [PATCH v3 10/29] iommu/arm-smmu-v3: Move firmware probe to arm-smmu-v3-common
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_105342_581877_ED15C8F5 
X-CRM114-Status: GOOD (  22.45  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Move the FW probe functions to the common source.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../arm/arm-smmu-v3/arm-smmu-v3-common.c      | 146 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 143 +----------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   3 +
 3 files changed, 150 insertions(+), 142 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
index 6cd5187d62a1..835eeae3bf5e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common.c
@@ -1,7 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/acpi.h>
 #include <linux/dma-mapping.h>
 #include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/string_choices.h>
 #include <kunit/visibility.h>
 
@@ -12,6 +17,11 @@
 #define IIDR_PRODUCTID_ARM_MMU_600	0x483
 #define IIDR_PRODUCTID_ARM_MMU_700	0x487
 
+struct arm_smmu_option_prop {
+	u32 opt;
+	const char *prop;
+};
+
 static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
 {
 	u32 reg;
@@ -525,3 +535,139 @@ void arm_smmu_write_strtab(struct arm_smmu_device *smmu)
 		       smmu->base + ARM_SMMU_STRTAB_BASE);
 	writel_relaxed(reg, smmu->base + ARM_SMMU_STRTAB_BASE_CFG);
 }
+
+static struct arm_smmu_option_prop arm_smmu_options[] = {
+	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
+	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
+	{ 0, NULL},
+};
+
+static void parse_driver_options(struct arm_smmu_device *smmu)
+{
+	int i = 0;
+
+	do {
+		if (of_property_read_bool(smmu->dev->of_node,
+					  arm_smmu_options[i].prop)) {
+			smmu->options |= arm_smmu_options[i].opt;
+			dev_notice(smmu->dev, "option %s\n",
+				   arm_smmu_options[i].prop);
+		}
+	} while (arm_smmu_options[++i].opt);
+}
+
+#ifdef CONFIG_ACPI
+#ifdef CONFIG_TEGRA241_CMDQV
+static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
+						struct arm_smmu_device *smmu)
+{
+	const char *uid = kasprintf(GFP_KERNEL, "%u", node->identifier);
+	struct acpi_device *adev;
+
+	/* Look for an NVDA200C node whose _UID matches the SMMU node ID */
+	adev = acpi_dev_get_first_match_dev("NVDA200C", uid, -1);
+	if (adev) {
+		/* Tegra241 CMDQV driver is responsible for put_device() */
+		smmu->impl_dev = &adev->dev;
+		smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
+		dev_info(smmu->dev, "found companion CMDQV device: %s\n",
+			 dev_name(smmu->impl_dev));
+	}
+	kfree(uid);
+}
+#else
+static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
+						struct arm_smmu_device *smmu)
+{
+}
+#endif
+
+static int acpi_smmu_iort_probe_model(struct acpi_iort_node *node,
+				      struct arm_smmu_device *smmu)
+{
+	struct acpi_iort_smmu_v3 *iort_smmu =
+		(struct acpi_iort_smmu_v3 *)node->node_data;
+
+	switch (iort_smmu->model) {
+	case ACPI_IORT_SMMU_V3_CAVIUM_CN99XX:
+		smmu->options |= ARM_SMMU_OPT_PAGE0_REGS_ONLY;
+		break;
+	case ACPI_IORT_SMMU_V3_HISILICON_HI161X:
+		smmu->options |= ARM_SMMU_OPT_SKIP_PREFETCH;
+		break;
+	case ACPI_IORT_SMMU_V3_GENERIC:
+		/*
+		 * Tegra241 implementation stores its SMMU options and impl_dev
+		 * in DSDT. Thus, go through the ACPI tables unconditionally.
+		 */
+		acpi_smmu_dsdt_probe_tegra241_cmdqv(node, smmu);
+		break;
+	}
+
+	dev_notice(smmu->dev, "option mask 0x%x\n", smmu->options);
+	return 0;
+}
+
+static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
+				      struct arm_smmu_device *smmu)
+{
+	struct acpi_iort_smmu_v3 *iort_smmu;
+	struct device *dev = smmu->dev;
+	struct acpi_iort_node *node;
+
+	node = *(struct acpi_iort_node **)dev_get_platdata(dev);
+
+	/* Retrieve SMMUv3 specific data */
+	iort_smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
+
+	if (iort_smmu->flags & ACPI_IORT_SMMU_V3_COHACC_OVERRIDE)
+		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
+
+	switch (FIELD_GET(ACPI_IORT_SMMU_V3_HTTU_OVERRIDE, iort_smmu->flags)) {
+	case IDR0_HTTU_ACCESS_DIRTY:
+		smmu->features |= ARM_SMMU_FEAT_HD;
+		fallthrough;
+	case IDR0_HTTU_ACCESS:
+		smmu->features |= ARM_SMMU_FEAT_HA;
+	}
+
+	return acpi_smmu_iort_probe_model(node, smmu);
+}
+#else
+static inline int arm_smmu_device_acpi_probe(struct platform_device *pdev,
+					     struct arm_smmu_device *smmu)
+{
+	return -ENODEV;
+}
+#endif
+
+static int arm_smmu_device_dt_probe(struct platform_device *pdev,
+				    struct arm_smmu_device *smmu)
+{
+	struct device *dev = &pdev->dev;
+	u32 cells;
+	int ret = -EINVAL;
+
+	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
+		dev_err(dev, "missing #iommu-cells property\n");
+	else if (cells != 1)
+		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
+	else
+		ret = 0;
+
+	parse_driver_options(smmu);
+
+	if (of_dma_is_coherent(dev->of_node))
+		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
+
+	return ret;
+}
+
+int arm_smmu_fw_probe(struct platform_device *pdev,
+		      struct arm_smmu_device *smmu)
+{
+	if (smmu->dev->of_node)
+		return arm_smmu_device_dt_probe(pdev, smmu);
+	else
+		return arm_smmu_device_acpi_probe(pdev, smmu);
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6e6ac64a5399..4cd0a115fc0e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -9,7 +9,6 @@
  * This driver is powered by bad coffee and bombay mix.
  */
 
-#include <linux/acpi.h>
 #include <linux/acpi_iort.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
@@ -19,12 +18,8 @@
 #include <linux/io-pgtable.h>
 #include <linux/module.h>
 #include <linux/msi.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
-#include <linux/platform_device.h>
 #include <kunit/visibility.h>
 #include <uapi/linux/iommufd.h>
 
@@ -67,20 +62,9 @@ static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS][3] = {
 	},
 };
 
-struct arm_smmu_option_prop {
-	u32 opt;
-	const char *prop;
-};
-
 DEFINE_XARRAY_ALLOC1(arm_smmu_asid_xa);
 DEFINE_MUTEX(arm_smmu_asid_lock);
 
-static struct arm_smmu_option_prop arm_smmu_options[] = {
-	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
-	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
-	{ 0, NULL},
-};
-
 static const char * const event_str[] = {
 	[EVT_ID_BAD_STREAMID_CONFIG] = "C_BAD_STREAMID",
 	[EVT_ID_STE_FETCH_FAULT] = "F_STE_FETCH",
@@ -105,20 +89,6 @@ static const char * const event_class_str[] = {
 
 static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master);
 
-static void parse_driver_options(struct arm_smmu_device *smmu)
-{
-	int i = 0;
-
-	do {
-		if (of_property_read_bool(smmu->dev->of_node,
-						arm_smmu_options[i].prop)) {
-			smmu->options |= arm_smmu_options[i].opt;
-			dev_notice(smmu->dev, "option %s\n",
-				arm_smmu_options[i].prop);
-		}
-	} while (arm_smmu_options[++i].opt);
-}
-
 /* Low-level queue manipulation functions */
 static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
 {
@@ -3987,113 +3957,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-#ifdef CONFIG_ACPI
-#ifdef CONFIG_TEGRA241_CMDQV
-static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
-						struct arm_smmu_device *smmu)
-{
-	const char *uid = kasprintf(GFP_KERNEL, "%u", node->identifier);
-	struct acpi_device *adev;
-
-	/* Look for an NVDA200C node whose _UID matches the SMMU node ID */
-	adev = acpi_dev_get_first_match_dev("NVDA200C", uid, -1);
-	if (adev) {
-		/* Tegra241 CMDQV driver is responsible for put_device() */
-		smmu->impl_dev = &adev->dev;
-		smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
-		dev_info(smmu->dev, "found companion CMDQV device: %s\n",
-			 dev_name(smmu->impl_dev));
-	}
-	kfree(uid);
-}
-#else
-static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
-						struct arm_smmu_device *smmu)
-{
-}
-#endif
-
-static int acpi_smmu_iort_probe_model(struct acpi_iort_node *node,
-				      struct arm_smmu_device *smmu)
-{
-	struct acpi_iort_smmu_v3 *iort_smmu =
-		(struct acpi_iort_smmu_v3 *)node->node_data;
-
-	switch (iort_smmu->model) {
-	case ACPI_IORT_SMMU_V3_CAVIUM_CN99XX:
-		smmu->options |= ARM_SMMU_OPT_PAGE0_REGS_ONLY;
-		break;
-	case ACPI_IORT_SMMU_V3_HISILICON_HI161X:
-		smmu->options |= ARM_SMMU_OPT_SKIP_PREFETCH;
-		break;
-	case ACPI_IORT_SMMU_V3_GENERIC:
-		/*
-		 * Tegra241 implementation stores its SMMU options and impl_dev
-		 * in DSDT. Thus, go through the ACPI tables unconditionally.
-		 */
-		acpi_smmu_dsdt_probe_tegra241_cmdqv(node, smmu);
-		break;
-	}
-
-	dev_notice(smmu->dev, "option mask 0x%x\n", smmu->options);
-	return 0;
-}
-
-static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
-				      struct arm_smmu_device *smmu)
-{
-	struct acpi_iort_smmu_v3 *iort_smmu;
-	struct device *dev = smmu->dev;
-	struct acpi_iort_node *node;
-
-	node = *(struct acpi_iort_node **)dev_get_platdata(dev);
-
-	/* Retrieve SMMUv3 specific data */
-	iort_smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
-
-	if (iort_smmu->flags & ACPI_IORT_SMMU_V3_COHACC_OVERRIDE)
-		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
-
-	switch (FIELD_GET(ACPI_IORT_SMMU_V3_HTTU_OVERRIDE, iort_smmu->flags)) {
-	case IDR0_HTTU_ACCESS_DIRTY:
-		smmu->features |= ARM_SMMU_FEAT_HD;
-		fallthrough;
-	case IDR0_HTTU_ACCESS:
-		smmu->features |= ARM_SMMU_FEAT_HA;
-	}
-
-	return acpi_smmu_iort_probe_model(node, smmu);
-}
-#else
-static inline int arm_smmu_device_acpi_probe(struct platform_device *pdev,
-					     struct arm_smmu_device *smmu)
-{
-	return -ENODEV;
-}
-#endif
-
-static int arm_smmu_device_dt_probe(struct platform_device *pdev,
-				    struct arm_smmu_device *smmu)
-{
-	struct device *dev = &pdev->dev;
-	u32 cells;
-	int ret = -EINVAL;
-
-	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
-		dev_err(dev, "missing #iommu-cells property\n");
-	else if (cells != 1)
-		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
-	else
-		ret = 0;
-
-	parse_driver_options(smmu);
-
-	if (of_dma_is_coherent(dev->of_node))
-		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
-
-	return ret;
-}
-
 static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
 {
 	if (smmu->options & ARM_SMMU_OPT_PAGE0_REGS_ONLY)
@@ -4189,11 +4052,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	smmu->dev = dev;
 
-	if (dev->of_node) {
-		ret = arm_smmu_device_dt_probe(pdev, smmu);
-	} else {
-		ret = arm_smmu_device_acpi_probe(pdev, smmu);
-	}
+	ret = arm_smmu_fw_probe(pdev, smmu);
 	if (ret)
 		return ret;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 09c1cf85cccc..787296a2f0c2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -12,6 +12,7 @@
 #include <linux/iommufd.h>
 #include <linux/kernel.h>
 #include <linux/mmzone.h>
+#include <linux/platform_device.h>
 #include <linux/sizes.h>
 
 struct arm_smmu_device;
@@ -561,6 +562,8 @@ int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 			    struct arm_smmu_queue *q, void __iomem *page,
 			    unsigned long prod_off, unsigned long cons_off,
 			    size_t dwords, const char *name);
+int arm_smmu_fw_probe(struct platform_device *pdev,
+		      struct arm_smmu_device *smmu);
 
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
-- 
2.50.1.552.g942d659e1b-goog


