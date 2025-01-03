Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2A0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 01:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcFpgxYVxlx76/l27VZI9Cvvll5ZpH89pPXqzo19NP0=; b=35LdAgt4BdCKzCcdozT/XVVWuR
	zKJFhIrumjHBMA8Z3I4ZcA3dzlgYNumhBrVWTqkSnAXYNM5Pn/s59nO9Kb9aGDgr39Lxo85uylwuS
	3XpJpF+INPORdMdenMn+Z0hq2azUeDS9QXbyiEDjVPJyL5NFhxNjTpMVKD3ysIEVsGQUNRLNnM5wE
	Uk4sdYd3dzyLN7bIxJXlpo6X4CN4f4tXaJeI8eQD3ETx6Y9pr8RUTHbSrXxvaXOlT2mVkvMt1BD80
	8eBQDRDd0v0W1lYFiTp0FpwLBJnXz7Nrz9mxpHoCoHyClKzuCj9Zcbnbtbj5HArZ95g/3fWADXA0+
	LhzjjUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWMI-0000000BpDC-10p0;
	Fri, 03 Jan 2025 01:20:14 +0000
Received: from mail-mw2nam12on2071f.outbound.protection.outlook.com ([2a01:111:f403:200a::71f] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWL7-0000000Bp2l-2d85
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 01:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4a04b1KDUlTIuh2VDTwoFGno4TkyvSUJYvbZGwHEoMgL0cP/D0SHX9EsuTPz2dw0xGkDZLK6IWlgYF1N0T86WD4ih5JqXJhBYqY8XkMWeSLZF0KZ8tRPneyP3a4y+PPw6oS2dQDXwHldhBl17/6ttNxTDrN/pZo8YD1Gg2PdrQpVfDhXa65jgiTFeH5X6L/qEf7KX1ksBLHwHOQ9HPGxDOSHDd6YXLSMfDI9vOsT+6oyzY761WXlQCXsjukXmKCNhgqyCyDSMJhYmPqfmNFd6rNVuq3srBRSJ6uDZ+pGq78LXjvUPEcoCkWeHe3ZAiBn7raLmGTwZ48tzcrfxws1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcFpgxYVxlx76/l27VZI9Cvvll5ZpH89pPXqzo19NP0=;
 b=ku2GzhlmyKPgRFpyX0NNeQK8T7Z2kcin0WXzLn7GWP1pXUi90e+4uVoX9enhKAm8Kft6KJPuhaERzR0sk5AZKOm5VTcR5qI9M8KW/BgEQ7XPt58k4YlX9e8JBJ7cQRoD+P7/YeeQjDp95qGTe+4dCqENQdUS6x90TfcKAlr/zijEtrIDinZF4yioRuaigCfOai9fTPHpchTc1uQCRKqbI/cV7RtSICkPoATHm2f+H/QMWzkeHLoEtqm/Iph5V1bphl0+5hBTLLZL1V2m3UVVzcgG9byNlFk/azQmY7ZDHuWpY6iXnkffnWvLxbzzfNYRwhsvk9Rt17DZo6a7V7/UOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcFpgxYVxlx76/l27VZI9Cvvll5ZpH89pPXqzo19NP0=;
 b=NKZCyGgQdenqNFrkk82dGY+DXGPF7H8l/uF9Is9ByOBKaByQDq77ZJvaPSAE1/JMcQyR18r8659NJ16GHiU3JJsV67aFZrMmfn+IQmpNgFIg3ZNZ0/ujbSDSt0VvOW2Gc6mC1qS9n2fHepTDYqtONTjNB0Pf+UTMOUu33qR5Prg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 MW4PR01MB6164.prod.exchangelabs.com (2603:10b6:303:72::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.8; Fri, 3 Jan 2025 01:18:46 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8335.003; Fri, 3 Jan 2025
 01:18:46 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: cl@gentwo.org,
	scott@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v2 PATCH 2/2] arm64: mm: support large block mapping when rodata=full
Date: Thu,  2 Jan 2025 17:17:10 -0800
Message-ID: <20250103011822.1257189-3-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250103011822.1257189-1-yang@os.amperecomputing.com>
References: <20250103011822.1257189-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:806:126::25) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|MW4PR01MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 279f35a2-e833-44d6-8ef0-08dd2b9490d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HXbsVVZX9r4B3r8dXJCqltj36+JOMbWplEfTl/N7XkVlwInW+abA0Nu9q4ZK?=
 =?us-ascii?Q?nxl1pSuwHX+5eqJ6KeLebGGINzy7sLDapvkUxhX/VHVYQmiJFbvylvWA4NA2?=
 =?us-ascii?Q?LqAAO2XnZpKTIXKI6/nt/k79hoHXkINlS2jQAEmJL4q+pZyGS1/wcJwH9gub?=
 =?us-ascii?Q?8Ec269NlQcjpIyJWw7UencAGZvli9ioo0TIbbTdTwKOOuOQ9cIHlgdHq8I4q?=
 =?us-ascii?Q?30z1jsSOfBmL3wOpakrCJOnlovgm3LAV8+2B5v8GUnkOnWyuRgPCdhAKQJhZ?=
 =?us-ascii?Q?VFkn7E4xlk6Bcf/4InpbCVTTw6+26jxLmG2TmxC7OTTXmXwoewYTO37qqmUH?=
 =?us-ascii?Q?V16o74ULPwkgIQp4Enzs+U4C6V+dFjW8UtntUUI15QI76bkpcdqxG/KJPQF6?=
 =?us-ascii?Q?jUXR6beF/5B//bLT/tRP8L93RMEYdzZddMUcJk753RhI9mAEiSBoOodirqm0?=
 =?us-ascii?Q?zSl03HM52zV7Vmv9J9NcqRbA2JwCmK8xnHw/Gevn+p4sTG5wRm2J/Td+Sy/C?=
 =?us-ascii?Q?ofoV3qI6ePa6Mx8R5b25u4KgzUU7kTPhlhkCwQdHH0ybLeIhNQxNbAah1inm?=
 =?us-ascii?Q?gXeCPJKs4w1jbA3BBb8Aznmh4VPOdlEEuc/tetggzelT/d85UHLbZgUraVI+?=
 =?us-ascii?Q?oW7efj8hC+fQpA3sB93N2T9e/J56g4EvAol5mHxVqY66Xhu+CdoxyzgD6gKc?=
 =?us-ascii?Q?2lTPXEZWWx4kYWGIndEG+0d+ORbd3wRO92ntvUUx0EP2T6pWHBq6Gpwj2MuM?=
 =?us-ascii?Q?muM5ZihYrepmdL8FThCwpN7566EIWM59ftF+Wd85YqXg670wjbc7wDl1TpuY?=
 =?us-ascii?Q?Cz8iXDci4+cWrlDZLnbvnqZbk0o8N5wi6S67EnaaOjz2ahM7p1BaSENAzllK?=
 =?us-ascii?Q?f+rqeoqvyim6kkCXcce13YZ2SGliAavpZYWRjqvww1zqj9nsxyb1I0fdpw9x?=
 =?us-ascii?Q?HHDn6m66CPTz6vrBG4dbRl7SXva6uaLkhvOS6GWY3CtuXKa7GDhWyCyjDQwr?=
 =?us-ascii?Q?sLRV/7kQix7lAA/lYDOKcSLj1G6meOagwzm+QiN3HjkaCLZTALY+KiWuxASD?=
 =?us-ascii?Q?ax6SAHIaP4I6D6LHf0RDwt2NUqtERqnLpAG/S8WFLALHxOo3aD3AL4tx80l7?=
 =?us-ascii?Q?+LejEXwJWF1erdRrdKDc8X6OWhdnzX59772AiVkVP5EDdXQ4RoojB3r5QHnM?=
 =?us-ascii?Q?fp9utzX8oqRyqWuY9fhE1XaPZgaljW8c4Awk+aZx1MrpzaG2CmAC1Ufk+w1y?=
 =?us-ascii?Q?fmoR/SijsxwwLC9zHzxacj480l21fwu5b8ruNtO4iFgpS9OUDXx/XGAXVHoq?=
 =?us-ascii?Q?kBxphVX/ciO2rWbhGM0xgvYJSnKRbQ0GirykoNOOxK8+b4bHz8zVBeQG01m2?=
 =?us-ascii?Q?1/nHjW6E7QmN22rLGv7vrv2GsNCs4RRE2LrEFq/+DcenT1WW+1UarhHPZoEY?=
 =?us-ascii?Q?WRBY8PW5c2coBSr5OBe/1ZO1uyMuAV8V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3H/ZF11cwbBCkeLp1e9bJNHN+bBCkcIUZUWL2epxy0ijxDBIdkiBoYa3O7Y?=
 =?us-ascii?Q?OQh19JN0ytbDZUjvhfziQavvST8vhamx9kY/K68CtNfan0z4sBnYDRAk3+WG?=
 =?us-ascii?Q?i+ezYLhupLRJy82J2yRZ+BW4xeRYENLdjnM2lMTCEywuditfRYK0wCxoooe3?=
 =?us-ascii?Q?S5ihkmzpGzV3D31CKYOgvIFs8Y/vnjT55Paxm+zVfjLP4LsGt9sVOXiIVsFT?=
 =?us-ascii?Q?9DLTN45erC0Uj/pyhd9rCDb7Uj5IhddmhfnG1Z0NNEDeXAEiGZea16to4Xz8?=
 =?us-ascii?Q?G06lfPiWZvnYD9jnvUMWIV30XTqo7FimApS1PqRyFgZl+/mLskv6W1rVs4GA?=
 =?us-ascii?Q?GcDdLvJ9G4mcab+4sf95MOHdBSjIGgPsKJgYOB0EJ6M9hBSuNL/rjP+4lZE9?=
 =?us-ascii?Q?1VFXHbZNaQXxlDD3yhJtzr7stKI5qwfFt+0cWYDqBx813LZLa48v531ST51E?=
 =?us-ascii?Q?gHIarkf6eHm7yMnQCwR3/mULxzoCWllB6LTMRVXdcVx44T+iqh/2+dEeQC9i?=
 =?us-ascii?Q?o9Wje9SR0SE143WMQ1D1Lrn6eMOWNeXbCGlayyFKt7B4uAobwFeGGzsD0aJh?=
 =?us-ascii?Q?hJz5Y1Q2zDdm+oOz94zbr8XMkpl9BM+EEO7Gu1qV9CPm87n1XQ2haZRCHMAb?=
 =?us-ascii?Q?MufPB9KldXocxqS6BhYg9bDUyxEkxuAx+xQRtCFW5CrRylw3/e1QJqH2Wcu4?=
 =?us-ascii?Q?FlRaIej/YtGCVzqmBjEWznJhGrSq7m0UrGqjHXGrfMp9b/qD/vYgbS3c/nIc?=
 =?us-ascii?Q?cbjK4rLxj+udpOBKZuva+I5pYv3Yp4hBHlO3Q2izRtDqr1Hd+VoUSIQA6WxT?=
 =?us-ascii?Q?bSmN/dR3LIcc1BYXtoq8QbmGGKn8xitYRZ5za85RQukNf32CCNs+l5IeWLr9?=
 =?us-ascii?Q?NCAI2ekvoeHTLYgMkF5AfqwyXItlUKc4agp1S/gwfk+6wrpU2xxeSQxm5Pa6?=
 =?us-ascii?Q?QHywbZYYqZucCbIbW0o0mK66PJg73a26gNyEj8uxFYN4FfqmyCQ5FOX0koLM?=
 =?us-ascii?Q?8SaQuRE+WmU/rWoXvxdfwAdPn+cn1PN7qLHixggUUcd76QzTQyAAo9syNyHi?=
 =?us-ascii?Q?HCL0TgPNDvL+WMf8322XfRDZ0qImt75ahw9gSRe31xzPPqH7ZLnzal/gF9W3?=
 =?us-ascii?Q?0f+hxSchRzk8gDKEjmBLSmlJ0sJJIder0g5fMKW3dddI6dc4PUmto0lNZISt?=
 =?us-ascii?Q?qXSnENMFBkC4k98jfEGlyFmlhlijbLm6x/Y8RRpCzAVLcxdBicQFdb9IztB5?=
 =?us-ascii?Q?YsdoyHlA/0cQPVAMhINmbXeFGLiGTqZ4+/55O9qc7zQIXI12Q99Ye2flV3E4?=
 =?us-ascii?Q?/u36D/Z2Z6cy1/A7vOYJeHX/X8NDnaEpcYakt5yFp7kJ8675O1DVIovt1lPw?=
 =?us-ascii?Q?cmE1rKy2eBAI2LwK4Km8ndFn/Ys48ti+nuK3b2+PC4MFzPTT+qD818VNy27G?=
 =?us-ascii?Q?38Pilyq0PAHr7pnJwBitOmuh8+c4bKbzwFfCWEOweIMXQxFSZqlI64ScMpqQ?=
 =?us-ascii?Q?7xXbS2bY3Vn3/B3Qo+k2Q59DTds2qNR/sqbNwyHzB5iuYVGqqvayZyA+4zse?=
 =?us-ascii?Q?wY4eMuzvi8LJY2NE6uUOCg54PUqSHBjubjSEBv9fdfNESne1NUZcIBHjv2Ra?=
 =?us-ascii?Q?2cn01Zy9fCDaFsBpDjL/mTA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279f35a2-e833-44d6-8ef0-08dd2b9490d2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 01:18:44.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKiN/15qmqvTrp5bwukHuJeHDyAeoSzlCxIroVVNi1jhJqawccGZKOBUmMOsUZstL+a4k7UHCO05Cye9fK4JfvZqAkikqBahNLKvrbjjgSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_171901_711928_26A6E4D1 
X-CRM114-Status: GOOD (  22.80  )
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

When rodata=full is specified, kernel linear mapping has to be mapped at
PTE level since large page table can't be split due to break-before-make
rule on ARM64.

This resulted in a couple of problems:
  - performance degradation
  - more TLB pressure
  - memory waste for kernel page table

With FEAT_BBM level 2 support, splitting large block page table to
smaller ones doesn't need to make the page table entry invalid anymore.
This allows kernel split large block mapping on the fly.

Add kernel page table split support and use large block mapping by
default when FEAT_BBM level 2 is supported for rodata=full.  When
changing permissions for kernel linear mapping, the page table will be
split to PTE level.

The machine without FEAT_BBM level 2 will fallback to have kernel linear
mapping PTE-mapped when rodata=full.

With this we saw significant performance boost with some benchmarks and
much less memory consumption on my AmpereOne machine (192 cores, 1P) with
256GB memory.

* Memory use after boot
Before:
MemTotal:       258988984 kB
MemFree:        254821700 kB

After:
MemTotal:       259505132 kB
MemFree:        255410264 kB

Around 500MB more memory are free to use.  The larger the machine, the
more memory saved.

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

Keep using PTE mapping when pagealloc debug is enabled.  It is not worth
the complexity.

Kfence can be converted to use page block mapping later.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/pgtable.h |   7 +-
 arch/arm64/mm/mmu.c              |  32 +++++-
 arch/arm64/mm/pageattr.c         | 173 +++++++++++++++++++++++++++++--
 3 files changed, 203 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6986345b537a..2927f59ae9e2 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -749,7 +749,7 @@ static inline bool in_swapper_pgdir(void *addr)
 	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
 }
 
-static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
+static inline void __set_pmd_nosync(pmd_t *pmdp, pmd_t pmd)
 {
 #ifdef __PAGETABLE_PMD_FOLDED
 	if (in_swapper_pgdir(pmdp)) {
@@ -759,6 +759,11 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 #endif /* __PAGETABLE_PMD_FOLDED */
 
 	WRITE_ONCE(*pmdp, pmd);
+}
+
+static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
+{
+	__set_pmd_nosync(pmdp, pmd);
 
 	if (pmd_valid(pmd)) {
 		dsb(ishst);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e2739b69e11b..65b5b1ba48a7 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -620,6 +620,19 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
 
 #endif /* CONFIG_KFENCE */
 
+static inline bool force_pte_mapping(void)
+{
+	/*
+	 * Can't use cpufeature API to determine whether BBM level 2
+	 * is supported or not since cpufeature have not been
+	 * finalized yet.
+	 */
+	return (rodata_full && !bbmlv2_available()) ||
+		debug_pagealloc_enabled() ||
+		arm64_kfence_can_set_direct_map() ||
+		is_realm_world();
+}
+
 static void __init map_mem(pgd_t *pgdp)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
@@ -645,9 +658,21 @@ static void __init map_mem(pgd_t *pgdp)
 
 	early_kfence_pool = arm64_kfence_alloc_pool();
 
-	if (can_set_direct_map())
+	if (force_pte_mapping())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
+	/*
+	 * With FEAT_BBM level 2 we can split large block mapping without
+	 * making it invalid.  So kernel linear mapping can be mapped with
+	 * large block instead of PTE level.
+	 *
+	 * Need to break cont for CONT_MAPPINGS when changing permission,
+	 * and need to inspect the adjacent page table entries to make
+	 * them cont again later.  It sounds not worth the complexity.
+	 */
+	if (rodata_full)
+		flags |= NO_CONT_MAPPINGS;
+
 	/*
 	 * Take care not to create a writable alias for the
 	 * read-only text and rodata sections of the kernel image.
@@ -1342,9 +1367,12 @@ int arch_add_memory(int nid, u64 start, u64 size,
 
 	VM_BUG_ON(!mhp_range_allowed(start, size, true));
 
-	if (can_set_direct_map())
+	if (force_pte_mapping())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
+	if (rodata_full)
+		flags |= NO_CONT_MAPPINGS;
+
 	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
 			     size, params->pgprot, __pgd_pgtable_alloc,
 			     flags);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..ba2360ecb030 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -49,6 +49,145 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
 	return 0;
 }
 
+static int __split_linear_mapping_pmd(pud_t *pudp,
+				      unsigned long vaddr, unsigned long end)
+{
+	pmd_t *pmdp;
+	unsigned long next;
+
+	pmdp = pmd_offset(pudp, vaddr);
+
+	do {
+		next = pmd_addr_end(vaddr, end);
+
+		if (pmd_leaf(pmdp_get(pmdp))) {
+			struct page *pte_page;
+			unsigned long pfn = pmd_pfn(pmdp_get(pmdp));
+			pgprot_t prot = pmd_pgprot(pmdp_get(pmdp));
+			pte_t *ptep_new;
+			int i;
+
+			pte_page = alloc_page(GFP_KERNEL);
+			if (!pte_page)
+				return -ENOMEM;
+
+			prot = __pgprot(pgprot_val(prot) | PTE_TYPE_PAGE);
+			ptep_new = (pte_t *)page_address(pte_page);
+			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
+				__set_pte_nosync(ptep_new,
+						 pfn_pte(pfn + i, prot));
+
+			dsb(ishst);
+			isb();
+
+			set_pmd(pmdp, pfn_pmd(page_to_pfn(pte_page),
+				__pgprot(PMD_TYPE_TABLE)));
+		}
+	} while (pmdp++, vaddr = next, vaddr != end);
+
+	return 0;
+}
+
+static int __split_linear_mapping_pud(p4d_t *p4dp,
+				      unsigned long vaddr, unsigned long end)
+{
+	pud_t *pudp;
+	unsigned long next;
+	int ret;
+
+	pudp = pud_offset(p4dp, vaddr);
+
+	do {
+		next = pud_addr_end(vaddr, end);
+
+		if (pud_leaf(pudp_get(pudp))) {
+			struct page *pmd_page;
+			unsigned long pfn = pud_pfn(pudp_get(pudp));
+			pgprot_t prot = pud_pgprot(pudp_get(pudp));
+			pmd_t *pmdp_new;
+			int i;
+			unsigned int step;
+
+			pmd_page = alloc_page(GFP_KERNEL);
+			if (!pmd_page)
+				return -ENOMEM;
+
+			pmdp_new = (pmd_t *)page_address(pmd_page);
+			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new) {
+				step = (i * PMD_SIZE) >> PAGE_SHIFT;
+				__set_pmd_nosync(pmdp_new,
+						 pfn_pmd(pfn + step, prot));
+			}
+
+			dsb(ishst);
+			isb();
+
+			set_pud(pudp, pfn_pud(page_to_pfn(pmd_page),
+				__pgprot(PUD_TYPE_TABLE)));
+		}
+
+		ret = __split_linear_mapping_pmd(pudp, vaddr, next);
+		if (ret)
+			return ret;
+	} while (pudp++, vaddr = next, vaddr != end);
+
+	return 0;
+}
+
+static int __split_linear_mapping_p4d(pgd_t *pgdp,
+				      unsigned long vaddr, unsigned long end)
+{
+	p4d_t *p4dp;
+	unsigned long next;
+	int ret;
+
+	p4dp = p4d_offset(pgdp, vaddr);
+
+	do {
+		next = p4d_addr_end(vaddr, end);
+
+		ret = __split_linear_mapping_pud(p4dp, vaddr, next);
+		if (ret)
+			return ret;
+	} while (p4dp++, vaddr = next, vaddr != end);
+
+	return 0;
+}
+
+static int __split_linear_mapping_pgd(pgd_t *pgdp,
+				      unsigned long vaddr,
+				      unsigned long end)
+{
+	unsigned long next;
+	int ret = 0;
+
+	mmap_write_lock(&init_mm);
+
+	do {
+		next = pgd_addr_end(vaddr, end);
+		ret = __split_linear_mapping_p4d(pgdp, vaddr, next);
+		if (ret)
+			break;
+	} while (pgdp++, vaddr = next, vaddr != end);
+
+	mmap_write_unlock(&init_mm);
+
+	return ret;
+}
+
+static int split_linear_mapping(unsigned long start, unsigned long end)
+{
+	int ret;
+
+	if (!system_supports_bbmlv2())
+		return 0;
+
+	ret = __split_linear_mapping_pgd(pgd_offset_k(start), start, end);
+	flush_tlb_kernel_range(start, end);
+
+	return ret;
+}
+
 /*
  * This function assumes that the range is mapped with PAGE_SIZE pages.
  */
@@ -80,8 +219,9 @@ static int change_memory_common(unsigned long addr, int numpages,
 	unsigned long start = addr;
 	unsigned long size = PAGE_SIZE * numpages;
 	unsigned long end = start + size;
+	unsigned long l_start;
 	struct vm_struct *area;
-	int i;
+	int i, ret;
 
 	if (!PAGE_ALIGNED(addr)) {
 		start &= PAGE_MASK;
@@ -118,7 +258,12 @@ static int change_memory_common(unsigned long addr, int numpages,
 	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
 			    pgprot_val(clear_mask) == PTE_RDONLY)) {
 		for (i = 0; i < area->nr_pages; i++) {
-			__change_memory_common((u64)page_address(area->pages[i]),
+			l_start = (u64)page_address(area->pages[i]);
+			ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
+			if (WARN_ON_ONCE(ret))
+				return ret;
+
+			__change_memory_common(l_start,
 					       PAGE_SIZE, set_mask, clear_mask);
 		}
 	}
@@ -174,6 +319,9 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 
 int set_direct_map_invalid_noflush(struct page *page)
 {
+	unsigned long l_start;
+	int ret;
+
 	struct page_change_data data = {
 		.set_mask = __pgprot(0),
 		.clear_mask = __pgprot(PTE_VALID),
@@ -182,13 +330,21 @@ int set_direct_map_invalid_noflush(struct page *page)
 	if (!can_set_direct_map())
 		return 0;
 
+	l_start = (unsigned long)page_address(page);
+	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
 	return apply_to_page_range(&init_mm,
-				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+				   l_start, PAGE_SIZE, change_page_range,
+				   &data);
 }
 
 int set_direct_map_default_noflush(struct page *page)
 {
+	unsigned long l_start;
+	int ret;
+
 	struct page_change_data data = {
 		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
 		.clear_mask = __pgprot(PTE_RDONLY),
@@ -197,9 +353,14 @@ int set_direct_map_default_noflush(struct page *page)
 	if (!can_set_direct_map())
 		return 0;
 
+	l_start = (unsigned long)page_address(page);
+	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
+	if (WARN_ON_ONCE(ret))
+		return ret;
+
 	return apply_to_page_range(&init_mm,
-				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+				   l_start, PAGE_SIZE, change_page_range,
+				   &data);
 }
 
 static int __set_memory_enc_dec(unsigned long addr,
-- 
2.45.2


