Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61BCD39410
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHSa+xo/iTViJb7JDvDPIatbIaKCf8lHcG1QohC93pA=; b=Cs393q45g74TDv00EQEcmCFHWT
	t9j99AqvbLAqIbWUm6mapSyUnp81yfCl6OAEdxCHOt16uowmkJ5fPcj6aLWswrWQHcvjFztkh8P+o
	XxaTT4N2rgtvxhxfHTMa3HwsKL0f6xT1mIa8OYYrbLJdiVWIEr6IvHKJO8t+/dGswo5VWh4+J3h+j
	d/IbKxymmR5YHM3QZuBAE5KkjwFdvPmD3JhMVn8bUs6RVjA/PxwoOFafnpfEKfgHC4l+7RMgjApqu
	pQA/rbAaaWhpdZSkDg9EltSZjKXt3lNIyl55jN4Om9mk2NTrhHA5U3qC2ZFTAr+iOKSIcVI2o+Qci
	nzhzMEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GAd-0000000HVlK-1TCo;
	Thu, 02 Apr 2026 11:25:07 +0000
Received: from mail-northcentralusazon11012023.outbound.protection.outlook.com ([40.107.200.23] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GAa-0000000HVjF-0bmP;
	Thu, 02 Apr 2026 11:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2OalziUPqlOmTU4ufr2SJ6pnXmZJ97o9g+b1pVl8+/7C2znnVZwQu9HEz1qnYWt60a/dRd5KrTgDz8F05N32yIsLR7xHFyw34TI/NyIamN775jocD6zjW9aynZOERNj16apzt0CqZ123QTjDijZ/N+G2SVpfN50/He7fdK3dJwGOV0MGLrKkPZNs2qDq1+VCZCU6APARK3oGzs4U1nQ3PW32V/66T+AmxeOUFFVw5ye+ZR3ddVtsLlr5UJT+fyJLRRhVyR+jUgXcORytpUFa4Hga+lr6vSw+Ez8Cweq0FrAcvKMZzsh8pERtIVnbre2HA3MxRiAIeyBHIKd8gAiew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHSa+xo/iTViJb7JDvDPIatbIaKCf8lHcG1QohC93pA=;
 b=GpsN/7VPlFvjhEhooiJYcbCadHd4c0Iue+G5hXnkLiF7SHJjXuGClx6ifyxqC3uPxLQ3Kod6lQnyL6x8ffCw5ent+jswuAQNvv8lj+daJBqevSKbzXnoMt0vkQHilHIN2Q3fsaSTfQaBzriNq20F05Yo4NdGyU2MGx+bsT7/gfN9WeBaXnY6L/+2ZDgX30nAMh42V3DTvUqNlOknn2wQ0G5PBD8Kqs2FNTLBubkQwc38595J6g2zbGrPzm2/7iFND49uFqe5J/351UnqM9tMSyKLOMWu29E1KPl+9BPE9FDLlbFm/OZgMsaF/upWAOtb52GpYFT5KpmqBroOX/A4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHSa+xo/iTViJb7JDvDPIatbIaKCf8lHcG1QohC93pA=;
 b=oAGg7lkAaeBy5aAWHPDrNT8ymzVfdkc/oRo4eYCUj9QPg7U1BHBQzRH/Kp/HBkzVcdzn5CN0FsHR5Md+6c0YeMr6z5XrmIVv8RiP84oJ82EtlzPgfqkN6ZIFuLny7QKnnlkTL3+T7TXTDcJtOjB/yT1qQsdywEf4Pb8BxWFL5AA=
Received: from BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::6)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 11:24:56 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::c6) by BY1P220CA0017.outlook.office365.com
 (2603:10b6:a03:5c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Thu,
 2 Apr 2026 11:24:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 11:24:56 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 06:24:37 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland
	<samuel.holland@sifive.com>, David Laight <david.laight.linux@gmail.com>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins
	<charlie@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
Subject: [PATCH v3 4/7] riscv/runtime-const: Introduce runtime_const_mask_32()
Date: Thu, 2 Apr 2026 11:22:47 +0000
Message-ID: <20260402112250.2138-5-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0bab9c-1928-4b5f-9d81-08de90aa780a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mYliQQmrJ0DDcAY29ITT+0LdcXRBob4luygG382bGZorqfCuDPnd9ihz2Y9W3ZwS+5wCRq8hPihix6qul8PpR2OmYsMelsOwZdIWZs8yHozCpfiW3J23CUCBWnjsoBYalpcFwcwKvkDPrlVNKn4ckEwDdlxj198ulkriL7dSFj/khGr9wDjMejsIgSb0CYXoM7HDivDc4U0uKQx5mc+eH0/QtNlDIvfXwYYcwNS4TcgBtccRlyFwWGIJ51lXLJ7hDMbMFD+aPqi+BUFBPtbx6PdXgi/D9+DR6Fl3tBNkMVjxARkX0TEFGJeiLilC61kt96IVVbZblQT+rDtg+ZHVj+wVopMRPOget7qYaIiNBz2ZbEBLwo9j5PN8nMikFqRV3r81JJmQ/GlQ+YAPOzTeEm3m2QSyDuxBgoBWoKL+Xeo6Pt5+khwMT5wj80YRLT7dumn5Onvn/6uTNQcxzCy8V07+oVJT2FZPZubu0p0TwKtXRTBmkXqFzG1IolJjVsbPke3WSi4P1p3niBIAKvy9LxfRmhOSrxun1cUlkR7UTLVmHG6EV9kaFJhduuXsRymOHlHhVZpwTmH9BfeneNcUBdcglgE9Y2AhNM83JSw0RtYzToI3Rlsl4IVjUJcFUQRV47eAcVAfGtLXyOY8P9DZCItNv+CvqCEf9BNY10O0mjJJuuxWZJQ2IQYmZgeD9QBKux14hlPuP7/pICuJMU8xJ/6NXrhN4DoS7DtWCadKrWnBoxkdBXRLvHPA1GlxboBZeitnxUue5IUEEe2rUBnCbg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aKLCGsXlrPY0ulIXhwYdqgSAbafUs5KqMVtton1feddH2iliF6orIzjQRlx9+wM3G7fMOvQebn3qY8ocgEphomQRmKUFdxYqx/sJGZb2i4XoLAf2AqQit3ZYk1RV2+eYZ0PsszWd3RlmLmik839jiEg/yB0Ht9j8N0yld28ItOgPX/qqfaKZhcZCVS98WoeA0HdXOI6SXrB7fjm0RqKVAwptyfs9Up3svwsszgyuB+8Do6CzlGVk86n8wbH2NWRXGoGJcTn2RhWvs543zS8icTux4oTip6LfI4bhUdYoGywxyIGWT39u6nvyoz9cWiezEddf4XLQz+fF0PbC7/J4WGK0LbFDuzzQ++uvXBOVCS4Yl1f7gwMYlaZ/LzGEZrw+J4Om+Ux3D0l++17hKOYNyFrZfdRESLrhHOVkp7E+/YKPwHpXb14HHtTW3iTFjMS2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 11:24:56.4585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0bab9c-1928-4b5f-9d81-08de90aa780a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_042504_187876_E634A0BA 
X-CRM114-Status: GOOD (  12.19  )
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

Futex hash computation requires a mask operation with read-only after
init data that will be converted to a runtime constant in the subsequent
commit.

Introduce runtime_const_mask_32 to further optimize the mask operation
in the futex hash computation hot path. GCC generates a:

  lui   a0, 0x12346       # upper; +0x800 then >>12 for correct rounding
  addi  a0, a0, 0x678     # lower 12 bits
  and   a1, a1, a0        # a1 = a1 & a0

pattern to tackle arbitrary 32-bit masks and the same was also suggested
by Claude which is implemented here. The (__mask & val) operation is
intentionally placed outside of asm block to allow compilers to further
optimize it if possible.

__runtime_fixup_ptr() already patches a "lui + addi" sequence which has
been reused to patch the same sequence for __runtime_fixup_mask().

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
Changelog v2..v3:

o Moved the "&" operation outside the inline asm block to allow for
  compilers to further optimize it if possible. (Based on David's
  comment on ARM64 bits).
---
 arch/riscv/include/asm/runtime-const.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index d766e2b9e6df..85efba8ecf12 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -153,6 +153,22 @@
 	__ret;							\
 })
 
+#define runtime_const_mask_32(val, sym)				\
+({								\
+	u32 __mask;						\
+	asm_inline(".option push\n\t"				\
+		".option norvc\n\t"				\
+		"1:\t"						\
+		"lui	%[__mask],0x89abd\n\t"			\
+		"addi	%[__mask],%[__mask],-0x211\n\t"		\
+		".option pop\n\t"				\
+		".pushsection runtime_mask_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		: [__mask] "=r" (__mask));			\
+	(__mask & val);						\
+})
+
 #define runtime_const_init(type, sym) do {			\
 	extern s32 __start_runtime_##type##_##sym[];		\
 	extern s32 __stop_runtime_##type##_##sym[];		\
@@ -256,6 +272,12 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	mutex_unlock(&text_mutex);
 }
 
+static inline void __runtime_fixup_mask(void *where, unsigned long val)
+{
+	__runtime_fixup_32(where, where + 4, val);
+	__runtime_fixup_caches(where, 2);
+}
+
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 				       unsigned long val, s32 *start, s32 *end)
 {
-- 
2.34.1


