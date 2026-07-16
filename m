Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC76C44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBoVEZK1tAF557hq3+NYQ5YymsrdRFixE8MyNhgKL+c=; b=r5vAylqWtSB7zIS1GW2c0FKxSG
	WOnK5C2uFtdUNUcjNi1CPI9SdgKmKwnUv+bAam75uyDdWRniaWxdhx94Rk0xlkrK0gFjKraWrKnF3
	irtCRVz2sQP8UGFXMFlWzuGIoRHSWZ8yMsGAshkxA0camXKpxQ7FSaJzoX/t1Ngbx4Db4BtVOl5XU
	w8e06YEzXISEtouYlJBn3dhchzyIjwkoNY8sYwoBG6ePC6HiVVNZcIFR9nkl7k6GpF7N72R8+wKV+
	P/QEG+JLR2n0QdANesmQ1kTXqBfJV2KhtB0dhwc6L7eyzQzg1ubFoArewCao1nRKYERy6ddRW4VO8
	9qT4OaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFG-00000000Y43-1z9J;
	Thu, 16 Jul 2026 21:03:50 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFE-00000000Xx9-0DB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKpT/ePsPjz2lT8v+qduTgFn4oHHHDoRVRk8A5ZjEkhcXHfAUgJMb13kfW5Ta0qKqewe1S+VvJGYra+a0cWBm0939Od4i+KPiWDfq71Y9HxSzyHxXmjMNmIrQbH9IiKePHY59ByF5Ls1zzJwi9lBW9fb/fwkrZsjhC6vAn0tr+htd3+SSWpNdTJnvNcP5f+hPfszjll8zATrYJtw62NYDvKjQSEz/HRFEUSluP1mxM5icK/vvkCyCFR+yy2QA2wkt7dn/BRVpWNA7poUJ0hxzJX42sE8PI/vvxP/wvjIRAt5xS/cahx1gR5YgCDL9WJ5GumPmEqLNeaBFbhjqWytbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBoVEZK1tAF557hq3+NYQ5YymsrdRFixE8MyNhgKL+c=;
 b=Y7JsGurwJwqfJwkNrKgXsKKZQ6neuIS8kYIzOTqsg8lDMAW+uaIjtMaQA575zz0uOYndywAOSGHEohhqfKbSpBmc5u1nJ12PNU3OXvbbyRNzBiR4sg0A+/FKWMKKzv8FcpLh7ujKSsbaIkySxy6Jc3VhJuIuUm1dIkMWwRFfJotfUSiM/Hej8NOKRvC5HGHKV8DNMmowKvE74Qf/RjQP8x0KU+O1+v3Bc6OVFFai6x/Ey8ttmnnOHPnSN7J8jf9E30mxkVYoNdQ7JLYZ6m90VlC9Xvo0rGiImUlaG4zqwfMbUPFdUchIgn5nYY2ChK5qVABUiRL6juJTM2tTRBPo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBoVEZK1tAF557hq3+NYQ5YymsrdRFixE8MyNhgKL+c=;
 b=Sb32vLEQ+yZNGz3danLZhwbe3vW05wDGZeBlvo8YqY/RpJ0F9colmii7eJH4SI/6Jozxtt5z4rLIftzb6V3p+BLDqByRiwjWXLNorAY0JMEhr6kYfKKyD34XmUhIYqSIoihqLfTl2Y0Mf+WIzXhS4T4ncl/WY2pviCgehzPqYoXGxKUMwKaj6neXkyCDZR0EDKDD4aSDRuSWt50OeF2N1TP0uCieXccHsqwYNZ64xE3rem3UCkSsabH6QMdGvQxkizC1Ii4+DDK8cnHvQXOSnidX0iIRze8UIxMwPWRoVcDgp/mzZO5IC7QgpkMe7UDza/RmAfC9xgXsZsb/UPEVAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:35 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:35 +0000
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
Subject: [PATCH 04/23] resctrl: Expose per-control status in resource_schemata
Date: Thu, 16 Jul 2026 14:02:54 -0700
Message-ID: <20260716210329.2914625-4-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bb160f-8604-475f-d665-08dee37db326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: MZB5+GWNkuYFgNYEO9KIxFwpVXKrH51KcOzg8C4cVv/9JIEDcTDxROwzYOyJoBHvHKutw9cA2Az6XHJCC/1/uhZwN8iDpBx1swNU0G2RE+bHm39vdaKU8Qd7p37gHYkQt8/puXQ1N54Q1zBXXPU3sHAkLZ2LJ71uPH4fFqfN4ay5RZIKjoNTx73B53G6nXnC9h8NDCE18JTT7ijDhg4DPt+tmVAQAU3d2zGmw4FVbDvcx332z+a8T1n9eslIkcODIISQxzH7REYwxf/x74MmSGP01JKt0OEzUdGVk4igQZWNOgNdCibQhuWE1cic0oT926/GzoGqiV5WA6Xq9cUS2Zub8/2ihdj44KPPnlBS8nVtq+w05PVkYuoVxXEYT3hFMMjLUew46Yfbb5Q2uFwfj9x3EfpbxS5DwwAXrMi0f1r9SZMFeAoPdeUPtygb4A3qGnA4uZZ35QMcqBAAsgMTW660HEzmoLHs4ktEgNycR+LEexntYSXtwMQM0c1gPzXDOKA5w0yI72xFCdjtog3nuzxKYcJfihSQCPUrL4uHvhmZz9hCqQxWSwEYZr137+CHvcArzHTDraMpdqV45ogd/miE4nDa6UaUfjFjScz9LVBQtfZEwzctxxhd328qLcYlZfNqe2LZY/5hzIC8tdLDGQSBdvUFQgkPa+FNvAM9NOibq5ORU/BMfcNz1Wbn3qWS+3Tm2mb4o7T9zghiNF0M1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sqbN74YA32haP2ug9EZpu671ogna0fTY4Fv+mXpRSTw4S2yK1pIqUMLclEsk?=
 =?us-ascii?Q?vX4EnK7AdD4P3lKj/M8+GhPGMQnO7RgyYpyfl75YiuJrUX4ehWq2pws2vx/q?=
 =?us-ascii?Q?bgnDZXjFilllnkFOozHY73GfYYiIFXryGvyJscPP4uRJRWfQtjubVVjfefXi?=
 =?us-ascii?Q?OyzHexZocdM/ZekXeX7ZF3PY/FO/eRNdrhuZwybjGJl+d30WETeI+Y/fwV+s?=
 =?us-ascii?Q?rxgz3RvS9IqrHxcoWLQmPQyz8q9EJ51DYk1uTQDZsl1DjlZhgwor7XxIsCwi?=
 =?us-ascii?Q?qHkF2SRwA9Jfk007FMVUX0IQizElaMvjTSHQzd8aNjihsYxxCtySKIUxL6CP?=
 =?us-ascii?Q?FbKmgDpTCIt2ccWhz6T2rhXDYwa6aGh03GwaowuADTmgMq4b4OCmRHjrcMBy?=
 =?us-ascii?Q?AG0IPS3P3DBgTRyeS2CPEa8hGhxACSZvAAMFU6yG8T7/2eBUdD2dm7m5IzFo?=
 =?us-ascii?Q?PFn2KmkiH/y2eWGdSNgeQTRfbY7aXDZW4bd2GlZE/fWNmuUPL/g57lXTlG8D?=
 =?us-ascii?Q?mE1xbU8VV85uQaHpoEgqkhU2SMkDYejBT8/AItA1Aa5fP++tfT8W9qGJ7rp3?=
 =?us-ascii?Q?KyYV3T+DTLARNMPUoAII99F27FjA/w1go3+xaEqldGZCLoQMhQyShecxbaui?=
 =?us-ascii?Q?UoQjmo/DzhFLVh92LQiOj0Lj6Dr+ivYXtXnkULmX7lVupfheFJFN5r9w+nKv?=
 =?us-ascii?Q?xL8S9DvwDyMDJ996Nyoco8ZypBIrRpPuBk6usjEFBHGQ5V+o0jQi9mCqa5Zg?=
 =?us-ascii?Q?ssImPgxtrIwu9wEhVEsNu1lvtY+et5rJyAo2AfbeTwOPdq0cF+Kg1Nrfgodo?=
 =?us-ascii?Q?CWyNTWmLvxX6QN/6Bt/Eksu4en0J2ElXlLBTmlU+aOTFdnqTsaLm1e+Il5sR?=
 =?us-ascii?Q?nNqS/H2kJHzcUUIZCo5x5/Tx+OIo5lzod5ir0ZSmWd4QlJdPJ4Ch/BJr4uPr?=
 =?us-ascii?Q?kh60kQgZMbWFVIgJhYNj2A0PuWmImvf/4/zIQV7PpzQEcDMlwhlGj9BQhZRy?=
 =?us-ascii?Q?etVVKN7GAiFjcnzD2xv2y4phcBD4FYRmqXqDXTylmpu1TD4Xw5xcQP7qlhwo?=
 =?us-ascii?Q?iQm6CNC6q60mB6uY4avgQqWapgc1xZBXxXPmpj+0XVclBNvOIcH55fp8S116?=
 =?us-ascii?Q?b3U5BsmS4vddZlLEqJGZvR+zploEAWbHXG71feq50LeZBSzJqjPgqjDtSTHE?=
 =?us-ascii?Q?F2YMljVk8g9n82D/dooJ522by5gkWIjbYXWoRPYaCKWaGyRrCUfQRT5e37wx?=
 =?us-ascii?Q?KZCV/JFCd9ZH21Fu9xtrWTjBdivw7mNN/VONI+Tl3w4XAhMCpxzzi0Z/mszP?=
 =?us-ascii?Q?djiD4Afy0YLLnFidROxfs+yih/ba8A947SSoEGPS24geXFIRm9QhMl8cUH+6?=
 =?us-ascii?Q?zN26O/tQy/OL9Bndn22V0f3JMTIWn9aFbITOv3afYZkNk+Tjr/9zUqSG5DfK?=
 =?us-ascii?Q?dZu7j6eKt8a/mZb4un2CzVMAOQf0NUxYM9zeHZkSVwB9fK4OAV5sKBEaoNpp?=
 =?us-ascii?Q?+Qz8Zpa8gPRZMeRejdW0+PhWS33aGuTncA0VdBW1JH7r/iWpeWxfShCZu2L4?=
 =?us-ascii?Q?fWGICYCCiDtFyk/fYDilwxAQGQkFinC/7rsiCUcw2bxrsGxzfRpTzat+Jaau?=
 =?us-ascii?Q?egW/EWsdFIAGkHlTA+/uRMQsTKM+4FTwtWklDUjWMkVNavm6jw2rcUhs29QT?=
 =?us-ascii?Q?UrQ3VYZ/Wgmzgigw5n4jtDW7FdPSadfg+lPubgegss/LsBdHWe8t3Ma2XzJq?=
 =?us-ascii?Q?2VKLQ7QKEQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bb160f-8604-475f-d665-08dee37db326
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:35.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH/jo1ampseQzrrOBoYZBwe9zN8wi1AwOKYPanHxFkHZNkqJdAMe/JeeEf6S6OY9a3Aye1ed4lAw6DB9c/ESJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140348_092484_7D047F33 
X-CRM114-Status: GOOD (  14.26  )
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

Emulated MB controls can be individually present or absent depending on
what the underlying MSC advertises, but user space has no way to tell
which controls under resource_schemata are actually backed by hardware.

Track this per control and expose it as a read-only "status" file for
scalar controls, reporting "enabled" or "disabled". The state is stored
as resctrl_membw::no_mbw_hw, which defaults to false so every control is
reported "enabled" (hardware-backed) unless an architecture explicitly
marks it as lacking MBW hardware of its own. This keeps the common case
correct on all architectures with no per-arch initialization code.

This commit only adds the generic field, the "status" file, and the
default (hardware-backed) reporting. No architecture writes no_mbw_hw
yet, so every control reports "enabled" until a backend sets it. On
MPAM the field is assigned for the emulated, hardware-less MB control in
a later patch that adds the node-scoped MB_NODE control.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/rdtgroup.c   | 17 +++++++++++++++++
 include/linux/resctrl.h |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 6b1f24c6a1f2..a3aad9b1ff6e 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2318,6 +2318,16 @@ static int resctrl_ctrl_unit_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_ctrl_status_show(struct kernfs_open_file *of,
+				    struct seq_file *seq, void *v)
+{
+	struct resctrl_ctrl *ctrl = rdt_kn_parent_priv(of->kn);
+
+	seq_printf(seq, "%s\n", ctrl->membw.no_mbw_hw ? "disabled" : "enabled");
+
+	return 0;
+}
+
 static struct rftype ctrl_files[] = {
 	{
 		.name		= "scope",
@@ -2375,6 +2385,13 @@ static struct rftype ctrl_files[] = {
 		.seq_show	= resctrl_ctrl_unit_show,
 		.fflags		= BIT(RESCTRL_CTRL_SCALAR),
 	},
+	{
+		.name		= "status",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_ctrl_status_show,
+		.fflags		= BIT(RESCTRL_CTRL_SCALAR),
+	},
 };
 
 static int resctrl_add_ctrl_files(struct kernfs_node *kn, struct resctrl_ctrl *ctrl)
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 4fc41e269d0b..5d8ea12ae16b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -289,6 +289,9 @@ enum resctrl_ctrl_mode {
  *			"all" for a proportional schema. Base unit of an
  *			absolute control, for example "GBps".
  * @mba_sc:		True if MBA software controller(mba_sc) is enabled
+ * @no_mbw_hw:		True if the control has no MBW (mbw_max) hardware of its
+ *			own. Defaults to false (hardware-backed); architectures
+ *			set this for emulated controls that lack hardware.
  *
  * With a control value "C" written to the schemata file, min_bw <= C <= max_bw,
  * the amount of resource allocated by this control is:
@@ -303,6 +306,7 @@ struct resctrl_membw {
 	u32				scale;
 	enum resctrl_ctrl_unit		unit;
 	bool				mba_sc;
+	bool				no_mbw_hw;
 };
 
 enum resctrl_scope {
-- 
2.43.0


