Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D21CC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=El/qMgS9CJ/Oykq+IgFLvKdQYq8XSSkgytTflW+oyR4=; b=sIYYrCtgq4ST9cALGtw8959mP2
	/b5TPLIxYsOmQ1LL9WQgPgqFnsj0a6Tv171GeV6ex0MLSFKcXW7SHkIHn9sjRxojEtqP35u05UoMa
	hjjDSwlHm+gSoCrWimSjE3WldONPjq4sozz0FSOPAMePIBhoiXf5S9iD16AFZhad9cFmEbyR0WNYM
	EMmamElJ1N0Zi3N0Nqp5W4Gt8yYTgWoQ8NydTjFvsccIbeCNg/cyzVY/741EvgAShsh53FITtxxUW
	wJCRQCKhRWr70kU+slE6/3Xk5l9WVLLVMzXFKp0An4csifdgL7P+1wNB2rTD2SPTXoI6sKuv873ay
	UOABGXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFG-00000000Y3l-1Lbn;
	Thu, 16 Jul 2026 21:03:50 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFC-00000000Xx9-1qEF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQIXuaoB6iv3yYihtFVfLcpw74fCbe/hvjwMM0i/2Bc2wAod9tBzUluLZ8nsdu5zijPcVHzNnC8bonumTRSsItflgiFNy0i4+xjGrRDycRL7MJgsb7L3TMgfpEyHtUbPVLZiNsKUCItQiVnuanmLCoNpxd44D7KqQZ/TnkjJSImbJKuQV3teZUnzQ3YWPMPGBxd09twBF4g5HHYLnuu8JJub14qblfmuqFCfY9vUPiuEH43Bmpg8AGvvCudzKec0fvmTl8q8HiWpouTuanGpJqB5eToiMiMRd+svpih3wfYboOss4jihG78q7QFqV9N3fARAX11/R4dAfUxM21g7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=El/qMgS9CJ/Oykq+IgFLvKdQYq8XSSkgytTflW+oyR4=;
 b=FLIUPmGjX9lQZGtdY0ylDvgWDuDqqTgeuvOIH4t2Lgk1MdI1fDtTzI7EjjBy85+i1qaonaX8egsCZ7LgWRGGe21jGYZ9WOV96QYjbimhZUsYJFVC398gMXBs5TNO9rsEZEYzuw330YV15JbsKfJ/bNW/65lK9PifSmcLLdUcKFsek7fEXx4Jx5R7mZAj7nulqO9iDiU5a0xoeUX1MsrfF0LtkwxhtcRtzyM40deyOZfUsoFdoz9Cf01H/TpiTVlQ6PsmIJJT19lGfVBA+Aaep6yHXHtE45MousBuy8DGDlYuK2nUn4+uv5uLSi1WeTRrNotB14EIGWHlNGp2uw05qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El/qMgS9CJ/Oykq+IgFLvKdQYq8XSSkgytTflW+oyR4=;
 b=V8m1Kyr5tRhQjZZLdVl+R48hMx9BcljDfpRrA1QGNGleEu6ShvLefRdq2Brw5LRYoiey9hTObwx2UaHWhFdRmLVtDzCbgesp63J8cGwcI66lX9Tvw1+25CDo/k1cjU5Ze6EJZuBR3gPvLfzyRfy9RAxKTKvkOg3s0ht3eM96Rw1DYZneLCC+cYetI3f3/Er8l5R0Zkhr6u0cC+pfr/vk8zB7RGsKSvV/GIsVY3RFgsep0mqhmATFJHP4M/YbsyB+jffI+hFXpbuYrhp5Q2lfo61X5aH/Rd+xsZ9jiC1jwh32J6OjDzzmn0JmzJOGy/Rb15cEZIq+wlnF3DgBAZ4hsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:33 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:33 +0000
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
Subject: [PATCH 03/23] resctrl: Expose MBA resource_schemata mode sysfs
Date: Thu, 16 Jul 2026 14:02:53 -0700
Message-ID: <20260716210329.2914625-3-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e3a821-c21a-4299-57cc-08dee37db24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|22082099003|18002099003|18092099006|56012099006|5023799004|11063799006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: rj/O7btQmfkF6z68tE4UjZVLPmr8qGYir0nAwdPxKj7kGxSzk0zb4GFsgZYtiEiOBEHJ6W/kE5o7x7aUbZdYgZKjpXFGY5zCqVEz2MXTC/1+r4cV0xprLRAG+bYwP8/jZJbUA0i7T7DMt05IVK3lNF8Ys28THkN8z4LDiCh58dletvZyrqvi0H/ruv5yJpmqe7/X9Id/7DM2LrGs1a36iY1g5V3pQ8q1BPio2I4o7/N+pI+DJ1YQT+fAVkB/sXUI+HvEIbiPESgnrHlekAoA0OJZMg4moGURFCIfdOFSNTpckRldUJOlksESkacqM1lcftzMlabo74k1I5HsPOivMl0mhaOV/qewT7l1IEUfVfzW06DFz+nwRsxiuNo+P14z8qZgaq2HU9K9uVGYsAY7q8OKIE75tz+EArMWUnWY4V1KQ3dXnKfnQQfv85cOzn7jJ6Yf7nvGndwbZLM1ErBOfh38nSQbuwLlhXA/vLwzZLsikZupNWPdvJcsN9R77WxHVZ8Ao420gIhBOAKrg2cpiGygFh54lC/1TXtiamkjD98GdmhMIjA0Z+Bhwj8l63xAJab81sQfsY2JtbK309amOr0x8k5kTyG2lckwlZ5J8RTCF7cE8TvIEW8MKQTXRCR9HVABkx6J9Eo5CBTDxp2PSrI8m6x9G+qz9o6ppBMBzCalzK7VMoJHPxMXWoQl3zZooiwKdyDLidBZGYOTcfe4ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(22082099003)(18002099003)(18092099006)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84edVPkI+dtOjITK3u+c25gHu2xQZ2WNuZ3WMZkvLBgA3xI+AQwTMocmuY83?=
 =?us-ascii?Q?HgDqQj9wmPgGyRV8skypnPjkJXlhAbr1CF0fyTTGEift0Shki2xIEFHetRif?=
 =?us-ascii?Q?wwf5QgxJxsAko7N55Ne7d0JFviCn92NlfBJdTuv4yJwK5KNEpIG12qLY1PfD?=
 =?us-ascii?Q?y1NHiyg6bAse7np/nVJTs2h+uZ5OQBlgYtKuHqX6c3muDaEJXQIh2JNlOIh3?=
 =?us-ascii?Q?WuDWvyWSt6ygTLVyJzuDYcoSrfCRM+xjOhpyeae+YagEd8hKalh4GFmMTT/g?=
 =?us-ascii?Q?Zookoa1EMO7e6GshnkeZiZfSxA9zEb+LRpFlHA8weKHZz6CIJrLkLy8/iz4I?=
 =?us-ascii?Q?zS7rExt9/nnMwTKj7pbhewWibR5ddsx2RStUwC1OBuyq/iFZP90vV8+kUIuz?=
 =?us-ascii?Q?v9Qs0io1+opsqXcnoedYTzDv44RwEbLUha5OJ7/c7m7Td2a8cwrosSeS6wOv?=
 =?us-ascii?Q?9O2Y8F5B8TlXAyHB/AWfzQvw47He55jNw9qNfhPfsgYOETD49vCM5lSMsoka?=
 =?us-ascii?Q?NkgGIqdWMZSvLShohCLfsPn/MhWJXFSkr9Y/d3COyjXsKyiFaYRMd5cFPOmT?=
 =?us-ascii?Q?67pR5FOXryVXNn0QSKodDlkJ7K9WxGeaS5E/5uNO74HptS2tLZAZZF8YOyW/?=
 =?us-ascii?Q?fuh5gxhWG2agENPjnpxWK7dCelzBu1V8MC3jW8aOHgDmfi9C8aoz9/1+D9zW?=
 =?us-ascii?Q?e/IA9PZemZPXAJcIdMtm1gMyvWTs1uy6IpsUuFSae2ZrztA2wP41Il44c6DP?=
 =?us-ascii?Q?AB0CXZOQLzw7Y1Pj60ooEZL1zJPXtdoriqPlhS9UZ5WWFtzV9qHY01l1WAUz?=
 =?us-ascii?Q?6MyeoGcEWhp9CoTbS8x7nRDmJelzkJQjKURM1jjUXS2ZymWzF3jLsK1ZF6Bd?=
 =?us-ascii?Q?nMshGTg5wIIhwfgqgv6eIiP6P14W75wD3pHCjrEPlG3xsLFhXHLk6KLV5rK5?=
 =?us-ascii?Q?j4EXDAE6QgeZEUdwwGSusyGMrVZtWcXFrlcBp+dXI6vLIa4Eusdmxjd5xiRZ?=
 =?us-ascii?Q?AHveBPHMVNCxM/+jAQ1l+CA60/+wRYz4u6EXsO7f6ZoRChz1xwBVhGxksYht?=
 =?us-ascii?Q?E+SjyJW41aFfSdol0oI7R9pM2VXVV/8f4bJyuFAMtKUzxsaRvQS76edpPHsP?=
 =?us-ascii?Q?TBP7SUmULiW92ThCmWDAt5U3Xufeh6PnK1rtjN/UNwcwCSf5D4zrqsMIB98h?=
 =?us-ascii?Q?PGG5k0NK/AOJZ0qXCdNnbARBUIv1rXLEmBCmfrFtulUYBG4isyff94zNC0oG?=
 =?us-ascii?Q?SHIRVhO3gsG75HorRTi83X8LfaAnMJoBdtLEUX74N9Efc79lk33cyZDRP4NR?=
 =?us-ascii?Q?2pJzgzR0s/w99uzqIEGyxF++uNEcfy5EQXq7/HUin1adKp4gpcbs5/b18ULz?=
 =?us-ascii?Q?DLr47O1D3u2RmEAbPXrdMgRBmqNRb0hH6KVkinX/JTMI7E/BksCwuh2N8wbB?=
 =?us-ascii?Q?md+18kSZZTqMyNLKJbYGWOKNZFnphk+xmWPRoYv/916tOO3Ju1K5+ZQlvzge?=
 =?us-ascii?Q?frSYPYFsIl1Hs1gK3UX1FNfPJALDpy10uiq+SgNuhKd8Mo/hlbVzdwV0pVch?=
 =?us-ascii?Q?Mu6cABgZiKe8ZBIR28Va6h+01tCnwxbvH3ocDdyG4iTgkSwuBgcno7exkkjk?=
 =?us-ascii?Q?97yyk/eUd4OMqqmBzQLlJw6CZjK0oz1QBlO/vez0jKf5sCW0D5/cdhvzr3eL?=
 =?us-ascii?Q?1IzLVTcXmg7xC8TfL6kYucUvp4hysMEANiWUZ7iOatDCibKlzJPwNcoozAYl?=
 =?us-ascii?Q?QRMxnB7zfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e3a821-c21a-4299-57cc-08dee37db24f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:33.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRm+BhS9lWnRgHHmfXI3vKjYaK45I2CJ2eTG8hFH2fjRZLPgct4kUHMYlooGOoNuLJ28M8O1VCtKPFEvaoAF7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140346_482739_5DF07B22 
X-CRM114-Status: GOOD (  21.23  )
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

Node-scoped MBA on MPAM needs a way to distinguish native memory-side
controls from legacy L3-shaped MB emulation. Track the selected emulate
mode on rdt_resource and expose it as
info/<resource>/resource_schemata/mode ("native" or "legacy") when the
architecture enables emulation.

The mode file is only created when rdt_resource::mode is non-zero
(RESCTRL_CTRL_LEGACY or RESCTRL_CTRL_NATIVE). It defaults to
RESCTRL_CTRL_MODE_NONE, so resources whose architecture does not support
control emulation get no mode file and are unaffected. Architecture
backends that support emulation set the initial mode when they create
their controls; on MPAM this is wired up together with the node-scoped
MB_NODE control in a later patch, so this commit only adds the (dormant)
generic mechanism.

The mode file is added read-only here: switching the mode at runtime
requires rebuilding the resource_schemata layout to match the new mode,
so the writable interface is added together with that rebuild logic in a
later patch. Keeping the file read-only until then avoids exposing a
writable-but-no-op interface.

Store rdt_resource_final in the resource_schemata directory priv so the
mode file can resolve the backing resource without dereferencing NULL.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/rdtgroup.c   | 77 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/resctrl.h | 17 +++++++++
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 2abb7fda6091..6b1f24c6a1f2 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2696,6 +2696,74 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 	return WARN_ON_ONCE(1);
 }
 
+static int resctrl_ctrl_mb_mode_show(struct kernfs_open_file *of,
+				     struct seq_file *seq, void *v)
+{
+	struct rdt_resource_final *f = rdt_kn_parent_priv(of->kn);
+	struct rdt_resource *r = f->res;
+
+	guard(mutex)(&rdtgroup_mutex);
+
+	switch (r->mode) {
+	case RESCTRL_CTRL_LEGACY:
+		seq_puts(seq, "[legacy] native\n");
+		break;
+	case RESCTRL_CTRL_NATIVE:
+		seq_puts(seq, "legacy [native]\n");
+		break;
+	default:
+		WARN_ONCE(1, "%s: unexpected MB control mode %d\n",
+			  f->name, r->mode);
+		seq_puts(seq, "legacy native\n");
+		break;
+	}
+
+	return 0;
+}
+
+static struct rftype resctrl_ctrl_mb_files[] = {
+	{
+		.name		= "mode",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_ctrl_mb_mode_show,
+		/*
+		 * Directory-level file, not per-control: fflags is only a
+		 * presence flag here, not the BIT(ctrl->type) type filter used
+		 * by resctrl_add_ctrl_files().
+		 */
+		.fflags		= 1,
+	}
+};
+
+static int resctrl_ctrl_add_files(struct kernfs_node *kn)
+{
+	struct rftype *rfts, *rft;
+	int ret, len;
+
+	rfts = resctrl_ctrl_mb_files;
+	len = ARRAY_SIZE(resctrl_ctrl_mb_files);
+
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	for (rft = rfts; rft < rfts + len; rft++) {
+		if (rft->fflags) {
+			ret = rdtgroup_add_file(kn, rft);
+			if (ret)
+				goto error;
+		}
+	}
+
+	return 0;
+error:
+	pr_warn("Failed to add %s, err=%d\n", rft->name, ret);
+	while (--rft >= rfts) {
+		if (rft->fflags)
+			kernfs_remove_by_name(kn, rft->name);
+	}
+	return ret;
+}
+
 /*
  * No need to cleanup on exit - caller calls the recursive kernfs_remove()
  * on failure.
@@ -2704,11 +2772,12 @@ static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
 				      struct rdt_resource_final *f)
 {
 	struct kernfs_node *kn_subdir, *kn_ctrl;
+	struct rdt_resource *r = f->res;
 	struct resctrl_ctrl *ctrl;
 	char ctrl_full_name[20];
 	int ret;
 
-	kn_subdir = kernfs_create_dir(kn, "resource_schemata", kn->mode, NULL);
+	kn_subdir = kernfs_create_dir(kn, "resource_schemata", kn->mode, f);
 	if (IS_ERR(kn_subdir))
 		return PTR_ERR(kn_subdir);
 
@@ -2716,6 +2785,12 @@ static int resctrl_mkdir_schemata_dir(struct kernfs_node *kn,
 	if (ret)
 		return ret;
 
+	if (r->mode) {
+		ret = resctrl_ctrl_add_files(kn_subdir);
+		if (ret)
+			return ret;
+	}
+
 	for_each_resource_ctrl(ctrl, f->res) {
 		ret = snprintf(ctrl_full_name, sizeof(ctrl_full_name), "%s%s%s",
 			       f->name, resctrl_ctrl_is_default(ctrl) ? "" : "_",
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 72fb7256270e..4fc41e269d0b 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -257,6 +257,16 @@ enum resctrl_ctrl_unit {
 	RESCTRL_CTRL_UNIT_GBPS,
 };
 
+enum resctrl_ctrl_mode {
+	/*
+	 * Default (zero) value: the resource does not support control
+	 * emulation, so no resource_schemata/mode file is created for it.
+	 */
+	RESCTRL_CTRL_MODE_NONE = 0,
+	RESCTRL_CTRL_LEGACY,
+	RESCTRL_CTRL_NATIVE,
+};
+
 /**
  * struct resctrl_membw - Memory bandwidth allocation related data
  * @min_bw:		Minimum memory bandwidth percentage user can request
@@ -399,6 +409,12 @@ struct resctrl_ctrl {
  *			different memory bandwidths
  * @cache_io_alloc_capable:True if portion of the cache can be configured
  *			   for I/O traffic.
+ * @mode:		Control emulation mode for this resource.
+ *			RESCTRL_CTRL_MODE_NONE if the resource does not support
+ *			emulation. "legacy": keep the legacy MB control,
+ *			emulating it with a native control when it has no MBW
+ *			hardware of its own. "native": expose native controls
+ *			directly with no emulation.
  * @controls:		List of controls of an alloc_capable resource
  */
 struct rdt_resource {
@@ -413,6 +429,7 @@ struct rdt_resource {
 	bool				bw_delay_linear;
 	enum membw_throttle_mode	bw_throttle_mode;
 	bool				cache_io_alloc_capable;
+	enum resctrl_ctrl_mode		mode;
 	struct list_head		controls;
 };
 
-- 
2.43.0


