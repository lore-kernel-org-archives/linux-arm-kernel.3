Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98084F53D8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9dz9LZTuqhUBo7kizIqsJSU2ZsZqWix5Vc0eZhgmj+w=; b=nqRrijBxQIipXXZ/kw/gqD9JDV
	MtGSjSvEZr3pFSgTu6Pk3kS9PpLxcB5+BhxW00jbeRO6TlhkKVWGuri72f+6nlFnOCCrnW1vbsKdB
	xSZfZxdKpJHxBZrWzw9b7s3OPzp7Dor44wufCFK1klF/Qv2exTNRejnfuxMVHFi2DpqqqVM5DsYE/
	33FDNCIVvfMJ+3VYneI6QVuuFQ2NAHlaPAFqLIltDx444KJMyks5PW3KXr4ynh6vR+xuVefZAjG5U
	nNYX4VoYFZtk5QtP87AFUxbTXrDP7+3J6a5KEZg/fktGWElhUfC4IfvgnOQA1dHDqsC8S5tGjEm8m
	N95laSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Dey-00000004lO2-0Wo1;
	Mon, 16 Mar 2026 19:31:28 +0000
Received: from mail-westus2azon11022130.outbound.protection.outlook.com ([52.101.48.130] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Dev-00000004lNV-3WKv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 19:31:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSEJqZ7KeXGA8CUEziGE3JtGAhSipXqfUComxNglca9Tqa6+VrhkpFao7ABRJ3qe+QkKq7MgZ5yIdG2gqVs7o8/8Xh5Bdqj2h3O/4pvXbvT0oOufJOTvAYdNMoZfhlviZINeopcjZo5gzq+oE7CVdjwGvKFKwDQpdKEWMonkJJtoPFI6KWXqrVcyLS06Q1wIZVpJjeburzDxNiIYb3PJ+NIhxBkG8glULE/cMeyHKatlPPVvACfuHWCiRcBlXpSXI+eXOQV34eR8zx03M33A5eatik+443x0AzbTjdvRdDDhi3P8sCIIYRKXZDTc6hxK/YGAFEGEyiqxem43WEJgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dz9LZTuqhUBo7kizIqsJSU2ZsZqWix5Vc0eZhgmj+w=;
 b=oEw4JNGLetu6m/Im4Iykqlj12MvRRmFZrnHN4pe/TKADa+MfccnUKp/2S281OlYGkC6dKefTcoXDCiGkRyjpRPK50vLrI2762WaRjQgqTg6aAS+E/qtgMSBPQ3M6BruzTrdU2e0uUV2uwN76Y34YXRsWmPmvELEODjQRMEvhaAU5W5NpXHjXD86c01SLVJDhpIelK8QDVtIHl2/VGEv1pXTuRZXzrvE0QQnZMWITTQFfslTcoDDi7v914QbOwxsEavGdYYd45IAfTWmdJvwoVtlbb76+fn0fZusGKoYWpndD68/r7M2YRhfudmhWd2UO1s3YgrVanwF0+tihXp82dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9dz9LZTuqhUBo7kizIqsJSU2ZsZqWix5Vc0eZhgmj+w=;
 b=JXGVc2S4W0m6AFYrimzSHABNbHys5ljqCRXMswHRk2jALZUlg9/pLRovRkrJBPSDlSBKAwWGzU3rRSjZG0f1s/S05D0T86Qh7eEgQLIK+UTdFKps1rKIS35eLcXVtyWjaygcENCxiDNcFfC313rUBICq1IulNylOqacyE+D/yUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH7PR01MB8447.prod.exchangelabs.com (2603:10b6:510:2f8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.21; Mon, 16 Mar 2026 19:31:18 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 19:31:11 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	ryan.roberts@arm.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v6 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Date: Mon, 16 Mar 2026 12:29:33 -0700
Message-ID: <20260316192933.3993042-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.52.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR10CA0032.namprd10.prod.outlook.com
 (2603:10b6:930:4b::19) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH7PR01MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: ef45eb87-d7fb-4cfa-98a7-08de8392947e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: jcCX3bCXrTE4Tr1nC43VWjEEJZ/Irnht32XAXr3RzE6SSlF1+WhhTKTr8fyNbbCEz0O8boktRTmzU7ce52WC6u7qODLzPog9xqE4U1xCu+i0SgqVVpAPDsDsDGVn4oHrArhPwraetFS2LEnIkx4Mc6Jp0W4adO8fMkkDAVJsMTZblPzQntHuPxFuPhjtC5DpdRFH/F1ZWf76W5uk0GX3kYqcjwhCksQZiHDQ6I04dU60jJlLTFTRHZveIATNR9Mc4qvcewEKmStqDGMWQliENHfCoBRr72ebsM3+aWPsbHN6rysun7rxQehb0OWqNTg2WuPaj3JoG76x5udY+5zd7wdm9fsdHCPJO1XIDMHcWC7Az61REDP7er1cFjoPvZn3FDz6mzf6wABKCmwoTR3/H1OS0DnvjiS1k718b2nBGQba8VOnRAUYjVXnemawFQ5qzKZUMryk+yHXPPS+cWbzDts7c22JUkEMlVXgdei/ICrUVIpJEMF34nVHyXJcUzCsYpbwG/jepMAwjJ8xVIC20g6h2CO0vREjWqrftKMwgm2fl2UmLrT9XRnwjd2SC1quEBGJKV+KHLRoE9RP5baF6WiKbTZYoBhWO2azXc1IdDYh67jVaFet+K/gC4U+noiPYDT0odvBua2TJYv6EWAMg53JzGvBxnyUSs0YZkHI/DI1qbA33iiDj5CLGP2+Iw/EqzqWRyxeIivHfTxvP3wl+dj3zXJAa6YQDovbums/w3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Swpl+Gf06E8krHKdCH1DVwtwWDdaGEUev3ld2QAIS+OcxmeaSuQpTm2eI7gM?=
 =?us-ascii?Q?MhPvYS9btSLZM+86piB77u8nrN+S0vfhgzVzxPYrSV4fxeqgNXwc3H1nSQ7C?=
 =?us-ascii?Q?KUjMDKAuPDbUK5mmDhzaHxUx/HNjd5u6j9ZfvG98Zmw66TbUgjXrQzC2L6WK?=
 =?us-ascii?Q?f2xuYdFDOOnIW2ty0L5jSH7UNHF6gKabpubfhcJarMpLQ6p9Y0EoksvT5WOF?=
 =?us-ascii?Q?8B2B9YAp5u7uxYfPzLEf/VB1Y6fLpqLzoktqt2c7NIsymX6Cr58vAizXOZOs?=
 =?us-ascii?Q?Mw/yHUdfrF3PCw7qCibALu/vAIt/1oLfEDa8PVIN75DwyB2YwRY6zq20XMv2?=
 =?us-ascii?Q?JfThNCMpQiPlWVOf+hlkvYRX+F9HDhR6ZTqbbBBPNWuYOw6VEXiEgaHE7IdL?=
 =?us-ascii?Q?dHtNRaFQPa0icqRO5m8t3tbx48ng7rqIcLLQVGnQDYzNwDZ4BpV2njYMthuS?=
 =?us-ascii?Q?CgQb9sJWuqg8cqj0PbrJJqgizpE6tJA7m6SvP7nVd1KKXdxE0wm4IXT6uakZ?=
 =?us-ascii?Q?uk0FzsGS2LyYP0hSomi9ped9wum7OZNGDNP8rHoeXOb0K5wGzrTjXhS5Gulp?=
 =?us-ascii?Q?mLvF0IaLncRMkl8ynyGx1ooxNbplNT9LaagolMssKkzj8Rd7UOSbMyljx69q?=
 =?us-ascii?Q?m0qvvrEnhcfww72AqvbbFBUZ/fW72aiuI7F85VdIyJjeZJBgf/ucWmfn1k20?=
 =?us-ascii?Q?VzKrRCiAKctmS63hguWltZQ2LhJABZvRHKQKjBj9wC17I1fwrSB343ysyVRt?=
 =?us-ascii?Q?xNeuC6miBa0VskKxGq8Wojgx94nGINWhlO6IW5qp31ISSj0+Z+mgTZv/wnFu?=
 =?us-ascii?Q?+bomd6l1DyeMibDcoq23ph74mMoXsTncLUWfWmXJv3yltW+oGHycVXC064ac?=
 =?us-ascii?Q?5uVIX83XpKo35klckacB1pYqH4JEvO/m02cQbMqAQUKTvW2FeJaVCAh8+HNE?=
 =?us-ascii?Q?11/PZ18TBoanCRzNz0+A3IFULze8BbQm/7gmON0vDxmi0kOHPYIy/KXYyEVq?=
 =?us-ascii?Q?w8fZyN2I+tZR6XhWdnw3ApybxS8+XJwtJS1VgpM7PANY14JS0zb27chzdsH9?=
 =?us-ascii?Q?FmxL6HqYy1eTu/5x9YG1LToNJ7DQ/fFFDkG+vo7rl9UhZ4z8ZbC8rDaNfhbC?=
 =?us-ascii?Q?Y7geUVOJZ1yb63c+T6MFuZWhCZGQg6LuQAmOXyKhMmILJhH8apujtlp/Ucrh?=
 =?us-ascii?Q?sqkVZkgNqvKYQ9783N+0zcJw+dZe0gAxErAjeidNLux6LSBoBTGewLBnhP0A?=
 =?us-ascii?Q?yRQKFvhzJd+F3mA1ilzG+w1bbo3HFoxoROkp8lIIyezjOgpDecDSffSw9wA7?=
 =?us-ascii?Q?e60JDJ/zspWp73N720LbgklciPj+IO+0NFVzK5vvRMIwReiKJCSwTd5C6WcE?=
 =?us-ascii?Q?Dtei/r4JGaw952W9ZfUJDBhe0a2w93S7WPvm0a9d6EdwZt6X2CiWcYQexgtj?=
 =?us-ascii?Q?nuy93E91BHBBoJQTsvyrsR/b2qrWGwXpyyOnHaImtgp3MKlEXT5b4G0PqdrN?=
 =?us-ascii?Q?XegFVUyoixrY+7v9KaZAfgR5DjSDwYYDy96pyAKmb2NqWp+OSOkqlGiXyCxe?=
 =?us-ascii?Q?9qq6b75XDbuUv8qpjar8PIwdpHdpkDyHKo/27yey1yduIiPNhrDpq+n8W6Eb?=
 =?us-ascii?Q?8y3MiMkXl3nAS/uvE6/zwOgMsoKiP/o4m7G06RYR5ioHbZ6CZ+30ZDvTP9FA?=
 =?us-ascii?Q?wjeUep/DAHh43QGhr0muv2vRE2d8/Czdqx/NNiwec5d6wxAOS//XQ0YZGAMX?=
 =?us-ascii?Q?2WAsvIOqWMRlrG3nqIh3D9ENvWDfMg8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef45eb87-d7fb-4cfa-98a7-08de8392947e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 19:31:11.5812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xcf29e5tXuh88Xhev7ewVSqGSeDLMtAubCwXnyyM/A0nj2R/g829A5KAx1sPfn5IRI4PuZk2+6NK3Mc4U4d1clzM9xlb2Yle9/SdRpSZ8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB8447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_123125_966346_313EB8B1 
X-CRM114-Status: GOOD (  21.54  )
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

 arch/arm64/mm/mmu.c | 197 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 176 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 5fb9a66f0754..7e95dbc69d57 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -29,6 +29,7 @@
 #include <linux/mm_inline.h>
 #include <linux/pagewalk.h>
 #include <linux/stop_machine.h>
+#include <linux/proc_fs.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -171,6 +172,87 @@ static void init_clear_pgtable(void *table)
 	dsb(ishst);
 }
 
+enum dm_type {
+	PTE,
+	CONT_PTE,
+	PMD,
+	CONT_PMD,
+	PUD,
+	NR_DM_TYPE,
+};
+
+#ifdef CONFIG_PROC_FS
+static unsigned long dm_meminfo[NR_DM_TYPE];
+
+void arch_report_meminfo(struct seq_file *m)
+{
+	const char *size[NR_DM_TYPE];
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
+			size[PTE], dm_meminfo[PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PTE],
+			dm_meminfo[CONT_PTE] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PMD], dm_meminfo[PMD] >> 10);
+	seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[CONT_PMD],
+			dm_meminfo[CONT_PMD] >> 10);
+	if (pud_sect_supported())
+		seq_printf(m, "DirectMap%s:	%8lu kB\n",
+			size[PUD], dm_meminfo[PUD] >> 10);
+}
+
+static inline bool is_dm_addr(unsigned long addr)
+{
+	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
+}
+
+static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+	if (is_dm_addr(addr))
+		dm_meminfo[type] += size;
+}
+
+static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+	if (is_dm_addr(addr))
+		dm_meminfo[type] -= size;
+}
+#else
+static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+}
+
+static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
+				  enum dm_type type)
+{
+}
+#endif
+
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
@@ -236,6 +318,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		init_pte(ptep, addr, next, phys, __prot);
 
+		if (pgprot_val(__prot) & PTE_CONT)
+			dm_meminfo_add(addr, (next - addr), CONT_PTE);
+		else
+			dm_meminfo_add(addr, (next - addr), PTE);
+
 		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
@@ -266,6 +353,10 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pmd_set_huge(pmdp, phys, prot);
 
+			if (pgprot_val(prot) & PTE_CONT)
+				dm_meminfo_add(addr, (next - addr), CONT_PMD);
+			else
+				dm_meminfo_add(addr, (next - addr), PMD);
 			/*
 			 * After the PMD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -389,6 +480,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 		    (flags & NO_BLOCK_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
+			dm_meminfo_add(addr, (next - addr), PUD);
 			/*
 			 * After the PUD entry has been populated once, we
 			 * only allow updates to the permission attributes.
@@ -575,16 +667,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
 	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_type);
 }
 
-static void split_contpte(pte_t *ptep)
+static void split_contpte(unsigned long addr, pte_t *ptep)
 {
 	int i;
 
+	dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+
 	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
 	for (i = 0; i < CONT_PTES; i++, ptep++)
 		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
+
+	dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
 }
 
-static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
+static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
+		     bool to_cont)
 {
 	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
 	unsigned long pfn = pmd_pfn(pmd);
@@ -606,8 +703,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	dm_meminfo_sub(addr, PMD_SIZE, PMD);
 	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
 		__set_pte(ptep, pfn_pte(pfn, prot));
+	if (to_cont)
+		dm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
+	else
+		dm_meminfo_add(addr, PMD_SIZE, PTE);
 
 	/*
 	 * Ensure the pte entries are visible to the table walker by the time
@@ -619,16 +721,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
 	return 0;
 }
 
-static void split_contpmd(pmd_t *pmdp)
+static void split_contpmd(unsigned long addr, pmd_t *pmdp)
 {
 	int i;
 
+	dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+
 	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
 	for (i = 0; i < CONT_PMDS; i++, pmdp++)
 		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
+
+	dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
 }
 
-static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
+static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
+		     bool to_cont)
 {
 	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
 	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
@@ -651,8 +758,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
 	if (to_cont)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
+	dm_meminfo_sub(addr, PUD_SIZE, PUD);
 	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
 		set_pmd(pmdp, pfn_pmd(pfn, prot));
+	if (to_cont)
+		dm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
+	else
+		dm_meminfo_add(addr, PUD_SIZE, PMD);
 
 	/*
 	 * Ensure the pmd entries are visible to the table walker by the time
@@ -707,7 +819,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pud_present(pud))
 		goto out;
 	if (pud_leaf(pud)) {
-		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
+		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
 		if (ret)
 			goto out;
 	}
@@ -725,14 +837,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
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
@@ -749,7 +861,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
 	if (!pte_present(pte))
 		goto out;
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 out:
 	return ret;
@@ -835,7 +947,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
 	int ret = 0;
 
 	if (pud_leaf(pud))
-		ret = split_pud(pudp, pud, gfp, false);
+		ret = split_pud(addr, pudp, pud, gfp, false);
 
 	return ret;
 }
@@ -849,8 +961,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
 
 	if (pmd_leaf(pmd)) {
 		if (pmd_cont(pmd))
-			split_contpmd(pmdp);
-		ret = split_pmd(pmdp, pmd, gfp, false);
+			split_contpmd(addr, pmdp);
+		ret = split_pmd(addr, pmdp, pmd, gfp, false);
 
 		/*
 		 * We have split the pmd directly to ptes so there is no need to
@@ -868,7 +980,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
 	pte_t pte = __ptep_get(ptep);
 
 	if (pte_cont(pte))
-		split_contpte(ptep);
+		split_contpte(addr, ptep);
 
 	return 0;
 }
@@ -1444,20 +1556,20 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
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
+		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
 		if (free_mapped) {
 			/* CONT blocks are not supported in the vmemmap */
 			WARN_ON(pte_cont(pte));
@@ -1466,19 +1578,39 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
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
+			dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
+			dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
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
@@ -1486,6 +1618,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
 		WARN_ON(!pmd_present(pmd));
 		if (pmd_sect(pmd)) {
 			pmd_clear(pmdp);
+			dm_meminfo_sub(addr, PMD_SIZE, PMD);
 			if (free_mapped) {
 				/* CONT blocks are not supported in the vmemmap */
 				WARN_ON(pmd_cont(pmd));
@@ -1497,7 +1630,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
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
+			dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
+			dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
+		}
+
+		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
@@ -1518,6 +1672,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 		WARN_ON(!pud_present(pud));
 		if (pud_sect(pud)) {
 			pud_clear(pudp);
+			dm_meminfo_sub(addr, PUD_SIZE, PUD);
 			if (free_mapped) {
 				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
 				free_hotplug_page_range(pud_page(pud),
@@ -1527,7 +1682,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
 			continue;
 		}
 		WARN_ON(!pud_table(pud));
-		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
+		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
 	} while (addr = next, addr < end);
 }
 
-- 
2.47.0


