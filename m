Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DEEC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1MuZdJSNWtnXTh2sShXeQNDuWfEmXZTJqNmfxJYjMI=; b=B2YuNUCXTL0IDkTHz3T6VOqli1
	UQ/QRjMC0sMa+P17idmrrvxwdBTcbSjboySEVEprck34DYrxLGQ6S/7OFqMRMLvyppBRIILmdYqrn
	6mFA9rw6h6IZCXLmNVriGvqJA3PZOUsT8a2yTi1FgNG051St2zOY2j9Tk3R92rc4NQNdqZ/3BggSz
	gimXUnoTyYkIj3n58Y2OXE67vg802kaAhCUkS8CD+Uutoa/6c+EYZ25WLUVWjEv2QWatBCjckJRRn
	pgRK+tz6tiPwE+ZYya4EE6mdWW+mgzMgrS6I0B8fAXwBWK55B78UH39lbNNsKZKlbC30CpcsYim48
	Z52Htbmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGH-00000000Z75-1zpy;
	Thu, 16 Jul 2026 21:04:53 +0000
Received: from mail-southcentralusazon11013054.outbound.protection.outlook.com ([40.93.196.54] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFS-00000000YAB-3wVr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/QcID6hF0qmN4P2ndtLQ2XogSLG5sUF7f9OjJuWy2rBufeU3/86Hlq4TxEXbS6MozbBXw+0FAJN5l4EfmusT5xbd7Ea5vWvurGwnKhteCmJh6vBK3r7e8QoJtny5w0wcZicVfSE/6IFPEEIc0E9ns2L+HC0wTb9a2kX/d/Br9E0nZYntJBA+Bi1e9AI3gZqDD7+xnp4m31G1sM7aSmH40X9FFpzw1DUNiK0ESAbKeshed0FuWjDeqPbzQb77JiO64TeWkcl0L7L3p20mTTnQkEZ2Ztsw7QNFi1nJ6H+NuF2BBIwSdgwuEA5Abd7rUIGiB02OuLYOqpDrNHhfS1cWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1MuZdJSNWtnXTh2sShXeQNDuWfEmXZTJqNmfxJYjMI=;
 b=okC6/w7jVgWga1Q4RVdGBPFFxId3PtzaFGryAAqyFI9DGsU4C+oCn8y7MxozaME09rTK+933WGObSc2c1+ElGSlZAT/4VgVoRbKrUcP0Yh7nFEJIPMYySmVxg3tM3nwjY/iZfE69FQB6kkHSy+K+mRilV0R0Tk1mD4KxKJQre7OA8GbuBTF1zwsBOfyDyHNiXVqkzv2AHFOtfVvynWeRNnFvyHHYMgORQ/uHsZjue7Ok00ryCb37eSlwI9V5cy/N15bhC9ssifFoYy4DojhcuvGRAAwA7ye93rRMawNb392bHIZanzIpO5P9pUI+KOR67ZSGRumEVLBkzUvQTwGVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1MuZdJSNWtnXTh2sShXeQNDuWfEmXZTJqNmfxJYjMI=;
 b=ERfFnft4/zWGWuiVmUO3aH2uWb6fZxaPZ52ZDMDDjeycJWD9eQ8wtCu8c2B7T2Z/nAZQA+rFoJ39tbkDUSEow3IDdEl0PPw6bvu4oAMulCBxHaNYWHhZtimX6R0j5XkBW+AeseZqzdcppyLfmJ885CbXSocifHJhkbLDkRzuLJGRIchwpu4hdMERqoPwtHckkJXzF2mcMv72XQMn0XaXeO3+YWUElNa01FDG4a4Q9v+YfeA4WOzONurirubEkBA2q30sVqc0auD4CIr4XGmUnLD8+RZiUGNiGE/4fwnG9hLyeyHNr2Ut8DkxWMSKmo/+ie+o1Dxrr8Y8Q3gDX0CvHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:53 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:52 +0000
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
Subject: [PATCH 17/23] arm_mpam: Handle CPU-less numa nodes
Date: Thu, 16 Jul 2026 14:03:07 -0700
Message-ID: <20260716210329.2914625-17-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 439fc4f8-eb23-4135-3884-08dee37dbd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: YMEgktTQ2vNbcukxBRgy/CnzisiL3/yEd6XZVUkPojDpZddz5K9ERJ0C78nDkt5ehH8ma31zkMk5M1aES4q4J6eEySf9csVlnM/N5w6ju3oOckbNEkvxWV9U1Q1slqABewwputWCajMJepLTKkHZ2TbnN99w/CWCImK1u3xoLFG9ALmq9Qv5wk4OdXFWgocnj9cy422cCgsbzdDtSDLQSG1TI7Rs0KlBm7vLo6d2IiZwCNDHv+Y93zKQDz6HvYxSeVWrFekpVwCagbBeQREzO2ZeRnbh4QL5SJEB1cmiwjJRH4I66JPUclEgvAeHzZGh+O1BSbEid5J3o6fggEZdBi6B83NlmhQ52Ohd0POwfhpkpUuAkycBp07rNys1K9KxpcyKb/V7j0fYQZZTnA+o4WrkNF+YXjnnaWX3sTWJVwTzLL4iajueM/R27uW38pcrZu/JeA8y/CtDWCmMbm22YzS8laR7IYJFdh1DFzwLxmlRqXARmcyiXpZBZKj4WpYPKYLJVQrxfrIS/MlBhxrOi8Q9Dl89iN7gVF+8eMTW870I8X+RwuXCxjEICx4+lkj+4vmu/AwEzS8FXDKRCHy1iGK7Broeh+G694dA1BIPlgE5vFkBZDYQ/YGe7YM7j44PB2tjAXD6U4pS8Y2U/vMZxUOq9a4SeL3r3gNxJRxjKSDmTK6b+IfzB54ziIfnsv5YeER+ArxpIfBuNJ5HybY3FA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ig32+sPsx20LvMu8SPIIBMRuTHNZq7Ma8Mi7NmD70ctaM24GuoOknzObxEeZ?=
 =?us-ascii?Q?9ngfapFYMi1JFaA6kB7P8cxoyoJZ4e9C5TK+QOs5jYhBj7H8E04wkbFlAsYz?=
 =?us-ascii?Q?VDqEuBx7EVfsQF0oIDzW6NAGuoiZNsxaCnqt07GY/nZf76JRLOyFJtGIHEAY?=
 =?us-ascii?Q?PR5B21o6zhJaGuXXeoefbi2OZfut0Hl/JxbU0FfgXHXirY/pv4dSt/JRJFuN?=
 =?us-ascii?Q?WQzVJ86EXdwJVGKfH2W2nkSB2k7eCIDGXYDlBl6sxFlMdQpCl1vAaT1I5rwl?=
 =?us-ascii?Q?HZRdIzPGIYDywt9HGqrxp9NrN6D1ISGW6GNCBPrHPjpyTl7nN3Dq9YsVU1EY?=
 =?us-ascii?Q?fhgL14xtqeNCZ2eslFFx8S9SiG87HK22hjdA9FEITOux87cvgWP/U95WBleh?=
 =?us-ascii?Q?oORQuPeuVLU1lhpkrD5vp/bUGaKq9+YTuJ5JFSkqPqq+8sH9hBL1z2eplZED?=
 =?us-ascii?Q?2TtNbX0Um5V+bgVowXbsBke09H5OCWv4TQpCzhEFmZFjcj/m6o5f1SpkAClj?=
 =?us-ascii?Q?k7SOv5sADPz6QxlUyZkyFr/4xyGAJ+d8ifIC1dS0eQ0dQL0HWxZoZbvYc2aa?=
 =?us-ascii?Q?Q+wpjimfJoTQYlhbpUnSiFbxJtVhnidkMosljLLfub61bmaos6eOoDU2hR6Y?=
 =?us-ascii?Q?s006jg23VRwcjn17N29CFUsP35wzlhi5CCRB1u7fUyDzaFS6Jw8QOvgs/Opu?=
 =?us-ascii?Q?WYtQIUhtgwT0qUrt3ZCUs1axoM3fkyfFyFwEqB0zRp6tn4FE/iPnEZOW5ahN?=
 =?us-ascii?Q?FlN1BO2TJ6MgiJFMdozQUd6r+6/5zpGySbNQxsCLNd7swiAHjUqLXSsYmHar?=
 =?us-ascii?Q?OlJkKBnzJ1pIFdCzjhHWAoCbRc2brf+QWEidxiTcMIMVB2mpiPQcFHAAABXj?=
 =?us-ascii?Q?g97SQLsz/dvYmeFafVAM47z55aZSwNfejc7IB6YoA7dX8yHHgR6but+B/NVU?=
 =?us-ascii?Q?gRs00jGYnr0AVe2nnFz7nKpKAh744pNJJA83XH0uGRIOj7gvlogJDbGoefIM?=
 =?us-ascii?Q?n4NJZevZvnVUNbo6e10UdTTmfe5ChHRk/6qZGDHArCxXNdPr1SXHAU1zqMPA?=
 =?us-ascii?Q?DYf5qjfCmAPDe3NjJkJyKr6J8pNGXFYGHnMogx2eJce92N7LC2ra4u0bAAyn?=
 =?us-ascii?Q?gO+Rkk6Lc75AXq3iBzXEAG+dvA8AMMPILesieZhCHTFle5H9Oh7FARRDQTM3?=
 =?us-ascii?Q?869rVKMOLOac84YM0HPF809N3GR6zUM3G2DIKaT0z3lORdo4vMVQMokEpXY7?=
 =?us-ascii?Q?0KrMrfqUfuXmwawybeHUzGHMHnhN613euUL1SIoNpn1mipwt3EDBA61doz1f?=
 =?us-ascii?Q?6xi0wHmTuXO5ad7XLtySqlAJFjrt1WKBcUt2BD2j6t7ITXBEOexqwOOAzAtj?=
 =?us-ascii?Q?Oiqw+y4tgDvwYIfJNn2VN/XBsqw5t+WbWD/uaGR4dJZeA9eMEdawZCMN8PX9?=
 =?us-ascii?Q?4lQwSHz3nQZer9koUvOAd7h09zGHi7mXSZ5GNE3R7ZI5dhQG24vOGVcqIZhG?=
 =?us-ascii?Q?gQOBSRj98wfFxxbK1aNvOCqbhoCHwFySGEJcilsNZxgc+/Tk1uM0aqYFBvGy?=
 =?us-ascii?Q?jNHlPAyNjhS/JypIhIETTc0lhcxhGyjfBeNYau6TzAprEwAZq8TccOxdp6sv?=
 =?us-ascii?Q?LssBqkRsbQ9h60WzI5RatgF0toPDPIYdGFXEIl3m6/p+ohXGK+/bpGqoL6/N?=
 =?us-ascii?Q?xDH/x50AmYYKTgW2l9PK6oEOVAbg7/wbR5TUqeuaQ1w1Pd2xt/36sbqFY6Gd?=
 =?us-ascii?Q?x6iIlbUJ/A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439fc4f8-eb23-4135-3884-08dee37dbd39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:51.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sExdIw0P2yjSB+dPP/pDUgemdrN6Tg64XzPorv/Ph4Yh5fg4IU31DXKLcX79Ivm79XXRmXu50djL8qPnJm5ulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140402_994958_A56B1D20 
X-CRM114-Status: GOOD (  18.42  )
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

On some ARM servers a NUMA node can expose a memory MPAM MSC without
any local CPUs (for example, a memory-only node that still participates
in bandwidth control). mpam_ris_get_affinity() derives affinity from
the component's NUMA node ID, so these MSCs end up with an empty CPU
mask and are never registered. Without a fallback, resctrl cannot see
or control bandwidth on those nodes.

When the derived cpumask is empty, fall back to cpu_possible_mask so
the MSC can be managed and traffic from remote CPUs is still accounted
for. Track the borrowed case with ris->cpu_less and keep that mask out
of class->affinity on create and destroy: those CPUs already contribute
through CPU-ful nodes in the class, and subtracting the borrowed mask
later would remove CPUs other live nodes still depend on. Emit an
informational message reporting each CPU-less node when this happens.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_devices.c  | 59 ++++++++++++++++++++++++++++-----
 drivers/resctrl/mpam_internal.h |  8 +++++
 2 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b69f99488111..cb6096e9d2cf 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -508,10 +508,13 @@ static void get_cpumask_from_node_id(u32 node_id, cpumask_t *affinity)
 static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 				 enum mpam_class_types type,
 				 struct mpam_class *class,
-				 struct mpam_component *comp)
+				 struct mpam_component *comp,
+				 bool *cpu_less)
 {
 	int err;
 
+	*cpu_less = false;
+
 	switch (type) {
 	case MPAM_CLASS_CACHE:
 		err = mpam_get_cpumask_from_cache_id(comp->comp_id, class->level,
@@ -528,7 +531,17 @@ static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
 		break;
 	case MPAM_CLASS_MEMORY:
 		get_cpumask_from_node_id(comp->comp_id, affinity);
-		/* affinity may be empty for CPU-less memory nodes */
+		/*
+		 * A CPU-less memory node has no local CPUs. Borrow the CPUs that
+		 * can reach the MSC so the node still gets a resctrl domain, and
+		 * flag it so the borrowed mask is kept out of class->affinity.
+		 */
+		if (cpumask_empty(affinity)) {
+			dev_info(&msc->pdev->dev,
+				 "CPU-less numa node %u\n", comp->comp_id);
+			cpumask_copy(affinity, cpu_possible_mask);
+			*cpu_less = true;
+		}
 		break;
 	case MPAM_CLASS_UNKNOWN:
 		return 0;
@@ -582,7 +595,8 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 		return PTR_ERR(vmsc);
 	}
 
-	err = mpam_ris_get_affinity(msc, &ris->affinity, type, class, comp);
+	err = mpam_ris_get_affinity(msc, &ris->affinity, type, class, comp,
+				    &ris->cpu_less);
 	if (err) {
 		if (list_empty(&vmsc->ris))
 			mpam_vmsc_destroy(vmsc);
@@ -594,8 +608,24 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 	INIT_LIST_HEAD_RCU(&ris->vmsc_list);
 	ris->vmsc = vmsc;
 
+	/*
+	 * comp->affinity must include the borrowed mask for CPU-less nodes:
+	 * mpam_resctrl_online_cpu() matches CPUs against comp->affinity to
+	 * create per-component domains. Overlap between CPU-less and CPU-ful
+	 * components is expected; each match gets its own domain keyed by
+	 * comp->comp_id, not by first-match lookup.
+	 *
+	 * class->affinity is different: it tracks CPUs with a local MSC in
+	 * this class. A CPU-less node borrows the CPUs that can reach its MSC
+	 * (see mpam_ris_get_affinity()) only so that it gets a per-component
+	 * resctrl domain. Those CPUs already contribute to class->affinity
+	 * through their own CPU-ful node, so folding the borrowed mask in here
+	 * would let mpam_ris_destroy() later subtract CPUs that other live
+	 * nodes in the class still depend on.
+	 */
 	cpumask_or(&comp->affinity, &comp->affinity, &ris->affinity);
-	cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
+	if (!ris->cpu_less)
+		cpumask_or(&class->affinity, &class->affinity, &ris->affinity);
 	list_add_rcu(&ris->vmsc_list, &vmsc->ris);
 	list_add_rcu(&ris->msc_list, &msc->ris);
 
@@ -612,11 +642,24 @@ static void mpam_ris_destroy(struct mpam_msc_ris *ris)
 	lockdep_assert_held(&mpam_list_lock);
 
 	/*
-	 * It is assumed affinities don't overlap. If they do the class becomes
-	 * unusable immediately.
+	 * A CPU-less node's borrowed affinity was deliberately never folded into
+	 * class->affinity (see mpam_ris_create_locked()), so it must not be
+	 * subtracted here: doing so would remove CPUs that other live nodes in
+	 * the class still rely on.
+	 *
+	 * Every RIS of a CPU-less component borrowed cpu_possible_mask masked by
+	 * its own msc->accessibility (see mpam_ris_get_affinity()), so these
+	 * borrowed masks overlap across sibling RIS. Such a mask must not be
+	 * subtracted from comp->affinity either: a component backed by more than
+	 * one MSC keeps a live sibling RIS after this one is destroyed, and
+	 * subtracting the overlapping mask would wrongly empty comp->affinity
+	 * while that sibling still needs it. The borrowed affinity is released
+	 * when the component itself is torn down.
 	 */
-	cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
-	cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
+	if (!ris->cpu_less) {
+		cpumask_andnot(&class->affinity, &class->affinity, &ris->affinity);
+		cpumask_andnot(&comp->affinity, &comp->affinity, &ris->affinity);
+	}
 	clear_bit(ris->ris_idx, &msc->ris_idxs);
 	list_del_rcu(&ris->msc_list);
 	list_del_rcu(&ris->vmsc_list);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index dfa3ceb734d4..1c9e0e8b78a9 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -369,6 +369,14 @@ struct mpam_msc_ris {
 	struct mpam_props	props;
 	bool			in_reset_state;
 
+	/*
+	 * A CPU-less memory node has no CPUs of its own, so this RIS borrows the
+	 * CPUs that can reach its MSC (see mpam_ris_get_affinity()) purely so
+	 * the node still gets a resctrl domain. When set, the borrowed mask in
+	 * @affinity must not be folded into the owning class's affinity.
+	 */
+	bool			cpu_less;
+
 	cpumask_t		affinity;
 
 	/* member of mpam_vmsc:ris */
-- 
2.43.0


