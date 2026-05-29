Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D3CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2USVN+Gf+eleTomdJbGlh11H87h/wcG6J/yHus4iEaQ=; b=a3/Hr0iEWop+oBa2ssuJ0Bzgme
	yE2z6YKg51uAGeGnH7cpwkQMeJAJzbxOwZwETHVAvpvQ5Thu9RoNiOB+ns747rMngTB0QzSbTkiUO
	+iNXYgixfqsOXkuU2MZ3GGGzcXqaenXVuJf8llMKs4VS1l3UA2sHsn0Ge1Cuoa4mVBb2eWvp8S0FN
	1hFLcL9f3fiF/J6LAOFu4eCKvF6pk34Z+8gDKBOwsVcT3LlrfPXD3No1FTnPzr+nIe9R21Fu2ydop
	IrVIkEWGqcIfiMwvEdrvC5w0HKkUewRMbXlbYM6QaNCJGNmIvgoVNgI2aI8XQf7aEEnPYDNBekKgI
	q4uiXsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrkZ-00000006t35-2rDr;
	Fri, 29 May 2026 07:35:23 +0000
Received: from mail-norwayeastazon11013071.outbound.protection.outlook.com ([40.107.159.71] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrkX-00000006t11-1AWs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:35:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMK02vraLXxub/LxS2NioBHocDdi1RxLq4RpfisISuOLDvC2F+T3O/XVbkEyJtK/eGD4XVLyGGS94n3ihgOZU1B0UjOXj/WW9kz+83xXTv/rA1jZXVd0AdzxqHrS8qC8rmByH8eAo8OY0NX79JRJOMxn5T0kzRiClFpNRDjymRQ03gy70BXr0Vz8+LDS1KRDqgW0kwVM0S/4NJHqG/mSN6D9QriwZU9myWT3l7MxsrmeW4u29dey3F+Cv2mGLihMN5pRstZNYVhcjh8FPZ4c5w45YbaDFO9efJ3hRJG7oAh3DcYaD/BDEBsAyhUifNl6fX77w6VohTFR52OHrULb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2USVN+Gf+eleTomdJbGlh11H87h/wcG6J/yHus4iEaQ=;
 b=YLdHjzDByvqXyZqH4BlnG19X7XwONhXognJokeRrZUzJrDQDTPodMr3Xd+yCgM836lqh/x5rxVHjcjS5lg0ou/aX7RQ6rt3EHfqSZqRwS9HXpIvTv+2FYxn5u/ahQoRLAOgYtSNFttJdodF2JebUKoxYSV/ZkntEFGPIMQ2MHzmQ+qKguTjuL1sbrbYcDumtmFppYZR7+LMlF2IdLdfBIIrELLZwI+k6z926f/Z6DeU1LF/NexXFyqh7VtbjPfd3wBl+NrRpMXssy+GBZi73lEt4PXX6rVu3oRZizK0uWU1DMau6DpMtUd+wnIIW29HMdfg4ZBg5YQ0xzt5KhMe9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2USVN+Gf+eleTomdJbGlh11H87h/wcG6J/yHus4iEaQ=;
 b=PoAph2R71vYNHMmFFMXyUhcn9Uaxiu44n/WfMzBJCMOAF2rCoxSDv4MrZEaXFmoWE3rqWDJHpdNUG1MgXGvblG6dBFsLCtGcQH38ZstBke0sbhQhU1Kk5Yc2cmlwwgKzdp3nZCaSYSrw/VSB/PXx3ArjzVYoDeOhnD+YeiiBJhheDki7a/HLWnT9T8UB/2I1mnDn2NhxXTP3t+AyCrQvsQSTh3kRAElaB4DM53ixGkFyqAVBVxNIZxRTREjnRDCpID4VKdPlzXZ0LXQWxjJAF8AFiIlm0I49bIjWg1t/S8vTWygLoDgIZ9+CZ93PXfWWQDTyuEhJc1CBL/QxJLPT1g==
Received: from AS9PR06CA0405.eurprd06.prod.outlook.com (2603:10a6:20b:461::35)
 by PAVPR10MB7353.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:35:08 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:461:cafe::b) by AS9PR06CA0405.outlook.office365.com
 (2603:10a6:20b:461::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 07:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 07:35:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 29 May
 2026 09:37:34 +0200
Received: from localhost (10.48.86.253) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Fri, 29 May
 2026 09:33:52 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Russell King <linux@armlinux.org.uk>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] ARM: decompressor: Disable SCTLR.UWXN and SCTLR.WXN on armv7 MMU enable
Date: Fri, 29 May 2026 09:33:43 +0200
Message-ID: <20260529073343.1147383-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.253]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C710:EE_|PAVPR10MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 81694aa8-0e82-4848-1d4b-08debd54cf5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: H1+47xX0+BEQ2o4kRdzQej5wf7YbACFvOP+LNjlCR0wHK+zZWqX63cCmKBcX/ZgiWqvf8C45AbMNa+infrOpNOzo/C33sp9l52UEGZj1FUh2ArqvbHwm40E7w5LNgLDAwEjbnV2tD6v1zkwqpV1zZQYCnN1TAj0fbSwNxOoA/SZo0S6d3Y938xgJt5ulkbumOWd9gsKNQXKsDXqwEN5eYvVl/FyuXtTXS8D//SzXYdHb41sa684SKxen0VSE301xrs14BFTT7oyq+7haBb0dNgaVk0xxdBB1HkFudASQTAMy5h4FhBVF4m0gU+lcs6UTBH9TgnDJ/kSzn8HUXmz1pFa2avVdu7Lp7/vS5IsdgA8MloYlkst1QebBtx+8DD60X5aQ2N5+e0WL5KgWKR960Ain3Ub59W4Lu5tUSExHPPrRLm87j7wBCUcHlanixja4HoQ2mJXOBFov2Z85gvfiMvxfSi7wEoR5xxuTl/2SvOsCVgZE2Ux+npfpErhnowu1Pccm9J2v6Q/XsA3L243QHJDByeL8AlQSJWfrk/mn4DCLkafgoi7+2DkXP6KlHrzWdEEENdabn76BVqyrprvsO6lxvixqlSTA4Ae3UUsPTUoxkyOzC6s3GsllRG4N6ORRhKDF7RbyOGU8TUGkJT1LHymiXt61jx3JoDSwQ10/TKV8oAgkcndQCwI66z5xKsELiztmNwgB4vCTsCNSAFkntVJFlfFqH72Y5jeM0Vurs4Q=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LtP7gwfNflBNesAlY6yuBqi7u8F/w7FD7Ec+7md1EQ34XLvNpM/e6A2K38VNvWj9YqOydR0rENN3yp1xg4aKDcpgOnsyDNklcwA6kx7w7YS8/rTD3yxjHagu7AelIyvcojwP3+cHFtqzKf5gJfTv6w2m2KeUXtnJf53u6fgt9BqZT3wxK+AdcHEk8LjiyrqO29KKzwtskl3HmGmf5T7svfwpxJNM+IDhYnCSP4h4euzkkoYVnighG5zBH9HJgSEmXMqC/XLWOTsmIilUf9FLmVWnZs6ZMqZQqlKGzTw/RfEWA1NlTeB/at1/35/YRFtviEFkP3DT/q2/mZdK4A+E7msN2rvRDUxJ6YC1dfSa7iMp3tyJpxQQBmN2mPiJJCWXpUBufg1sDiawNTVnPwqczOWlQQWR3+RWjfPMIIdqki6D4MlwFddbDbicxV2KMom1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:35:08.6149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81694aa8-0e82-4848-1d4b-08debd54cf5b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_003521_791713_2A98F653 
X-CRM114-Status: GOOD (  10.38  )
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

The bits 19 and 20 of the register SCTLR were reported as reserved
RAZ/SBZP in the ARM DDI 0406 "Architecture Reference Manual ARMv7-A
and ARMv7-R" till version B of the manual.

From version C of the manual, published in 2011, for devices with
Virtualisation Extension, these two bits have new functionality:
- SCTLR.WXN, bit[19]: if set, forces regions with write permission
  to be XN (execute never);
- SCTLR.UWXN, bit[20]: if set, forces regions with write permission
  to be XN for PL1 accesses.

The kernel decompressor initializes the MMU with a simple setup
where all the RAM that it's supposed to be used is mapped as RWX
(read/write/execute).
With this MMU setup, the kernel decompressor crashes with a fetch
abort if an element in the boot chain has set either of these two
bits.

Clear the SCTLR.UWXN and SCTLR.WXN bits while enabling the MMU on
armv7.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/compressed/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index 9f406e9c0ea6f..e4adfaf0411b6 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -886,6 +886,7 @@ __armv7_mmu_cache_on:
 						@ (needed for ARM1176)
 #ifdef CONFIG_MMU
  ARM_BE8(	orr	r0, r0, #1 << 25 )	@ big-endian page tables
+		bic	r0, r0, #3 << 19	@ clear SCTLR.UWXN and SCTLR.WXN
 		mrcne   p15, 0, r6, c2, c0, 2   @ read ttb control reg
 		orrne	r0, r0, #1		@ MMU enabled
 		movne	r1, #0xfffffffd		@ domain 0 = client

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.34.1


