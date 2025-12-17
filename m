Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D78BD6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msZEOKwr7UuZPFWt0LOIj/RToTNL6k8Dgg3u21SwmYU=; b=dTVv6BWBO4+NUtRTAbKbOyQj3b
	mToZuDNflmY+30Y31Jpr60N1w+Be9PMruqxAcSsW4VtIx1COJ7B73bWej3va8SwAVocHbrCzJrNwa
	hdsCJKipCvyhjCfLGPbOMfYPjrwFx3RwiOMfgCgvss4JOYXCGbYiibvjlF2fVRpAnrSKc4s2j0qrP
	SYzctsioKtTvHYChyQBq+dshNzMaLqXUUdJ2ZWDELIjeQHuiqXZ45hVuTziUN/UZJVBBwth0TdTs3
	SAnZgyngvo7RJ8YKC2TCPjS4Xb0Xg9gEGflrHCvi5QhL5fjZ5yAK5DXp2pA9lj4nIzKeBGu3hjnOa
	nxQrcp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpjO-00000006inM-1hZl;
	Wed, 17 Dec 2025 11:30:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpjM-00000006imR-0miy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:30:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 529A71516;
	Wed, 17 Dec 2025 03:30:00 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 971CD3F73B;
	Wed, 17 Dec 2025 03:30:05 -0800 (PST)
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
Subject: [PATCH 05/12] ras: flesh out estatus processing core
Date: Wed, 17 Dec 2025 11:28:38 +0000
Message-ID: <20251217112845.1814119-6-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_033008_352748_733EAE32 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Complete the estatus core by adding the cache throttling logic, vendor
record notifier plumbing, IRQ/NMI queue handling and the processing
paths that walk CPER records. Landing the full implementation ahead of
the GHES conversion keeps the follow-on patches focused on their call
sites while leaving behaviour unchanged for existing users.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/firmware/efi/estatus.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/efi/estatus.c b/drivers/firmware/efi/estatus.c
index 8b62b23e2e93..8043d68f907b 100644
--- a/drivers/firmware/efi/estatus.c
+++ b/drivers/firmware/efi/estatus.c
@@ -32,6 +32,7 @@
 
 void estatus_pool_region_free(unsigned long addr, u32 size);
 
+/* Emit a printk at the exact level encoded in the HW_ERR tag we build. */
 static void estatus_log_hw_error(char level, const char *seq_tag,
 				 const char *name)
 {
@@ -704,7 +705,7 @@ static bool estatus_handle_arm_hw_error(estatus_generic_data *gdata, int sev, bo
  * ESTATUS_SEV_PANIC does not make it to this handling since the kernel must
  *     panic.
  */
-static void estatus_handle_aer(estatus_generic_data *gdata)
+static void estatus_handle_aer(struct acpi_hest_generic_data *gdata)
 {
 #ifdef CONFIG_ACPI_APEI_PCIEAER
 	struct cper_sec_pcie *pcie_err = estatus_get_payload(gdata);
@@ -759,7 +760,7 @@ EXPORT_SYMBOL_GPL(estatus_unregister_vendor_record_notifier);
 static void estatus_vendor_record_work_func(struct work_struct *work)
 {
 	struct estatus_vendor_record_entry *entry;
-	estatus_generic_data *gdata;
+	struct acpi_hest_generic_data *gdata;
 	u32 len;
 
 	entry = container_of(work, struct estatus_vendor_record_entry, work);
@@ -774,7 +775,7 @@ static void estatus_vendor_record_work_func(struct work_struct *work)
 
 static void estatus_defer_non_standard_event(estatus_generic_data *gdata, int sev)
 {
-	estatus_generic_data *copied_gdata;
+	struct acpi_hest_generic_data *copied_gdata;
 	struct estatus_vendor_record_entry *entry;
 	u32 len;
 
@@ -806,7 +807,7 @@ static inline bool estatus_is_sync_notify(struct estatus_source *source)
 static void estatus_do_proc(struct estatus_source *source, const estatus_generic_status *estatus)
 {
 	int sev, sec_sev;
-	estatus_generic_data *gdata;
+	struct acpi_hest_generic_data *gdata;
 	guid_t *sec_type;
 	const guid_t *fru_id = &guid_null;
 	char *fru_text = "";
@@ -871,7 +872,7 @@ static void __estatus_panic(struct estatus_source *source, estatus_generic_statu
 
 int estatus_proc(struct estatus_source *source)
 {
-	estatus_generic_status *estatus = source->estatus;
+	struct acpi_hest_generic_status *estatus = source->estatus;
 	phys_addr_t buf_paddr;
 	enum fixed_addresses fixmap_idx = estatus_source_fixmap(source);
 	int rc;
@@ -913,7 +914,7 @@ void estatus_proc_in_irq(struct irq_work *irq_work)
 {
 	struct llist_node *llnode, *next;
 	struct estatus_node *estatus_node;
-	struct estatus_source *source;
+	struct acpi_hest_generic_status *source;
 	estatus_generic_status *estatus;
 	u32 len, node_len;
 
@@ -927,7 +928,7 @@ void estatus_proc_in_irq(struct irq_work *irq_work)
 		next = llnode->next;
 		estatus_node = llist_entry(llnode, struct estatus_node,
 					   llnode);
-		source = estatus_node->source;
+		struct estatus_source *source = estatus_node->source;
 		estatus = ESTATUS_FROM_NODE(estatus_node);
 		len = estatus_len(estatus);
 		node_len = ESTATUS_NODE_LEN(len);
@@ -949,7 +950,7 @@ static void estatus_print_queued_estatus(void)
 	struct llist_node *llnode;
 	struct estatus_node *estatus_node;
 	struct estatus_source *source;
-	estatus_generic_status *estatus;
+	struct acpi_hest_generic_status *estatus;
 
 	llnode = llist_del_all(&estatus_llist);
 	/*
@@ -976,7 +977,7 @@ void estatus_report_mem_error(int sev, struct cper_sec_mem_err *mem_err)
 
 int estatus_in_nmi_queue_one_entry(struct estatus_source *source, enum fixed_addresses fixmap_idx)
 {
-	estatus_generic_status *estatus, tmp_header;
+	struct acpi_hest_generic_status *estatus, tmp_header;
 	struct estatus_node *estatus_node;
 	u32 len, node_len;
 	phys_addr_t buf_paddr;
-- 
2.43.0


