Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F79CC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDCoD9gopMkw6squa+UCEijXUtZb8e4n69AggqiNbiE=; b=K3T2IVLRujNsvMi440Us/nlQTL
	F0zKvq2HzFB7/1BnfiDWZV8Pushphd1jR2jzpgaWjM4/6oxkXJFT8N4wIYTzo3RIZVDYxkl8UVd5O
	00Smf39Q/xJF3Mn5lH6vqhDMtrLlu8EuD2OKWNalGcUaZ7NVuv+sYjlnKpcZeqZ1yxZtAcI0lsD8L
	JnugtcB3c4OKJpbDZ9dcl8ZgeOEOveVsUHeN95khInrti/n70TruawTz/EcoR3KRJhmIOzXgbiyf4
	VSuWS6U+qVN/LP7B8rBGh+9AKyqL84HbiMSZ7HVk0RSSQAKAfqg7tZul+fC+uuEzdyfDP7N4c4ezy
	ji3cKEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFU-00000000YJN-3PaE;
	Thu, 16 Jul 2026 21:04:04 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFL-00000000Y2O-2uAc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQkeY7ZWqk1BIm/9doWzrgC76ijCErta9Ds7NDhpMUXoVag+73dQw+rIOqBnYeNYLQL69S4jt+O9jqv/pxmRrLxtobA/Rkq34dTsXjOuF32QhdxRjZWNmx70ONaIAFNpEMbIX16xy/bCW6n113G3Uocdv2swrubHkoOoGJL+2pSVP+dfnoP7TQ2IeHqDUnRm8/V5JFwcsGYGvfwCPIzBQgGCg/RRPZY3SQ+7fyF0g/FVXzxUZKn5wHyjrf/PjRnKzmPK83yQ3dNTeWLIsFUSR30RvD0xsfCfLkMm8k1vb7BVXWDvphJoOF8lGJDI1t77dXjiv2Ua8Rdq6QhFvwwYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDCoD9gopMkw6squa+UCEijXUtZb8e4n69AggqiNbiE=;
 b=XnDDk2F6fxZ8DBYocZ8P8HqvEZrypWX9zJ7V2XX6dAow1XEqn0KUYjRGWsnGy35hL+y2D+X/+1GIy0HCTvAysZVR1qqBlhnHl6lD5rHaiAjrajSCR2MiDqANJwcI9fUPI0BFnMyoyL9inl4YdlNZpyMhl4Ag7xKnPCO4b0+QLeVB2mxvJXtuKhrplCP8cDA7PKMo4OJSZh6LJ/pFdLOcaYUR1etDnVD73UFtLUrQCe7+J1mATxmN72lOI0r2xJCekCtPw/hsRIkxvei2i+VLW+U6pXjFMK4zjelPmPlLX/9LSFP3GdQedvLhyQINTY8tyZ959D8bdcuLnbsNGGv3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDCoD9gopMkw6squa+UCEijXUtZb8e4n69AggqiNbiE=;
 b=T5W6vieFhBB2XUsdwAETUcTX7KaB5ofV5UPG71XeNyXB30gLc85MsGr1ZyyWl4uL1YFoKlH/65CIoEww+P80z7apOA3q4K4kjC6O1dEs4/fRosWfxzkVzOkYU2P2ubzXS1MsJx16JbndwmL0Po+6zBcU5JASRVIY9dlWAwXHy5BvjWRouikz8IMtp4a2e02KM586Z71n/5lRNMlCUjAvqxnNxXyVLUcmRv46Tq1ihQOuQiuhC7igUqALFiM62xvQ47ou/RhURVApSwrIlp00gdb9kfVfPOdie4N/cjGwiBgny1GG63/+BKgVY5aELv8IAqgd5InUnI03XkLSQjm9VQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:43 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:43 +0000
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
Subject: [PATCH 10/23] resctrl: Expose MBA MBM counter assignment sysfs
Date: Thu, 16 Jul 2026 14:03:00 -0700
Message-ID: <20260716210329.2914625-10-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9accd6-7d46-4062-e73c-08dee37db7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: c4k3lKxPM6+ZS1frROxptPlpKGu3/3oUlHOWi3+qizRM2YKmo5SFQl/asN5Gfgygyi7DvHK2K0f34XDhmui1pN26z4gQTrtVv1odYJxiKyjSLu4Vrp3/rSyEXN30ukk4/r0qLGfEc8Kd22GPBsZghuuxampHeo3yTOvKHcyQSMS7IaudfB4J1YkC4v3R2tJWCnEzT7JtGp1ajJ+mZ3AxCxkuksniWx48ID0zWgu2rh6c3aSTbpyr4Xp5p5obz1EW/OAqsTSJmR8U1xy8+urpxhFBGaR2Mg07e7OzhaFt3PcR9jV1VPi/2Gkg7KDdhtfuHHCvoBieeXszjjnbBgrM2RaREGC9Ri1//Gyj01ykc9BPsh2EOmIvfQB98lAXPsTzSVoanVATvYSVRjaflfP9Q1YELY0sgLL/cIJ9OQ1Utb+sTTBGW5ssyy1OhEjfn4L56qoLbLhGPMAg/Xp6HeblYwXZWcQ0tXv+PcJSpuT/epPMx9ig+vwAEU05k5rneue//zWWZzmTUY/OoFWFIcf4R/LTgJiVBLPnolqemPGbHFzi0UVLmoD4f4Pt9Fu27Bxu+U290eIIA++W/cPn/1S4PzsoRxjbgT0ddzNs6y/UDeBErSasM/oS0B+jDWwWtHD5gi0vAsFiYrBuZ8TsHgYUAq7LYl27nmzzeUIPsyQFrbZz2B9t+yQSOV3uRMToTQMwZbj3+LfbshYArklP/k6nZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bfDWt5rGG2TYhtEWUCt9JXO6xW2fuW8EiI2o51GMJGQeGdkD9U7aBk5j1/Bo?=
 =?us-ascii?Q?Vtw4AkJqcltdB7mXqPH+TUDqB+KLTaNBM2nc9x2e8dg9DAtjYddFFYzB88DP?=
 =?us-ascii?Q?giBBzS5Kn00JUHF+pnYLEpSa3MLuB2K8m3QFVK06K9mwqoekh6tqoTLoV165?=
 =?us-ascii?Q?cN2K6Vmi6FsCwT5elEGBifxE6PlT+aqSX3EXp1v+RogQ6L3j0mwURjz0YKx+?=
 =?us-ascii?Q?HpbhqtfjfXI6U+1hVBCUajGiuEhto3TBhoQGaFM9GRhAG0D1Cchttzh+miES?=
 =?us-ascii?Q?iiME+DcO4TC7k4VpXZlKx796HNaM09KUFZQSOlsPP97sF8E8fEmM/RKtXTwR?=
 =?us-ascii?Q?luPW6MVFuBKCs3Q7PxOKykfi6Q7E6G5/+M/kyrdmj8zLclAxXPuv2FPe+/VD?=
 =?us-ascii?Q?Jl7jdqtGHzif7VlawoVAndKCtxBKUwXPd3gOrsuKmp3plMkSIn+kant7Lhan?=
 =?us-ascii?Q?67TKGUc/VVi7CV0ylydXWsRWQeALrsG7ERUD3AkHDSQ4emzlpxRyaaknbkQd?=
 =?us-ascii?Q?MlBBea7IdtiqCijzCgrE1V6LwDChle8fuUR1U9stnd32y076f4U3enh1y2mT?=
 =?us-ascii?Q?mvS3ZmEAyKmBdYm3zWNv9Toixb93wHuiXnvMFbwHtCcfoheXd89Fa8gGs2+5?=
 =?us-ascii?Q?mMhqLP3OgQ81PsQaD0Yq5YpmQA+x/QbuDTr0h0wHjlVdsxWSLxGPEpyPP2zA?=
 =?us-ascii?Q?+obxfXlKRGZ39D01NYjrCDGBRyCB41emmWv53pNPBl9Vx5GTHE3LVYca5lTn?=
 =?us-ascii?Q?SS1+TRHmp9HhP5F6yIhtKXRP5P14h+dcrX0m7P8Klq7RdzpnMtSJBGxC/p0F?=
 =?us-ascii?Q?tv9yD0OQf//4RkHMB36m/04gbwsJXqOnTBzDsrjG107cV3IR5C3Zg3pXV5Wm?=
 =?us-ascii?Q?CZzAFUL2xCFQH4l7ASA0LnLmj8jQPqCovJ8CSLZ6d31h3rS+UGEM+b34cL2Q?=
 =?us-ascii?Q?BgDFAb6FfxPNP9o3bS1pa/MeVB9W1g30ZdM7oWv3d+uzmFnDCaTx+8quPsgu?=
 =?us-ascii?Q?xSEScDmwR9ocb7pQUNxp9Oe1RLMQxrYzUK80ZA7UNxBUlEVLz5xiv7DDG8hk?=
 =?us-ascii?Q?vmKfLN5UqOsKeq6KwC1nvVB6bA3lug2n2h8H/T4eoXLyUCwAxEMcAXKMavEs?=
 =?us-ascii?Q?u6yDSG0HI2Gg/FvULkALjz9EgBIwQYb7KQJGII8DRKVdK5oFzMaYb52XsAUH?=
 =?us-ascii?Q?fpClysUk0ubyRqJJoR/avoDgOm8Qd+NDKUQqg47HMa0CByzipGrncswO87Jp?=
 =?us-ascii?Q?fmunDh0lcuIxdZzFfXen0M2gxXhGasSWH98/mmJHLmfm4CM3D5FQT19Byz2v?=
 =?us-ascii?Q?838vrd3WthnqaHIgg4+ly0eegrlku0OKJ/7vZlcvp8wTl3iHRiUWI1uRT6vA?=
 =?us-ascii?Q?1dcr4J7g/EuHUBgey/h8njQNj0GvfHyJDnEFVfnUjnVEvoUDL1/hRBlh4zdC?=
 =?us-ascii?Q?AY4THs875urC6sXHDhOdC4W98EEyRprmrteN1uartPGJa5b6VMj6wagGcbCE?=
 =?us-ascii?Q?5xqoRLS+CvngQklEJ1JcVqsM90P/wxaMSV8WOK/fww8K8AstOktosJPfNbdN?=
 =?us-ascii?Q?yHmTIxcLQmmFB3BIKbm/T+fvy+a4FA4I4CY6luKnLAeU/T7CeReqJrSgaVNA?=
 =?us-ascii?Q?eaV+uUl/Cqb5Jbt1LR9wYO1v7HNNh62AunYyHJoeDhUgYDUGJt7H/Fog8gg4?=
 =?us-ascii?Q?wLrHhKnlJeHXncLi0RiCjfJSZbsv7mvpqpOZigg+9plnMUx9BuCzX8pTScwS?=
 =?us-ascii?Q?PcbouZ8rcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9accd6-7d46-4062-e73c-08dee37db7f2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:43.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suNH5iwle+EnDxZFu4Te25lcNJnYPK+QZOdTNw+PcCB+t3L3O/xmUQpjW0g0W6VRtW3x3XXr0RSb7vxyL03QWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140355_752387_5937A888 
X-CRM114-Status: GOOD (  16.73  )
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

When MBWU monitoring is backed by an MBA resource, userspace still
needs the same counter-assignment interface as on L3, but keyed to MBA
domains and exposed as mbm_MB_assignments rather than
mbm_L3_assignments.

Add the MBA-side sysfs hooks and initialise MBA monitor metadata during
resctrl_mon_init() so mbm_* file visibility follows the resource being
configured.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h |  5 +++++
 fs/resctrl/monitor.c  | 27 +++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c | 11 ++++++++---
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1cca9b147fdb..3bf512bf2d9f 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -478,6 +478,11 @@ struct resctrl_ctrl *resctrl_resource_ctrl_get_default(struct rdt_resource *r);
 const char *resctrl_ctrl_name_str(enum resctrl_ctrl_name name);
 bool resctrl_ctrl_is_default(struct resctrl_ctrl *ctrl);
 
+int mbm_MB_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v);
+
+ssize_t mbm_MB_assignments_write(struct kernfs_open_file *of, char *buf, size_t nbytes,
+				 loff_t off);
+
 #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
 int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 742429e18b8a..db19e5eac1f9 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -528,6 +528,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 {
 	switch (rr->r->rid) {
 	case RDT_RESOURCE_L3:
+	case RDT_RESOURCE_MBA:
 		WARN_ON_ONCE(rr->evt->any_cpu);
 		if (rr->hdr)
 			return __l3_mon_event_count(rdtgrp, rr);
@@ -1691,6 +1692,12 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+int mbm_MB_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	return mbm_assignments_show(of, s, v,
+				    resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 /*
  * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
  * event name.
@@ -1840,6 +1847,13 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 			resctrl_arch_get_resource(RDT_RESOURCE_L3));
 }
 
+ssize_t mbm_MB_assignments_write(struct kernfs_open_file *of, char *buf,
+				 size_t nbytes, loff_t off)
+{
+	return mbm_assignments_write(of, buf, nbytes, off,
+			resctrl_arch_get_resource(RDT_RESOURCE_MBA));
+}
+
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
 {
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
@@ -1883,7 +1897,7 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
 	unsigned long fflags;
 
-	fflags = RFTYPE_RES_CACHE;
+	fflags = (r->rid == RDT_RESOURCE_MBA) ? RFTYPE_RES_MB : RFTYPE_RES_CACHE;
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
@@ -1919,7 +1933,10 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
 					 fflags);
-		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		if (r->rid == RDT_RESOURCE_MBA)
+			resctrl_file_fflags_init("mbm_MB_assignments", RFTYPE_MON_BASE);
+		else
+			resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
 		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
 					 fflags);
 	}
@@ -1952,6 +1969,12 @@ int resctrl_mon_init(void)
 
 	resctrl_mon_resource_init(r);
 
+	r = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
+	if (!r->mon_capable)
+		return 0;
+
+	resctrl_mon_resource_init(r);
+
 	return 0;
 }
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index d9876bbc6365..0bdcf6dd935c 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2133,6 +2133,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_L3_assignments_show,
 		.write		= mbm_L3_assignments_write,
 	},
+	{
+		.name		= "mbm_MB_assignments",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= mbm_MB_assignments_show,
+		.write		= mbm_MB_assignments_write,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0644,
@@ -5132,10 +5139,8 @@ int resctrl_online_ctrl_domain(struct rdt_resource *r, struct resctrl_ctrl *ctrl
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA) {
-		/* RDT_RESOURCE_MBA is never mon_capable */
+	if (supports_mba_mbps(ctrl) && r->rid == RDT_RESOURCE_MBA)
 		err = mba_sc_domain_allocate(r, d);
-	}
 
 	mutex_unlock(&rdtgroup_mutex);
 
-- 
2.43.0


