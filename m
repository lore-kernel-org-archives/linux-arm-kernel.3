Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B5FC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKHtFe2JRdiFgYL/hT6/kLrYk/Tcs7+w/tnxoXje3+U=; b=Cc5WPjONYW3H9wGI8AUvvSuRc7
	+Xt4nVtiIeaOn4zpRSvD993tpjSqoGU2MNiv/1prwwvdRXE19vtqHupsks9uLtWgANShT+FcflRXX
	glQALmDn3sg2snmW1YnUX7yXHAWPG1zYCuCvx+wJNoq/Z0fO3qHC8yEbp8gQJm1YrCyMu9srDBzwM
	4FtTIKxBryvDiH8JPPQYM/fzwyCRRLIc3h62HMgjomUD5RXliXHvyLjUzlhM8FWx8Is5RX+JxlbMb
	WkEmXsWbB5hzZdtM9vzeL05qqnd/10liz702x5E6U4qHtpmpfF9WAx/XOzcQKJcjE/rvGX4ZKqgb2
	8Pm+24Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zq-0000000Fcgk-2u7Q;
	Wed, 15 Jul 2026 18:06:14 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zX-0000000FcOH-3693
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKdAceXhiCgqsSSFz5htt62NP4YcvKijVthAUtPedP4DiKhHExKkai86muNYbDPD/3ddTkrpxEBmEcvic95UJDVMdBUhDt+5+Nv5+6YjM6Ad26jwm1BCaRjH9bE65V2AbIH1evNpMUrRCyKOtvHieqnQjZHD3YwBUROECX1tcpbmS019uAlxGR1nZK2GFQT+gSnn6sT4o+4O/F6spNrBblSgvlZHflmQOp4liWlpZhPiRU6cl0J6HsaRKngdNl668nBH8kgqsBl2MDdT4OG8r22LewkQ5GcWq36mo74iMoJDp2Sei7BvdguKpHnfod+KmdZeTdVH8O77aR/kobOX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKHtFe2JRdiFgYL/hT6/kLrYk/Tcs7+w/tnxoXje3+U=;
 b=oI/wgCuWi/tZlenEp4cITk2FbRdnjGN1uVHmJ5I2Tlmxx/tJ+5AGiaYmX/lsyguf4IWDKGwlvkfHOJORp/RGA3pC9jrtr8CjbTZfaR8/E7x93UUvNyTfngU+Cy9zcmpRneUEuAcF6UVjf/fCJESzrrvlV+SdGVHth3kSLJS1tepHqnO1zrgwam1zqxDaqHVYn1BNuY7PHjz+EbP9mLuF1RUGpAWFJ3SBSJkZW5k7RFIfo1GqBNPd5H1DUj4gHfUpVV5iuk6FYy7Xztu1ISK8n2DNjJHLT7TkPEvK14xekDi0h59vqARJ+3eDW//dy/zKg68Wk2roFRKdEFZDHOkpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKHtFe2JRdiFgYL/hT6/kLrYk/Tcs7+w/tnxoXje3+U=;
 b=BP2uW6Bmd6es7861eHkuUYqo/meHoQIG+ReTVAwAYQEn4O/yHIPYU55FUyktx7E5LbPqaHI04ZZBMe7qUKtcL1ywZg0PLwHAKUO+NqJvWvIRkbfDB2csK922EJfKHKX4oMSn8/CARCW0Yu+73RSUY8dCvw5Vhveq38OAakBsCXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7767.prod.exchangelabs.com (2603:10b6:408:170::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.10; Wed, 15 Jul 2026 18:05:42 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:42 +0000
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
Subject: [PATCH 08/16] arm64: kasan: sync up kasan shadow area page table
Date: Wed, 15 Jul 2026 11:04:10 -0700
Message-ID: <20260715180455.515692-9-yang@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9042f7e0-994b-4322-362d-08dee29baf4d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|56012099006|10067099003|22082099003|55112099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: /xEU/x1rDAVUJnpNMu92877BYkqXJ0CGc6EUEQs4vYyZWl3cEJJvH1tjvjG76k4gFv+nP6lsjvzCSxqGubdodLVYcN7VdnRg02z29IjTSlBRlCFteIopvaY847eTeFFGRX5DDuHIjRL5EVSlaVr40qQ4HDJ4Qs+oGFAgaVIkdSkGLoEO4sx2pefsYbskSOZkLRPWUPszQf3sCVIDMiK4FWtXMkXDFby5BH+kk3w/QsafxfHVhl/RxfRlHZ49CtPfa8b+BsqcvNf0KDhuiFAgkbq04tA6L1jqGRNhFb8c2KDKrlBWqHohIb2O4GsOWLKdH2Ej7FeP3gUlmQb5930Di2UBxiBdVPiWP1RdmQibaxo3sxOgNMiSbwTG104UMsoXya6VPq0JGIojSixCV/kF2NDlOazGBcmXFvYcAHCIFxfW9VjfVMchXIiRLnJPkBMiCdwffZKVtcetDs604C4ujmg0gT5GPf/m1knsOoVN3Bkwx0wLKvaFMFMbWh5/lvhvhedcYA3AorXlek6hAEQkIVYx8hHVj2bGEOpb1/RukUJoLXnfIlR/ongFjqpC/bsZzPrv35N/Z9EJEWJEWIXjjeENnluMV0K6EusVbqyUuBe7Z4/FkoLnSSdeej9W7eKdRYZqBhzI8ywyp9JBTLvJ9OPGPDoosLkZ7dxf2SC9fptjpIvX+QJbe4O8ZlE39QviH2n2gooTZx1pQpSFXERPug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(10067099003)(22082099003)(55112099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9mGosFjWDo427XvGmSO9sM3LDL87roj1xKAOWiUO5z9c8eYPS/X6NQp4AAc?=
 =?us-ascii?Q?xB9lwfj3kn5XrvJZHAyBwA1psowLhTpFLeG5Maib4RXBMY4yKGuud76ResFT?=
 =?us-ascii?Q?LyP9s26JONjPeGtXGxnLgBY2doJAyD1dkoFulIpNE7iDwlLrOyZF8sI/t6T+?=
 =?us-ascii?Q?FCinKtKjGwCgwokHB5kC0l9x1NQaAJjqWgWcxK9CfAiIFlz1TTw8+suVu4yh?=
 =?us-ascii?Q?4fV4CzxMliydDIR+0RBw0lq/GJeVJSk/KypFL2BvoN8hSzQOehaFdMAG9hvZ?=
 =?us-ascii?Q?omonlDAFKJOsI3UZUbiEowgwQqnMf3LhEFqOxwoBGaTevewfxtfMn9drLrUc?=
 =?us-ascii?Q?27TENKAC1pvM3gdax1dEK429Ri0oC998mvtLd+YdfX5VcGAls/vq9h03FW5i?=
 =?us-ascii?Q?IB4FlMqnKjQ4dcHEkkqhpHEqh9xdl6QY6L4hV/kAb0n8QrOCTYZudbfquGeq?=
 =?us-ascii?Q?C6AnZRYFtqptRPISBVPYtGu3GdPTvQ4UM4VwifjRQPiqbTw+tRFY5DnuEEJ1?=
 =?us-ascii?Q?mnzGr4t0ISSG42d09el4w8qaOfjuWvp1Bi3KAOj6RMLKDaTeuk43rWW8VVK2?=
 =?us-ascii?Q?cH69cycJxd5NKIUg9gB1KBIyaytqHAlJAEyf6ICdq4gNv6SRySCLKdHEkdcY?=
 =?us-ascii?Q?UiNPXp/W/zw6EgI3FPRG7Xf58Ez7hol769QryfYwXMjNuxyc58o8TTGuzYZp?=
 =?us-ascii?Q?cq9tfpzJqGpBufRmbyknkJk+Ktoe2EkciNkFJATdPja6mMpy69pnr+4W/33Q?=
 =?us-ascii?Q?B+wTZNkgSFU7sEewhI5R0AkdG4GnvYfORFxj5nrXaRrBLg7Q9kT9I9LtzYgz?=
 =?us-ascii?Q?PHKACuwlC8LUaR6wpRJmZfjg66DxWinjNESUCnm3DATuczWUOJnVFHztc63T?=
 =?us-ascii?Q?LXjPz8gi1UFZ7mV1Y6IB88euDdpyUcvAYWLfUU/N8UWaB9oGEfO0+ik2In4b?=
 =?us-ascii?Q?D0nz6mt/9FNVZsH8mKtDITy6npTeApYS10nagmff+R9JNrTwr8WorwrIM7nE?=
 =?us-ascii?Q?UUVaJog57omtf34zS7tzzP1+6Ha+HTgTH9NaXAcE5Nnupx1iz2omSbqzmU6F?=
 =?us-ascii?Q?C6jo6lNKVDqIx2gKkdTHt4wspcYYhGRFdGo54lg570Dg77ObpDX1Any1EUCW?=
 =?us-ascii?Q?BXFv8oNRIzrlTpYrJGnaoWuEDQH03gB6qBFo59lBJ9OaXn/QpKgYmxrzuhiV?=
 =?us-ascii?Q?5Svt75LdpjOKOJfao2lANpDAxRo1zXiq48w9N0EI3cIBuRtKgWZGsWnm7gA7?=
 =?us-ascii?Q?jlyNqBmRtVFqUTwneITprfN7YGkGUxUaen5XsvolWWICq7q4qbgjjE4A9Jtl?=
 =?us-ascii?Q?rXhbKogvCNMoYI6Y7ZcVSYQBG1sS9fDP87I7t8SVK4vKEp74N/9yplGCLoiR?=
 =?us-ascii?Q?+/gqbh47C8pGhChOZwBvQnYGBZ/WkoViMKsD2JjYOPkf5GJybYWPGw9L6c22?=
 =?us-ascii?Q?taTAsrCL+LJJWhJxhs0Vc8wQTvOU5j5CdC/0Q57pSHTUfN0o9FNDGh/UyFMo?=
 =?us-ascii?Q?LEiXEaAckBlKDvh7Yj4Thj/lqjjVX7Jr350ClxDA+ayNGZa8N+8M6nlCpDZP?=
 =?us-ascii?Q?UEd11G78Uu+Iw48APiJAqJD0qFkRQg1u8mTk4L6Au5zjsiferbuZxzOev2IF?=
 =?us-ascii?Q?ywvDpn9fDJrjc9kZWvghtnMdaP1lE6LIfSKqVbepRtjgOLncZ3mwOvNDkyrI?=
 =?us-ascii?Q?s6Y9O4bNDIIz8fn+0lqQZclAkk/seuGqq6QZFm7Til8cD6vH3MtVDUJilM+A?=
 =?us-ascii?Q?fFpyKK7e4bXLb3oulrCRr02ypm8o0GU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9042f7e0-994b-4322-362d-08dee29baf4d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:42.3502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUrsDlyGSD/Xluqf7sFBryFFSvrsTOMI4RfjijX8FlGjKc3xIr8tZgLk3PqNWoTla+HLKTLtWMqeQ9ww+nlsQN9EVXqvgJdwwHZZlULfl0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110555_908492_BDB90792 
X-CRM114-Status: GOOD (  10.24  )
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

Allocating vmalloc and percpu needs to populate kasan shadow area page
table, needs to sync up to percpu page table.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/mm/kasan_init.c | 45 ++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 3fcad956fdf7..960020343760 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -60,13 +60,14 @@ static phys_addr_t __init kasan_alloc_raw_page(int node)
 }
 
 static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
-				      bool early)
+				      bool early, pgtbl_mod_mask *mask)
 {
 	if (pmd_none(READ_ONCE(*pmdp))) {
 		phys_addr_t pte_phys = early ?
 				__pa_symbol(kasan_early_shadow_pte)
 					: kasan_alloc_zeroed_page(node);
 		__pmd_populate(pmdp, pte_phys, PMD_TYPE_TABLE);
+		*mask |= PGTBL_PMD_MODIFIED;
 	}
 
 	return early ? pte_offset_kimg(pmdp, addr)
@@ -74,49 +75,53 @@ static pte_t *__init kasan_pte_offset(pmd_t *pmdp, unsigned long addr, int node,
 }
 
 static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr, int node,
-				      bool early)
+				      bool early, pgtbl_mod_mask *mask)
 {
 	if (pud_none(READ_ONCE(*pudp))) {
 		phys_addr_t pmd_phys = early ?
 				__pa_symbol(kasan_early_shadow_pmd)
 					: kasan_alloc_zeroed_page(node);
 		__pud_populate(pudp, pmd_phys, PUD_TYPE_TABLE);
+		*mask |= PGTBL_PUD_MODIFIED;
 	}
 
 	return early ? pmd_offset_kimg(pudp, addr) : pmd_offset(pudp, addr);
 }
 
 static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr, int node,
-				      bool early)
+				      bool early, pgtbl_mod_mask *mask)
 {
 	if (p4d_none(READ_ONCE(*p4dp))) {
 		phys_addr_t pud_phys = early ?
 				__pa_symbol(kasan_early_shadow_pud)
 					: kasan_alloc_zeroed_page(node);
 		__p4d_populate(p4dp, pud_phys, P4D_TYPE_TABLE);
+		*mask |= PGTBL_P4D_MODIFIED;
 	}
 
 	return early ? pud_offset_kimg(p4dp, addr) : pud_offset(p4dp, addr);
 }
 
 static p4d_t *__init kasan_p4d_offset(pgd_t *pgdp, unsigned long addr, int node,
-				      bool early)
+				      bool early, pgtbl_mod_mask *mask)
 {
 	if (pgd_none(READ_ONCE(*pgdp))) {
 		phys_addr_t p4d_phys = early ?
 				__pa_symbol(kasan_early_shadow_p4d)
 					: kasan_alloc_zeroed_page(node);
 		__pgd_populate(pgdp, p4d_phys, PGD_TYPE_TABLE);
+		*mask |= PGTBL_PGD_MODIFIED;
 	}
 
 	return early ? p4d_offset_kimg(pgdp, addr) : p4d_offset(pgdp, addr);
 }
 
 static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
-				      unsigned long end, int node, bool early)
+				      unsigned long end, int node, bool early,
+				      pgtbl_mod_mask *mask)
 {
 	unsigned long next;
-	pte_t *ptep = kasan_pte_offset(pmdp, addr, node, early);
+	pte_t *ptep = kasan_pte_offset(pmdp, addr, node, early, mask);
 
 	do {
 		phys_addr_t page_phys = early ?
@@ -130,38 +135,41 @@ static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
 }
 
 static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
-				      unsigned long end, int node, bool early)
+				      unsigned long end, int node, bool early,
+				      pgtbl_mod_mask *mask)
 {
 	unsigned long next;
-	pmd_t *pmdp = kasan_pmd_offset(pudp, addr, node, early);
+	pmd_t *pmdp = kasan_pmd_offset(pudp, addr, node, early, mask);
 
 	do {
 		next = pmd_addr_end(addr, end);
-		kasan_pte_populate(pmdp, addr, next, node, early);
+		kasan_pte_populate(pmdp, addr, next, node, early, mask);
 	} while (pmdp++, addr = next, addr != end && pmd_none(READ_ONCE(*pmdp)));
 }
 
 static void __init kasan_pud_populate(p4d_t *p4dp, unsigned long addr,
-				      unsigned long end, int node, bool early)
+				      unsigned long end, int node, bool early,
+				      pgtbl_mod_mask *mask)
 {
 	unsigned long next;
-	pud_t *pudp = kasan_pud_offset(p4dp, addr, node, early);
+	pud_t *pudp = kasan_pud_offset(p4dp, addr, node, early, mask);
 
 	do {
 		next = pud_addr_end(addr, end);
-		kasan_pmd_populate(pudp, addr, next, node, early);
+		kasan_pmd_populate(pudp, addr, next, node, early, mask);
 	} while (pudp++, addr = next, addr != end && pud_none(READ_ONCE(*pudp)));
 }
 
 static void __init kasan_p4d_populate(pgd_t *pgdp, unsigned long addr,
-				      unsigned long end, int node, bool early)
+				      unsigned long end, int node, bool early,
+				      pgtbl_mod_mask *mask)
 {
 	unsigned long next;
-	p4d_t *p4dp = kasan_p4d_offset(pgdp, addr, node, early);
+	p4d_t *p4dp = kasan_p4d_offset(pgdp, addr, node, early, mask);
 
 	do {
 		next = p4d_addr_end(addr, end);
-		kasan_pud_populate(p4dp, addr, next, node, early);
+		kasan_pud_populate(p4dp, addr, next, node, early, mask);
 	} while (p4dp++, addr = next, addr != end && p4d_none(READ_ONCE(*p4dp)));
 }
 
@@ -170,12 +178,17 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
 {
 	unsigned long next;
 	pgd_t *pgdp;
+	pgtbl_mod_mask mask = 0;
+	unsigned long start = addr;
 
 	pgdp = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-		kasan_p4d_populate(pgdp, addr, next, node, early);
+		kasan_p4d_populate(pgdp, addr, next, node, early, &mask);
 	} while (pgdp++, addr = next, addr != end);
+
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+		arch_sync_kernel_mappings(start, end);
 }
 
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS > 4
-- 
2.47.0


