Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A475C44519
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErC+kkGUOPumxw/epXCWIz3SjB01btcKJvnIDHQC088=; b=uitp/Ki1YxAC2rUIIKmMQODHjK
	FcPxT6cTgrbdIjCO8DrCuiXhUWazD8XPWlA3/cKbtqlhzrBAMOG9XuDJ28dGwPUckHti2jNOPMLq8
	whKu5V7VdTZFH1omE7uIOpIO2BHRcPdetibe2nG6pcINoB5tv0wSWPjflSc39DEiSLNjh96k8Oaep
	ODzDnpSAy3A3mOjSkFjEBA0W03gmqjzWHcIi0EgJ87UHhjd3m4GwhjS8TMaHiaKk2kEWoR4NlgL5L
	SV8/SRF1pyFNjtia++/zF+5EyycjAKJb0y24/FCLNgufbubdpL3nvRTQEEihlCWPMUTkMOVw+btgt
	/Lwq++Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFW-00000000YMo-2oa8;
	Thu, 16 Jul 2026 21:04:06 +0000
Received: from mail-southcentralusazon11013054.outbound.protection.outlook.com ([40.93.196.54] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFP-00000000YAB-1ppy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkYxbimDr3b4iJTtxmYRZ3eMlHrFSaU6Ygn6uaEX30D1JIB9fxptP7wfvO55+TbHacUUvHX5gXdxB37eaOwcf7JbyroeBLXfsoobVNqEoeSqn9xd8XYDBU5t636O7xJIUTYu73hgfMKR6HWRqxCvujd3xtTJsXz8nm42K4NE34D7P8gUxOquLK70LCuzmmLOA9lUNDgnRRF0GtvBfndyPnCQoj7nBJQ+zwQn46V/1BGr4+PJDaJQEt2iaGlEIA5ZnbWVclKN/qxRn8ENrblZzd1hdo3MFjmUNGrJDfXKIRkHANG+gJAxNy/k7DnsTJJxesz6Q/u9DtIds6hQEAO3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErC+kkGUOPumxw/epXCWIz3SjB01btcKJvnIDHQC088=;
 b=LaCFvxo8+aK8qD7lsKwXZZhVmSdPEI3OehJrpB3kpJWPyiAXiww1Xd+NXauQV+eDophZl41UrwFtw/I5V1JLk2uf7Yvnq/k2by1r7rEKe+3lB/yKuCHXdSZw9VNQ/VTX3VzCBnUJ4X8cbR99XLpT1eUBLSxFn5vFGATacd0Rkiyh9oCRhrH2pfSlt1KWzOHKptMginWG5jIESnkDeWsQKIfhNvTABqoBrAujgDtFMhxqI8V8roWF85O6eSd30M8mktIRCFfoFlImrfVOEBU/XAKYARUj5R9VAvRDUPYGHifekVNqDcwtkbgAbNgHfbdHIAM77xDyJ3ZEY7RYlrzl+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErC+kkGUOPumxw/epXCWIz3SjB01btcKJvnIDHQC088=;
 b=sQZjMMVmKCCPoSpZnMZliw6G6UpRbh0FXuNX8hN+j/fCxnVt77/M3lsHvRDw0SxuchXwgl+665fHyDr8gYOEQjSmo/Zbv80RsyLx9YoYL49Un8/X4R3tvewMwVE8xdwz5atEymbvwrqdFElgWCR8uTJOq7nYdRiPDggvrw8tNA1XZY+EzerUSEqNfMEbGewAxSfd6eJLj2a0sVrV6zHaNti+GhhIdWpm4XWKe7MqZVdVgJGdmBI9R9+odr8KHVsmiGIS7IS9yWhM8F9Gg1bx2vizwu4sYbo+YoKn0JxXyqPge6xzK8gqBYkSj7JsrFdukNb3S5lZo6oqxnnP6P9BRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:47 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:47 +0000
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
Subject: [PATCH 13/23] resctrl: Make MBM paths resource-aware
Date: Thu, 16 Jul 2026 14:03:03 -0700
Message-ID: <20260716210329.2914625-13-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 741879b7-92e3-47a5-c60d-08dee37dba8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: RTqhd/rbr3DGklnQ2rzLgSEmd9AKLj2lwMXELyNtrMz1CYnL3WQbrgYPA2dI7Yk728eF/qP7IhYolQTQzxtBF0OwDzzdiRdqTlKvkvY7FY8RT6bldNiTGtYNgVTn2EKgcZc7gpT50O/uZfAkAJOJksQ9aEND7PkBDP2MO4z9MnBG8fBzXBql9tXXxGcBwZvDtOpFjgt6SQSPaJsXbyaNMYG6Hveoc2pbttQFyyYZcpb6/98Ez1UXermaovTAKyNs09PHCIYXvyo/iHPwEv4i5mCDixE8WuJFURLnxAfmIrjLpbHaDh8tp59fq7nuzfq177HR77lNp5th6HHpEXAqEVKidgGY7vTF8DgVJcQmY7FAxF1MguwlHpV7Ocim8fu5Lq+ny0VE8/9HMy8Q2H6J0fBd7mn2Fbo0+PMuR+8VhE0I0wiy0pQ48LUeSMlbFkY9SXAvZ4SI7RMCRn3GpmL0E9OGW3Zf1KOqI+zfUWqUvLLjS68F9HREV6Hcq1ZC5ekypO2u4lKR55sBzmoWtcja0j1F99RyGfBhUt+13uCsJciiPQB3Rg6KBaDi2hI6hvNmhE+TAiYzXXRaKXmiennuoXQeQ0Ynw1FCgE8eow/NDHrglXuC+vClftgH19NqesOwrjoxiDmI293I9m8cwYzrHOBjuaq4kgGB7ZTECmgN+z1Yo4D9pW0gC67uqhY0oMRHnhat8whwJCW10zxJuVMH2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ybGeb62eDmQaAuSvt5GIrp6FfIUyLnbBrSJ5GAxAXMVoIDbc0A3X3KHTIOS?=
 =?us-ascii?Q?u7dGL+wAT9ZAwmSf5tSQ35OzW7nR4etCiXVFmfIIbfMcYaVhOoxjUNxk77H7?=
 =?us-ascii?Q?7JKuv1tVLCXC4R0CRbujNmaQYSFD2ivxW5sj+4o2dtiknFfTiAd6oxKHkI3y?=
 =?us-ascii?Q?gJKy4DQ2VCS52DMfCp6P8rljXdsAu0IRW9nunTDb0MdcfQNIi/Q2Lsz06bUK?=
 =?us-ascii?Q?Z0Z2zFeWiXFHXoXAjFfAHMh9xzMswMgvBFVYSDmHzISbWOqD2Cw7G6mI4UA8?=
 =?us-ascii?Q?m5SSEJK/sAd9X4ZCDmQvwdvRr88c3Q7TCbDYlNvJqjmuWZ98hx8uz0yynKm3?=
 =?us-ascii?Q?CNRPbqlgyxkjjQ7AQjqgefNlVnMj4mExZRRxKnW/fKaIWluOAytUV8vJtpCu?=
 =?us-ascii?Q?CsENQbWSQuwqEoJQak4Z7uY50Bx6FoRswblV9XsQPMyzVlVWo8j7HTECoXQ1?=
 =?us-ascii?Q?p9hYbHerFcdt7EdNycCQKEnH+K4UtrHzjKIVhvgndcJOrL0l1+oVurqK3iRk?=
 =?us-ascii?Q?FuPk7iSyeqiT3ylqH3fXGTA4KHFrdp6BHCLNHKjyRBZ1wL0b2gFzx1ZJficZ?=
 =?us-ascii?Q?AkAMd50yhHYf2UQG1/1VRKMgriyBptfz/kFNAnnYVlW08u+C6odVROQ1VKKI?=
 =?us-ascii?Q?wp5UvtPFVQ+lZt8cAbMto7MPdIqrFBdPb1Jwl/eGXXwj2K0TxzlT4f8gSMDS?=
 =?us-ascii?Q?sWiGpq02IjPvaBBHFnHR3PlKauppkGlF+GSNsE1kqulEpTx71Z7MZlXWop5m?=
 =?us-ascii?Q?37XcHK4r4ynf1D0uW7BKjtCVn0MN6e7FmTPudCSqV2xGgiK7jq/qZi7oaQnb?=
 =?us-ascii?Q?+KDMLnA07fQg4GibljYeFT++viZ4zEzpLNBAdYIixK0TeHPSk+BGWww9UkUt?=
 =?us-ascii?Q?CaByl7zSAkJK2mrG8sdLAe0dckVGB8iSDX1oHpQb9FtwkcJX2Zdad9WYCdaI?=
 =?us-ascii?Q?CW0/rtwd7DjiriFiChCpyoTIzQyJUVA5zqDg/sZPJtCVxwp30+foOMjSpb9C?=
 =?us-ascii?Q?dPuTh6Kdw3hycc5wEs49aPx16mbM8KhI0GcwOFal2Ah0wb7GeAjntJWDh3+J?=
 =?us-ascii?Q?Xuha6ZaY2z0u/kgNj6cDGi3MdsCVcUhlJI646YYWPf6TaXr7RJmZDn/Dsy4N?=
 =?us-ascii?Q?jEWxKN4JfEhkVvtJwI2FAs5fGJWwyc+0M65HKhojKGuclrw6eMVmSBviVYlA?=
 =?us-ascii?Q?qj/xapDzL4BTs10mHqdn8M4AzN1PiCpE8ZVSwjS7alLKqdy2JSjXsWg82vDv?=
 =?us-ascii?Q?aJkfescnEEPu5Rw0CVS/nhnt1czi0Kwjh2XLAfOi05c8mmz9q7zz3e6LbAOW?=
 =?us-ascii?Q?o2K4h3PvDQqoFsTheK0USdFAEkAlyFt7YwtXrTWS521NCbzSJOvUs8em0E9j?=
 =?us-ascii?Q?CAp+8Rr3a+IlT3/GelrUEvXU3oMh9uO01BdMfGTo5PlRWzrvaOfcT2nu0ezG?=
 =?us-ascii?Q?OWFoADWOH76qVNY/ubpqyZ7aQMFzEYe46t7kgdjkwXFVX9q+f1XiHXm3zUOj?=
 =?us-ascii?Q?Eye3BnjPfl76h8ufCyZzcn7jTNOK9GBuPR0/3ZYHbvukXLSd8dLM1FcjUsJb?=
 =?us-ascii?Q?36D2x4yevyDCNu0QdcVQobFLZKclswt6kdhPxOhJcBeuHrvejuPTazVrxr6J?=
 =?us-ascii?Q?cj1Veylm4Dq2NzGiFU6+a5NxZR6epD5OowAaNvYyYV5qlp0d2E5vq11RjZI5?=
 =?us-ascii?Q?2ojLUhusF2wUwN102X55KXx8+Fj2IoApzcdUvoR/uL5S70f1hjn8VWM9i3FF?=
 =?us-ascii?Q?JxDshBDJKQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741879b7-92e3-47a5-c60d-08dee37dba8e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:47.4727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyc+0KdNnhV4F3RKDXb11YJ0DZAdMrgOBXEFPEevcdcyDuMbmiPmtt6l+kXpvdjsn8T9YdiTk6xUrSRKnHRGYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140359_520146_D68D7CAB 
X-CRM114-Status: GOOD (  15.94  )
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

The MBM overflow, counter-assignment and event-configuration paths
hard-coded RDT_RESOURCE_L3 and the individual L3 MBM event ids. That
cannot express the node-scoped MBM total event, which is backed by the
MBA resource.

Iterate mon_event_all[] and act on every enabled MBM event whose owning
resource matches, instead of naming the L3 events explicitly. Derive the
resource of an overflow work item from the domain's rid, only run mba_sc
bandwidth feedback for the L3 resource, and initialise event
configuration for whichever MBM events a resource actually exposes. No
functional change on L3-only systems.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/ctrlmondata.c |   5 +-
 fs/resctrl/monitor.c     | 105 ++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c    |  53 ++++++++++++--------
 3 files changed, 102 insertions(+), 61 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index ee7823cf9493..77221c6f1e9a 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -693,7 +693,9 @@ ssize_t rdtgroup_mba_mbps_event_write(struct kernfs_open_file *of,
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "mbm_total_bytes")) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
+		if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+			rdtgrp->mba_mbps_event = QOS_NODE_MBM_TOTAL_EVENT_ID;
+		else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 			rdtgrp->mba_mbps_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 		else
 			ret = -EINVAL;
@@ -724,6 +726,7 @@ int rdtgroup_mba_mbps_event_show(struct kernfs_open_file *of,
 			seq_puts(s, "mbm_local_bytes\n");
 			break;
 		case QOS_L3_MBM_TOTAL_EVENT_ID:
+		case QOS_NODE_MBM_TOTAL_EVENT_ID:
 			seq_puts(s, "mbm_total_bytes\n");
 			break;
 		default:
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 25b5038b3e16..665a28bdca7d 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -790,11 +790,15 @@ static void mbm_update(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
 	 * This is protected from concurrent reads from user as both
 	 * the user and overflow handler hold the global mutex.
 	 */
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+	struct mon_evt *mevt;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		mbm_update_one_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+	for_each_mon_event(mevt) {
+		if (mevt->rid != r->rid || !mevt->enabled ||
+		    !resctrl_is_mbm_event(mevt->evtid))
+			continue;
+
+		mbm_update_one_event(r, d, rdtgrp, mevt->evtid);
+	}
 }
 
 /*
@@ -863,8 +867,8 @@ void mbm_handle_overflow(struct work_struct *work)
 	if (!resctrl_mounted || !resctrl_arch_mon_capable())
 		goto out_unlock;
 
-	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	d = container_of(work, struct rdt_l3_mon_domain, mbm_over.work);
+	r = resctrl_arch_get_resource(d->hdr.rid);
 
 	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
 		mbm_update(r, d, prgrp);
@@ -873,7 +877,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL, NULL))
+		if (is_mba_sc(NULL, NULL) && r->rid == RDT_RESOURCE_L3)
 			update_mba_bw(prgrp, d);
 	}
 
@@ -1267,19 +1271,20 @@ static int rdtgroup_assign_cntr_event(struct rdt_l3_mon_domain *d, struct rdtgro
  */
 void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
+	struct mon_evt *mevt;
 
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
-	    !r->mon.mbm_assign_on_mkdir)
-		return;
+	for_each_mon_event(mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		r = resctrl_arch_get_resource(mevt->rid);
+		if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r) ||
+		    !r->mon.mbm_assign_on_mkdir)
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_assign_cntr_event(NULL, rdtgrp,
-					   &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		rdtgroup_assign_cntr_event(NULL, rdtgrp, mevt);
+	}
 }
 
 /*
@@ -1326,18 +1331,19 @@ static void rdtgroup_unassign_cntr_event(struct rdt_l3_mon_domain *d, struct rdt
  */
 void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_resource *r;
+	struct mon_evt *mevt;
 
-	if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
-		return;
+	for_each_mon_event(mevt) {
+		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID]);
+		r = resctrl_arch_get_resource(mevt->rid);
+		if (!r->mon_capable || !resctrl_arch_mbm_cntr_assign_enabled(r))
+			continue;
 
-	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-		rdtgroup_unassign_cntr_event(NULL, rdtgrp,
-					     &mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID]);
+		rdtgroup_unassign_cntr_event(NULL, rdtgrp, mevt);
+	}
 }
 
 static int resctrl_parse_mem_transactions(char *tok, u32 *val)
@@ -1497,6 +1503,7 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 {
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 	struct rdt_l3_mon_domain *d;
+	struct mon_evt *mevt;
 	int ret = 0;
 	bool enable;
 
@@ -1548,13 +1555,19 @@ ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of, char *buf,
 		 * Initialize the default memory transaction values for
 		 * total and local events.
 		 */
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
-									   (READS_TO_LOCAL_MEM |
-									    READS_TO_LOCAL_S_MEM |
-									    NON_TEMP_WRITE_TO_LOCAL_MEM);
+		for_each_mon_event(mevt) {
+			if (mevt->rid != r->rid || !mevt->enabled ||
+			    !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+
+			if (mevt->evtid == QOS_L3_MBM_LOCAL_EVENT_ID)
+				mevt->evt_cfg = r->mon.mbm_cfg_mask &
+						(READS_TO_LOCAL_MEM |
+						 READS_TO_LOCAL_S_MEM |
+						 NON_TEMP_WRITE_TO_LOCAL_MEM);
+			else
+				mevt->evt_cfg = r->mon.mbm_cfg_mask;
+		}
 		/* Enable auto assignment when switching to "mbm_event" mode */
 		if (enable)
 			r->mon.mbm_assign_on_mkdir = true;
@@ -1896,6 +1909,7 @@ static void closid_num_dirty_rmid_free(void)
 
 static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
+	struct mon_evt *mevt;
 	unsigned long fflags;
 
 	fflags = (r->rid == RDT_RESOURCE_MBA) ? RFTYPE_RES_MB : RFTYPE_RES_CACHE;
@@ -1905,6 +1919,11 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 		resctrl_file_fflags_init("mbm_total_bytes_config",
 					 RFTYPE_MON_INFO | fflags);
 	}
+	if (resctrl_arch_is_evt_configurable(QOS_NODE_MBM_TOTAL_EVENT_ID)) {
+		mon_event_all[QOS_NODE_MBM_TOTAL_EVENT_ID].configurable = true;
+		resctrl_file_fflags_init("mbm_total_bytes_config",
+					 RFTYPE_MON_INFO | fflags);
+	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
@@ -1913,17 +1932,25 @@ static void resctrl_mon_resource_init(struct rdt_resource *r)
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_LOCAL_EVENT_ID;
+	else if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+		mba_mbps_default_event = QOS_NODE_MBM_TOTAL_EVENT_ID;
 	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
 		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
 
 	if (r->mon.mbm_cntr_assignable) {
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask;
-		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
-			mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg = r->mon.mbm_cfg_mask &
-									   (READS_TO_LOCAL_MEM |
-									    READS_TO_LOCAL_S_MEM |
-									    NON_TEMP_WRITE_TO_LOCAL_MEM);
+		for_each_mon_event(mevt) {
+			if (mevt->rid != r->rid || !mevt->enabled ||
+			    !resctrl_is_mbm_event(mevt->evtid))
+				continue;
+
+			if (mevt->evtid == QOS_L3_MBM_LOCAL_EVENT_ID)
+				mevt->evt_cfg = r->mon.mbm_cfg_mask &
+						(READS_TO_LOCAL_MEM |
+						 READS_TO_LOCAL_S_MEM |
+						 NON_TEMP_WRITE_TO_LOCAL_MEM);
+			else
+				mevt->evt_cfg = r->mon.mbm_cfg_mask;
+		}
 		r->mon.mbm_assign_on_mkdir = true;
 		resctrl_file_fflags_init("num_mbm_cntrs",
 					 RFTYPE_MON_INFO | fflags);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index db0255951f0e..5be285487df7 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -129,7 +129,8 @@ void rdt_staged_configs_clear(void)
 static bool resctrl_is_mbm_enabled(void)
 {
 	return (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID) ||
-		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID));
+		resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID) ||
+		resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID));
 }
 
 /*
@@ -1766,7 +1767,7 @@ static int mbm_total_bytes_config_show(struct kernfs_open_file *of,
 {
 	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
 
-	mbm_config_show(seq, r, QOS_L3_MBM_TOTAL_EVENT_ID);
+	mbm_config_show(seq, r, resctrl_mbm_total_event_id());
 
 	return 0;
 }
@@ -1885,7 +1886,7 @@ static ssize_t mbm_total_bytes_config_write(struct kernfs_open_file *of,
 
 	buf[nbytes - 1] = '\0';
 
-	ret = mon_config_write(r, buf, QOS_L3_MBM_TOTAL_EVENT_ID);
+	ret = mon_config_write(r, buf, resctrl_mbm_total_event_id());
 
 out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
@@ -5250,10 +5251,32 @@ static struct rdt_l3_mon_domain *get_mon_domain_from_cpu(int cpu,
 	return NULL;
 }
 
-void resctrl_offline_cpu(unsigned int cpu)
+static void resctrl_migrate_mon_domain_workers(unsigned int cpu,
+					       struct rdt_resource *r)
 {
-	struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
+
+	if (!r->mon_capable)
+		return;
+
+	d = get_mon_domain_from_cpu(cpu, r);
+	if (!d)
+		return;
+
+	if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
+		cancel_delayed_work(&d->mbm_over);
+		mbm_setup_overflow_handler(d, 0, cpu);
+	}
+	if (r->rid == RDT_RESOURCE_L3 &&
+	    resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
+	    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
+		cancel_delayed_work(&d->cqm_limbo);
+		cqm_setup_limbo_handler(d, 0, cpu);
+	}
+}
+
+void resctrl_offline_cpu(unsigned int cpu)
+{
 	struct rdtgroup *rdtgrp;
 
 	mutex_lock(&rdtgroup_mutex);
@@ -5264,23 +5287,11 @@ void resctrl_offline_cpu(unsigned int cpu)
 		}
 	}
 
-	if (!l3->mon_capable)
-		goto out_unlock;
-
-	d = get_mon_domain_from_cpu(cpu, l3);
-	if (d) {
-		if (resctrl_is_mbm_enabled() && cpu == d->mbm_work_cpu) {
-			cancel_delayed_work(&d->mbm_over);
-			mbm_setup_overflow_handler(d, 0, cpu);
-		}
-		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) &&
-		    cpu == d->cqm_work_cpu && has_busy_rmid(d)) {
-			cancel_delayed_work(&d->cqm_limbo);
-			cqm_setup_limbo_handler(d, 0, cpu);
-		}
-	}
+	resctrl_migrate_mon_domain_workers(cpu,
+					   resctrl_arch_get_resource(RDT_RESOURCE_L3));
+	resctrl_migrate_mon_domain_workers(cpu,
+					   resctrl_arch_get_resource(RDT_RESOURCE_MBA));
 
-out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.43.0


