Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF8ECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 21:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qV++klpJcAM9/lVDxOUkpwRYwCuxrnlCDncfhjFzxSc=; b=hKiGccyuGKpu8eGRNkaqTQEUkb
	I0FBOC6S7zcxB8U52170gCmkd0nXyKY2j94BKcys5ms1v1C+v24tM1AJ0fw/w7iMbYYOZzY+aPYgl
	d1KAiLpAtU3723yYXW2yo6A8EtkA/oU0DTqvZveJFeBJftAaJarRu0rV01AYH+gsRM81i+HwPyGde
	RxkqkGK0X4A59CUjer62HsZ6cVnAAMDiZLGiFfxwfOTQxR/QkJSCE19MVB6jda887IWcBOxvwldNA
	59roSFsDyxSpHgOJVJIZcd16wRnDbzHZMswCveWsSJGQ/V8o+GDVnMyG/I58FiztQTim9oxihs4F+
	uAYXFSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4DX-00000006PA5-3fhY;
	Tue, 09 Jun 2026 21:42:39 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4DV-00000006P9h-0gOs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 21:42:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHUCNsHO6pusBSjZu9a6dhz9ixH8nAoGnNaXRE2eNc/+zAQloUm7ow8pdIsARj4A+zdY4T7GrTmigTXyovk4m0d2G6IUlzQu0Uf2jZFrsFej8ckrStjcifL+4qAVovxxvLJnj2ii6AEWClZNfLXZNr3MTWnYKQsNlEn7gkTG+y85633GS9GDNOJ/65vNeUMNirwJAN117D1jefBvvkbxKRx2Z2Ov301luaIxQNMhuKh/4p1n4JSNDGePk33c6R+SD2lBDuD4nnEyoL3jgsYZ2HoKCL/Cv7uHNP7Q476T/IzJpaKbm75ulzpeV8hVQHJMsgsLz06ocM0RhKVehtNxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV++klpJcAM9/lVDxOUkpwRYwCuxrnlCDncfhjFzxSc=;
 b=XN3LNznUFyPzJ3keiyVbCPuNqyJ60RMZ3mrbuePEicM/lZFg8DNpWK+KupWmnlL6BR8IfA+TxRLQ1vWyFMT8ezgVett6Y7KOeknq4tOu1hIyS1nG6LZfB2bUt26UXXRgwiFGRzWXX27ub9fBOacjVWwkYQ7H0Gd5N0iBgWnOEqhufWeE7uBcov+WqGlGhjzolzX2BLjWLLRdCqesshtRzzCnJxLvay90BrGXa0NMpeVtJKQ57cw3AM6eM8Hv3aDO+1Me4sNaSc3l83EOodSIEI+Cr8TKZ48Q9MPpOwZx8q+QXdp8Y5cV8+NJ9NrHEPHs950Tyz6iQn3Arwz+9L8HGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV++klpJcAM9/lVDxOUkpwRYwCuxrnlCDncfhjFzxSc=;
 b=fvpwICiB8XqiKpExcyfA8e1Iw5Cpdb2RZIILQb3s10rdpUGtAPkED3lmPJc1s34YRkQJKUn2mv8KshlKbbFuQ6bYYrTts0Vg5D6qCXClir0lJUyrHkDMuiCi97OBMtRb80ERe6db4miSS/a06vGwHigYHEr1BzxzRXHORMLFaoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DS2PR01MB994205.prod.exchangelabs.com (2603:10b6:8:32f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 21:42:31 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 21:42:28 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v8 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Date: Tue,  9 Jun 2026 14:42:05 -0700
Message-ID: <20260609214205.1260279-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DS2PR01MB994205:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2a9226-3a6b-4cc3-4452-08dec6700096
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|55112099003|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: VYh+QZhGjzuf/+ILfV9JePXtPOw9WSBbx1hXFaKCg99w+VQCmlIBV+wRzg+Jd0b696M6XCQHLOSJ1z0roGciJXK7q/t6UATns76tAsFkrmLu3e+GFwhAQR6J15NgqXNHJgRcuDRt8qG6kmc4+B1fUH9Z0tnNO5PUQmcZhQT9uOrz8VghdMM3Qib+aBJk9k3OhER0Idnuyq2O7J09b0f4P0ZuKAqrFXNdALaqgL+HLJNIXgOT7Y+QxWF7hzkqzrQsGYPVeYQ95krbVYF23JHwsCSUy4ZjsPMFIwWpijcfU2biDOjAltt9HlwpcElEDjAhGglU53qADq8WiBj73708tE/unJtC/071wwA52YOazxxhL2MCFA4ROjAWR+XitVxp5JRoVX3UKSGyzWBMRsXfLAmvBbbyU0Dwr3uKn9Mq+HThqVAa1S71gYfZsLUYBBOP9n1POBdjvS+RlM6pTecxu2pZMCo3xjInKridvkL8zPbBeOVUB/X6V4vjkQzeNF0sKQFaXfHrsmWlIjlLsjN29uFKle48/UkAksBIdAIFVaXBV+i/utoA3BlO5kFRWPZU4neF43ULoRBHZ1VDaQv+DhTZ3x7i/PkQgJ64YKFTmdTrn52Lo4Usj76HJ+FrBjQDHp4Zq0txVgPGAPsdGtrltSE6E2SQJyoUBFHXW8+jTriTx3iBBrQ+PYPz4PLOfQMA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(55112099003)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19vi3FMfY/ZSQs1mTR31YDjDan78eg6j0TjVoYihC56lB9bRSB1GWn+zvn2S?=
 =?us-ascii?Q?AVEKk46fPb5NbL0s2Qlxq5VAgSSA6TEUTxx1bn3XBL//J73TzlVx2JhxjrA0?=
 =?us-ascii?Q?4XENfUTt1zBAStBoMU2rn2shr7bByekS6UsjXa2/9XFrowk/O91VpZtAbyBJ?=
 =?us-ascii?Q?Q9pbVa49lt0xsF5p18BuSjMKgrTo5JMhW4Td56XXu+Ck6Y+IC0/eoJe6BGXG?=
 =?us-ascii?Q?WQIX8788+zwkS0DXl3PrfbDLMUsa7y6jyf6lkONytG6bVpFT61Z7cqcPRCob?=
 =?us-ascii?Q?nSL9LwTI57HPkNf4wvwTiPwmXpttd2UMO5V9eeBtvF4nMbZoJuQO52zNIXrW?=
 =?us-ascii?Q?/sv6mY3C8Zcsroif6lS3I18GzvIOzDRmotrMWeQxwX/LIG4B2cD31dg70Ohi?=
 =?us-ascii?Q?TMYtPVWWFgwHcrH/KANCPz1RlLY3CHeLDov5eM7iPlLORfnLyj0uABvd9crv?=
 =?us-ascii?Q?xX9Wps+XqZMzUMb342UQukxJylsRTJrfkYfnu3tXgAQQMOVpOX5DIw4y9XtU?=
 =?us-ascii?Q?76Cr6Secj2uRy9siqAyfHd+bVidZovkZEtSN/2fGeCpxUzv1VMl+9YUO0Zyy?=
 =?us-ascii?Q?WOnNmyhdCWQvALOtWN8AN5O4Btq9T+gQg1hgr74FY1a5oU9EvBQS84pvgS9s?=
 =?us-ascii?Q?7X6BbY15oKW2q5byB5ROj5SCjAihDAbfhRRSXurerwQAxWZrfafgtzFaDBKA?=
 =?us-ascii?Q?PgMIanoxtstb6LwBsxUg69c6IE+iGHKrsLM2XURzbBYOcsMov0hiplQGoWQ8?=
 =?us-ascii?Q?Pb6wu7llNKx7GJtcLHmQgZPXFClTHyrkcDh/p/32cBo7D6ikML5QEeaqijtQ?=
 =?us-ascii?Q?vWfvAFmmfTxKuJ7uG9WIJxEH7jbx+B5zpqpJ2vFwzytsDXSO1ZBxP0BtCktg?=
 =?us-ascii?Q?APX9tSdz5zlvp+PPj7kAjvTmnZWz2yU73gARodsALLZn6x9OZKbwIXEgFDg5?=
 =?us-ascii?Q?GQtkWG7k5nA/n1TvWgBftKMHk6hQDp2OSplQIcVT4JMZdSBDQWk/Zzk/NhXv?=
 =?us-ascii?Q?M2ezwZURQ6Si75U39tjMsOxFg/sNUscakC7ZVcRnf5OYCccDAPRA6uvWgI5y?=
 =?us-ascii?Q?qWKDG+NQv6NYqvGYCJO7IDlWmpJpNqejYajIFPS9aDrDEw/VRV7wkKvVAe95?=
 =?us-ascii?Q?j4Izd/z60QgtDaF8q5HJMVZJhGqIMe62PU3qfGFN4rr0DGf8+p1Lek69R4IH?=
 =?us-ascii?Q?XQcL87HawnWa1/67GrNdvEeVfze/3LnYMgnUmglBiFhcVYDJcXbUuDQOWDJ0?=
 =?us-ascii?Q?VwkTHVDRtX1yoUinmcYTyXM5DeUL6ne4MYpOmBfkp/2yy4h9uQbWiHLCMUiQ?=
 =?us-ascii?Q?2V65VTv5qGCy0DcB/xZ18q2/b/mHFf3BWrxI+aICPQvIVSMRtY5fIliMrIEK?=
 =?us-ascii?Q?Iqvx8N7stQWZv4Y5JbaE5lGE083wU2pKxP+TDNWN6RbHeAZsUpRfMZh5JraZ?=
 =?us-ascii?Q?tHsLMpsaSoF/bcfyWvtkKxkltkogS8ye1xjaXDC9hXUrLiVzZzmXsdBBsS5p?=
 =?us-ascii?Q?3WiXqqqjPbxfpRuXZ+JCAPCI2J/Lcps4jXbljvXMz3uF5EBXCCP5iPfR9UYT?=
 =?us-ascii?Q?awnRBiJn5xfxg/i+PcqMrLK9/kbA333kPOU9d8WRF3NeUj22mASWaTEioyIT?=
 =?us-ascii?Q?ccnEOma9NT2Lb3WNUK7QEHBCgQV4R9V1SU7WUhJYssovbf5vsGFRd8/hst0z?=
 =?us-ascii?Q?St2xIS9CNjquomOzxI+7NGwW5a4AAieDRD3FsyrP64nz4Z0PY9A3/usDJlBc?=
 =?us-ascii?Q?JQc+epK1lP2ConWTy5HQB66eCI1nSlc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2a9226-3a6b-4cc3-4452-08dec6700096
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 21:42:28.6458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llX7Xnlj2KLt5LsRN558sREAQvyMThkZK4JWHiKU+veazgww9We5O0a7R7DctVrLxTcp/I2oms/WX01AvhVnJfr0irn0aFVyfkgcLb3KrMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR01MB994205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_144237_264266_F9FDAE91 
X-CRM114-Status: GOOD (  22.63  )
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
 arch/arm64/mm/mmu.c | 200 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 179 insertions(+), 21 deletions(-)

v8: * Fixed the double accounting per Sashiko
    * Responded the review comments from Sashiko
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
index dd85e093ffdb..783a473c71ed 100644
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
@@ -219,6 +296,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 	do {
 		pgprot_t __prot = prot;
+		bool count_lm = pte_none(__ptep_get(ptep));
 
 		next = pte_cont_addr_end(addr, end);
 
@@ -229,6 +307,13 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		init_pte(ptep, addr, next, phys, __prot);
 
+		if (count_lm) {
+			if (pgprot_val(__prot) & PTE_CONT)
+				lm_meminfo_add(addr, (next - addr), CONT_PTE);
+			else
+				lm_meminfo_add(addr, (next - addr), PTE);
+		}
+
 		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
@@ -251,6 +336,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 	do {
 		pmd_t old_pmd = READ_ONCE(*pmdp);
+		bool count_lm = pmd_none(old_pmd);
 
 		next = pmd_addr_end(addr, end);
 
@@ -259,6 +345,12 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pmd_set_huge(pmdp, phys, prot);
 
+			if (count_lm) {
+				if (pgprot_val(prot) & PTE_CONT)
+					lm_meminfo_add(addr, (next - addr), CONT_PMD);
+				else
+					lm_meminfo_add(addr, (next - addr), PMD);
+			}
 			/*
 			 * After the PMD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -371,6 +463,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 
 	do {
 		pud_t old_pud = READ_ONCE(*pudp);
+		bool count_lm = pud_none(old_pud);
 
 		next = pud_addr_end(addr, end);
 
@@ -382,6 +475,8 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
+			if (count_lm)
+				lm_meminfo_add(addr, (next - addr), PUD);
 			/*
 			 * After the PUD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -571,16 +666,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_level pgtable_level)
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
@@ -604,8 +704,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
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
@@ -617,16 +722,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
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
@@ -651,8 +761,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
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
@@ -707,7 +822,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pud_present(pud))
 		goto out;
 	if (pud_leaf(pud)) {
-		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
+		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -725,14 +840,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
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
@@ -749,7 +864,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pte_present(pte))
 		goto out;
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 out:
 	return ret;
@@ -856,7 +971,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
 	int ret = 0;
 
 	if (pud_leaf(pud))
-		ret = split_pud(pudp, pud, gfp, false);
+		ret = split_pud(addr, pudp, pud, gfp, false);
 
 	return ret;
 }
@@ -870,8 +985,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
-		ret = split_pmd(pmdp, pmd, gfp, false);
+			split_contpmd(addr, pmdp);
+		ret = split_pmd(addr, pmdp, pmd, gfp, false);
 
 		/*
 		 * We have split the pmd directly to ptes so there is no need to
@@ -889,7 +1004,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
 	pte_t pte = __ptep_get(ptep);
 
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 	return 0;
 }
@@ -1463,20 +1578,20 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
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
@@ -1485,19 +1600,39 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
 						PAGE_SIZE, altmap);
 		}
 		/* unmap_hotplug_range() flushes TLB for !free_mapped */
-	} while (addr += PAGE_SIZE, addr < end);
+	} while (ptep++, addr += PAGE_SIZE, addr < end);
+}
+
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
 }
 
-static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
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
@@ -1505,6 +1640,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_leaf(pmd)) {
 			pmd_clear(pmdp);
+			lm_meminfo_sub(addr, PMD_SIZE, PMD);
 			if (free_mapped) {
 				/* CONT blocks are not supported in the vmemmap */
 				WARN_ON(pmd_cont(pmd));
@@ -1516,7 +1652,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
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
 
@@ -1537,6 +1694,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		WARN_ON(!pud_present(pud));
 		if (pud_leaf(pud)) {
 			pud_clear(pudp);
+			lm_meminfo_sub(addr, PUD_SIZE, PUD);
 			if (free_mapped) {
 				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
 				free_hotplug_page_range(pud_page(pud),
@@ -1546,7 +1704,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
-		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
-- 
2.47.0


