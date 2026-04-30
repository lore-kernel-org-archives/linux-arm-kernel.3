Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F5CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwTW1xHOo2oizqfjQ7Ki/WYgZnEp7QbFPkRmy6Ukhjs=; b=qTRsCJIgru/MLH4ZyFJfG8YxVq
	Ha3IyelGnOEjamXXFaDO1bRBi7iK6SvNPiuci4KVIubiO/rvwXUJ9iEBNOfEXRIJsuRsjCwkBhT3o
	3nAjBU52jTYucU/GsdVpePbR8fpg8ikHU1N9t92pij4cHKhV91qtuFyL26lNRvowqvqRVu1E2aF/G
	klkYmbVvT8/xgJqBurWd7ISXBsCgRBUlkvzMkT/8+dEHsz7KyOcaJojkYgLtTY1HCMmA42m2BmW5l
	E8OxuXzsUPYRgxllZ7+JJo2oEI3Tod/pKNU7e3KRcoqOWnRJ/59r3XUp3GuoVvJdsK2AEM4h08hso
	1u2TkUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO26-00000005819-1knW;
	Thu, 30 Apr 2026 09:50:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO23-000000057yB-2uuS;
	Thu, 30 Apr 2026 09:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UwTW1xHOo2oizqfjQ7Ki/WYgZnEp7QbFPkRmy6Ukhjs=; b=Qg7mDbsOxaZ5q0skpun2zybIlo
	fHeYQPckG3MJbDI/BnqJ/PqN7HOXbLtfr8ifNehDYndNpU8JFPBIyNoXs5RCnErKwbTivp8nvEfKC
	dKUcH9ul9OzxhrOnkrxXy+/xY+w7fWUeypDlL6K90bc7DalxAYu2J75MdnnkoB5QWCAlYdMOt4mY6
	/f7sSpnbNSd0UV+/IXq7YWIwJ3RFeT+pREV12Gx3Gvt+rdsgd6N8S7f9gSeg5KCk2zM//PaMBkP1s
	2xk1m4tBFfWuonXssWyRiM8NpuOIa6GheWbBmbijNZhOWcGbnsxxMgljp4iF1ZpQYElmsmXDcgTIM
	RYs8CVuQ==;
Received: from mail-southcentralusazon11013068.outbound.protection.outlook.com ([40.93.196.68] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO1y-0000000722M-2TXQ;
	Thu, 30 Apr 2026 09:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDNLFObzT4xRAHFKJNV0lPraPqqYP6fSIfNSQ2bq0XOSr1MiL6kBPHwcy2B98eVq1blLhNxgeU7MfxIvdMZha/YO7GEWtwk8k9vWzGpcU0N9ojGbrLTQpcEvKKaraizTBe5Vudp8KjTQK4XRPmMicW1U5jMTPICKaAS7NRmuOp8zp+Vj0CGmu/U+AcFmYlriVeau359VmU33IlOOtd0jDuHhHRjY6ly0ECtJlq7J9EgS8ZGJR08fhd+Q/X68StRudkU503ygbzkieA47FFFF/QykkBAumi4wKe2amG/B1MeeriKkx180DH763vhHDIjD6HTXGCYs7n1QTpd2kKF+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwTW1xHOo2oizqfjQ7Ki/WYgZnEp7QbFPkRmy6Ukhjs=;
 b=D9bcZG05CwDo3cRKaZy2M0BakeOxTxK1ZqRlcIZC4X8bqqnBtuOcFvtaFNgA1C3tEmJdt8vk34CuUMU/FPFZrBYIxfjYOwRJx8+WTWAgacsHPvkzKDvMiBSgupIpyz0v0JqnxGUQJNtLS4DpwzbS2qCBZLbhPZBlmWryyaluUoadJIKqn5WecRsZhd2PJBwej4v/IMjotDUYO6/7tYk2z2C5hgHEBWDIhX2WsBfbBFZVZuEY75rk4+yDUM6hY3uL26S4DylDY/wjUf6Y+2BFP/qJHC4l9eGR2WK7BVSUQgYfHnTxdbWxxOMNprfHC0xS9HVX1Wrv1cf4Dr3h0xxI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwTW1xHOo2oizqfjQ7Ki/WYgZnEp7QbFPkRmy6Ukhjs=;
 b=xOINo2gPCRMaq3bkIOv0wrXU+XbSrNk+TniuDEKaXRucv1CI9QVeLJwEeFVZXQJPIAd3rTDjjjUbYIl6CqDhXez9PVU6D4S1fN6qi145Vx89R3xNwH/Z+ckRTUqpbnv5U1XL8OOzwysQ3jtEUpXn+OUxvlOBdGRhNCv/Zy/zIVU=
Received: from DSSP221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::15) by
 DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Thu, 30 Apr 2026 09:49:52 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:8:3d5:cafe::7b) by DSSP221CA0003.outlook.office365.com
 (2603:10b6:8:3d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 09:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:49:52 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 04:49:47 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH v4 6/8] s390/runtime-const: Introduce runtime_const_mask_32()
Date: Thu, 30 Apr 2026 09:47:28 +0000
Message-ID: <20260430094730.31624-7-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430094730.31624-1-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|DM6PR12MB4058:EE_
X-MS-Office365-Filtering-Correlation-Id: 1000ca8b-537c-4aaa-ae80-08dea69dd3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: q7smMEh5ZqZFwRHTlgC6lPyJVEgHxjeFLzRygw2DQUj4Ix7wc4D36TbJM27jxFJT8spc+dncpscgAVm7ytxv5Ma3c9M65mzQc2dchEWY9Nrv0C4aGRluHe9ojLXnCIUcC8hMy4FpWVtrg4Ib4yiCJFjdRw3MoP/egrixFco+OsAXlUjjk3SQddBagbQr25sP59GafFYlNRkuBPg3v4Oy9OkiyxsNySHpcUkHxKwQ6hUg3KFtWBFXrJWBVvmYDbF3eb5Qmvk5g/htGBRhNuzdiQbugR4wyPgFvi3mT9UctY0sS9M+cs2tLHvhRCmJrroMa1kmlvYdITEZINQ9UBNHa4JR9ayUvXea+L9uFUEaE7UG7N8M8/P/Nc7tTkpU3vRD0U05mo2aZmTnEX40xMsPlvckWkyXq4a/FktNJ+VBXiR0n6MXIqgEZhxUg/k5RB2MYIQXWKglu2TfEp7puhhW+qcY3DCLudV5JodLanMN8W48DvapLrwNsAnSdYTdfDW19mAHJTC5YehMp6CuA8tUy1KrxQLaZNRLYWVuMW6LkgMeNbAPwj2QoCv2JOGGIQvXOnYUId0g/GMqCP+JRoJ6vVHHBnDaQWoljm/aG+7boMhj36hRxZ7SC6DD862w6YomA7h5jFueiGr6s9XnXaDltmRB2iLEJGUsmJorZMdfzpmdIsz2xxj2SZE+1COc2jzPaF4W97Yo13B/8SyaB9tjAj9HjHgQd6dskEYA4xgrjM5yrGmBKma1SEUpvPHtGqXTdFDsNEqT5eoGq7PBXKUNbg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XSF/ome2+NdtrT5Sufq3AVigsB06yzHZVeK76tD5aLaOA9WHPP9cjNEj8BB/mrI8Sq6KZR55DMCFFkOWWfgFOtz9GwNrGV415VpQuzH3M55UTFS8K9HZktEvOPcEg2Sm1aDu2XvMcaz49va3/tlAB4Cb6Biew/NV4pfBtVrR87P++QZWp8ndZDtu7a+Q2AKSxzTfo8ccRfgHaKrBuElcJfb10YExGZLYjxh/lWrrFmJwF6Uj+XN+2SHQIsyDduDYj3yoqJ5InpWKVtXXxc4ROetcDAM5t5kPQsA1XZfgWmhNtuSj/HDagAXRWP4FnTU58OgdaQJgosPHxvH0wYqnkFD5M0JUEVe7e2e1H0GaUly58SY/m0M3uH2HszmMr3yM4MFaZxgLvSmHc2x5WLK+HMhdYmIz2tE0I2erbOpVtxbWT3pyK150mkiaAlq7U0M6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:49:52.6380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1000ca8b-537c-4aaa-ae80-08dea69dd3d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_105002_818822_84078E40 
X-CRM114-Status: GOOD (  11.56  )
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
changelog v3..v4:

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


