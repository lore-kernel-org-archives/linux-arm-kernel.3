Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3788BC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 05:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVEn/QQmLfmHEgm2t6PRiUh58Scql3pQOfaYA26wDno=; b=xt9KzIkD5QtXe+vybjc9OGtrSv
	7SWm8bJ74OgVnUWZztyusPu/pnoislnvVk/xEEP+drP1zAaVZzFTAtlxxYGj1ToowaUrPADAyltvn
	Lje5vdyBmc0XxFtFfgUuOaOh+IKojRAXWeBwD7MrfxTxTrwmOf8i4Y6dcM7DL4tQ4wPJ239nWTm+O
	FHf7XeHIuMlvERGwGmzzEBMMcH73bxGb9Pg4LCixlt+vgHwsDUznbEFmJxhhct5l0ZihZeMijT2g0
	eqgUiSOkqTvpg8AScZajel0aQXo1eNNLC9OQ5w1Q0TqfNSbCjLrDFQPikbTwmc6XmaNlEJPpZ93ef
	Ho/HIj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaM5-00000004Ryl-3EcP;
	Tue, 28 Jul 2026 05:27:53 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaM2-00000004Rwc-2oj0;
	Tue, 28 Jul 2026 05:27:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBDdz79sa/5NQaulHTThlIr8rVCY054wW152RYE2FffuuNEPWICFTkX+Obmv/FPhnOZSooJJ12HhvRIBTyX5Afa84FdyYhtbV1oZ2jC9GI0XSp4FDYnudur5QGM43q3XWsPAn7KxsS6nQEE32VJEyU+eRK9IImF0PCtMVZOFML2WD0yxsXyFzwbo9iDnibRz2Azmy1Dg53PtJsy/sk2kGsonfL9gqhsvxEtS1YGmEt2ikbZ5pPSFato+cv7Us65J3aJfSJ0hqENyGI2ZUpiBVJyBXXLMFdQiow3+j8u1o6XBLXHl+COS+wATox+z/7czuGg8eI4LomLQrKLVcU3TCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVEn/QQmLfmHEgm2t6PRiUh58Scql3pQOfaYA26wDno=;
 b=c4isAez7eBZt9qxKye0RBr3kK5bIEWASqABZahMJsuWn3V3FTbVgfQueggBn5OQn/MjEKPB26vfqT2GA5Swx2cq8D9pcCIE5V63Yj2RDEBZUaQ6oG79Lp0368MPks9a1tuAQTau/6qxoVdKOI2yvm2oNWuJ/WPc5+aJVU4obwHGeZ3IReMq66Yj7MgGbp6ZZNt1tY1Avde1ScF86TgTR+xIUMT96NFSevkPM0LYnRp1cfbAMAgkAv5hJCRcTsX7uTivA9bl0rrYC8e1CxyKulSXhz8wGodox0Ryq8YmKMFacFCpz6ZffaOA//l88G7lnpMQxbEh9zWnOQv7YjDNULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arndb.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVEn/QQmLfmHEgm2t6PRiUh58Scql3pQOfaYA26wDno=;
 b=WIhKytxo+09Xdo0HkqNFEfSpVxNbsNJtXqOzvpp92TYm2/RfPDFq5+Xbop6SU9Y9XoKsctu6gYu6Vxd3DD3hFY0pGLndrtKKmnqHkpjeJpMt8+5ev7Rc+1qOZO7oMLtDEoNFfVtPjXUOghMIUZynDTxS3IxUz+dGLOF6qgJduuc=
Received: from BL1PR13CA0263.namprd13.prod.outlook.com (2603:10b6:208:2ba::28)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:27:42 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::13) by BL1PR13CA0263.outlook.office365.com
 (2603:10b6:208:2ba::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 05:27:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 05:27:42 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 28 Jul
 2026 00:27:36 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Charlie Jenkins
	<thecharlesjenkins@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
	<guoren@kernel.org>
Subject: [PATCH v6 4/8] riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC
Date: Tue, 28 Jul 2026 05:25:36 +0000
Message-ID: <20260728052540.4728-5-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728052540.4728-1-kprateek.nayak@amd.com>
References: <20260728052540.4728-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 677e9251-3df8-43cb-7531-08deec68f2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: JtNt2n6jyGbE8Os3/qmXCtEAMzk47yAZ0BPSivVzd/ELVGz9N4H70HEVYLphAQF2VsSC1Sggr5Z0G9Orpniu7XOVutQv8X5yjTpd8imf4jj/cYRipx8FLgslQV/0nbqvPo7wro4bE1zD0sGqzhXqlFJA2E8xSARNybgRREssPy+jgFFKagMhCduYb/JvKsm7GSImnlm5qJZqbfzNvrMWJhl5xAj8QU1BPkk18VqrcfQdFUyM4NP9Kb6N57zALfhutvwv/yS1ttPb21MwH01W+Jbvkom4HISwdVkLb1ah3hBZ9dh8/ePfV044DNHXAcm+CCtjXhUDiNZa3Z2QW796RIYo+iRa6oCPz0n6NbFb7wYbTf9u/fNrZESY2MPQZi3H7v3qzMMmWwwifiMVhXWJYchw2TJdMGkhzbbtzaQwri0G667A2pKucVo2K7v97LHExB74dT4+cFb1CeToSi0ppEsZdIwqHROeFmgRNn/Q7cNYiXAFnMN8r8Bjjj/09s0hg0vyw3GlgVrlZO9qg/GRkZhmXq5s3X+BodFnV45H658kFtOaC0mt8cpI6TEX9Y7VlEuR7srICkSKGU8c4bHscvlAXeRfSrLY9r6bvn7Th3oEHMDAWbgZbP+gXnu9HWQ/fTAIcHynj8ITBySuDCbWECnA8+qdZA+6qCRTBu2A8iVNPObqarzhFg7FseMPx57qi//O1nfu5ykfnmB0oMzJhfUensYY8KkG/H/eVIQhSYcpIc/s44aZQUYXGub8ywuy
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MYTjCaQLbymxog3f0mPH4HdzNwayymRQXprhZbqC2+46195LQkoAP2Uh5gIzI9YFF8Zs2nvSQnjoZmTCbeW171kwtsvLxppVnEM2EPs1lEM9PBLH0zw7Eik2kS+19JyMrkxdLfKcFHE11vTeIOD/ydt/7NUHK932sE6PesWgikCeAyUS78IdSmsvOW96v0geVlL1OyTx//d0p7Hcqq4U4HOiZxOxfOTZ1IvG6iZ6jCgQwN80VKlC9tjl7rcN2QX/plvoyTyFFbIBT/xsttptc2catcGm7A3QYP+E0Kg9USpkG46Hfl/Nt5pCUzbTAMKXe40BIxO6/EtL6k42MV+jzvZG9usri1v5Hu6wXFV477UmpJOl2lSgGGfp6DbgzQa4w1bzfjUE4Vw5HQFJ8ks6EuE1KYAUUwPYITzi0vtduPe+vBeaIchNGabZSMWB9Fd0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:27:42.7587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 677e9251-3df8-43cb-7531-08deec68f2d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_222750_734040_7134F26E 
X-CRM114-Status: GOOD (  11.19  )
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

Define the placeholder used for lui + addi[w] patching sequence as
RUNTIME_MAGIC and use that instead of open coding the constants in the
inline assembly.

No functional changes intended.

Suggested-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v5..v6:

o Picked up tags from Charlie. (Thanks a ton!)
---
 arch/riscv/include/asm/runtime-const.h | 38 ++++++++++++++------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 900db0a103d0..1ce02605d2e4 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -15,21 +15,23 @@
 
 #include <linux/uaccess.h>
 
+#define RUNTIME_MAGIC __ASM_STR(0x89ABCDEF)
+
 #ifdef CONFIG_32BIT
-#define runtime_const_ptr(sym)					\
-({								\
-	typeof(sym) __ret;					\
-	asm_inline(".option push\n\t"				\
-		".option norvc\n\t"				\
-		"1:\t"						\
-		"lui	%[__ret],0x89abd\n\t"			\
-		"addi	%[__ret],%[__ret],-0x211\n\t"		\
-		".option pop\n\t"				\
-		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
-		".long 1b - .\n\t"				\
-		".popsection"					\
-		: [__ret] "=r" (__ret));			\
-	__ret;							\
+#define runtime_const_ptr(sym)						\
+({									\
+	typeof(sym) __ret;						\
+	asm_inline(".option push\n\t"					\
+		".option norvc\n\t"					\
+		"1:\t"							\
+		"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
+		"addi	%[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t"	\
+		".option pop\n\t"					\
+		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
+		".long 1b - .\n\t"					\
+		".popsection"						\
+		: [__ret] "=r" (__ret));				\
+	__ret;								\
 })
 #else
 /*
@@ -46,10 +48,10 @@
 	".option push\n\t"					\
 	".option norvc\n\t"					\
 	"1:\t"							\
-	"lui	%[__ret],0x89abd\n\t"				\
-	"lui	%[__tmp],0x1234\n\t"				\
-	"addiw	%[__ret],%[__ret],-0x211\n\t"			\
-	"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
+	"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
+	"lui	%[__tmp], %%hi(" RUNTIME_MAGIC ")\n\t"		\
+	"addiw	%[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t"	\
+	"addiw	%[__tmp],%[__tmp], %%lo(" RUNTIME_MAGIC ")\n\t"	\
 
 #define RISCV_RUNTIME_CONST_64_BASE				\
 	"slli	%[__tmp],%[__tmp],32\n\t"			\
-- 
2.34.1


