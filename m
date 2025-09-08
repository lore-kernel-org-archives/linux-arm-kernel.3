Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1ADCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itMVAIuU9neUFSPW1GyBykR8LYhPXPJX8oN2vlMI80s=; b=Gtz6cmf9vkzbJQCdevR/6/cHZE
	wILYbxg8mI8VUFw8JDWWWT0shP52f8fb+RciziZt9R9GuKZqHy9mwdWLg4kaBvaiUwcxkzQCnrPo+
	mfp7j9UmQSHWHC9mUrjcG9lgS0mZmrrUU5hHQ8Val5xm82e6YHqlLOFSLUB7bsqxcTlY3WtCGBxXF
	YqZj5Dn582cr3mB6eLASc/mlQfZcETGswr5MD+lH5FzuCeH9QBym/UzAU03KS4fvLhbvFhTz0ZOH2
	xW6hpVWzlh8j2/ylpRinf4Lj1dnIefcf0kccfiAFruQC2N84Tc1dY4Euk/ZLzpmsOHJmm4kbliFli
	Hy2OosZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDI-00000004rIN-1eUb;
	Tue, 09 Sep 2025 06:52:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvkSY-00000002kqg-22YE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 22:35:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C3D33024;
	Mon,  8 Sep 2025 15:35:29 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57A583F694;
	Mon,  8 Sep 2025 15:35:36 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	gshan@redhat.com,
	aneesh.kumar@kernel.org,
	sami.mujawar@arm.com,
	sudeep.holla@arm.com,
	steven.price@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 3/3] arm64: acpi: Enable ACPI CCEL support
Date: Mon,  8 Sep 2025 23:35:19 +0100
Message-ID: <20250908223519.1759020-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908223519.1759020-1-suzuki.poulose@arm.com>
References: <20250908223519.1759020-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_153538_560588_B16997F9 
X-CRM114-Status: GOOD (  11.33  )
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

Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
As per UEFI specifications NVS memory is reserved for Firmware use even
after exiting boot services. Thus map the region as read-only.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v1
 - Map NVS region as read-only, update comment to clarify that the region
   is reserved for firmware use.

---
 arch/arm64/kernel/acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 4d529ff7ba51..93b70f48a51f 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -360,6 +360,17 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 			prot = PAGE_KERNEL_RO;
 			break;
 
+		case EFI_ACPI_MEMORY_NVS:
+			/*
+			 * ACPI NVS marks an area reserved for use by the
+			 * firmware, even after exiting the boot service.
+			 * This may be used by the firmware for sharing dynamic
+			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
+			 * as read-only.
+			 */
+			prot = PAGE_KERNEL_RO;
+			break;
+
 		case EFI_ACPI_RECLAIM_MEMORY:
 			/*
 			 * ACPI reclaim memory is used to pass firmware tables
-- 
2.43.0


