Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75300C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xK02MnZ0bNjfQEqZxhc3CY5sxSmQ60QwaGwDyIjUlY=; b=gdyYoyYBgv8j2WGuExVbWHFtRS
	g1nLJ72vrC5RVckgrvrWk7sGKbkiXb1hiHr9A8E3Q89bjiMZ6hgNyl0e8WDp1/y9oc80pfmEpoZHZ
	iLS4CWCWjGMVBNB2Zl9O2Rm+/LIpl8uwBH0r8nzgwFbAW2z2Ft7xodOVjWuuVH0wwhbppXfuzcspo
	CQ20U8mxN4qYFuWFaY1lHlJY08P4L0yC/USLwfIDbxGNeWvlg04vayfnO0x6xaMIw52lISWxli/5E
	Li55xaEfekpApRu8vq9tM3XAI+kZv5/frhLi3/Txtw0ML7UeF3c8CblC1OZnqOzqZPjzC1BJjDffw
	1uVLD8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFX-00000000YOZ-1KPx;
	Thu, 16 Jul 2026 21:04:07 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFQ-00000000Y2O-2ZGo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C07IIHXELQlL8PbxzzYf4MIrlvvpZBbN7hU1j4ZwxK/3iF+PBKI2Etnx8TH1rewVRFcklSq0sfP9FsjFS2PGxnXbIcfmMQ4HGtFd1E8PC8VcWSnHP0B3NY2deXI1azTYLSS96Qd6ZrMs1tvTRXlabaI5l70WLQMoWZjpQKqHFX954XkvxXWMMIj1+b9CNgbsWLyE3VTMlLj84SSUk/SQ/+o4MHpXFqObNMfGBdj/qxSX0CrdyKTgY8P6G0gE0qL6cfkwgzR2bhDRNmPowYGSTep019nFD9Oxbszw2V4YEGlV5Y2v8WDPhJpnA032L/mHYcphUD3Gd1LbmkqjmGO1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xK02MnZ0bNjfQEqZxhc3CY5sxSmQ60QwaGwDyIjUlY=;
 b=FZmxKa4Q49N3FaqCz5MyTZXIhZrR4dAE1vjlhODQ3qfip6PZ1ZHiJn+/qeJ9FAOt17weVH/ZSDSYDP+LbxWKpx7MWgIm026dvHvCpMmm1SpX/I7K9AL1Ij5N0pJDVSHY6BAVe0wcOYm8AKIpBc2jDddRsLif5vw/4XmVk8nju77CGTPQd51HnQapPYiZzQdaUzMl61fMKYvrMVPe7p/krslxJF5czrEywuaCKX5mjsvC/5QpPwjLdLZrfDHTzCzGGmBnyWii4IlICfMJp55/iQ49BrlCH3oZGC9q210mOFLt5jw3MBtzckQxVr+wSJRAeChse9Zy0X1qFcQ62cRUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xK02MnZ0bNjfQEqZxhc3CY5sxSmQ60QwaGwDyIjUlY=;
 b=m9GuhpUFATesXEfv/dWYt49iJTRyzbmZRC6Obrld9zrBLIXh3ZKNLq9ysY63BAJNGExJxYJJ9VqfYbQm3WNzugbQTCL/BsXI/DWbpjjZfT9yfQxPsYpMFTfg2LsVJuyxF3OX4DRiRhmqHoDd+j6T11FIoSncLTM7yJGE4o06c5xEh6Y4Em9QUkolxvG/3FhdRDrGPVqMbgwpmUaYrq+fNt8S8qzHr0IfpkbUIa9dCZeKYHKZf+vG7j1vuBdB7pGo568zsp3n0cbZuyTo/1sfwBJoTknblHIhnHl4fGXmFObO8ULLIJ4HjdSRm9DD+OiKixknERDoGYrfdhaNq+wI4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:48 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:48 +0000
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
Subject: [PATCH 14/23] arm_mpam: Support memory-level MSCs and ABMC per class
Date: Thu, 16 Jul 2026 14:03:04 -0700
Message-ID: <20260716210329.2914625-14-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: f96daa70-bc98-4e25-b92d-08dee37dbb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: k22D8lV6jgbntznRFXRY/D2Oa7+o8BzRjWdjMVUpI98GzzLJhe0lmO0Emma6PrKlcRt5Uz/q85Xqu3BsuySO8MKrqVAOK3O4N6ByqXSXgY1E87lufD0o70uak1tCeJw/lK9HLutw8FC8a8mTH595aKPTJ4rkzEUQE09viv6CMINZ7x7ZeuO0lTvz4ERY2SzC+R6VnoCN0eVVKP+GZIFJ+LrucHKNFCDrsQxqGVOU2vD32ryLYRDe+yUXkZdXTqGvk30gdfBto5UviOxwk5twIq/8Kkcmm9DlAfBRaeSN7RYtqJerujOtl8nAc6emczs3GmKZnXOLb8UjTAjSvuInFmBQOpSs8JZQnLHyfMSQyHQx1rgFHkWeN4uWLQ+hGgKo+0OOgR/rQh7k7Fdj8Zt1vF+Xdys+CWhyMBiNnqNy3RC5p4AigeTqB2prFcSQstrz/0YYN6N8RbPC0KYRYOdTvcFOhEWoNhLX4lotvP5heVzVqJouVgNkeTAIZ1wvyP9/HC3mIEImVVnl16LBwgPkWFQ4zdYWqbqplU3e6PmE6mMtWmvtBcVyFuNVWGX5wCmQOmQGGAK3jO0kz4r/3EO80FQ35bwLkFUeQXb7nrTSF53rPIJRhd5wVQbwq0a+7Mc/f++MziLPkV7IVe7iF7yZ65xidumyop+ArZiNzI8kp1cXYPMOooHdHIcdxSmxFywS2CbPR20CVFRPUXZi0pya2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M1D1KCYg70b3THPJiuu/YG2S6+aqmsRy3xi1tdTzYSDXMsUXHXh8jqLr878f?=
 =?us-ascii?Q?WyDbh27+7uU/qhenkaPM6Xn7JXqVcfsqAa7eOoXXTJ4i6DBuXkDqe9/9SXi+?=
 =?us-ascii?Q?ToiJFdw28ID7jdFaC1wxdt2S2dUJDh7sf5RO53dVFAuV5qXRV1csJmhFs1QC?=
 =?us-ascii?Q?z9oGQvrr7IfNLfj5uaxrXWgPJULUJxVSIIMknIAtryhg9jeRR9a23vAlOunx?=
 =?us-ascii?Q?nPxhFCENPx/4ezGNrAzTe6e6BJ7uDRy42mTXr5JP6iCYMsMS627aicEmO6Ec?=
 =?us-ascii?Q?YnXZvq1rNnrLEwuctPbPZpNlypm86GE0jnH0QR9wGBkmgorR4SaY6rUtyKyR?=
 =?us-ascii?Q?RFanCQ6IOSw8M0RTErvtzExMzUGqI+j8/I+bc1hyGYNTLHYiPBiaAeBdiCrx?=
 =?us-ascii?Q?sh9FCQub8sPHNWgGzRCNhsuAyz6XqR9erJtqni+ZRS5Z1IoxUkdnPEKzYDoj?=
 =?us-ascii?Q?FrP5mTV0U7Gw7EwGu2eWuMaKe12VOmFV3/sVIFU2hhZy3PnTliddN28hszJR?=
 =?us-ascii?Q?vZx+1yUiF7vkQ6hAxuq534vhxiKShxGYCbW+0UigtGIh9Tj2TLzewaX6u9N/?=
 =?us-ascii?Q?KGjA4IKkqpfQJSCXYM4pZlzzRvvG+SHRmHXageA1L9++iYyPJfAXXe0emMTo?=
 =?us-ascii?Q?p9W9BRTPLqRNkQ/VJELfzdh5nsdt6EG3dS+3ryccOqBk2QFcx81DOP3Lzqcz?=
 =?us-ascii?Q?oL/GAb7Z2B9eXYI9xwqyjyj666XiFD1BTozbYVMtaRXRCcm/4lBaLsD39wTp?=
 =?us-ascii?Q?dv1+vPI5NxSH9JtfS1vGJDXNvqqCZ8EaKUvZqcmI5bruj0laRnwXlV2bmczS?=
 =?us-ascii?Q?ZUJWsHAwEl9tblJug0aQaptFYJ/ZmktpSmlD2IEBbUFRxJ7rVaQYkNYz+Sp7?=
 =?us-ascii?Q?BHVXBTNUX4FzjmnsZPG5ipi6RPpYtMzC/VRPmoIEgDPo7RjS8FP9Cufq8x01?=
 =?us-ascii?Q?12PKB8Ga23L0kZqbp1m/1i5T5fmolIIvRKNU8rPlYJRATVQ3xCO/32M1bwYr?=
 =?us-ascii?Q?bV5KUs7740QG+rdDKbaPt6NDD5wVXfOMN57Uhy3sz2zpxT8fOTg64x++OvYr?=
 =?us-ascii?Q?KJoci5thArzKfeJB6k3ZyWzTGhdvriDN1LAncqMDx2szUY7bkiTxFzR2QP4L?=
 =?us-ascii?Q?iEUmN75JhfFnD2yLpNDYdjAonbWKOlm2lhAUw7rKgtNW+h7/ny+ZOljEN54Q?=
 =?us-ascii?Q?feEY1z9W5jIq+/fwmaF3TIfAsFFpQ02fkV7HEpA9zeuTUu9N3LQmB0BRA0FB?=
 =?us-ascii?Q?sEcfbOMHcE2zGH1Rncx5IFQ3MaEfaixt2sEr1dCufOOkDTR1KWAQIccTFRiP?=
 =?us-ascii?Q?Wm7q8HXrDZNZ0esHxZwHFQTuisRhU9CAGeYH3EXBzMjQKu0jYdCgmv/q4436?=
 =?us-ascii?Q?SUGFOMSAycSFUZ6Sm5Ad8hWd1jeDuXzvX6H8J5KUfCjCfemIrnupNHgpz4Di?=
 =?us-ascii?Q?nAPoYVbNaJalwvKjZ4LQMM+QShpsuIwsaxOiTQrEvh6ZfNdYpM/ef/Woowpl?=
 =?us-ascii?Q?a+LGgXovpG6dKbkpMfwT/VYsGbJy6YyxwPcBoGnujt1t3YosdSAhW4Og3nva?=
 =?us-ascii?Q?QMtQvrgqBcSnCUStiIAvAtgMwD2EkZtRhtC090btMXKXqbtCXXDDTgcoiwGM?=
 =?us-ascii?Q?ymBGiKgOQHCfuWkltFIjQn/j2SlHxqB0e6HMGc0jc2DBsxcB+mKn7Wpv5CUB?=
 =?us-ascii?Q?6Kla7qDOl67ygjMaBUvV8B1mySeaOaPcjNFg9FEz3ka+yM5PjCGtnCGHmZLp?=
 =?us-ascii?Q?jA3gt7696w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96daa70-bc98-4e25-b92d-08dee37dbb27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:48.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BocO4XWTjTkNWad3YDLyOTvYkIKkzLUVkWGrBvB94fGz6iqqnwh76l+STrY3C9JssoTv+thiwu+xHn1mn7kC5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140400_704507_D79386BA 
X-CRM114-Status: GOOD (  17.84  )
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

Some platforms place MBWU counters on a memory MSC above L3 while CSU
occupancy may remain on the L3 cache MSC. The driver previously assumed
all monitors and ABMC state lived on the L3 resource, which
mis-associates MBA counters, breaks mbm_L3_assignments when multiple
events share a class, and uses the wrong domain ID space for
memory-level MSCs.

Teach MPAM resctrl to map monitor classes to L3 or MBA resources,
initialise ABMC on the resource that owns the MBWU monitor, select the
node-scope MBM total event for memory-side counters, and test
mbm_cntr_assignable instead of inferring assignment support from
whichever monitor happens to share res->class first.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 112 ++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 31 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index e2cb3384820a..953412f11995 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -45,7 +45,7 @@ static struct mpam_resctrl_res mpam_resctrl_controls[RDT_NUM_RESOURCES];
  * to those supported by MPAM.
  * Class pointer may be NULL.
  */
-#define MPAM_MAX_EVENT QOS_L3_MBM_TOTAL_EVENT_ID
+#define MPAM_MAX_EVENT QOS_NODE_MBM_TOTAL_EVENT_ID
 static struct mpam_resctrl_mon mpam_resctrl_counters[MPAM_MAX_EVENT + 1];
 
 #define for_each_mpam_resctrl_mon(mon, eventid)					\
@@ -88,6 +88,11 @@ bool resctrl_arch_alloc_capable(void)
 	return false;
 }
 
+static bool mpam_class_memory(struct mpam_class *class)
+{
+	return class && class->type == MPAM_CLASS_MEMORY && class->level > 3;
+}
+
 bool resctrl_arch_mon_capable(void)
 {
 	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
@@ -121,7 +126,13 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
 {
-	return (r == &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res);
+	/*
+	 * mbm_cntr_assignable is set only when ABMC is initialised on this
+	 * resource. Multiple monitor events may share res->class (e.g.
+	 * occupancy and MBWU), so assignment support must not be inferred
+	 * from mon->assigned_counters via a class lookup on the wrong event.
+	 */
+	return r->mon.mbm_cntr_assignable;
 }
 
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
@@ -170,24 +181,41 @@ static void resctrl_reset_task_closids(void)
 	read_unlock(&tasklist_lock);
 }
 
-static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
+static struct
+mpam_resctrl_res *mpam_resctrl_res_from_mon(struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+	struct mpam_resctrl_res *res;
+	enum resctrl_res_level rid;
 
 	if (!mon->class)
-		return;
+		return NULL;
+
+	for_each_mpam_resctrl_control(res, rid) {
+		if (res->class == mon->class)
+			return res;
+	}
+
+	return NULL;
+}
+
+static struct mpam_resctrl_mon *mpam_resctrl_mbm_total_mon(void)
+{
+	if (mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID].class)
+		return &mpam_resctrl_counters[QOS_NODE_MBM_TOTAL_EVENT_ID];
+
+	return &mpam_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID];
+}
+
+static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *r)
+{
+	struct mpam_resctrl_mon *mon = mpam_resctrl_mbm_total_mon();
 
-	if (!mon->assigned_counters)
+	if (!mon->class || !mon->assigned_counters)
 		return;
 
-	l3->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
+	r->mon.num_mbm_cntrs = mon->class->props.num_mbwu_mon;
 	if (cdp_enabled)
-		l3->mon.num_mbm_cntrs /= 2;
-
-	/*
-	 * Continue as normal even if enabling cdp causes there to be
-	 * zero counters. This avoids giving resctrl mixed messages.
-	 */
+		r->mon.num_mbm_cntrs /= 2;
 }
 
 int resctrl_arch_set_cdp_enabled(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
@@ -393,6 +421,7 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
 		return mpam_alloc_csu_mon(mon->class);
 	case QOS_L3_MBM_LOCAL_EVENT_ID:
 	case QOS_L3_MBM_TOTAL_EVENT_ID:
+	case QOS_NODE_MBM_TOTAL_EVENT_ID:
 		return USE_PRE_ALLOCATED;
 	default:
 		return -EOPNOTSUPP;
@@ -1149,7 +1178,10 @@ static void mpam_resctrl_pick_counters(void)
 			 * and it's equivalent to mbm_total and so always use
 			 * mbm_total.
 			 */
-			counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
+			if (class->type == MPAM_CLASS_MEMORY)
+				counter_update_class(QOS_NODE_MBM_TOTAL_EVENT_ID, class);
+			else
+				counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, class);
 		}
 	}
 }
@@ -1176,7 +1208,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 {
 	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
 
-	if (evtid != QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (!resctrl_is_mbm_total_event(evtid)) {
 		pr_debug("unexpected event id\n");
 		return;
 	}
@@ -1193,7 +1225,7 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
 	}
 
-	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
+	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
@@ -1291,10 +1323,10 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
  */
 static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
 	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
-	struct rdt_resource *l3 = &res->resctrl_res;
 	struct mpam_class *class = mon->class;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
 	u16 num_mbwu_mon;
 	int *cntrs;
 
@@ -1305,6 +1337,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	}
 	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
 
+	res = mpam_resctrl_res_from_mon(mon);
+	if (!res)
+		return -EINVAL;
+
+	r = &res->resctrl_res;
+
 	num_mbwu_mon = class->props.num_mbwu_mon;
 	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
 	if (IS_ERR(cntrs))
@@ -1312,12 +1350,12 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 	mon->assigned_counters = cntrs;
 	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
 
-	l3->mon.mbm_cntr_assignable = true;
-	l3->mon.mbm_assign_on_mkdir = true;
-	l3->mon.mbm_cntr_configurable = false;
-	l3->mon.mbm_cntr_assign_fixed = true;
+	r->mon.mbm_cntr_assignable = true;
+	r->mon.mbm_assign_on_mkdir = true;
+	r->mon.mbm_cntr_configurable = false;
+	r->mon.mbm_cntr_assign_fixed = true;
 
-	mpam_resctrl_monitor_sync_abmc_vals(l3);
+	mpam_resctrl_monitor_sync_abmc_vals(r);
 
 	return 0;
 }
@@ -1325,8 +1363,15 @@ static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
 static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 				     enum resctrl_event_id type)
 {
-	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
-	struct rdt_resource *l3 = &res->resctrl_res;
+	struct mpam_resctrl_res *res;
+	struct rdt_resource *r;
+
+	if (mpam_class_memory(mon->class))
+		res = &mpam_resctrl_controls[RDT_RESOURCE_MBA];
+	else
+		res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+
+	r = &res->resctrl_res;
 
 	lockdep_assert_cpus_held();
 
@@ -1353,8 +1398,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * monitoring class.
 	 * Setting name is necessary on monitor only platforms.
 	 */
-	l3->name = "L3";
-	l3->mon_scope = RESCTRL_L3_CACHE;
+	if (mpam_class_memory(mon->class)) {
+		r->name = "MB";
+		r->mon_scope = RESCTRL_NODE;
+	} else {
+		r->name = "L3";
+		r->mon_scope = RESCTRL_L3_CACHE;
+	}
 
 	/*
 	 * num-rmid is the upper bound for the number of monitoring groups that
@@ -1364,9 +1414,9 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	 * this does mean userspace needs to know the architecture to correctly
 	 * interpret this value.
 	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	r->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
 
-	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
+	if (type == QOS_L3_MBM_TOTAL_EVENT_ID || type == QOS_NODE_MBM_TOTAL_EVENT_ID) {
 		int err;
 
 		err = mpam_resctrl_monitor_init_abmc(mon);
@@ -1374,13 +1424,13 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 			return err;
 
 		static_assert(MAX_EVT_CONFIG_BITS == 0x7f);
-		l3->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
+		r->mon.mbm_cfg_mask = MAX_EVT_CONFIG_BITS;
 	}
 
 	if (!resctrl_enable_mon_event(type, false, 0, NULL))
 		return -EINVAL;
 
-	l3->mon_capable = true;
+	r->mon_capable = true;
 
 	return 0;
 }
-- 
2.43.0


