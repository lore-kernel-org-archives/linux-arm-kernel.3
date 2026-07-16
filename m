Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5C3C44519
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VK5bWrSSd5xGPPCCg1bjhLBKQ5U9dv2dC/3O9YD1zw=; b=2vo6xPyamj620UGtaSn73en+H1
	RAodP9ZFA3Z7FepO7FGGgUYa3fsDjhfatqJu518ofRGTOyRVpVY5l+qNW9JPp5V7p6H5e/bYAXlaa
	Lley2dRHRBjk4OxSVuQwGrOQByO8GJrgFs4tIjdKB9NYIy/DbQcBwGj6SsZOHlLXvksRw1coVMEXj
	3FLCxD7mYimLAs9d4sB92Ho8ump7s0PTgBQixti79e0aAOXIyJnoLPV5Pgj+yx1+hIIyrMX2M4b4e
	Qp9k7X0FMRukWDUKMKkBKD3pAdZMIXNEITh40fwEIrpYKkCQ5KVN87YPfDVaKko5du8ePMTsdpC5c
	da30YT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGI-00000000Z7u-0O5Q;
	Thu, 16 Jul 2026 21:04:54 +0000
Received: from mail-southcentralusazon11013054.outbound.protection.outlook.com ([40.93.196.54] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFV-00000000YAB-0jdr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTF+cThT+JanBD9w6eFYLFl8mXJ0ryrO/SPoi25Mp55QZIrDwOh6Xv1IuEHg9EbZJMQ8EWNVUnpugDeGZcUTCdeLuYNTLpLeaMoyZkw/W9hQh7Gvuw6TQfwI0mWhxQGy2pB8OwCWb6A2boTzR6tu1Ty43H4+YuayY1gYrzZWtPGl5gcSLrMGUblqaeawf5oAFx8R/nNTpAII1QCOZLRNOTZ1/wNqXy7siHo+MQtEDnnJe6o1xQuR1Q0tQchh7gNc0Zyxis4I7loK/iJ/eCyzFgO5SG+v2vkyU5pMwR/P5lARO4iitub9Y/JBx+1gT+Gv1z4iZe37u0+XVoM0wQxxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VK5bWrSSd5xGPPCCg1bjhLBKQ5U9dv2dC/3O9YD1zw=;
 b=a8LJqDYd/fnMGfcqv4YzqzHIp9FbfdLghE+16r/Zbzh+Uz8IY2Jl6tAcg7yTR3omTIwC3rfRwqfrDcuMzIkx3qVnJQTH9x75dGg66SO5gQpozK6uqKScjK0pYlZU6A1ySCVUYmenl40VKZrB8a8IqwMujUr4BNGisKqakm25WI0oBGG9L2hlnCnfvaaphX5s1VThwERq7dFNJ/AkMto1FZzvYjwbeb8TYoIydJmZgU0+b8SDqa0DcbveWMn6MzveLs7mdTJ6SWHlKrLO10N0jkrf1Mxw/mcyCCGvlJIQOXJS52iB0QlYGMJ5WPdn+sNuqOMfF2FOUAsHBmEc4WawOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VK5bWrSSd5xGPPCCg1bjhLBKQ5U9dv2dC/3O9YD1zw=;
 b=fiEalLb77x0B1s923m8giELfB8YuFfrqr2oSdlYbVmYdiQ40vEFUMOzbvIhLSPQLHcw5wo116lj/NDGi5GiMpWwmxAZhUTeQG99hwR1xwdj2avLS35YPfrdpMNSvqwLeYuGg7Tg9/V/eCe6JwPaivx2CtjEgiKW+gG2useh8c9MGjWk8YpPa6m+Sz44patpZm2GSR06B7NCTQJnx++46PznolzAtk6SG0SbutQFtg4gTo4h/0KToWzNuxm1l+q96h/IymLv2QyHQVY2xHLSTlQ05aYrJc681XnXnW/r6mrwcEz38LaOLqSI48X/MeTmXewgVmgV7fGm2T1a/aanCow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:54 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:54 +0000
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
Subject: [PATCH 19/23] Documentation: arm64: mpam: document memory-level MB control and NUMA nodes
Date: Thu, 16 Jul 2026 14:03:09 -0700
Message-ID: <20260716210329.2914625-19-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::20) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab7a226-cafc-4e27-38f1-08dee37dbe82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|3023799007|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: GYVC5yBlMeQr05i9JYK33idE70Zj6AzgMKiEZVRi3t3CclYuu9lFpg4PqiP7uNEWBuv+7FkNA62Vc2pmVNI7yxjDto2L1cidLZ78xKilHouUJXjGZTFHhDTXebrav7baFm2jjsys0ZGpdzmfNTfgg7NC398hXiVAaQjlPZTNbcwHgFtOuPzgG3hErbx9dEH1BR1g+hFmx2zg4f6oheYi5adepH1J9pBhkhvVG7QRYjSIw7p9ReH+omG3DXoGAukc838Iz7jnKOo96d1grJPpD+QqajmbvGH4gv7feyOEtuEx8RLYykabfyVTLuxwGA6Fo96Bzv8NyEw9Gohv0hrEDkupjNmHJyt4dCJsxVC+NlQpn9IIbZa0b7Uf5n/AJrP9zz/IHi7y0LKkWrSRv20XQLxrqGQNy60rxiuacUrpi1TFnwK54rftRoPtTy46Y9vqMvQwpeBXrR+xFzsz3MEvVNOsh6F5fT0tVncJ5RRYIsqcgLJcw2t7jaKwwXcwunZDwGzs9FTJkLCnKJ0nQ4Sdc5W38sC2j7iX86OFw00mFyBdIrqLs8M5m5A5WQELvSDQROxxRtt9oSBT9QyZTGT3RItUKUaEAC5mWwDRl/pOvhjJ5xNGqfetDz89G8j0iL83MQ8KRVpKm5QDhmSAX1z8fG9t83OJOSa/tQyuX8siQYpF1MqTFd3o7WHu8o2AZzwqrvidck2Y2lCAApOCl9Ludw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cxYoDlYm1ARI4DlRNrppaWVamqiR7w7e6bbyX7o4zw2f/eU3qqZzZF4bjGcI?=
 =?us-ascii?Q?5trA1/JJ0I0vI3ySvHmVANj5HWxZuMzII5BJ00JB7jTgHgWtNIXdzQ38VS1o?=
 =?us-ascii?Q?+28NZ3ucRHZsnM0Z+jDRgbMvTpIqQKSBfgmz543WThEHyweq6iVKaYNIgS3W?=
 =?us-ascii?Q?lD/onjS5vMcr78ScOtBfESmEvBYL/cdRDVsdgFgmpTFkveAen1kYPYq2Rku8?=
 =?us-ascii?Q?gk5SRaC2oqV2A4FyFxC4YypylSHOfcYu+oS27Kxl4eXpayNYyJWeYWNVrFNh?=
 =?us-ascii?Q?tudQ7hYnks3mOG4m36OL4jQFGVEXoKMU31mOawCs2MDoxq1DE0XDRzMfSjCP?=
 =?us-ascii?Q?SG2NRLo0SgZ3Izs3uAnxdE8pjJQwwX4o/YQD7dIDxla845gnngw5T2r9jpUq?=
 =?us-ascii?Q?/aSRi/ETUI7zBVGdQ1j2hcJKjLLHucANjltGyPc64jjwY1+MUPiSqGnRWxwo?=
 =?us-ascii?Q?+3ZO6namE3a/1p4XsDjkqrml14FoaNu+8l40x7tESP1Tw/lUJXSRbpVq1iXa?=
 =?us-ascii?Q?XzueSnyZePUKpuLzpzcwNxOMpW/G70hCHkT4pZe/+t17YnGgSS+DogFJCndl?=
 =?us-ascii?Q?4NiXI5PG30F8KHZoYzwzouO6A1LtB/wSJYEWGBfu1SXrhU1Pu9GsmUKauGVr?=
 =?us-ascii?Q?wJYtjtyNuYV4NQUlN3PKtTQ123NJuEsGLm6aJ6Gy4tn84kUOEB9xOEkjv0KV?=
 =?us-ascii?Q?XlW4nL7nuWHUiAQND8emKo8Bs4OQT8Z0LsNKSmdxPcH/8PqFCLg8Mt8rObK3?=
 =?us-ascii?Q?6gte9TPdB8ba9i0/dJE6obXbK1hZo2FABdnfbMEgzGQYbOP+ZthZR2jUqd0J?=
 =?us-ascii?Q?RGDqjOFGfq3gJGn3KeK5YSTyg5MvqVp1fyXZ4tTKuoG7r3manySVUpp6kNto?=
 =?us-ascii?Q?Eu5vjyyetzZHoVmPR434aJif2ECPuBb9Vk9CxONLL+WMjkucR42g7cBnknZ4?=
 =?us-ascii?Q?vXyy6wdUzzcfsRilLZ0D78fAXssinDF8VeLd7NFrx9vax0giXBi4r461k6UN?=
 =?us-ascii?Q?RCHpOuxo3Z1v05TCLXakbVenAmKw00wJXoy1vI1z6L/QPeq11J8znL2rBDRa?=
 =?us-ascii?Q?kfmR7+fqG6fqwpBZUyy40nliWR1TPR+bBIiCheOXEkH2egNoJcJjV7xureLF?=
 =?us-ascii?Q?EHFrExNQzv+2FKM29QHQytRaGgMI9nTMc2pDAklNHVcNMdV1f0fjkWtTkO22?=
 =?us-ascii?Q?kiApT3lRtRxpPUKzft+4s3R17/xvyIBYm3oiAIa4/pb82SPcTjwgSP9BZaeK?=
 =?us-ascii?Q?korDAYG6b1JzHiIj36GGffSN7jPCo22PWu4kG1EfvYrewJkZ0dLMhSSw5V3q?=
 =?us-ascii?Q?noNQijdf5tAzt5jZFmtlBwaHfa0HOF+yg7imHdmgWrc4+5ftr1pdsT3hSwHH?=
 =?us-ascii?Q?VplFGt5uhaDrTjgcJFhcny5/nT1FePiFtmRKCFfAFCpbB88MwEHDKrEiGn7S?=
 =?us-ascii?Q?CX49WKpPKNoQIGPpqIQ+Ry9mvmfhptJUMykF+Kwz4zg2NNrBv3S8krjKbedd?=
 =?us-ascii?Q?QQ3WRSQP+Url+JpxkEWkb83/BSRT80LD8my/G06+U2FWY5MlNo7HZ/YSr9Cb?=
 =?us-ascii?Q?BkYDNkHroLJzM5/GtgbCW2J0p4X6uR3FDoRNCqy3zty/OVdj0isSh+ANwexs?=
 =?us-ascii?Q?/mA+kBU+ap4g5rUraE1K2M1DpgVunm+v4gfFWctSsBu70y3Axq4KnlxbNt19?=
 =?us-ascii?Q?o2oDS83830DBJJVGGgM1/Gq4fNNx7Fo44a6aEMA6zqIsbbuhbPIgeUBsVg7M?=
 =?us-ascii?Q?YDUkVQhRtg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab7a226-cafc-4e27-38f1-08dee37dbe82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:54.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyaz88QLe/RbYEzSG9JVTWlAl8KoFqKhnXTq61sQNuf9bA/7S4YS+f8izwtm3ONUZcS3G4KFyKS2bOcZ7tc0WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140405_385920_E5A526A5 
X-CRM114-Status: GOOD (  23.49  )
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

The MB control can be backed by a memory-level MSC above L3 rather than
the L3 cache MSC. In that case resctrl identifies domains by NUMA node id
instead of L3 cache id, exposes a node-scoped MB_NODE control, and can
manage CPU-less memory nodes by falling back to cpu_possible_mask.

Update the arm64 MPAM documentation to describe the L3-cache and memory
MSC paths for both the MB control and MBWU monitoring, how to tell them
apart via the control "scope" file, how NUMA node ids map to
/sys/devices/system/node/node*/, and CPU-less NUMA node handling.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 Documentation/arch/arm64/mpam.rst | 105 +++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 37 deletions(-)

diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
index 67fe515ed501..88ddee8705e4 100644
--- a/Documentation/arch/arm64/mpam.rst
+++ b/Documentation/arch/arm64/mpam.rst
@@ -44,48 +44,79 @@ The supported features are:
   placement.
 
 * Memory bandwidth maximum controls (MBW_MAX) on or after the L3 cache.
-  resctrl uses the L3 cache-id to identify where the memory bandwidth
-  control is applied. For this reason the platform must have an L3 cache
-  with cache-id's supplied by firmware. (It doesn't need to support MPAM.)
-
-  To be exported as the 'MB' schema, the topology of the group of MSC chosen
-  must match the topology of the L3 cache so that the cache-id's can be
-  repainted. For example: Platforms with Memory bandwidth maximum controls
-  on CPU-less NUMA nodes cannot expose the 'MB' schema to resctrl as these
-  nodes do not have a corresponding L3 cache. If the memory bandwidth
-  control is on the memory rather than the L3 then there must be a single
-  global L3 as otherwise it is unknown which L3 the traffic came from. There
-  must be no caches between the L3 and the memory so that the two ends of
-  the path have equivalent traffic.
-
-  When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
-  schema, it prefers the group closest to the L3 cache.
+  resctrl exposes these as the ``MB`` resource.  The domain identifiers
+  used in the ``MB:`` schemata line depend on which MSC group backs the
+  resource:
+
+  **L3-cache MSC (cache-level MB control).**
+  When the MB control hardware sits on the L3 cache MSC, resctrl uses L3
+  cache-ids to identify where bandwidth is applied.  The topology of the
+  MSC group must match the L3 cache topology so that cache-ids can be
+  repainted.  If the memory bandwidth control is on the memory rather
+  than the L3 then there must be a single global L3 as otherwise it is
+  unknown which L3 the traffic came from.  There must be no caches
+  between the L3 and the memory so that the two ends of the path have
+  equivalent traffic.
+
+  **Memory MSC (memory-level MB control).**
+  When the MB control hardware sits on a memory MSC above L3, resctrl uses
+  NUMA node identifiers instead of L3 cache-ids.  The native node-scoped
+  control is exposed as ``MB_NODE``; the legacy ``MB`` control keeps the
+  ``MB:`` schemata line for backward compatibility and, in the default
+  legacy mode, is emulated by ``MB_NODE`` when it has no hardware of its
+  own.  See the MB control emulation section in
+  Documentation/filesystems/resctrl.rst for the control layout and
+  emulation modes.
+
+  On either path, read the control ``scope`` file under
+  ``info/MB/resource_schemata/`` (``L3`` or ``NODE``) to learn which
+  identifier space the ``MB:`` line uses.
+
+  When ``scope`` reads ``NODE``, each numeric ID ``XX`` in the ``MB:``
+  line is a NUMA node id and corresponds to the standard NUMA node
+  directory ``/sys/devices/system/node/nodeXX/``.  That directory
+  describes the node: ``cpulist``/``cpumap`` (the CPUs local to it, empty
+  for a CPU-less node), ``distance`` (NUMA distances to other nodes),
+  ``meminfo`` (its memory), and its ``memoryX`` symlinks.  Use these
+  files to map an ``MB:`` (or ``MB_NODE:``) entry to a physical NUMA node
+  and its CPUs and memory.
+
+  **CPU-less NUMA nodes.**
+  A memory MSC may be associated with a NUMA node that has no local CPUs
+  (for example a memory-only node that still participates in bandwidth
+  control).  The driver falls back to ``cpu_possible_mask`` for the MSC
+  affinity so that traffic from remote CPUs is still accounted for and
+  the node can appear as an ``MB``/``MB_NODE`` domain.
+
+  When the MPAM driver finds multiple groups of MSC it can use for the
+  ``MB`` resource, it prefers the group closest to the L3 cache.
 
 * Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
   there is at least one CSU monitor on each MSC that makes up the L3 group.
   Exposing CSU counters from other caches or devices is not supported.
 
-* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
-  L3 cache-id to identify where the memory bandwidth is measured. For this
-  reason the platform must have an L3 cache with cache-id's supplied by
-  firmware. (The platform doesn't need to support MPAM.)
-
-  Memory bandwidth monitoring makes use of MBWU monitors in each MSC that
-  makes up the L3 group. If the memory bandwidth monitoring is on the memory
-  rather than the L3 then there must be a single global L3 as otherwise it
-  is unknown which L3 the traffic came from.
-
-  To expose 'mbm_total_bytes', the topology of the group of MSC chosen must
-  match the topology of the L3 cache so that the cache-id's can be
-  repainted. For example: Platforms with Memory bandwidth monitors on
-  CPU-less NUMA nodes cannot expose 'mbm_total_bytes' as these nodes do not
-  have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
-  cannot distinguish local traffic from global traffic.
-
-  All these restrictions based on L3 cache are due to resctrl, currently, only
-  supporting monitoring at the L3 scope. It is expected that going forward more
-  MBWU monitors can be exposed to the user after support for more monitoring
-  scopes is added to resctrl.
+* Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl can
+  expose ``mbm_total_bytes`` from either an L3-cache MSC or a memory MSC:
+
+  **L3-cache MSC.**
+  When MBWU monitors sit on the L3 cache MSC, counters are exposed on the
+  ``L3_MON`` resource and use L3 cache-ids.  The MSC group topology must
+  match the L3 cache topology so that cache-ids can be repainted.
+
+  **Memory MSC.**
+  When MBWU monitors sit on a memory MSC above L3, counters are exposed on
+  the ``MB`` resource with node scope.  Monitor directories are named
+  ``mon_NODE_XX`` where ``XX`` is the same NUMA node identifier that appears
+  in the ``MB:`` schemata line.  CPU-less memory nodes are supported the
+  same way as for MB controls above.
+
+  ``mbm_local_bytes`` is not exposed as MPAM cannot distinguish local
+  traffic from global traffic on these paths.
+
+  When only L3-scoped monitoring was supported, platforms with memory
+  bandwidth monitors on CPU-less NUMA nodes could not expose
+  ``mbm_total_bytes``.  Node-scoped monitoring on the ``MB`` resource
+  removes that restriction for memory-class MSCs.
 
 Reporting Bugs
 ==============
-- 
2.43.0


