Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE05FC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 05:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mK+xfqYbf7ocnMA57q8tw58RxhWQya/CIQNesHgED4E=; b=L6h9a3DfWGv3H+kWzMPuYokDqM
	d29gZaFSJ3a+C1yKV4eOtXAedhBrPle6NWrXnGBLemDLDuzNRHLk9DL3Wtzp6cFu3AxH/GKU+jBb0
	xquH6v/Kbf1RTTWQCFaue51Jul/JEAg8+UEECIIcKdNUWkDq5I8srLYZOfQh/IAou8TJJIfrhCVS0
	d7LcxXZ1oEAyFxw7QTYvxvRvpB4Asyj1zaXbtXvKMXuluVBO46foWgrVbK2XQTAMlbeLxfj82ceHq
	+0H7SL6keD/QLpKIP3MjMvvooewXYqd/LBdql/H5rFL5AkbBOAKo3Nbuw9AAQKgsHYLDut6PdOfff
	eKNTWIIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaLW-00000004RYq-0GjJ;
	Tue, 28 Jul 2026 05:27:18 +0000
Received: from mail-southcentralusazon11011011.outbound.protection.outlook.com ([40.93.194.11] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woaLT-00000004RWr-2cqQ;
	Tue, 28 Jul 2026 05:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qs6XC66ZSoSVikQD0lERDPV8KOAHgunMcnWZV79fuTM4DBU8A2xHfNTVRHLIefb7js55Ai3d4rBZS8JtBbSG4swCjC5GLsQu1Krgwsjr+Uw9B7/LL3e95MnMrKfqV3llGYOBJGGy/D5jrqp0hSyxgKbbQ+RTauCOxgVs/rcOxQsotLbquLHZbZb0+EUaAv8H2TSqUd3bwG97ZL/uPm6h4rJodwMWAq5iaQWe60NLePOYLpjLgeUjIGJBKqctIljNRvJXXe+CU1UEIMTF+MJIj6QuX/AmhNxOJwpbYCl+2yxlqm5S8GyDosxiJu+S8o0JYewBfHMvr4hMtqPwY+RhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK+xfqYbf7ocnMA57q8tw58RxhWQya/CIQNesHgED4E=;
 b=VH/PVxI3Pt2sxC6v7thpQS7FvqxnuYW/d1Nrr4v7Up0teFCv/+Ib9rhNA7YjYEgfzxQCDifJ/X2lINZiI+7go8THQyX2+q75miUI8IcwXUqe/Lu+MmYF7qKFfej3IlfB/wOz+H31OC7Nl83HzJz3PcNDu8uKzFHo2Xc3i/F+SY1QOy5KgARt8VbbAHcnosFdYWOYO6rgyhkBfb25f9YNJUIdg7rcQL20Beb5Mz9WgF3ESQerTd2sbNPxWZNAu6xS8crkNwfZY7SdONq4PE3QBWX5m2bR4jYzWyizA63bTQkPVQzUAJ3SLjp/C+uv7G6EdmByu2p4p1OqRnvFanmJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arndb.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK+xfqYbf7ocnMA57q8tw58RxhWQya/CIQNesHgED4E=;
 b=OzOaseK6rpxg+lCFDyha2CylWqMPvvraMwsFCf+Vzb3TCiPQzhHH7w+gjzdVoE121WwNv4l/ZLdBCeA/DIew8f7MKz7cE/FlC6hvfPZGQENLHqwb/rIkUmVhdQ8dG19mRZNfBAgU55IlSyOFpA9hZhqBVrfiAPxB57m+NydwIxU=
Received: from BL1P223CA0036.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::18)
 by DS0PR12MB7560.namprd12.prod.outlook.com (2603:10b6:8:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Tue, 28 Jul
 2026 05:27:07 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::16) by BL1P223CA0036.outlook.office365.com
 (2603:10b6:208:5b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 05:27:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 05:27:05 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 28 Jul
 2026 00:27:00 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Charlie Jenkins
	<thecharlesjenkins@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v6 2/8] arm64/runtime-const: Use aarch64_insn_patch_text_nosync() for patching
Date: Tue, 28 Jul 2026 05:25:34 +0000
Message-ID: <20260728052540.4728-3-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS0PR12MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 27241f96-2678-419f-c632-08deec68dcbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|7416014|376014|36860700016|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: zBl3++YneMav0g2WL12xq2QiHKs6mNHmVq5K5v1lRyPCmHXo9aYReYhplRU+Z6B77PmOxCNrgErt3LgsCSjT28JdCZ42q//CC+5yP2IjOYuEmbKRf4mMETSDW7xFi5Hbiqqkbb0cmyMURr/9pQSki7PlBzWkx9hzaYoenWp2Cb0OFtZ3UyBxBCd9VZ1Wbc5CfhhWb6/3CbH6p8vthrdqSJ99Rei59grr+LEbMAB9Wac4LooOrzpbe4qxXCMxNqhCWnx9ROXGt9+N91gG4jh11HJ1aEDUmY6GJ+c6Xf/Ns9ybIp/FPMHC9TpWSeXVKkzriN/H635OKWHKQeYrtXVrGUANsO/Kj/kRPunTbpeUDGPu8Kii+4Ox93Mnvrm8WQwa5WzaRu+IV//qIpo8eEWY9ZpANwTFSTcq+pj+lGdQShxpPg5a7aR9NwogDAepPI5QijGB9wHyb7rCABETnBZ87R6NFOCXawCT64lXhWhuN++e0Rb7c2SBgr/B2bhuLbqzP9sj+/RtnirUJ9H8qjM1VjVIk7rBghNKP+RfvId0cI8R01gx+uUGRZdi+QSIJRMqs7sSNzfIZrSWHD0OmgLyKtTLBG9XntJJlQJv3d+eA7jW16rXmLzn38OXuOx/yVvXVsCw7KDdK7Jt/mWX0quyIk/1OdHn161V2xFN0mQGGQet6v7Clbo3O4WTLVVBQKHTzBTh3ZxtYx4gN8rAsz7H4A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(7416014)(376014)(36860700016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E5n9tVhkgsFlwrA4WPcWoF/tExeSXVQkIdZ55sfu6k3KRgeipprONJLhLOQoicLLhpvv+B1lm1BxD+9dQSJwYPm62W2VP9HvkGu/DPWd0brJ3sesIwFugGMFpjQzfKifu2kI/aLD65qdUcHpWEDz2dfpCSCqgmvLBqAuEy3z/yw0qpsaMtt0xgS6DkSfH/r+MId/Rs2BAaD30ZXfKOEmNjEPvILrpeQSWhrEneG2KkN4NXUWjvQnclQkddA7ZcNXI+xVPYLRmH6Jv2SVT6J87ytO+3hKuG/XOEAYzoqDOUGuUa4AlyfogENupJFz+uFwe1qGLFk2lvTnOG0D4cVbB/PexQpwqo0M55XFzcIv5Szm4Jhg4VoMlnOGph3W3X++799HYgYtHENMu+nRqWURhKEwBHqM37uXFlp6x1WRzd9E9F7LBDiMA5nTGaL7v6J6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:27:05.6926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27241f96-2678-419f-c632-08deec68dcbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_222715_674104_C6195E8B 
X-CRM114-Status: GOOD (  17.10  )
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

Sashiko noted that aarch64_insn_patch_text_nosync() does not expect a
lm_alias() address and Catalin suggested it is safe to drop the
lm_alias() for runtime patching since the kernel text is readable. The
address passed to fixup function is interpreted as a __le32 and
dereferenced as is to read the opcode at the patch site.

No functional changes are intended.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v5..v6:

o Picked up tags from Charlie. (Thanks a ton!)
o No changes to the diff.
---
 arch/arm64/include/asm/runtime-const.h | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/runtime-const.h b/arch/arm64/include/asm/runtime-const.h
index c3dbd3ae68f6..838145bc289d 100644
--- a/arch/arm64/include/asm/runtime-const.h
+++ b/arch/arm64/include/asm/runtime-const.h
@@ -7,6 +7,7 @@
 #endif
 
 #include <asm/cacheflush.h>
+#include <asm/text-patching.h>
 
 /* Sigh. You can still run arm64 in BE mode */
 #include <asm/byteorder.h>
@@ -50,34 +51,26 @@ static inline void __runtime_fixup_16(__le32 *p, unsigned int val)
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
 {
-	__le32 *p = lm_alias(where);
+	__le32 *p = where;
 	__runtime_fixup_16(p, val);
 	__runtime_fixup_16(p+1, val >> 16);
 	__runtime_fixup_16(p+2, val >> 32);
 	__runtime_fixup_16(p+3, val >> 48);
-	__runtime_fixup_caches(where, 4);
 }
 
 /* Immediate value is 6 bits starting at bit #16 */
 static inline void __runtime_fixup_shift(void *where, unsigned long val)
 {
-	__le32 *p = lm_alias(where);
+	__le32 *p = where;
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


