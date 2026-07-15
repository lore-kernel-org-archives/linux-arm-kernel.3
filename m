Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D8CC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYTcMpCGQoeSA3WN+ofCp+QWfkKB14/vhiJiLjROXnY=; b=i8z0qjhRSMWIXEe9qa2/cewIfj
	e+eGBcw+r7bKdsD+Te6Kvr8v5XKyYuH1XgtbeBXabr9CDVJSo/7KbSvaPoeeBfSohAxokgE8f4WTf
	f3zc+vsRPFDxOfFAdPBe9C1QaSbno/+qcJdMVYVbqMA/axQmNPhlVkdD5mZfz7TJGj/iSv6A7TywV
	eICvX7Megj0PM5DgobAPlQ6MmOZDxJ85G38Q2MaaJmSqhduHfSrFNhWNhBfG3O/VCtRI5cbqHfsmC
	8nWQMAmscDpZosSiCt1vuv6tkzu0DLrfvbRlEWq2A/CGXCq19oPmh4rLPpknJ9DEdV1SG8g34RQbv
	EpvKfRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zU-0000000FcLl-21zJ;
	Wed, 15 Jul 2026 18:05:52 +0000
Received: from mail-centralusazon11020137.outbound.protection.outlook.com ([52.101.61.137] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3zQ-0000000FcHk-2TuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkElIBLjHASkj+5/YAZEuXsjKxuIYebaJ5aGViP7phFHNNAOqxBmvuD/hr3uQZivCwdazu+DL0kekaCjyZ+vXOA7dpoPgu9OyY+b2o6Y3208+cU129MBnKZfQq/Gth/bwX9tTu2IvCIsZp/VyNRcNsA8T82ff2KEYR8RCWE11H/Io4sSHh0ihiBQMO7YSvS6Fvsgjjf6rqv4C/4xVbpVmw97svHtcluF26veStbUJ6tXS4sVs0EFQLDZGbikj5Dj27P6wsn0T8DCI2hwEjdp4wRTMyYaETVSVM+ooLwJU+/gdMw02vDnMWeYpDTLUKcqw+zmmHpiiF+/z7LPDM7JMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYTcMpCGQoeSA3WN+ofCp+QWfkKB14/vhiJiLjROXnY=;
 b=USDGh2a0lHWqlqT0pb/oklHX0O5H/O5YQ1FB9snbLsdTiec33/r2bBiXV6Z4H7wbv/QV5mzUJvBa8cGlL/CNnWkBNgp51VsBEMQjrRK9tj9qDjeEAdiRArpvl+KBOZ8oxUs+pi1M/LsiHJXtRHHUO7NCs5859eCvahy3QLoZ4Me97UXxskp10r8ZNiUZcFothwFhufkK/rQIXrxv4DHFWh18AGGh+HmrJw9JlNMDbLahaH8h7l4Akxr0F9j5FdiqHZA44Bo6ilbdP1VgtPsB2/ncEcmM2BK/YPuvs2WUn45doxuGxwY3X3Azz2ZMoXvpCkiHVh/5nAzkTVL2StwcmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYTcMpCGQoeSA3WN+ofCp+QWfkKB14/vhiJiLjROXnY=;
 b=O+do1APelCiCAtIxgiNIxncFn5VXBVt9v88/DXjg8BOrBOxzFAdeZ6OojBQ3Kc4t1Ky+EXfN+bqVlTocJ0/w2pyc/2ddzLdF5ItB4oAvgOyQOCMhYY/3v3FnywgUAD44SDsHmXTVH4vKB4nq535r8TbkmxWqD8FSol9qToP3WkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ0PR01MB6207.prod.exchangelabs.com (2603:10b6:a03:29d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.12; Wed, 15 Jul 2026 18:05:35 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 18:05:35 +0000
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
Subject: [PATCH 03/16] mm: pgalloc: introduce {pud|pmd}_populate_sync()
Date: Wed, 15 Jul 2026 11:04:05 -0700
Message-ID: <20260715180455.515692-4-yang@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ0PR01MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea69a7a-9e2b-4f2b-2cd1-08dee29bab6b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|6133799003|55112099003|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: 2CvRLLDnfiUaGJoNy34blsDEsf5Ib3yBY1e+lF1cwU4OnMT+ybVtBVa2da+ZrwuozG4ZuFShZNigIsuzIvl04leg8vGd5VxzkWa6otxcf2t37gE8ZfNT1SYk5aUSevap39KuoEQrAlL41PUXFasbY6aB4Dki14WObyRqOm7Ajh46ejAerLLWwCkKeJf1xYzFJM3kYGD8agLERQqdLd1IhPtgMrlw/ChdVTZJJMDsbBMqTEPJfxLK2XFrgmPOjAvuHDcpY0Re2hSBn5kLIEJwsfx+zuKrIuIJhhEt4IH5tBwVPHwI1b/LQF1urSasPTnhpseUILi+uqO5Sm8sRGQLkkTBaHEgzwh23vQuaYMhXIP0kxTV0yjZPAoIVWDN+flRr7Y56IwsLEQlIemS52G+50Bm2iKYWm7V9FN32hyi1I1wO/+VB6Mkzc9c4IT0HBE06QlcK8yOZCAx40E5wr+WAHGOJ1CDBRHIu8C1xIu+CpVoB6F/esWMIt+BW6JaPZ6w43XZq4UnC9NRWN/AZezudHO/x+vbyZd8yXLm5sjZSa+qvsrYl95QN6ArjQlgBmVxiF5JUxrBwW92HSQ5ctI9RVZ5ZhtXSTHVKs7TDc+rKo9s3uz5hkxg4YRI39TOs10gt/IsfBTuiwbfnOzJ50+zXzo05mcR1UyrveVHbjSVW+sekqVdHaP8bdWjnHK2gd0s3jbHXbKEPtRGUC4zSCohjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(55112099003)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FuR6of1q8nRdY/8D8xglkaqxPgVrZNimEfm0hx99Fa2w8BmdnmiaCz1zY6aq?=
 =?us-ascii?Q?uXJG73PljwoqHzXwDwiNlW95XHKx3n7jtVbU9HyE/LmD5boVqBNnHGZ6JJj+?=
 =?us-ascii?Q?yS9kn9R4gziQTfvVtcdsRtMMr3vvSJSvH1zLMkgpOZHUCT9aY2Hol20ZqWtF?=
 =?us-ascii?Q?zl63oftFQnpSXNIJ4m+VG+BCzOPf7QUmqBTllUu/qFSb/LqvKkr+D0oFz+zn?=
 =?us-ascii?Q?FD+/BOkBDPCwBR3EFSvb3A/L36Zm3XhmGENsM+Sd/wcQ28XiEOFk3l1omGOU?=
 =?us-ascii?Q?27zxcX/qzDlEifwPMKiAe0mK6N2qxNdJykizW0j96eEKCQBp7jtR5FQdXi9l?=
 =?us-ascii?Q?PHiO4eIapky6AtE5ooqSEUTyyke0Oq/rgXfEl8h3EJxy0uuBkG5jvuQhVToq?=
 =?us-ascii?Q?01L912kjLfYFVnqk/mX27cxkRorShPzX/om3V4HKNPtO6xXvjX16vcnKUB+Y?=
 =?us-ascii?Q?7elQGD/UqtyDHgLE8JsHfdF5SgmhW1AP8d8EPTG4OWIREF9tZ1Nu2Xd0U5mZ?=
 =?us-ascii?Q?e4pePN+/qxHqnTwclRB5VZaUEwkqvC2OU7RGaHFwIDNka5p009EmycVaodgn?=
 =?us-ascii?Q?QnVoUh9sU4+hkZ2r8wV99zcbNtXoP1KTD2QASQUB6rMs6BuOC3hK6Xb/vq4y?=
 =?us-ascii?Q?F1HDRG4gT6iz2vH9PZVqQCFBmV/0XtUr5u/TUiqcvVSlnk/eIDP/saeDknv+?=
 =?us-ascii?Q?qPeYh49OB35vBOCBRlwWT78ox//rrN1GchEBO1MOjggA45UY4tdh3Dp28Bzt?=
 =?us-ascii?Q?CdFXE6t0yimAjdeOmnOIn2O6Ur9qybHPQKo4byHts6FlS0gLytwS6/h5MKeo?=
 =?us-ascii?Q?P5jyb2l/FtcbxfoDRiCckw347j0lpzGC6+rNzz2ov5I4erDan25GYXWIzBSg?=
 =?us-ascii?Q?zbrpiyGxAz4Jpl0nUmG63vcqkgiG/Rv82JvAOW05Ta785qZSFdy3YNwzTEvS?=
 =?us-ascii?Q?3OsU3wFtzRID4JZ9+/WpLhhdD0OkxGR68wldW6aHz425/TNHMU0pKkFesEPR?=
 =?us-ascii?Q?Y5QFVaq2evgbksdh5NY2JW8rlEMcZfphlTZH5XehkGYdBMqqbcmwsgHw/RhK?=
 =?us-ascii?Q?HECc92xpTh9QUJKtidoVXoNoGp6bD22y93abSTzE7qSIgzyIKKM47mArA4Io?=
 =?us-ascii?Q?Pi35YEcmQi2nEyB9PJDkSH3PNET7oprrEWp9LSowW9JNYhUaagYr8AQ9Isuk?=
 =?us-ascii?Q?x8lcyR47/hWtyNZCij5yVXAAbZdoY98NGwJj7aFz8CTPoo4azmi+2Jk3GUyf?=
 =?us-ascii?Q?eDhFRyzO56Yay7QELeRd6iiw6dQ1tmrqduYYnfEErBV9RUHUNDXsSzwZbdxe?=
 =?us-ascii?Q?ZiFKmTiFQVM0WKTLlUIkTp0H3O1X/HTGOuUos0LE3kBB0S5W1Iw02VeO3xLR?=
 =?us-ascii?Q?fXdMJsBnwUL5b6nlKW+RVk2nXu8q7yQl5O9JW3P3IxPGs/NvwqGSyta40Gle?=
 =?us-ascii?Q?MsIJW9hwd6BsTNWlef9o5QvqU6PtT3djmmRnsoGqhNUhUYnNtZ0pwdsgsmpl?=
 =?us-ascii?Q?Djw7Et59b7CugF+7LEuJ3+7t42XndZrKd8Gqud0e34/QctX6aB3MFBSh60cP?=
 =?us-ascii?Q?RdT1ylPdQQq1ccXtlVZCWoeRIhAsVWhmzdnMT1PHPCRM3UEh8/1HBCE+vkVo?=
 =?us-ascii?Q?6ExBoxSzT7fpaB6phi4SIVt1FudbNZNqT2acRvOpPtlBBlnJdGCGbC/LiU6G?=
 =?us-ascii?Q?ehAEN6JRFPiioXUW/6PZ41dBQ7ojmJIWrElHbHqzy86Af1JjC6CH+nkBwrsU?=
 =?us-ascii?Q?WSMXi10azIld3Avog9OUwMp4tjiZ7dk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea69a7a-9e2b-4f2b-2cd1-08dee29bab6b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:05:35.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXOCk4yw0TTs918881rn5PTWrj8ZmfcPqacrEoxJOXsmxWWS2R81d+mKXmf54pqv2+j0S2hQ5at2hFCmeiI75l4B1JMp0aMM2t1pbrNCs+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_110548_666316_2A353FD3 
X-CRM114-Status: GOOD (  13.96  )
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

pud_populate() and pmd_populate_kernel() are called by percpu and
vmemmap to populate PUD and PMD.  They need to sync up kernel page table
when percpu page table support for ARM64 is added in the later patch.
So introduce {pud|pmd}_populate_sync() and protect them with
ARCH_HAS_{PUD|PMD}_POPULATE_SYNC kernel configs.  ARM64 specific
implementation will be defined in the later patch.

We can change pud_populate() and pmd_populate_kernel() to take address
as a new parameter, but this change is needed for all architectures and
not all callsites of them need sync page table.  So introducing new APIs
for this usecase seems much more simple.

This is a preparation patch, no functional change.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 include/linux/pgalloc.h | 13 +++++++++++++
 mm/Kconfig              |  6 ++++++
 mm/percpu.c             |  4 ++--
 mm/sparse-vmemmap.c     |  4 ++--
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgalloc.h b/include/linux/pgalloc.h
index 9174fa59bbc5..062c64a5d4bd 100644
--- a/include/linux/pgalloc.h
+++ b/include/linux/pgalloc.h
@@ -26,4 +26,17 @@
 			arch_sync_kernel_mappings(addr, addr);		\
 	} while (0)
 
+#ifndef CONFIG_ARCH_HAS_PUD_POPULATE_SYNC
+#define pud_populate_sync(addr, pud, pmd)				\
+	do {								\
+		pud_populate(&init_mm, pud, pmd);			\
+	} while (0)
+#endif
+
+#ifndef CONFIG_ARCH_HAS_PMD_POPULATE_SYNC
+#define pmd_populate_sync(addr, pmd, pte)				\
+	do {								\
+		pmd_populate_kernel(&init_mm, pmd, pte);		\
+	} while (0)
+#endif
 #endif /* _LINUX_PGALLOC_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index 9e0ca4824905..13ea4b29ee7b 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1509,6 +1509,12 @@ config LAZY_MMU_MODE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config ARCH_HAS_PMD_POPULATE_SYNC
+	bool
+
+config ARCH_HAS_PUD_POPULATE_SYNC
+	bool
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/percpu.c b/mm/percpu.c
index b0676b8054ed..45c30c6531c5 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3163,7 +3163,7 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
 	pud = pud_offset(p4d, addr);
 	if (pud_none(*pud)) {
 		pmd = memblock_alloc_or_panic(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
-		pud_populate(&init_mm, pud, pmd);
+		pud_populate_sync(addr, pud, pmd);
 	}
 
 	pmd = pmd_offset(pud, addr);
@@ -3171,7 +3171,7 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
 		pte_t *new;
 
 		new = memblock_alloc_or_panic(PTE_TABLE_SIZE, PTE_TABLE_SIZE);
-		pmd_populate_kernel(&init_mm, pmd, new);
+		pmd_populate_sync(addr, pmd, new);
 	}
 
 	return;
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 99e2be39671b..463c2f8b611c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -198,7 +198,7 @@ static pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, in
 		if (!p)
 			return NULL;
 		kernel_pte_init(p);
-		pmd_populate_kernel(&init_mm, pmd, p);
+		pmd_populate_sync(addr, pmd, p);
 	}
 	return pmd;
 }
@@ -211,7 +211,7 @@ static pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, in
 		if (!p)
 			return NULL;
 		pmd_init(p);
-		pud_populate(&init_mm, pud, p);
+		pud_populate_sync(addr, pud, p);
 	}
 	return pud;
 }
-- 
2.47.0


