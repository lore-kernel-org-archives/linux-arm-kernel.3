Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1DCCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6k6H5UkquC9jXCz3d6dhfhBTmVIULl6CHKs8UijwLq8=; b=kgmF7sQ8Dx2X53QdYmkZ2GobxW
	QjEzGwMLM3ouc47WOprxq+lUMDpLNDAfsFsmwpMxZW1RBtA08v7eTYvLDHL8H7ZtiJZQoDwldMCP0
	seitARqA0ahdQJKVpQG5gU66Ab/RzI2HYaGLOMl7bxZiZD7yyOlJhuFu6Q7UxXyJs0BYH9nV1T6fD
	n65lFIXNQhqd2iPWoJ99tkj3U2X5XrhoU5eA6mJ27x8TNQnD+1TaZkKWwQplM9mGy9UlU5+XLRlZ/
	lAu/UVcf9DSWxteBVj4KDspZHeIlersg5EtUUakJWUOctdJfWnpzYMyw3skcrZDTOnKC0GoOveGeG
	km8xcewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStsL-000000076VP-2JOc;
	Fri, 29 May 2026 09:51:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStsH-000000076T7-2OQq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:51:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5438132E5;
	Fri, 29 May 2026 02:51:23 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7DE23F905;
	Fri, 29 May 2026 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048288; bh=VBlXOTXQbKAdsShF6qFXMsgKYyrtlFR0YPM4M0Q4J+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B4irZ3Z4/zfk0EBeRDsa/WC/W5U5zyLZKeSj8pIUCTaeWyiHuZK2T6hhOsssIzI2J
	 uKFz1Qg+ZRViPXJzaOaEsHuTeAmrI7BDU5gWnllKWp7PXHp+eoWPQDzCdfHiBsulOQ
	 L0Q4umz2ph3b22RfxH7/4DA2p2MdCeHitrCVLrzU=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Fri, 29 May 2026 10:50:43 +0100
Subject: [PATCH v5 03/10] ACPI: APEI: GHES: move GHESv2 ack and alloc
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-3-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
To: will@kernel.org, jic23@kernel.org, xueshuai@linux.alibaba.com, 
 saket.dumbre@intel.com, mchehab@kernel.org, dave@stgolabs.net, 
 djbw@kernel.org, bp@alien8.de, tony.luck@intel.com, guohanjun@huawei.com, 
 lenb@kernel.org, skhan@linuxfoundation.org, vishal.l.verma@intel.com, 
 rafael@kernel.org, corbet@lwn.net, ira.weiny@intel.com, 
 dave.jiang@intel.com, krzk+dt@kernel.org, robh@kernel.org, 
 catalin.marinas@arm.com, alison.schofield@intel.com, conor+dt@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, linux-arm-kernel@lists.infradead.org, 
 Michael.Zhao2@arm.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org, 
 acpica-devel@lists.linux.dev
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780048269; l=4727;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=VBlXOTXQbKAdsShF6qFXMsgKYyrtlFR0YPM4M0Q4J+4=;
 b=UJCFPKdH2IlyS25gSMshUk/Zhz1uXbuPB5ZLh9cN+UWLZeQvUTAEEAolq+bBCezwHYeCELlo/
 Q6TewpzQghHD+7sIOe+8rhHVQDivdsgQYaOslhm18D2QBD5EZw9OEkW
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_025129_712087_7C181926 
X-CRM114-Status: GOOD (  11.79  )
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

Move the GHESv2 acknowledgment and error-source allocation helpers from
ghes.c into ghes_cper.c. This is a mechanical refactor that keeps the
logic unchanged while making the helpers reusable.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/ghes.c      | 65 -------------------------------------------
 drivers/acpi/apei/ghes_cper.c | 65 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 3f35580e8efd..91638ae7e05e 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -163,71 +163,6 @@ void ghes_estatus_pool_region_free(unsigned long addr, u32 size)
 }
 EXPORT_SYMBOL_GPL(ghes_estatus_pool_region_free);
 
-static int map_gen_v2(struct ghes *ghes)
-{
-	return apei_map_generic_address(&ghes->generic_v2->read_ack_register);
-}
-
-static void unmap_gen_v2(struct ghes *ghes)
-{
-	apei_unmap_generic_address(&ghes->generic_v2->read_ack_register);
-}
-
-struct ghes *ghes_new(struct acpi_hest_generic *generic)
-{
-	struct ghes *ghes;
-	unsigned int error_block_length;
-	int rc;
-
-	ghes = kzalloc_obj(*ghes);
-	if (!ghes)
-		return ERR_PTR(-ENOMEM);
-
-	ghes->generic = generic;
-	if (is_hest_type_generic_v2(ghes)) {
-		rc = map_gen_v2(ghes);
-		if (rc)
-			goto err_free;
-	}
-
-	rc = apei_map_generic_address(&generic->error_status_address);
-	if (rc)
-		goto err_unmap_read_ack_addr;
-	error_block_length = generic->error_block_length;
-	if (error_block_length > GHES_ESTATUS_MAX_SIZE) {
-		pr_warn(FW_WARN GHES_PFX
-			"Error status block length is too long: %u for "
-			"generic hardware error source: %d.\n",
-			error_block_length, generic->header.source_id);
-		error_block_length = GHES_ESTATUS_MAX_SIZE;
-	}
-	ghes->estatus = kmalloc(error_block_length, GFP_KERNEL);
-	ghes->estatus_length = error_block_length;
-	if (!ghes->estatus) {
-		rc = -ENOMEM;
-		goto err_unmap_status_addr;
-	}
-
-	return ghes;
-
-err_unmap_status_addr:
-	apei_unmap_generic_address(&generic->error_status_address);
-err_unmap_read_ack_addr:
-	if (is_hest_type_generic_v2(ghes))
-		unmap_gen_v2(ghes);
-err_free:
-	kfree(ghes);
-	return ERR_PTR(rc);
-}
-
-void ghes_fini(struct ghes *ghes)
-{
-	kfree(ghes->estatus);
-	apei_unmap_generic_address(&ghes->generic->error_status_address);
-	if (is_hest_type_generic_v2(ghes))
-		unmap_gen_v2(ghes);
-}
-
 static inline int ghes_severity(int severity)
 {
 	switch (severity) {
diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
index 7bb72fe57838..8080e0f76dac 100644
--- a/drivers/acpi/apei/ghes_cper.c
+++ b/drivers/acpi/apei/ghes_cper.c
@@ -62,6 +62,71 @@ static void ghes_ack_error(struct acpi_hest_generic_v2 *gv2)
 	apei_write(val, &gv2->read_ack_register);
 }
 
+static int map_gen_v2(struct ghes *ghes)
+{
+	return apei_map_generic_address(&ghes->generic_v2->read_ack_register);
+}
+
+static void unmap_gen_v2(struct ghes *ghes)
+{
+	apei_unmap_generic_address(&ghes->generic_v2->read_ack_register);
+}
+
+struct ghes *ghes_new(struct acpi_hest_generic *generic)
+{
+	struct ghes *ghes;
+	unsigned int error_block_length;
+	int rc;
+
+	ghes = kzalloc_obj(*ghes);
+	if (!ghes)
+		return ERR_PTR(-ENOMEM);
+
+	ghes->generic = generic;
+	if (is_hest_type_generic_v2(ghes)) {
+		rc = map_gen_v2(ghes);
+		if (rc)
+			goto err_free;
+	}
+
+	rc = apei_map_generic_address(&generic->error_status_address);
+	if (rc)
+		goto err_unmap_read_ack_addr;
+	error_block_length = generic->error_block_length;
+	if (error_block_length > GHES_ESTATUS_MAX_SIZE) {
+		pr_warn(FW_WARN GHES_PFX
+			"Error status block length is too long: %u for "
+			"generic hardware error source: %d.\n",
+			error_block_length, generic->header.source_id);
+		error_block_length = GHES_ESTATUS_MAX_SIZE;
+	}
+	ghes->estatus = kmalloc(error_block_length, GFP_KERNEL);
+	ghes->estatus_length = error_block_length;
+	if (!ghes->estatus) {
+		rc = -ENOMEM;
+		goto err_unmap_status_addr;
+	}
+
+	return ghes;
+
+err_unmap_status_addr:
+	apei_unmap_generic_address(&generic->error_status_address);
+err_unmap_read_ack_addr:
+	if (is_hest_type_generic_v2(ghes))
+		unmap_gen_v2(ghes);
+err_free:
+	kfree(ghes);
+	return ERR_PTR(rc);
+}
+
+void ghes_fini(struct ghes *ghes)
+{
+	kfree(ghes->estatus);
+	apei_unmap_generic_address(&ghes->generic->error_status_address);
+	if (is_hest_type_generic_v2(ghes))
+		unmap_gen_v2(ghes);
+}
+
 static void ghes_copy_tofrom_phys(void *buffer, u64 paddr, u32 len,
 				  int from_phys,
 				  enum fixed_addresses fixmap_idx)

-- 
2.43.0


