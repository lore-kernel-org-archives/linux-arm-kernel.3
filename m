Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07E6CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxMPkoVFQV6S5wAtsoqjamaI7fcs0uOhvAkTUesfOPo=; b=B9WOCXcwKWOwKHxd1O/3ro5jG3
	8CIEpeliq57HiRUdOplcDGrB8snbuGoMBJyXINaKitbMRho7c+hrVKqXz3OH31KJspbZBCVZf1mWB
	0UDvRi8b5hSbQBSvIGIx4fBTdOlpsZs6p9D+z0iEbREnQG7PnJPL2Q9MNTgVh1849XlWYWAfPrWoW
	Ckj7M4cLzh4Y5GScPmkxggi1iANR08fecZ2YEiSixhfyMBTd8QMpKmtI7nC7MWWzG4RDfzrCLZEQ7
	30nx67GKlqTt6YOlhaL9n6QpF46NLPdrBJUjfoVeZjO21f4/LwKYY+xhVoWowyfi2sc4jQ/AS/e3E
	lMCbg/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolM-00000009g0Z-4AFZ;
	Thu, 25 Jun 2026 18:25:20 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcolK-00000009fzW-491h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 18:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOWDrCcA8qDw8qXmZlNOHeaKYSDV9M7tqj8Mq5XdA/uPxQYZ/U53Qg8Y72fr9jesyDNcFNbHrXnEO8G0mN7eehRYzEwKUg1ZLM47pcD0XePiwwGLVnWosvS+cyKGJuncLGRAga8BjX/8X5Rz2Fj7effDTqNDUOkb8OK6PByC8o34lL+SGh3A9ZQfjS7mxERFbR5dDNOjKkxRvGgBKTQdbsExXutKQTZXBewnfsnYmvzAJTqqz4aOX46VP2BmEk5KBlMfpUP44wlml3WqejteszHmgXsqvLiAD4p1YOAfWev6oQRf0eNkFKicJok5dfKos5OoicJMbMZzU2aWBGIV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxMPkoVFQV6S5wAtsoqjamaI7fcs0uOhvAkTUesfOPo=;
 b=DZyih0oPLV3Q6sgNQTg6s4sdfNtV/rI66OtfTDzLnP3+SZp7140qK5YdbiQADM3Eb5Udd/OQq3JrKuBZX9N+KUGNgX7dxyLSSriSZJQDs2+NUzxJOxq6jLM+PZ5pMDAhuu3hR/F9rAwMxdcRKxxkjkfooROe9ZX1F+ThwbAb51TEYri20XaF0ngFiALMctW7+V5ITeNv0dxmLWqGqxPrzIIE+cUqurtCBdQerFeZQ7g5q/Pbk8UZfbOnopkWhGOVB8rLGMYGu4FeGvahGNzqzQMV01jFCSPZw0ADwuY6ruWGqksVFb40WOkYy77X9qr9k5iQqZaa0HVGyCbXv5F4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxMPkoVFQV6S5wAtsoqjamaI7fcs0uOhvAkTUesfOPo=;
 b=Sv2gB06VMxX8Lw0DeaBQBeBGTQ8UdyV4r/FDOw7z2jWgtuFI1huOLOhE5R7dcDQRlrGMAJ5jHeJD/hdoXVaNqes0Lrg5HVtAiQ7UHZBdht2kLtBNCZgu3vjfjAXqNnZZJmifMJuXtfPT7JC9m7FP5nmW3Az1VvEwby9KP0jLf22JW57MnpuKEI+BG3KVt55e8HUetD2CUNtk8i+wCM24gtso+WAiD8NloNzG8Lu1tA2lzrM38KWawbylZf6bwLqbTbwtpH4e9T679Xtjfw3YMoko9luAXVggo13XTcridagicNaWmQaGWPP3bLyd8HmZnAZYgB58AkhvShkf5L4r2A==
Received: from BN9PR03CA0121.namprd03.prod.outlook.com (2603:10b6:408:fe::6)
 by SA1PR12MB6846.namprd12.prod.outlook.com (2603:10b6:806:25d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Thu, 25 Jun
 2026 18:25:08 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::2c) by BN9PR03CA0121.outlook.office365.com
 (2603:10b6:408:fe::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Thu,
 25 Jun 2026 18:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Thu, 25 Jun 2026 18:25:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 25 Jun
 2026 11:24:46 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 25 Jun 2026 11:24:46 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Jun 2026 11:24:45 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <linux-arm-kernel@lists.infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
Subject: [PATCH v4 2/2] arm64: io: apply the device store-release workaround once per block write
Date: Thu, 25 Jun 2026 13:24:25 -0500
Message-ID: <20260625182425.3194066-3-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625182425.3194066-1-sdonthineni@nvidia.com>
References: <20260625182425.3194066-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|SA1PR12MB6846:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfb0c3a-cff4-4ff4-a21c-08ded2e71657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: EX5Q5mAIzG69VV4Az3lFaXJuJwe6h6t8YRGhSx8pyOQeYzd5e+7ctS+AOYbnZrmThuVrDbCxmBXPFvCrTtnrUFTYkr2b87qgzufnEhkUb16wogUsBScOqFaBGSgbVzcGAPsTW7UsSefUAnIWRlZE3MBH1EgbH9n+oPKmuDw+0vcgZN1cGLgjdIL0WkcjXTvf/s3H2OimDi3W+DJmKwbMppLjAiDd+1JYbbRljOLA0YaThmcvh/BamChnsz04ZGgZ824F90t3jYFaIgv2rN6MBHlm6YVFb821k12N7KlWxmylf91O+vJZndWLaN6rYBnPNH47i5aA3cG2C2diqv1IE3lylixzBBnFLX6xho5Ik8SyA05OFGUuwr1v2Zn/1r/ZzCvs84N8QFvWS0RxovO5UpN/BM2Mcjow7eFYkFv/Boj3gNE5vBMV7ZBDjl4+JqCWnQ72lukb0hA+yQUuT4jy0u603Ly4Ge3qHwkOMvKax343baczRSpA3UPcOJyQCameT3lMAg5/iqMEZtjzurxElyVI2trDTlY33lylxmCz0zNKdhBu2JqL/NwUgVGJgCQPaZku/IsW56mjdWR3Wn0rbGGKPEQaUQobCE+2BEyg3BqHDnm9ZgPw8vKgnpr6xuhKt1FS54teWZuCv/5F0c9WeDDIBPfpCYIvtSd3hz2W4VCXn9xDUitgI8HSPILs1N6T
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6BWzyKIEWI+erhqCTnqyXiVXcwlh5Q+3XgsukBqLI5tut++YOAT5Zn9ywdurtvxBBJdEULU09os20+6U9eR0JuqYOhEDLHZy04qmnqwPoyvCAj5qxmhw3WulGexyxxF/XDgEmzmJRoDT4Widh4CUOKQCQO9/sRZTMRJ/6uE7TeTbNHCKCLtW968fxiptRFSvPVkXsnrBAaftPHNCB5ULWHofsh3QxE5yMAvNStme84IjRmNvPBSp+vmoasp5ZU/e+UAvwFllczshYM4CyizmtBcj4AM9sxR4ejxJ32Ef7akES7tkVszakfk8oB7vktgAUJWBxRsdaWEbBKENCaThxRiy+lpj9uW3RP1obcj711BiOTkZ2TeDiiPWoCzOco9LiCCIykz6asW1QlccrJMXBE8nYPWDB5Nbkxy268uQfEY6nRCM7wadOYPA0yTg98PO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 18:25:08.5282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfb0c3a-cff4-4ff4-a21c-08ded2e71657
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_112519_046283_51E933C7 
X-CRM114-Status: GOOD (  15.63  )
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

The generic memset_io()/memcpy_toio() are built on __raw_write*(), so on
parts with the NVIDIA Olympus device store/load ordering erratum the
ARM64_WORKAROUND_DEVICE_STORE_RELEASE workaround promotes every store in
the block to a store-release. Each stlr* carries a barrier cost, so block
MMIO becomes O(n) store-releases, making a block copy many times slower
than a single ordered burst and growing with the transfer size.

Provide arm64 memset_io()/memcpy_toio() that emit plain str* in the loop
and order the whole block against subsequent loads with a single
trailing dmb osh on affected CPUs (a no-op elsewhere, preserving the
relaxed contract of these helpers). This keeps block MMIO writes at
one-barrier cost rather than scaling with the transfer size.

Performance (NVIDIA Olympus, write-combining MMIO to a device BAR, single
PE pinned; per-call cost in ns; consecutive writes ping-pong between two
buffers so repeated stores are not coalesced; iowrite64/iowrite32 =
__iowrite{64,32}_copy()):

Table 1 - arm64 memset_io/memcpy_toio (this patch)
+-------+-----------+-----------+-----------+-------------+
|  size | iowrite64 | iowrite32 | memset_io | memcpy_toio |
+-------+-----------+-----------+-----------+-------------+
|    8B |  231.6 ns |  231.6 ns |  232.4 ns |  232.4 ns   |
|   16B |  231.7 ns |  231.9 ns |  232.7 ns |  232.6 ns   |
|   32B |  231.9 ns |  232.7 ns |  232.9 ns |  232.9 ns   |
|   64B |  232.7 ns |  235.0 ns |  233.7 ns |  233.6 ns   |
|  128B |  233.6 ns |  235.8 ns |  234.4 ns |  234.3 ns   |
|  256B |  237.7 ns |  276.8 ns |  264.0 ns |  276.7 ns   |
|  512B |  237.7 ns |  277.1 ns |  238.1 ns |  277.6 ns   |
|   1KB |  253.7 ns |  279.3 ns |  276.1 ns |  294.1 ns   |
|   2KB |  295.0 ns |  318.7 ns |  288.5 ns |  308.3 ns   |
|   4KB |  365.9 ns |  381.4 ns |  365.7 ns |  381.3 ns   |
+-------+-----------+-----------+-----------+-------------+
all four helpers end with a single trailing barrier (dmb osh).

Table 2 - generic per-store memset_io/memcpy_toio
+-------+-----------+-----------+-------------+--------------+
|  size | iowrite64 | iowrite32 |   memset_io |  memcpy_toio |
+-------+-----------+-----------+-------------+--------------+
|    8B |  231.6 ns |  231.6 ns |    229.0 ns |    229.0 ns  |
|   16B |  231.7 ns |  231.9 ns |    458.4 ns |    458.5 ns  |
|   32B |  231.9 ns |  232.7 ns |    917.4 ns |    917.5 ns  |
|   64B |  232.7 ns |  234.8 ns |   1835.4 ns |   1835.5 ns  |
|  128B |  233.6 ns |  235.8 ns |   3670.9 ns |   3670.8 ns  |
|  256B |  237.7 ns |  276.7 ns |   7341.6 ns |   7341.6 ns  |
|  512B |  237.7 ns |  279.4 ns |  14001.4 ns |  14001.3 ns  |
|   1KB |  253.7 ns |  279.1 ns |  28631.5 ns |  28631.8 ns  |
|   2KB |  279.4 ns |  317.9 ns |  57276.3 ns |  57275.2 ns  |
|   4KB |  365.7 ns |  381.5 ns | 114564.4 ns | 114563.6 ns  |
+-------+-----------+-----------+-------------+--------------+
the generic memset_io()/memcpy_toio() build on __raw_write*(), which the
workaround promotes to store-release, so every store is individually
ordered - hence O(n) in the store count.

The arm64 versions stay flat at one-barrier cost while the generic
per-store writers collapse to O(n): at 4KB ~314x slower (~115 us vs
~366 ns).

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
---
 arch/arm64/include/asm/io.h |  5 +++
 arch/arm64/kernel/io.c      | 82 +++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 69e0fa004d31..649503f347bc 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -266,6 +266,11 @@ __iowrite64_copy(void __iomem *to, const void *from, size_t count)
 }
 #define __iowrite64_copy __iowrite64_copy
 
+void memset_io(volatile void __iomem *dst, int c, size_t count);
+#define memset_io memset_io
+void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count);
+#define memcpy_toio memcpy_toio
+
 /*
  * I/O memory mapping functions.
  */
diff --git a/arch/arm64/kernel/io.c b/arch/arm64/kernel/io.c
index fe86ada23c7d..b5fd9ee6d9eb 100644
--- a/arch/arm64/kernel/io.c
+++ b/arch/arm64/kernel/io.c
@@ -5,9 +5,91 @@
  * Copyright (C) 2012 ARM Ltd.
  */
 
+#include <linux/align.h>
 #include <linux/export.h>
 #include <linux/types.h>
 #include <linux/io.h>
+#include <linux/unaligned.h>
+
+#include <asm/alternative.h>
+
+/*
+ * ARM64_WORKAROUND_DEVICE_STORE_RELEASE promotes every raw MMIO store
+ * (__raw_write*()) to a store-release on affected CPUs. The generic
+ * memset_io()/memcpy_toio() are built on those helpers, so the workaround would
+ * emit one store-release per element and turn a block write into O(n) ordered
+ * stores - far more costly than the single barrier a block actually needs.
+ *
+ * Provide arm64 versions that emit plain STR in the loop and order the whole
+ * block against subsequent loads with one trailing DMB OSH, patched in only on
+ * affected CPUs (a no-op elsewhere, so the relaxed contract of these helpers is
+ * preserved).
+ *
+ * This capability is currently enabled only for the NVIDIA Olympus device
+ * store/load ordering erratum, where a Device-nGnR* load may be observed before
+ * an older, non-overlapping Device-nGnR* store to the same peripheral.
+ */
+static __always_inline void iomem_block_store_barrier(void)
+{
+	asm volatile(ALTERNATIVE("nop", "dmb osh",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : : "memory");
+}
+
+void memset_io(volatile void __iomem *dst, int c, size_t count)
+{
+	u64 qc = (u8)c;
+
+	qc *= ~0ULL / 0xff;
+
+	while (count && !IS_ALIGNED((__force unsigned long)dst, sizeof(u64))) {
+		asm volatile("strb %w0, [%1]" : : "rZ"((u8)c), "r"(dst) : "memory");
+		dst++;
+		count--;
+	}
+	while (count >= sizeof(u64)) {
+		asm volatile("str %x0, [%1]" : : "rZ"(qc), "r"(dst) : "memory");
+		dst += sizeof(u64);
+		count -= sizeof(u64);
+	}
+	while (count) {
+		asm volatile("strb %w0, [%1]" : : "rZ"((u8)c), "r"(dst) : "memory");
+		dst++;
+		count--;
+	}
+
+	iomem_block_store_barrier();
+}
+EXPORT_SYMBOL(memset_io);
+
+void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count)
+{
+	while (count && !IS_ALIGNED((__force unsigned long)dst, sizeof(u64))) {
+		asm volatile("strb %w0, [%1]"
+			     : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
+		src++;
+		dst++;
+		count--;
+	}
+	while (count >= sizeof(u64)) {
+		asm volatile("str %x0, [%1]"
+			     : : "rZ"(get_unaligned((const u64 *)src)), "r"(dst)
+			     : "memory");
+		src += sizeof(u64);
+		dst += sizeof(u64);
+		count -= sizeof(u64);
+	}
+	while (count) {
+		asm volatile("strb %w0, [%1]"
+			     : : "rZ"(*(const u8 *)src), "r"(dst) : "memory");
+		src++;
+		dst++;
+		count--;
+	}
+
+	iomem_block_store_barrier();
+}
+EXPORT_SYMBOL(memcpy_toio);
 
 /*
  * This generates a memcpy that works on a from/to address which is aligned to
-- 
2.54.0.windows.1


