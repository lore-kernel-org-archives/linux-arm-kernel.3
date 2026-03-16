Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BF6D58B39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP6aMGooyZGRGPbIYyHVYh22zyRfH5K+ceRIPLTuxkI=; b=fC9xF5KmAzD75LjlqYjd5ymaL/
	lHfUfpio6WvvvkcyJ0KmK/FstTuUGMwLuvk30iL9IPitQ3f17d/6URGCU1SKOJ47T7DcqW1W7wDHK
	Aq3OGQyRioTI8NrzAb6Cfp2ONRMJpG4KoizXrYc1wo+NslsQqoNYXcKNpYoK3h2ldemAtCEu8wJSM
	EH0Gcs3oacFY8MBDXs5cVaYrs7c2JcRHp7VnwWILZQzB9E5NcQRkBCyzfZhEEESPd0a+LFzgLZsIK
	8J4XL6Khh/2YJ0XeA2Se7V7MbsHTKW9o3Z9+re3vlQbL1r/eswbI/uI9D3z/CyH5uzNCsIqNXr6kx
	z5Jgj9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20SI-00000003Kes-2JVF;
	Mon, 16 Mar 2026 05:25:30 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20SF-00000003KdI-3WOZ;
	Mon, 16 Mar 2026 05:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIHdw/kX0R3OsWPMMEd9WOW7zw0uosafZYHZTPpjnTVflTx57gLmxbgTp0kkRMshPQCuWP0EH0Nc41Ji2ArpsyloYE7HfJmsH12LW5R9QXD10HHj+Kb3tTS6iD7QUsgMSkfNnxMph7y/jNHGRZzT8rbxu2ItGzqAm/OhNBM0bOS/htj8EqOsytF0Se8AthoejWkAdBLB+ulKDv/CI2qBSvTaRxBp4jmiTfFDQnEFDikehtvHFnAV+j9NYBPKjlRW7VtVaFw0ebx9GtsjdN3sLt5I50Yb5w83C9d0EhqPeSASL0sE3/u1tgYvMnKy/OC4hUd3B+Wy5wFcsBNqVznTeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP6aMGooyZGRGPbIYyHVYh22zyRfH5K+ceRIPLTuxkI=;
 b=UY37pxWzf7yeJxHmjOddYng7SlW0yle94VwmYv77KGAwDH/nK8S9A0AarI0efXr8gxwoPO4XGB65UxBU6hpROCC49qfPTEAllGyVg3S0EZ9dSiPsKX3h7hiH0kM6uRbatgeNGewtboFgS0Y0ubklOWhcsZaaXVr4TOuaGbpk3xXUUG0KhD9F0dfjpboweVXC1SJtIxEJO8bFqWD/tgxc4TzIC0EvYabsV0xF+8HZAenwaNMUXzu2h8WF4v/uxqCMaIv3YIIO5asq63Rcc/Oa/friPLH2Twj4mlkOLXCH6ALBJomHlD7ftZr+J5K702AGrDOgUCtJtzqgqDEEOD629Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP6aMGooyZGRGPbIYyHVYh22zyRfH5K+ceRIPLTuxkI=;
 b=hsDRmS7SHJtoUvSHXRvlx6EN+k9xn99FDpmLdQ/V8DiMJfAzvg2Jpesj05UD6he+tC6GRmtmnMZ3mfRKpgTwrmhnepf8yWgSJP59YMEsvV1ar0tb883xf0R8Ur/FHXFmc+RwnIU6M9MmWOHUXMIc6Dr8DevZeZTqS7sS+aQk2YE=
Received: from DS7PR03CA0104.namprd03.prod.outlook.com (2603:10b6:5:3b7::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Mon, 16 Mar
 2026 05:25:21 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::d1) by DS7PR03CA0104.outlook.office365.com
 (2603:10b6:5:3b7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:25:20 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 00:25:15 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [RFC PATCH v2 3/7] arm64/runtime-const: Use aarch64_insn_patch_text_nosync() for patching
Date: Mon, 16 Mar 2026 05:23:57 +0000
Message-ID: <20260316052401.18910-4-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316052401.18910-1-kprateek.nayak@amd.com>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|MN2PR12MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d9083a-590a-430f-4deb-08de831c6ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Aol3/fmRAkZLK06J2s/CoCBc3AAfOCelnnFCpCx1AqLRbNoH6Q9NXmarSVlHYG0MRI8d6cYc1ZSes7rIwfaNVaDWU93RWtEIqLPExqzdHJJpu4tXqCZDUOKQLzqt4zVUDuoS2OZSmoBPoFO8n3/urNoqNrgw0TJLMN8mLkQXPY6aP4CktyOP6lBxjxQQUoBPpbkJnAW8yeeIagfktpVed5+zcCQPZNp69/apPDqubPrvnFJSBmGyMNQKevEe/+WBXHHZtPPzkxFna6tqOKtjuOGM4ixJRH7WCkjKb/3Zfw9Kj2fYPTpfgjwwDQBBvmHksEJ6VjEuqIEvEkwNfq//W2GZfMjSADa4jAqvrIm5BgHTqBp03putY/orOBMLRIMaNLJxXPOYU3D26X2gyMVrVUf9AG2u3PrMVBvLGaSBmnaM1/Az0lO6mTrb/3l7W1FIKVK0aYrTH7jd8AiOHQbAyyQoEXp4HLCbLw0R1yyIvSiMMmKEQ/IUx9GX9oyG5rf3+A91PBu3OlAaabVsSU91owu1JuBOLeC1b3cqJ6pkpydamB7odPvr+YaqS+nOn98jR4mXgNL+jCvifDUQjz+HqhZxKvWfFWdwO2Eu1pXadjODoxBCnX5iDIPk04U1zqR/OQfenS2df0pnlo35RYvNOIjh1lx6o3Z+YmyxlBRMcT+yyA2Nk5HprcNXDDpHdT7IDgMalKGobVKXfG+3SfLx0WWmlav88cIlxQTo+KSHYv/o0/XxcwoAnIRZ/tI/oghOyRCRpUt2vC9fO8MSZxOnXw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7hlMiy0K55Y6tjx7TjdzVoH3K2DF5Yv68yMESddyRv48vyITnniJgMzWQQAee72LkWZDubzXF18gZQv7cWvQ6oYeKm8sFbbvb0QUXXQBq9qnf7wxypebJcMUfB3iVJoRdH3HCYZi8GfPzaww3kB/Eyu11jcGOyJiybZoD9ebhQEBsOco0xC3HIvyGMxx3hL44lExvbeuVzuMcFd/sSQUYCeYNA0AxPqdLCM6oE7OUtHbjsUQ33qRO4wl48ydtpFL22a09P4Y+ygQyf4ugaRTtY78s0nMYdRMEVa/yCdDbJjTuWgmuZBVQk5gToA00MpRckPXmC8R/o9MYTpNygqBSJkuTb4XkM8ziaUb+AhfaQCr7wRs8Zpr1vQd/EdwcrbyKCSYnC+5qf3EqVzveSql4ojnGC+0araCf/UhQL5WHz0JNjiHkzO+kSJErjNO7oL8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:25:20.6780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d9083a-590a-430f-4deb-08de831c6ad0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_222527_881257_5C07E3A5 
X-CRM114-Status: GOOD (  16.84  )
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

  Unable to handle kernel write to read-only memory at virtual address fff0000000378fc8
  Mem abort info:
    ESR = 0x000000009600004e
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
    FSC = 0x0e: level 2 permission fault
  Data abort info:
    ISV = 0, ISS = 0x0000004e, ISS2 = 0x00000000
    CM = 0, WnR = 1, TnD = 0, TagAccess = 0
    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
  swapper pgtable: 4k pages, 52-bit VAs, pgdp=00000000420a7000
  [fff0000000378fc8] pgd=18000000bffff403, p4d=18000000bfffe403, pud=18000000bfffd403, pmd=0060000040200481
  Internal error: Oops: 000000009600004e [#1]  SMP
  Modules linked in:
  CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc6-00004-g7e6457d29e6a-dirty #291 PREEMPT
  Hardware name: linux,dummy-virt (DT)
  pstate: 81400009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
  pc : futex_init+0x13c/0x348
  lr : futex_init+0xc8/0x348
  sp : ffff80008002bd40
  x29: ffff80008002bd40 x28: ffffa4b73ba0a160 x27: ffffa4b73bd10d74
  x26: ffffa4b73cb68b28 x25: ffffa4b73ba0b000 x24: ffffa4b73c66b000
  x23: 0000000000003fe0 x22: 0000000000000000 x21: ffffa4b73bd10d74
  x20: 0000000000008000 x19: 0000000000000000 x18: 00000000ffffffff
  x17: 000000007014db06 x16: ffffa4b73ca3ec08 x15: ffff80010002b937
  x14: 0000000000000006 x13: fff0000077200000 x12: 00000000000002b2
  x11: 00000000000000e6 x10: fff0000079e00000 x9 : fff0000077200000
  x8 : fff00000034df9e0 x7 : 0000000000000200 x6 : ffffa4b73ba0b000
  x5 : fff0000003510000 x4 : 0000000052803fe0 x3 : 0000000072a00000
  x2 : fff0000000378fc8 x1 : ffffa4b739d78fd0 x0 : ffffa4b739d78fc8
  Call trace:
   futex_init+0x13c/0x348 (P)
   do_one_initcall+0x6c/0x1b0
   kernel_init_freeable+0x204/0x2e0
   kernel_init+0x20/0x1d8
   ret_from_fork+0x10/0x20
  Code: 120b3c84 120b3c63 2a170084 2a130063 (29000c44)
  ---[ end trace 0000000000000000 ]---

The pc at "futex_init+0x13c/0x348" points to:

  futex_init()
    runtime_const_init(shift, __futex_shift)
      __runtime_fixup_shift()
        *p = cpu_to_le32(insn); /* <--- Here --- */

... which points to core_initcall() being too late to patch the kernel
text directly unlike the "d_hash_shift", "__names_cache" which are
initialized during start_kernel() before the protections are in place.

Use aarch64_insn_patch_text_nosync() to patch the runtime constants
instead of doing it directly to allow for running runtime_const_init()
slightly later into the boot.

Since aarch64_insn_patch_text_nosync() calls caches_clean_inval_pou()
internally, __runtime_fixup_caches() ends up being redundant.
runtime_const_init() are rare and the overheads of multiple calls to
caches_clean_inval_pou() instead of batching them together should be
negligible in practice.

At least one usage in kprobes.c suggests cpu_to_le32() conversion is not
necessary for aarch64_insn_patch_text_nosync() unlike in the current
scheme of patching *p directly.

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/arm64/include/asm/runtime-const.h | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
index 4c3f0b9aad98..764e244f06a4 100644
--- a/arch/arm64/include/asm/runtime-const.h
+++ b/arch/arm64/include/asm/runtime-const.h
@@ -7,6 +7,7 @@
 #endif
 
 #include <asm/cacheflush.h>
+#include <asm/text-patching.h>
 
 /* Sigh. You can still run arm64 in BE mode */
 #include <asm/byteorder.h>
@@ -63,13 +64,7 @@ static inline void __runtime_fixup_16(__le32 *p, unsigned int val)
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
@@ -79,7 +74,6 @@ static inline void __runtime_fixup_ptr(void *where, unsigned long val)
 	__runtime_fixup_16(p+1, val >> 16);
 	__runtime_fixup_16(p+2, val >> 32);
 	__runtime_fixup_16(p+3, val >> 48);
-	__runtime_fixup_caches(where, 4);
 }
 
 /* Immediate value is 6 bits starting at bit #16 */
@@ -89,8 +83,7 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	u32 insn = le32_to_cpu(*p);
 	insn &= 0xffc0ffff;
 	insn |= (val & 63) << 16;
-	*p = cpu_to_le32(insn);
-	__runtime_fixup_caches(where, 1);
+	aarch64_insn_patch_text_nosync(p, insn);
 }
 
 /* Immediate value is 6 bits starting at bit #16 */
@@ -99,7 +92,6 @@ static inline void __runtime_fixup_mask(void *where, unsigned long val)
 	__le32 *p = lm_alias(where);
 	__runtime_fixup_16(p, val);
 	__runtime_fixup_16(p+1, val >> 16);
-	__runtime_fixup_caches(where, 2);
 }
 
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
-- 
2.43.0


