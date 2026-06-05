Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B12CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N2MbnZtEu+awVQT1JTOxOu3V+q1Piq0B75HUkZDs6YM=; b=O9lFR52y6bqL5Ut6rfxapwFViv
	7ZLfOKDtcAQ/cNdaMbiDWbcSkmnHIMQNB742lJ2swSQn70y2xGLwypAZ8BJMMP5uUPV9kYP0CSwvG
	VDNgqeh1XXvOKcp+Q8vdFmaB5N6RF5XBquxl62IiWVsVuy1MwKM/DMOeS3kOcPqohVWrjIt2Mi8Jy
	FxrTrNUE7mmAxQvj8TrRW3ybfWOPgS1GsQFaROOAP0fc+AgAqojEP5GQe3St3DZN7XGQiA872cTrq
	72cBPizI7RCmDQ8pmpiXE/hBfqz36wzW6Iz1CMIDVUwhn/iqIsWGXuBbk4xmkG59D0QirxLZWNDZj
	XiBmUtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVof-00000000kCW-0BS2;
	Fri, 05 Jun 2026 14:46:33 +0000
Received: from mail-westus3azon11012040.outbound.protection.outlook.com ([40.107.209.40] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVVoc-00000000kC0-2pYb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 14:46:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVb2e3CGiz3uFK5ZwAD5vT5XhbbUquVS8DL80w7U6oBGQCm8pQq9qJ2ItVFFWS43cdrtAkP98L8nCpxfq4uMNycA6C5JgBRWaGw4kvUxFg0+Bran228lr0nRkYFIcdp+gDKxxROCPMUmfxiXq9Mr60M5XH7+Vv2DUNl+WhFo/TlXMpI9YSGWefZu8PchHNbATByAQ8cdvQdsV2hdc+Moyvo1Q9JaUdUThvcmmuF9F+RBLjcbWI3i9X3wp5hU7Wjocq/4JB2Ee8KIct2A3LKBaLhUUBD8IucmqKIuZRfibwi0nAAz0dQP8DcIoSxesuwnS8g4doxR/xIWh5hNRQ1l9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2MbnZtEu+awVQT1JTOxOu3V+q1Piq0B75HUkZDs6YM=;
 b=ugPlcjwtgDfL+cWeM3SuZelq8fbiMb9G2AXpzUZ6wv55Zm1xjcS4Wlf2WS84veB0bgrdkA9DQGd0Z0fysgVQmlmF0i5YjBwHTZSaUGw7ToAgpDMG0Qp374mhPm6az0xIp9YFC9DzERO2jiyBbTLK7juxfr0Tlrp74kRUw9ch2GLd486v498nVBbSEfXrPbLltkLE9s/MrcOF3eZ+hgrZQBEkl/CxgwgSm+gfiex2jY7b8FgGXxjfULlgBRctQ8rIvM68hSupwGy/SnHVgTP6m3xOjw75FKd5m2FKIrnPKM3xXQt/UsOpc2sCh97rhWYfPFYS1lXU+jIE3EcE3PVTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2MbnZtEu+awVQT1JTOxOu3V+q1Piq0B75HUkZDs6YM=;
 b=IWJ1bXsC3E4Zlp96GJlpoMaB71DGmFTsx7w+cqbKDwzvlsmqvyKAMBV20WJb7Vnxemr24uiHFEnHtJbI61px+r4el3bTRKETUL/Ve7YjJs+NoR/H7HRr1YzrotQ85dTwLP/uVvuTfgIgqXC2fqWwMg84T/OHTKh4MMepna/ZBFisqJ4kDi9rVzYSRhrw2d/IXZAlUwuIolm8+3LK81JHmkPGfAEpqPZQq5OoasubJuqA2gyELdSdPypbgXLWrK0UJPuMHHPtRLqKbzS0+cUtVJ7gKfRYpdbbWpTI8ajk6R4V1zNkl77DijXs5IYLAA1PTv4FWxYJuw36WjBqGbe/bQ==
Received: from CY5PR03CA0032.namprd03.prod.outlook.com (2603:10b6:930:8::14)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:46:23 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::c) by CY5PR03CA0032.outlook.office365.com
 (2603:10b6:930:8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Fri,
 5 Jun 2026 14:46:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 14:46:23 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Jun
 2026 07:45:57 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 5 Jun 2026 07:45:56 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Jun 2026 07:45:55 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Vladimir Murzin
	<vladimir.murzin@arm.com>
CC: Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
Subject: [PATCH v2] arm64: errata: Workaround NVIDIA Olympus device store/load ordering erratum
Date: Fri, 5 Jun 2026 09:45:51 -0500
Message-ID: <20260605144551.2004391-1-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: 01db23e3-92b6-4bc3-5385-08dec3113705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: FfF2ts9HZXcwW7zmNEQ8Dqn4xLFU3hcgbRT9R345/vmVBeTiIxm8XVGqGhuyMFBT1BZLZ+IuvlEDvjo0/s4OKK635KZljdTaNe6f4OQOwTcu+/Yi9C8Xt5ZBe4t8KYWbfcTC+Vhp6rmcDT3rrw/XYBYtyutqyxpKCI8PdEW8N3MPwKgDwkigmzGI+Lwo7ZecmW2n4ZT++Hvprc1xNCD4cLgB1ukN6rkXm1WL/O05QT7EsDSyzta7JOWy9Rnrmi3WPPsgVff6/3HTWVI5wbTvPWuYw8iKbuvCbpkne6hOq1cmJdgd8q2HD/C+rnh1lZB188eKWiIP3qoddFMkkcGIhBGxnB8+8jNp57pUwWV5wbCk/h3ar7zJ07r7KjuBpoJcG9cdh3JHSnDEqDjJqEVXUN0f1SNu0Dw94dLscJFGzRu/YK3F5dm3C9L54uLXkxMibLBhAJ4JK1MXoApQyl5SrFoJqQhdCzn4656h+wojNgq5JJdhHF0GudEQgPnIWNLgovRbOxPCvffpypHZCopYAKfmfcbDPzsactPnRBmHLVZhf7HoKNZvC8ZSOAp+8Td14Pt8nZOYKYhWBGCthQHhqFlL7I8VocZVJ+dC+vMoln/ii36TFnt79xWozwg3+PQ4F9n7nw/DgMWk5vYuSm76SNyKD6GMc0mwYByo1YRiedkszTCyqlRZ6n6hCeH9iLg+oT7SUwv8tcl5Aw15OtnWKxzdbN/Zxm5d3Y0JTI+1Kj0=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vueGMi8pPQSNnxx6IF2Hv6i2mARkccTo6PbAehC/6cl6Qlz462n/Kg7uX00AZaXonFcFmse1DI8XCtLLYpP1RqoOfBIv2tDi5rHQ1d1A6SsEduCr54N/WZAs1srtgTPIXUKRFXmuwOgk7PloK95S9Uk5fAFiNWTOjh4so82e/barSpF9/ajvkaVsCC/HR5u2cVi8DLBuI/uVBkTqMMMPHJNTAdpRir7umjeX4KGWsqZayxg46uMNouZhcYYocx8hTNynbKltzFNxR8Hg70JbIjP2PLq00y7QJZm7ccPq693z9Y7OaKI6Vhreu3w8RnoLLQCurmJn/rqnJHvOHqa8fiLaCXlLQThBxjql9nRvXo1pscfM+ujQDplGrQp1lXLa693mSXE0N9akPKiY13hfJKnG045n5icaUqVN71luMjOpBnMMtuVzTIjV3q4l9gwW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:46:23.5910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01db23e3-92b6-4bc3-5385-08dec3113705
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_074630_750729_122314DD 
X-CRM114-Status: GOOD (  22.75  )
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

On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
observed by a peripheral before an older, non-overlapping Device-nGnR*
store to the same peripheral. This breaks the program-order guarantee
that software expects for Device-nGnR* accesses and can leave a
peripheral in an incorrect state, as a load is observed before an
earlier store takes effect.

The erratum can occur only when all of the following apply:

  - A PE executes a Device-nGnR* store followed by a younger
    Device-nGnR* load.
  - The store is not a store-release.
  - The accesses target the same peripheral and do not overlap in bytes.
  - There is at most one intervening Device-nGnR* store in program
    order, and there are no intervening Device-nGnR* loads.
  - There is no DSB, and no DMB that orders loads, between the store and
    the load.
  - Specific micro-architectural and timing conditions occur.

Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
orders loads) between the store and the load, or make the store a
store-release. A load-acquire on the load side would not help, because
acquire semantics do not prevent a load from being observed ahead of an
older store; only the store side (release or a barrier) closes the
window.

Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
to stlr* (Store-Release), which removes the "store is not a
store-release" condition for every device write the kernel issues.
Because writel() and writel_relaxed() are both built on __raw_writel()
in asm-generic/io.h, patching the raw variants covers both the
non-relaxed and relaxed APIs without touching the higher layers. Note
that writel()'s own barrier sits before the store, so it does not order
the store against a subsequent readl(); the store-release promotion is
what provides that ordering.

Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
the plain str* sequence.

Note: stlr* only supports base-register addressing, so the raw accessors
can no longer use the offset addressing introduced by commit d044d6ba6f02
("arm64: io: permit offset addressing"). The str* and stlr* alternates
share a single inline-asm operand and the sequence is selected at boot,
so the operand form is fixed at compile time; unaffected CPUs keep using
str* but also revert to base-register addressing. This keeps the store
side as simple as the existing load-side patching (load-acquire) and
avoids adding complexity to the device write path; retaining offset
addressing only for str* would otherwise require a runtime branch on
every write.

Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

---
Changes since v1:
 Update commit text based on feedback from Vladimir Murzin

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 23 ++++++++++++++++++++
 arch/arm64/include/asm/io.h                 | 24 ++++++++++++++-------
 arch/arm64/kernel/cpu_errata.c              |  8 +++++++
 arch/arm64/tools/cpucaps                    |  1 +
 5 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 211119ce7adc..899bed3908bb 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -256,6 +256,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
++----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..a6bac84b05a1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
 
 	  If unsure, say Y.
 
+config NVIDIA_OLYMPUS_1027_ERRATUM
+	bool "NVIDIA Olympus: device store/load ordering erratum"
+	default y
+	help
+	  This option adds an alternative code sequence to work around an
+	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
+	  observed by a peripheral after a younger Device-nGnR* load to the
+	  same peripheral. This breaks the program order that drivers rely
+	  on for MMIO and can leave a device in an incorrect state.
+
+	  The workaround promotes the raw MMIO store helpers
+	  (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
+	  required ordering. Because writel() and writel_relaxed() are built
+	  on __raw_writel(), both are covered without changes to the higher
+	  layers.
+
+	  The fix is applied through the alternatives framework, so enabling
+	  this option does not by itself activate the workaround: it is
+	  patched in only when an affected CPU is detected, and is a no-op on
+	  unaffected CPUs.
+
+	  If unsure, say Y.
+
 config ARM64_ERRATUM_834220
 	bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
 	depends on KVM
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 8cbd1e96fd50..b6d7966e9c19 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -25,29 +25,37 @@
 #define __raw_writeb __raw_writeb
 static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
-	volatile u8 __iomem *ptr = addr;
-	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("strb %w0, [%1]",
+				 "stlrb %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writew __raw_writew
 static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
 {
-	volatile u16 __iomem *ptr = addr;
-	asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("strh %w0, [%1]",
+				 "stlrh %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writel __raw_writel
 static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
 {
-	volatile u32 __iomem *ptr = addr;
-	asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("str %w0, [%1]",
+				 "stlr %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writeq __raw_writeq
 static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 {
-	volatile u64 __iomem *ptr = addr;
-	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("str %x0, [%1]",
+				 "stlr %x0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_readb __raw_readb
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5377e4c2eba2..958d7f16bfeb 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -809,6 +809,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
 	},
 #endif
+#ifdef CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM
+	{
+		/* NVIDIA Olympus core */
+		.desc = "NVIDIA Olympus device load/store ordering erratum",
+		.capability = ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
+		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
+	},
+#endif
 #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
 	{
 		/*
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..d367257bf770 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -120,6 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
 WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
+WORKAROUND_DEVICE_STORE_RELEASE
 WORKAROUND_NVIDIA_CARMEL_CNP
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
-- 
2.43.0


