Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWi27rL/ynoU5XQsG7zLWFkCthmVh9RCjQsLQEzVp4Y=; b=4YyBs/iMH3Mw/QOggokRqb0dN9
	cTesIRq4UcAHTHMi7VXmpgjrijb+UL83dGajrSyQN8k2+YgkO0VJG9CxmnuHEVnb544gU+zeCiBp1
	UTeZeiGmLSBNcpqP01AgD4NfVR9cNvJ20ET4OCz9/iPY2Pt+0PIhRFYoBk+QRd9f1ryeY7gqOl7sx
	H/ipMxTWKMdoBlHR/7L99Y0V1ch/SjQgL2kO2MUnX1mwtmfPkfz4k6YhBb0rIzORvapuv8oTXVPiD
	o+XzvMg9WoWDKmMj03xe28dd2jf5n4HCYRxjYc25OoDRTzGGPNoAVjgXTTKOtx2lsaIWkrEP9kA3f
	OlJ74Iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQXG-0000000FnUc-0mLW;
	Tue, 30 Jun 2026 04:57:26 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQXD-0000000FnSv-3OCw;
	Tue, 30 Jun 2026 04:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAnkPsNPWSXywQNvekZ/tyGvY4CThKBdoTwxCtd4qoKCH0/mBCcqGo0/h7y8DJH+kf3/PKzRW3Qgsj5EcbSgPNmqXCPiw2TgiYqIOgStPgXItWetwkIzRvtY5xPaXtuudQO2V/2cTOnAWtp9hvBeTuqkd0zQsGVfyvGwEiLWasCi4p0Tx5yv/fDv+ODHTV4kYBUU8ZlaJpszhI9PH70oS45uT2B+kGOgbXav0vqnp4IeNFQGBifGWrCcQyDrIFaZzCjQb4uW/ilMLa3QMBZyL9/n9mhFXCakGZmLZI+pEF31QEh0gPw8r5Qit3i8VJ3/hgALT30U44yhgD5ocaZGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWi27rL/ynoU5XQsG7zLWFkCthmVh9RCjQsLQEzVp4Y=;
 b=LR77jdfmyz5b4+j6+gp8Ak41nX3enc+FXQdoK1IKlxlC35YOUaPRCmnpbShbl7YZLgP5jh6v3vLP1An9GvMoUABtuUCIO1j4YC1IQdPVDe7P7kuqcZcVnYe411vigRY8NQoRxa6t4KjeZwz/Y/urFpLZVsxvI+4povV9oFYoXKQ1pOzEw1hw6MGD3Q41d7eER+9on6QGIGAYISKOGjEWy6kzDlXBJqq7PwNntD/EUZIxT6Kuo4TfVJ/nuB7ZNwIPb2ABRDj4aDI1aumAhpqtRB3qAbv9pDQdTrP0LCkrhY053R+JsHrT+VfIduuZXpHH4KYhL3KUGqo1M9Vr6CCBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arndb.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWi27rL/ynoU5XQsG7zLWFkCthmVh9RCjQsLQEzVp4Y=;
 b=Nrp+r0HR1+K9kaMChB5MxADnWxgfTyCpD2j2/NQr9A47Vv8rhD9EiMszA6X0Pm8Bmt86BDvlChN4Aw9deauDt11tfIl8XF8hdA6vOcMmrP7NIeLrXoYSCLGL30JTjtbTR0K9/AQupu9ee3bec5YOeo+PtByWgfedsYWIRX6ANa4=
Received: from SN7PR04CA0062.namprd04.prod.outlook.com (2603:10b6:806:121::7)
 by MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 04:57:14 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::99) by SN7PR04CA0062.outlook.office365.com
 (2603:10b6:806:121::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 04:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 04:57:14 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 23:57:08 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang
	<jszhang@kernel.org>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v5 4/8] riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC
Date: Tue, 30 Jun 2026 04:55:27 +0000
Message-ID: <20260630045531.3939-5-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630045531.3939-1-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: e49da55f-89fc-4165-b08d-08ded6640d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|7416014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: diMA7giAKj+uyF/9X3o0t1XqmxXDpKsrCpFa68lAEsyq/rlVPgFbiKRGXnd4f0Y3Sv3oanxE4PCUexxc7QeURQ88IVitubKOxBo5UCPMqr8DjcEyqa6mp61gyJ5L6J7UQdQ9J7M4obWc2WKXy8eTLCaw5J22SThS4hU4wIjD5oNFBRmn7pE6biSIX2pL6zpd9f/e7/wPFf566ffOJFyTuP6SjcVFgX6qwunCSz8DA7fwFOrcnCC68KfJ+NwIMeE6d0d1CEGeNbLGK/dRoS29nxA44zXHxeV2pNFPnB70MdVjWI2U4N05DxWrxcHCPE8v9hq0y1EpBItNbOEqCjiIcKMC3pg4dnrCtSBGrjPieqeha1w9xFT/nWm9nWl5DPq90Ge/0g4dPgSV8RaOeF4uQYXmchT631OQ9XCpqr9ru4cQ22fkVDCXxGVBn4E+tr+4ceW4GfmrZAJq90GbxvVn70h4H8MdkpLoQTEA/yMoNqCvGbf80xIHfwTZPTXAwG23RxX+7R76fUAPd8p/kCJ+nEXFtvRW/gkLv8QemTdaXLxjKooaMWtvjDf/OR0mYM5fL2W8YpJijPEOzKDpfAyarL9Y2yckRSychqWAzHJSbCxR7nwzU9VQd9xcr+g4jK+RgxVxrW88chKKLV8oSfMfTmWQOWakXITthAaZsMcY/yH1BoeMzP8kuS4ic0C7M+PhrdAypBPlewWnFIQKIXywug==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(7416014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: F7DZH8cGKi00P+OmJmuOKdGd4tyWHGY5Ooe84anMNzvuD3mP5Eg1/YIe0hnmzFhM0/PR7Brs0Cr3LvocJcJIkF1ESpphE4nMLcOlXPKb+1zmCx3wHFDxDMCjwugxjKNhEPN0nUvyL1yGXpmy/KSm746CHETyMaJtZKpjkAEb91YQ7F/Jkg3gpZBnUA9cpjA8qI8zFAnCrU9Hv0h3wAyyvKQ9cM27RdeVw5ytO70xO4EiSxKw7ztdVZWa0W8gLU8ty/5pwZJSxs51qjy1zjh5G04CficiVdhgcGZUoLGIOOSjIt0uvQWWnbfculBiXYLtBqPHJF/XIJMO2JcqEZ6B1Czda+Khe+tksMJOgzZpJoznPqLG4Qz3MCojGTfw4KIcBQ6xXSF2XLCfUlN8Oz9fMGTLGqHHVWl7TgvI+Pe/ckEfacZZYmTRBkYDCb0/kOfg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 04:57:14.0655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e49da55f-89fc-4165-b08d-08ded6640d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_215723_849289_AB1AF85D 
X-CRM114-Status: GOOD (  10.76  )
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
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v4..v5:

o Collected tags from Charlie (Thanks a ton!)
---
 arch/riscv/include/asm/runtime-const.h | 38 ++++++++++++++------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index 900db0a103d05..1ce02605d2e43 100644
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


