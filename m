Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B373ED6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWVNh10a0iJOwgzz0auI6gD6kYFtI1jjn2GN79kBQFs=; b=n/BY488+tLA/8BektAS27xxqeh
	/K/G1xAatN4egrybXjV/27pC9XcQSfdTZ5aHy4rwOhmIzLXTxi1JM6EmMLz5+VWgbUJFBfAem/SrJ
	qi/Z+6IZ2hpo3UrPKODNPEz87p6H1ioiieg3vX6qUofIAxoCqAW1YItAnbNqm2TMaHOqhoYmjLigB
	rOa9Ly2ZDTlNJvcJtgzbRGmB0+Sl5To82CJTlhNH9zuzq03HSqxvIgdpRrUvOXA0se9nlTiTZR35+
	O8ws/qa3cLouwnn987/nOJswewqce6dCMljvlgkF9pagU9kYvI/aYIeq5Ettlk80P1m0d+PChjOLf
	NHAgesBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpjg-00000006iuK-1Bsu;
	Wed, 17 Dec 2025 11:30:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpje-00000006itL-2vTn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:30:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A1DD1517;
	Wed, 17 Dec 2025 03:30:18 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D61B53F73B;
	Wed, 17 Dec 2025 03:30:23 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 06/12] efi/cper: adopt estatus iteration helpers
Date: Wed, 17 Dec 2025 11:28:39 +0000
Message-ID: <20251217112845.1814119-7-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_033026_823405_59193EE7 
X-CRM114-Status: GOOD (  13.30  )
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

Switch the CPER printer and validator to the estatus_*() accessor
wrappers introduced by the new core. This is a mechanical change that
replaces the local acpi_hest_*() helpers with their aliases and keeps
the section iteration code shared ahead of the GHES conversion.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/firmware/efi/cper.c | 29 +++++++++++++-------------
 include/acpi/ghes.h         | 41 ++-----------------------------------
 2 files changed, 17 insertions(+), 53 deletions(-)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index 0232bd040f61..07119940486a 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -26,6 +26,7 @@
 #include <acpi/ghes.h>
 #include <ras/ras_event.h>
 #include <cxl/event.h>
+#include <linux/estatus.h>
 
 /*
  * CPER record ID need to be unique even after reboot, because record
@@ -525,7 +526,7 @@ static void cper_print_fw_err(const char *pfx,
 			      struct acpi_hest_generic_data *gdata,
 			      const struct cper_sec_fw_err_rec_ref *fw_err)
 {
-	void *buf = acpi_hest_get_payload(gdata);
+	void *buf = estatus_get_payload(gdata);
 	u32 offset, length = gdata->error_data_length;
 
 	printk("%s""Firmware Error Record Type: %s\n", pfx,
@@ -607,7 +608,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 	__u16 severity;
 	char newpfx[64];
 
-	if (acpi_hest_get_version(gdata) >= 3)
+	if (estatus_get_version(gdata) >= 3)
 		cper_print_tstamp(pfx, (struct acpi_hest_generic_data_v300 *)gdata);
 
 	severity = gdata->error_severity;
@@ -628,7 +629,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 	}
 
 	if (guid_equal(sec_type, &CPER_SEC_PROC_GENERIC)) {
-		struct cper_sec_proc_generic *proc_err = acpi_hest_get_payload(gdata);
+		struct cper_sec_proc_generic *proc_err = estatus_get_payload(gdata);
 
 		printk("%s""section_type: general processor error\n", newpfx);
 		if (gdata->error_data_length >= sizeof(*proc_err))
@@ -636,7 +637,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 		else
 			goto err_section_too_small;
 	} else if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
-		struct cper_sec_mem_err *mem_err = acpi_hest_get_payload(gdata);
+		struct cper_sec_mem_err *mem_err = estatus_get_payload(gdata);
 
 		printk("%s""section_type: memory error\n", newpfx);
 		if (gdata->error_data_length >=
@@ -646,7 +647,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 		else
 			goto err_section_too_small;
 	} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
-		struct cper_sec_pcie *pcie = acpi_hest_get_payload(gdata);
+		struct cper_sec_pcie *pcie = estatus_get_payload(gdata);
 
 		printk("%s""section_type: PCIe error\n", newpfx);
 		if (gdata->error_data_length >= sizeof(*pcie))
@@ -655,7 +656,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 			goto err_section_too_small;
 #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
 	} else if (guid_equal(sec_type, &CPER_SEC_PROC_ARM)) {
-		struct cper_sec_proc_arm *arm_err = acpi_hest_get_payload(gdata);
+		struct cper_sec_proc_arm *arm_err = estatus_get_payload(gdata);
 
 		printk("%ssection_type: ARM processor error\n", newpfx);
 		if (gdata->error_data_length >= sizeof(*arm_err))
@@ -665,7 +666,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 #endif
 #if defined(CONFIG_UEFI_CPER_X86)
 	} else if (guid_equal(sec_type, &CPER_SEC_PROC_IA)) {
-		struct cper_sec_proc_ia *ia_err = acpi_hest_get_payload(gdata);
+		struct cper_sec_proc_ia *ia_err = estatus_get_payload(gdata);
 
 		printk("%ssection_type: IA32/X64 processor error\n", newpfx);
 		if (gdata->error_data_length >= sizeof(*ia_err))
@@ -674,7 +675,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 			goto err_section_too_small;
 #endif
 	} else if (guid_equal(sec_type, &CPER_SEC_FW_ERR_REC_REF)) {
-		struct cper_sec_fw_err_rec_ref *fw_err = acpi_hest_get_payload(gdata);
+		struct cper_sec_fw_err_rec_ref *fw_err = estatus_get_payload(gdata);
 
 		printk("%ssection_type: Firmware Error Record Reference\n",
 		       newpfx);
@@ -684,7 +685,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 		else
 			goto err_section_too_small;
 	} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
-		struct cxl_cper_sec_prot_err *prot_err = acpi_hest_get_payload(gdata);
+		struct cxl_cper_sec_prot_err *prot_err = estatus_get_payload(gdata);
 
 		printk("%ssection_type: CXL Protocol Error\n", newpfx);
 		if (gdata->error_data_length >= sizeof(*prot_err))
@@ -692,7 +693,7 @@ cper_estatus_print_section(const char *pfx, struct acpi_hest_generic_data *gdata
 		else
 			goto err_section_too_small;
 	} else {
-		const void *err = acpi_hest_get_payload(gdata);
+		const void *err = estatus_get_payload(gdata);
 
 		printk("%ssection type: unknown, %pUl\n", newpfx, sec_type);
 		printk("%ssection length: %#x\n", newpfx,
@@ -723,7 +724,7 @@ void cper_estatus_print(const char *pfx,
 	printk("%s""event severity: %s\n", pfx, cper_severity_str(severity));
 	snprintf(newpfx, sizeof(newpfx), "%s ", pfx);
 
-	apei_estatus_for_each_section(estatus, gdata) {
+	estatus_for_each_section(estatus, gdata) {
 		cper_estatus_print_section(newpfx, gdata, sec_no);
 		sec_no++;
 	}
@@ -755,11 +756,11 @@ int cper_estatus_check(const struct acpi_hest_generic_status *estatus)
 
 	data_len = estatus->data_length;
 
-	apei_estatus_for_each_section(estatus, gdata) {
-		if (acpi_hest_get_size(gdata) > data_len)
+	estatus_for_each_section(estatus, gdata) {
+		if (estatus_get_size(gdata) > data_len)
 			return -EINVAL;
 
-		record_size = acpi_hest_get_record_size(gdata);
+		record_size = estatus_get_record_size(gdata);
 		if (record_size > data_len)
 			return -EINVAL;
 
diff --git a/include/acpi/ghes.h b/include/acpi/ghes.h
index ebd21b05fe6e..022c0325f1e0 100644
--- a/include/acpi/ghes.h
+++ b/include/acpi/ghes.h
@@ -4,6 +4,7 @@
 
 #include <acpi/apei.h>
 #include <acpi/hed.h>
+#include <linux/estatus.h>
 
 /*
  * One struct ghes is created for each generic hardware error source.
@@ -80,46 +81,8 @@ static inline void ghes_estatus_pool_region_free(unsigned long addr, u32 size) {
 
 int ghes_estatus_pool_init(unsigned int num_ghes);
 
-static inline int acpi_hest_get_version(struct acpi_hest_generic_data *gdata)
-{
-	return gdata->revision >> 8;
-}
-
-static inline void *acpi_hest_get_payload(struct acpi_hest_generic_data *gdata)
-{
-	if (acpi_hest_get_version(gdata) >= 3)
-		return (void *)(((struct acpi_hest_generic_data_v300 *)(gdata)) + 1);
-
-	return gdata + 1;
-}
-
-static inline int acpi_hest_get_error_length(struct acpi_hest_generic_data *gdata)
-{
-	return ((struct acpi_hest_generic_data *)(gdata))->error_data_length;
-}
-
-static inline int acpi_hest_get_size(struct acpi_hest_generic_data *gdata)
-{
-	if (acpi_hest_get_version(gdata) >= 3)
-		return sizeof(struct acpi_hest_generic_data_v300);
-
-	return sizeof(struct acpi_hest_generic_data);
-}
-
-static inline int acpi_hest_get_record_size(struct acpi_hest_generic_data *gdata)
-{
-	return (acpi_hest_get_size(gdata) + acpi_hest_get_error_length(gdata));
-}
-
-static inline void *acpi_hest_get_next(struct acpi_hest_generic_data *gdata)
-{
-	return (void *)(gdata) + acpi_hest_get_record_size(gdata);
-}
-
 #define apei_estatus_for_each_section(estatus, section)			\
-	for (section = (struct acpi_hest_generic_data *)(estatus + 1);	\
-	     (void *)section - (void *)(estatus + 1) < estatus->data_length; \
-	     section = acpi_hest_get_next(section))
+	estatus_for_each_section(estatus, section)
 
 #ifdef CONFIG_ACPI_APEI_SEA
 int ghes_notify_sea(void);
-- 
2.43.0


