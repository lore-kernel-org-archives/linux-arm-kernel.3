Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDFF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y4305fxe;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lN040k5w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oMLcEwVO2df24OivEvid9p5dhun6r6sEcWy/p87BTaQ=; b=y4305fxe/VuySUMgg/NfDtWrfW
	aDrMK14gDmzk0IbthShLKYMnH/dXVwYGSb7ybGkF+nuQwQ9GxTEEKI57Fqzq/ciQ8o6HdznfO0wqW
	Rxu2J8wrztXkAVpuEZgtmW9IPXejhVestRFkOjm8SVYBuxa2k6Fi2FfFvUV/9nnozDjTMCIAB7dT7
	VyRyVym3Lrmvo6nyeKFAQRy2UIC1gCHwLtRUdcnnGgINv/0rHnZ0cfEmwGnoBKe09GM1/otJVcIkQ
	YNdPrAk1rZSFD+/NshVLBljmQ7t9/G+sq/pELJ6i3blX5xQYvPY/ShoN4T8Ewl5fBM9QDSKa5WnSL
	DsXwBW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMql3-0000000CJBV-1tmD;
	Fri, 30 Oct 2026 17:51:17 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqky-0000000CJ8K-0ftW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:51:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYbD0O88BupTImE2dbB3ChxpCxhmsrYB+86fx2RkxQPFcCX97hZeq7Fd2RicaVdC8RJ/AnFhUFloqK6MriGgMDLaKH7gejUNiOCep03eGS3gyCjuyQkDD0CGH0qYdRy3LKHb2WRqx2tetTQ5AzwoEy0nGq+A/T5/wBtk/cRPn/0QEv+GgmUkWiRxxDz9QAMb2G1eTrJEo2QBFiBOd1ikyWh61CXGWEX2t+FCuieUdwSmT2zSDXOVyDcaRcFtTWyBJwCCpY3EDpF1Cg/yaXd9ono6V9L9UgRa1+r5dVwfQpxXAQwWmOby7/6F3sp8clvOZH2GVpA3IwSAKEbEm/6SZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMLcEwVO2df24OivEvid9p5dhun6r6sEcWy/p87BTaQ=;
 b=LQmhaa/BcdTSSeZ6kjWDqtA6MuQEylb9UXIjGxEJpV8QjUEP+QDW1cGHh1dfhFQIbcTKNFRmh0pWeFw9oxqmx1s9VqP7ng4WVdJ9wnLgFKwXNn8iglUCRHfAxM1lwuBI9ClapgUEHw6EJlrhvN5fSqccrMC1dNs2Hk89N3f4HwVxE8Q8qs3fqEqyGx9bP4/d/SXhrtG/g/dlK1I1Fe+dWJsftSO0qzaFMJ8o/V8+kaBTin6qKwsMddfqz6L0ryNmuBQeGkbwK0oB0AC+rpnaS3IC/Wr4E0YGOnVq3qngtXtIOMujXcA8fe83twg07Zs+s3osqC89VSqXQ9tvvcmM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMLcEwVO2df24OivEvid9p5dhun6r6sEcWy/p87BTaQ=;
 b=lN040k5wuKkGzvKfe0oEC7EVV7kDR0Cf9UAFs8hhk4f8RJkSsgMIdgWqTDKLd5ua/Tw0eHJMJgLU6c95LS07W0lxXJopv4ZqLb2xb2kKW5V6e5Omzh1u54CB44Mzbe0a/Arj0njsM7S8RCYPC+iDJd1IlwY4VS+coiFTfVdpxpDelOcL0O1O34q1OXUtFO+pa4a4WlNFv16OAHdD+w3ntVwaCl+BX7cSqvczKMUw7+l6JoEp8mEBajzeb4Qty/JOKpC7ScEw3gSEVfVZwAqTxxCRzXj3KdDZKnzkW3p3nZAvhXM9vMSQqJU9BUUMQm7TJB4E88ZlTNJ4JLKIKxbh2w==
Received: from CH0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:610:cd::31)
 by DM4PR12MB8558.namprd12.prod.outlook.com (2603:10b6:8:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 17:51:03 +0000
Received: from IA0PEPF00000044.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::89) by CH0PR03CA0116.outlook.office365.com
 (2603:10b6:610:cd::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 17:51:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 IA0PEPF00000044.mail.protection.outlook.com (10.167.249.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Fri, 30 Oct 2026 17:51:03 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 10:50:40 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:50:40 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.56
 via Frontend Transport; Fri, 30 Oct 2026 10:50:40 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <acme@kernel.org>, <namhyung@kernel.org>, <irogers@google.com>,
	<ctshao@google.com>
CC: <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <skelley@nvidia.com>,
	<mochs@nvidia.com>, <rajjoshi@nvidia.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <john.garry@linux.dev>, <will@kernel.org>,
	<james.clark@linaro.org>, <mike.leach@arm.com>, <leo.yan@linux.dev>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <adrian.hunter@intel.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 6/9] perf stat: Check merged PMU instance's cpumasks when skipping zero counts
Date: Fri, 30 Oct 2026 17:48:13 +0000
Message-ID: <20261030174816.1544471-7-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030174816.1544471-1-bwicaksono@nvidia.com>
References: <20261030174816.1544471-1-bwicaksono@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000044:EE_|DM4PR12MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: cc33bacf-c560-44c3-bdaa-08df36ae5dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|82310400026|36860700016|5023799004|11063799006|56012099006|261009223027099003|261021121427099003|261022075727099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: qEBd+3f2bljIjDwKijKWvPnsAwsrcg/gGmJdzVVl0SAsbgxW7Uqj+rvMS5pN6R8svTwkNZAuEA9v8ae67x9FxHAYaFp2GhUcJDhx3G7it/4+CWSuI4zV9FIFEqcMG66Db0/gEE1FPEtO5l3ZH5pN/mxrwwOy/X8quT5P/C4kdFSOlYL5znrRQTinyFg1AcwVWzUbuCzcROkFZnz91bj1c3aMehXv2qbgenghbKQfQabDOgAE1n5u8ZEXhHr+qM57M6OEaW5meWfkgouLGKvj81bvrG2p0rmQ2EJDU8oq0xNY2NLae4imsvlRciWFDDxcaCTXP8MexTFDYnpcghRr7HnJc8Tuh/IVIZfFjw8zsRtRTHWJKVMR/Id4MEM+E4qKaKzCb/Sv+/qkFUAf0l7VKAKnPWAtLN6nOSW0z+b0JxLj69cT5H3Bb11z9UTN/AbiWnBNX3QCW8RBls1xOckJIurjjweC4DtYwrGfdUUdqEo3aIBvX0SXB3RUd9j2wW7EbTklZwuPv7uXgr/VlxDfQ6KqzxDgKWBn0WTtXw/DNujW8SRuAGuH5Nu8MNr8D9mUMFNT8L4JJhnSxo7W5KDFv+TN8W/Ohg7bkTXLRyIVu3CHtuYXG/7FdBCU2CnRt3NMqon9PYwAc6aq3bnjv1OKmjKBEebg/z34+rUnUv5bNOgLsPbsiAAKZU3AzrR8Cmj3EoZoMa6MNxSy8ZYXpsvcHw==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(5023799004)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6WfTftDd5gv03LAfbSGRe4DukybgHXU2ZVWv+T6it/38HkLajpkLXCBvQmmihaOqv0Aw6GUm7eepiR11kNPHuWItzh4xMKWeD5tVsRDgFOodnfu6RyWdIjiTmUlc3fH1oqXaiE6/JdI55Vwurpc9KRCNcBxNeBfxpkq29h9u8xv+vddRT/6hI3vd6jrR8dLvorq9Xgbkh18+R4ZAGx6WeJmYgtUkFhxzRR0tRUQMDmXovN1OzAG73Nh7tphoMBpCB5KCzUiQhF63B4FYOOAajevtiDl1wlC5L2uC6aGV/oTxSLu+MXTdNJAWJMhbW2s1tssPlaVwXwhSiLmVZevoI6nJT4F1frMbaVIR+e7MolDmE9lCmaW8D/7dgFKVhGKxTx1AdGkIxV2DHsNb/jmnBtTmveTVNCxkscs0H46nK8nCru58zasjAnvh+U6rmmuO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:51:03.4640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc33bacf-c560-44c3-bdaa-08df36ae5dd8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000044.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_105112_227689_070EED58 
X-CRM114-Status: GOOD (  13.63  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit dd15480a3d67 ("perf stat: Hide invalid uncore event output for
aggr mode") hides a 0 count of an uncore event in an aggregation id
that the event is not counted in, using the event's cpumask. When an
uncore event has more than one PMU instance, the evsels of the other
instances are merged into the evsel of the first one, and only the
cpumask of the first instance is checked. A 0 count in an aggregation
id covered only by another instance is then hidden, while a non-zero
count in the same id is printed.

For example, on a dual-socket NVIDIA Tegra410 with one UCF PMU per
socket (nvidia_ucf_pmu_0 on CPU 0, nvidia_ucf_pmu_1 on CPU 88):

Before:
  $ perf stat -a --per-socket -e UCF_SLC_ACCESS_ATOMIC,UCF_SLC_ACCESS_RD -- sleep 1
  S268435456    1                  0      UCF_SLC_ACCESS_ATOMIC
  S268435456    1          3,407,373      UCF_SLC_ACCESS_RD
  S285212672    1          2,086,640      UCF_SLC_ACCESS_RD

After:
  $ perf stat -a --per-socket -e UCF_SLC_ACCESS_ATOMIC,UCF_SLC_ACCESS_RD -- sleep 1
  S268435456    1                  0      UCF_SLC_ACCESS_ATOMIC
  S268435456    1          2,669,279      UCF_SLC_ACCESS_RD
  S285212672    1                  0      UCF_SLC_ACCESS_ATOMIC
  S285212672    1          1,006,579      UCF_SLC_ACCESS_RD

Also check the cpumasks of the evsels merged into the counter. Zero
counts are still hidden in aggregation ids that none of the instances
count in, such as the other cores in --per-core mode. Core PMUs and
--no-aggr output are unchanged.

Fixes: dd15480a3d67 ("perf stat: Hide invalid uncore event output for aggr mode")
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 tools/perf/util/stat-display.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index b337cc23f413..493ed6c88685 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -894,6 +894,7 @@ static bool should_skip_zero_counter(struct perf_stat_config *config,
 				     struct evsel *counter,
 				     const struct aggr_cpu_id *id)
 {
+	struct evsel *alias;
 	struct perf_cpu cpu;
 	unsigned int idx;
 
@@ -946,6 +947,25 @@ static bool should_skip_zero_counter(struct perf_stat_config *config,
 		if (aggr_cpu_id__equal(id, &own_id))
 			return false;
 	}
+
+	if (config->aggr_mode == AGGR_NONE || !counter->pmu || counter->pmu->is_core)
+		return true;
+
+	/*
+	 * A merged uncore counter also counts on the CPUs of the other PMU
+	 * instances merged into it, for example on another socket.
+	 */
+	evlist__for_each_entry(counter->evlist, alias) {
+		if (alias->first_wildcard_match != counter)
+			continue;
+
+		perf_cpu_map__for_each_cpu(cpu, idx, alias->core.cpus) {
+			struct aggr_cpu_id own_id = config->aggr_get_id(config, cpu);
+
+			if (aggr_cpu_id__equal(id, &own_id))
+				return false;
+		}
+	}
 	return true;
 }
 
-- 
2.43.0


