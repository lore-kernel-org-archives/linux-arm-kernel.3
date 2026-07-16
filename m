Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374ADC44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5kwkq3KbDBQSPQwSevZU6hLzRLQHNLwcKnfZ1JQAB8=; b=LcbzOsZsoeP7CUdZBg6ENnG7L4
	h1rS93ux6pFBqtqelP6TohvcGI3yO2a61W2/+i2m2O0n+Ame3wf/8/2srqzMaVoCGWOxluqX0GFbA
	m561rF930zcDTLTqzEhdDi96MITvjw1HBLIw4rL064Fl/XDJbQJX7N7cRM0tDR8S7QQzqR9p8+1Vr
	rNXwtPyjY2DjAzG59FvRZj2gCVqt0JaBurfA1LUpnTU2md/vF8T6QzbDdmhgmbw2FG1ZT68hw9/yT
	/GLSLxO/WAXYlZiy5SWJJ+BbkHaMg0tT9mQ74nspMl73/BjVQ52HuDpNAdekFip71L85vMyiw9Gdy
	t3rLbjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFC-00000000Y0U-0WNe;
	Thu, 16 Jul 2026 21:03:46 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTF5-00000000Xx9-2jbw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2B07sk9T65BMqJeJRfuSLf6qYJiB6uDiYkW4p5zXDcrcAMO1psHRPULt5xtKXksxHZW4+7LLUGzgowqIJW0zDT30zOUwW6Uv/7121FTIfuLRo9Qcimh5PlEBJUXPxYPPgvGsp+wfmLPjDsS35NYxg9KWxRWjRnoYx/fKNLsOP+nTbVam+nGgccBywjVfIizEnyiHk8ShDydFCrztTQviBbw8qTi/gluW5Vp4XoTvmryJETQ1aJhFQRw5847Zd5phUHq154ELfFCMrehLW4zn05/DEA9NjnCamZNVV8fuCitPnQW2c6eVIoEOYQ/Uvc3maKZlvBGQcDe7/MMxrTnfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5kwkq3KbDBQSPQwSevZU6hLzRLQHNLwcKnfZ1JQAB8=;
 b=C0q4f0HMoEZpWmQ15uqWb7UDkgC1uAAbJooaMkJLib5QOF80AOmgtR6+iegX6I32ZTnd+X2Wxf55l3DScK29E7waj8QzGRXGTIbwx4VPOdhDddRB17IjsY5DkvaoXwOkO1swJlZPwoYkKELsweX46n+v5S9wjviRxytdB+GE6jE0BKDWu5fKm0FJbv3aMbsJusfi2eDJgKJahHaPIIh9Ax3/6zWI3d1Y9FCKMIbTgq/pwdQK9QjElPG/hect2f/5Tv0ACpoQ1X9CxX2Zpnm0Yg9OBU6bjw2cfZddqDNuDsPaGYuU0xB0R0u58oeMks2J4vN+uLfeRcA5OeirCRAeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5kwkq3KbDBQSPQwSevZU6hLzRLQHNLwcKnfZ1JQAB8=;
 b=XzCDuxTXUOKds+pFwNyBbPGY4hikyKGGLrV76G9I7mKWnXwhJVktcw+SrXavepIMRuUFAYDZ4U9vioJrlqDaQ9eG/Edzmd7WPfPZvWDxWl3U//Dy7azTwZEs2uM7SThbQtjOhoQNw11T8GtyFgHPi3nxyBYXqBmHTGicByTq1yz0CTeZVgg154QIKnavZNO8LcOsRHFL26rji8wRyo/Fij0GIlcGsw02SLDcS0wzcOj0s11Zn4r3Q25/6MAyO553DchNfbayHNeHRqfcO8xhspMiijcyTcSV+h9uHCxywfTMtFs68jhMalqqKQP1CnZt0pHXARN20Onf0GVFbl182g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:30 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:30 +0000
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
Subject: [PATCH 01/23] resctrl: Fix ownership of resource_schemata control subdirectories
Date: Thu, 16 Jul 2026 14:02:51 -0700
Message-ID: <20260716210329.2914625-1-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c9d0ac-e8db-4853-6c36-08dee37db09a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|22082099003|18002099003|56012099006|11063799006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: tKa5ozuH2rYL/8glLI5CUS65hGCUKk8Aua93Ft6sMjf+0l0ebSJ5+9Lw55f38JS9N5PjU4wjIqmjjnMmbVjepkwXyUI1VtY5y4K5GLdWDNtK5FlLralQhk5CTKUvUA4I4aNCLDYXN6fubA1GMlfOht6ykd7IEp7mPm4E6Ng7wYSYh8JfH1wGTr+Y0GWvBBvINiSz5WaaDCiWNlFwtwlA93w7vpYkXiYI0II+13MsN/QQjvcRaEw+y2FG8XwHl6qBgHiKCrDR96/mwYIuZuI/rBoJ26saM0tnnJXjk0QMPd9MJtJzqBOvyN4CFsvYDDL2DeNKVzj5Yf8fpfFx0Y9OoPwtZM/k43YZpejMzrK4Cdq2hIA7ywOudg+968uIB6KEtampQqVFwTb5JBbr9jbDwKzDP/G08x6jTm1Vt+ND4uY/ft+WqeJq089n+e6B3FmW8IP11bNaFkwxwDlUEY5SZv2Qs+d/iD2Ljm/SyT4FeodPFLIXOqPVj583AT24D5TnBp8hBJKz066hdMqdZq2TgKA9ogyHOiNqcgLKmVr0M95ymUxOpLNJOaU6l3TGt1M5H3RyolaOh0e1mEqRYHmavckpfIlPyyD49eZgZVlodrYRlMNgIZy2NSyKtpoArcVcM/E9C8Qul9rC2ad7ueolhoy7fBqp2C5lnUiRq8Q/B0rBDY91cwCsyqbtbyPXIEC1fyXTrHfNb+prBzqo56SUVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXmYt5U+No+rBkoaGP4F5otuzgUpACkaV76jxvITm86pAysYNxxjo3ELR8nz?=
 =?us-ascii?Q?jiiH0Gb6HifOxR6CbNHyvof78ryxF8B2e7P5QZ3RnEHiMpAJQDanCFGFaa+x?=
 =?us-ascii?Q?wjiDcWRITa3vuSvj+T1P+/+8bBMMDW/8f4AGjOFBBC+PCZXwsHpQEp1gePVe?=
 =?us-ascii?Q?ej4kQhAcZ2V85Vns3tBLo9/7PWS8bMDINQi5V1fVaXls9XIt5gTW6DEpfHJj?=
 =?us-ascii?Q?2u9CbA43T3r6BnEk1/kCxlFZUAbAQ1SKo0FwPGTBYD+WWY9nqtkngcgi4sPr?=
 =?us-ascii?Q?wmgagAYhyMwiQdG4rSVw68xp25mK8XKQMWIlfGinWVSUjaBvoe5q7OGLO657?=
 =?us-ascii?Q?CppUKyGYZ/P3sDyQlmFIjuk0VYXNA8gv+Av3+7oMhMvj5c3QvImHztJDYGrz?=
 =?us-ascii?Q?rdpu5zyYjDHod3i8+A3ChKmiuCO8kXgtHmTka7Z9oxOsx8qtROxA8qCJh4SX?=
 =?us-ascii?Q?oorX0g3Ery/qmC7UARfqzzEzHMQipvpbZf5tqxzslHE0TCBYrMBeKjyBm8/j?=
 =?us-ascii?Q?rD1ja1kwvhakXjz/4ReKNeV5D2y9QuwNsiafQtpPh7fkDHfBD5er87YMtVPc?=
 =?us-ascii?Q?MNKj5Rc2/TnHDiCidiQlOqi4E+ps0sYwQuSRKZ0fnrdFxpmefH1f6EdCGv7k?=
 =?us-ascii?Q?3oVQOPtfXSkMX8QCnDOoFhvnw6J5P3kJ0o5beiSukfNRBvwLIDnZae0rn5Ug?=
 =?us-ascii?Q?bM7GF0ODy5lPjQql6ktK8Zena1mPSlCyF/iQebMMFroGggWJKdN1JqEgWUaK?=
 =?us-ascii?Q?m5MnsrW3ZqtqQ8d3LliY36Ni+rovuUXNr0uvWAonkVQ1Bq+vFk5nYbMORd2E?=
 =?us-ascii?Q?p8+5uElBaRtZD2XuwIEHOd/xNXCkJHh38hgkw6n8xvxzUup53b3TyO5OzRIT?=
 =?us-ascii?Q?niLKx6Lk5dzYTGBtzEKWWtloCvRxjIDvJrAaHncERv5TE/KrA75kBc+gMzMA?=
 =?us-ascii?Q?n4lmQa4vUKycLsZlurwvGtVllR7Wkjx+91JBpf+WdIIrc3Is6aofwtV5cpwF?=
 =?us-ascii?Q?twr5oW5GzAl+eIqwjDOC/NajaXghnPwi6laC2nq8kbFjHRFTzpAogWGi305r?=
 =?us-ascii?Q?wn60qYnciPT7pWCxS+mzKUIQcFJL/pUe8zLWew2Ze/4MK4nWEhDXM2psmUcT?=
 =?us-ascii?Q?cu1ifLfdXAY/DQQDDVxzV0yeRj67gANWwaYNg1V0jZGrz8gJswJQKRb5PeVF?=
 =?us-ascii?Q?eHG8hLGC/OP0PEvt8rgnhTaUtTXGZs0uEm/umiae12vNCT4W0gcdcOjSvgPP?=
 =?us-ascii?Q?h1yx6EGe2paXml823WKgwvKGVPy4V0653jLVtUcSRB/mIAFaN/1s3SRMfMcp?=
 =?us-ascii?Q?Jf/Glywt9KztQIORowW+5whUucWvpfMlLFHNtDMy4d6IbsgJGCEl2jxMpjJk?=
 =?us-ascii?Q?fkzpd7M0qCwxO+hJHOOiOs42B0yInweiuy8U15E6gcDyn4n9UDZ2AnIc8r30?=
 =?us-ascii?Q?CRNZijDw5IMM7NTbaeFi+TsC0MOBOg42rf4sj/fH9Jce3qRRDRpG9DPk7LhS?=
 =?us-ascii?Q?r9WTDkycqB8Ljm3Uhz5/Wc43VbVNYok8UN7o1M4ZtUr6gJrjz77herXXDZcC?=
 =?us-ascii?Q?2pAW/fzDSkcvbg+qQlH1pjkEOnOXf/ik10LShzRbBPfWAfPSkK0qDONS2uR9?=
 =?us-ascii?Q?jo6zINdOU26j2i5OamjR8/XaA2lw5cD8lQu0AuvwUPJJsYmN41Uz/kDEkmDc?=
 =?us-ascii?Q?GXL1lXrLO8xF8DoCqS8cqgpfWzXkGjdiEgcGvTk2arC7cSv1LV7ATv2Wv6jf?=
 =?us-ascii?Q?BkV3Ge+yuA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c9d0ac-e8db-4853-6c36-08dee37db09a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:30.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gL7HY4TOuwjEpaH/X2eQfOHmSi8abfcv0IOBmJ1veyRFGvKz8Iwb9juy8i5kNOd815Oad/veaLKFaw8JBX0ALQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140339_694831_96ABB1A4 
X-CRM114-Status: GOOD (  12.03  )
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

resctrl_mkdir_schemata_dir() creates a control subdirectory (kn_ctrl)
for each control under resource_schemata, but applied ownership to the
parent resource_schemata directory (kn_subdir) instead of the newly
created subdirectory.

rdtgroup_kn_set_ugid() is a no-op when both uid and gid are root, so on
the common root mount this is harmless. On a non-root resctrl mount,
however, each control subdirectory keeps root:root ownership instead of
inheriting the mounting user's credentials.

Apply the ownership to kn_ctrl so each control subdirectory gets the
correct uid/gid.

On error, resctrl_mkdir_schemata_dir() intentionally does not unwind
partially created nodes (see the comment above the function). The sole
caller, rdtgroup_create_info_dir(), removes the whole info subtree via
kernfs_remove(kn_info), which recursively frees resource_schemata and
any control subdirectories already created.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/rdtgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5ccd09b16e0f..2abb7fda6091 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2728,7 +2728,7 @@ static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
 		if (IS_ERR(kn_ctrl))
 			return PTR_ERR(kn_ctrl);
 
-		ret = rdtgroup_kn_set_ugid(kn_subdir);
+		ret = rdtgroup_kn_set_ugid(kn_ctrl);
 		if (ret)
 			return ret;
 
-- 
2.43.0


