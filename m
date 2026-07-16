Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D13C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5jJNRqp4zHRBgEPqw5fFP85ovozwiKDxZXNCw4hc4I=; b=f74wTsTmn1zkPY7uBsWn2zz4Du
	A/pTR4Ru3F68AQSszowQN6D4XiBv4jD5+aWoOHL7axH41aoUJ1bR8fL39Egqp4tBVi180c3qYl+Ga
	ejSK754mKDwOQsfXZhsT4rEmTpha7QapZmOo1RYWnpFciSI3IEmCm7OCP46f+9NSrMxMxNpltv6xf
	eQb89rqiNhZIadtYkFbv1eOyPryxZ08CW84NJ8uFu1CJ4ify45ZrR4tnrKWlOQReeK4tJE7ppn/PE
	jdye0vtH35y5FFYNxh3oUiX2MXxmB9uIEP6R08G1sEwFKT6NTwZ1xeaRYTusdD2DumrXLV+weZZbb
	DcQ+V/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFV-00000000YK4-1c5v;
	Thu, 16 Jul 2026 21:04:05 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFN-00000000Y2O-0OrI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hnv/J0+LsS4bvuDhmPOLbNEEtPUuzxHgcjFztbWZoElBmq3XcX5SEq7GXePXq6PzTdJbAWEsrwo1xQv+0a6JT+db2ckP11hqzqRU7uQ1NtsFbYyqMTLsLGKDC8pl6VJP5eAhAYZSMxGqnS0iiAJKOFhOG7e8Por2amAbR8OB/iqeyHneiLpUclmBo+i3trynWf+vYjKyFvuWJlDF7OkMTZwnHAFYTQAyCm1lmLXo2Rq1X9kXGY2eWmmAOh7Yw44K4jFTkjETCoJ3TnmZu1P8gvREBxmXwGndJUwz9jAkmjU+XCws4m8GjBMEocLywlOVG2K30jBIWdEUEMoxXR1WnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5jJNRqp4zHRBgEPqw5fFP85ovozwiKDxZXNCw4hc4I=;
 b=J0JCV8LIRDifTK8/X+SRvP2VFd7ZEmbjCkB8z5OhjkYywmLfyImpEG+JEf5q+uPgZ+jCzVdJmyQ8Egd4+SxFqcu9fjEjJBYykqydm3R1XOEpNDoni6MA89VYmeb5H+yAmuGbuMXZumQ0aEmD+d44GY1Bj+7uL3CUb++UE5T2E/48m708/JGWNi6Yp40ctSJ5ZOzc2b89rWZw2UrqWl8mXJsf1FS4IOSMBI3kGFVnVd4JRorHBRp+xIeXeyTuyNMieKJGEeSIBZwr3A5HlpwMtodh2VF9hET970/lVbUC62inzXteh+7cJWoMB5BctMisOn4ZCYbrVDLHtMsDALczHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5jJNRqp4zHRBgEPqw5fFP85ovozwiKDxZXNCw4hc4I=;
 b=bQxNPT186OUKlST/3gIrx5aSt7itZLYjC6Y21bEtCXS/U0NAXgi30qrG+6fjBE6JQ7jBP1MO8prY3jcM4wqCzDWX1/vzP7Z2F0f8B9047ZO06Pbr2k06OMu2XcRDaxUoIchUS5vI8yRfMCmxN6fDCnE9qBD3GTE6175krWEOpw1aPFDuxdSxJZDgRQQwb/YeUM6qnWxtExKZbGMYHaLHH4VhZL2+5rnS4W/Xl08gZ+fK6HIjLrp5SKLryskaf5NVBC4+BlKpwk1avfL00ttMHYfaAdsMkKc72Y0N9rNT+vYNaprdVSNJA2fRNSlDKn2bDr/44oHvTqcdq56jZqVxfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:44 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:44 +0000
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
Subject: [PATCH 11/23] resctrl: name node-scoped monitor domains mon_NODE_<id>
Date: Thu, 16 Jul 2026 14:03:01 -0700
Message-ID: <20260716210329.2914625-11-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::17) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb34500-103c-4ac4-99c8-08dee37db8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: rs5hpaSuUuEQWqmbbCEG1BrrHLcAbLExN+UydK4zWWBGOmiShqAiBO4iB7d14BAeDxPrTM5DYiWhuz8UKJ8XhuhoU/Su1KFPUyPJHJ3fCw7bdGCLmUpkFPI5/K7iChme9OunAmPaqMSXl08J0NkKv3yIJi3SjGP02BCOK0bvQR6kxaqMZRlqlSVDPiIE5tO+zFrf4dcR8/EEBlDm6LVMaNNWn8wb/OYBAMa5bKvwPXNWqJjbHkhIGrwCeoJKxD1m6zkDoF6+QFaJi1P06scqEqMwSApKX1Ef2mFUolXRu77olagc4VxPP9SVhANiyij0fmHNEVXK0GpTIL5HtnORJdZsxbJL9CYWmnIK5QLoQM9ijzfOEzdnI8a1xkJ8pivPGiN8hhA1DYtJLaNJxh0qY+6+RbRajIVTDdInGasy/701tH27W2eD5QSYW/JxUy6Vl6KC/vBQOYksvYbFttQX93L/z7jIv2xvdTN8xOpBsJapfJrbKk/iDokmjrd5Bcf5E83PEPHqel2emaM0KnGKtHub+GPVf7GYTQ5Po5A5u18nGYIY7gkJVOhjiXr+kYId3pV5Z+VOalqWCjRpl09U/AMv70T3CKclWeCucF3FsoKrxEPhdC1nTruBTjkxWL/f9IrSGq2xfkC6lPHzdEaWZw10Ry8S0oYiUDMVv6GvAcV2Q0fJ4s7+fw97vVoMmkUtJ3INEVaeIfk39AlFuphP7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dsxB3WBtg7pHBUSOf0wmkQV5ZYogWJwTydIE3inh40R37UT1IYCvRqgxp/hB?=
 =?us-ascii?Q?/+WfQQQ/HXcLJ1BNSPcl9OwDDXp31v0YuJSz2GSLbwx5NynN5xT241b6Tv2h?=
 =?us-ascii?Q?LzvjQmxcL9CzIqUTKPItAd5U7MBh0mQ558llTTb1uPfX20kKQnLjrHfZciSN?=
 =?us-ascii?Q?acFi0zcELtl+LKRSLDxU0xaLBq0wVlc5FRpDLDy1hBBj9bTApDx9Lza5lO+h?=
 =?us-ascii?Q?qJUcZVryNnMcEeEfNM/X85bLAmAiilW21TY+Cbu9q4fjcnPcBKLVqE8YcO5w?=
 =?us-ascii?Q?dIsZD2JlW1mV4NuiKkwqHsJaRydMG1ZVbY2Kkt57CVTxhKlCasegg4TF6Y5x?=
 =?us-ascii?Q?PCS/7vk4r2PiisWb2zsL2Bfn2W4VUAO2n7km6sksV9LOvBjgY4HvpSsaV5zk?=
 =?us-ascii?Q?YMnFfkJ2+xTh/VN9YUkF+4r0sloGogcegn0J+eg8660o7wioXP67TodxRcnq?=
 =?us-ascii?Q?VQN9ogg320GKbDFzrq94DkMUMRztXiLMckRAjV25eRC38nzfbc96DIFE38QD?=
 =?us-ascii?Q?GhGSj+8Af6nQ4mB4HSLXjcoOaYGPkX6RhxDh99DphgtrHkz/z/RVpONh4wxE?=
 =?us-ascii?Q?xCxbppHqP8MR2w4rSfKXZSRhui4sXS0p4lhGhq8xVgIInqMhd8v7qEhmex0X?=
 =?us-ascii?Q?ijadIxnoveZ4lfzVUPpl2CxEwzKmcoqgv2XzPkfXPbEEvxqygZrsS0TxXxMa?=
 =?us-ascii?Q?7ENgd3cSTcw6SJUx7n7g187itst4BTjql3gbw2NGIUK1NVyj+KqHkmzwtWSj?=
 =?us-ascii?Q?WgXhtemgvaBVZLTV1ahgTWkw8UM48igzRiH8W4rf3p+Tf56JXuTeXMJxGtdv?=
 =?us-ascii?Q?aEYXxnYgodYAIjpY9ySxv6ii/+atwZa/DdRxh0YsmWcoLoaxEDCpnsuviKCE?=
 =?us-ascii?Q?cqeo+WBeKoZhDaQXi7YY9+aBT6m/s0pVb2Cz2PbUxi8gzYu31t5NKbM0pRSc?=
 =?us-ascii?Q?AqKmzl34ByDnwofTyLPR3AuIOhLMkSoLS0Vk5Se9KuTbl5quWTn85y9dtpsy?=
 =?us-ascii?Q?eDoMCkG+HfIbLr2k5XipkU9xbQ9mCRT2+k1239Tp3If1uYiHwT+FAAD6DFhF?=
 =?us-ascii?Q?O0xDYp+dnhL1+/CY+b7rZLZGjN/6hxE9N7anSy7QP08KdVOUE2vHbJOYQNX6?=
 =?us-ascii?Q?gfKqzphC0h3a+kLPtdP27XJGOTLHzjuAWHDKeDX1yUhGaTogIfATM21oVFEL?=
 =?us-ascii?Q?5SWBNbupG/c/AG7DlF5C25ebkX2/hFgTBQQtGF4ZccySKP4inO3oTDd0wHrR?=
 =?us-ascii?Q?GDO9MsWsk4SIzpWdSqFX0Ij9LlUpVCS+8KZd718I3Y8kkx9AZZTsoQgDe1YW?=
 =?us-ascii?Q?tMonEmBJJfDL0wLYf3WrAuhLv6z9Kmmm9o9naB1SuRbVageKleMNJlHjCu/H?=
 =?us-ascii?Q?i3QQWVOYoWt1hEysJ8IaxzqCiL2Oua4Hm3S7zlEv3cMp5/Erf4UatcIMDJAr?=
 =?us-ascii?Q?tEl05v0EUiWaw5yiVrehRTEZwzDdd+shLseJhbvYx9qGmfIVC2D8a+xhJZvw?=
 =?us-ascii?Q?ylMCNTB2qRauaxHL+h9HYztsoyplLVBZzwRa7iBJ0H1OPUnbcby2QLcrm0+R?=
 =?us-ascii?Q?VKMj84b9P3hz9tMeFDa+txiVUwD0qOohhiG4Eo9ghhM5o8NDNDxHiKok6+FB?=
 =?us-ascii?Q?1zzb54Wh2iRdYGIJFaHn6CqJZh5NlZyaZRBjviRYjMK/MTtqe/AxVICCtugY?=
 =?us-ascii?Q?afeBi6Va35wPA4IQMDLBWq1IAh/Wuoe0O0dLvJusez41X5+zZCyEEhy95U4y?=
 =?us-ascii?Q?RGqCfebQ0g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb34500-103c-4ac4-99c8-08dee37db8b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:44.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3Nz9yvtfWHREDWbhBFGHhGx0cX7bUmc7++uvBzoZR1BDUXOaOLki0ZnECeW3NSOFdXODkkixmmJAGdbVcNl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140357_150421_06B97DEA 
X-CRM114-Status: GOOD (  14.57  )
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

Monitor domain directories under mon_data are named mon_<name>_<id>,
using the resource name as the label. For memory bandwidth monitoring on
a memory-side MSC the domain id is a NUMA node id, so labelling those
directories with the resource name ("MB") is misleading about what the
id means.

Add the RESCTRL_NODE monitor scope and a mon_domain_name() helper that
returns "NODE" for node-scoped resources (and the resource name for all
other scopes), then use it when building and removing monitor domain
directories. Node-scoped monitor domains are now named mon_NODE_<id>,
making it clear the id is a NUMA node id. L3 and telemetry naming
(mon_L3_<id>, mon_PERF_PKG_<id>) is unchanged.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/rdtgroup.c   | 25 +++++++++++++++++++++----
 include/linux/resctrl.h |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 0bdcf6dd935c..db0255951f0e 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3947,6 +3947,20 @@ static void mon_rmdir_one_subdir(struct kernfs_node *pkn, char *name, char *subn
 		kernfs_remove_by_name(kn, subname);
 }
 
+/*
+ * Label used in the mon_<label>_<id> monitor domain directory names. Node
+ * scoped monitoring (for example MB on a memory MSC) uses "NODE" so the id
+ * is understood as a NUMA node id; other scopes keep the resource name
+ * (L3 -> "L3", telemetry -> "PERF_PKG").
+ */
+static const char *mon_domain_name(struct rdt_resource *r)
+{
+	if (r->mon_scope == RESCTRL_NODE)
+		return "NODE";
+
+	return r->name;
+}
+
 /*
  * Remove files and directories for one SNC node. If it is the last node
  * sharing an L3 cache, then remove the upper level directory containing
@@ -3990,7 +4004,7 @@ static void rmdir_mondata_subdir_allrdtgrp(struct rdt_resource *r,
 		return;
 	}
 
-	sprintf(name, "mon_%s_%02d", r->name, hdr->id);
+	sprintf(name, "mon_%s_%02d", mon_domain_name(r), hdr->id);
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
 		kernfs_remove_by_name(prgrp->mon.mon_data_kn, name);
 
@@ -4094,7 +4108,7 @@ static int mkdir_mondata_subdir(struct kernfs_node *parent_kn,
 	if (r->rid == RDT_RESOURCE_L3 && r->mon_scope == RESCTRL_L3_NODE)
 		return mkdir_mondata_subdir_snc(parent_kn, hdr, r, prgrp);
 
-	sprintf(name, "mon_%s_%02d", r->name, hdr->id);
+	sprintf(name, "mon_%s_%02d", mon_domain_name(r), hdr->id);
 	kn = _mkdir_mondata_subdir(parent_kn, name, hdr, r, prgrp, hdr->id);
 	if (IS_ERR(kn))
 		return PTR_ERR(kn);
@@ -4149,8 +4163,11 @@ static int mkdir_mondata_subdir_alldom(struct kernfs_node *parent_kn,
  * This creates a directory mon_data which contains the monitored data.
  *
  * mon_data has one directory for each domain which are named
- * in the format mon_<domain_name>_<domain_id>. For ex: A mon_data
- * with L3 domain looks as below:
+ * in the format mon_<domain_name>_<domain_id>. The domain name is the
+ * resource name for cache and telemetry scopes (for example "L3") and
+ * "NODE" for node scoped monitoring (for example MB on a memory MSC,
+ * where <domain_id> is a NUMA node id). For ex: A mon_data with L3 domain
+ * looks as below:
  * ./mon_data:
  * mon_L3_00
  * mon_L3_01
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index cfb4c17bcb53..307803ea1b09 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -320,6 +320,7 @@ enum resctrl_scope {
 	RESCTRL_L3_CACHE = 3,
 	RESCTRL_L3_NODE,
 	RESCTRL_PACKAGE,
+	RESCTRL_NODE,
 };
 
 /**
-- 
2.43.0


