Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B69C624D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+1oHpiwftU4wshZL8AYhsKoLIxzRvy3/9fx93m2aXc=; b=Tg9fA55+UyJe+/78wUYu034/aS
	sLe6grXekU1q4eg1E6YbAJSbU1K8UhLQeSBjX7USnVFycrSOSpiyzltNPZTMjgbb9tgWpHDqDol5G
	jNk4VB9/A58dQJUhCXOdniicJW6zUR8NrzmTwQ8XN5sui85ml11re6wsqoCLMSDNUNWILJOQQEK8z
	XEuvR8LtDYZvxCCNebEAz9I3R9vr2IdyIxOX4Bs4NXU2gSj9RjWUfc5QDmq38Nxq4lqNvtuoE1eKz
	R/nDRbOBKvynJGqxws5CJ5Y2Qdn1ZPupxXnYKMUoS9Qs/PAIufHF2NIS0ET9sGbd0nWn11ecC2nrF
	s/Nv4lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15jJ-0000000AAeY-04at;
	Mon, 31 Aug 2026 17:23:33 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15iy-0000000AAGH-1C2H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:23:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/Tedcd7Ws4R/lb4ZxaomSfu1bjYr/rGOUGJ30/RXKEX4V48D9ojljfY/LHoe2Orug0jYpRAT+lSxSOT9W1Z9/g6DTXFtGwdTY0eKdbt5pIuTsgcvDglsXrof7cbAVXum7mICjNNEKkAancgGEykU7D1y39313kPVwqL61j0mTROxBuww4l4t5gvUdD+HSV0Ia1hHEG3nz/2oT5/T97skzA0ulsWCsqFLKu0NHdIoRHW+fEn5EfJo34SSCeKCj+tO8gKDcHAk/gfMT7cz7fQBEXcdCe026c4DRi1BHU9weVD6OMk4IQbFtWPchczBSm/2aiNIte/Pa7Ayx2emSi8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+1oHpiwftU4wshZL8AYhsKoLIxzRvy3/9fx93m2aXc=;
 b=LPfcu3Av7m6U//O7S5PcddQz6Rx/ebqm/Pv/JSK6H8Yg/QgaicCXRniVdSR5M0gBkcrWSrwQ8Ccgd7CTKhpuvwP3m1pZS2pkf3aeXwza4rVXIv34ghzDk6k7DTmR+oaSJ/OONVwLIUjPf6MmA0eP2py8viAHsMhQc3uJ3HY5m0g9Bg4VaSWUsMVzQaVQfhzbMMBiRpIYEURDX1OPEAszkChfPiXw67E9b7G6/wDteKuGkz6j41aTAHR+xo0uQzk0o1iho9V4sSzQNywhv+t0WrplB0ikccSN2u+8pK6/Eznaj/ITS44osUNk30iPmaUPpaL8NWqGBwq9ixrZTJ39aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+1oHpiwftU4wshZL8AYhsKoLIxzRvy3/9fx93m2aXc=;
 b=Ts5V8F/Ct8Lsq2l8LvwV5Ja3vfr8h4QIVibkQgXUw47YadA6BolS1OmjjnXG6ecoWuQogYGt9Xuxir2u2EHMMdwHoEes4/B42JqXX7ghE66GcX/glUX8b2Gguy3UIwdomvFV2IUUmCCcpH8lHtjbclakpQiPqRIxV3I6paG4Iqqn6RR4l7/CuPIE1PbnpFFtLnqTNh0Vf4YXwPzEy8vUIOPR1Lfaf9choD5qa8efTwWTdAfZx0noD6QiUPEwvhS+F7t6FRxT1+dq8D5xulC5Vt2UB2D5i7YslEXUVVY0RCodiGyEHBZovXFoWTcKlkgF6U4t46c+hrKyim1IqE9TMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by SJ5PPF0C60B25BF.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:23:02 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:23:02 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Richard Cheng <icheng@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC v2 09/19] fs/resctrl: Take memory hotplug lock whenever taking CPU hotplug lock
Date: Mon, 31 Aug 2026 10:22:35 -0700
Message-ID: <20260831172245.42253-10-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831172245.42253-1-fenghuay@nvidia.com>
References: <20260831172245.42253-1-fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|SJ5PPF0C60B25BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 7593cd4b-96f5-4b34-43f9-08df078482fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|10067099003|921020;
X-Microsoft-Antispam-Message-Info: EfDAu9wN/tQXf7WQRDT+sD4CqSUrCXlQHsj/Q6W6XoT4AjRPv/aA7hY7IAgI3eSHJi4lFf+D5m/iGiA+t9aw+iaGnF/PUlSTknzmuEfniS9cbcEEB1VKcRQunvUYH5gPXKWyEyIzx+s8J/ji2RYzw7dk8y+Q0TTcAGBfuJ+qPlDesjIFm0s6mdFht/NtWPn3xVLDp4z9AtfZsRRdLjgw6BOOABxZhtIEW/JXvYkhM+jAO8qv3AWettGuRLWurYWZLjIUUf3IvB/iZ7QdlBI7DvKtf6BwuVmCSAqFVV8pilI9qecfwuU6UFxBSdMy5p2DKLh5Jo/y1BC38ZGQCxP4z1oji15TwUnWxzD16gt5v8IxD3yEIoUxLIYsqWTRqsh2A6ircJVM0xQBzv0az+BlDQyEs2AVg5K0QmNLjEO/a2+T3v+QGiQISuEvLyJkhFVOnrL2IFlGMWWLhVzaNDIVJVsnx3ifNdFfPmMtlXnafJHHWvDu8hPn0MwHMNLy7KnAbTo+lbF3M7y8zGKZ5HSiZbOnZUPYZ+GyWzz0w5dkkXmV9jJmz4VJG0OtmlxyhYq58aTJ3YkX8SlMBTSo1S5/WMwAf27ocGBYXrUvJxqnKOoXw22ecrH9WqsKOfx9S2lWgYad12nSPp/H8CAcWrQ1M3zXmL6hi+n+iwd9lSo6+CZL3zj6cMXsjUXWadEVJNHgDXpzst3vGETZ+PYHAMmvRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y/abZHm5uclwC5OVR54xLuTT8wdlSTlW8UbQ1wKRdPG1iFqOZmDf838HRjKo?=
 =?us-ascii?Q?g+DCX0pBeRw4ncZPZw6AdA7OL4BqzkyoVXJZbYjzfjlUkoKHGrpIjmvRbZ8E?=
 =?us-ascii?Q?ag7eI4gSQ/r02yj6X6Wefk3AV60E9dOhHzgu/Y9QtR+Pxa7GyhQnuyktIB0I?=
 =?us-ascii?Q?dWbjOtsdOPJwry1YZ5zFwZH/PsN14ZuZ69wiLvuAGbK7QhsWV073MhoKiTXy?=
 =?us-ascii?Q?T0n1GOCXLbzK+vb2k9eP3U2qKWW6oTGx8UAJnJ3lhnICFPd8q3rmDp3Bb542?=
 =?us-ascii?Q?tWglH6WU5WC4GEwYGmW2F/sBfhH42MYC+lvK5B4ChklyN+pkwZGsNs6diDh/?=
 =?us-ascii?Q?sN2v4fAujwn8ifwHCvtRZVFwb4Om+lSGJFSoXun2YcMr0JAHcqCGYCIHrUEZ?=
 =?us-ascii?Q?TMIUx98Uf/TtxVppIGOxpMWxmYgF+/jvAODKiR6RInze4s9G94tiDQY3Io92?=
 =?us-ascii?Q?F7wJ5hNWnXkXzWYWMOVJFvOB9cjS/OFFKAhnWv3ayNEr+f8ZxlJMsEIIvYFh?=
 =?us-ascii?Q?5ROF1AxGpTEmCnt4htlA5wT//g5eT1zFR0JflcgHLQC5j7qjWeQVzIPaTiiY?=
 =?us-ascii?Q?CuVqSlMaAPvS1TXw6BMZg0dc8/01qNsxTf7jLmbjstfzfRWY15582TTyeNwP?=
 =?us-ascii?Q?cT0PfDkKyXyPXpQ9hSZm+4Yr9cht7PHmNZtnulbRaNEsaB6LPNF8Y/uz59+z?=
 =?us-ascii?Q?WAfOnfqpFX5RC+v7Lnb4Z8asx1gsm/Ni3yq01woGOFsy2PUCYvwTVZG66N/w?=
 =?us-ascii?Q?R0HfO5boY6SSmrbIclsaNxVQLbDJ4RZzRPVnrKAh1fULIYWVo5HpcXFEzG1P?=
 =?us-ascii?Q?0yhNV/068LQB/pkj2O3iRUb5K3Wl2ZtMI4gEmoLJcgxIlnlLg25fMjaGlRMZ?=
 =?us-ascii?Q?IncWj+ETwhzkEW/0IqqWzWzaxnnAzFhIbyEyXmD3fRgdimAYxnqfYFn8MKOL?=
 =?us-ascii?Q?R66/kwJc5n9UR5GkkLxJojjzeWuwJEeWqCK/AXI380dQiCI0Ga/9TUlXMifz?=
 =?us-ascii?Q?yELC8UQC8u4vl0006C9Fl9coMzdEN0sgFAiC0o5r0DXcAYJnhr7wQGgyG1WL?=
 =?us-ascii?Q?zbyFiLd1+q0jJcFRIYUq6PypznEeDjJW3kryjcOmjqkEfmFRpUCWNS4Ed0He?=
 =?us-ascii?Q?sNFTGXUTL9JUBKZZRjVFvBw+aM243AzEF78VS1zXmEroV/WvUcT55R50TcAB?=
 =?us-ascii?Q?av9FzFtqFvjssZKugu3TSUTSkb9NdyWxc5JxuDO7LzvXhp3dqQ4OzB9wxGcP?=
 =?us-ascii?Q?9u6aNjdEn7Tab2LEXWAyggqvo9mseAce2KdWBBRmTkgAw9NJYPtJPLed6j6W?=
 =?us-ascii?Q?N4xQsvJlmdE9m+e+TmxpGWrFJznUipMwg1VfyN3bELYLuECNiyQAb0v0guYS?=
 =?us-ascii?Q?qa3VurSTED5jqTEUEs9GiPYcZSSIfbrDQp4JFVxscdAKepd8bhWFsqZKW/jK?=
 =?us-ascii?Q?S8em22fIv/qMqi7U+x/UedvM17S2rwCQXOL+dafJDPtxJB1Xc06ZYj3xoE/U?=
 =?us-ascii?Q?TSETDWaLXbloZZVG5/af1t30vWttOuKeCQjP+9F8NS1p8RmB3z88KsL6VmgR?=
 =?us-ascii?Q?s3gBl++K4Itlzy/LWdvjmhi8z3WTY9bl6nrfTZpRqn7PIfaGrZmYjG7CswGm?=
 =?us-ascii?Q?KZz7Y85e9DDIiemVeEtK7LWDpSE6/wVFsIRxH5ARxfwfcNgiarxNPXnCtBFs?=
 =?us-ascii?Q?rUmQQzInbPF+KMqB7vHEPoex0iFFbjEemyXMf67WTjuCk+2DgQzUBL0zmoF/?=
 =?us-ascii?Q?yEOCwl7kaQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7593cd4b-96f5-4b34-43f9-08df078482fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:23:02.6596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QuDYP/yuucFmTep/18alzBEkQD8RzJtLa0glojKX/+tT0NT47TYwfjk/esFUUi5Ir83dhhxGZrpnKDZS7awlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0C60B25BF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_102312_331670_4F769601 
X-CRM114-Status: GOOD (  14.75  )
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

From: James Morse <james.morse@arm.com>

resctrl takes the read side CPU hotplug lock whenever it is working
with the list of domains. This prevents a CPU being brought online
and the list being modified while resctrl is walking the list, or
picking CPUs from the CPU masks.

If resctrl domains for CPU-less NUMA nodes are to be supported, this
would not be enough to prevent the domain list form being modified as
a NUMA node can come online with only memory.

Take the memory hotplug lock whenever the CPU hotplug lock is taken.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/pseudo_lock.c |  3 +++
 fs/resctrl/rdtgroup.c    | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
index 17b99a075eaf..c865913cb534 100644
--- a/fs/resctrl/pseudo_lock.c
+++ b/fs/resctrl/pseudo_lock.c
@@ -16,6 +16,7 @@
 #include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/kthread.h>
+#include <linux/memory_hotplug.h>
 #include <linux/mman.h>
 #include <linux/pm_qos.h>
 #include <linux/resctrl.h>
@@ -718,6 +719,7 @@ static int pseudo_lock_measure_cycles(struct rdtgroup *rdtgrp, int sel)
 	int ret = -1;
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 
 	if (rdtgrp->flags & RDT_DELETED) {
@@ -765,6 +767,7 @@ static int pseudo_lock_measure_cycles(struct rdtgroup *rdtgrp, int sel)
 
 out:
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 	return ret;
 }
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index d60868f7d5e7..a16e35b587c4 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -18,6 +18,7 @@
 #include <linux/fs_parser.h>
 #include <linux/sysfs.h>
 #include <linux/kernfs.h>
+#include <linux/memory_hotplug.h>
 #include <linux/once.h>
 #include <linux/resctrl.h>
 #include <linux/seq_buf.h>
@@ -3238,6 +3239,7 @@ struct rdtgroup *rdtgroup_kn_lock_live(struct kernfs_node *kn)
 	rdtgroup_kn_get(rdtgrp, kn);
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 	rdt_last_cmd_clear();
 
@@ -3265,6 +3267,7 @@ void rdtgroup_kn_unlock(struct kernfs_node *kn)
 		return;
 
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 
 	rdtgroup_kn_put(rdtgrp, kn);
@@ -3299,6 +3302,7 @@ bool info_kn_lock(struct kernfs_node *kn)
 {
 	kernfs_break_active_protection(kn);
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 
 	/*
@@ -3307,6 +3311,7 @@ bool info_kn_lock(struct kernfs_node *kn)
 	 */
 	if (!rdtgroup_default.kn || !is_active_resctrl_node(kn)) {
 		mutex_unlock(&rdtgroup_mutex);
+		put_online_mems();
 		cpus_read_unlock();
 		kernfs_unbreak_active_protection(kn);
 		return false;
@@ -3318,6 +3323,7 @@ bool info_kn_lock(struct kernfs_node *kn)
 void info_kn_unlock(struct kernfs_node *kn)
 {
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 	kernfs_unbreak_active_protection(kn);
 }
@@ -3671,6 +3677,7 @@ static void resctrl_unmount(void)
 	struct rdt_resource *r;
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 
 	rdt_disable_ctx();
@@ -3686,6 +3693,7 @@ static void resctrl_unmount(void)
 		resctrl_arch_disable_mon();
 	resctrl_mounted = false;
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 }
 
@@ -3701,6 +3709,7 @@ static int rdt_get_tree(struct fs_context *fc)
 	DO_ONCE_SLEEPABLE(resctrl_arch_pre_mount);
 
 	cpus_read_lock();
+	get_online_mems();
 	mutex_lock(&rdtgroup_mutex);
 	/*
 	 * resctrl file system can only be mounted once.
@@ -3804,6 +3813,7 @@ static int rdt_get_tree(struct fs_context *fc)
 
 	rdt_last_cmd_clear();
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 
 	ret = kernfs_get_tree(fc);
@@ -3836,6 +3846,7 @@ static int rdt_get_tree(struct fs_context *fc)
 	rdtgroup_destroy_root();
 out:
 	mutex_unlock(&rdtgroup_mutex);
+	put_online_mems();
 	cpus_read_unlock();
 	return ret;
 }
@@ -5502,12 +5513,14 @@ static bool resctrl_online_domains_exist(void)
 void resctrl_exit(void)
 {
 	cpus_read_lock();
+	get_online_mems();
 	WARN_ON_ONCE(resctrl_online_domains_exist());
 
 	mutex_lock(&rdtgroup_mutex);
 	resctrl_fs_teardown();
 	mutex_unlock(&rdtgroup_mutex);
 
+	put_online_mems();
 	cpus_read_unlock();
 
 	debugfs_remove_recursive(debugfs_resctrl);
-- 
2.53.0


