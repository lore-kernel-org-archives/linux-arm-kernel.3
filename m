Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AD2C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sSUlg5zoDJCca+wr6NHpayGmCTObicVg/Sxg26I8Xg=; b=G05xi1inYLc2z9tatjDQzKKlD7
	OUhRMjUqM5gWzoYmSF6u/frWR+4W7cydT6uT27+66L6bCcULD8K7EHORmbCdvsTjNK8Rj4DJgfb1n
	dTFaM4iIh0aU+Ec5qQ2yV5iMLcL2fhJ3TD/3NhVFPLixBuqtmRiPQTPeO9H2KaFgz9rW2VO/IOId6
	+/WcH7L6VZAicJKU6HrLv4Org4tnY474bDN3rXRacOyVO1T63PMfZEC5wI5s0JgypefxhGjt+z2DZ
	am6r79PD3f6zY2H9AKnSlkYbucI3IVbY5a95/QV/7tC4pkzdFWBtbcS82ZF9wgqLV20X/nQFSw/+P
	Acv/3oJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFT-00000000YHA-2ZTv;
	Thu, 16 Jul 2026 21:04:03 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFF-00000000Xx9-2bEp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+hvWWcZ8OnSq+6EUmlviCjJEFaicNLQ0Waabq3NVF9VNDEylHHR7mLbwyCQnmycETkHAj5zb029gzcf4pNeJzkwngX1dF7J14w4hPMbZyXleHf4e2eI+43hVzLovD7N9CkpzK4o/v4Q+6M6xnXpvnVLInI0IRhdSt+xoLOdtH4Sq+L+e51Ba5pb5BRLwTX+31JolpJORHd5pAyuTtHI+tEMjzSM42hPulUhMJyAO0Fdznv6Vl9TeGhRQO+8cHC6V3ghaGbLqT9HXB+s8KhYiey5bjUJY6x+IfubLStjXvkCwLJQqgU92qLVp9uH2nGioSy07jvMH/xheZ1zjkBJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sSUlg5zoDJCca+wr6NHpayGmCTObicVg/Sxg26I8Xg=;
 b=BwSLIILZkc4Koy/KecSM/sTNm/zW4Lmsiq1zBMXjF4BhGUzpXtEX+z5jAXN5ndRoHztmIhPtoN0w8jQ6M4zrMsCutU3PppRJzhikfd7emuhQTAOjDbcoXNRi0fOGowcIjXM9pCk8mu9g1Q0yhSwHznuPSJaCvwzPw/IKKHFr4nOlLgcnS67zBfkoDq3lmTZdINSScrGcRLWDHHG5cFxmoLWhwuLid+wJXzI8tfD8il3zNvHp5z9HRTSO3OIXivTmN/bFiNN5qmqzRn5mTAQEOromcTTp24Ue5Zz29/NsGfYdvnqz+QT/Ic3uwgXNLyFb6T6grnE9bNzyKhcVDaeGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sSUlg5zoDJCca+wr6NHpayGmCTObicVg/Sxg26I8Xg=;
 b=J41R0Q9CZ3E2On/PaKRJMjH9Oz6ZdxmjYBKScW4v3s6h3f+1OgRziKZgRpn69M1Ttu1mzbCXM/mzCing27+FuXlaFvXo0tHzllRce4jot/72hWcdHxOSKuFR/uHZg87hVxsGnM8/AdAwpbK5SFFuMajs44/6IbtfTHXw9KWVMEWthQDCgrHLY0pAtbx4Rez6QAKele4swl8C/KTqLxKouc1G6wh7imJbPiMNfGbLH7ZO3ITXCjSBzgknd8GquCXtjJn5ECTvZqQcAUFqPyxGdDsBvAm2ZuCAH7hczpO/CLoQxR0rAgOpXL0vIQxCUe+EU3h2UwTwySPc/bO6ucAgMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:36 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:36 +0000
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
Subject: [PATCH 05/23] resctrl: Add nested resource_schemata support for emulated controls
Date: Thu, 16 Jul 2026 14:02:55 -0700
Message-ID: <20260716210329.2914625-5-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: fc30905c-27d3-418e-a9c5-08dee37db3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: zbIyUWXOKA2J61VoeY2J5SBEh61frk8LgX2Cynq6GzGBrsgw1R+kkdnrxAjQuN2W0OQZPtK5/5kHuvY1HoT+M7gt6JPn/gBUzBk6c2p/PphI2a5e9cvDqXJ6w3MjwClHX+CYhtx+hEq8k3b8KC9YNenR3tAgZPDUBhMYFy1osebScbb64mG91zeTRLeH9rKMj6iyrEO+gZh1WsmynEVO0OXglEAPkox3fTDdYsQK+ZzHvlAE01O52DosYxIdHyT/c+be1uE8QtVzOGtQHkk0BmJsi57ERH+oErQ2xxhuK+EPXMgKRTkcMiDHECFNFxNHUptPwd/t4KBZp5ADeqD54yLwR63jlDz5Yxx4G3HaamC3S2y9oLGySLHJ7jZ8T6zlY9fnofMmp1K8gQbqwX2/i22dIuT7/N+n6YfYqbSC/cC6y2sHvPLS1si9kz/5eGRe/fBbfOOijYlWZiJKlyAvV/KixCP+1cUl7u3f9/e9ut0dspugrIaMqfrg1ZeLeA5yuoyh0qvBb2sCQ6rJQvS/xE5ifcZcVY5O3JGpBQiZMlLK9vvgo++BsA32XTkkU3B4FbXne+gvlJKdu6+alkzm1K+u3X6InEd/14BDMi325Ho7QgTc3YClKdkG15JyOX1ERJ1E0RPUrjSA04DnGV7XxVZL53eSZZnmT0wao96rvTOJUSng6NRj58TbwPTMrVvrtE0BYECFerYSKnhq8J3k2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GXLaCbkpCRApx+3+MMyIpt6uF00p5EGxAft6C6+uQy2srubBB4PpE6VdnWSS?=
 =?us-ascii?Q?tzNCqnpNijbaDLzco7BbwuibGNv/lbdaN6cyYdG3gdy+eQVVkUjXZHmzM8Ob?=
 =?us-ascii?Q?VxC6/PS6Q8udZRZIHKZ1aq5K4iThX3PhobBKT8/QdupZNNmoHJkKwD0iiGKO?=
 =?us-ascii?Q?TkQzTLNUPN03YyNtDXSbh3SkBYOS4SC03s/hsRPXoeRLd8n+zd1fSx0Ec37j?=
 =?us-ascii?Q?DV4IbrgUlrhz5acAfeMFQZBN5Q4OohrQUZ2We+E61fmxO8adrFpws3hUFGU1?=
 =?us-ascii?Q?QDZgirTuuE7TeGzh7V923yJAsc/8wB9ioXi3Ey0XBdSYOGo3s7jIswBTbQp3?=
 =?us-ascii?Q?PFSk0nGCHUtksLny0OiKjpIPHnnflTwMk7/JjkJF7pLaCuo8HoRWengj2cTj?=
 =?us-ascii?Q?C3NIsKsMdrE6NCQ6i2C4F8iuFz7Nulx8bEJ0YCDT6ZAGPzHih649yGkAQp4q?=
 =?us-ascii?Q?sS8SII+xJkt2gFbyZjrxl9DImrPCIW/oseK8mQ1YTMFp9bma/wioXfKlDMa7?=
 =?us-ascii?Q?GBdbcxPPwDh8ELCuXVorrLI6t+ReSdF65n/LrX9ZMUUOwPMiDCRCSw4xYZRB?=
 =?us-ascii?Q?CUn0b872JwKf3cY9mmMzcSiHVChmCuUAzcgSNBnZrtaHraxSupqEBM/mPQXP?=
 =?us-ascii?Q?JPqZp2WNjkV5mts8zsaOeSGzXNlJ5RlhDwgzR6P605ECfjcLqvbVpfBwhM9l?=
 =?us-ascii?Q?/CHjHS7xwT+AHbyJctoZ4NtPB7VoIdCMsSG1b+1FtrlvPI83RYJfUB7iXCj6?=
 =?us-ascii?Q?rSr0jzfQ3DLYSHP2o74xHlJOXDkS/dMNmQ5F9hXCT5xxPWV84sJN6tOOEbNI?=
 =?us-ascii?Q?d6ovCeayWW6ABcluktpDcdgnAaVuAyo6qxiplZct6EYTPuKx8rmIwx1cSnrW?=
 =?us-ascii?Q?GkYkJW4SgPNzRkCaaLPD2FZ0IDcnr2T6ARCxfDGJUrJdaF65ZTCOgdTAZTP+?=
 =?us-ascii?Q?KeBb4K6VvqhEfa3gZ9/KnPs8APeJAZp4LZmDmI26UyomU3j9JVX1Ss6A4wXp?=
 =?us-ascii?Q?ALc4uQyKf9EJ0Dc7ih7rCB8RD1lcZ+oVfGeCmZ7stkWvAN1n25hNLIzwZRse?=
 =?us-ascii?Q?i7cgQKx+gM7xb65+aUq1eItrC8FpXDO9ZMxLhWr6scvRpiRJeDELN6C/S+MQ?=
 =?us-ascii?Q?ZDMn1ZY/ERuYn+H1FpP0QpM1iXI6Gp4fgxu1We9UurvIEnb98cj0LO1LcehL?=
 =?us-ascii?Q?255zDyOTGqQ5esUMmHW1dY5xgy0p2bKOWw0daa43jaAhsLasRD/ljtgWwpGF?=
 =?us-ascii?Q?rVY+P1EgzE/U81hsfMfeNQVOEIXaWrt0Xg64obDwS4Ug7iUh4eMbmom7eUsm?=
 =?us-ascii?Q?jXbr1WbpsyM8eH48vHN/fYV0m09gxpbhhIHpqIWqNZR7KVPP6g8CUaO1soIw?=
 =?us-ascii?Q?iftfzBUbot8mg26DF7ICaORtIRryilANf774K2j2Hrh5v3Z3Y+1QLA3NC0Vm?=
 =?us-ascii?Q?LYDYjvofsSkNFOjFtmRmVvub+U1mlx7W5bBiyoVygavKvFiEOZ5LqBBO9WOn?=
 =?us-ascii?Q?QCJ/w19C2aLwx23159ZveeMhuc/xcPiikB1e1t5XvreerXgQxzZHqpvqzMbq?=
 =?us-ascii?Q?G/kybkXR9Qo8qDTbHyX2d2PK4FiclQhVESGEJLtZIOUjEADDoKWdVphM8EyQ?=
 =?us-ascii?Q?3m6C6o+SmKm+WY391Q0m3a+c18ODGWLt8OLMn357jJyHdyFfwm4TUHRevIYb?=
 =?us-ascii?Q?8frTyQa6CBueQoyrI4uUaPvWuhXEByLOdhwH5HH9tGf1W0vHH3hsGOpSucYQ?=
 =?us-ascii?Q?pLDwoyCq1Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc30905c-27d3-418e-a9c5-08dee37db3ea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:36.3906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ghVzkNUkEpIvlMR0PO2yq2qz9Pnul6OjhZaHYJzohwujVETKGOXvAh/g4pVYYyQRSF600SjFO9GGacNIO9xig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140349_662229_57330E8C 
X-CRM114-Status: GOOD (  21.59  )
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

Some architectures expose an alternate, hardware-native control that
emulates a legacy control (for example a node-scoped bandwidth control
emulating the L3-shaped MB control). Represent this relationship with a
new resctrl_ctrl::emulated_by pointer stored on the emulated (default)
control, pointing at the control that emulates it, and add a
RESCTRL_CTRL_NAME_NODE control name for the node-scoped variant.

Build the resource_schemata tree accordingly: create the default control
directory first, then nest each emulating control beneath the default
control it emulates, while non-emulated controls remain directly under
resource_schemata. Creating the default directory up front makes the
layout independent of the order controls appear in the list.

Architecture backends set emulated_by during control init; until then the
nesting branch is never taken and all controls remain directly under
resource_schemata.

Factor the per-control directory creation into
resctrl_ctrl_create_subdir() and fix its error and ownership handling so
the newly created directory (not its parent) is validated and gets its
uid/gid applied.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 arch/x86/kernel/cpu/resctrl/core.c |  2 +
 fs/resctrl/ctrlmondata.c           |  1 +
 fs/resctrl/rdtgroup.c              | 67 ++++++++++++++++++++++++------
 include/linux/resctrl.h            |  7 +++-
 4 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 07c6ebb7fc43..5575a16caeab 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -214,6 +214,8 @@ static __init bool __temporary_multiple_mba_intel_controls(struct rdt_resource *
 	case RESCTRL_CTRL_NAME_MAX:
 		hw_ctrl->msr_update = update_temporary_max;
 		break;
+	default:
+		break;
 	}
 
 	return true;
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index d95ab8ad36e2..1f832a838115 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -304,6 +304,7 @@ static const char * const resctrl_ctrl_name[] = {
 	[RESCTRL_CTRL_NAME_DEF]		= "",
 	[RESCTRL_CTRL_NAME_MIN]		= "MIN",
 	[RESCTRL_CTRL_NAME_MAX]		= "MAX",
+	[RESCTRL_CTRL_NAME_NODE]	= "NODE",
 };
 
 const char *resctrl_ctrl_name_str(enum resctrl_ctrl_name name)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a3aad9b1ff6e..3bec23728847 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2781,6 +2781,26 @@ static int resctrl_ctrl_add_files(struct kernfs_node *kn)
 	return ret;
 }
 
+static int resctrl_ctrl_create_subdir(struct kernfs_node *kn_dir,
+				      struct rdt_resource_final *f,
+				      struct resctrl_ctrl *ctrl, struct kernfs_node **kn_ctrl)
+{
+	char ctrl_full_name[20];
+	int ret;
+
+	ret = snprintf(ctrl_full_name, sizeof(ctrl_full_name), "%s%s%s",
+		       f->name, resctrl_ctrl_is_default(ctrl) ? "" : "_",
+		       resctrl_ctrl_is_default(ctrl) ? "" : resctrl_ctrl_name_str(ctrl->name));
+	if (ret >= sizeof(ctrl_full_name))
+		return -ENOSPC;
+
+	*kn_ctrl = kernfs_create_dir(kn_dir, ctrl_full_name, kn_dir->mode, ctrl);
+	if (IS_ERR(*kn_ctrl))
+		return PTR_ERR(*kn_ctrl);
+
+	return rdtgroup_kn_set_ugid(*kn_ctrl);
+}
+
 /*
  * No need to cleanup on exit - caller calls the recursive kernfs_remove()
  * on failure.
@@ -2788,10 +2808,9 @@ static int resctrl_ctrl_add_files(struct kernfs_node *kn)
 static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
 				      struct rdt_resource_final *f)
 {
-	struct kernfs_node *kn_subdir, *kn_ctrl;
+	struct kernfs_node *kn_subdir, *kn_ctrl, *kn_ctrl_def = NULL;
+	struct resctrl_ctrl *ctrl, *ctrl_def = NULL;
 	struct rdt_resource *r = f->res;
-	struct resctrl_ctrl *ctrl;
-	char ctrl_full_name[20];
 	int ret;
 
 	kn_subdir = kernfs_create_dir(kn, "resource_schemata", kn->mode, f);
@@ -2808,19 +2827,41 @@ static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
 			return ret;
 	}
 
+	/*
+	 * Create the default control sub-dir first. Emulated controls are
+	 * nested underneath it and may be iterated before it, so it has to
+	 * exist before the rest of the controls are created.
+	 */
 	for_each_resource_ctrl(ctrl, f->res) {
-		ret = snprintf(ctrl_full_name, sizeof(ctrl_full_name), "%s%s%s",
-			       f->name, resctrl_ctrl_is_default(ctrl) ? "" : "_",
-			       resctrl_ctrl_is_default(ctrl) ? "" : resctrl_ctrl_name_str(ctrl->name));
-		if (ret >= sizeof(ctrl_full_name))
-			return -ENOSPC;
+		if (ctrl->name != RESCTRL_CTRL_NAME_DEF)
+			continue;
 
-		kn_ctrl = kernfs_create_dir(kn_subdir, ctrl_full_name, kn_subdir->mode,
-					    ctrl);
-		if (IS_ERR(kn_ctrl))
-			return PTR_ERR(kn_ctrl);
+		ret = resctrl_ctrl_create_subdir(kn_subdir, f, ctrl, &kn_ctrl_def);
+		if (ret)
+			return ret;
+		ret = resctrl_add_ctrl_files(kn_ctrl_def, ctrl);
+		if (ret)
+			return ret;
+		ctrl_def = ctrl;
+		break;
+	}
 
-		ret = rdtgroup_kn_set_ugid(kn_ctrl);
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
 		if (ret)
 			return ret;
 
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 5d8ea12ae16b..06482e766087 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -362,12 +362,14 @@ struct resctrl_mon {
  *				has the same name as the resource.
  * @RESCTRL_CTRL_NAME_MIN:	"MIN"
  * @RESCTRL_CTRL_NAME_MAX:	"MAX"
+ * @RESCTRL_CTRL_NAME_NODE:	"NODE"
  */
 enum resctrl_ctrl_name {
 	RESCTRL_CTRL_NAME_DEF,
 	RESCTRL_CTRL_NAME_MIN,
 	RESCTRL_CTRL_NAME_MAX,
-	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_MAX
+	RESCTRL_CTRL_NAME_NODE,
+	RESCTRL_CTRL_NAME_LAST = RESCTRL_CTRL_NAME_NODE
 };
 
 /**
@@ -383,6 +385,8 @@ enum resctrl_ctrl_name {
  *		Specifically, "rdt_resource_final::name"_"resctrl_ctrl::name".
  *		For example, with resource name "MB" and control name "MAX" the
  *		schema entry will be "MB_MAX".
+ * @emulated_by: For an emulated control, points at the control that emulates
+ *		it; NULL if this control is not emulated.
  * @cache:	Cache allocation control properties.
  * @membw:	Bandwidth control properties.
  */
@@ -392,6 +396,7 @@ struct resctrl_ctrl {
 	struct list_head	domains;
 	enum resctrl_ctrl_type	type;
 	enum resctrl_ctrl_name	name;
+	struct resctrl_ctrl	*emulated_by;
 	union {
 		struct resctrl_cache	cache;
 		struct resctrl_membw	membw;
-- 
2.43.0


