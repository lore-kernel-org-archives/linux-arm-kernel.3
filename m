Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFF3606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 16:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E+CzUsaH;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Cm7zXtzG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOXxMszyvR7wRTIpxnQAmzdmKAfiJyQxhZPxeu85GqY=; b=E+CzUsaHlQ/wb8/Xjw012d9D7V
	RIZGIb2u9h+KTIinT5P/4oLlR39xVkIHtyC1lSnFI9lnj8/6xcsvo74owq2FAtkUJKuuKpUPKHDde
	ZQqAOz2hCTNeUZQbaXoDh6ebQvMLJKQ9eqKvrNrPPxhsw/0jLrRXsIQq2cg0YZ2JUrwo4AMOWhvQM
	Jey3BPVurbPvApPMwLd9VxL4ogV7mVBLTZ/fN9QUSN5mRxJ2ifNBVHA6wvAUNcyOVXfCy6rjYjhpw
	Rgy+akfZIgjeKwbeUgfOOeuFp1YxWE+FzKPw8oHj4YEwtT1pIwssY5PUIKMWgSEgB8nS/347qtt/k
	/z57BTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqTW-000000080YJ-0xXO;
	Mon, 19 Oct 2026 16:44:38 +0000
Received: from mail-southcentralusazon11013070.outbound.protection.outlook.com ([40.93.196.70] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqTT-000000080XL-0cFj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 16:44:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+A4OYksVTu2Z6ENyScwR+rPAFYmo/Bdd1ZzT2KSE73Vw0C5PwCkatSFeeyAHSHysxiJO2VOpc9YD3t3d4ZZvefmI/+qXDdXruNHuJJd0aQLH2xi8bed6kJZlZ/1+O2a0hD5D2tvgMO46MRANn78aM079KM0F5dw60mNWZW9WM2Yj+DjP/ruks7YqaWd7JppFoCMToUvtfnm8Nl/EHqalVx2ikAwDf4wmDJFct/JPyLopzuvbA7Q8pWRhRBu8zKIkeh7DQtuJmBQP5A43Ya8NaTBfR0ufkC+6VYH1icepz+hSQAK8sY0tEXf+qAOOBYE6cD3gWUDRxYT3noh3j++Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOXxMszyvR7wRTIpxnQAmzdmKAfiJyQxhZPxeu85GqY=;
 b=rogIPLmW1FnCaLkBUgGIzRzVUujlUFqoA/b3vkQzqaQb9hWe5dpUaiGLokD/yGineIsM/pODOOfKvXaiQ/VWaHUPiJ6jGMlZGpLFXn4uMpLROvEsk4ZZ/MykIe+cBVkL7wuaRPlQCu4eQSNFs/ZHXgUsj1ayfQ3VlEMM2frPpoemyt49nBX5075DUFcJ6dcJxjRVYXlb2bQCFbHFqnCLshekwDGI2hI6mdn7cFMJqvZyetLbK2Zy+YfjepE8yoFzsJT4vcpyIFyAsrpQyup5G/T8tb11GvbfZdcdsGVPa7pR7P3SxJdFyWiyegzajQ/gXumIBnYbUqaFzZW+nXuSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOXxMszyvR7wRTIpxnQAmzdmKAfiJyQxhZPxeu85GqY=;
 b=Cm7zXtzGVRUnNs6TyP2naILURMhjf5jMk/iTzrM0U7rEng63prBZCRuCYFZ8pekq/CnySbeVJcoHxr0KkRfNNKOVVQOwMla8HxBd0xQV9XcO0r6Yjivfmeyegq3Qp42K1f+ndV3rKwak9P7J53R65Qjnr9/+bckb61R8MZb56C4vzU5TxhIP3Zg0fLb4So3m72pDee3gNl5ZhNidCP1OeiMvdL6tB1C6hzeThFh61Joeu7Im8XHrkgH86lcCFWP8c7hWq2EQc2WFll/1yBIVVqJzoXP55RGB/Nph5tdT4WwqAkgTcD/OKMJVDXzKCw5fPro8K+nGbF3WlWGGGQL3NA==
Received: from PH7PR10CA0006.namprd10.prod.outlook.com (2603:10b6:510:23d::25)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 16:44:26 +0000
Received: from PH3PEPF00059616.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::8e) by PH7PR10CA0006.outlook.office365.com
 (2603:10b6:510:23d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.27 via Frontend Transport; Mon,
 19 Oct 2026 16:44:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH3PEPF00059616.mail.protection.outlook.com (10.167.243.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 16:44:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 19 Oct
 2026 09:43:59 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 19 Oct
 2026 09:43:58 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Mon, 19 Oct 2026 09:43:57 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@kernel.org>, <namhyung@kernel.org>, <irogers@google.com>
CC: <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<mochs@nvidia.com>, <rajjoshi@nvidia.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <john.garry@linux.dev>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <adrian.hunter@intel.com>, <ctshao@google.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 1/6] perf jevents: Process model files before sys subdirectories
Date: Mon, 19 Oct 2026 16:42:36 +0000
Message-ID: <20261019164241.403644-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019164241.403644-1-bwicaksono@nvidia.com>
References: <20261019164241.403644-1-bwicaksono@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059616:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e16d21-57c9-47c9-4761-08df2e003cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|7416014|6133799003|20046099003|18002099003|22082099003|5023799004|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: MNva5lTElT06dyyoyXrpW6lmRMVncovoSjrC7mgkKEZN5QTAM57k4LoeZd2RYkVRbqt4DP7YuEa81hvSKDSF4rFmYLWN7NIyj33/SP175jq7w6duTY6tRztewhg5p6okPjKYA0VQTsHiEXoe5MPXBNG6QP9JxHkvGtHIe1Lvttj3HEZuZPEOOQfB6A7vPKSLJ6IPEI+3YrhD2JX5O68RvvRHIpyJfFXJDj3KEd/gBdS6UGk0ZtvRgkNM4H6tk/UUo8Vcc4t587GpJ/a/eww3mpW6/a3jLlF9ryQgs4n5wIDLiqIOidG8SgAx95opgT3f1CwRe1tfJtK09miaWAoSM+M4FY6wsHSLK6U1WCMNBZfCyQMSFwRR7ndDtsoFLWWrctI1ZZ+JCaQZlDyxf+z13qotzytNP01n/JmBU7i/7Dp1rLdtE+oWvZio49lUtmp9uyqAcQt5qAZf2/FmUaa/3aWeB0wuWWKOUYNnzpux6YUmERfud38uyfMs4Z1GWHZ8nnqrFgTd6kd0EPYOydCVBv0FfvS8oXiU8sHA70YszX9PsSMNr/EDemFPOI0VMDz2T/0FFJB50sUOQIHQRPoq6l49lIAB45jHi2g9uLo7/WI6EwdnLyl6KefSbzfCIl6Uaylz/uPxdliK52WnczYGAeyYQgJl83vwbNzECiw/vWY//TTSatx09lIRd0lawRz+VFMWiO/rgm2Dac4SjGoTGg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(6133799003)(20046099003)(18002099003)(22082099003)(5023799004)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Qh8X9O4uoTwULtEZe6MgdhCwPSmRYaTg2XDu5sF0To9ImSmB3VEIVX5DSQxE6Tk9SYvltz9UhjlbtkmGmurqSRr6DQZuZXoy+BuZIdD/4GNle0iEjekifPCgwEO0FKHQViVamZ97zzxkVfXD2tw/HyK/bNZ8C6qGY75aY+DnWbnkK/hXEYu6hwA7X5px35yCqnvSBsveo3dRRECIA1p9mF5P83v5T62r39i0fYf9wk/Qg6ZVr96AIn9gqI7Fu9T1/ksb7hZrF74lkjyDi3bcgF8FgIVRHwgxrqhzQpWzreRjqDqJ0jp9ECvbqTZlW7rtQaiYp2n+/4yxIaxNplY3Fwz9M7ndAIC1veVc/ZOzjqriBEemc8ldQgGoKAq4Q6QijgrCWY1iDoKL032+LLdw8BXIvaspUs2teMCxu1SfDkkNjJs3gNy4YrS10TfMwdNI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:44:26.3880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e16d21-57c9-47c9-4761-08df2e003cd4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF00059616.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_094435_343860_F5D03447 
X-CRM114-Status: GOOD (  12.98  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jevents walks each directory in name order, mixing files and
subdirectories. When it reaches a sys/ directory inside a model
directory, process_one_file() flushes the model's pending tables and
switches the pending table name to the sys table. After the walk
returns from sys/, nothing switches it back, so model JSON files whose
names sort after "sys" (for example tlb.json) are added to the sys
table. Sys tables are only matched by Compat against uncore PMU
identifiers, so these core events are lost: perf list doesn't show
them and perf stat rejects them.

Visit the files of a directory before its subdirectories, so that all
of a model's JSON files are added to the model's table before a sys/
subdirectory is processed. The generated pmu-events.c is unchanged for
the existing event directories.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 tools/perf/pmu-events/jevents.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index cc143f7e7cdf..ba974b2784b0 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1463,7 +1463,9 @@ def main() -> None:
           action: Callable[[Sequence[str], os.DirEntry], None]) -> None:
     """Replicate the directory/file walking behavior of C's file tree walk."""
     assert _args is not None
-    for item in sorted(os.scandir(path), key=lambda e: e.name):
+    # Visit a directory's files before its subdirectories, because
+    # entering a subdirectory switches the table that files are added to.
+    for item in sorted(os.scandir(path), key=lambda e: (e.is_dir(), e.name)):
       if _args.model != 'all' and item.is_dir():
         # Check if the model matches one in _args.model.
         if len(parents) == _args.model.split(',')[0].count('/'):
-- 
2.43.0


