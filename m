Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36D9CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 03:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YJTAilE2fB1kc1oS1JGj9wJtbBZ1hQGbx2PG9bp1uY4=; b=Xh6U7Hf9JDNrbK4y+EGEYtr0b2
	XYU+q1K3XXPsLvL5IXQw4vlErKR3vCnyJHFoFMmq7sHgwab2IPeqILVvLQw8qZ6V89QBlHiD9csqn
	N44u3kiF57mrpwo69OD4YVeKHqEZ5R7gcipgcjP+k+YZz2mgev20cJleUZBbnGhFJa44BTamOrSPW
	Zr9Jjlari8tcPuCXycuRudxZsqXpVrJa95hpLCWpqFYtr9PS47sHyZQjekw8djjo3QFsLxvpYpJgl
	tpe7S/yj/6cj35T6dPvfuM2+w25LkwxU4Pq3fDke1Cz0YXD8+rmdP40M/ETIA8f0RKf06R0FewN3T
	F4RG+5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPu4c-00000006Xg1-18Mp;
	Thu, 21 May 2026 03:27:50 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPu4Z-00000006XfQ-43An
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 03:27:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rt+x/9AuU96PVAuPORT1HEvDghzGHpEsOoRc0SXK+1g8fWw+rfrh5W254rVaHmdNAKlx2dBk3Mj7P1gwSMJ9XOzolvlUs0D7n7vgYNYR5TdxQwt6JIOuyNB/tRZnxPTz57BC+FkT8utyV3wUvfukazo1f4z5potlDFWmkLsOCTn+bKC3sD79o0IEiuLUOK/iqKwfTdOTetfyWR3mNIHrS9aC6Od9yaVoKO8gC29peEMxWav9r6x3qGn+X3YIuLIrwyHUzghSK3xAcf7EPmKd1BVzlYcDWgCBSSKbucOq0sv5NMo4PITdgp5NiBnX7vOcokJgl4TLMsRiib20dYmVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJTAilE2fB1kc1oS1JGj9wJtbBZ1hQGbx2PG9bp1uY4=;
 b=CkYclm/3tofjjNtBCm2yECo2hjodT/Ggyf8pfjc6UCL970GG7OhcRy1+rdxqGGZicLUtMr6hwySdksejqqxB/MkdRq+nvbRhwxhQ/8rpKAiFvATXhEdVNucxMmOlr7zWPoxiZXZW74ksmkTfmAhzP787eD3iVcJE2RwOwWat2WXcWm5nv7deb575j93qUJjclmrgRhNO9qURLXhjQTbUTtoelyGff4XMwkmTe150XV5SWHeX6l0xqAPVm0d7ZTzT/wHUlI91SDkmqAllyis6OepnCRWAeWmDyNwtSitWxVxbJKnINsWTabeND+QGRZ05HiXM7+4nOM1Y1cqg3Qm89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJTAilE2fB1kc1oS1JGj9wJtbBZ1hQGbx2PG9bp1uY4=;
 b=TRY9gffrRGiIfLtOm25MMdTYufE2RsPZk4GTdLk7sjBpSOl1z5UxNeRHZssuui9Amu/KnGuyYhPh4c7nQ5PwjuDUOB1mf4FY35hwPjRg+UN2J140RK2aKkNQe6QjbSQ8WtE8uTH4LoBKpgy5lad7DWKIGdIM82+OmDPyPiKPomW3Nc7H7zokwr2WAlvxCaev78xRg6uvBXB/NBUX15q/Ie3qz5F6PbP+Y+wo8K/bKPZf1mT8tCskTmOUEwcl0DmDIMBmBmhnQEMS/c0yxDcn4G7OcVzdqTXV5SYDrAGDLQQyJVR7kZjS+X03zlu9vysRU2hiuu81L0auQsKxDAsTsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN0PR12MB6103.namprd12.prod.outlook.com (2603:10b6:208:3c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 03:27:39 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::5807:8e24:69b0:f6c0%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 03:27:39 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed page tables
Date: Thu, 21 May 2026 13:27:30 +1000
Message-ID: <20260521032730.2104017-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0008.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN0PR12MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb3ecaf-7b73-4ecc-d1c7-08deb6e8e91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: kIEI31PTZ5OB/Kw9+B+J5U5IJ3vJLMoaXXgtc0aystrM7zF6NZ/RZz5hfGJuClhzRuLzcC2hgWnTI500YY7K2Q7Bc3IJ3CNfiyjZSdH3lK++TZy29Xc8I/sZ2fZiBLuB8TnFic61egx7eKoZdAlwknK66eqRYH60T82FyjMEO9YpyAGvaNDtPLshMJRWPq+YlWl9Z+6QneuyKdG1mqcMkD63pMtR24i44sevtBKcYoeErvoisde5AoBLb3jG7H+FLtF4SQU0zi/7Ce1RtQXnvm0dD3g2dDiCBw+1kfGG2pbLw/nMHvjHfJhQgHMqv7u31UxEF29huws85FRXX9Vri1j3gRqADdE4mW1YpJsLeE21t+xia5snqnV9TH/ix/bIAs+NJPewHLjCip+9tIXgqUSMK8Y3SOUSaE3KwwgIaMC7P2V/IQOlff3JWHdNNSPBF5TcWE4SOUzvPg5pwgEIRcwypUlI2BIt7u+4xL+H3/GGNk9axlHM39YAYZdHBOohT+S8d+SMO2PIUZhjQJNjb+hZIwC2KsjIbZV6FoKoKzXIDsbfiLTfs2qpDkCSGyvhFcM/u2MW2H/1sjy+eSMC10CHT69z5Auz1OdI1A0TzbaBTykI0xJM5munIGRJMMmSsf+SiLgcQ9CqeRlsz/2HDaS5WmQvvnMMkyQjauNojRQ17ezxfBHXRoVwmfzKLWep
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cMeI+wTpj0/TKMSZzGmCEOkmR7e3r0onWsZnMXCFGdtzpAVbwY+vkntfNZpq?=
 =?us-ascii?Q?qUNal4loETbpqqMgYobsI790qfbuCEB6hf/OOxix6qHkvNe1nYDkpN4dhJPq?=
 =?us-ascii?Q?2IHk3Bw3ciSjGAxOQj53LJEoDxgd+pK8GBqEHYlPstGq4OTWcY1eDIy1QGhK?=
 =?us-ascii?Q?cmB6Sb3C4V6luzIGKA6J2vT1zu3naosE08f19uAV/hDsRGSqEFaZhDPGoKeM?=
 =?us-ascii?Q?sRCBn34INhtlYl2I+kFEQwixs1vkqXok0x51hUqWUJp/EAj33jFIeJMVyZNX?=
 =?us-ascii?Q?Vs5GS8lkOF4wccickF5gEdJs6AD2mkcUXKOGgMyfQbB1q1FJX6NWJWJbgBZD?=
 =?us-ascii?Q?TMDuqqBAS5V4VHhGdRX7hYTPCyBRn3Z0iBeGbhnBpbJi4V5AQDHYX+j59BdD?=
 =?us-ascii?Q?pEPbgkqj/kErBHctU0Us9QlqG90HTqgUWytZAZdkB7bqIeaKnJxocLgaumj/?=
 =?us-ascii?Q?WGM+F2t1w7vdPgpvjBX76gzF3Bf0qyeVrSRCn+sW69t4rxIIPhb1VHgSmm40?=
 =?us-ascii?Q?ONjpxhTNMoZqpXsEnHcM3IUr21QiX5Ukqg4s6b9dXYNw8AShCfFY/IPuJBpM?=
 =?us-ascii?Q?CDPoiRxbXe3ryNW0UJinxePZZ8J8Ax6DdaGjm1dEaJkP4N5aoBLn8TVkaiju?=
 =?us-ascii?Q?PbJ2W9zgeZF9A5doax8QpLdD/CvZtf1/GKmrEJ9O2rLDoCO3n/7CHnq1EoLZ?=
 =?us-ascii?Q?WOwab6SE0GopGHYbhkVGOH5NUm6lKuPGRpl1sjUMVv+p/u1tH4Kuy2yhiniG?=
 =?us-ascii?Q?OW2TreDzT8ryy+3qUftiMXqliIRBnVxmIGGDPaVnPadULZ61QwbNZ+Lpe+lW?=
 =?us-ascii?Q?zc2HXPkUGROBJW49k8JKPNbGvkRNKOsjSKar2oH9gVP/I0fT4kedfC79AVZZ?=
 =?us-ascii?Q?fSCZegy8f3pRWGDXYjj6QDXcZm1M7TSp1DoffH6Yj6+e+ARb8Dp5ShT9iZKu?=
 =?us-ascii?Q?/R0T4ba5IXcFeSvEAFqT6h7U8lH5qub6ttrO4sn2tvIqw5DOIMf+Rm0cyl8V?=
 =?us-ascii?Q?YcIZd5EIx1LTfeQRrMqzuiZhfrVZRUyrwxSl4FtLb5AQJjD9NG3nXmeE+DU3?=
 =?us-ascii?Q?sqLSEQ5/jNqYWMycPJZoq72rJ4WmyeAq/FGZMeTlG5Iofy0gEAJ4u2iFgR5v?=
 =?us-ascii?Q?Fafv9LwRcb5IDrhfBVslqp8v4EDhUHTH+eOU8b2Hjzy5AbVb83V+UiyeJs5y?=
 =?us-ascii?Q?A23An7nk1Xicc0qTw7TnB+yOeVwQrkW5oFxl7gxVDWm59IaRNQkndVAutaaU?=
 =?us-ascii?Q?J3UROoANTY+OjVjvfRjNezeEEU+ixEF6TmHB96KeWXwlrVYehPDVx26Jj3J4?=
 =?us-ascii?Q?hCJ6xodsK0JODcEdnmqBUav1BktsQQUQSAjNG++6OW/pgEN7zZ5kyCP55pbM?=
 =?us-ascii?Q?/3ROs+gMJggkTv1C+Bb/vCNSWJBQvAbl4JmjCnlTdD2u5w9Rkeo0660Gsm/u?=
 =?us-ascii?Q?G+K93+EkZsY+p0Ske0VSplCnTt62o+SImjk2Mt5X4sOBFMUkfCl7wusuyS3W?=
 =?us-ascii?Q?HgYXl+HtqAjNwMnQK1kz2wUbcsbz4ADf9b8APlwsg1BrSiiY9Lyx6XdRFACe?=
 =?us-ascii?Q?MqgGHs8bgrHuhQ5sr4495jYqLh9ejRK7q7v9DhlHceFVfa79VIbZVot+Ff0R?=
 =?us-ascii?Q?1X+ol+J8AcXeeb26LLWOwxos7A+6glKbugvn7lo7nvGCi3XyaUVjQSvmnHAF?=
 =?us-ascii?Q?j7pVzuLZCyRZWSnD64bXcGcOEoCe+C+uCfQUpdniKRiO3hXNV9hvZHOs8NwE?=
 =?us-ascii?Q?i+7RzVJqMw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb3ecaf-7b73-4ecc-d1c7-08deb6e8e91d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 03:27:39.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+KhjXA2tfoYW+57ZJYmGuDFjkLA8106tQvOIz3U7S7HnRyaM4WUorNcMQM96+9ZXNkW3PHxN7XADkrgadIJWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_202748_011469_6F503F46 
X-CRM114-Status: UNSURE (   9.95  )
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

Since 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in
__create_pgd_mapping()") page-table allocation on ARM64 always
calls pagetable_{pte,pmd,pud,p4d}_ctor(). This sets the page_type
to PGTY_table, increments NR_PAGETABLE and possible allocates a PTL.
However the matching pagetable_dtor() calls were never added.

With DEBUG_VM enabled on kernel versions prior to v6.17 without
2dfcd1608f3a9 ("mm/page_alloc: let page freeing clear any set page
type") this leads to the following warning when freeing these pages due
to page->page_type sharing page->_mapcount:

  BUG: Bad page state in process ... pfn:284fbb
  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x284fbb
  flags: 0x17fffc000000000(node=0|zone=2|lastcpupid=0x1ffff)
  page_type: f2(table)
  page dumped because: nonzero mapcount
  Call trace:
   bad_page+0x13c/0x160
   __free_frozen_pages+0x6cc/0x860
   ___free_pages+0xf4/0x180
   free_pages+0x54/0x80
   free_hotplug_page_range.part.0+0x58/0x90
   free_empty_tables+0x438/0x500
   __remove_pgd_mapping.constprop.0+0x60/0xa8
   arch_remove_memory+0x48/0x80
   try_remove_memory+0x158/0x1d8
   offline_and_remove_memory+0x138/0x180

It can also lead to leaking the ptl allocation if ALLOC_SPLIT_PTLOCKS
is defined and incorrect NR_PAGETABLE stats. Fix this by calling
pagetable_dtor() in free_hotplug_pgtable_page() prior to freeing the
page to undo the effects of calling pagetable_*_ctor().

Fixes: 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in __create_pgd_mapping()")
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 arch/arm64/mm/mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8e1d80a7033e..0c24fe650e95 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1422,6 +1422,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
+	pagetable_dtor(page_ptdesc(page));
 	free_hotplug_page_range(page, PAGE_SIZE, NULL);
 }
 
-- 
2.54.0


