Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAEBC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HROQPvOp6SYmNj0ZgCIk8hqQgdhNipg5ha7bWd8Iuy4=; b=HL6iXCZa4+0Ye4pWdQIE/m/9UJ
	Hdgd524/wrbVw5GCiQrhykmWibahGXI+YZfZUmvQBWVmHKV9lUTFPvoKSx3PnmT8SXM7nnGG5y6RI
	7YiydCjQ2JoGx8Q8+bzBMK/X56ltZbjt+1s9PqljoUlZX4kKwl+MAM1K9vkXU1Njp9Zn/Qukh1Bfh
	2Jg1BhwmikGJ/AP01UxsP37bT0j/+NqlnRxB9A15zhrmuOxgeU46tnjdt0CUXEkePTHhBVvSdFdlV
	q5mSy02MMPHwg1tThX3NK2oUojXWNvmOeCi9/uJuFVRT0m59Hc83jCPTX+7SZACZkxOdHY4ZNuOnO
	va/LZhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTGK-00000000ZC8-2v3k;
	Thu, 16 Jul 2026 21:04:56 +0000
Received: from mail-westus3azon11012004.outbound.protection.outlook.com ([40.107.209.4] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFZ-00000000YEP-3h57
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wySDO4oki+Udf5JWPu5w3dwyQhQWP2tX3ceM2NrjHo4AFV3Rp76chjHn5phtp3oQW78mWlh/qyiCLmUlQuwVh3zJodHHZcaYJsPCa30GvW5zs8hc7hbrVDTeVfUH4FxALiYVV+/9GMB3xl3+vTJTAE4kF2/5JlkdURQNNURAeCXXZA+4+V3rNFJKimszobqbyEmFEzFt0wiPX+q7cKkOiKWxl7MEjJfJF7nPSHZ5zS9zd/XXClCvYHkaDWXYhn9G7CeEgHgj0zNkSeIcTXDa90iZReNx0bMWrkeKExx7KZYHsMQtmMOyI9C5TQl08fAcsu4A7kgVRXYzFu87FTIpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HROQPvOp6SYmNj0ZgCIk8hqQgdhNipg5ha7bWd8Iuy4=;
 b=mZk7Q9QoaXuVnOXkx2HOPX6OOdT0GxR1gHMwuQiTVDmOqXjaPUwdFZ7toRD+/HbKfNWPD/kgtTqtMsQLp6xpC2sSwOKIu/+uk0qKsRHKhpgLS+rdp3gWJkbdEEtneoyH9zlKD8J4SmzPrmuei8zkiNRtVgWLORuy6m7MREcmDlBMKKqEGgLBVgCI2usHmhj//yWJZr1DtJ0yqj25S8HUuKKtq+r9Tto360XJ8r45GE5wNDRwmg1in2O137xlWGg5pIFzuEKGUQXk7jlN1l4TleNsH9TB0abEAdXG7530H0gB6++E/lykfzNl221gRh9HWCV1cP73JsP/HUR56bhPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HROQPvOp6SYmNj0ZgCIk8hqQgdhNipg5ha7bWd8Iuy4=;
 b=MRuDFrSd5uf5ByTasilgDhJKUNv8f+4tyFuEr3k/ETO+RKD1s/ribl9q44RRq1BCuRoXv05nZsv/fVWu8nXM8E/9VdkryojPMs0LYfeZzH0jJomgRTdokq37V3Zia4NscbzKlgqyoL21I+XkP5K2JLEbnXhpbujnLGoVUUXrg535anTg/hSv44VXPtfm7RcEkqwOF3hzHMBKapM0T0sit9XvLdq4NR426rzgkeRO7aJ0RDCC2vV0bFeb7XETNOHGDkMDT+nHJWGiOsH+atkeOrcc0mLpaKh6FRCkakIGN3SYLe11wl2jKuEdNfXCjSrXAOMImWx4nz5BdoaN8lBIfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 21:03:59 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:58 +0000
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
Subject: [PATCH 23/23] selftests/resctrl: Add MB emulation test for ARM MPAM
Date: Thu, 16 Jul 2026 14:03:13 -0700
Message-ID: <20260716210329.2914625-23-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:a03:333::30) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1a7e57-3658-4338-95a1-08dee37dc15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|17002099007|22082099003|18002099003|56012099006|11063799006|5023799004|3023799007|10067099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info: kaZLraa3JECdgKjIAijgZb2vwqiq+wbbBNfgixCNpSl4/+w/oBl2Va0AzpZ3ZNbZm4qlnVE64xdegmvEPPZ80+SLBjTmBpra/8JtYfQiLbRY05U+KUKksleqdltWYm/isHJ84PMF2YGBmZ+5/M1O2MZsogly+0nILhdzJKRBnE61MvbR6FsJEFyoJU1D8F0Xizbef8CtSfLKtU/rccVh23QLBXAU83Kehu0Y1y7jOXHus3JHgI8Ha0n1BZ1BXMRgh0pzqBap5sBAQ/fIeGN5fVjI4df9Of06WAt+m3FMdJfPBlMzOnw+69PpLAu4hlekSpElP/WUY9PLlC/HN6d+lySGQyic37IN/cf25i637vfbMkrUlRTjSh2Ov978Lj1USvERfmRBTYHWs7vfHbxvmJ8rvTgojt4TTtRPLVnOaaREh20x+ViLKUlvHgGXkyTOb8WN+fn41rYcdAqaxTRhRk/ZB0SAz9sjvirHcQNXmorkRoPHNwu42SvQiOxXQRy9OBmpX91cWvgVM9G0CykPCz9zxDoJe+49BtBdm9MoWiZKiATFv3EkjLEOK8jgH+SrOLdW27hyab1gIUkNEB/3XrbYL59UCguV1yDU1m5wXqs6tWCUZsgKLrmMJNDwnI2zZaHN6ATt5PEP3M1sfw7SU0+bAPvuHkv+WALyQM/wv39PQZTBgfaI3LVA6OOXi3cd3FPb2OL2JgxnIsQ0U5v0eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(17002099007)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(3023799007)(10067099003)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZJwFMG2XwYJa6qO0+Bhh+4H8Ga0uqJHvbSJr9fvv7BysrulioDszXSr/kUg?=
 =?us-ascii?Q?MXwhVor0B5Qtn9z6GFYqReAvFOaLlgu75BUo1ENkkVbc9vGbdPSJxbv7WKgI?=
 =?us-ascii?Q?cd1h9NidVD3RaQ9cTR4JoPiK/KGsLxEiC6qfQdoQqt2Ky+lTuo3U9VIeRpFr?=
 =?us-ascii?Q?7u78rwmnIqrSzXWOr4bPBTdot3I9NKupZu7hR5M/oBgGBNYyggceTba5+T2M?=
 =?us-ascii?Q?wOzgJZZp7+JCFM94lCfUvcNq7xqx5oAjvgcblJnTcWrY3l3zQ7zlULFWQuIr?=
 =?us-ascii?Q?JgMLp1Cf2Kc9agHZ0kUMxR4tHy9+paaQ+EmyqOEfYPC6bKVAZ/2dZPFsiAl/?=
 =?us-ascii?Q?6cBaMdMF6jZEY1q5ctCCt3ygANr0eZUFxsGVp1JMeCiS9nBA1z7T7Bok07w2?=
 =?us-ascii?Q?SReZ/p6Mx3I8DPyFjp5hJdjZe8KVWs3HgxVo1KKGv/12IHtsSK3aIzN/t3wB?=
 =?us-ascii?Q?VPRBzmupUHvWWRqIDIP/H8TEF6FGhGlhyJcpX5TEn7p5X+PakLFYEAGmWyl5?=
 =?us-ascii?Q?Kdkx/d+qdXs0Ki2eEY1+rY1IKTKVMo3syFXF8wGIrBeJMK6YGWS5HMXpjl2F?=
 =?us-ascii?Q?bJIXN50XiTq0tcytG6AF5emNnwzHGEBKxyIf7brgnbOk6cnd5Lqy8SGa9oC0?=
 =?us-ascii?Q?W5lwksEGbcrG8mtjaPVZApAx+36/2LDccTg/ZnLzwpokrBVw6xZZ5LHxmVSU?=
 =?us-ascii?Q?SSy2isEZlY9BmEHZlwJt9VNq24BvSRebTG7mUqyxxLPkuFN5auomKfGb8Emo?=
 =?us-ascii?Q?LLDVEhS8Vs2Wt81E6qz/+hR3gRCnuqLzDEs0QXYVDYM6SgcdPDKKwxheGcZU?=
 =?us-ascii?Q?N8q8cTufuFf+Y/NMqSksW6ybF8N99cgevZ0dcjotTekJ6r9k5Kn6rhS8/L6w?=
 =?us-ascii?Q?wkRFDZ8aemhiP8bCwBS8dWvzsQqKowZWIfr9arOIzPU+igGNQLNZp4BorB+9?=
 =?us-ascii?Q?8fBSbi+wpwOoNnZ647SsziG94gJ94hs+/djcOCBAGNW3tc2WNy6Tg+NWjrgz?=
 =?us-ascii?Q?nRtCAzrR3qE0nCYTKjq0hIDLVfKqhJd7HwnSHtEyes3Ncz66Z75nsMqbtiiZ?=
 =?us-ascii?Q?/KTJGYn3C63FzMpJm5Ab+vaY7mclbSbIjKcpTygqCB0qejfaYOdD8iaovyoq?=
 =?us-ascii?Q?yhoDNgPq0lH31K7eFBVXr3yAOUDPvurtvJRUVeJLxkjO33pkqhHlfzr6VrpD?=
 =?us-ascii?Q?wX3coiadV7NnO81URAFpy0U5TqRolOGB0gpe13AmTS1tcKCbOrJ5Gl9PexOg?=
 =?us-ascii?Q?UOFdCxLoqZKrIJLK5vJ2jJz6MjhWXCD+sk2hAkX3elkHBxFg8+eqzOruWqIO?=
 =?us-ascii?Q?HD7JIMZcQMdM/93fUQ24dsk3Ndek2BEuulsG0VCFHjQ2Qlhq2mb67ZnLL4sV?=
 =?us-ascii?Q?S7p0zwvKcqeYoP9/HPytBfBfmNW/2GkaegKGHhhHtqaRmMki34EumAD7QAMn?=
 =?us-ascii?Q?h0I9IQLXoSqjKIyiwP0pxkufkutf+Qy+AiK9UIQ7j8HLfiPERPclb6ah30CO?=
 =?us-ascii?Q?7EHpz8npXaNjL1M1tPhef4kO+KnVsUPGEK7Ywta3VeBCoZjejyEQB88xWDZe?=
 =?us-ascii?Q?WTl8Na190htASpCsd7dBS+3PURgbDiOv6GCSSlA1ezr124loplhnN+l92jUd?=
 =?us-ascii?Q?lhU0N8GdZ1HUwcOT4q4VwgrLn8cL7w4mhJ77XHlet+nkcpUqQpJZo4ej5Nph?=
 =?us-ascii?Q?A8vCRQf0DXYKM1swvvqh+lAuTalpb+A0XUjY+D2KQAc7D7gGJcxtKmhucgCu?=
 =?us-ascii?Q?O4dgcSjhjA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1a7e57-3658-4338-95a1-08dee37dc15a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:58.8589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3exXW8vXhSL3tgRMjYFlI/0FFuZAbXstNmlCHMUYLQ9sfFjlrSCXmCG/FzK8JS2OrUAbuKKeHQ7NM1pKIQnJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140410_088020_7946E0F4 
X-CRM114-Status: GOOD (  19.21  )
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

Add a kselftest that exercises MB control emulation on ARM MPAM:
info/MB/resource_schemata hierarchy (nested MB_NODE under MB in legacy
mode, flat sibling layout in native mode), legacy/native mode switching,
and schemata visibility/mirroring when the default MB control is disabled.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 tools/testing/selftests/resctrl/config        |   1 +
 .../selftests/resctrl/mb_emulation_test.c     | 460 ++++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 4 files changed, 463 insertions(+)
 create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c

diff --git a/tools/testing/selftests/resctrl/config b/tools/testing/selftests/resctrl/config
index 8d9f2deb56ed..85e4f3fc647f 100644
--- a/tools/testing/selftests/resctrl/config
+++ b/tools/testing/selftests/resctrl/config
@@ -1,2 +1,3 @@
 CONFIG_X86_CPU_RESCTRL=y
 CONFIG_PROC_CPU_RESCTRL=y
+CONFIG_ARM64_MPAM_RESCTRL_FS=y
diff --git a/tools/testing/selftests/resctrl/mb_emulation_test.c b/tools/testing/selftests/resctrl/mb_emulation_test.c
new file mode 100644
index 000000000000..0fa88b43f89f
--- /dev/null
+++ b/tools/testing/selftests/resctrl/mb_emulation_test.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MB (memory bandwidth) control emulation test (ARM MPAM)
+ *
+ * Exercises info/MB/resource_schemata/ layout, legacy/native mode switching,
+ * and schemata visibility for emulated MB/MB_NODE controls.
+ */
+#include <fcntl.h>
+#include <limits.h>
+
+#include "resctrl.h"
+
+#define MB_INFO			INFO_PATH "/MB"
+#define MB_SCHEMATA_DIR		MB_INFO "/resource_schemata"
+#define MB_MODE_PATH		MB_SCHEMATA_DIR "/mode"
+#define MB_CTRL_PATH		MB_SCHEMATA_DIR "/MB"
+#define MB_NODE_CTRL_PATH	MB_SCHEMATA_DIR "/MB_NODE"
+#define MB_NODE_NESTED_PATH	MB_CTRL_PATH "/MB_NODE"
+#define ROOT_SCHEMATA_PATH	RESCTRL_PATH "/schemata"
+
+struct mb_ctrl_paths {
+	char mb_status[PATH_MAX];
+	char mb_node_status[PATH_MAX];
+	bool mb_node_nested;
+};
+
+static int read_file(const char *path, char *buf, size_t buflen)
+{
+	int fd, n;
+	ssize_t ret;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = read(fd, buf, buflen - 1);
+	close(fd);
+	if (ret < 0)
+		return -errno;
+
+	n = (int)ret;
+	while (n > 0 && (buf[n - 1] == '\n' || buf[n - 1] == ' '))
+		n--;
+	buf[n] = '\0';
+
+	return 0;
+}
+
+static bool path_is_dir(const char *path)
+{
+	struct stat st;
+
+	if (stat(path, &st))
+		return false;
+
+	return S_ISDIR(st.st_mode);
+}
+
+static int mb_resolve_ctrl_paths(struct mb_ctrl_paths *paths)
+{
+	if (path_is_dir(MB_NODE_NESTED_PATH)) {
+		snprintf(paths->mb_status, sizeof(paths->mb_status),
+			 "%s/status", MB_CTRL_PATH);
+		snprintf(paths->mb_node_status, sizeof(paths->mb_node_status),
+			 "%s/status", MB_NODE_NESTED_PATH);
+		paths->mb_node_nested = true;
+		return 0;
+	}
+
+	if (path_is_dir(MB_NODE_CTRL_PATH)) {
+		snprintf(paths->mb_status, sizeof(paths->mb_status),
+			 "%s/status", MB_CTRL_PATH);
+		snprintf(paths->mb_node_status, sizeof(paths->mb_node_status),
+			 "%s/status", MB_NODE_CTRL_PATH);
+		paths->mb_node_nested = false;
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+static int mb_read_status(const char *path, char *status, size_t len)
+{
+	char buf[32];
+	int ret;
+
+	ret = read_file(path, buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	if (!strcmp(buf, "enabled") || !strcmp(buf, "disabled")) {
+		strncpy(status, buf, len);
+		status[len - 1] = '\0';
+		return 0;
+	}
+
+	ksft_print_msg("unexpected status in %s: '%s'\n", path, buf);
+	return -EINVAL;
+}
+
+static int mb_read_mode(char *buf, size_t len)
+{
+	return read_file(MB_MODE_PATH, buf, len);
+}
+
+static int mb_write_mode(const char *mode)
+{
+	char msg[32];
+	int fd, ret, len;
+
+	len = snprintf(msg, sizeof(msg), "%s\n", mode);
+	if (len < 0 || len >= (int)sizeof(msg))
+		return -EINVAL;
+
+	fd = open(MB_MODE_PATH, O_WRONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = write(fd, msg, len) == len ? 0 : -errno;
+	close(fd);
+
+	return ret;
+}
+
+static bool mb_mode_active_is(const char *mode_text, const char *mode)
+{
+	char pattern[32];
+
+	snprintf(pattern, sizeof(pattern), "[%s]", mode);
+	return strstr(mode_text, pattern) != NULL;
+}
+
+static int mb_read_root_schemata(char *buf, size_t len)
+{
+	return read_file(ROOT_SCHEMATA_PATH, buf, len);
+}
+
+/*
+ * resctrl right-aligns schemata names with leading whitespace, so a control
+ * line looks like "             MB:0=100...". Treat prefix as matching when it
+ * appears at the start of a line, ignoring any leading spaces or tabs.
+ */
+static const char *schemata_find_line(const char *schemata, const char *prefix)
+{
+	const char *p;
+
+	if (!schemata || !prefix)
+		return NULL;
+
+	for (p = strstr(schemata, prefix); p; p = strstr(p + 1, prefix)) {
+		const char *q = p;
+
+		while (q > schemata && (q[-1] == ' ' || q[-1] == '\t'))
+			q--;
+
+		if (q == schemata || q[-1] == '\n')
+			return p;
+	}
+
+	return NULL;
+}
+
+static bool schemata_has_prefix(const char *schemata, const char *prefix)
+{
+	return schemata_find_line(schemata, prefix) != NULL;
+}
+
+/*
+ * Copy the value portion (everything after the first '=') of the schemata line
+ * that starts with @prefix into @out, stopping at the end of that line.
+ */
+static int schemata_line_value(const char *schemata, const char *prefix,
+			       char *out, size_t len)
+{
+	const char *line, *eq, *end;
+	size_t n;
+
+	line = schemata_find_line(schemata, prefix);
+	if (!line)
+		return -ENOENT;
+
+	eq = strchr(line, '=');
+	if (!eq)
+		return -EINVAL;
+
+	eq++;
+	end = strchr(eq, '\n');
+	n = end ? (size_t)(end - eq) : strlen(eq);
+	if (n >= len)
+		return -ENOSPC;
+
+	memcpy(out, eq, n);
+	out[n] = '\0';
+
+	return 0;
+}
+
+static int mb_expect_hierarchy(bool nested, const char *why)
+{
+	bool have_nested = path_is_dir(MB_NODE_NESTED_PATH);
+	bool have_sibling = path_is_dir(MB_NODE_CTRL_PATH);
+
+	if (nested) {
+		if (!have_nested || have_sibling) {
+			ksft_print_msg("%s: expected MB_NODE nested, nested=%d sibling=%d\n",
+					 why, have_nested, have_sibling);
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	if (!have_sibling || have_nested) {
+		ksft_print_msg("%s: expected MB_NODE sibling of MB, nested=%d sibling=%d\n",
+				 why, have_nested, have_sibling);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mb_check_layout(const char *mode, const struct mb_ctrl_paths *paths)
+{
+	char mb_status[16];
+	bool native = !strcmp(mode, "native");
+	bool expect_nested;
+	int ret;
+
+	if (mb_read_status(paths->mb_status, mb_status, sizeof(mb_status)))
+		return -errno;
+
+	expect_nested = !native && !strcmp(mb_status, "disabled");
+
+	ret = mb_expect_hierarchy(expect_nested, mode);
+	if (ret)
+		return ret;
+
+	ksft_print_msg("switched to %s: hierarchy=%s\n", mode,
+		       expect_nested ? "nested (MB_NODE under MB)" :
+				       "flat (MB_NODE sibling of MB)");
+	return 0;
+}
+
+static int mb_test_mode_read(void)
+{
+	char mode[64];
+
+	if (mb_read_mode(mode, sizeof(mode)))
+		return -errno;
+
+	if (!mb_mode_active_is(mode, "legacy") && !mb_mode_active_is(mode, "native")) {
+		ksft_print_msg("mode file has no active mode: '%s'\n", mode);
+		return -EINVAL;
+	}
+
+	ksft_print_msg("mode file: %s\n", mode);
+	return 0;
+}
+
+static int mb_test_schemata_visibility(bool expect_mb_line, const char *mode)
+{
+	char schemata[4096];
+	bool has_mb, has_mb_node;
+
+	if (mb_read_root_schemata(schemata, sizeof(schemata)))
+		return -errno;
+
+	has_mb = schemata_has_prefix(schemata, "MB:");
+	has_mb_node = schemata_has_prefix(schemata, "MB_NODE:");
+
+	if (expect_mb_line && !has_mb) {
+		ksft_print_msg("%s: expected MB: line in schemata\n", mode);
+		return -EINVAL;
+	}
+	if (!expect_mb_line && has_mb) {
+		ksft_print_msg("%s: MB: line should be hidden in schemata\n", mode);
+		return -EINVAL;
+	}
+	if (!has_mb_node) {
+		ksft_print_msg("%s: expected MB_NODE: line in schemata\n", mode);
+		return -EINVAL;
+	}
+
+	ksft_print_msg("switched to %s: schemata MB:%d MB_NODE:%d\n",
+		       mode, has_mb, has_mb_node);
+	return 0;
+}
+
+static int mb_test_schemata_mirror_legacy(void)
+{
+	char schemata[4096];
+	char mb_val[1024];
+	char node_val[1024];
+
+	if (mb_read_root_schemata(schemata, sizeof(schemata)))
+		return -errno;
+
+	if (schemata_line_value(schemata, "MB:", mb_val, sizeof(mb_val)) ||
+	    schemata_line_value(schemata, "MB_NODE:", node_val, sizeof(node_val))) {
+		ksft_print_msg("legacy mirror: missing MB: or MB_NODE: line\n");
+		return -EINVAL;
+	}
+
+	if (strcmp(mb_val, node_val)) {
+		ksft_print_msg("legacy mirror: MB:%s != MB_NODE:%s\n", mb_val, node_val);
+		return -EINVAL;
+	}
+
+	ksft_print_msg("switched to legacy: MB mirrors MB_NODE as '%s'\n", mb_val);
+	return 0;
+}
+
+static int mb_restore_mode(const char *orig_mode)
+{
+	if (mb_mode_active_is(orig_mode, "legacy"))
+		return mb_write_mode("legacy");
+	if (mb_mode_active_is(orig_mode, "native"))
+		return mb_write_mode("native");
+
+	return 0;
+}
+
+/* Confirm the mode file reports @mode as the active ([bracketed]) selection. */
+static int mb_verify_active_mode(const char *mode)
+{
+	char buf[64];
+
+	if (mb_read_mode(buf, sizeof(buf)))
+		return -errno;
+
+	if (!mb_mode_active_is(buf, mode)) {
+		ksft_print_msg("mode switch to %s failed, mode file: '%s'\n",
+			       mode, buf);
+		return -EINVAL;
+	}
+
+	ksft_print_msg("switched to %s: mode file='%s'\n", mode, buf);
+	return 0;
+}
+
+/*
+ * Switch to @mode and verify the mode file, the info/ resource_schemata
+ * hierarchy, and root schemata visibility all reflect the new mode.
+ */
+static int mb_switch_and_check(const char *mode, const struct mb_ctrl_paths *paths,
+			       bool mb_disabled)
+{
+	bool legacy = !strcmp(mode, "legacy");
+	int ret;
+
+	ksft_print_msg("--- switching to %s mode ---\n", mode);
+
+	ret = mb_write_mode(mode);
+	if (ret) {
+		ksft_print_msg("failed to write %s mode\n", mode);
+		return ret;
+	}
+
+	ret = mb_verify_active_mode(mode);
+	if (ret)
+		return ret;
+
+	ret = mb_check_layout(mode, paths);
+	if (ret)
+		return ret;
+
+	if (!mb_disabled) {
+		ksft_print_msg("switched to %s: schemata checks skipped (MB enabled)\n",
+			       mode);
+		return 0;
+	}
+
+	ret = mb_test_schemata_visibility(legacy, mode);
+	if (ret)
+		return ret;
+
+	if (legacy)
+		ret = mb_test_schemata_mirror_legacy();
+
+	return ret;
+}
+
+static int mb_emulation_run_test(const struct resctrl_test *test,
+				 const struct user_params *uparams)
+{
+	struct mb_ctrl_paths paths;
+	char orig_mode[64];
+	char mb_status[16];
+	bool mb_disabled;
+	int ret;
+
+	(void)test;
+	(void)uparams;
+
+	if (mb_resolve_ctrl_paths(&paths)) {
+		ksft_print_msg("MB_NODE control not found under resource_schemata\n");
+		return -ENOENT;
+	}
+
+	if (mb_read_mode(orig_mode, sizeof(orig_mode))) {
+		ksft_print_msg("failed to read %s\n", MB_MODE_PATH);
+		return -errno;
+	}
+
+	if (mb_read_status(paths.mb_status, mb_status, sizeof(mb_status))) {
+		ksft_print_msg("failed to read %s\n", paths.mb_status);
+		return -errno;
+	}
+
+	ksft_print_msg("MB status=%s MB_NODE nested=%d (initial)\n",
+		       mb_status, paths.mb_node_nested);
+
+	ret = mb_test_mode_read();
+	if (ret)
+		goto out_restore;
+
+	mb_disabled = !strcmp(mb_status, "disabled");
+
+	/* Cycle legacy -> native -> legacy, checking each transition. */
+	ret = mb_switch_and_check("legacy", &paths, mb_disabled);
+	if (ret)
+		goto out_restore;
+
+	ret = mb_switch_and_check("native", &paths, mb_disabled);
+	if (ret)
+		goto out_restore;
+
+	ret = mb_switch_and_check("legacy", &paths, mb_disabled);
+	if (ret)
+		goto out_restore;
+
+out_restore:
+	if (mb_restore_mode(orig_mode))
+		ksft_print_msg("warning: failed to restore original mode\n");
+
+	return ret;
+}
+
+static bool mb_emulation_feature_check(const struct resctrl_test *test)
+{
+	(void)test;
+
+	if (!resctrl_resource_exists("MB"))
+		return false;
+
+	if (!path_is_dir(MB_SCHEMATA_DIR))
+		return false;
+
+	if (!resource_info_file_exists("MB", "resource_schemata/mode"))
+		return false;
+
+	return path_is_dir(MB_NODE_CTRL_PATH) || path_is_dir(MB_NODE_NESTED_PATH);
+}
+
+struct resctrl_test mb_emulation_test = {
+	.name = "mb_emulation",
+	.group = "mb",
+	.resource = "MB",
+	.feature_check = mb_emulation_feature_check,
+	.run_test = mb_emulation_run_test,
+};
diff --git a/tools/testing/selftests/resctrl/resctrl.h b/tools/testing/selftests/resctrl/resctrl.h
index 175101022bf3..ad1c17c0b0bf 100644
--- a/tools/testing/selftests/resctrl/resctrl.h
+++ b/tools/testing/selftests/resctrl/resctrl.h
@@ -242,5 +242,6 @@ extern struct resctrl_test cmt_test;
 extern struct resctrl_test l3_cat_test;
 extern struct resctrl_test l3_noncont_cat_test;
 extern struct resctrl_test l2_noncont_cat_test;
+extern struct resctrl_test mb_emulation_test;
 
 #endif /* RESCTRL_H */
diff --git a/tools/testing/selftests/resctrl/resctrl_tests.c b/tools/testing/selftests/resctrl/resctrl_tests.c
index dbcd5eea9fbc..593f0ca5251b 100644
--- a/tools/testing/selftests/resctrl/resctrl_tests.c
+++ b/tools/testing/selftests/resctrl/resctrl_tests.c
@@ -17,6 +17,7 @@ volatile int *value_sink = &sink_target;
 static struct resctrl_test *resctrl_tests[] = {
 	&mbm_test,
 	&mba_test,
+	&mb_emulation_test,
 	&cmt_test,
 	&l3_cat_test,
 	&l3_noncont_cat_test,
-- 
2.43.0


