Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77320D58B21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IInZyX9l7F/pmWJSWhAWj1hnmM3CjZxxb7Wx5P05fs=; b=dbLP2AutUwlgghgOhA8Tu6vPCC
	lbFEG9Onl8HHhWRo4PsayvNm/hfasE19XVYBGAEQZchZEdRxUPr/FMNrLdFJjphv/vUgkTWqp8Gil
	JiV2x0y5zkYjS3leSTvBdEFuhKXp4+ywj4n2q1Qv/LdeCgP1KQITj/Uvdm/GUbsgxQIL4kgQVtLkG
	6wy2pW+O/s0nyJbaW4SoTvMamwN9bSh/8wN9YipBYJRu8iJuN8ZXoHw47+F8JiAdojG72xVvgW5H0
	hBJOuyFxELHGm1IzQvWqu5B2hkxwYrQSuOFmnM0fl5nToq6upjSp2On+rbThEbXkCntbzb2nBf7AT
	F45SA0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20Sd-00000003KpY-1AFw;
	Mon, 16 Mar 2026 05:25:51 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20Sa-00000003Knv-1HDH;
	Mon, 16 Mar 2026 05:25:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQS4JnSA6qQMDyVA4o3tr7NI9dr8b3i/lmZQ+JAUDc3X+IGLKALVlQnFE3BrKPeS2POXaSTNDwy2B5TD0ksu7ZMnQfPoUFWwDiOzOo1oDSwNfbs5K5cl4dswk5Q26LCcGtmZ9FuhsyYbtn2oQ3om58yF78+TzMV8A7/v1sLEgpA67/ZsaatMNGl8MHtU1sBESZD8Dmo2MxQ3+cZD59dbiMPanRGsjZgjYo1Pe+vkcAMmJiX5a4OaOkmkohs/SXLnYpLo16WmYmrXNBZXOHBrJxTqqpXSg8DCZOZFNxtscTJdOTys62J2Bx2wb7aJkslK+15eMDdCucWpW2GffJY9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IInZyX9l7F/pmWJSWhAWj1hnmM3CjZxxb7Wx5P05fs=;
 b=EBvmT5qL1iG3yCWWPbc+5gzg9lPocAnBQHEugUo5exHzg2AZed2hCFTa2YXi6AAP5pv1R6tdob60pWK9lZphOSBocBEfnO7Vz1b7NyrAuQEp0+9aNDpNCMq4cV4XEilAoFTBp5QQlPlI4DgBZrIKLbd1nfdfRYiLIpYOLH0CckDPits957ZOW6pD95O/trnflenRrSBk83I61tszAFdm6SEtYFn9wpA3E/ZSpcsP81xF7YF9IiZFf4kIuo7P2EoLqqUAKlUC0cPMQW9ccX51sBKRLKVoA52PjwEAFugDF6JuDeT+5rd+ufZTyt8RFmNPFxfvYRY7FSU3mvb8J0mRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IInZyX9l7F/pmWJSWhAWj1hnmM3CjZxxb7Wx5P05fs=;
 b=DinIt20O31LNxhf64qKQtNQbFF0L6BhGeR9zeBNgnw8RKb0racQGe2RVp2hlhYcYihzrMnstlUK8d4yTJUG+asPPebsyQ2wImNCyj+kVA8j8prbj2zlL/TXAJg4k9AwzonzMPDWEAMA5ny347yygOWiCbPewKRkFFlAoQNVHpLA=
Received: from DS7PR03CA0125.namprd03.prod.outlook.com (2603:10b6:5:3b4::10)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 05:25:38 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::5c) by DS7PR03CA0125.outlook.office365.com
 (2603:10b6:5:3b4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 05:25:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:25:38 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 00:25:33 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>,
	Charlie Jenkins <charlie@rivosinc.com>, Charles Mirabile
	<cmirabil@redhat.com>
Subject: [RFC PATCH v2 4/7] riscv/runtime-const: Introduce runtime_const_mask_32()
Date: Mon, 16 Mar 2026 05:23:58 +0000
Message-ID: <20260316052401.18910-5-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7e1b82-faae-4dcc-05a7-08de831c758f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: BAxZvjw8l2fJ21iv7yMncIorOatamhATxzEmWnB13vj8/KwlsFXIbUiMcL9GrhM56VE/udgqsfMA9sw48k4XvVgOpS5uVeMYxc2eye6pvCI9yyvdL4P0qAzy0/fCkq/BCWAUBHDB5mfumrXWqpg0A5fHigAefG+exPhkAwMkAQ77+od6sVRK9TYIJtJzgObcJc2RLUewoMbT0lXVkEpPrlmhbWJd68VTKFyH+/THzwU5yqoh0lB2N1jHveNg5JfhY/IDezlrIZHHIZvZjAxiVwkwsKSOkjOD7bvVo5ckUyZ0T9S4OlW6MYJu+ngRQDJDOa4JN2nuIk8Iw0z4gdwZfIOGIottRIH97pXi255UQvQraKqHmsBqE6fR226E9AKNzZPWzkn09dU/wL1aKJAldwDHdiErxoVRhu8r7aTz5FsQ+7pAlS5pFPY+fg6f1l49OKEBidEF3k5npo9iINsv4TPRtXqJYfc1VEVutwYnds3Ugnx8hInQjyZaL0PB6MINKSQArB8vkYqw9St783d2Ke5gnbAlCwQ6qR4FVVAWI/XGOfdbTrkvwi+PSsurjvBvsoMcew8yZPXxaUxcexihhvA62jBYHM0RCCiwb+iDFGYMk3JKvf4HujqhfWT6dCHWhBpXtQtSMAZil7uOFJkyCOBj9PhN5IYpcW4sAptHgVOShCK2A+5701nLDJSymZ1VP5OXVhZDH+SEQNQbBj05lXK1ZV3aj17tzDyYQ5zVpLmXNf6jtfod+QJhpnQyIgC2SQ45GBndNV848iSHc4Hxag==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1DYWVfhOo+e288MSLDszrtZ2THH2KdmD+OdoxJ5H8QP+uftVa1q2jSZV5dxIS3LSPVVMk+DFCK4rU4ETReiXcSkBQVsFcow15QxOfK8k1LjgYwhACuNQtVMs91OzF2tKyQ4lNjVgc6/9ExQqhA+FND7fPq4gkBoDUmHCjeA0VMEZyhxZ+Co/9w4mFEGJbRaEsGVFCWuOob19VngGcpCZvsNnePEX9FVIAOVwJQUuYB2u1wOhkag0iezEtsujPfL5dUbJWqet0qzZFXpMS7teyiFe0tfBe5V5DVcG203tebfO8JZ8QlZuxAPXmt7XmmwnqHBAucB51cxoa5VeqkQHITOZn+4A4uvubq6A76veArefT2W1yf0l0bkW9Ptk3ri14PUdnTiRwTnTR9kWustc8hvYvxircEwdONJpcQzRtZbAg7m5Oi0sO89bezMWQzgb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:25:38.7028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7e1b82-faae-4dcc-05a7-08de831c758f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_222548_345015_F0E33E75 
X-CRM114-Status: GOOD (  10.00  )
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
by Claude which is implemented here. __runtime_fixup_ptr() already
patches a "lui + addi" sequence which has been reused to patch the same
sequence for __runtime_fixup_mask().

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/riscv/include/asm/runtime-const.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index d766e2b9e6df..f54289a7ddeb 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -153,6 +153,24 @@
 	__ret;							\
 })
 
+#define runtime_const_mask_32(val, sym)				\
+({								\
+	u32 __ret;						\
+	asm_inline(".option push\n\t"				\
+		".option norvc\n\t"				\
+		"1:\t"						\
+		"lui	%[__ret],0x89abd\n\t"			\
+		"addi	%[__ret],%[__ret],-0x211\n\t"		\
+		"and	%[__ret],%[__ret],%[__val]\n\t"		\
+		".option pop\n\t"				\
+		".pushsection runtime_mask_" #sym ",\"a\"\n\t"	\
+		".long 1b - .\n\t"				\
+		".popsection"					\
+		: [__ret] "=&r" (__ret)				\
+		: [__val] "r" (val));				\
+	__ret;							\
+})
+
 #define runtime_const_init(type, sym) do {			\
 	extern s32 __start_runtime_##type##_##sym[];		\
 	extern s32 __stop_runtime_##type##_##sym[];		\
@@ -256,6 +274,12 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
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
2.43.0


