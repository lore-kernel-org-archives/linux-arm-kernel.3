Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33BE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9v08zgF2abF8AUSksDE/rGVV8IQvtbEd0QrogbpZV8=; b=ef/bi1VUkh0d1Fh0jJti04bHrI
	dzTs+CiCXDa2E9mCoas0T943SDWbxl9CiGHpiy2aVer1w8N13K01Osy5aD1BxUPB9Ja/ZkcjpV8z8
	vNZofRDwZctQkZ9/laiE4I+dzS8XHdwoNpLNQ9XmFEGilSJR4eQvD99KLAHwt1t1+S2Hbv5diNHqJ
	ubQ6sCBz5zALHgmA8RurXDn5yLCXNh9Gpo9sSw4M8po9y1DsLU5zYzyv3x8hyOhHTpVSm1oUrltqV
	yg65oFPQCiiqLIcB0eg/ibVvOX9taIQb1FqFH00Fphrg4ShW0tignGrQ07aXyIJBemAWCfaiKmk3l
	/G2x/A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0UQ-0000000DPoa-3CYB;
	Thu, 09 Jan 2025 21:54:54 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW0Rj-0000000DPHp-08t5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:52:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMJ7M5sIAO3b3wpQwcsURFBVEK0fd48SZYI+0+q7+TQ/UvUn3mTfVOrSB/c2CP8YXRKFob9hmqhirXeC/wDd7bKnyt5t6Ur/xsVdtrGYvKnmskq8ixVDetO66P1dreuZs9Lu1ZO1c4GR0Zz3jHeI0lrWACjo4fJp/8EWKrO8S7+wZKAq+4bfXEtnPjZtSvdbVHMltnd3avaDhXHX+xm9EnoSdFGjVSn25tnJKuVVtbj33sw1xyh9FjXrsWPLC40SAVDquDDQWOvUjHBkVDvHP+Kh/FJGQWiB97aUsjOf2znOdDghvbQPm+y97UbeXjmBP6GV1yVybRNwfsYwyfUTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9v08zgF2abF8AUSksDE/rGVV8IQvtbEd0QrogbpZV8=;
 b=JJ2ATIbrked7JOGsIPwRCXapWS5PbYguhAioEccYUa90x8SqDjlQkbIgDrUWKKI0W7aA4mK5tQqj+J3nZ763G074EVi4OW5SnNr60KTTNRSrE7aDrA+NV8CQ2KQc/uyAI+M58QXb2MEyg5bMij8lDbEwtb8IK7V2tRI8aZPIwr+s/8tt323NdRBYb+nxYVdI5SQeEMnbXn6jbG3alIle7hXalu2PVn9lMyuIQLMJZAn82uaIYyDjsn39L6iKFqIxb0GUuI4W3DoZriQWLbkGXKD1aVQMBz/ps1Y3tyIq5RZksB2phltTZptgcDtzPgQW0/mypIDyXLfs+y2QAWnQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9v08zgF2abF8AUSksDE/rGVV8IQvtbEd0QrogbpZV8=;
 b=kca1QAfb3wVDVltsBPZPfVPWGf1C5StlWqHbiApTBsDaEWf4OsQQ3nnj4cabEaoZS73U4ESeVhxip9YMcNUPPm42vanHtOQCW6RImew/GNrmQ5+Cx/i7oHlZaHptoXIvJTt1hv2SHtDhJJXOCydgMl8OTqfBRJksIHqf+/Vas6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 SN7PR01MB7903.prod.exchangelabs.com (2603:10b6:806:34f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.10; Thu, 9 Jan 2025 21:51:56 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%7]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 21:51:56 +0000
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [PATCH] coresight: catu: Fix number of pages while using 64k pages
Date: Thu,  9 Jan 2025 21:53:48 +0000
Message-ID: <20250109215348.5483-1-ilkka@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0042.namprd14.prod.outlook.com
 (2603:10b6:610:56::22) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|SN7PR01MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e9e230-cc37-4360-5af8-08dd30f7d5f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tyy2oisKhWym9ZmgDdvEz00UolgqyZDrpfHQRkptSe7pprYLyqODLjZC4Zse?=
 =?us-ascii?Q?JfoMvpQF1JVeKxxsAAn9ndM/6gY2v9411/k5EpXk2XHTgQVWn0WvLUmE+bZD?=
 =?us-ascii?Q?Fmd/gCgQhiFE840mALOKXoVIkOtaCQMmxd+lzZ0qtoGO1SQ+BULWZxRbBSzg?=
 =?us-ascii?Q?Z2ePsT+d21WnKh+ycRRGAcKBkXZDBoRXlXfBbP0IepqTcW1kLUiC6EjeS3lf?=
 =?us-ascii?Q?bJk73W1yzNIKzxjng8tBHaP3Q/qvNgXtOVBsvZFGufR1V2lQhRNWEu1ODNdg?=
 =?us-ascii?Q?tM36hd/6lvxnaO7XyQa8uNIKHvAG2xhTbkz2hlEnRJU9EbhFl3Q1c+wP4sZq?=
 =?us-ascii?Q?j3YhTtzBoYta3GWC+4IZNuSHTD2TOKs/9pK1kBrucyEHT8yVxzU7vYyL3gLz?=
 =?us-ascii?Q?K6v9vlPG2LYciRScvwiA6CeqI/NKKawDmu1x66nlyhOK593WayrGIo898rMo?=
 =?us-ascii?Q?xKTuqUwy3YoliqDiVukgnvltvfTnNp/cUH/gXNmTUJgmWuiAW1PD6Gj9Dvmh?=
 =?us-ascii?Q?thTNFCwLzYqPf6n4ydWS8vmphMQzPTR7722AiwxLYBrP975LCUMJWXrrtg5D?=
 =?us-ascii?Q?lM0ls2ikZNwgsxZApJiGtGArbpHBI4E0pa5pVdRlmxIAhY7Peur44ckknY/1?=
 =?us-ascii?Q?376ktfWwUSSk9kovW+GccMsFDD503aPLig2dO+OFAsT2O1UCii/8yrCrzjBu?=
 =?us-ascii?Q?jsU/j8yCnGNEhtxwS9GmvzXPSKUuLyFnikRxUJJrlM50xPc6Q4iS8nkh/MGC?=
 =?us-ascii?Q?yJJ78/Zi0KLYiTTJQlR9MRCs9/MPUbHztmcxjzndYqZmRg1YuZ0yQTfmiO6Z?=
 =?us-ascii?Q?nwTp73FjrUz9WvIC8OoeF00a3f/7vjbiHccfinTWEjdYn2O9dKs/UHY9MsRU?=
 =?us-ascii?Q?LSfVJIOY/hfWRD/JiT84xB1z+BRbpr3x9YMnUHiOnYSpgec6/a8eRvKVTM6x?=
 =?us-ascii?Q?gWdm5nNPeb6hyWReGwmeOSdSMbsTon36uIPf7/HARVNfTXU25RFRjSZg/vKD?=
 =?us-ascii?Q?C0AWvKOWhczgz/ce5+RVK4YjvR5cSxG9GqtLxkEfzpdIYNuN/wJSAur7mx9l?=
 =?us-ascii?Q?S1R8F2s3yLvMoCKrR+/RcWBWnb0V8JF2ks8hbQRL4aTCz1rveKLqjoRy0qw/?=
 =?us-ascii?Q?E136Ih1IfBauBBHs1o/Bi1yoWtq2vnYVpAfX8yGBnZ32j29nbfDmN9CyeD6q?=
 =?us-ascii?Q?ynTFEeQZvT6Fo3B7Gr4q7Qayw3iBj0Ac0kcUBv2AJwsv212lxHK3qzFgpq3T?=
 =?us-ascii?Q?8BzvlKConn+/3LZFz1ppvVM2MdpwQIeqqBcjGxW3SEnEmkCnZhY3QXTCpI/4?=
 =?us-ascii?Q?JD2Y0dVo6ooQPrk03Zq/xVFDsptwJ/ACcXd1DYr5QS5Tc8v3ZGdxxGw+znT4?=
 =?us-ascii?Q?txPtI3c49vaXB7d1LWKORQE9zL7FNtTThtRJ4GadaZVBCJliiTtQzJGqBu3A?=
 =?us-ascii?Q?wEJ/AzhK9wzT8oPUQNnV7RTRzQ8Yxa6K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgnPbiJMnkMuj/M4ChHcqGwzYXnK7a/RVOqB3avUlxQdedFoJmDxMDqw7S0u?=
 =?us-ascii?Q?+IR3ok+xRCD7IcfQG6Zkh9fAtelyuI27DGe79eW78nDO7yms9X/AqvLibcSd?=
 =?us-ascii?Q?091KcYoA09VnaLc3R/6i3jdAeYt0e+3TpdGEUSWpDIGfE0s6JfTTXI+3RsQr?=
 =?us-ascii?Q?e9PBU4NuuwaefuJdPZhJkLMI32GzQ3ztP92LeG0mW83nahzdZm8twqp71ZOE?=
 =?us-ascii?Q?xB8uXLIt2ig75GobpPxvMhV0CzhuAu1OKxYRLiyiUjsgqstn8nj+sLBjh7Ll?=
 =?us-ascii?Q?aFR+qTpgYs+Zox7gDF4OK30TUTl5FJQlyRWujbsPoSKDf1HscyPNGQlF7t6g?=
 =?us-ascii?Q?S7eCqZ/aqlWtazFeM+BNF85N5RFjOyWCk6cYJCdwirQjdDnvEJxnH32ZE0gT?=
 =?us-ascii?Q?2oedUFp7LXza1hy91OgxeyW5UiVI7yFlb90aOAbQyTD4Kvh+nhlWGTm/mP4M?=
 =?us-ascii?Q?q8OiwPl2MfOf/mVh5z+T9aCDQIz15hJ61R4lkB6IECXAnz21JE9tv8ApsQWJ?=
 =?us-ascii?Q?4NIPdEyeN8+rkD0/qUdc5rmNdhC7HavnCEp32iUreQgMKXFmnMq9hSCoPz8n?=
 =?us-ascii?Q?87gxHS0fXTDimbTCt/lRyBPzmoi5bossCqcBqhOIaP67rH6bUzS1dbWG4gLq?=
 =?us-ascii?Q?wp/gx73Mq4ohzLCQDcF8faFPFnaJfvrWppTR9+CM1eepgpLYfCzFcItscD4b?=
 =?us-ascii?Q?m3fh79iBmo7fc7vgxcFn+CVifozHb/ev+bWRYvZBWcO91VlKg58P8zqsxbsr?=
 =?us-ascii?Q?cFeNj1O9nb4Kqo7tT9ssP8w3YtVWedqWMCoXJ3pfh/Vbcjgs/vRcllszeRib?=
 =?us-ascii?Q?pEPPZ5vO32XA24IL6ZUurCxrpDKdoPtBDwF9v5ye5DgIxf1m1T8S6zFFk4iX?=
 =?us-ascii?Q?USy9HgV6ilfh+DwcdWZ2eupcPPnpICQ3ZTCqvhYq4UGJzUVzUxPgh/nxRVq1?=
 =?us-ascii?Q?pC/Nw4gFYIX/awyYO/xkpuCFzHN0w6dp7mqb1qLIHxKlT/i4O3NyVX1gp+g2?=
 =?us-ascii?Q?yk04BmVpFJ/s2bkK5hFC4GOG5W44gTFQJ71/tMPt0nG4qumBnTO0dvKDqo7O?=
 =?us-ascii?Q?Y6u9ARLuYyPl7ANFVayyGz0IHuBhyhhsADtbiI6Ou3vr7zHySXnTX1XdWbMg?=
 =?us-ascii?Q?TFrPh5Fa96VLaVKVuQGNH+4NH1d4Cz9zkyX4s8781UQvIUnLJiQgCmGDF8wd?=
 =?us-ascii?Q?6kah41K/q7YZYBRw7f0vBCNFNFhsbBVsMT1elivh73XmyrqYSh/+xN5GcLAo?=
 =?us-ascii?Q?FCf/B8dN1VdEcr4mB1VK5ejOxfimkYK0YkXRngaVHCZ1Boqxl8awJnBhN0oE?=
 =?us-ascii?Q?1nr4lmG29EPNl8TTty3lADL0tCfujFuFcwvq1j1GRmvBA9FCTkFScx/PQE5y?=
 =?us-ascii?Q?v6Z6B3dVLeP8P9gE1CtEjm1qWNlzHUY8/1hhYR6GzT+4u9dVvxNZJ+h8prV6?=
 =?us-ascii?Q?c6baXtYoRkLBj2D3Bd47jh3BUkGdpcMyjQK6/RPVTkY75mjYKF5Fi0c+oLqR?=
 =?us-ascii?Q?Br2TrrYNSxfsKv46viNGv5tBhS+gweCDQK0xtNBQnviFjj2qIxPGQaS5Y2tG?=
 =?us-ascii?Q?9mCAfdwXF1Uj/kJh2DP3BZ1PyAiA71tGWDBzZdTbW76WritzRKH1LjFOH7NE?=
 =?us-ascii?Q?jFbJIAGiW3laEzYpprOUua0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e9e230-cc37-4360-5af8-08dd30f7d5f4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 21:51:56.2953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtCsVyWQViuBjHrKsbZgdfO3e+xMufUJ14v/UBB+9Ub2sscgR+p2HsbVm85VDw0C6ZfYP0LCVOpn97YIzLopK0Co27pJZzmQG1319Jww8fPV7kGooeeTBKATe9hFVYMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR01MB7903
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_135207_085492_69D5BF89 
X-CRM114-Status: GOOD (  11.06  )
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

Trying to record a trace on kernel with 64k pages resulted in -ENOMEM.
This happens due to a bug in calculating the number of table pages, which
returns zero. Fix the issue by rounding up.

$ perf record --kcore -e cs_etm/@tmc_etr55,cycacc,branch_broadcast/k --per-thread taskset --cpu-list 1 dd if=/dev/zero of=/dev/null
failed to mmap with 12 (Cannot allocate memory)

Signed-off-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 275cc0d9f505..3378bb77e6b4 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -269,7 +269,7 @@ catu_init_sg_table(struct device *catu_dev, int node,
 	 * Each table can address upto 1MB and we can have
 	 * CATU_PAGES_PER_SYSPAGE tables in a system page.
 	 */
-	nr_tpages = DIV_ROUND_UP(size, SZ_1M) / CATU_PAGES_PER_SYSPAGE;
+	nr_tpages = DIV_ROUND_UP(size, CATU_PAGES_PER_SYSPAGE * SZ_1M);
 	catu_table = tmc_alloc_sg_table(catu_dev, node, nr_tpages,
 					size >> PAGE_SHIFT, pages);
 	if (IS_ERR(catu_table))
-- 
2.47.0


