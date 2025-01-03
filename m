Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9FFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ReWOYc4PWFv2aP7+O8RpgqLrjbvqPnjwrhH5GrOTLM=; b=q1Rh6RbbMY6oe92bIkE2/vtk+Q
	vo8pfPFOZ8cRZeXqClSpu5wb3MD1x8867KBf9EAlPLEABxwndmXbnb+FjHPJ+AcgARd4iez8pUf9J
	tcB3rx/bHlJGCU6qCCGElH2vpFm4Bh1Ol3Df2mXXoNbcT4m5Dkpc/S/VozoLFam7nuFo6Fni3QZrJ
	c6yVcS9Js0M6DrUHPAAtMZPoEKT4f3Cx258noVpWiOfiUNW3UT+DAaMw3+nj/8/joObyl0wGmNh10
	Rq11NQ0MPOAPuVcEHkQ6p3FFZ0TDqui6qgmudJX/LbfXt6jw7b3B5ixgE1p7jh4CzpwwKiABiTfMC
	vzi2D2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWOg-0000000Bpbr-28a3;
	Fri, 03 Jan 2025 01:22:42 +0000
Received: from mail-mw2nam12on2071f.outbound.protection.outlook.com ([2a01:111:f403:200a::71f] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWLA-0000000Bp2l-0khL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 01:19:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZXhyixRFDKi9kSIMWbsV0MJ7PJf/OeEDjUpSD7x4YONxCFIpqX2m0JX3Bqxdsw7AEtjvT8QCB01ndMRLczv3hjqyZYDNZ8UJebl/LHyBpQZPak/E+BCXV7DrR8Sm+1kHgEICou0eP/LNKayLAsqeE517+FRgitMHcqMkwdfEn2QNdf61ZKhbcH4MNxYt3tR7vPJ9RBljdLCjWakMisGRnFyPJw9+tl3WNXayULksGlFSrBg1XUdJx+tvY8kHPLIqUVKPnq01z2NSQL2bvhKIByyIMFlaj/nIhYlM5QmD3sTxgEESsaMzJ9lAY7gJqamG/0EDUFmucXbtk2PQmVWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ReWOYc4PWFv2aP7+O8RpgqLrjbvqPnjwrhH5GrOTLM=;
 b=w6/CQouxE1gOQ3Jv2oIOs9JTfma+MXnDbW7s5crcIOcZGDVUpXckc7nPbiM1+U1u7iTqR6DHHn0BNXZv06UcFLzMXwr6BytX29/owSGC2By7zGy02jxezYt5Pfl2e+KFD8Er63hdzUwYBtr2r23AOa/gN1E3tiq4ilOD/ChbUCHOq8SeRseikYudXQ6bjaoB8rPhKNgEUBNqvKiAyq+po3dgY2lv8SO7P16hU5MI1TV/HsP0fu5qYbi0GZOAnSVo770v6HqmomG2KzPXB1C5zXPrd6ZkL+iJoLOuFOX9g2/bm83HsAtYOArVCujcniiHFP7jdH0j8G+iojcN/gw1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ReWOYc4PWFv2aP7+O8RpgqLrjbvqPnjwrhH5GrOTLM=;
 b=Zcsy6qcEzn1Qo1w37wpenv31XHDDv/6ctLF13CgOR+9/ImbPkABBMrDSfSJc7YHE4ci0c/MzqCwi1W667oAs9E2b9aMSd0NGVq3N2S1EAIZsl3Xh8SpHpIuZ1RLr2MEStZGNibaxmEYXeoU0ArT0p8W4ArdfKzpwNbHhMnodA6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MW4PR01MB6164.prod.exchangelabs.com (2603:10b6:303:72::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.8; Fri, 3 Jan 2025 01:18:45 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8335.003; Fri, 3 Jan 2025
 01:18:42 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: cl@gentwo.org,
	scott@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 PATCH 0/2] arm64: support FEAT_BBM level 2 and large block mapping when rodata=full
Date: Thu,  2 Jan 2025 17:17:08 -0800
Message-ID: <20250103011822.1257189-1-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:806:126::25) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MW4PR01MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c1dbad-a553-4665-40b5-08dd2b948f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJiebwzdCNN+9vvq7rM9JwBLyzPwkGeVT46VVue/ZcwwQdoKpvINPEdlvzb0?=
 =?us-ascii?Q?8RTHnCNBgvggb0JehCJVCPPRa9s/eS7j1r7LnXjs9Efd6NT+oHWfEXvqKPqA?=
 =?us-ascii?Q?kkZI/ebCI7/BlDG4id4JCg6FQPmT3QQdarvW5TXXVBTFHUR72DtJJuBzlyw5?=
 =?us-ascii?Q?DluVEMCLZlsT4qdQKRxb7ldUm75WuicHO69vX5eZOyj33oMenFgYtNiKjS+w?=
 =?us-ascii?Q?kOt6G4BCbOb0VMkvJbgiE+nwdhW8gj5eNrQJS/hEhR/ToQtqYNvfUbTEBhU+?=
 =?us-ascii?Q?kYL1p8ZxWGGg54GECHJHAg2vm6W7ck1SpIOK9ouvxvvn//X3dWDrRcLRAc/n?=
 =?us-ascii?Q?Bfb944H90GFfViyJfuE6A/huW8oi2ZKTpGPsQmoZCDV1bfcQHC7KgGouproR?=
 =?us-ascii?Q?Dm3YGxpOdduTz9iTJ+qxTMuF58bXoFPo8LlvIZ4mxCl+aIYiZrS0phxhcR58?=
 =?us-ascii?Q?25wFwFkdp3kZE2SoS5lrlbTdJh1+NcMObQAeECD5rvS2U6WH9d/6l231yalv?=
 =?us-ascii?Q?I+eaQP9+PtijlFF7PdfszYHFEKvy1djIydtvjtWavqCosawl0TCNgP82+KPH?=
 =?us-ascii?Q?LvZxivZJMLdh7//ACt97MMZkPhl1IKg0E3DzLR2uexTE8gln/m/rtGWjJi/9?=
 =?us-ascii?Q?tZEKkv0+bNw+af9eOJ2ayTeVpuFAvazeV1r9w7yF3r7Ltma3aMEJazRJ7ht3?=
 =?us-ascii?Q?awMrquodJH31WRa4t/JDd2x6VuRhkiAoZjFCjyI/Zvy/TPf+vE6AnUukR76G?=
 =?us-ascii?Q?8Ax95B0BAl4V1dYjvqtAj+qmV0uglq8OvYM/kt9xviRNL56DT4Zse3CiVCfB?=
 =?us-ascii?Q?oF9jNwKiVepv46Gz6tZ0LcI+VBx0+5HBJ6k9ICWlD/agb6duhUCrKuiLKkDT?=
 =?us-ascii?Q?YJzIswD9JFsVk3WoGoQWkkXN2DaW8dmBiNzdve+n7jNudCbelTRKRC2y8mSd?=
 =?us-ascii?Q?wJTSkKWTwQVOLhLd+ilNxFuJ6YScMTmhSPiBPMOt3x/uxtKyxXr5MnU/VQs5?=
 =?us-ascii?Q?mZRyFAUuhaa66ukQVUUjbdYIQK8DT0ZOhmWGM/CxdfzcnVLpAYbARhr+7cxE?=
 =?us-ascii?Q?ZUF2PEWNSW/IsM0IBdOHu10Nu+Y3s5UV2x518zCpVZnF7txygohn5XiQ9Rv/?=
 =?us-ascii?Q?kSYnyTrpdQQ4Th1p6fxzhX3wLghjyQLqHqLXeI9jq0A2M68NuvcDgK/obMC2?=
 =?us-ascii?Q?jogrsQ1D6MWQIu8qDuwf/qNkxCJvM7dUoSDQi0ZbhH+zH0p0LWcw1JcDV5nr?=
 =?us-ascii?Q?DJ6qsPxqZpC2mgtd5YtcW/evJ5uJB9cBvThHmbKfeUmzvNJalraKX0xiX/Oa?=
 =?us-ascii?Q?tvAij11djh/5N/4TPqHXr33/6SlQmUuUpPnOQy1y94ych7ZNLeYsXbCEQqjP?=
 =?us-ascii?Q?XcR2uxdg9iiGldvdR5w9L5QNeLuO9n4Bc4drv/OnBSWlJB8aDygU3Z101Tu5?=
 =?us-ascii?Q?93FQIN8XIqGK/d7B626qKd9B87ynqv8+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0/rguI8+TT6cP84wXGYDnQWPvRm724EdRfikSBpaE0mHaVox6BXSCVQAVqcY?=
 =?us-ascii?Q?y6jHZbOBlT25D9J8S5hMwJ9Z6Kne0hDXIYUZ6OsJwMbQ7eAuiGG0i0My0L1F?=
 =?us-ascii?Q?oP8EKbi2teq2RFyyxkHfANJEAHg6m5XH7enYhr//9ulpvufAz6Uy0TOAdFBI?=
 =?us-ascii?Q?r8lFo2g9GToclIpF4JQIzOSptZSX2Xwec9UF46QaaouBtNgDzpndo2z3OWaM?=
 =?us-ascii?Q?Cp7Rao0KDjvhjrbdlnYgoOo/4pUTSB5rTcCau/zI5QsoP1nTtzYfWF6uCNcY?=
 =?us-ascii?Q?0pDcaB1++bbRwzmUmgPHXZoRZQLzXuPFHBMnk8Ip0cp0ZdZ2NhTcZjUWpbY5?=
 =?us-ascii?Q?UKXZKvmVKRIuQMgA8aJpQlsKBTFaEkD+FFMi91vFwUrpl8qNPYr64eyl1Jag?=
 =?us-ascii?Q?5tB/rtmAICDRIzrrxhs0PlKnC/9+um82x4NMe1zeofGBPhFtxH8d+VKHrzTK?=
 =?us-ascii?Q?g3zmXL6kYEA7rVZmSxoGm8+P8Edd80yTA9tCKIBWZH9WizfzEKGzVHHAGjgY?=
 =?us-ascii?Q?YKsfshWWIrEO24xmQklWzutFRD+3g8TL2CEAOnbA9H+EZBomyNNxy4rh5ruJ?=
 =?us-ascii?Q?rNaghKJpEPOr78iG2fjpR5D+Y+rVX7g5cQhreUYCOTq/a+kIZcYZQvHoHnJN?=
 =?us-ascii?Q?E3gtsoqKP2BsG9h4ZF2Z0Rk5fbmlug9y331gpxPZLqkvCOY7us6VHb3VCXXk?=
 =?us-ascii?Q?h8E6J8aCyp34drpm84/68qLpnJrQ9JMizXmi0TNbXqS+O3CerPf1Baa2orUM?=
 =?us-ascii?Q?KGNf855QXi2llgjbCnfRCLUlkcQr6QR+zdQYFysejSnClLdQEzZulllJwwoA?=
 =?us-ascii?Q?ln8FNSa2EMb8SPAT1WMiRT4tTyO7h9R69doV1wOEQA90DvTfDmJESqZgUwIN?=
 =?us-ascii?Q?9eGywusZnnXsB0ydydEcKTGbJVWfWrWQZfK3M9ievP044AquG04LBhskCWGp?=
 =?us-ascii?Q?bckwZPyawRMZ2ee/330wIGhy9ntJOjF9IRKwTUbHBLtlEMgl3Qkg9uL0a0tq?=
 =?us-ascii?Q?K48aOgMMbCHZBgvansjWC5v93E77I7CJK5Ipm9nY09z20RZLoz+Cl7LPZk0s?=
 =?us-ascii?Q?TaBT8bH5w5Gx+Ob0fd4/hkR34sL7VNammKvm32pt0aaY5ft6Z69reQxxMqWd?=
 =?us-ascii?Q?YVKUfafqdSh5e8BJ32Zp2KeqNfzOOfhUYYRLj2RPV7r4qUYNReoXnjDVDK62?=
 =?us-ascii?Q?es06vM6Gi+zJ9UIdBeRPqFy5ftbX9hiK9UTitsH1YIyc0WEmlXSgBMEfTjAL?=
 =?us-ascii?Q?ohDcFCv3XriMMIqpoFvNtGhNm6FXXhGoRFSzN30KW9sTrTwivM8vb5Lhm4TQ?=
 =?us-ascii?Q?xsglxkKuR0DOo03r0yl+kZWarQWKHcR0HuBVoZZyk01WfG4IXTt8R/+AOQVA?=
 =?us-ascii?Q?I3AyLKOGtSeYCSmEzPhkBd2DhB7gF77A4BUMaqvCZu93Jpoxe78mT8BqQ4eB?=
 =?us-ascii?Q?GPmceJOBiXiD8R1aiFJk4+qkvq86gCPOpSL3u8Ylx0uX6qXVPjW02Oip/xju?=
 =?us-ascii?Q?G9Sx2b16Pkk+2625q6t59iIQ76tcBU/tMK6EPyGndE5OCdbhctYoJh6Hyyue?=
 =?us-ascii?Q?XMqfh/H3HQCqEy4Mx7AQ0qoAWM1AcriaX5HbuCUPCGVygBb+zsTLTAsfjw43?=
 =?us-ascii?Q?j8LOKJj3MDWniRUJcTMxEJU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c1dbad-a553-4665-40b5-08dd2b948f8c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 01:18:42.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NW8TtlEdX3oClwAzdXHam6zxTpcayQePPDQmUsi+q9H1nQuk34LxiEqsfni6QGaf+7UngKME71KDC+EHvfou+YP0NRuZbmSojEG7JDDasCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_171904_221067_307CFED7 
X-CRM114-Status: GOOD (  12.73  )
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


When rodata=full kernel linear mapping is mapped by PTE due to arm's
break-before-make rule.

This resulted in a couple of problems:
  - performance degradation
  - more TLB pressure
  - memory waste for kernel page table

There are some workarounds to mitigate the problems, for example, using
rodata=on, but this compromises the security measurement.

With FEAT_BBM level 2 support, splitting large block page table to
smaller ones doesn't need to make the page table entry invalid anymore.
This allows kernel split large block mapping on the fly.

Add kernel page table split support and use large block mapping by
default when FEAT_BBM level 2 is supported for rodata=full.  When
changing permissions for kernel linear mapping, the page table will be
split to PTE level.

The machine without FEAT_BBM level 2 will fallback to have kernel linear
mapping PTE-mapped when rodata=full.

With this we saw significant performance boost with some benchmarks with
keeping rodata=full security protection in the mean time.

The test was done on AmpereOne machine (192 cores, 1P) with 256GB memory and
4K page size + 48 bit VA.

Function test (4K/16K/64K page size)
  - Kernel boot.  Kernel needs change kernel linear mapping permission at
    boot stage, if the patch didn't work, kernel typically didn't boot.
  - Module stress from stress-ng. Kernel module load change permission for
    module sections.
  - A test kernel module which allocates 80% of total memory via vmalloc(),
    then change the vmalloc area permission to RO, then change it back
    before vfree(). Then launch a VM which consumes almost all physical
    memory.
  - VM with the patchset applied in guest kernel too.
  - Kernel build in VM with patched guest kernel.

Memory consumption
Before:
MemTotal:       258988984 kB
MemFree:        254821700 kB

After:
MemTotal:       259505132 kB
MemFree:        255410264 kB

Around 500MB more memory are free to use.  The larger the machine, the
more memory saved.

Performance benchmarking
* Memcached
We saw performance degradation when running Memcached benchmark with
rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
With this patchset we saw ops/sec is increased by around 3.5%, P99
latency is reduced by around 9.6%.
The gain mainly came from reduced kernel TLB misses.  The kernel TLB
MPKI is reduced by 28.5%.

The benchmark data is now on par with rodata=on too.

* Disk encryption (dm-crypt) benchmark
Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
encryption (by dm-crypt).
fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
    --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
    --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
    --name=iops-test-job --eta-newline=1 --size 100G

The IOPS is increased by 90% - 150% (the variance is high, but the worst
number of good case is around 90% more than the best number of bad case).
The bandwidth is increased and the avg clat is reduced proportionally.

* Sequential file read
Read 100G file sequentially on XFS (xfs_io read with page cache populated).
The bandwidth is increased by 150%.

RFC v2:
  * Used allowlist to advertise BBM lv2 on the CPUs which can handle TLB
    conflict gracefully per Will Deacon
  * Rebased onto v6.13-rc5

RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-yang@os.amperecomputing.com/

Yang Shi (2):
      arm64: cpufeature: detect FEAT_BBM level 2
      arm64: mm: support large block mapping when rodata=full

 arch/arm64/include/asm/cpufeature.h |  19 ++++++++++++
 arch/arm64/include/asm/pgtable.h    |   7 ++++-
 arch/arm64/kernel/cpufeature.c      |  11 +++++++
 arch/arm64/mm/mmu.c                 |  32 ++++++++++++++++++--
 arch/arm64/mm/pageattr.c            | 173 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 arch/arm64/tools/cpucaps            |   1 +
 6 files changed, 234 insertions(+), 9 deletions(-)

