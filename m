Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20EDCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmwmIFZuShpsYf+p1YhvCHnSqOW8ZriTxg/lwdpz0po=; b=ooitl9RmasohvBhbZWntNgr/4A
	e7Ynd3HKL/690UizLG7r14ceKs9hArBMXs5WeqEhH63PYJgLjijoqUagl11ZYqZUftGuV7wRZ//of
	MbxH5bnaF+1f2syizoZye2mRkfeWTlU1BF9kRT6DBbIo56FTr71k+jIWmYjl5sVUy+9eaX2ST8642
	uzjWi6xD7zEMDvFbKOBfFXLoLP0YopAmvH7zpfOttdTyIv24teFNo7VUwV3ftUaS07sUoqsApy5NQ
	wWtkZabhLbiLChmQtuPscSVzRk97pcYmNiZ8K3s8E8/cS4mFQoOWxs4MsqHPWEcnc76XpCJNuI5Ui
	WLKdydAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEBg-0000000HT9Q-3vVE;
	Thu, 18 Sep 2025 12:56:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEBe-0000000HT7r-0gVT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:56:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 167E61AED;
	Thu, 18 Sep 2025 05:56:25 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E20AB3F66E;
	Thu, 18 Sep 2025 05:56:31 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: acpi: Enable ACPI CCEL support
Date: Thu, 18 Sep 2025 13:56:18 +0100
Message-ID: <20250918125618.2125733-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918125618.2125733-1-suzuki.poulose@arm.com>
References: <20250918125618.2125733-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_055634_244429_187D1465 
X-CRM114-Status: GOOD (  10.86  )
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
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Sami Mujawar <sami.mujawar@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kernel/acpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 4d529ff7ba51..b3195b3b895f 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -357,6 +357,16 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 			 * as long as we take care not to create a writable
 			 * mapping for executable code.
 			 */
+			fallthrough;
+
+		case EFI_ACPI_MEMORY_NVS:
+			/*
+			 * ACPI NVS marks an area reserved for use by the
+			 * firmware, even after exiting the boot service.
+			 * This may be used by the firmware for sharing dynamic
+			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
+			 * as read-only.
+			 */
 			prot = PAGE_KERNEL_RO;
 			break;
 
-- 
2.43.0


