Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73061C44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QASWqqWTuEsVM+OwhLywMjqv9YzzNDcby31IXS/H5Dc=; b=xsRR9VxIp99JRPRoW+NryRcc3b
	zqj7RPrq55Qz1w5lq3Kru1YoOMHRWJFBlev3iBm6VDCr+bK67G5YuRKeeaLlu8Eev8mTpaHGosFG4
	uz4Uv2zg/tNIw2T6lN9dd+Sn6BIkPJ9soA2++Lm/FkYEeqBPisDNq4V9GWJBh6dxisIYZNHAQdrmb
	HwGkqBn+jHvQBpBGWksl25nrkL+6w9KTY74D8MZ1DHIKGgLFhRyMEvnKJhsaF591v1Fl45rOpAOd2
	qaS9xegq3fnkNRhAx9QOijW4tFBIFt/qlwRDYlNtNqNaIl+O5g/Y6QhYXV2nJiwVHRigrG6WZ/dnV
	oRbwzBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFU-00000000YIM-1EOu;
	Thu, 16 Jul 2026 21:04:04 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFK-00000000Y2O-0Utd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyXUc+T7rw/DLO0UHikwQQg6A1xg+aPd5Y09eqWOpgx97g6oZhWfgHhELktjvw36p1V2DPLX2ZRnkohpKCBHXFjJwyf2R8+ItNrdNB4gKukrcIDm7HcRZwJ/CE2siDeOsz2YLLL6yTzf8IHCRMoB+DVMGvOOfG5Ix8EF24h6Pbz2k0gpnNgdt9kPsh11VIdewfMpIUD20dsok+uquChZHddjkmldEKqRAWpqYXv3yHn9lWlDmvwpLyDyQMQO2kDWQtfBl/FXGnl3kks07VYvs4AvZK5D8d9S0SltJe5Tn6uFAagFzf2K1ONATIXWCs8g/IXCg6amyz04x7UkPV722A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QASWqqWTuEsVM+OwhLywMjqv9YzzNDcby31IXS/H5Dc=;
 b=UTjZy4WeR3Ngj+LiX4nfOaJuPwLD6H/nXxpDBO3j7CywaSY5qkzK90WuZzyG5Ly40yDotg+CrK7Yt7xHIIwlPGpr4HUgtZzGaZbaECCpRTKcvmSxynat18A9YC+2bH/OSmks2S5f66aBa6GXH3kUeYds35JL71iDdjbdt4rHBUpSXF85lYpIQhxvH4IIbP+GGm63nPL2qrQHK6IZF1kMH7QcJEt0vEmC18AQQwFj73izsw88sx+l4o9vD2fcAhDZPO+koXakkcE93zPLR9sg+wvXOQoYN09TKy5oJxZugEL+MxX8PPdJiTt/xMb7QUrI5KARE7zxrYe0+Lpaqr7Rqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QASWqqWTuEsVM+OwhLywMjqv9YzzNDcby31IXS/H5Dc=;
 b=MBmcZ7GrbyDuhw7N2WexDAHwkeRnBwyDPDwVBZJEGsYd7dx58IW+BjeEWO7bOFNV4NNMhEcKtpcEPlstw13jtfqksVVee5/A+1KzGQiT8Sp0rq01qT+n0Ll8Z07dg2pcziIHIibQGcixp4VuyFwi3eQE7DnO2W+Ypnn1DzliHFNZ1hiTpCRBNhcMlsvAonMyjJyyGXCTTSYQASVZ2heqGkZMSvYKjTbopLyghi18DnSCzbk15y57ET6pw5wkfQqKMxIOAxfuYEJ1U2h2fm3EekuavroFiffLFQXuRNx4kZV+Pq8Ofkc88GnI0sWAYj+7viYzAK9a3m0FA6/xpau4Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:40 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:40 +0000
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
Subject: [PATCH 07/23] resctrl: Rebuild resource_schemata subdirs on MBA mode change
Date: Thu, 16 Jul 2026 14:02:57 -0700
Message-ID: <20260716210329.2914625-7-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 06461669-57d9-4601-4d7e-08dee37db59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|3023799007|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: ASCtjE25cKAAysL98DkydZ1s87ojRRWZbOooiMNSo5t3sB8apS0Kvl0q/Po6xElWXJdMS0cjsTiVcTnPwyo9ZXBH0D1LutOVcunJGfNvAhTGLvtpm8Xt/CpWjhT1C4U+1MKLkOeeZb9QMncyD2smZwS0w+q9LFXJQWyHRHgWJRoftnXjAv+npBio0NtTK16Tcum9K4HJQBcAqdwA2ulf3sQdPpJDEd/HYzuEHKzNwBSPO6lf1MbOqH4tMe9ne2aHAmiSKu2/qKO9p0IDYuWFIbix052MRMOMzaL8fA0q+qYAit91KPFOVTb6tMnvCasm+06rl9Qz62jNoH1SF2aImDTZJvZ9cDFmmknWaoxyihXsq+cQCWoRqRFjrH0xYlbllQu2X/SO9nq6D80KoS+ohmU6a01TnwuPtHS0SqjIO6DWHv0hOeJCBZritmaF9AQgX9vjfXolWAMCkw48rxzgq6WJP8cEysijY+6Jt01w3Zn+ednH5ph9ok4PZQPXmylhL2DGXsnj7InBCblgoIoKum/+fHQedCtXnhU9diOl7uVV2cwVwsDrrwz2ImFgCpuFHSakkKUrk05sdQZodaJpSCiCeH/g6bJr2sf2Y5wAnkBiu6hFXpRLHEa8vB2IMvtvwuwtz2t5jkDxX2UCUsfWTmTswNGYZuOlOnjx6BLqC2V0M/hzVRt05Uz85qcUL2SQ/6HtMOW3b96neaa3c3gtAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ac0aUrOPpHXdJkWQ8fe55kNxyxcAMC8kFw9ukqyUQlUYRcKK9fpSiFnbOQKn?=
 =?us-ascii?Q?k/SphF9Gyw91xEvKvqLO2AdHgMC/K1FtNiJhdvUQIq2o/XvjhZQA37hDfeCJ?=
 =?us-ascii?Q?TimQI+yMgysHGivQJfwGEStipthvhfdfwYpk8YMCM0xw4UXhc03pln69rREb?=
 =?us-ascii?Q?wznXu+pvtK4Y0iLYzSdUao61p7P1lrYfTx6zoHe9z6l6CZLgV0hj47Ybt5fV?=
 =?us-ascii?Q?4PVGTwnlSH7LRYRIDMFGw0oPstp6bSH+9rLEVVaWOsu9yzCJPeTTiAAhqYCo?=
 =?us-ascii?Q?vRnseQiYP/roASA4d3WB09nLrvkZsym8kFNoX6ZcV/uU0YeWQDg97NoVODlV?=
 =?us-ascii?Q?kEgFL6Jmt2b3A19ZftYiTsGARuz/naYRQG7iYRSOof6Jw/rIuz6R/ZbbAQAv?=
 =?us-ascii?Q?4awM+vhjUtXEh5pjjN7ORfQkdk8+Bwq7bXRA0JZ12G4v6aBiOMowzQbXTrTL?=
 =?us-ascii?Q?C3c/hgvCjiOVMnYD6UIBh51zbMzF3JsYB+ACc86wMQbkbnhlN7KGoPa4DjID?=
 =?us-ascii?Q?Fa3qMXgskRPE+vQN1OjExd+5Z6NaLrzffJzzuwfR7MtZK2WvBrncEEjPB8Op?=
 =?us-ascii?Q?Il+/ns6Nm0r5hPePFq9mcXYQYXNP/IQSjlpdICeY8hwIKLgVNhcN/oddWUGd?=
 =?us-ascii?Q?kVlScqH3CJLesxNytKmwcKJZSVZYqSh0IpVablFkJBONs3QOvn6hpIFmZa7J?=
 =?us-ascii?Q?NJ7ZAYYRcDSAtW1QWl/mIFWkpjrVfPilRiaLtiLh8IBtWTVKNICaT7HNeM3q?=
 =?us-ascii?Q?KFHDu17+hN8BHim8I+hIjSYYUbr+5OenWF0ZVMFQAEVzXRdqoyovA1RJKVgh?=
 =?us-ascii?Q?TheXrUMRr3xi08K92tuhoXyAVFHfhryhpQ5y7XhzVOpUR1Z8eDHSt9ufj6Uf?=
 =?us-ascii?Q?eyoorsmh+flmGvsmiRru46EUlxkIuXbkgZlTVGYrxPn2KkXE754sKkBjDPhK?=
 =?us-ascii?Q?vzw60q/9781hQ6pEW4ZObdv6UQxf48wVQg1nMweH+uPMXTRwJGBpeN7PjEqP?=
 =?us-ascii?Q?T5065O54ho8z8QcbnluZqjT4IzEaNYRo7UlsdUC+BaV7SLPMmj1T/SHEE98C?=
 =?us-ascii?Q?mQ2DeTjyaW4tTnrRfR6mxWCYIFLvMdcj+ZXT1mJ/ic8X3fdpud1677U9hZZo?=
 =?us-ascii?Q?t0TIbE1XZqJMANqChjGNLbziHpWnKgOyyIWbc2piEidEs4aG8l24UNrrQ0a4?=
 =?us-ascii?Q?WYTzq8PkrFWGKaqkzkDNs8fDMq3iTo4qTCNIRVjxt2dsSRkb/PJWFrg6L2fL?=
 =?us-ascii?Q?OJGO9DMMrlzas7/V0mgdCL5EO28f4snLkCQwh/Yte7vZW4QyAAisJU4dHVuH?=
 =?us-ascii?Q?gVCuxngdslXGGR5tSTnULr6a1L5nNMcGwFx3zQVoy5CQDfL1ST50cnbILcw3?=
 =?us-ascii?Q?rv7VL3QrUf8BGZuWGK16OJzI5UUPtdd9G9VPt9K9D7yywi7j4HAZ+hdvTHjW?=
 =?us-ascii?Q?6RBPF8tDsZqmPbrZzHIxLDmmV43lE/gkBm9mrVV+cBvnl8XBkLNxtuxh+s8g?=
 =?us-ascii?Q?/y8W0VpILFXREAFyQml5eGB6Su2rZkZCfNn4qQkAPvpsJrxZZ8GiwZDCNIen?=
 =?us-ascii?Q?rT97mo+dxHhTWQkKIdZ9qJ50NrG87R4Vxodor4db82Mc2CgTJY43EFU1g14c?=
 =?us-ascii?Q?2pA7se5SOUWF4I0RILSm34TXuQYcUEQqADxCwUMOuEXE5PhVG9gOrz/ZEN6w?=
 =?us-ascii?Q?iwsAft4PgRaMIIXZW647SXqtztsKX7x9TwNkl184O2Mcws4RhoGztWew4xxa?=
 =?us-ascii?Q?Gz4kI9XCgA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06461669-57d9-4601-4d7e-08dee37db59b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:39.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mo72oLGBf+CR+Uqm266yxnsCxtKMef+izh7/wIwzNSKQOBjDgcXT82eu8MB7wh38mnG49TOzWtUUlHrsPqPfSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140354_171427_FEE8D722 
X-CRM114-Status: GOOD (  24.92  )
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

The resource_schemata directory layout is mode dependent: in legacy mode
an emulated control (one without MBW hardware) is nested under the default
control that emulates it, while in native mode every control sits directly
under resource_schemata. The mode file added earlier is read-only, so the
layout is built once at mount time and can never change.

Make the mode file writable and rebuild the control subdirectories when
the mode changes, so the tree stays consistent with the new mode and with
the schemata file contents. Add resctrl_ctrl_mb_mode_write() and register
it on the mode file (switching it from 0444 to 0644). Factor the
per-control directory creation out of resctrl_mkdir_schemata_dir() into
resctrl_ctrl_create_subdirs(), add resctrl_ctrl_remove_subdirs() to tear
the control directories down, and drive both from
resctrl_ctrl_rebuild_subdirs(), which is called from
resctrl_ctrl_mb_mode_write() whenever the mode actually changes.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/rdtgroup.c | 334 ++++++++++++++++++++++++++++++++----------
 1 file changed, 260 insertions(+), 74 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a34c7ed8f874..d81877a5cd72 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -995,6 +995,15 @@ void *rdt_kn_parent_priv(struct kernfs_node *kn)
 	return rcu_dereference(kn->__parent)->priv;
 }
 
+static struct kernfs_node *rdt_kn_parent(struct kernfs_node *kn)
+{
+	/*
+	 * Valid within the RCU section it was obtained or while rdtgroup_mutex
+	 * is held.
+	 */
+	return rcu_dereference_check(kn->__parent, lockdep_is_held(&rdtgroup_mutex));
+}
+
 static int rdt_num_closids_show(struct kernfs_open_file *of,
 				struct seq_file *seq, void *v)
 {
@@ -2713,6 +2722,173 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 	return WARN_ON_ONCE(1);
 }
 
+/*
+ * Format the sysfs directory name of @ctrl (for example "MB" or "MB_NODE")
+ * into @buf. Returns -ENOSPC if the name would be truncated.
+ */
+static int resctrl_ctrl_full_name(struct rdt_resource_final *f,
+				  struct resctrl_ctrl *ctrl, char *buf, size_t size)
+{
+	int ret;
+
+	ret = snprintf(buf, size, "%s%s%s",
+		       f->name, resctrl_ctrl_is_default(ctrl) ? "" : "_",
+		       resctrl_ctrl_is_default(ctrl) ? "" : resctrl_ctrl_name_str(ctrl->name));
+	if (ret >= size)
+		return -ENOSPC;
+
+	return 0;
+}
+
+static int resctrl_ctrl_create_subdir(struct kernfs_node *kn_dir,
+				      struct rdt_resource_final *f,
+				      struct resctrl_ctrl *ctrl, struct kernfs_node **kn_ctrl)
+{
+	char ctrl_full_name[20];
+	int ret;
+
+	ret = resctrl_ctrl_full_name(f, ctrl, ctrl_full_name, sizeof(ctrl_full_name));
+	if (ret)
+		return ret;
+
+	*kn_ctrl = kernfs_create_dir(kn_dir, ctrl_full_name, kn_dir->mode, ctrl);
+	if (IS_ERR(*kn_ctrl))
+		return PTR_ERR(*kn_ctrl);
+
+	return rdtgroup_kn_set_ugid(*kn_ctrl);
+}
+
+/*
+ * Create a control subdirectory for each control under the
+ * resource_schemata directory @kn_subdir.
+ *
+ * No need to cleanup on exit - caller removes the created directories on
+ * failure (either via the recursive kernfs_remove() of an ancestor or by
+ * rebuilding the subdirectories).
+ */
+static int resctrl_ctrl_create_subdirs(struct kernfs_node *kn_subdir,
+				       struct rdt_resource_final *f)
+{
+	struct kernfs_node *kn_ctrl, *kn_ctrl_def = NULL;
+	struct resctrl_ctrl *ctrl, *ctrl_def = NULL;
+	struct rdt_resource *r = f->res;
+	int ret;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	/*
+	 * Create the default control sub-dir first. Emulated controls are
+	 * nested underneath it and may be iterated before it, so it has to
+	 * exist before the rest of the controls are created.
+	 */
+	for_each_resource_ctrl(ctrl, f->res) {
+		if (ctrl->name != RESCTRL_CTRL_NAME_DEF)
+			continue;
+
+		ret = resctrl_ctrl_create_subdir(kn_subdir, f, ctrl, &kn_ctrl_def);
+		if (ret)
+			return ret;
+		ret = resctrl_add_ctrl_files(kn_ctrl_def, ctrl);
+		if (ret)
+			return ret;
+		ctrl_def = ctrl;
+		break;
+	}
+
+	for_each_resource_ctrl(ctrl, f->res) {
+		if (ctrl->name == RESCTRL_CTRL_NAME_DEF)
+			continue;
+
+		/*
+		 * In legacy mode the emulating control is nested under the
+		 * default control it emulates (the default control's
+		 * emulated_by points at it). In native mode there is no
+		 * emulation, so every control sits directly under
+		 * resource_schemata.
+		 */
+		if (r->mode == RESCTRL_CTRL_LEGACY &&
+		    ctrl_def && ctrl_def->emulated_by == ctrl)
+			ret = resctrl_ctrl_create_subdir(kn_ctrl_def, f, ctrl, &kn_ctrl);
+		else
+			ret = resctrl_ctrl_create_subdir(kn_subdir, f, ctrl, &kn_ctrl);
+		if (ret)
+			return ret;
+
+		ret = resctrl_add_ctrl_files(kn_ctrl, ctrl);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Remove every control subdirectory under the resource_schemata directory
+ * @kn_subdir, leaving the directory itself and its own files (for example
+ * "mode") in place. The default control directory is removed recursively so
+ * any control nested underneath it is removed too; removing a control that is
+ * not a direct child is a no-op.
+ */
+static void resctrl_ctrl_remove_subdirs(struct kernfs_node *kn_subdir,
+					struct rdt_resource_final *f)
+{
+	char ctrl_full_name[20];
+	struct resctrl_ctrl *ctrl;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	for_each_resource_ctrl(ctrl, f->res) {
+		if (resctrl_ctrl_full_name(f, ctrl, ctrl_full_name, sizeof(ctrl_full_name)))
+			continue;
+		kernfs_remove_by_name(kn_subdir, ctrl_full_name);
+	}
+}
+
+/*
+ * Rebuild the control subdirectories under resource_schemata to match the
+ * current mode. Used when the mode changes at runtime.
+ *
+ * The control directories have the same names in both modes (only their
+ * nesting differs), so the old directories must be removed before the new
+ * ones can be created - kernfs_create_dir() would otherwise fail with
+ * -EEXIST. Between the removal and the following kernfs_activate() there is
+ * a brief window in which resource_schemata contains only its own files (for
+ * example "mode") and no control subdirectories. This is acceptable: the
+ * rebuild only happens on an explicit mode write, runs under rdtgroup_mutex,
+ * and the control subdirectories are purely informational (scope, type,
+ * status) - the actual bandwidth configuration lives in each group's
+ * "schemata" file and is unaffected.
+ *
+ * On failure any partially created subdirectories are removed, so
+ * resource_schemata is left with no control subdirectories at all (its own
+ * files such as "mode" remain). The caller is expected to restore a
+ * consistent layout, typically by reverting the change that triggered the
+ * rebuild and calling this function again. If that second rebuild also
+ * fails there is no further automatic recovery and the control
+ * subdirectories stay missing until the next successful rebuild or a
+ * remount; the caller should report this to user space.
+ */
+static int resctrl_ctrl_rebuild_subdirs(struct kernfs_node *kn_subdir,
+					struct rdt_resource_final *f)
+{
+	int ret;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	resctrl_ctrl_remove_subdirs(kn_subdir, f);
+
+	ret = resctrl_ctrl_create_subdirs(kn_subdir, f);
+	if (ret) {
+		/* Drop any partially created subdirectories. */
+		resctrl_ctrl_remove_subdirs(kn_subdir, f);
+		return ret;
+	}
+
+	kernfs_activate(kn_subdir);
+
+	return 0;
+}
+
 static int resctrl_ctrl_mb_mode_show(struct kernfs_open_file *of,
 				     struct seq_file *seq, void *v)
 {
@@ -2738,12 +2914,91 @@ static int resctrl_ctrl_mb_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static ssize_t resctrl_ctrl_mb_mode_write(struct kernfs_open_file *of,
+					  char *buf, size_t nbytes, loff_t off)
+{
+	struct rdt_resource_final *f = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = f->res;
+	enum resctrl_ctrl_mode mode;
+	int ret = 0;
+
+	guard(mutex)(&rdtgroup_mutex);
+	rdt_last_cmd_clear();
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n') {
+		rdt_last_cmd_puts("Invalid input\n");
+		return -EINVAL;
+	}
+
+	buf[nbytes - 1] = '\0';
+
+	if (!strcmp(buf, "native")) {
+		mode = RESCTRL_CTRL_NATIVE;
+	} else if (!strcmp(buf, "legacy")) {
+		mode = RESCTRL_CTRL_LEGACY;
+	} else {
+		rdt_last_cmd_puts("Invalid input\n");
+		return -EINVAL;
+	}
+
+	if (mode != r->mode) {
+		enum resctrl_ctrl_mode old_mode = r->mode;
+
+		r->mode = mode;
+
+		/*
+		 * The resource_schemata directory layout depends on the mode
+		 * (emulated controls are nested in legacy mode only), so rebuild
+		 * the control subdirectories to match the new mode.
+		 */
+		ret = resctrl_ctrl_rebuild_subdirs(rdt_kn_parent(of->kn), f);
+		if (ret) {
+			int rollback_ret;
+
+			/*
+			 * Roll back to the previous mode and rebuild so the
+			 * mode reported by this file stays consistent with the
+			 * directory layout.
+			 */
+			r->mode = old_mode;
+			rollback_ret = resctrl_ctrl_rebuild_subdirs(rdt_kn_parent(of->kn), f);
+			if (rollback_ret) {
+				/*
+				 * The rollback rebuild also failed:
+				 * resource_schemata may now be missing control
+				 * subdirectories. Report the inconsistency to the
+				 * kernel log and to last_cmd_status, and return
+				 * -EIO so user space can tell from the write()
+				 * error that the filesystem state is unreliable
+				 * rather than just that the mode switch failed.
+				 */
+				pr_err("%s: failed to restore resource_schemata (mode change error %d, restore error %d), control subdirectories may be missing\n",
+				       f->name, ret, rollback_ret);
+				rdt_last_cmd_puts("resource_schemata rebuild failed\n");
+				ret = -EIO;
+			} else {
+				/*
+				 * The requested mode change failed but the
+				 * previous mode and its directory layout were
+				 * restored, so the filesystem is consistent. Keep
+				 * the original error from the forward rebuild.
+				 */
+				rdt_last_cmd_puts("Failed to switch mode, reverted\n");
+			}
+		}
+	}
+
+	return ret ?: nbytes;
+}
+
 static struct rftype resctrl_ctrl_mb_files[] = {
 	{
 		.name		= "mode",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_ctrl_mb_mode_show,
+		.write		= resctrl_ctrl_mb_mode_write,
 		/*
 		 * Directory-level file, not per-control: fflags is only a
 		 * presence flag here, not the BIT(ctrl->type) type filter used
@@ -2781,26 +3036,6 @@ static int resctrl_ctrl_add_files(struct kernfs_node *kn)
 	return ret;
 }
 
-static int resctrl_ctrl_create_subdir(struct kernfs_node *kn_dir,
-				      struct rdt_resource_final *f,
-				      struct resctrl_ctrl *ctrl, struct kernfs_node **kn_ctrl)
-{
-	char ctrl_full_name[20];
-	int ret;
-
-	ret = snprintf(ctrl_full_name, sizeof(ctrl_full_name), "%s%s%s",
-		       f->name, resctrl_ctrl_is_default(ctrl) ? "" : "_",
-		       resctrl_ctrl_is_default(ctrl) ? "" : resctrl_ctrl_name_str(ctrl->name));
-	if (ret >= sizeof(ctrl_full_name))
-		return -ENOSPC;
-
-	*kn_ctrl = kernfs_create_dir(kn_dir, ctrl_full_name, kn_dir->mode, ctrl);
-	if (IS_ERR(*kn_ctrl))
-		return PTR_ERR(*kn_ctrl);
-
-	return rdtgroup_kn_set_ugid(*kn_ctrl);
-}
-
 /*
  * No need to cleanup on exit - caller calls the recursive kernfs_remove()
  * on failure.
@@ -2808,8 +3043,7 @@ static int resctrl_ctrl_create_subdir(struct kernfs_node *kn_dir,
 static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
 				      struct rdt_resource_final *f)
 {
-	struct kernfs_node *kn_subdir, *kn_ctrl, *kn_ctrl_def = NULL;
-	struct resctrl_ctrl *ctrl, *ctrl_def = NULL;
+	struct kernfs_node *kn_subdir;
 	struct rdt_resource *r = f->res;
 	int ret;
 
@@ -2827,48 +3061,9 @@ static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
 			return ret;
 	}
 
-	/*
-	 * Create the default control sub-dir first. Emulated controls are
-	 * nested underneath it and may be iterated before it, so it has to
-	 * exist before the rest of the controls are created.
-	 */
-	for_each_resource_ctrl(ctrl, f->res) {
-		if (ctrl->name != RESCTRL_CTRL_NAME_DEF)
-			continue;
-
-		ret = resctrl_ctrl_create_subdir(kn_subdir, f, ctrl, &kn_ctrl_def);
-		if (ret)
-			return ret;
-		ret = resctrl_add_ctrl_files(kn_ctrl_def, ctrl);
-		if (ret)
-			return ret;
-		ctrl_def = ctrl;
-		break;
-	}
-
-	for_each_resource_ctrl(ctrl, f->res) {
-		if (ctrl->name == RESCTRL_CTRL_NAME_DEF)
-			continue;
-
-		/*
-		 * In legacy mode the emulating control is nested under the
-		 * default control it emulates (the default control's
-		 * emulated_by points at it). In native mode there is no
-		 * emulation, so every control sits directly under
-		 * resource_schemata.
-		 */
-		if (r->mode == RESCTRL_CTRL_LEGACY &&
-		    ctrl_def && ctrl_def->emulated_by == ctrl)
-			ret = resctrl_ctrl_create_subdir(kn_ctrl_def, f, ctrl, &kn_ctrl);
-		else
-			ret = resctrl_ctrl_create_subdir(kn_subdir, f, ctrl, &kn_ctrl);
-		if (ret)
-			return ret;
-
-		ret = resctrl_add_ctrl_files(kn_ctrl, ctrl);
-		if (ret)
-			return ret;
-	}
+	ret = resctrl_ctrl_create_subdirs(kn_subdir, f);
+	if (ret)
+		return ret;
 
 	kernfs_activate(kn_subdir);
 
@@ -4566,15 +4761,6 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	return 0;
 }
 
-static struct kernfs_node *rdt_kn_parent(struct kernfs_node *kn)
-{
-	/*
-	 * Valid within the RCU section it was obtained or while rdtgroup_mutex
-	 * is held.
-	 */
-	return rcu_dereference_check(kn->__parent, lockdep_is_held(&rdtgroup_mutex));
-}
-
 static int rdtgroup_rmdir(struct kernfs_node *kn)
 {
 	struct kernfs_node *parent_kn;
-- 
2.43.0


