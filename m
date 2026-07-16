Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2933C4451A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XacGjPDAGk6gEsK7OjoHFnBDEGVSPPW3DV9vOIUpPLE=; b=RBcfFcy1M1nZZqe0GK2iGKkoOE
	jC2q01PwFT3PmCcUhYyboHubP3p/bYHRC/FS+a3rDYQkozf1fJtI8RUrTbJChvu4F7kSvqt4UJifF
	CwNn7j+vofJsOUU4ZF3OYTkiOf9iLCwIVgtxMfeB6yttnNjwL11aU3gfJgz2lM+OUpBbCXeSp5h9d
	5S6Cc0O3pju31UzTjGeKRoZkLRiP2302wk9HNM3b0McbY5RiDMW9ECQoIvotvDnDH6MP25OupSiG/
	FlN8Z9wi58cQs3zMMT08cYie87dhkACI4zRqKkkN2wG+j1imoLOxDGHSYjY2ihWFf0k1VeSKpDk28
	EcmLiSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGI-00000000Z97-3Ib9;
	Thu, 16 Jul 2026 21:04:55 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFU-00000000Y2O-0JNk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdeOuMaLyDaM3x/ZUeGSRYIrd1xC0Fd8OvRZns5E7cRYx1Srn3ySHWwiKFIVTMqCo1Mr9vD5V1ZV6zj4tTJAtgURk6GnpiH4JlcaEqioExuQSzc69dhOSfga5mvXWsPh4HXTHpGXCszYUvWxmSjiJQRC3v+oC2AR3A++KjVIeKj8jEg/z6z28vXrEsJYcqKa9U4r5wfoud2nnY/idle2iHctj2UD2RB8zy2PSp5/Lr8w2iCxjNfV/Bha6jCB0PHCUeND0NgQTy9DymehfpTskpqzzSvS7XnmGHQ/IJ6mg+Io1tr8W6SamLIzyo1LH+h7LAlGCzg1Xi8dJrzwgVO5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XacGjPDAGk6gEsK7OjoHFnBDEGVSPPW3DV9vOIUpPLE=;
 b=TiNL8DxWQHaOesD6mGSdN7pq+rsQ8VmzzVsuKAB+b5NPVS/lnHo569jVjhe6jvIyd/zPrY74rRgAOjFqPfL5NamZKiaBooVNfs3CIneS6e6as+5SGD7+euX/e06qHG/lvnZNJ9c5kRot4DYWSzXZfVV8Luqe7JfI84EbMiuTi7SLtdFpTmedOOaZH7l8O4I7eoXjbVcBXMaK+DP6QGXXs0y8NH/8mq0XW39h5e5Yeiw/6ySiXYtaSJmPEaAM987uNXQ4C0G9vZLWOBQDRPMJenLL0GNureFnOyfhVZ3cVdjsuY14xQbBJSJJ7eaBeIgdC3IOqVvFW+H06EjBXr0sCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XacGjPDAGk6gEsK7OjoHFnBDEGVSPPW3DV9vOIUpPLE=;
 b=mUMKIB3QtId/VcBw3XlbIX23QJfGBEXqrpJBWWgnRcECtLPkF3MjW4gTE051zZGLd6NQy3o3v9iv9UqJCaR3X4nheQxWBEL8pnF2Z/2DM+L0s27qaGlmJoTMjQnqgslOQeG2AJ2xNa7jSomOZQqbsIgs8gm1OsNynUB5zQsYjJTarlig808tAbSDJHZUNCsCUiEQTR/Vm0h0dkDNXFb6mURYqct1EiT+Of/+86bdtIRlU9Wn4nT41NITPBtFEuHvwb+opvytATqhXpRZCU/g0LLHGw6tiKWj5vlD1DrERAw3rMJ9y2pE4o+VIkMe2M2FMuh9NS6g8aJqzIBr2dghrg==
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
Subject: [PATCH 18/23] arm_mpam: Emulate MB control with node-scoped MB_NODE control
Date: Thu, 16 Jul 2026 14:03:08 -0700
Message-ID: <20260716210329.2914625-18-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 59af5ddb-df73-4f66-f09a-08dee37dbde2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|3023799007|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: LihlwpDJk/bWip84tKNaXg7ycB2YdxnKxA79g+GSxmPXrp+3H6f7+l8H+JHUmmIcmXM7rDpGrwuQeOgP3R2Lp8gMRqtxh3FcTU9dFpKmDQW5InFnj0gFHbiry8PSctanj/6RjNZCvK5yPs3v0k9aotpl2zV4VBzqqaJhBFkspUaH49Sg01Ev0DYcYstqtgIhmIQ/kANvqsqyMjHL8Hb1w+/npzZYshhpWGpDUl17AksW2vzSMFd5rwLKuzVQgivYS5zwvCehinsHmF82ove8/UMVA01SVZelWBFvNwJwwi9+eGy7lDQdUsOP5Yy5RuDPHrOTE9ZeVVDxVrB4980FxBipz+nOU47RVWGlL38z6vXHX8qFP5ltYVhl2XWPTcF1ODX7kyWpkhHM2d1skGlwB1hDzc7+VOGMKuYVZUo1MMSmhNIyZG8792chzeMhmigsrwYib8A4T1t+i/ACjH7PfLoVueWikbqjr6edUM/+W6uULYt1teWxFSdlXUK5bOkyF15Q8/nx7hRZCC9kDTSdfGnmUwPCIT1mwcICzaYvYHeUvigKhwt45C2+tBkXO08wVYVU4jRDce68lQAwJ7M0UFJueJGapGrEfy1r5nsLKqM1h5Om2A6029P+754W2rS0rOVUOG8BlVRur/uVESvjGyh5UjCCg/tdArglYSPgqOGzYb/1LXOlBaOAOWOaokOmlrXqQjRCk6qKA+/Vyp29MQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(3023799007)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tdZiXdWuqfAlzjYOU2p9dB6kdtf03rulyugecnT406Ct4lksr09ilyTDsdX8?=
 =?us-ascii?Q?FfC7D4j0cayLr387B1bNBtAfAMwFofpxthRkwePZEyegCfM2Jpb+mkkq4d7U?=
 =?us-ascii?Q?Akgik1LPvDyyMPIuD48q17qy5Px5JBHX7BDsNgz7/6QgmzR7y04zKqkBrIJD?=
 =?us-ascii?Q?cn3wO386ZC6ARzmKIqcihk0ckO8+qX0K6lHfOeFKsZBf+pnlbGoe6G49Jbxw?=
 =?us-ascii?Q?/zH52BzbgM4f2hr7UucwMOHsDZga/rCCvfk8bTOTgNLPkWmbGRJ7q6LJullo?=
 =?us-ascii?Q?CZ+ZV7cqBYYyaKK06aJFxKLO0p0PPmkTfwvdGrNmx5DVOasJ5DthKZO2h+7A?=
 =?us-ascii?Q?77WOoCnstJ5RTFlGfNGaep5jnJuDwHR2hkv1sTfGOgGQ55yeEjBV2kdsa4ID?=
 =?us-ascii?Q?IPa8pndb1SD5fmR7JDOh8D8eQBNOTgpRrNq612FwEfDSMVqbonXlb9Vr1oHB?=
 =?us-ascii?Q?ogiJf7ZQbpZdvpTOevqprgmCBr4sWMxau076fUNvsDFjb9tBd0RFW5EENj6C?=
 =?us-ascii?Q?F5P470J+81o/2yARq603INLhLuaoxqXvLFJoWknl29a+dg1Sz3M21BRK7j/R?=
 =?us-ascii?Q?Qdrbcss71+CPrq0ftQzLzlT/It7TedrEqH5ltjt9gtjMXnlV9eOTSGo/Epd9?=
 =?us-ascii?Q?pb4XeXz31wy5CfsJIbsu9lcyX4sBbWkouRNZvDGHByH9A/b96hK6oO+e2tCb?=
 =?us-ascii?Q?qAoTfaIKWCuc54bSfjIwgxTxqf6Q6b/L6lrcGtY57I5V9W6QVd6D7mHHIxX8?=
 =?us-ascii?Q?fSg/6IODC4SE/eDIcbQzB7OS+aOPsreBmZtzZDcmbmIAIsOigLrKiguYrzbB?=
 =?us-ascii?Q?qIMXF3yh9ljBQ+YPaoTTSfQvQRYc1tsaLaPpfZtJSQWTNnSPgd+JYP6UXcgA?=
 =?us-ascii?Q?KXPYvbsj5kx7L75+cRbwHX8wRVboMG9haMIindBB2m9++p3nGrsCL0mRNokL?=
 =?us-ascii?Q?Im0OWmpcaAT7dsYkaKQGH2gSPzd7T1zvKJG5fGdAM9F8nH0fcacC5BWehPXE?=
 =?us-ascii?Q?o6bbYPKvlpceMzGbtbqrDxIbFcCnCVX7vPcW5Qz/n/PcYzdwbmPLAq9Kgtl4?=
 =?us-ascii?Q?0QLlRHPvUNjaSoMl7m497iAmMC1zXupofbilmMC2s7ZiJb2HutY0bhEbxrS+?=
 =?us-ascii?Q?koHe5bXA5Q5ESFBaZ0mGKFYBrbUia2To1+Vbh6+oBe7mqR0NsPEQBENmx6r2?=
 =?us-ascii?Q?lFeHQSgP+QV6bzbGslXHBiorC4iBmeQtc5bIRkXMpzR19T/RjGTnQPPmdTnl?=
 =?us-ascii?Q?QzMyOatrQcD7JnCkNCBvRjGPQztzTOTmjaHW3Imt/EhYUtd8rZzYAgvhSExw?=
 =?us-ascii?Q?dco5zo6L0U/Oly9cJ8UWa79U5uKCzpk8uGHHJ6yHXDh5uI+zycrop8UCHUZ6?=
 =?us-ascii?Q?3W32RttX/icGlKFqfgSnTx0CaEDlSQEtDouj1Bq5TieysJzT95l9tIr7Be/V?=
 =?us-ascii?Q?P4Z9Xj4HxRZ4VlQW/YdGXlcDEFQAjIwWKwceRVD1vm+nNFR6RPcGZk+vA03+?=
 =?us-ascii?Q?ZGPIVCz52sHMyApEZ2SPoVpBxf3g5mkq2bxhasgVu8u5uWYb+In9PTkhwDuL?=
 =?us-ascii?Q?JVP6mzoOUbyBkv/OetXqBUkP/sc1xhRLyiq5SycvLfLz3xIiHYbLZtsjcibd?=
 =?us-ascii?Q?nSvKV3vfp22byrbev/GAf6V//fySh/9kN8ipoQhvBUDeqw5hz4L76oe2RFZT?=
 =?us-ascii?Q?oiGzgnT1YHKswfTorDiga4e8Z+J8CU7T/wKEVHl9bu+L4MCHlVM1+KMtzup/?=
 =?us-ascii?Q?MTzURC90RA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59af5ddb-df73-4f66-f09a-08dee37dbde2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:53.0425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7N4jECDsJcZeDC1BIdj5jst60ZQEV37Ob3Z/9921TAVzIFfmd6LRE8qk6HqQNJDMEBw9biDve3S4hEH7C3uXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140404_237762_743438BE 
X-CRM114-Status: GOOD (  19.79  )
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

On memory-class MSCs the MB bandwidth control is node-scoped. Add a
node-scoped MB_NODE control that emulates the default MB control by
pointing its resctrl_ctrl::emulated at the default control, so it is
exposed nested under MB in resource_schemata.

Introduce mpam_resctrl_ctrl_node() to identify memory-class resources
and use it when selecting the control scope and the hard-limit control
name, replacing the open-coded mpam_class_memory() lookups. Expose the
NODE control scope in the per-control "scope" sysfs file so node-scoped
controls report "NODE" instead of "Unsupported control scope".

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 drivers/resctrl/mpam_resctrl.c | 166 ++++++++++++++++++++++++++++-----
 fs/resctrl/rdtgroup.c          |   3 +
 2 files changed, 146 insertions(+), 23 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index f67647d95bbe..890b17c218a2 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1253,20 +1253,133 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
 	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
 }
 
+/* Fixme: Is this a right helper? How to get MB and MB_NODE together */
+static bool mpam_resctrl_ctrl_node(struct rdt_resource *r)
+{
+	struct mpam_resctrl_res *res;
+	struct mpam_class *class;
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	class = res->class;
+
+	return mpam_class_memory(class);
+}
+
+static bool mpam_resctrl_cache_has_mba(void)
+{
+	struct mpam_resctrl_res *l3_res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+	struct mpam_class *class = l3_res->class;
+
+	if (!class)
+		return false;
+
+	return class_has_usable_mba(&class->props);
+}
+
+static void _mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
+					struct mpam_resctrl_ctrl *mpam_ctrl,
+					struct mpam_props *cprops,
+					enum resctrl_ctrl_name name)
+{
+	mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
+	mpam_ctrl->r_ctrl.name = name;
+	INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
+
+	mpam_ctrl->r_ctrl.membw.min_bw = get_mba_min(cprops);
+	mpam_ctrl->r_ctrl.membw.max_bw = MAX_MBA_BW;
+	mpam_ctrl->r_ctrl.membw.bw_gran = get_mba_granularity(cprops);
+
+	if (mpam_resctrl_ctrl_node(r)) {
+		/*
+		 * Default to legacy mode so a disabled MB control is emulated
+		 * by the node-scoped control, keeping the "MB:" schemata line
+		 * for backward compatibility. User space can switch to native
+		 * mode to disable emulation.
+		 */
+		r->mode = RESCTRL_CTRL_LEGACY;
+		/*
+		 * On a memory-class resource the legacy MB control is backed by
+		 * the L3 cache MBW hardware when the cache has usable MBA, so it
+		 * keeps cache scope. Otherwise it is node-scoped and emulated by
+		 * the MB_NODE control.
+		 */
+		if (name == RESCTRL_CTRL_NAME_DEF && mpam_resctrl_cache_has_mba())
+			mpam_ctrl->r_ctrl.scope = RESCTRL_L3_CACHE;
+		else
+			mpam_ctrl->r_ctrl.scope = RESCTRL_NODE;
+	} else {
+		mpam_ctrl->r_ctrl.scope = RESCTRL_L3_CACHE;
+		r->mode = RESCTRL_CTRL_LEGACY;
+	}
+}
+
+static void mpam_resctrl_ctrl_set_mbw_status(struct resctrl_ctrl *ctrl,
+					     struct rdt_resource *r,
+					     struct mpam_props *cprops)
+{
+	switch (ctrl->name) {
+	case RESCTRL_CTRL_NAME_DEF:
+		if (mpam_resctrl_ctrl_node(r))
+			ctrl->membw.no_mbw_hw = !mpam_resctrl_cache_has_mba();
+		else
+			ctrl->membw.no_mbw_hw = !class_has_usable_mba(cprops);
+		break;
+	case RESCTRL_CTRL_NAME_NODE:
+		ctrl->membw.no_mbw_hw = !class_has_usable_mba(cprops);
+		break;
+	default:
+		ctrl->membw.no_mbw_hw = true;
+		break;
+	}
+}
+
+static int mpam_resctrl_ctrl_init_mba(struct rdt_resource *r,
+				      struct mpam_props *cprops)
+{
+	struct mpam_resctrl_ctrl *ctrl_def;
+
+	ctrl_def = kzalloc_obj(*ctrl_def);
+	if (!ctrl_def)
+		return -ENOMEM;
+
+	_mpam_resctrl_ctrl_init_mba(r, ctrl_def, cprops, RESCTRL_CTRL_NAME_DEF);
+	mpam_resctrl_ctrl_set_mbw_status(&ctrl_def->r_ctrl, r, cprops);
+	list_add(&ctrl_def->r_ctrl.entry, &r->controls);
+
+	if (mpam_resctrl_ctrl_node(r)) {
+		struct mpam_resctrl_ctrl *ctrl_node;
+
+		ctrl_node = kzalloc_obj(*ctrl_node);
+		if (ctrl_node) {
+			_mpam_resctrl_ctrl_init_mba(r, ctrl_node, cprops,
+						    RESCTRL_CTRL_NAME_NODE);
+			mpam_resctrl_ctrl_set_mbw_status(&ctrl_node->r_ctrl, r,
+							 cprops);
+			if (ctrl_def->r_ctrl.membw.no_mbw_hw)
+				ctrl_def->r_ctrl.emulated_by = &ctrl_node->r_ctrl;
+
+			list_add(&ctrl_node->r_ctrl.entry, &r->controls);
+		}
+	}
+
+	return 0;
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 {
 	struct mpam_class *class = res->class;
 	struct mpam_props *cprops = &class->props;
 	struct rdt_resource *r = &res->resctrl_res;
 	struct mpam_resctrl_ctrl *mpam_ctrl;
-
-	mpam_ctrl = kzalloc_obj(*mpam_ctrl);
-	if (!mpam_ctrl)
-		return -ENOMEM;
+	int ret = 0;
 
 	switch (r->rid) {
 	case RDT_RESOURCE_L2:
 	case RDT_RESOURCE_L3:
+		mpam_ctrl = kzalloc_obj(*mpam_ctrl);
+		if (!mpam_ctrl)
+			return -ENOMEM;
+
 		mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_BITMAP;
 		mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
 		INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
@@ -1298,18 +1411,12 @@ static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 		r->alloc_capable = true;
 		break;
 	case RDT_RESOURCE_MBA:
-		mpam_ctrl->r_ctrl.type = RESCTRL_CTRL_SCALAR;
-		mpam_ctrl->r_ctrl.scope = RESCTRL_L3_CACHE;
-		mpam_ctrl->r_ctrl.name = RESCTRL_CTRL_NAME_DEF;
-		INIT_LIST_HEAD_RCU(&mpam_ctrl->r_ctrl.domains);
+		ret = mpam_resctrl_ctrl_init_mba(r, cprops);
+		if (ret)
+			return ret;
 
 		r->bw_delay_linear = true;
 		r->bw_throttle_mode = THREAD_THROTTLE_UNDEFINED;
-		mpam_ctrl->r_ctrl.membw.min_bw = get_mba_min(cprops);
-		mpam_ctrl->r_ctrl.membw.max_bw = MAX_MBA_BW;
-		mpam_ctrl->r_ctrl.membw.bw_gran = get_mba_granularity(cprops);
-		list_add(&mpam_ctrl->r_ctrl.entry, &r->controls);
-
 		r->name = "MB";
 		r->alloc_capable = true;
 		break;
@@ -1472,7 +1579,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 	struct mpam_props *cprops;
 	struct mpam_resctrl_res *res;
 	struct mpam_resctrl_dom *dom;
-	enum mpam_device_features configured_by;
+	enum mpam_device_features configured_by = MPAM_FEATURE_LAST;
 
 	lockdep_assert_cpus_held();
 
@@ -1500,16 +1607,22 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		configured_by = mpam_feat_cpor_part;
 		break;
 	case RDT_RESOURCE_MBA:
-		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
-			configured_by = mpam_feat_mbw_max;
+		switch (ctrl->name) {
+		case RESCTRL_CTRL_NAME_DEF:
+		case RESCTRL_CTRL_NAME_NODE:
+			if (mpam_has_feature(mpam_feat_mbw_max, cprops))
+				configured_by = mpam_feat_mbw_max;
+			break;
+		default:
 			break;
 		}
-		fallthrough;
+		break;
 	default:
 		return resctrl_get_default_ctrlval(ctrl);
 	}
 
-	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r) ||
+	if (configured_by == MPAM_FEATURE_LAST || !r->alloc_capable ||
+	    partid >= resctrl_arch_get_num_closid(r) ||
 	    !mpam_has_feature(configured_by, cfg))
 		return resctrl_get_default_ctrlval(ctrl);
 
@@ -1570,12 +1683,19 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct resctrl_ctrl *ctrl,
 		mpam_set_feature(mpam_feat_cpor_part, &cfg);
 		break;
 	case RDT_RESOURCE_MBA:
-		if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
-			cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
-			mpam_set_feature(mpam_feat_mbw_max, &cfg);
-			break;
+		switch (ctrl->name) {
+		case RESCTRL_CTRL_NAME_DEF:
+		case RESCTRL_CTRL_NAME_NODE:
+			if (mpam_has_feature(mpam_feat_mbw_max, cprops)) {
+				cfg.mbw_max = percent_to_mbw_max(cfg_val, cprops);
+				mpam_set_feature(mpam_feat_mbw_max, &cfg);
+				break;
+			}
+			return -EINVAL;
+		default:
+			return -EINVAL;
 		}
-		fallthrough;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5be285487df7..b9e8d1183cdd 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2239,6 +2239,9 @@ static int resctrl_ctrl_scope_show(struct kernfs_open_file *of,
 	case RESCTRL_L2_CACHE:
 		seq_puts(seq, "L2\n");
 		return 0;
+	case RESCTRL_NODE:
+		seq_puts(seq, "NODE\n");
+		return 0;
 	default:
 		/* resctrl does not yet support any other control scope */
 		seq_puts(seq, "Unsupported control scope\n");
-- 
2.43.0


