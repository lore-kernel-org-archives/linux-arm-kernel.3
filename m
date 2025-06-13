Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773E1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fv0gvkoEK4HJzyTO4p9GYy8KcpvYcMol3D68K/KZ+Dk=; b=WgCs2+o60J74l6Cqy4vdW/puvq
	RJJ/w/ymPVwookI9Rkx/Lpgxd9oNYJ7n/WoOLktrBnZoeOmpA/mCAewG8MF3zYVdLPs+dhnMZgMqt
	z6KRhAKyO8o9lEJMofae60jsN6TEHQEAzwQHvzVVq2hYKuo9361IaMqSBvLaE0f3Q3pGj6l+YdAND
	b6/GBB+LYWQCD23D8nSvgsE4531SiQSBwPR0nHriaPbnI1aOqW1rehPpEwgp59ivTFKRFD29HQjbb
	PW7dMneYsBRet+q7QB1fMJa2CzdoaWfJ4J4RT/ncnteOZp51p9dO6ELeNMzjJl2F9aBXyPmUl3Ee7
	9pwpLIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3h1-0000000GNyh-0w0s;
	Fri, 13 Jun 2025 12:39:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2Kf-0000000G8sq-1mDo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 11:12:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C59661D70;
	Fri, 13 Jun 2025 04:12:04 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC6F63F59E;
	Fri, 13 Jun 2025 04:12:23 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	sami.mujawar@arm.com,
	aneesh.kumar@kernel.org,
	steven.price@arm.com,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH 3/3] arm64: acpi: Enable ACPI CCEL support
Date: Fri, 13 Jun 2025 12:11:53 +0100
Message-ID: <20250613111153.1548928-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613111153.1548928-1-suzuki.poulose@arm.com>
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_041225_516143_4EF642CA 
X-CRM114-Status: UNSURE (   8.84  )
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

ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
PAGE_KERNEL.

Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kernel/acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index b9a66fc146c9..f52439d411a0 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -356,6 +356,11 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
 			prot = PAGE_KERNEL_RO;
 			break;
 
+		case EFI_ACPI_MEMORY_NVS:
+			/* Non-volatile storage, required for CCEL */
+			prot = PAGE_KERNEL;
+			break;
+
 		case EFI_ACPI_RECLAIM_MEMORY:
 			/*
 			 * ACPI reclaim memory is used to pass firmware tables
-- 
2.43.0


