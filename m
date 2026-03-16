Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46C6D58B36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZxCkuRDPJ3Fw5YSsmFNTHQPUSGNHDCsHmzrXkPCG/w=; b=uy62N3ppO7EXRAkD2XZsp9u/hk
	G2p6sBBjcnX7AbVi63FIu3qpA2TPYzyuE22kCfyvpRLAH306g5IsSN4W8+ggUIyDJZABVmu8CYVfA
	qcrHguF1kkfT3n3RaICMDOnZkvd2AMtknJkNZ+8oWKOCjvtG3eILdC3gcgsalqOtUVZ96Ha3hkIU+
	WSZ3Y+uvuw7riL39ekxxq1/j9DiHnogCfFe+7QbVYQARzyfdx2h+uEFIemRsP+2wsfyCVV/ARnzxv
	dlm+Mxm0EzQafbhPuUACpSae/K0VFAPNzSuLg0Hbgs4emoh7XlLjbfC4By7IxXx3+cer0GNmh3us/
	89wj7sZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20Rt-00000003KSk-1s5d;
	Mon, 16 Mar 2026 05:25:05 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20Rj-00000003KRB-1DJA;
	Mon, 16 Mar 2026 05:24:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cn6pE7OYeFLrS/czE0EzpSTJtsVFFOuTEJCusvlJT0mqXcwPjNM5pNhP1gOm8w6+EN6eVAkOxyQtIjInRbU37s4kN6qOUrmSzes3Ctjjb8z4Oa+7ooi9XRaaft30G2XH8OGe/a98d2veFdgW5bhiRXBL93104VsVg/OVVKrk53VghcO03wKrygt2/tuz9Nf70sd/Xf/ihUvWF8DzuaWMPEiyJnxwPxOL5J4O3cUHCxMfITWV9waspxIAmR73BDX6KjdwmvJWNqI9KVY+TSpAPI1qLhxH4OIbiOMQpSSq+GTg2EpRbgytTSOS4QOqddnNn/ij7xPcyVrGPxtLNyIV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZxCkuRDPJ3Fw5YSsmFNTHQPUSGNHDCsHmzrXkPCG/w=;
 b=ShJFC+E/G+faw3RdiempK5xgXpr4Qe1HxIM983ApyJTWrfuf8UWcojmUvsSEmdfefxGcTtlbOZKAeO2xxE1c0vJ7TJrDE0M3k81713SLuUywl0IzXozwejqLodcH3IqG20g8Zqojm9Mv0Nqfx6MALP0AqiCwyLZZOesS8SSnJXqvUiiKE+fIXSrR4erO/fwz6Q2eng19UrAb9xCtIO7JYWSDFQeYg6NmqSdoaShL25lSaoZsh9JdJnbEhSUacYco6LiXWklUUl+MRrek7V82C//I+e2qI5dOzeexnqIE7N5iAf2LvmL++BB4Z9fJ3B/LNRKmt8lOhsDxn8n5n9LhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZxCkuRDPJ3Fw5YSsmFNTHQPUSGNHDCsHmzrXkPCG/w=;
 b=ZCLgAw9LGFgoMWGG8lolxuED7C+EPsm68cvtI0O/wAKFJqUkb8N/YMDKEdSnnYqf3sb1ZCaJAdTYRJtUTKCHJfeclWfWiCUBO019MjF2lOK8bwQUCTK8+ZMoBPDeO5DhisszikkGbQAD7Z0B5jc69U9ReG/OW1wtCD3q4ytuDXc=
Received: from DS7P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::11) by
 SJ5PPF5D591B24D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::994) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Mon, 16 Mar
 2026 05:24:46 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::56) by DS7P220CA0004.outlook.office365.com
 (2603:10b6:8:1ca::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:24:45 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 00:24:39 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, "Sean
 Christopherson" <seanjc@google.com>, Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v2 1/7] x86/runtime-const: Introduce runtime_const_mask_32()
Date: Mon, 16 Mar 2026 05:23:55 +0000
Message-ID: <20260316052401.18910-2-kprateek.nayak@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|SJ5PPF5D591B24D:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d319a3-5435-47d6-928b-08de831c561d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|18002099003|22082099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: AqzSbMMKaSGU6vqFO6vPHsIaMFn+BzHOaXnYTHlsJiE5O7YyhF+Jbce4RmO3pa5XWVCEMAackRtV5DujtcLhzZv/In7zJ8kwID62jwQeh/ue3JOt91s1fGmN7m/0VJ0sOHQJCrEq9fSfVssS47O0eyPLOyWyqssqLeNZFeWZEUhkmZKcVQ1LUWEwFmTlbhQI+0p2pLzTFM5KJwOnXAu7dHI8TgwDhPyYjQUXCGONg2ZYY2L+vuRrTnh6dUsycLrfjV61CKv1mZXfEcpxsmzfjaCR/sAMQFlhujjIPC/E86iHvI6fTiw8vtHo7iLjYWesbl8V546hK2syD7v7+xxsljmJTaPJ79G9GZkdbEXk2RvycizV6f0Ky8f+CZQwPkI+nFye9rf3IPcRVc4c4Qr5FXNf27dxOhxUlICIoNg3bn9UltvQPOtyqRFaV+94lUG68+38c7VxQA+8FMLgUb8AiQ/t23VQxmp2GII1AJ8JCOvnTq3dVDSz956iOO3KtCCNJOqcJJrTy9cdVsqo0Mk9uY6ko/NNLTdgmtDJxxVX8COfwDN6+7FlU+Ro620FQcdvJLTuCOalpdchMbvWY2NS85XVW9IQ2mIGz6nV/JB/QdgPdji874LougE4h9Ts4AWhT0Y/BRoYKmD0dDOa7RZMYleNisp/qFacxKURkOJVxWYYxvMO7/N513cSkR/DdsOfCPlO3JbmvMOpeU8Qig5tNzkpjvZXt2Q+TBMbNcFt4Ro=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(18002099003)(22082099003)(13003099007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x1SYrVgjq5H7VXgy+jXyUZe47YIA2hTAosGXhHynvrFlt/ZOE84YmaJWQGuRzZcGlLPqyCHKNx0/WyktUAm4O5a0L1HFZIxQ7st7zxNkT1wlcEo0L48TmjkmZSVkDC4zy/V3urzTqKkES6OHyHflYooZW+6BseZ1FXoBnaXCTYJLGlnSoMxe1eJ4vstrJfSA5804ybyBwycmO54RcYWpnJ+6MJrBoFdaKNXu/jiwqJgLQdDW37o2qlmwJpWu+oU6IHR1GffDXCeXaoG5I09/QSjER7RsdIcLYRQUwMhQJLJGpx94+VU0MfOs6qQFMnEEIr0JLGRt2q15q8ux51lXkAHnDpJAO5zC/4XLU8rTRGjf2G3FpO+xLsMUokU+q6eFGt9j3aaP2vap+MTTETmLVugqX4ckGihbCr0yz76IzxWSRkBY3ScUBnARddt3HXkw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:24:45.9817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d319a3-5435-47d6-928b-08de831c561d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5D591B24D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_222455_337778_2817B1EA 
X-CRM114-Status: GOOD (  10.40  )
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

From: Peter Zijlstra <peterz@infradead.org>

Futex hash computation requires a mask operation with read-only after
init data that will be converted to a runtime constant in the subsequent
commit.

Introduce runtime_const_mask_32 to further optimize the mask operation
in the futex hash computation hot path.

  [ prateek: Broke off the x86 chunk, commit message. ]

Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 arch/x86/include/asm/runtime-const.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/include/asm/runtime-const.h b/arch/x86/include/asm/runtime-const.h
index 4cd94fdcb45e..b13f7036c1c9 100644
--- a/arch/x86/include/asm/runtime-const.h
+++ b/arch/x86/include/asm/runtime-const.h
@@ -41,6 +41,15 @@
 		:"+r" (__ret));					\
 	__ret; })
 
+#define runtime_const_mask_32(val, sym) ({			\
+	typeof(0u+(val)) __ret = (val);				\
+	asm_inline("and $0x12345678, %k0\n1:\n"				\
+		   ".pushsection runtime_mask_" #sym ",\"a\"\n\t"\
+		   ".long 1b - 4 - .\n"				\
+		   ".popsection"				\
+		   : "+r" (__ret));				\
+	__ret; })
+
 #define runtime_const_init(type, sym) do {		\
 	extern s32 __start_runtime_##type##_##sym[];	\
 	extern s32 __stop_runtime_##type##_##sym[];	\
@@ -65,6 +74,11 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	*(unsigned char *)where = val;
 }
 
+static inline void __runtime_fixup_mask(void *where, unsigned long val)
+{
+	*(unsigned int *)where = val;
+}
+
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 	unsigned long val, s32 *start, s32 *end)
 {
-- 
2.43.0


