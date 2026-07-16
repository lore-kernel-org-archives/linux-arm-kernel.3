Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C08C44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mt6w3nNPt5eTEjxALSsmFV2SIS6f1GIhUdZmSb1EESA=; b=n+FvwXh28/5RISg6DL6uvl0DiO
	aJKl2EUChPqf6tqN+v2JhAkts5kNnoHXcKkDQQ0ZiXV72976pN65/OegR5KNo29ONH2QYhHTkw7XR
	NDJOi8jayRQIZ5g3TVC/SA5waKCvhRcoMbxICAKIpaxfutMzLWu2QhBRe+n+D0ti24MI7+pqLhkb1
	mwKgACPryzb/KzV7oKXWkXPig9Fdbiu3BnAaEXSFFOwi3PJXxzG5vx5byNWANhc7DewS6L7a5x6+/
	aux21x4L1hDkIJ+0JeK9Sc6BhHRJjtAXEAAVnkA8vFvr5EVynMSARN94pI4yXxuIePrjPQ5hdBJaE
	sNs6syMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFT-00000000YGa-0W4X;
	Thu, 16 Jul 2026 21:04:03 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFE-00000000Y2O-3SGg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liH/KQ3mnql+9NPhADZaVoxJk12HkhaTvYfpZsQpdOPlRU9Ax8kjDBAR+8giDt4T79bTTnwsijPCHQq5qIDWaO0b93U18rXHYnDRYM1Uv4+5ClpEvfY4cNaxd0AeW2cow/o63JHEVq8Lb/1pZieyqlgOK9vO3AWYOnCdKfUH4zeCl6J9FKXT+tjDugoYsHBGWD3UgDhv1Wr7hHhJVGaK3UUQ7aD/R6FTEpVBSxDbogkyfKo0jWcw4KpDLPDw964oWzN1xS3Y+GR6lZeiMlhDAxg8hJHFz0eS1zo3FMt6JjfCqzcNxb7SfSGMui95B00prfUw6W5Dc51FryHVAH/aWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt6w3nNPt5eTEjxALSsmFV2SIS6f1GIhUdZmSb1EESA=;
 b=fEcLkNrks2DhA5z/toSLnQMxJRWiW321Cna1+lBEepbNmJ0fp0N+/ChV3kV2RrtpVvVKRV8VElMFgGENSSVy8x69eWpXWE8VVT6amU1wDaCYRhiVXMTQNDuO5b26ik/QEjKmY5ejxepULi6LLw+L6tb1VElHzLlcUnpyJ2UNW626ZdV/koOfAoBsxIQGJtGZpW4u5AvtLL8/HH+NScVc4/dy2+IY8qxQw1h8FkinS9Ile6K3dDPgqMzR2gtuwOI/dkdnvUbLAHPzxc1RbWdpKHF7pjp5FX9axnGOt1ZlDWL3PhGVs6CQGfGz19xEsD6pstHM1acjOKX8zXW3XOayag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt6w3nNPt5eTEjxALSsmFV2SIS6f1GIhUdZmSb1EESA=;
 b=qnoC0+BcPvTPAo9r2SqtnkYEOfYA5aFSVr66iOIyCk+tE/IvLSYLbo1Aj3Rsbbnj8ZNOo11b4u6Rcp4anT5QoIkUgIRg+4AXzCPBE0T20CsgoDffkthku/xKeTD50VyniKbjf4ov9IHW0LjWYR01zL5Tn79E24NO3Tp3GZLGD6TvN/NIuUOLVNvK17Ew5+LUcvh2FnfAiLhLrGayxr0eLh0qhtgpoSqdtNvdk2rIEtVbQcUOelp9EfFCPNYNytc0284kJwUun2PKakj91qwwrX+oZMVZ9LAxAOaKgmzsuPq2Dla+aGS/kDTFF03UMVxh6EvahQx5s28/5Cuttc5ZeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:37 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:37 +0000
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
Subject: [PATCH 06/23] resctrl: Mirror schemata for controls without MBW hardware
Date: Thu, 16 Jul 2026 14:02:56 -0700
Message-ID: <20260716210329.2914625-6-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::18) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdb1fe1-a82a-4956-58c7-08dee37db4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|3023799007|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: zimudT7u0z/EYJBkKqT7b+3FuO9RBmUiUmYs4cex3SFh7etNPd/ToSHzRp1SwoE9aNfDoSkDwg4w00uQB8VkkMcim6GUarkkOlZdVud4ihgvoJQC15w/1v1x2ihMxA/mMiBeOsms0w1820eNJUz8lygJiVuDK0U4C/voFv4R+1yXXpoB0RADyAswrlCwDEXVFfxCslW2ECLcmfRGplXKlkLxxEFfAXZjmfsMtCMQhY4tPickP0Y7AID9zISNpKLhLZWaY8FNL3JyH7118kpaZAcuCJ+rRV4qqxSj8V1dqilPq+kL3mY7TbbPFbNkkUCvHNmKIhLEOWtaTWstGWAQjfDi23rqgrkEpRCfk+HKVUzJ+UbhQdml/yI+NGXXFEOwdxVftoMhFVFCxd150LxVAAAHHRF7xJOXCDMITNyGBEyZIVnWBbeFPBzXkN5KV6Z+trW/YuH/9k/LyZmjPX4qqXXM4ezp4GhC+xFiIpQRhtj2abrNuf0owE97MtvGxN6+oyICLgCJXH1UGK0M83z3HISD51/21SGXGPyucOISXgCK7DVjufvbHQahJPDJY972PSESgVDY9K1AEnUon2x4JKmprvRr1UX9TD0XMxE5V/ecG3k/aLYI1989jOPO0lSfCgqbGpPTK0OirI7w6mZlw5ExWan7ODQ5vW4/vts1c5Dv67tLZg+rmHEqtYKI7ETjnBKMDkiEqiFMMjGnKe3DHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(3023799007)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iYeGrKsZC4+/sKY6tCsWHArXBPeo4luFE5F3yYRDqoftehyB8VIv4nc85/Ud?=
 =?us-ascii?Q?S+fljNOPAqfX84Hu0YXphMmxBoPHTR8/e+zXPYmAft7xy25lLfC1oXviJclv?=
 =?us-ascii?Q?sx6pd8W6dvQIpOMUV6hrYak6TSyINpNCTCkUqNW+JuFn0UuSpXBPoMoOrXAu?=
 =?us-ascii?Q?3bBPscpQ7eFXQEBRyHzKpiqEZK+TFVSjMqWkkeS8etKyZbl476BKZMOnTnwJ?=
 =?us-ascii?Q?rk9nEn1uM/rIksXkrda9TjDcbeKhISvvrH9sMFPAwtz7SYl0zZ1abg55dVw8?=
 =?us-ascii?Q?J/MzjZQ5rqa1wXbwSYG8UwfdWBvcWozeaCGt1dhTWJepoLu3HV3P5qFH/Ze3?=
 =?us-ascii?Q?7CzZQTQHD6jd/4kNMkM0OHCch5Xgh420ABenMVG6Z7CmqoEF17cJzPrt7UQX?=
 =?us-ascii?Q?ptR91FylRO6p4t3Z/23Br3zSwLboFwHMfkmG79MAhqnlKDTNHVquFkVmteLx?=
 =?us-ascii?Q?pCEmL5X/ZquO1HwjruYpZBgmQx/nycfMheki+lx5vGZb5ZyC+y++yFF7X1MW?=
 =?us-ascii?Q?fv5xkeelbQxyknTlLaXzy5j9XLcbtzqiXG9O2rR3E0Sv3CPVIFgR9xbndSu/?=
 =?us-ascii?Q?rFvP4yR9HIwS+Ug4SGKhdTh23SMwYc+3DW2qCZNdWnB3/YA5lFbzd0L7cZmQ?=
 =?us-ascii?Q?mv2DCzJlGuNEFSIz0OfNGU2NrIIWPzlPkddcF9xywCadb8OfJmVK3VhXxzBE?=
 =?us-ascii?Q?gngfPsyv3wGcyL1GxQI12r2ngOKt38pSzcUIt2uj2IKfV6FccGZvpy2Qm+XF?=
 =?us-ascii?Q?VDQnHIIZ/2HMoX+OJnflcvSgW1ASv021e/hgoeMwAK6mUMMT7qD3JSjxE6qH?=
 =?us-ascii?Q?8kQqxrn1TWMGq7tN/C6aOxXjjtMY954Boxid7KM/O9RJR+iRr2+79RDSJ+3H?=
 =?us-ascii?Q?B9H7l5qHBvx1IP+Q2hXBYmY44xkBXcjyB0oLGOZpFqzs3X7xpw/nNrmmqCMl?=
 =?us-ascii?Q?Bds6nOv43iwKFVfLjapc27CWZ/VTmZSmCN/xYWm1GWLMqG7XAxFH/vL53pcZ?=
 =?us-ascii?Q?2S/M//BF9b6atxg5rbxhRtV1qhDzBVXb1YpSZbbyo1zMluxqDHJ02ikiziys?=
 =?us-ascii?Q?PwNYJGJplkiUxSRiY4IKC0VEaGOlDF21xEBE56A44NlAoMmlxczoZMs1gDTQ?=
 =?us-ascii?Q?y8YllzaRudwtzMF05YnGafMYIxGgH4zhYJQahbguhjCNjSTb4Tte2HkEcniJ?=
 =?us-ascii?Q?h7ZECsW9b71phCSRlhRXBwVCZLvXNAZorRSDTarzr7YwwE938j9PoA7yd0KU?=
 =?us-ascii?Q?YJfrDBunUEZreUqgXcWruN3EomB9+XDmNNofr3u4oorD9dBO+zDf8xcXNEmX?=
 =?us-ascii?Q?0q0EMykKsWP3aC74CU9NajVRur6vyPoYrCHLYXEttr3ONxunSVrJkHs1TnKS?=
 =?us-ascii?Q?lAB2xNXMMx+9MgCQGHgZZ8Y3Ku2cwhcten8lFzv1VIv9KX43swpqlWrIPBoN?=
 =?us-ascii?Q?y/IxjsSTupbOQLTIkFm9C70xkqeZZp5rCfutvpPvrF6kPl8i6px4MUSnFsap?=
 =?us-ascii?Q?XvkYxV1/TSZHjjaCCCkQDGD65WqV2+8jSNLAG/v2fbQ9bgyU/wvk2POx8Rna?=
 =?us-ascii?Q?RqaDAkZCt2/4l3SqAYGm4NqShiitYP4zOGXOhOgmhVlyHdV/uQgQD67XoMb/?=
 =?us-ascii?Q?9O5SefAegMYtQyyUbbvz7t9aEpVTPepFLpG89wlSvKwu3r4LSFSdxJmG119/?=
 =?us-ascii?Q?e6fMk3LKJDbKhA6YSDxsVIxeJ8cBGxsEr9U1AZ3jlKll+DodOmtvnV07FfM1?=
 =?us-ascii?Q?aqM3RWRDew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdb1fe1-a82a-4956-58c7-08dee37db4cb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:37.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgzI3Ew+Z/0lOH+AxOoseuIfUdyZYBi5f75X2Blgk9IFvorhE/JsjeRefrPs1JuW7LtknNqTem7xyFwd+6JoBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140348_930360_E2F11E67 
X-CRM114-Status: GOOD (  20.66  )
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

When an emulated control has no MBW hardware of its own, redirect
schemata reads and writes to the backing control so both lines show
and update the same value.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/ctrlmondata.c | 93 ++++++++++++++++++++++++++++++++++++----
 fs/resctrl/rdtgroup.c    |  1 +
 include/linux/resctrl.h  |  6 +++
 3 files changed, 91 insertions(+), 9 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 1f832a838115..ee7823cf9493 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -28,6 +28,13 @@ struct rdt_parse_data {
 	u32			closid;
 	enum rdtgrp_mode	mode;
 	char			*buf;
+	/*
+	 * The control whose schemata line is being parsed, before any
+	 * redirection to a backing control. Used to distinguish a real
+	 * duplicate domain from the mirrored write of an emulated control and
+	 * the control that backs it.
+	 */
+	struct resctrl_ctrl	*line_ctrl;
 };
 
 typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
@@ -105,7 +112,7 @@ static int parse_bw(struct rdt_parse_data *data, struct rdt_resource_final *f,
 	u32 bw_val;
 
 	cfg = &d->staged_config[f->conf_type];
-	if (cfg->have_new_ctrl) {
+	if (cfg->have_new_ctrl && cfg->staged_ctrl == data->line_ctrl) {
 		rdt_last_cmd_printf("Duplicate domain %d\n", d->hdr.id);
 		return -EINVAL;
 	}
@@ -118,8 +125,18 @@ static int parse_bw(struct rdt_parse_data *data, struct rdt_resource_final *f,
 		return 0;
 	}
 
+	if (cfg->have_new_ctrl) {
+		if (cfg->new_ctrl != bw_val) {
+			rdt_last_cmd_printf("Conflicting values for domain %d\n",
+					    d->hdr.id);
+			return -EINVAL;
+		}
+		return 0;
+	}
+
 	cfg->new_ctrl = bw_val;
 	cfg->have_new_ctrl = true;
+	cfg->staged_ctrl = data->line_ctrl;
 
 	return 0;
 }
@@ -185,7 +202,7 @@ static int parse_cbm(struct rdt_parse_data *data, struct rdt_resource_final *f,
 	u32 cbm_val;
 
 	cfg = &d->staged_config[f->conf_type];
-	if (cfg->have_new_ctrl) {
+	if (cfg->have_new_ctrl && cfg->staged_ctrl == data->line_ctrl) {
 		rdt_last_cmd_printf("Duplicate domain %d\n", d->hdr.id);
 		return -EINVAL;
 	}
@@ -228,6 +245,7 @@ static int parse_cbm(struct rdt_parse_data *data, struct rdt_resource_final *f,
 
 	cfg->new_ctrl = cbm_val;
 	cfg->have_new_ctrl = true;
+	cfg->staged_ctrl = data->line_ctrl;
 
 	return 0;
 }
@@ -238,11 +256,50 @@ static int parse_cbm(struct rdt_parse_data *data, struct rdt_resource_final *f,
  * separated by ";". The "id" is in decimal, and must match one of
  * the "id"s for this resource.
  */
+/*
+ * A control can be emulated by another control (for example the legacy,
+ * resource-wide MB control emulated by a node-scoped bandwidth control). When
+ * the control has no MBW hardware of its own (membw.no_mbw_hw), reads and writes
+ * are redirected to the control that emulates it (emulated_by) so both schemata
+ * lines show and update the same value.
+ *
+ * Emulation is only performed in legacy mode. In native mode
+ * (RESCTRL_CTRL_NATIVE) a control without hardware is left as-is, so a
+ * disabled control is not emulated by another control.
+ */
+static struct resctrl_ctrl *resctrl_ctrl_backing(struct rdt_resource *r,
+						 struct resctrl_ctrl *ctrl)
+{
+	if (r->mode == RESCTRL_CTRL_LEGACY &&
+	    ctrl->type == RESCTRL_CTRL_SCALAR &&
+	    ctrl->emulated_by && ctrl->membw.no_mbw_hw)
+		return ctrl->emulated_by;
+
+	return ctrl;
+}
+
+/*
+ * A control emulated by another control has no MBW hardware of its own, so it
+ * only has a schemata line while emulation is active. Emulation is performed
+ * in legacy mode only, so in native mode such a control is hidden from
+ * schemata rather than showing an empty or meaningless line.
+ */
+static bool resctrl_ctrl_schemata_hidden(struct rdt_resource *r,
+					 struct resctrl_ctrl *ctrl)
+{
+	if (ctrl->type != RESCTRL_CTRL_SCALAR ||
+	    !ctrl->emulated_by || !ctrl->membw.no_mbw_hw)
+		return false;
+
+	return r->mode != RESCTRL_CTRL_LEGACY;
+}
+
 static int parse_line(char *line, struct rdt_resource_final *f,
 		      struct resctrl_ctrl *ctrl, struct rdtgroup *rdtgrp)
 {
 	enum resctrl_conf_type t = f->conf_type;
 	ctrlval_parser_t *parse_ctrlval = NULL;
+	struct resctrl_ctrl *line_ctrl = ctrl;
 	struct resctrl_staged_config *cfg;
 	struct rdt_resource *r = f->res;
 	struct rdt_parse_data data;
@@ -253,6 +310,9 @@ static int parse_line(char *line, struct rdt_resource_final *f,
 	/* Walking r->domains, ensure it can't race with cpuhp */
 	lockdep_assert_cpus_held();
 
+	/* A control without MBW hardware mirrors the control that emulates it. */
+	ctrl = resctrl_ctrl_backing(r, ctrl);
+
 	parse_ctrlval = resctrl_ctrl_priv_all[ctrl->type].parser;
 
 	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP &&
@@ -276,6 +336,7 @@ static int parse_line(char *line, struct rdt_resource_final *f,
 			data.buf = dom;
 			data.closid = rdtgrp->closid;
 			data.mode = rdtgrp->mode;
+			data.line_ctrl = line_ctrl;
 			if (parse_ctrlval(&data, f, d, ctrl))
 				return -EINVAL;
 			if (rdtgrp->mode ==  RDT_MODE_PSEUDO_LOCKSETUP) {
@@ -418,7 +479,7 @@ static int rdtgroup_parse_ctrl(char *ctrlname, char *tok,
 	list_for_each_entry(f, &rdt_resource_final_all, list) {
 		if (!strcmp(resname, f->name) && rdtgrp->closid < f->num_closid) {
 			ctrl = resctrl_resource_ctrl_get(f->res, ctrlname);
-			if (ctrl)
+			if (ctrl && !resctrl_ctrl_schemata_hidden(f->res, ctrl))
 				return parse_line(tok, f, ctrl, rdtgrp);
 			else
 				break;
@@ -511,6 +572,7 @@ static void show_doms(struct seq_file *s, struct rdt_resource_final *f,
 		      bool print_ctrl, int closid, struct resctrl_ctrl *ctrl)
 {
 	struct rdt_resource *r = f->res;
+	struct resctrl_ctrl *vctrl;
 	struct rdt_ctrl_domain *dom;
 	bool sep = false;
 	u32 ctrl_val;
@@ -523,17 +585,23 @@ static void show_doms(struct seq_file *s, struct rdt_resource_final *f,
 				resctrl_ctrl_is_default(ctrl) ? "" : "_",
 				resctrl_ctrl_is_default(ctrl) ?
 				 "" : resctrl_ctrl_name_str(ctrl->name));
-	list_for_each_entry(dom, &ctrl->domains, hdr.list) {
+
+	/*
+	 * A control without MBW hardware has no values of its own; show the
+	 * values of the control that emulates it so both schemata lines match.
+	 */
+	vctrl = resctrl_ctrl_backing(r, ctrl);
+	list_for_each_entry(dom, &vctrl->domains, hdr.list) {
 		if (sep)
 			seq_puts(s, ";");
 
-		if (is_mba_sc(r, ctrl))
+		if (is_mba_sc(r, vctrl))
 			ctrl_val = dom->mbps_val[closid];
 		else
-			ctrl_val = resctrl_arch_get_config(r, ctrl, dom, closid,
+			ctrl_val = resctrl_arch_get_config(r, vctrl, dom, closid,
 							   f->conf_type);
 
-		seq_printf(s, resctrl_ctrl_priv_all[ctrl->type].fmt_str,
+		seq_printf(s, resctrl_ctrl_priv_all[vctrl->type].fmt_str,
 			   dom->hdr.id, ctrl_val);
 		sep = true;
 	}
@@ -553,11 +621,14 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
 	if (rdtgrp) {
 		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
 			list_for_each_entry(f, &rdt_resource_final_all, list) {
-				for_each_resource_ctrl(ctrl, f->res)
+				for_each_resource_ctrl(ctrl, f->res) {
+					if (resctrl_ctrl_schemata_hidden(f->res, ctrl))
+						continue;
 					seq_printf(s, "%s%s%s:uninitialized\n", f->name,
 						   resctrl_ctrl_is_default(ctrl) ? "" : "_",
 						   resctrl_ctrl_is_default(ctrl) ?
 						    "" : resctrl_ctrl_name_str(ctrl->name));
+				}
 			}
 		} else if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
 			if (!rdtgrp->plr->d) {
@@ -574,8 +645,11 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
 			list_for_each_entry(f, &rdt_resource_final_all, list) {
 				if (closid >= f->num_closid)
 					continue;
-				for_each_resource_ctrl(ctrl, f->res)
+				for_each_resource_ctrl(ctrl, f->res) {
+					if (resctrl_ctrl_schemata_hidden(f->res, ctrl))
+						continue;
 					show_doms(s, f, true, closid, ctrl);
+				}
 			}
 		}
 	} else {
@@ -1147,6 +1221,7 @@ static int resctrl_io_alloc_parse_line(char *line, struct rdt_resource_final *f,
 			data.buf = dom;
 			data.mode = RDT_MODE_SHAREABLE;
 			data.closid = closid;
+			data.line_ctrl = ctrl;
 			if (parse_cbm(&data, f, d, ctrl))
 				return -EINVAL;
 			/*
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3bec23728847..a34c7ed8f874 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4147,6 +4147,7 @@ static void rdtgroup_init_mba(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		cfg = &d->staged_config[CDP_NONE];
 		cfg->new_ctrl = resctrl_get_default_ctrlval(ctrl);
 		cfg->have_new_ctrl = true;
+		cfg->staged_ctrl = ctrl;
 	}
 }
 
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 06482e766087..cfb4c17bcb53 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -121,10 +121,16 @@ struct pseudo_lock_region {
  * struct resctrl_staged_config - parsed configuration to be applied
  * @new_ctrl:		new ctrl value to be loaded
  * @have_new_ctrl:	whether the user provided new_ctrl is valid
+ * @staged_ctrl:	the control whose schemata line staged this config.
+ *			Used to tell a real duplicate domain in one schemata
+ *			line from the mirrored write of an emulated control
+ *			and the control that backs it, which share the same
+ *			staged config.
  */
 struct resctrl_staged_config {
 	u32			new_ctrl;
 	bool			have_new_ctrl;
+	struct resctrl_ctrl	*staged_ctrl;
 };
 
 enum resctrl_domain_type {
-- 
2.43.0


