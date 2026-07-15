Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C4C44511
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sA1rTbZ2jNxhh/LL5obxZYJeX4N47sBqb4CadZn8bo=; b=usCjFKgJup6ptyVPjcDiODVQLt
	4gccSfU8D98UZz+axvsvrA+kdpCi538zp6bDv46vskuQA9quRXvEINksgmbFey7wCVhYxD+0zO9VJ
	I0lE1/2vHCZ5Avg5tvGOJbaPjIBIHKGOwPoHJGdNSU8hIXAvnc2QhYrz7opCievboMDY//BksYJAz
	fUNQVQ5cpmE0CxtKZ9ZbJ1Sj5Xvg2cgOK10tZk5L+blnmHS7US3tdUcJfeqbIcZWyUYyAf2pgtbk7
	cbxJvumeVKhhBYl+YDNowXaNVgR4VV4cypnlb8oMGIusJvkTbm/d6j/4Sb4lF0MmMZRHQlKB+B3ur
	gdQ55BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zV-0000000FcN2-0EYc;
	Wed, 15 Jul 2026 18:05:53 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zS-0000000FcJK-2yAl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJ70x4nCZRvHASmk/uP0G2k/nt0QYNITtDZgCveE+Loxj/KBUQTMp4WUsKieKVqLHB8TAn8RgWGTj6B54HsIKBIa8jEkEarTYmbHf2rBUqWXacDy6THyRCLLW4XvXVSiqx8qX/cVFClNoATmnTW273uukyf6YcaT1MZhImAnyhzb0PiB2gRpRcVRAWlA/2flpFI2oqHN5+G/BVAJMgc294w7F5wQvn5IzpcDMsU3pIAgYpXskUyyw6smgmM6kzY+Xg+lcOJURnjS0whkvUkBZkpxrJ4J3Ric67/thuTGL3usLMAgFAANCfc3sNcZrroeU0WynZZRpTZ0bwcCATQXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sA1rTbZ2jNxhh/LL5obxZYJeX4N47sBqb4CadZn8bo=;
 b=ySbf2TF76KmwRd27Th5juVs3T9sEOmRGudjLJuzLSK4oxoKa8hoGhCdK5RFeJaniCB9VRO5wkfutw99ALxJLoTCsSBvvELH1z+0l89JJ56KCOFyzHAh74l7wNren9m3tsaMhjSedpqh3J5MsQgyFqv/W9Iu2+zKtasMCiNPzVazJJRlwzuDvn4o/zD8orDd6oYrwWU5HDNZIrCEZb0A4slXNYC1dWIKTWrgMNQ1G5KuyOglqaCvkryOtvdCpIovuhAHIgETTTyjgMsDzd6NNTSVXF9nPPQ/3MKSxQLhCVgNhygh+erBhETtanJbrB8ebpW2pVpj+sxCd99glfJfAIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sA1rTbZ2jNxhh/LL5obxZYJeX4N47sBqb4CadZn8bo=;
 b=F9kdg4g2eVl4p/rztq/m7ZUcrPE+O9gqSfueh+zeldYyY1H97gqbZxQy9eqKEIfqgiLreaqtuLpy76zW6GuxIjqvq2A2PkQRG7kXsTzN6PKOiO4rBcOU83znp1a33dAuyUdCKT8DsNfLa7WT+WyZUrfzrkjFeqn3BCtfzAPqHy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7767.prod.exchangelabs.com (2603:10b6:408:170::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Wed, 15 Jul 2026 18:05:41 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:39 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: cl@gentwo.org,
	dennis@kernel.org,
	tj@kernel.org,
	urezki@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	david@kernel.org,
	akpm@linux-foundation.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com
Cc: yang@os.amperecomputing.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] arm64: mm: defined {pud|pmd}_populate_sync()
Date: Wed, 15 Jul 2026 11:04:08 -0700
Message-ID: <20260715180455.515692-7-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260715180455.515692-1-yang@os.amperecomputing.com>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:930:89::18) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 441dc6b4-cded-4a35-d455-08dee29badb9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|55112099003|18002099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info: l/+AtzMEL/FYa9qx4EpxdZ+JqNYhGv8crxd61afWUXL8uTcTyhloHLUgsjP+07GHLxJNd/Rj81HopEr8AJRyEyBZIEyniE/ZVI/JSgU2Uyji3oj/hhnDM0YPDW1SyLd/ic97rE8B3KLxs+rIu3c4PtyPwANSZHt3Qhxf8JuPLz0Syi5mKkb8T4ev1Y6EkMK41d2Xf/atsZOj9/oqARb81Tw187KjImmaZpenDQz6aKb2V72AjjjeH8+ZWRKoeJRRQWe+c2L6f2oz+ojC+KStniXklHhY9+Dg8hHVLpN/tDFDw7DwqsXUZ8OSjesKHjlbpjAuQOBcepbPDakCBU8wCZjLif0/0tmz9+8nfhsGwyKa8r1/b7HQZ4AbUb7EbFatN0H2QZcMscDWPseC9KHcWk6XOjN/Ak0XQ8SINaqVFlS9f0srLpZm7OfxuDWYyEedsNUlJS/S7MDPKQDcpETBfoPgSJkHbNf/uBhewrqotfXr2qbCKZBTiv0jZPJ+SJ/R47THEBaVhPDz5N40dsm7iqRQyWPR6xyXR2y9/oZs0W44YSPNLjW8exD2Xqw+m9LucDBxMSKc4Bc+EV8Z5qV0orIj6SqEJDs9kVScIplqTzWKzCHjsrWEQA3ItaoQ8SsaISTyTPF6gjIak2/s1BxsXfR6iyRwtnq4gQiYPrTVc6pJJvlDqWmRlz+3nm8rOYmP21G3rkfeZd8HTPZqKpeDgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(55112099003)(18002099003)(6133799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dnTDVbdQmpwWiBbnXtMPjZnwdwyebhJ/lqH5JcOLgFgC31AbVfG45/RuSGSR?=
 =?us-ascii?Q?yh4KXmsIgWjtmovlgOaJxT81lOBUonzYHOUAxHfHVY36SLgJ5b55C+osWh4A?=
 =?us-ascii?Q?0jxHtDOWb/y6YXRq7nGDSPUuXPx6+Aly553GDnW7WAHI+MeJa0sw3v9xP/Iz?=
 =?us-ascii?Q?+FwYQO86gclyUMynAyP6t499jT8dzmLJZl6cHNRV1DtGE2rTASR5XSjJsRFW?=
 =?us-ascii?Q?V7ZgFy0MTanCZ5Epx2umwJxfLJ3dYAN95afBLGzFLgyg/gFK9NAKfXhMNubm?=
 =?us-ascii?Q?mQmH0UmIckD72LUjrFE5PoOnuRCczjs6PTKbCrhc8fHrmhuugXa3xlWRSc0f?=
 =?us-ascii?Q?N8fOTIXZfVt4uJkObCBFKr8YaQ4eum6z2OO4iQolS4YNX2R0s7y2R9ogwvbs?=
 =?us-ascii?Q?9Sz3b9nN2JgfIJHK8Rkd0PtIUmqsBn50DdBhnqJlXEo08q933PFClRevZh34?=
 =?us-ascii?Q?+5m+Xb2W1lqRcEJxr/6ubEXOKbuyRfHt7pCRrHDe4+ApN0YILHSS7tXTMarH?=
 =?us-ascii?Q?s08roBET3odu/bOS7dtkULVaYTPLXSpwKTz+s+ldJcDFMFZl2oN1lo3A4U6i?=
 =?us-ascii?Q?KCEb3qJe/R8d3zvi73NDQEEMep15v/1VhB7wJCz74c2MSmQC8dIOlzDQjIM3?=
 =?us-ascii?Q?rEsbyR/9hzv7tO1/Z8/x16opEYq4TzL6PUvjiMT6bUtWQOEnsctKWN1RHOLa?=
 =?us-ascii?Q?zI63KPd/78BRvCxdcqabxB3ZQVH1aqUAlJDixta6vrMrjDRJHvpAj+6AeYi1?=
 =?us-ascii?Q?g87ouk7SkwmVZIViDGjBdRz/QQIlN7dhq5HokbThwgyvo7WvcFWUWwgQ+eeL?=
 =?us-ascii?Q?+ky60Oov4NmZiJOiTEFZfhzpKUxSev4VcjjAg8ryiMuLom9oOgsfIrHJoS+j?=
 =?us-ascii?Q?TbMreuaOrVc704xGILbCDHOJaov3EZXMS2Wj4H1JQwshGiA4O7xqvDcwVWuR?=
 =?us-ascii?Q?vYtinPpAYIzz+beZHe9QstP9h6l48jyqUUPGDzxLrHFxtpSrCkguXrhosUFF?=
 =?us-ascii?Q?MvzTNFtJUhZZM2GuVyNVs81C8bvMvYdtRak0SvWXzNaB5Bs5jLaRm4lxf/A7?=
 =?us-ascii?Q?Y2IVvZ2orTnRnRLPIbZ6CM19LQ42onkNdS8our2rax8QsUs7P4Tt2sFmGl/m?=
 =?us-ascii?Q?AxeCJv7lWka3p33/2wR+hiL0bEmLhw5CmG1bIJUV0Lt0m6Pf4uhcKQtgdNN9?=
 =?us-ascii?Q?6E+dSGqV/uet0OyD2+Q7j+cPzOAgEMlk//B6QwlKAhokmqc0FvwW2FZmK9ps?=
 =?us-ascii?Q?FkTzC1t6mAdsXb+CTkQhGO1QOy1VopbdZUHXuVhPk5BA9nmFEt5PNVI/Sht+?=
 =?us-ascii?Q?QRTlF7KIBBqpakrmsFoaA42xZAh3Hn7y9eNTLgDetT8EIcVkWie0rwQKHaS/?=
 =?us-ascii?Q?/Y63Rhs3dXo8VyyKfc8e/llp1SvMcCuzc3DNXGt4lqkx/O7MEf0H8ztJWtUC?=
 =?us-ascii?Q?q9FwZQagGgqhX8/PyhOrEnIlk5cuPejrl4wYHx3n06zr+UbICDRGjAVyVoyq?=
 =?us-ascii?Q?cnUSbYlcnXKXDNDPDB+6tDsYtmMh5UbCXwTg7+jltjALCMpTYPQw+S23DPQg?=
 =?us-ascii?Q?5FRidDW9ERcGY3peGIs++J+74Pf79otkzawMpE2UEM1QOBCAX48eZ1dPQQxz?=
 =?us-ascii?Q?ry8l9oCfE340fMZGtnFonhL2Qx0uYuU5fqlmA1qgr3ckUV67XC3VHd0HfCX6?=
 =?us-ascii?Q?uNwHZ9dNi2unPcHxlZ5e0KKlwCNjQ3Vqf/CAprjoDcMLOWpjIAvrhugcHXEz?=
 =?us-ascii?Q?ZcDU488weG8UhCsl9TO3DwxZ3BogLpw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441dc6b4-cded-4a35-d455-08dee29badb9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:39.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyCroOkm8eysBpenGAyCPehoXy9cgv8/ay7cORmfh9eB609lTSw3Rxkxe4jUU5aFmR7MFvsT3y0rJiDGlCCaknxxptD8HMPa9kWsMZqmwDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110550_754227_7ABB26BD 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

Implement ARM64 specific {pud|pmd}_populate_sync(), which sync up page
table.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/Kconfig               |  2 ++
 arch/arm64/include/asm/pgalloc.h | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 2e1bd79a579c..23cad9fc7046 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -41,9 +41,11 @@ config ARM64
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
+	select ARCH_HAS_PMD_POPULATE_SYNC
 	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTDUMP
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_PUD_POPULATE_SYNC
 	select ARCH_HAS_HW_PTE_YOUNG
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_DIRECT_MAP
diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 1b4509d3382c..dd1ac84a1160 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -33,11 +33,27 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
 	pudval |= (mm == &init_mm) ? PUD_TABLE_UXN : PUD_TABLE_PXN;
 	__pud_populate(pudp, __pa(pmdp), pudval);
 }
+
+#ifdef CONFIG_ARCH_HAS_PUD_POPULATE_SYNC
+static inline void pud_populate_sync(unsigned long addr, pud_t *pudp, pmd_t *pmdp)
+{
+	pud_populate(&init_mm, pudp, pmdp);
+	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PUD_MODIFIED)
+		arch_sync_kernel_mappings(addr, addr);
+}
+#endif
 #else
 static inline void __pud_populate(pud_t *pudp, phys_addr_t pmdp, pudval_t prot)
 {
 	BUILD_BUG();
 }
+
+#ifdef CONFIG_ARCH_HAS_PUD_POPULATE_SYNC
+static inline void pud_populate_sync(unsigned long addr, pud_t *pudp, pmd_t *pmdp)
+{
+	BUILD_BUG();
+}
+#endif
 #endif	/* CONFIG_PGTABLE_LEVELS > 2 */
 
 #if CONFIG_PGTABLE_LEVELS > 3
@@ -121,4 +137,12 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
 		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_POPULATE_SYNC
+static inline void pmd_populate_sync(unsigned long addr, pmd_t *pmdp, pte_t *ptep)
+{
+	pmd_populate_kernel(&init_mm, pmdp, ptep);
+	if (ARCH_PAGE_TABLE_SYNC_MASK & PGTBL_PMD_MODIFIED)
+		arch_sync_kernel_mappings(addr, addr);
+}
+#endif
 #endif
-- 
2.47.0


