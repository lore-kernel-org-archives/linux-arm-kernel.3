Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A836CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxwANWvfISDR9SeJ2keOx366IOrzRjGPz7ihy+BLo7g=; b=OUP/ZV2vx5hGbPJgjbrf1flPnN
	La19eeMmttutJxL7DmPs79kp4aIDh/+fybBn82klwEkCV1FPXsZM8idLRJ3MopaENLJm5dZLYh3nu
	rai2uG/NOjaI195WXUASKXl9BX+XkTaT3K0OLrUzXeYmr218XY8x0pJ5OZfIZs6X/mLhBzaS1zxA5
	Orn7oEgjaLvGGvkkUh45e/TDfpbhU98MbP7yIDLre7lTxGyw8cIaJgMJdBLjp5wmKCnC47nZNewBw
	t3eQvxSaTmuFYPqpo3ho/femiYGhwfmGJhXYPPsV1HR9bLr0y2A2lGXDzsk+BW393cZeECJRl7+Fw
	gFFpW7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNRh-00000002FwV-0K14;
	Tue, 19 May 2026 16:37:29 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNRe-00000002FvY-2w4V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 16:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9Mcj3DXQjiCARD/jT/pFn6kV66DjAvRzLF+RFhGNXWpupmU91szh70UlVwi4pzT7//xSFiVheG/IZ8B4jJh9iFvzsU3LVlxfqMalEkDADjAePMA4vAu7iqGWO2H/IhWTWuy2Nl4bkZBHMd9MAlR3kI3EfFS8/hiXGNzN5CFOV9MJ71q0yXzRiCQ5+uyIT5YREyqnMVczrgmm84N8xyZyWKiNqy22CpJXuLNbXgGvvpldHHw9It/QycXT9So59femLaqhPNhYFdUwhnavTA5XGa5V2QIIYWN+dhScEC19+Aebt0HeboAFV3rfBBJM4GVMJgcTyyRT6VYuzDYz3iUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxwANWvfISDR9SeJ2keOx366IOrzRjGPz7ihy+BLo7g=;
 b=WkTWS9SsD1YVn2lEYorcmL/exb8VCkXdglYe4Z35cAYCzH8jBKfb1SSPNRXrTq27AdykgiuzthpLpM6bU1iUhjMHLKXO860ydp72UaVjXsLigWd+rzuVFx4w9i+IChx92jYJCplEKxZkMWdXbgFFlME2nXy1l78ssDPCQye1rbDDMfSvu9+8+daHj+edmyDYlXkSgOS7gjhwgRJiXJ8XG/UqG+NnS7OwvXjMM7dIDcykOsNbJyKM7uXV/QHOGttcDGycW2axvuxDZrXAWfD3WibKxwwHyfrPmUcGTAzxgNTKzfYk1wgseZHtXCHWh1KkmZlTk2mC6pA2n+m4L/roSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxwANWvfISDR9SeJ2keOx366IOrzRjGPz7ihy+BLo7g=;
 b=rVIbFEHuoearLHR5VMtRjYgqnXuNgWtYYLLztxYT5Wu3qXF9I2YBAJAfDv67AcRfb5CJnMEb135s0VmuwKV9/DFx5LVWU0oJQ0H948xZkbixHejUpKxILdqkL0IofFaObIULBbX1KcdVFSECq6c1BMJ0Q2bttNxJ3KAvJuaErY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA6PR01MB8806.prod.exchangelabs.com (2603:10b6:806:42a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Tue, 19 May 2026 16:37:18 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 16:37:18 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v7 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Date: Tue, 19 May 2026 09:36:57 -0700
Message-ID: <20260519163657.1259416-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0112.namprd15.prod.outlook.com
 (2603:10b6:930:7::15) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA6PR01MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 409761a8-323c-4bf0-35ff-08deb5c4e47e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: aJi9bGRLrBQALiAADLuOwSCl5uWe4HwkgMDB1eaiUdLe/Q4aCm5XTWnN28ge90+Ib4bKIW8L6JsnFIEWRA01pmH8s2cK0F69ME0Xh2iSa471Nor/JTWURqFa2EpSwDGE7SxbJ5DWi4Lwm9ngm3XkwNs3TGvTIO2Pe2XeHLxqhYSoLK//VF6qaFYfsKioLYGuKihVwwzv6/komQ40+YibhslFMKuo81DB45ok+Mm++WgLByj9gaE74c6EVFScViOJEge1nBf9NbyBwcAHraLKWwO+Hp7tV3TCf+1bcYB8UVSUq31N5JE4RgO9SnvlJn09CrIQRitvkdYJFuwivk1IWKoe9SVYVZkByWHKth9j2Vv1ZLyp9AOvNgDTXTaHHP0m5bWHbCDNEfYWz0VDz8pz1zyBYqcsTPcWx1Zpek0egq85udezlK3kQP1+JUgkeyRns4+SxgJdUT/mAfU6czOguEeuV8n3z9AljA4gSrNtrJhqXu25Avdznj5p8ADrOtJJRY5JX2ota2d5n2C4cOhH56SxK1giPWNPhXtaYg/7s17sdM6p2zZawLMnw4rf4zAoHFSWRaWMKejnlnN4GDaRNAz09EqWvWpErMg6BZDogekXMP+aXshXELGc4AXMQaaNKzo9hI8kgQ7tDNrvLDX57QZ5bjh+rT8dGIeOKMPQPBELKYCsXA+2SzET6pGfp1iU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9DTPFELE4Ko8K67bJuG03SfLTzKfWGMltiLzqjXRlsCkJF5bJwd16PyHoeyx?=
 =?us-ascii?Q?Wqv2DmC5GY+miuTdHtEUl6qJ1OkJgPli+nX+pcnwKruF9JxjUSGUIYXI46Qk?=
 =?us-ascii?Q?MQPegG81f9l1JHVaGiN+TiMzccRYvnJ9e5mKHB4Ooy5Uhas74bAD6iCg5QM0?=
 =?us-ascii?Q?dQ7BbCQRNq705PZzooejvuJQz8JRmPKUpWRjoi7Y2rETgcnXTTq0ylA9KkU1?=
 =?us-ascii?Q?0bX6eww7aZ2zr8BRYvYX3a5gdNtzQVM2knmQ+Yy/WIP8N1HSk1iRMFeogdrT?=
 =?us-ascii?Q?4QmnAijqyD5KtA695s/onQT+/yQ2QPVqWLjIh04mK093FtChqYcH3Ee6+YVi?=
 =?us-ascii?Q?IeE7TsmCJKF5Bc36J0JRgntzHIMQHLrY3YaYcmvTD4yiiybiUc/jHPofqmsU?=
 =?us-ascii?Q?HdIGmvF7GocmbKw0JhWvviU7VhT9AeWb7ZS31QcAz6frsXK+18Big9+O/fdS?=
 =?us-ascii?Q?7K41HmkvAL4XJkfSQ9Q3T1v0ZNpmP1BFkIPT5anK8AE8tdLgqcMcFVawjbrV?=
 =?us-ascii?Q?WMY0v1E6LkMkBNOWvIh4UOljUtwHll0PRTUkjflO/D1tAuMIqG1xWbV7iyzW?=
 =?us-ascii?Q?fGQ4uvnPZ4Yy0iMb8A7CF+f7fgKsIrU8VbGarbu7YshYlGZAspO0+czoTm/x?=
 =?us-ascii?Q?Y6r6iVjB3eW6lbu6FtbZ9BSwuUEFEowQmQosh7vYdaIx5Zu2Uf00hP87V7E+?=
 =?us-ascii?Q?I1MLVv/qORvC0EWJDOt6suMBxUQATqBSCIY4S7p0nZKYmOPfIOdVZDqovXeW?=
 =?us-ascii?Q?DPw+shl2524dquO7NgT/Tju8/G+A0hbK2DzCLjes8lqP5cYFYyr4n/vfom9c?=
 =?us-ascii?Q?moZ1xL8iuWzbAhOivbOyPN5Rxm5WtCdrZWS6z//35baYcYfIIy8bXWMhrhN7?=
 =?us-ascii?Q?YbG8jkbILjHe7B4BVl1YedKO3X4NP2k6ZNHG1dkCZVhLPBzVv0Ac0WS+r0m6?=
 =?us-ascii?Q?s/OjopedNbHwQWwXbR9w02/6O/s6//Iz8RFDcDLwo5Nk8kU76VH3QhTDFTBE?=
 =?us-ascii?Q?26Mwi51Slg0jbFpVPIoVKIU3CLkdpdbCJSShEWdlr+6qCEMNSuwa5oo/I6ED?=
 =?us-ascii?Q?jsOwS2AKgWx3GAvGHbz1BAQLPEVcRr/di8WUoDyQx4anYpgfaH/yqCjGU/Ci?=
 =?us-ascii?Q?IXMNm06buWBWnDv7wbxpNUrwniq3UQCvpy/+W1BqpAt0y6qphIFIQnUMDMK9?=
 =?us-ascii?Q?haH0YUuaWYR1a/DkS/AbUmwUFR3mgmku+C0ajKQk4ToHJ705LbLnoFvbFE1L?=
 =?us-ascii?Q?ghnI0OkUcJ/94OvX7v20C0QjzeVACevsBRZxlqgdhwbDbIxj+yxlYkSy4+JK?=
 =?us-ascii?Q?3xLt3xZa1zgpfshK1KeTzR9BpJVVfDnXq4A+wpi7ONN0AqiBRv38GS7cuwtx?=
 =?us-ascii?Q?fWB28RVDWtS+5YouGMABdYENYYjvbuboLM0/2zyJYUnc3TqokGBdPiN5vbRP?=
 =?us-ascii?Q?wJZe9O5m85dkA37C5xbj11qmJ2So6rwVmx9KcNbQMtyMi9PDry3ZdEOTycge?=
 =?us-ascii?Q?PsvB+sYi5oSfZobOPu+lE9O1yngw/BOW/zrersiUB/WLRbKCdshbDIDcdCvy?=
 =?us-ascii?Q?d9zEOsq9BmF+HSOG3tCERd6jBktIumtDMBG9YgvYCQxVZ8Svs7TIlyENijC/?=
 =?us-ascii?Q?tAUAp/4cstL+jNnoHK/wcL1vx2OrueK0m+71f1cmw3ERwAfAYf+9MR/MBwIh?=
 =?us-ascii?Q?2iHN/Drp5xbcZHH+YGt6/pnQd7nCFhE+rf3Sf8pI2cYe+WOalewM13A/sX2t?=
 =?us-ascii?Q?UeRrnQEvY+7x2LBrntg3B5Ag9tcTKKs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409761a8-323c-4bf0-35ff-08deb5c4e47e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:37:18.6763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3G1jDd/dKY2zaWLag7iItKUbHgw2jDcp3SSg0k3h5lhl5IbAa8KYHDr7wurz86/zQ3jg7pm1a79BEyN7dKn6z9hAss6ieLqKaDYmt6tT22E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR01MB8806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_093726_796362_DBFED90F 
X-CRM114-Status: GOOD (  22.25  )
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

Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
rodata=full"), the direct mapping may be split on some machines instead
keeping static since boot. It makes more sense to show the direct mapping
use in /proc/meminfo than before.
This patch will make /proc/meminfo show the direct mapping use like the
below (4K base page size):
DirectMap4K:       94792 kB
DirectMap64K:     134208 kB
DirectMap2M:     1173504 kB
DirectMap32M:    5636096 kB
DirectMap1G:    529530880 kB

Although just the machines which support BBML2_NOABORT can split the
direct mapping, show it on all machines regardless of BBML2_NOABORT so
that the users have consistent view in order to avoid confusion.

Although ptdump also can tell the direct map use, but it needs to dump
the whole kernel page table. It is costly and overkilling. It is also
in debugfs which may not be enabled by all distros. So showing direct
map use in /proc/meminfo seems more convenient and has less overhead.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/mm/mmu.c | 192 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 171 insertions(+), 21 deletions(-)

v7: * Rebased to v7.1-rc4
    * Changed "dm" to "lm" to follow ARM convention per Will
    * Used __is_lm_alias() instead of reinventing a new helper per Will
v6: * Rebased to v7.0-rc3
    * Rebased on top of Anshuman's v5 "arm64/mm: Enable batched TLB flush
      in unmap_hotplug_range()"
    * Used const for direct map type array per Will
    * Defined PUD size for 16K/64K even though it is not used per Will
    * Removed the misleading comment in init_pmd() per Will
v5: * Rebased to v6.19-rc4
    * Fixed the build error for !CONFIG_PROC_FS
v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
    * Used shorter name for the helpers and variables per Ryan
    * Fixed accounting for memory hotunplug
v3: * Fixed the over-accounting problems per Ryan
    * Introduced helpers for add/sub direct map use and #ifdef them with
      CONFIG_PROC_FS per Ryan
    * v3 is a fix patch on top of v2
v2: * Counted in size instead of the number of entries per Ryan
    * Removed shift array per Ryan
    * Use lower case "k" per Ryan
    * Fixed a couple of build warnings reported by kernel test robot
    * Fixed a couple of poential miscounts

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index dd85e093ffdb..e6c1d591a4ef 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -29,6 +29,7 @@
 #include <linux/mm_inline.h>
 #include <linux/pagewalk.h>
 #include <linux/stop_machine.h>
+#include <linux/proc_fs.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -164,6 +165,82 @@ static void init_clear_pgtable(void *table)
 	dsb(ishst);
 }
 
+enum lm_type {
+	PTE,
+	CONT_PTE,
+	PMD,
+	CONT_PMD,
+	PUD,
+	NR_LM_TYPE,
+};
+
+#ifdef CONFIG_PROC_FS
+static unsigned long lm_meminfo[NR_LM_TYPE];
+
+void arch_report_meminfo(struct seq_file *m)
+{
+	const char *size[NR_LM_TYPE];
+
+#if defined(CONFIG_ARM64_4K_PAGES)
+	size[PTE] = "4k";
+	size[CONT_PTE] = "64k";
+	size[PMD] = "2M";
+	size[CONT_PMD] = "32M";
+	size[PUD] = "1G";
+#elif defined(CONFIG_ARM64_16K_PAGES)
+	size[PTE] = "16k";
+	size[CONT_PTE] = "2M";
+	size[PMD] = "32M";
+	size[CONT_PMD] = "1G";
+	size[PUD] = "64G";
+#elif defined(CONFIG_ARM64_64K_PAGES)
+	size[PTE] = "64k";
+	size[CONT_PTE] = "2M";
+	size[PMD] = "512M";
+	size[CONT_PMD] = "16G";
+	size[PUD] = "4T";
+#endif
+
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PTE], lm_meminfo[PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PTE],
+			lm_meminfo[CONT_PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PMD], lm_meminfo[PMD] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PMD],
+			lm_meminfo[CONT_PMD] >> 10);
+	if (pud_sect_supported())
+		seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PUD], lm_meminfo[PUD] >> 10);
+}
+
+static inline void lm_meminfo_add(unsigned long addr, unsigned long size,
+				  enum lm_type type)
+{
+	if (__is_lm_address(addr))
+		lm_meminfo[type] += size;
+}
+
+static inline void lm_meminfo_sub(unsigned long addr, unsigned long size,
+				  enum lm_type type)
+{
+	if (__is_lm_address(addr))
+		lm_meminfo[type] -= size;
+}
+#else
+static inline void lm_meminfo_add(unsigned long addr, unsigned long size,
+				  enum lm_type type)
+{
+}
+
+static inline void lm_meminfo_sub(unsigned long addr, unsigned long size,
+				  enum lm_type type)
+{
+}
+#endif
+
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
@@ -229,6 +306,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		init_pte(ptep, addr, next, phys, __prot);
 
+		if (pgprot_val(__prot) & PTE_CONT)
+			lm_meminfo_add(addr, (next - addr), CONT_PTE);
+		else
+			lm_meminfo_add(addr, (next - addr), PTE);
+
 		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
@@ -259,6 +341,10 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pmd_set_huge(pmdp, phys, prot);
 
+			if (pgprot_val(prot) & PTE_CONT)
+				lm_meminfo_add(addr, (next - addr), CONT_PMD);
+			else
+				lm_meminfo_add(addr, (next - addr), PMD);
 			/*
 			 * After the PMD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -382,6 +468,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
+			lm_meminfo_add(addr, (next - addr), PUD);
 			/*
 			 * After the PUD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -571,16 +658,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_level pgtable_level)
 	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_level);
 }
 
-static void split_contpte(pte_t *ptep)
+static void split_contpte(unsigned long addr, pte_t *ptep)
 {
 	int i;
 
+	lm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+
 	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
 	for (i = 0; i < CONT_PTES; i++, ptep++)
 		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
+
+	lm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
 }
 
-static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
+static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
+		     bool to_cont)
 {
 	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 	unsigned long pfn = pmd_pfn(pmd);
@@ -604,8 +696,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	lm_meminfo_sub(addr, PMD_SIZE, PMD);
 	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
 		__set_pte(ptep, pfn_pte(pfn, prot));
+	if (to_cont)
+		lm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
+	else
+		lm_meminfo_add(addr, PMD_SIZE, PTE);
 
 	/*
 	 * Ensure the pte entries are visible to the table walker by the time
@@ -617,16 +714,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	return 0;
 }
 
-static void split_contpmd(pmd_t *pmdp)
+static void split_contpmd(unsigned long addr, pmd_t *pmdp)
 {
 	int i;
 
+	lm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+
 	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
 	for (i = 0; i < CONT_PMDS; i++, pmdp++)
 		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
+
+	lm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
 }
 
-static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
+static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
+		     bool to_cont)
 {
 	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
@@ -651,8 +753,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	lm_meminfo_sub(addr, PUD_SIZE, PUD);
 	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
 		set_pmd(pmdp, pfn_pmd(pfn, prot));
+	if (to_cont)
+		lm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
+	else
+		lm_meminfo_add(addr, PUD_SIZE, PMD);
 
 	/*
 	 * Ensure the pmd entries are visible to the table walker by the time
@@ -707,7 +814,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pud_present(pud))
 		goto out;
 	if (pud_leaf(pud)) {
-		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
+		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -725,14 +832,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 		goto out;
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
+			split_contpmd(addr, pmdp);
 		/*
 		 * PMD: If addr is PMD aligned then addr already describes a
 		 * leaf boundary. Otherwise, split to contpte.
 		 */
 		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
 			goto out;
-		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
+		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -749,7 +856,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pte_present(pte))
 		goto out;
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 out:
 	return ret;
@@ -856,7 +963,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
 	int ret = 0;
 
 	if (pud_leaf(pud))
-		ret = split_pud(pudp, pud, gfp, false);
+		ret = split_pud(addr, pudp, pud, gfp, false);
 
 	return ret;
 }
@@ -870,8 +977,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
-		ret = split_pmd(pmdp, pmd, gfp, false);
+			split_contpmd(addr, pmdp);
+		ret = split_pmd(addr, pmdp, pmd, gfp, false);
 
 		/*
 		 * We have split the pmd directly to ptes so there is no need to
@@ -889,7 +996,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
 	pte_t pte = __ptep_get(ptep);
 
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 	return 0;
 }
@@ -1463,20 +1570,20 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
 	return true;
 }
 
-static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
+static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
 				    unsigned long end, bool free_mapped,
 				    struct vmem_altmap *altmap)
 {
-	pte_t *ptep, pte;
+	pte_t pte;
 
 	do {
-		ptep = pte_offset_kernel(pmdp, addr);
 		pte = __ptep_get(ptep);
 		if (pte_none(pte))
 			continue;
 
 		WARN_ON(!pte_present(pte));
 		__pte_clear(&init_mm, addr, ptep);
+		lm_meminfo_sub(addr, PAGE_SIZE, PTE);
 		if (free_mapped) {
 			/* CONT blocks are not supported in the vmemmap */
 			WARN_ON(pte_cont(pte));
@@ -1485,19 +1592,39 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
 						PAGE_SIZE, altmap);
 		}
 		/* unmap_hotplug_range() flushes TLB for !free_mapped */
-	} while (addr += PAGE_SIZE, addr < end);
+	} while (ptep++, addr += PAGE_SIZE, addr < end);
 }
 
-static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
+static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long addr,
+					 unsigned long end, bool free_mapped,
+					 struct vmem_altmap *altmap)
+{
+	unsigned long next;
+	pte_t *ptep, pte;
+
+	do {
+		next = pte_cont_addr_end(addr, end);
+		ptep = pte_offset_kernel(pmdp, addr);
+		pte = __ptep_get(ptep);
+
+		if (pte_present(pte) && pte_cont(pte)) {
+			lm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+			lm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
+		}
+
+		unmap_hotplug_pte_range(ptep, addr, next, free_mapped, altmap);
+	} while (addr = next, addr < end);
+}
+
+static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
 				    unsigned long end, bool free_mapped,
 				    struct vmem_altmap *altmap)
 {
 	unsigned long next;
-	pmd_t *pmdp, pmd;
+	pmd_t pmd;
 
 	do {
 		next = pmd_addr_end(addr, end);
-		pmdp = pmd_offset(pudp, addr);
 		pmd = READ_ONCE(*pmdp);
 		if (pmd_none(pmd))
 			continue;
@@ -1505,6 +1632,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_leaf(pmd)) {
 			pmd_clear(pmdp);
+			lm_meminfo_sub(addr, PMD_SIZE, PMD);
 			if (free_mapped) {
 				/* CONT blocks are not supported in the vmemmap */
 				WARN_ON(pmd_cont(pmd));
@@ -1516,7 +1644,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pmd_table(pmd));
-		unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, altmap);
+	} while (pmdp++, addr = next, addr < end);
+}
+
+static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long addr,
+					 unsigned long end, bool free_mapped,
+					 struct vmem_altmap *altmap)
+{
+	unsigned long next;
+	pmd_t *pmdp, pmd;
+
+	do {
+		next = pmd_cont_addr_end(addr, end);
+		pmdp = pmd_offset(pudp, addr);
+		pmd = READ_ONCE(*pmdp);
+
+		if (pmd_leaf(pmd) && pmd_cont(pmd)) {
+			lm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+			lm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
+		}
+
+		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
@@ -1537,6 +1686,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		WARN_ON(!pud_present(pud));
 		if (pud_leaf(pud)) {
 			pud_clear(pudp);
+			lm_meminfo_sub(addr, PUD_SIZE, PUD);
 			if (free_mapped) {
 				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
 				free_hotplug_page_range(pud_page(pud),
@@ -1546,7 +1696,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
-		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
-- 
2.47.0


