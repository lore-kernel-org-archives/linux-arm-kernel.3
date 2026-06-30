Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 04:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOnWUAe7fV1MG0OhhdV5VeTL0tgTSma/v1egxJPLleo=; b=u1dnvvH+id+Jv7tsimssen/Iu0
	YX8K+fI66mM0/WZm6/rvGXQij2BRxrTIoz1HzpNJqLV0Vetm6WJGN3trRYkahWJ6DpYY4zwowH2mO
	cYd8z1aIGfN1ELVKaEdr8P08D/2+3H9105+tVdedwp+eWXwZy+y36v+TuKlXk31g96AzQA0coO6Me
	xhLS5EflLRTMJwemcFigGkx9OfydwgZoxoearERgfYVrVYO3qyedBFDa/PRK8Qn862pG6KcEuVp0X
	Gqmn32Z3huMShF8rqjZrc8/8j+EGfNxBp7XktwHGVfWA68UGIhoFxYpdjUXVbfuX9iKjV+4beSQol
	dxqPtTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQXv-0000000FnqS-392t;
	Tue, 30 Jun 2026 04:58:07 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQXt-0000000Fnoi-1dZ1;
	Tue, 30 Jun 2026 04:58:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aupN7lXu8QLyM88TR7UWKRjlKoE+wtvXMtQmg4oKlfyGtOaGJh47nUftGZS8BMLk8auo9S2vGdm9gRJ9L80YikoPqyOWTFq7bSwc5e62h+46es5oVk2ypTnA+fTQIgED3w4Aupyt2h7cpkYSMPHthkCKXpp0PYxFuCjTB2XT7F0DTqOsxe7vX63sewDM3pUHXYe3KCtkAaD2DQ8Yxl8rgLoahCQInmmgYFl+lvfrQhsK5Wgb/slSxhq0wrGC7WAL/EPvhpaxrTdXIf1b/jR3KI5LIoabwdquA0AMyYMlD7iTsXR9ShXUHXpZZp0urZ41VTyNx95pqP0ZbU/27vCuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOnWUAe7fV1MG0OhhdV5VeTL0tgTSma/v1egxJPLleo=;
 b=yXx2w0uPWgF7Vj+Zcvc21lbrdmPJ9Wjz54KDOngC3jXOwmR3M+F4KW5pmrgZ3sjQPVAM9BalpnbqbMjfyWmKkJUUldWIgtfwfeVfUkF2M8fjkFTPquitjKC8fijKMsLfb0yKZ3Lojf5b+TEqhbNQ2OPA3qV7yVt2epCGwe9yIZFD2g0kqZlvDjIcIg1RpTIDdkhceO6i2isM9pr0LPyXKI7fbMwuc3XQVV3TZ40u47NZChLD+STkSmBs0Y0BTVFw3WgKgNY0dBG8DF1Z0D2FrN0sgZqDVORAb05tiHuEtjSAJ3IawgD5/dNetqJcQDXnoLMjOf3ZjVweJAmzxtSJrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arndb.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOnWUAe7fV1MG0OhhdV5VeTL0tgTSma/v1egxJPLleo=;
 b=3mU6VbTS8rbGZ56QmdsQe7jW/6eByKirnkLqY1Dcse0Oj6w0p0X+EAfFTGfdJijnc0o/gi9PhVXgHav+qSaaZv2M4JVWhJh6zUTeby0IO2KVakTKaKrZi4I5lQ9ZgJO8rBu7XHiA3xiEgj8vei3auMpCS8+viuujJxs/ts5CZRI=
Received: from SA0PR13CA0014.namprd13.prod.outlook.com (2603:10b6:806:130::19)
 by IA1PR12MB7663.namprd12.prod.outlook.com (2603:10b6:208:424::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 04:57:51 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::27) by SA0PR13CA0014.outlook.office365.com
 (2603:10b6:806:130::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 04:57:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 04:57:51 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 23:57:44 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH v5 6/8] s390/runtime-const: Introduce runtime_const_mask_32()
Date: Tue, 30 Jun 2026 04:55:29 +0000
Message-ID: <20260630045531.3939-7-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|IA1PR12MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 536cab15-75f5-4a00-9949-08ded6642392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|7416014|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: hhkblOXwTvQY3s8Q2mJP7bgnIaE32+yz/VP99OlNXsxdlpAzO3kOjUS50oFHcKzdVVnv6xFw4YZETBDmzPLYvpbbJjNb5QGCYKE9eaa5r3ydN4WDfw6RaA5wjq1Gey6KQKqprn2nxVyMfFaC7FGtAMnBiMxDCjeqBq+Wnw5nEZ1UPBUby25jBkdWoSiKlN84SC2BjQBlKI/tmhbTG4x+pb6IUldq1HLlGP7H+C1Bwg2jU296wR340aU5SUgeiJBjItUeBBeZDwRIuzdZkSkjP9TwCQC6stiQ+/xhELX0CnIaKO5fz42D6aPckaJvVyw1H64ovgkTXXVL695RQOzJuYztDGC5fAeOg+8F1h2r9onvoExC5BNt+ya6Kma8W9AL65p/KWJEuAqdyyoqYCbiuksGT6OdPsDOJncgwriJlczzTUP/DSsPRnpe0kF3NrP2d0lES4pE6vKAPncpYMkRz23M8unm9e4fQF/CVA6FGKbzpuiZygbJPR2N2lSk94wuXPRiz0xDiWmuPEFDmZyD6IqfGj75CZ42e0xCxTk0DALYqWZ7eP0rHG7rx4+75vA08qVmtWROpbTpfOYv11L/4lmOKXt3LZiWrReHf0tNc70ynDUlv72K9PH6s1JJ3zx0nTkPinczh5VOA9HfTU6UoCdcUBi5hKfu4TSPxbBgSZG/XGTQpnKR7YGUN1tyZc4cLxVBsurKNS4pyW8z2hVuqQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(7416014)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JB9Ld4HU03I1FVT7G5ikl/6EgCUK4UBpLqOV7dkU6ymvWp1ELGCc60BraMcL9doFKvFoBphryAhQe6hEEGUCDwQ7IKw/UfR0h/NmgupQ58qj/ZVNGAot9YNAnhNZWZQq+JdC3bdlscT5PCDpevkRfa/3tdtgjPjGCALYFw4LyByqxf/Kdlmb11/8I93O2G6UghadbqTUlaEWf2DvT/h1I1i9urz1OLMJjMZGf/03bS+qsYmziasR++Ff6Ug8u5iurrQUGpygu8mKrusX4QoyMSbmU5YJtPoObLD/ZxMLqmvYjqQzKZyCWUK58r9lkfPwg2Z8aH/SMBa/KioAZ2NrsezcFsonHHj7IKcKQnp/ofgEWU71gEwEqPnT8C06LP/1BMUiDpOxBIKPdJVN8NYAGIVsoV549/BtrcETNZuJh9c9bZYr+V9D50kWRViNdcUj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 04:57:51.4355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536cab15-75f5-4a00-9949-08ded6642392
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_215805_433682_041D3098 
X-CRM114-Status: GOOD (  11.52  )
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
in the futex hash computation hot path.

GCC generates a:

  nilf %r1,<imm32>

to tackle arbitrary 32-bit masks and the same is implemented here.
Immediate patching pattern for __runtime_fixup_mask() has been adopted
from __runtime_fixup_ptr().

Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v4..v5:

o No changes.
---
 arch/s390/include/asm/runtime-const.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/runtime-const.h b/arch/s390/include/asm/runtime-const.h
index 17878b1d048cf..7b71156031ecb 100644
--- a/arch/s390/include/asm/runtime-const.h
+++ b/arch/s390/include/asm/runtime-const.h
@@ -33,6 +33,20 @@
 	__ret;							\
 })
 
+#define runtime_const_mask_32(val, sym)				\
+({								\
+	unsigned int __ret = (val);				\
+								\
+	asm_inline(						\
+		"0:	nilf	%[__ret],12\n"			\
+		".pushsection runtime_mask_" #sym ",\"a\"\n"	\
+		".long 0b - .\n"				\
+		".popsection"					\
+		: [__ret] "+d" (__ret)				\
+		: : "cc");					\
+	__ret;							\
+})
+
 #define runtime_const_init(type, sym) do {			\
 	extern s32 __start_runtime_##type##_##sym[];		\
 	extern s32 __stop_runtime_##type##_##sym[];		\
@@ -43,12 +57,12 @@
 			    __stop_runtime_##type##_##sym);	\
 } while (0)
 
-/* 32-bit immediate for iihf and iilf in bits in I2 field */
 static inline void __runtime_fixup_32(u32 *p, unsigned int val)
 {
 	s390_kernel_write(p, &val, sizeof(val));
 }
 
+/* 32-bit immediate for iihf and iilf in bits in I2 field */
 static inline void __runtime_fixup_ptr(void *where, unsigned long val)
 {
 	__runtime_fixup_32(where + 2, val >> 32);
@@ -65,6 +79,12 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	s390_kernel_write(where, &insn, sizeof(insn));
 }
 
+/* 32-bit immediate for nilf in bits in I2 field */
+static inline void __runtime_fixup_mask(void *where, unsigned long val)
+{
+	__runtime_fixup_32(where + 2, val);
+}
+
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 				       unsigned long val, s32 *start, s32 *end)
 {
-- 
2.34.1


