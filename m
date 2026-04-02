Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31AFD39410
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 11:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g36eWQBKA0M4/KKIDiJJgYvfQhbALtKtILY1VXZSYI4=; b=1Tn8+d4dGlXKZJYYMXOk74oj8E
	T5p6hlPrMlJrjWlcdXQXcVcxzEyHF0LfnoksN+UBUPl4PDWAG/Euf81XK40wuqQmxxDphovjurWll
	oML4XNAlhmozHb5dfNaTynBwZWrfJxkBoZWc9+8Izfupw+bRqz1pgnmrM2+RchPSLfMvNRH+m6ExE
	/Hu2Pjg1OBxmk/el0r5m/23nY/E/rrBgtajcxgI6EW1L1zG+T9cduRWkuFH0GjD9Ol2yw1aW29cYJ
	f3YxRYrTPYmnntfsoujrDlBxvHm9m792gbWsMf2asNJBNOXukdB5P+3TsBtIPxQLCmkiPJXv/JAtj
	nLZmorww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8G9n-0000000HVOh-0lm1;
	Thu, 02 Apr 2026 11:24:15 +0000
Received: from mail-westusazon11012066.outbound.protection.outlook.com ([52.101.43.66] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8G9k-0000000HVNt-3t0m;
	Thu, 02 Apr 2026 11:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhMAo/uBtV8TJiOiGSsc7P3zghLhv0uS/eXJWH2Ck6mTjOY84iKmWGpO3yziFmjib95IUxtgOLsN4vQNUVFKyXVuOwibV/CvAbQ6bx/vZmZ89LM6VKsYxABIlY18YSe15sCINTZvrNH8C8OGo1DBZuo1LDx44SRI8obkFkAS+sfWti+Jcrg3ZcGOUEGOLgJ1TPIzG50dem0v18Z7Hxg/75/+i9rKSRbJCFE1gpfQwzZl7AbzYeEMLhSvf2vRE4xp4lVQjOWc2Ct+0Zl5i1X7Ko3LUEG801MOvnO+8C1G/RxGY1n3Eb//pBK5j/DAcFrmF3wYizzzPo329irIo/F0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g36eWQBKA0M4/KKIDiJJgYvfQhbALtKtILY1VXZSYI4=;
 b=t0be+cG++3al8pvWFJOUb8LUKHEBpaGyQvbbSFaI0oXuKa93x+Yt2NT9RFxjyJnBPQCIIJkKW9dKZV9WDR40eyNPx5D8nOcIqRDMK2W2MicHtz5S3nFmTcZcgNR00j3ajlE1ig4aXmHPYXTWVW0Xa3Yn5kpYuXwKfRxLJ73cxUTxkB4+/JbOHs5s2tYwHYZQsqoetgbIifnAcp7tsJFV1p2ggC1nFeZWNVZWDuknOiSj/r0CcbaLRDrFOSkHh22X8cvBhWt/pthGpufmgIYRrONIzN+aJdrVzliwcjY6fks9Suxa9E0X6NTh/tf2GB1uPmlKjO9LsYbzsaBvE/BSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g36eWQBKA0M4/KKIDiJJgYvfQhbALtKtILY1VXZSYI4=;
 b=guTOkRyPtKSOdd9Yh8wD27UCyzTJCLBL4Zvym7kIqyTmsrPv8kvqxb+ypszgXxWp1W277rvLydUt6WTDzmdEJTFTIlavxvc4mEHLXZFbEWNHJbItkG32zhFaQ1tShap/jxojYXZMn1xtVi38sVrieEtTNg66TkKWG/B0IrriIK8=
Received: from SN6PR16CA0047.namprd16.prod.outlook.com (2603:10b6:805:ca::24)
 by IA4PR12MB9833.namprd12.prod.outlook.com (2603:10b6:208:55b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 11:24:02 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:805:ca:cafe::12) by SN6PR16CA0047.outlook.office365.com
 (2603:10b6:805:ca::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 11:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 11:24:02 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 06:23:56 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, David Laight <david.laight.linux@gmail.com>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v3 2/7] arm64/runtime-const: Use aarch64_insn_patch_text_nosync() for patching
Date: Thu, 2 Apr 2026 11:22:45 +0000
Message-ID: <20260402112250.2138-3-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402112250.2138-1-kprateek.nayak@amd.com>
References: <20260402112250.2138-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|IA4PR12MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c7883a-d2b4-451d-2010-08de90aa57f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 57WAwVfJupASLRI23Sk26Hh7sFY2ZOamkYBQpkfbxSoDK8XQZwUsZwJdRUVZZB948rUGN5bRY2YxyMJEeVek2lzXMDyqjVNAj6JHFtN1MleDb2FF/f+sPqzUEFFvvQU6t+Uq7G60JmH2Rku3uih6wfSCzksmdLLDKoGcPLWSUmY9BcB3fSOCdN6DzWD6wPNeHVtSrxQIJIjM2IJAOxb6e0lZ1/crZ3unqEAVvW+mZSrcDswyZalDfCezav2Pw4RI9HrCUXIXeUXI4g/QPGe9YpW6t9yw6Kv2asjwYMCs3cm1hgDIQpa2xQBxx1Hnr+4sOSXdldKrmMMt6omCBqR7AGTbWLoS80ZL11FTgLxJzO1UiBGeOfyTrhtA1uE0+VoZcKCvkMxuH3L3RIDoL8vV63r4W9JGZAisyeSjJ6N/uqwvUgg6w6ZgYFadSYhonabK1mwRSDYiGR3eDIVJmtLIDkQ6kREV+VEkiKoLryhnGdwaxdGwevz5weubtZ4WCq6+RYOmm/zZCfWL825biLp4vxn1bN3JHAy5WD1N64vMyUzhNv0VMH8tjGkb6rwEMsXDlq01aT08W8UImcMx5W8I8YADvv848q5y7urUVQafWUVY//qpCHSZl4J0gYcZyq4ldZ0+OfZJn+YKCqbreWQqfza+sHqbOE9iOKYtdGTBlI0JOlARslFIxNwIG4tRvNB7LrX7chBAx/DtTAEgTHdk5Gdmfxs61YpUz7X3WXX0QMi95uuMpjJnu35KYXBFvjj7oi1wz8kjw4SklL/kAo/aVg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P0mR6wZ15wWfGhVeWC3XWlkWi7wr8m0+wZod16bBnEherWF5OKD00EjqhvfNg022psio0hzKF9FKbC5trxJzIqGp7x+TM4LRIOa6EzgaeI9QUIShnScArS2CDtbmkMT2tq5iIYHiVRq+XvZjhmlxLgmvm5AXksBgmeevRazwJXbRd7L9Ey2rc7fTfBX+yv67otPQVy//sB5wZWjLKJJVrbCXSziTvN8DcEvgzhQVzUzOLt34tzSvE49fDgkGQusuX2orY7uxSpn3mHKvReTQJfGCpl49Dhray8g7vF8n1SkiW5ZJUW3C5oih3UL7L4TauPG425EmmL9bBwt6nRDPiZY3NA27HdN5s+MkmTTS1MEU4CIMl8ew5PAie8v3ObDHrt79Y2c6opC2A0vBSCcj4nx5hwE5Zg/zlfcZ6XICmQeS8Z+rKSoD95iuKFFcJ8Li
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:24:02.6995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c7883a-d2b4-451d-2010-08de90aa57f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_042412_966038_56F4527B 
X-CRM114-Status: GOOD (  16.17  )
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

The current scheme to directly patch the kernel text for runtime
constants runs into the following issue with futex adapted to using
runtime constants on arm64:

  Unable to handle kernel write to read-only memory at virtual address ...

The pc points to the *p assignment in the following call chain:

  futex_init()
    runtime_const_init(shift, __futex_shift)
      __runtime_fixup_shift()
        *p = cpu_to_le32(insn);

which suggests that core_initcall() is too late to patch the kernel text
directly unlike the "d_hash_shift" which is initialized during
vfs_caches_init_early() before the protections are in place.

Use aarch64_insn_patch_text_nosync() to patch the runtime constants
instead of doing it directly to allow runtime_const_init() slightly
later into the boot.

Since aarch64_insn_patch_text_nosync() calls caches_clean_inval_pou()
internally, __runtime_fixup_caches() ends up being redundant.
runtime_const_init() are rare and the overheads of multiple calls to
caches_clean_inval_pou() instead of batching them together should be
negligible in practice.

The cpu_to_le32() conversion of instruction isn't necessary since it is
handled later in the aarch64_insn_patch_text_nosync() call-chain:

  aarch64_insn_patch_text_nosync(addr, insn)
    aarch64_insn_write(addr, insn)
      __aarch64_insn_write(addr, cpu_to_le32(insn))

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
Changelog v2..v3:

o Reordered this to come before the introduction of
  runtime_const_mask_32(). (David)

o Trimmed down the commit message to be more precise.
---
 arch/arm64/include/asm/runtime-const.h | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
index c3dbd3ae68f6..a3106f80912b 100644
--- a/arch/arm64/include/asm/runtime-const.h
+++ b/arch/arm64/include/asm/runtime-const.h
@@ -7,6 +7,7 @@
 #endif
 
 #include <asm/cacheflush.h>
+#include <asm/text-patching.h>
 
 /* Sigh. You can still run arm64 in BE mode */
 #include <asm/byteorder.h>
@@ -50,13 +51,7 @@ static inline void __runtime_fixup_16(__le32 *p, unsigned int val)
 	u32 insn = le32_to_cpu(*p);
 	insn &= 0xffe0001f;
 	insn |= (val & 0xffff) << 5;
-	*p = cpu_to_le32(insn);
-}
-
-static inline void __runtime_fixup_caches(void *where, unsigned int insns)
-{
-	unsigned long va = (unsigned long)where;
-	caches_clean_inval_pou(va, va + 4*insns);
+	aarch64_insn_patch_text_nosync(p, insn);
 }
 
 static inline void __runtime_fixup_ptr(void *where, unsigned long val)
@@ -66,7 +61,6 @@ static inline void __runtime_fixup_ptr(void *where, unsigned long val)
 	__runtime_fixup_16(p+1, val >> 16);
 	__runtime_fixup_16(p+2, val >> 32);
 	__runtime_fixup_16(p+3, val >> 48);
-	__runtime_fixup_caches(where, 4);
 }
 
 /* Immediate value is 6 bits starting at bit #16 */
@@ -76,8 +70,7 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	u32 insn = le32_to_cpu(*p);
 	insn &= 0xffc0ffff;
 	insn |= (val & 63) << 16;
-	*p = cpu_to_le32(insn);
-	__runtime_fixup_caches(where, 1);
+	aarch64_insn_patch_text_nosync(p, insn);
 }
 
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
-- 
2.34.1


