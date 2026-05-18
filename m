Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D76DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6k6H5UkquC9jXCz3d6dhfhBTmVIULl6CHKs8UijwLq8=; b=huGAB88kM/JUkSDgS5EbA8sqt+
	cRtrqRPr6aZpaTadO+JLB3TMTFZY0Ewp8BxJJKFsq90l5KiRy+GKWvxizuA1d53/nh3kBwcJgHqNI
	nO/L9i9e2HnVbhBq/X9YZ/JR1GKtiM6dDNouN4oR6e88r/prz3pgNO852OuJEm/lDoMjMJkDcrBTz
	H9AfezH0UC1y7jOsoFa1XJDbs6Q9ZjmARCgWkGv4bI4YlPiitnQZQWZrxGXPSZCOTsiCGCTSbfSHr
	RHZOgjPGeyWMbBqTnarAEMfNpMiKtM72YpEzrIAT2SzCjvavqNKtjEXhxEQgF6xMa/DyiM2eLcgz3
	0IhS36OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcK-0000000FWtg-04ZA;
	Mon, 18 May 2026 11:58:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcH-0000000FWrt-3YpO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6k6H5UkquC9jXCz3d6dhfhBTmVIULl6CHKs8UijwLq8=; b=f+jFYcp8W9TH2hS7mREDk+/Psu
	m23BmC1H4EUKiO7Ul+uQhIGXbmY4zleHyoVJJiHwcA/rdEDI1rkOUssQdgIcCszgf9AGpY9V6oF38
	iCV+Ej2clC1IACMz8690GDjnSjka/Dffsy9wNUiMhcjMfoKAvycQLmTebNSDcDQEsiNYisfGiPL+V
	JDljPJzwp+pkG1JssrBmpEl6D+pR5tjmXmtCd/cd0kLb+CuUjV1DTqBlBG9Ri/dI4ZvpJim6JUIhZ
	lO5oDVpXFSX8209iB6270XNlLkivBTSpmc6wYno+Pl7uia7N7HVeBPSHSPeo7mSPtax1mb2CkZEqu
	oTuOLuJg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcD-0000000B2GQ-0TlT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:58:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A7511CE0;
	Mon, 18 May 2026 04:58:27 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FB4A3F85F;
	Mon, 18 May 2026 04:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779105512; bh=VBlXOTXQbKAdsShF6qFXMsgKYyrtlFR0YPM4M0Q4J+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iKI3kJ1P2tpugrijq9UeEOqiaR0keIg6UiKca9y1KPs//sWHVKfSzwvx7mug9QL8e
	 IUKR8qj5VTHtKEe9RXeGOXA6o6JBxYe1v+k0YJvoioUjSFrTvOyzDN6uum7vrky2Ls
	 dmFZhp2KyjLWI7JadYq1I0WL2WkExYlsNAYCgcEY=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Mon, 18 May 2026 12:57:46 +0100
Subject: [PATCH v4 03/10] ACPI: APEI: GHES: move GHESv2 ack and alloc
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-3-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
To: rafael@kernel.org, bp@alien8.de, saket.dumbre@intel.com, 
 will@kernel.org, xueshuai@linux.alibaba.com, mchehab@kernel.org, 
 krzk+dt@kernel.org, dave@stgolabs.net, conor+dt@kernel.org, 
 vishal.l.verma@intel.com, jic23@kernel.org, corbet@lwn.net, 
 guohanjun@huawei.com, dave.jiang@intel.com, catalin.marinas@arm.com, 
 lenb@kernel.org, tony.luck@intel.com, skhan@linuxfoundation.org, 
 djbw@kernel.org, alison.schofield@intel.com, ira.weiny@intel.com, 
 robh@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, linux-cxl@vger.kernel.org, Michael.Zhao2@arm.com, 
 acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779105490; l=4727;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=VBlXOTXQbKAdsShF6qFXMsgKYyrtlFR0YPM4M0Q4J+4=;
 b=RG6MQi029/Wuzz7XeYkDq/Om18yJLIEx7woMY5OKLHb/PTBReZRKAJvoBlDX6NnEw1ydohh4v
 fpetPBS2w0xDLTunNw30MMk3SHQqStqzCwo85eA3/Y7ZshTASiznpM0
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125834_510899_8261E606 
X-CRM114-Status: GOOD (  11.76  )
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


