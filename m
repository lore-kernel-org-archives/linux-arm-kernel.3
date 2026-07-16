Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0C5C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WIv1LCqx8TDcYXn0VUNbIzrwjY41KxFE/FAjgphRV8=; b=Vmhygz4YKRaszoY13wBxs7wnyG
	MEteU+hR72a823gQ/vfDcMIXhwNPWyJhdthu256iw0g1e8M5zh+H3v1jzvc2/RvPleXbo44KNPN7M
	jmCt9SZ1iEyCg8GY+b1OmpyKtwfngSxQZ+O5Zw0D0OMrWwq7H25FKX3qaUK69QgeL+ARkFOJkPtNA
	sYLOS8tFgNY1z+41I9NkLDQsjCi/IcpQdYjQH+ylOaZAQ1v+SEp0dZx7cpiAEuI2O5XLWXc1FLq+/
	TcrJL1yUHHqmjvMsKC9cLQsuKL8/pQL5FZjohCA1Rx2wlDVw+0pbwj8/PwKnkYK+1hA+ok4/KDWnh
	2A4AL0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGG-00000000Z5r-3us4;
	Thu, 16 Jul 2026 21:04:52 +0000
Received: from mail-westus3azon11012004.outbound.protection.outlook.com ([40.107.209.4] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFS-00000000YEP-0gYf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A10yBeCvyvCvY8hki10urkM1X9fBgl52sRwkGYTwhIRNA24Kw9CUSY6rgqQsYzmHgt/HpiASHLMeBe+Db7eFEF0Ewpa+lcBmhuCcijrpqY+vogm9gzoEnOeh5I7MK8VMFPxre5fpTBsGUhlEinxtR+UbCdtalp6z62AE59LnjBY4wYt/re1gkr/5HK+gQP607Y8pujy7hIlFuXzmxC7FJwLi8sqyMqKVj0MtNPluO0X01PAnVyAIMhofK3KK3f11DJ2fHT7P60+/WgZx0J+9k1GogiyCy901GDddDQ254eOjJYeAjjdNB1zw4UMnOgcfC8qJs+NSpuDb/2J5Oe9JGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WIv1LCqx8TDcYXn0VUNbIzrwjY41KxFE/FAjgphRV8=;
 b=YVPHtF7EwqAKesscjsI2Esar6Nj7mIl0YToZwJq1dq29IPjJV3t19dC+kF2N+it1npl6w617r42cKrKl1KE8hpeZML6zZu1IoAq2qLwhoOw9Nu7VYPklK9Ylu7a26olSc+wufrArG1/Kl9jVF7UkA4f7gg/KwnX2PPs0X5G9wYkbG/OGzHoOP2jsKtRCn+r+uy7VWg2rKiHsYYh4aVAnZ9iP3NJaBsJiUuEjBFOkqWz05/QwrxjQSKd7pe5/tccVw1ML3auFRl1nBvpkRtgoCUhyWY0+4iWKcUe67cwvA+7BV7Ju8/S7+tHmngcg0O+9oglkAWCqNroCIEVmluvcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WIv1LCqx8TDcYXn0VUNbIzrwjY41KxFE/FAjgphRV8=;
 b=eH0WVfG9uAOg54PiXksBHh9Ah6T1djXqis/8VLYFHzP4jFxtDmbijUcl7pNQOz8HnMMqVPgGVBw0Fm7em3LwnwNzqKAyh/Skh9dmsVURqGVVFktPY+2WPBhByCdmki/P3rCaLnhnkwr8g/LLpznXb8SYdycM34EgcNHFHHFRbfofGGivOhxh2N2bsTUTbxpbhrogjpnOpfwDA7tjSu/iq8C9eby+mzAn2ND6zksw+ROvzbFuxT6JeNRXghRnPeJUve8ZVz7Q5xudKof3pKTIOGdJT18yWgRu3aRd4rw2eiiVfNXosuYZ0MpB9Je7UzM5WktZLr0Kw3pw4PBl5Z09aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 21:03:55 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:55 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH 20/23] Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE monitoring
Date: Thu, 16 Jul 2026 14:03:10 -0700
Message-ID: <20260716210329.2914625-20-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9940b9-d49c-4e59-d16e-08dee37dbf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|22082099003|18002099003|56012099006|11063799006|3023799007|10067099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info: AkC566t2ejLSXhkt6idK6xifWm8mWCGW3s/+IEEFeEJPHB3WeW/Axp//dnay50p7aQ7JZVqYJos3NlJoYmco2izWFmaGqhQomB5JTKPMdUhs9AnwrwjVmtNal0cag9M5BSfEad+cV+a640bfrNaBg6VpPgNbzdFNyFSwRi5KOndjVeWWWUfOiOSQUgFQRRhlxl6HY8Qk0CL3lWwMzNv8QHKqGbZrj5qm2CYhw3lIr8B0XBg+gIwLAuXn2/mEXu+4frqvBQYlUohURM+MWebsZqGVDmz2BA5kuTUXJNW96lNGpqJDGWTGKuinteF7SQGtR/vUnAxoJBzW1+YYdPuholJM+tV11wp8akQZzsjQhbSYwjY/vzu/4/tuL1CFpHaNYi7ssLUf5FvBXAp/Y1PEDLy0Bhu0h56QRh3dFqFAEs8N6oSqpOD0Sn+TvUqzieHbtn1wPGycexQjqqprDcvVqsPn56yXxex/3oVwl3d5hCM0jOq+z1cUVlgqSJtIwGpCGXc9mhAcny1JP/L/YyXU6PBIBPaAKpFHDzJ20EsjM/9tlQfHdBHrRt7+WkxrcyUheHUWIxD7uRcNbSp5wP5WOYt4dUTla8j25zpbgohjUDcMnsIW+ilzgFp+wdzfYxzROmE7YeLSH52b53eHDPhlbW8iaHH+qUyZviJFq15r9VOM7gCeSaowORcbCE66fwVutr1tswUFbxq/EyI+d/5z6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZbkAfDtS/lV/qpsJaQ/1iztMjsRS0kCp0+nzGRcLz9FFvlxYoXOXtG981G9M?=
 =?us-ascii?Q?j2I6J6OgnvvKO2U2tTlB9LJ8Xzy2pGwh8NaFMyJwZlWgISVM4HtA56mC3x6m?=
 =?us-ascii?Q?TpKAhTl9J5sQmcH58Q1tQARzb71jTcciSeow7fixK+2hwZiy/j+TnJANzHT6?=
 =?us-ascii?Q?YfxX5ukwzFcgsZqdCQjYZ37k4sK2rEkC2wO+n+ktrz2k3BXqa2QpKCsIfpPW?=
 =?us-ascii?Q?CvnrI4/NABAkparkcbjzxa6Lxx+UjAtBOSy4o0FAP8yNbcgCrgXOJz0db4HD?=
 =?us-ascii?Q?U9s8yKwXkUXL16oyzVVy6ZbYvnjYZ/XXrDHIPIKzPPTu1b/dcXocRb+c+Yif?=
 =?us-ascii?Q?nUCC0prpTLD9sgrdbZJRjTZHPXK8VKBx0t6YOoGLseGnty9DnOURYlXFuGzR?=
 =?us-ascii?Q?7QCu1yAkdAssQDzzvJeGCUBN24x4VNAEysO4Jtr0TOu8wIeyfSvfoaPljht9?=
 =?us-ascii?Q?/w4sz0rDPXBlYZC368by9IITQtM54NMpH3ZmCoXvFhNg8/GEozOiMfra/jsg?=
 =?us-ascii?Q?inM+pWhHCwXfFpl0UODubSBXdvVMWPwD10986yCe0RENLSf7Z0Z4t3MjFs3i?=
 =?us-ascii?Q?s0H4n6CDuFUnTMi+1FnRSLGHtKyysct3ND9SVadB9n2RsZZMCjuOvLnDIn8X?=
 =?us-ascii?Q?1N+OK1ru5ghyQPIpsoWRnC9APP65QJ3m2OrfOaYscl/rx2sfiHhoV7c0sO0P?=
 =?us-ascii?Q?JLupJ2QQTzlUg6pSTvGTs+S4nH3VPzkbBa+KgJgYBspr3wmw/XSQoDImQkPg?=
 =?us-ascii?Q?i9rlCpeFO//Dx9lsHd32GgtagSptWNFrQlmClhWmG8TlZe5fsqf/KTBaqlz6?=
 =?us-ascii?Q?sai/wGA0UyPgS1rrfBazPPh0JTrkgdg2BiOmxa+dsF4OHwLLwgz1peM1c8AQ?=
 =?us-ascii?Q?xmPwSz6FdnT8SMq/uPRRVf3Z9ad/+yTcUd2uOS8LZGYnMCQ7SB2zoIsQhUyA?=
 =?us-ascii?Q?7URSSTOsS41zCQKNgLNRj/PuHUIRCdiUXHckkS7esIMGYhk8zaNHXaBR8mXB?=
 =?us-ascii?Q?inFHD10cbx1q0qLuD1K9EkdyM/fsjs0GE/rP6SjKotn+nGFP2WcQfVucnhLK?=
 =?us-ascii?Q?0L55LgH/M5hn3Fkl3xGS0IwRam61hACLaSxK8KegEo56Gu++/7cKHFVyZI7U?=
 =?us-ascii?Q?oF0NRcK0Scbn1NKPNitbMjcCJFb7ZB9IpKqJrwewmancJyO1gsLGor1V4eeO?=
 =?us-ascii?Q?Y2hjCLpaBryFgv0MTi+2TzlK1MSfr7SrZAPNfbfDlLwL33Zzpy8hBW5cMgQ1?=
 =?us-ascii?Q?zbhO410T1bYadXTl1ECWw7FBS3w/9LhBEQpdTBHUjQXH+wkZGXIbLLUlPSxc?=
 =?us-ascii?Q?YmlVnwBgcsZz16JGSPGDTM21XvS/OeX/Mg7+VphuAn8hkWDuaKYBdgTE4c2w?=
 =?us-ascii?Q?ktZC252/SgMY300L6EJCZQWG3PyIvauiF/Hsh/BD4U0DZfuSQ1LinRW5J4eC?=
 =?us-ascii?Q?Nv1gpLKybJowos7VZrLHEhoDk+SZp4Jw+xGKL4SIn4hTSoA78z8e2VdSOJQr?=
 =?us-ascii?Q?5BdNItu6r9bZLEC7U2fUXaWo0UJlQevdkrp2gJtKYEjdkiaREyFdGGs600Go?=
 =?us-ascii?Q?kLNwtItK5e+l3WrqTpG/A0F60HAOiBN4TTc4Q/Dk531FESIoOyJahN4xrM5b?=
 =?us-ascii?Q?NmocopYt9R/VOSyxV5Odk7hSeA09eeThV99El2GShS5IFU2G0XbDh+sFR6hP?=
 =?us-ascii?Q?yFDqj6bp8LxaMqKm4JxuyGl+7w1/B07V4HVnLvMjF1/W5AZBIGHGfi7fhXlL?=
 =?us-ascii?Q?AcnvMziVuA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9940b9-d49c-4e59-d16e-08dee37dbf21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:55.1156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlwJRRqKVO9KZe8W4Me0H8JNV1m1MgDw2Ua75r3hdOjQ1QI/CRzgaxTfLCPXx2Epyyag8gPUfLIviRnuiTILTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140402_214192_4FA30359 
X-CRM114-Status: GOOD (  13.14  )
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

On ARM MPAM platforms backed by a memory-level MSC, the MB control's
scope reads NODE and schemata identifiers are NUMA node ids rather than
L3 cache ids. Document the scope file values, mon_NODE_XX monitor
directories, and how to interpret MB: lines for both L3-scoped and
NODE-scoped MBA resources in Documentation/filesystems/resctrl.rst.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/filesystems/resctrl.rst | 45 ++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 0de86d00c0a6..a88ea9c2a386 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -89,9 +89,13 @@ allocation:
 		(for example ``MB`` and ``MB_NODE`` on MBA resources).
 
 		Each control subdirectory is read-only and contains ``scope``
-		and ``type`` files. Bandwidth (scalar) controls also expose a
-		``status`` file that reads ``enabled`` when the control is backed
-		by bandwidth-control hardware and ``disabled`` otherwise.
+		and ``type`` files. The ``scope`` file reads ``L3`` when the
+		control's domain identifiers are L3 cache IDs and ``NODE`` when
+		they are NUMA node IDs. This determines how to interpret numeric
+		IDs in the control's ``schemata`` line and in ``mon_NODE_XX``
+		directories under ``mon_data``. Bandwidth (scalar) controls also
+		expose a ``status`` file that reads ``enabled`` when the control
+		is backed by bandwidth-control hardware and ``disabled`` otherwise.
 
 		On resources that support control emulation (see "MBA control
 		emulation" below), this directory also contains a writable
@@ -656,6 +660,14 @@ When monitoring is enabled all MON groups will also contain:
 	each instance of an L3 cache. Each directory contains files for the enabled
 	L3 events (e.g. "llc_occupancy", "mbm_total_bytes", and "mbm_local_bytes").
 
+	On platforms where memory bandwidth monitoring is associated with the
+	MB resource (for example ARM MPAM systems with a memory-level MSC),
+	there will be a "mon_NODE_XX" directory for each MB monitor domain.
+	"XX" is the NUMA node id that also appears in the "MB:" line of
+	"schemata" when the MB control's ``scope`` reads ``NODE``. Each
+	"mon_NODE_XX" directory contains the MBM events enabled for that
+	resource (for example "mbm_total_bytes").
+
 	If telemetry monitoring is enabled, there will be a "mon_PERF_PKG_YY"
 	directory for each physical processor package. Each directory contains
 	files for the enabled telemetry events (e.g. "core_energy". "activity",
@@ -987,11 +999,27 @@ or
 Memory bandwidth Allocation (default mode)
 ------------------------------------------
 
-Memory b/w domain is L3 cache.
-::
+On most platforms the memory bandwidth (MBA) domain is the L3 cache and
+the numeric identifiers in the "MB:" line are L3 cache ids::
 
 	MB:<cache_id0>=bandwidth0;<cache_id1>=bandwidth1;...
 
+On ARM MPAM platforms backed by a memory-level MSC, the MB control's
+``scope`` reads ``NODE`` and the identifiers are NUMA node ids instead::
+
+	MB:<node_id0>=bandwidth0;<node_id1>=bandwidth1;...
+
+Example on a system where MB domains are NUMA nodes::
+
+	# cat /sys/fs/resctrl/info/MB/resource_schemata/MB/scope
+	NODE
+	# cat schemata
+	MB:0=100;1=100;2=100;10=100
+	L3:1=ffff;2=ffff
+
+Read the MB control's ``scope`` under ``info/MB/resource_schemata/`` before
+interpreting "MB:" entries in "schemata" or directory names under "mon_data".
+
 MBA control emulation
 ---------------------
 Some platforms expose memory bandwidth allocation through a native control
@@ -1062,11 +1090,14 @@ configuration in each group's ``schemata`` file is unaffected.
 Memory bandwidth Allocation specified in MiBps
 ----------------------------------------------
 
-Memory bandwidth domain is L3 cache.
-::
+When MBA domains are L3 caches::
 
 	MB:<cache_id0>=bw_MiBps0;<cache_id1>=bw_MiBps1;...
 
+When the MB control's ``scope`` reads ``NODE``::
+
+	MB:<node_id0>=bw_MiBps0;<node_id1>=bw_MiBps1;...
+
 Slow Memory Bandwidth Allocation (SMBA)
 ---------------------------------------
 AMD hardware supports Slow Memory Bandwidth Allocation (SMBA).
-- 
2.43.0


