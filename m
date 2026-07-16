Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53918C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jo5xBFpIowb+NubplwX521jmHQMExZ1+U6cJ/MQ+k1k=; b=rn3u+/WoQK9JJq6u2Z/eT02Qyo
	xpYQBbKvOhsJzw+FrdLa+AvL1Z+tIyoFxV/mG8Z+opAarHp5ddAk+eFjUn/bPXvSHH5RqF7So0v6U
	tDVYfmpUj97uGgIvoed4apdUHCVdZ02yfz6uJr0xS0rvShnm+CJgweUXgs6RoAriZMWU8vN7y1l5w
	kz7iEWu81LCIOiIYMR92eWS8hhq7srsbrrE1Pke0CQyItCRZCQ3pOE5jhggFhX+2khamPjmdW/xAX
	a4LkfJfPkIkvGjUmEODPCKeCZjKUCeEAlmCa0BkgkfF9M93rYdMsm6jS4sL7QoNcD24V8dUwG6FA4
	/nhbCUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFV-00000000YLD-2kB0;
	Thu, 16 Jul 2026 21:04:05 +0000
Received: from mail-southcentralusazon11013054.outbound.protection.outlook.com ([40.93.196.54] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFN-00000000YAB-3pvW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUMJZgAw17rRayDJlUo+p2Qtb1T+VJ/qzqAqNwpGLUEovbAco1ndye/6Gbp8iPZ9jNczUOwGQJiCJ3/cwofCs5iU2IBHLYWQLL48D1UeWfJ+P5ayF3rsMizr2i6yFYD3ly6P/JpYY0cH4upoVPgXdeEPUcu5Rb3unNaR5BmbDZjUbcrcokt7woDhpMT1gIx39oti0eEjUbjlEzo954pL/C3Zk4eiUctCvjdf2f4qN/gBPfBISOTA7FO05SMyI2QCXPTLLaKGK0RsGiv9++gcqcZiuiwpzwvrgBfzI16rtncEjEKgjuW7V9AmrOe+VmuI/Sc1pCTisA7pIO8Ot+MKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jo5xBFpIowb+NubplwX521jmHQMExZ1+U6cJ/MQ+k1k=;
 b=UTd6YtMm/uHEFxNQDLH0zWIWR9y4n0zY5yjYTuW2Y8O81EXJpoSvsFU4ETwmiNiq/4VcihXhTidmzn1rC6yARHCVAHSHeAg207ervJowLdOzqWOXCIpWTj6ygWae3Mvy0y+tsjg9UCO5Gp0C/PolThu3Ww6BUCykmyTN/uWe94lVaEF16kWcCWpRBRnL7qeRk/WVBFojmEeXzgNuxs/5HMjRl1EFp8JrRyhaLkA8+VoAMH5mOZPc0Y4Ctf+8hLC2VfYFuXOXtyc9FtJc0Nxj7GcvP+Qe+a1XpgDH9C0L+fEY7byNY1b9I/9ncD+koc16bG/OqAkyIjhkv5Wl6xhJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jo5xBFpIowb+NubplwX521jmHQMExZ1+U6cJ/MQ+k1k=;
 b=dP1svzBuiq4IaKvnCRQg5iVct41uwlgk80SvoXvQqVAelKgOE6rq0loDvp9kw5pNsqEX+QOC2D1g7rNfh74IgTJjK6Ryw/jG5TQLwlIe6yBi+1cWqS88Re2uZ1Ys6qIabk0p4YCNvkkiFHV0NWFUFaa1TpoWWMrOxmWM9f5LNKT8nnSG/zfcTSeiqqMTiKNsi1sqa4iIkjo8TyBpzC7KA7yJxqQ+hadkLji+FrPieof6vA14qcE0dl8CNuvEE4sDsruOzF/WoC1XEdTkSaIjgcCoXIkRe+D0a7LpNOjvF+h2nbnt/XiOKqCHZtjc4AjJBHajEyfBM8xwvRGkbk5kfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:42 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:41 +0000
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
Subject: [PATCH 09/23] resctrl: De-hardcode L3 monitor infrastructure
Date: Thu, 16 Jul 2026 14:02:59 -0700
Message-ID: <20260716210329.2914625-9-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: fab65cb8-0f2a-40d8-8517-08dee37db730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: rfgfjtdI/WPkrJyTl998y2NyncHHMPpUdwNLf6agSPVMxbG6P7gKhq/7j3GcwPM8yFd9VsoViW+BYwifQDF3/vj3eW88FpUgVcIZ7cNZFxFY01ZmePtgqHJA0KjFHp4PY/7mHOlj/5QJP0Ali3J+3S5pmSnl6uJsbXQGh4xv/I/RoEEVdmc6qCCJDjJO6vpLVTF8K+gajF5h8xsUXBx2NjlfaOjR+9eKc/SixwAjWV8uze4CFFYlpoE2zatNV9yXDv14YYg7FAtaOKDHY4TNokZd+kbAPIjwzMeLiHpl37opInRcs1dCTMz2EGQZ3BVOAnFOKzCyXFBXi6Klp+3tbuaXUmMsbtwL+4Qeb59Ro4YbvMo8vSdT6apDa6X20Fszh0el5A0NF5hWvQq8jjY3Iddsnwn7/b1KiW5U3P8joz/TVsHaNoerL5g9rNEN2jH9nClnm7YKW7uj1Vh6xBb+ReFZIZVg5yOvTFIFxkpJ6jDI++WodPOK7OKi8JmNDSz4MvEHlf3QZWldheVNFvE43RBO3dqrPorzfmbcGbqOFFL9yZHyMYT1XEp7u+SLnlW5LQgVAj4FOVH1U0qNT2W9pUIEcOCzewhA9ckvG+4iZkjdJ0Nku3YJPQIVjcW4GMU9WfOYS5RdQYJvKhVt/AI5iRpr8k7toyMmJGiAwgTzvcOtkOaT4v35wd9Pjj6ZzRv8+lmEI21qyNlEyaZFzBYyZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5uLDg+Za4smxopI4X79NE9cppGZjJmdXpDA0aJQTfZtINLuOoh9WYbzzLAjl?=
 =?us-ascii?Q?dLEzcNa/+9o081Aqxotoh04VAxOBh2yNiQye3P4LgR5EaT5jpSakU+FTtbOo?=
 =?us-ascii?Q?05Zn5ZqrHN0iqz2bIRYFs3sw5JvNhNXayfkxQvMLYqt0+8hyG+jSJryKBDxx?=
 =?us-ascii?Q?6y2LuZzngRri9NzDfUZmI8BAv+1RqX3DwW9Lb7qGvbN9T/1kfllggDg5KPHm?=
 =?us-ascii?Q?meKRXy73MKf8nkhy7QhrU51ZUZFBFwmVUJaJW1Z0O25l6/veuXxu9W/sNI+X?=
 =?us-ascii?Q?E+VkNkdorkCETXZERhDT7qGnuaBCS5A8moe6FN+pkZ2A10Gc2o8NpLiPF1Su?=
 =?us-ascii?Q?gekrLUFICNNhKRyTtnYdU1ul2+gnyJ8Hd3YuWpdk0D8LisBcY+FHNMsefo/j?=
 =?us-ascii?Q?B1mOJCboGMfSYNoWtuwZifVgv0UwcV44gTceMaGvJxWchl9NDmafTuZEYpUQ?=
 =?us-ascii?Q?laTYunjOYax3UZAtn+xzPzw2IJGzZt+IjE+L2oi+huJGPdG9ulcQHRCOHq7P?=
 =?us-ascii?Q?Foj4cfpGAe0fdCTzx6LQuj9wJFEF/9I/72fGxK+yCQI8Tk+iW5DNcWvMSxkA?=
 =?us-ascii?Q?567f/A7+mvT+zFcjZ405nQqmMlJ/lBwUeJK6YJjjyB6NESZy2CaFzAAc0CHb?=
 =?us-ascii?Q?zFnGWGvprMy7RBNTAxEQnVRT6yvg4t4der3y6eu+vV5kIhRyc/VFegDuUAzZ?=
 =?us-ascii?Q?vEgT5G0rbpdvzKrp66zQ0y7tqTAMzpuakMefbCPbTPphEvPyL1IhrdLmyiFb?=
 =?us-ascii?Q?pE4eoJegAjc5aEsn266Uj+mYDG+5c8ikvb09LsPC4jNs1MtKQvM3fOnnAHjH?=
 =?us-ascii?Q?660MK2Wx+vvkpe5EtaykMqqajrJPbBBKpN+ximYUP3h/ZcN6H3SamvH1NLCb?=
 =?us-ascii?Q?hmhOmX+/aL1l1gSxN6Imsg0DDpQoyGVOl+4qGLfKAcrxuC32idF4fENWbopt?=
 =?us-ascii?Q?xzK85IvI37YpWqO0ALC572PA5ocUpoci9+dsguxeHG7d0mpoX54BRLONowlR?=
 =?us-ascii?Q?Lx+StzMxbMkBAPky44AzgXXqCV2utsrNM4jdkeUmyTcRgYJBkWK9ydEPyRR1?=
 =?us-ascii?Q?YIeD8xhiD/0+r0bXdMVk0qSoLgX17I54grSKPpqQyutCRU5TYSsg9liQMMVy?=
 =?us-ascii?Q?4YWqozHWaXF3DF+pis3v0qFhQYKJ6QBggKK+zgSs/DxY8iWNjoxkbKdTRJmN?=
 =?us-ascii?Q?54GXsBHHNx7qxFU4tN4SYZbIp7WK2VnsfXC4zJiWW4lRSI3wYQSN2fPQ5onT?=
 =?us-ascii?Q?DesQOcj2zGLadv2+84m6wx3k3UahMjFEvlHrRRFJnT9x+YqmaZv7szF5Tdaj?=
 =?us-ascii?Q?WUfvMSRNiwN5RVsgoFspAVHnFRNW/3EtZ6Y5OhmhkZXtQqHwAfhoUwuHCt3t?=
 =?us-ascii?Q?YpSXOCec9/r6r/0OEeOu8iJVAR1KrL1w0RZT6dxIOcgN1MAbsnUy+OJOBX17?=
 =?us-ascii?Q?G6JOs5ib5gmSW98qdW5ru8LG/G3SgBDEjXY3QamNghKVzujj70z7OHtuKfcL?=
 =?us-ascii?Q?Sy+/nDD8Xy9jTAOExLvJAo5KjPpJQvq/pFeiGivDv5XWK56akebmCuoIkgSc?=
 =?us-ascii?Q?BNbL8yxT/lIQRTQ37Qvv8pXQHPBtPVkqTFXy+2EVs0Xx2eVbDCL7Z43/5bc/?=
 =?us-ascii?Q?droMEDBjK3BNfdmSWPMo9NnGH0Siyex4CL23OIjZQrroySjheToT/c3qW0Yo?=
 =?us-ascii?Q?KLK8+bedlPJfeajpwS96W7H337slfMTiJ35OfI8eRhFnL7h2WhuXzTfL4Qya?=
 =?us-ascii?Q?ux2BE8YEjg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab65cb8-0f2a-40d8-8517-08dee37db730
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:41.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zEKkahxGGGcYvH4xtw/obAl8hdiaXOqjYnZNxqrnsnkLgh+shbHG3Z0d6hObFGBI02mCU3athYlxQ87N0YEYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140358_016256_55E68990 
X-CRM114-Status: GOOD (  18.95  )
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

ARM MPAM can expose MBM counters on an MBA (memory-level MSC) resource
as well as on L3, but the resctrl monitor core hardcodes
RDT_RESOURCE_L3 in domain validation, online/offline, and assignment
paths. That prevents reusing the same monitor infrastructure for MBA
without copying large chunks of code.

Generalise the monitor layer to operate on any resource ID while
keeping existing L3 userspace behaviour unchanged:
- Rename resctrl_l3_mon_resource_init/exit to resctrl_mon_init/exit
- Factor MBM counter assignment show/write helpers for reuse
- Validate monitor domains using r->rid instead of hardcoding L3
- Allow monitor domain online/offline for any resource ID

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/internal.h |  4 +-
 fs/resctrl/monitor.c  | 94 +++++++++++++++++++++++++++----------------
 fs/resctrl/rdtgroup.c | 35 +++++++++++-----
 3 files changed, 86 insertions(+), 47 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 4da54d2d816b..1cca9b147fdb 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -380,9 +380,9 @@ int alloc_rmid(u32 closid);
 
 void free_rmid(u32 closid, u32 rmid);
 
-int resctrl_l3_mon_resource_init(void);
+int resctrl_mon_init(void);
 
-void resctrl_l3_mon_resource_exit(void);
+void resctrl_mon_exit(void);
 
 void mon_event_count(void *info);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 8dfc54f8a1f2..742429e18b8a 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -427,7 +427,7 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct mbm_state *m;
 	u64 tval = 0;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3)) {
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid)) {
 		rr->err = -EIO;
 		return -EINVAL;
 	}
@@ -573,7 +573,7 @@ static void mbm_bw_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	struct rdt_l3_mon_domain *d;
 	struct mbm_state *m;
 
-	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(rr->hdr, RESCTRL_MON_DOMAIN, rr->r->rid))
 		return;
 	d = container_of(rr->hdr, struct rdt_l3_mon_domain, hdr);
 	m = get_mbm_state(d, closid, rmid, rr->evt->evtid);
@@ -1638,9 +1638,9 @@ int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
-int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+static int mbm_assignments_show(struct kernfs_open_file *of, struct seq_file *s,
+				void *v, struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdt_l3_mon_domain *d;
 	struct rdtgroup *rdtgrp;
 	struct mon_evt *mevt;
@@ -1685,6 +1685,12 @@ int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, voi
 	return ret;
 }
 
+int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
+{
+	return mbm_assignments_show(of, s, v,
+				    resctrl_arch_get_resource(RDT_RESOURCE_L3));
+}
+
 /*
  * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
  * event name.
@@ -1779,10 +1785,10 @@ static int resctrl_parse_mbm_assignment(struct rdt_resource *r, struct rdtgroup
 	return -EINVAL;
 }
 
-ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
-				 size_t nbytes, loff_t off)
+static ssize_t mbm_assignments_write(struct kernfs_open_file *of, char *buf,
+				     size_t nbytes, loff_t off,
+				     struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	struct rdtgroup *rdtgrp;
 	char *token, *event;
 	int ret = 0;
@@ -1827,6 +1833,13 @@ ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+ssize_t mbm_L3_assignments_write(struct kernfs_open_file *of, char *buf,
+				 size_t nbytes, loff_t off)
+{
+	return mbm_assignments_write(of, buf, nbytes, off,
+			resctrl_arch_get_resource(RDT_RESOURCE_L3));
+}
+
 static int closid_num_dirty_rmid_alloc(struct rdt_resource *r)
 {
 	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
@@ -1866,40 +1879,21 @@ static void closid_num_dirty_rmid_free(void)
 	}
 }
 
-/**
- * resctrl_l3_mon_resource_init() - Initialise global monitoring structures.
- *
- * Allocate and initialise global monitor resources that do not belong to a
- * specific domain. i.e. the closid_num_dirty_rmid[] used to find the CLOSID
- * with the cleanest set of RMIDs.
- * Called once during boot after the struct rdt_resource's have been configured
- * but before the filesystem is mounted.
- * Resctrl's cpuhp callbacks may be called before this point to bring a domain
- * online.
- *
- * Return: 0 for success, or -ENOMEM.
- */
-int resctrl_l3_mon_resource_init(void)
+static void resctrl_mon_resource_init(struct rdt_resource *r)
 {
-	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-	int ret;
+	unsigned long fflags;
 
-	if (!r->mon_capable)
-		return 0;
-
-	ret = closid_num_dirty_rmid_alloc(r);
-	if (ret)
-		return ret;
+	fflags = RFTYPE_RES_CACHE;
 
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_total_bytes_config",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 	}
 	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
 		mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].configurable = true;
 		resctrl_file_fflags_init("mbm_local_bytes_config",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 	}
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
@@ -1917,21 +1911,51 @@ int resctrl_l3_mon_resource_init(void)
 									    NON_TEMP_WRITE_TO_LOCAL_MEM);
 		r->mon.mbm_assign_on_mkdir = true;
 		resctrl_file_fflags_init("num_mbm_cntrs",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 		resctrl_file_fflags_init("available_mbm_cntrs",
-					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
+					 RFTYPE_MON_INFO | fflags);
 		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
 		if (r->mon.mbm_cntr_configurable)
 			resctrl_file_mode_init("event_filter", 0644);
 		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
-					 RFTYPE_RES_CACHE);
+					 fflags);
 		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
+		resctrl_file_fflags_init("mbm_assign_mode", RFTYPE_MON_INFO |
+					 fflags);
 	}
+}
+
+/**
+ * resctrl_mon_init() - Initialise global monitoring structures.
+ *
+ * Allocate and initialise global monitor resources that do not belong to a
+ * specific domain. i.e. the closid_num_dirty_rmid[] used to find the CLOSID
+ * with the cleanest set of RMIDs.
+ * Called once during boot after the struct rdt_resource's have been configured
+ * but before the filesystem is mounted.
+ * Resctrl's cpuhp callbacks may be called before this point to bring a domain
+ * online.
+ *
+ * Return: 0 for success, or -ENOMEM.
+ */
+int resctrl_mon_init(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	int ret;
+
+	if (!r->mon_capable)
+		return 0;
+
+	ret = closid_num_dirty_rmid_alloc(r);
+	if (ret)
+		return ret;
+
+	resctrl_mon_resource_init(r);
 
 	return 0;
 }
 
-void resctrl_l3_mon_resource_exit(void)
+void resctrl_mon_exit(void)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index d81877a5cd72..d9876bbc6365 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -5032,10 +5032,17 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 	if (resctrl_mounted && resctrl_arch_mon_capable())
 		rmdir_mondata_subdir_allrdtgrp(r, hdr);
 
-	if (r->rid != RDT_RESOURCE_L3)
+	/*
+	 * The remaining teardown operates on struct rdt_l3_mon_domain, which
+	 * only backs the L3 and memory bandwidth monitor resources. Other
+	 * mon_capable resources (e.g. the package-scoped RDT_RESOURCE_PERF_PKG)
+	 * embed a smaller domain struct, so casting their header here would read
+	 * past the allocation.
+	 */
+	if (r->rid != RDT_RESOURCE_L3 && r->rid != RDT_RESOURCE_MBA)
 		goto out_unlock;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
@@ -5068,7 +5075,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
  * Called when the first CPU of a domain comes online, regardless of whether
  * the filesystem is mounted.
  * During boot this may be called before global allocations have been made by
- * resctrl_l3_mon_resource_init().
+ * resctrl_mon_init().
  *
  * Called during CPU online that may run as soon as CPU online callbacks
  * are set up during resctrl initialization. The number of supported RMIDs
@@ -5142,10 +5149,18 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 
 	mutex_lock(&rdtgroup_mutex);
 
-	if (r->rid != RDT_RESOURCE_L3)
+	/*
+	 * domain_setup_l3_mon_state() and the workers below operate on struct
+	 * rdt_l3_mon_domain, which only backs the L3 and memory bandwidth
+	 * monitor resources. Other mon_capable resources (e.g. the
+	 * package-scoped RDT_RESOURCE_PERF_PKG) embed a smaller domain struct,
+	 * so skip the per-RMID setup for them and only create their filesystem
+	 * directories.
+	 */
+	if (r->rid != RDT_RESOURCE_L3 && r->rid != RDT_RESOURCE_MBA)
 		goto mkdir;
 
-	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, RDT_RESOURCE_L3))
+	if (!domain_header_is_valid(hdr, RESCTRL_MON_DOMAIN, r->rid))
 		goto out_unlock;
 
 	d = container_of(hdr, struct rdt_l3_mon_domain, hdr);
@@ -5268,13 +5283,13 @@ int resctrl_init(void)
 
 	io_alloc_init();
 
-	ret = resctrl_l3_mon_resource_init();
+	ret = resctrl_mon_init();
 	if (ret)
 		return ret;
 
 	ret = sysfs_create_mount_point(fs_kobj, "resctrl");
 	if (ret) {
-		resctrl_l3_mon_resource_exit();
+		resctrl_mon_exit();
 		return ret;
 	}
 
@@ -5309,7 +5324,7 @@ int resctrl_init(void)
 
 cleanup_mountpoint:
 	sysfs_remove_mount_point(fs_kobj, "resctrl");
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_exit();
 
 	return ret;
 }
@@ -5348,7 +5363,7 @@ static bool resctrl_online_domains_exist(void)
  * When called by the architecture code, all CPUs and resctrl domains must be
  * offline. This ensures the limbo and overflow handlers are not scheduled to
  * run, meaning the data structures they access can be freed by
- * resctrl_l3_mon_resource_exit().
+ * resctrl_mon_exit().
  *
  * After resctrl_exit() returns, the architecture code should return an
  * error from all resctrl_arch_ functions that can do this.
@@ -5375,6 +5390,6 @@ void resctrl_exit(void)
 	 * it can be used to umount resctrl.
 	 */
 
-	resctrl_l3_mon_resource_exit();
+	resctrl_mon_exit();
 	free_rmid_lru_list();
 }
-- 
2.43.0


