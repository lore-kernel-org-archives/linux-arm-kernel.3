Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03013FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxaLd0a2Sn6KcVv/ZMODUfI9o8SCW3dZ3IdUkaIaj7c=; b=wMKPM1+LRFYCIhWA9SYv71yuxu
	DyEoJ3WtjyDnAhnY+PobojjEHGvbOmD7pjWvIFNrzvIjE59Gp0sqJCsjzOposhNEcYPb3O+cjhOwO
	9AM1nXB90+D/7FDXKZ9Z+vPYyuq9cFxctNzR+0uVlmpUsIB81jHMyyl20KIQphUBqUBHA6BGXU3L4
	aNRxNUmQlfBmDP3I7esbZerCxbIIRrFA/aWLpRvSYDISDuXPuH8BjGNHvjIzridbcc07cPtRbBvzd
	BvJmXICH1e4h0CmVoTha4o31zRem+ABjRxY1eDp4YtMJyfqxOBYsCmKvuGvz2UU0OW08KaEHpuij9
	59fgMHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2H1-00000003Saw-207v;
	Wed, 29 Apr 2026 10:36:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Gy-00000003SZP-24JF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 10:36:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D26D2A68;
	Wed, 29 Apr 2026 03:35:57 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1059E3F763;
	Wed, 29 Apr 2026 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777458962; bh=gEQoOm606sq0QAeMXDk5A5t5RiKdbJXtdZhq1rCtCcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s3UbOyqwiwf1NDujghcg+67PfHz+/NC6F5J+TBy4mrw4Q7hC00iUreGMvap4NiOBF
	 VJ33w9MfQIbc8mdsoOHoDEsFNDyJobLyZabUUXbAksCfp5ok6+7ohTSjbb8uL/xRUJ
	 4S/FbqnJKgTXIul0BofwGB4LdyFWgB0p6LAZoMpQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	sudeep.holla@arm.com,
	robh@kernel.org,
	maz@kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [RFC PATCH 1/4] arm64: acpi: Refactor FADT table verification
Date: Wed, 29 Apr 2026 11:35:32 +0100
Message-ID: <20260429103535.266728-2-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429103535.266728-1-suzuki.poulose@arm.com>
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_033604_657453_4D6751C5 
X-CRM114-Status: GOOD (  15.18  )
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

Refactor the FADT sanity check, such that this could be reused. We are soon
going to consume the FADT early at boot for probing the PSCI conduit, and this
will be of use.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kernel/acpi.c | 55 +++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index af90128cfed5..30c7b11a8a9d 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -118,6 +118,34 @@ bool acpi_psci_use_hvc(void)
 	return acpi_gbl_FADT.arm_boot_flags & ACPI_FADT_PSCI_USE_HVC;
 }
 
+static int __init __acpi_fadt_sanity_check(struct acpi_table_fadt *fadt)
+{
+	struct acpi_table_header *table = (struct acpi_table_header *)fadt;
+
+	/*
+	 * Revision in table header is the FADT Major revision, and there
+	 * is a minor revision of FADT which was introduced by ACPI 5.1,
+	 * we only deal with ACPI 5.1 or newer revision to get GIC and SMP
+	 * boot protocol configuration data.
+	 */
+	if (table->revision < 5 ||
+	   (table->revision == 5 && fadt->minor_revision < 1)) {
+		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 5.1+\n",
+		       table->revision, fadt->minor_revision);
+
+		if (!fadt->arm_boot_flags) {
+			return -EINVAL;
+		}
+		pr_err("FADT has ARM boot flags set, assuming 5.1\n");
+	}
+
+	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {
+		pr_err("FADT not ACPI hardware reduced compliant\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
 /*
  * acpi_fadt_sanity_check() - Check FADT presence and carry out sanity
  *			      checks on it
@@ -127,7 +155,6 @@ bool acpi_psci_use_hvc(void)
 static int __init acpi_fadt_sanity_check(void)
 {
 	struct acpi_table_header *table;
-	struct acpi_table_fadt *fadt;
 	acpi_status status;
 	int ret = 0;
 
@@ -143,32 +170,8 @@ static int __init acpi_fadt_sanity_check(void)
 		return -ENODEV;
 	}
 
-	fadt = (struct acpi_table_fadt *)table;
+	ret = __acpi_fadt_sanity_check((struct acpi_table_fadt *)table);
 
-	/*
-	 * Revision in table header is the FADT Major revision, and there
-	 * is a minor revision of FADT which was introduced by ACPI 5.1,
-	 * we only deal with ACPI 5.1 or newer revision to get GIC and SMP
-	 * boot protocol configuration data.
-	 */
-	if (table->revision < 5 ||
-	   (table->revision == 5 && fadt->minor_revision < 1)) {
-		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 5.1+\n",
-		       table->revision, fadt->minor_revision);
-
-		if (!fadt->arm_boot_flags) {
-			ret = -EINVAL;
-			goto out;
-		}
-		pr_err("FADT has ARM boot flags set, assuming 5.1\n");
-	}
-
-	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {
-		pr_err("FADT not ACPI hardware reduced compliant\n");
-		ret = -EINVAL;
-	}
-
-out:
 	/*
 	 * acpi_get_table() creates FADT table mapping that
 	 * should be released after parsing and before resuming boot
-- 
2.43.0


