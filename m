Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27769606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YuQL3JBS;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oqAODrbM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yr5NjeW8oda1f+IHLi1lcPyD0RqTa9ZTpZzCHKPijyI=; b=YuQL3JBSWeZUKTWFVlFqCczNyj
	bU0gQaslyAkgAUsl+s3/DdcguaYTyH0Sg2TAkfm3SGqlblvwnlJx3tUMQUok/hayJEeYidBBlF5BH
	Mj+MNo96cuyJvdfpvteknCOATE1JpCHK64TDiyA3Ap5Kro8mitwmShUiWUFbiaYq72Z13PwkG4Lv+
	ev94EDXCX6DegJDRsTaM7b37wpYEVIhOWRw+LpA1Pd/gAD05pUxD9xUEuXxMxiLS8u2m8xT6pMtsu
	vmOD1D/2IYq6IFUEvxELfRY5dKNH6IAYF0mJ2IvC3hTmJQD9S1zyabDluAJuwI6MQcuykGXdOVRwn
	j5YTUDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqlI-0000000CJNq-3byu;
	Fri, 30 Oct 2026 17:51:32 +0000
Received: from mail-northcentralusazon11012056.outbound.protection.outlook.com ([40.107.200.56] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMql8-0000000CJER-2xoE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCAMGWxlxgngfhlvkOJbaX1b7w7fPPGsJQz8BFKmF+1z5AEOBAdZvB8wk8zt69FDJEpk8sfAVMf3lVfI59m/Vr9YJGVMSQxEEJZi1TbPqqtZqVVwf3pcZ4louUH7OdClpDzzaFskSogfJTd362e+AW6K872MECQ7e3qHnPZDU4sJ/QRQ1cLTVX1PcwIBPm4R6APLG86EOD6SJ4B9RcE8Ec6ELo+no8dBFfhGtVNd6daE/SqQcv0oodKiTMe1EsWXm2rljvvJdfaAe+lyDDON5yZr1nBZ3boyESpTxlZTxvRAVKcSm6zK31ts0bUd/Cwfw8sCy3pAds26pzWUuF48Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr5NjeW8oda1f+IHLi1lcPyD0RqTa9ZTpZzCHKPijyI=;
 b=fGTmi+TaHXgX26QMAe6OQyualsGLTP6GdPX/66x8YTahuvEsf9hYcCWz2P5fzWiqvuzrOMvyckLU4z29M4/FVkdnxDUgPXESRv17jYBjL5+5ZPqo4fcWRr9oOfO/VktePVvEFB7lQPxC7v4pD0ycXbPrg0IfLeZnpnTyx5JcTDXY872VApxczTg12PRWFaxiCPM+/+QERhYeuHMapz9mp1etYVPpUQsgHPgl68lefL49bgybEkHNAZuvYbFiFWKbDhpJeSbF6fRoTu93DIniDICYb+IOlWvkOi4WyGgnIfhqThZRJI7ag9zsozlojLSX5tsfRURD6qL1Gm5IUKOQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr5NjeW8oda1f+IHLi1lcPyD0RqTa9ZTpZzCHKPijyI=;
 b=oqAODrbMO2ZV4At+63OjtspwtwdSUDw+g2kUgEHB3lyfUMk+kqPA/KHpZ4gc+bzi9QfIGmjM6wE2r2+kK4TfFN3XbLu2WT8Tx0SFj7ZgWH5jlJAJ+DdHj8vMYY0DQDbfq4FzPNnkG+dbf19BPx6ollIeZ3a7VzW9tpDfjBkDQC5Q9JUbO6btz0+4tnCgOxpN5EEzufGFCVTlAhY6DY3N+wLtl79qC+aRH076fBH1YquWTsh7BjsUfrpBUulZFguPzzSjVlBG5QjeFm9AGAlwaYpCAyagl4GyIg2zlpc4jNQo6fT4jGW0LrYdOBOmmzmt8s3W/zjZrPNigh4ZkB5kuQ==
Received: from BL1PR13CA0310.namprd13.prod.outlook.com (2603:10b6:208:2c1::15)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 17:51:05 +0000
Received: from IA0PEPF00000046.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::4d) by BL1PR13CA0310.outlook.office365.com
 (2603:10b6:208:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Fri, 30
 Oct 2026 17:51:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 IA0PEPF00000046.mail.protection.outlook.com (10.167.249.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 17:51:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 10:50:43 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:50:43 -0700
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.56
 via Frontend Transport; Fri, 30 Oct 2026 10:50:42 -0700
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
Subject: [PATCH v2 7/9] perf pmu: Merge PMU instances that match the same comma-separated json Unit
Date: Fri, 30 Oct 2026 17:48:14 +0000
Message-ID: <20261030174816.1544471-8-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: IA0PEPF00000046:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b42867f-dd1c-413a-16c0-08df36ae5f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|23010399003|376014|1800799024|6133799003|18002099003|22082099003|3023799007|56012099006|11063799006|261026121527099003|261021121427099003|261022075727099003|10067099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: cfsB6F+2KNniKJjmRi9cA0Yo25dKlDGxQwovKqnEpHajkQABy6yaSlhuTmZAwZpC7TZTjtV+TjrHO6Ntr6wboY/AdjqVKOsZGHvvko3iA25SkJDe/oj8+2qdxunf+0RfqI+HFNzvxEmHfETi04yFXCszguY3REzHLcReSefmdpSt3cNbJWDvhDlZZS83qImQgCvaPMmx3WY+prAzpY2PnrNSLAbiE2GkV4NI0atXrzO8KJJbHhmU5q2wCRHrtA1AfBU1o6AM7ZHgOXyw/yhd7LgFzlu+/fKXZqsmdrfBWZNxeyyYv9ipmzY6dgTHcX/7YZ/nf79OP4tG/bmHXfLe+5GvJZjWoO1ma/L7vSAyDtEFhEQEn1watrpyfZyIovTicm41vBFzLvPrRhdppbImmo/uZrshW+kQKGwi//tySi8aDNWdmAXdYhWagEIUUCdjVHdoNYDqE70wDE5MiSzgACe7rNPs/hN/RGWnc2Eub7aqaZWugjU7wJ+H0bTddUDtD4RPlgYpwfUgo34carvYoJ50mrhGAq6yyO3Bkg7uDwdGX+Q7U1HPlrGtF4lLa66glD7VsOnAvCvZrj6bjO/0Uz2eshAsfS1pLR8Q/3t1QfNLqXCh4hkiglLJuc1wMeGFJlucXqdhDuIcbU2BULDjCwvIGjB/uyoTRQHATDrsLczlvR+Ed31qYHlC4p+haavmB5A3tCvsmf+US0A2s4tP7w==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261022075727099003)(10067099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VAngy7p0/Dgngd33S2XsVZ1PcjzfWvODs8xR1TZenh+RbmbqX9LMXeJF7zQO3OeeWwlxLEUpTZFUgOoAm8YCL10gRd5PEI59Kb0IeSQ3dv5UaI+13qWXHKRtuBcTIFRYLKetf6SlVbkg7yb3QDDnf7zAAFOa9C8AcxmaRe7OOr5mPe1nGIZFkXBe0+uqLI2LrCsushjckVUmxqbbFJNzLwIaTm+Kz+1grVW8p5RysKEjsian+I5AY1uStcROZIB4+yDZd8JYv0G7BYIFHJ9xvHe3UAcygIWqj4jQMQCK6+dETvF7o+2M+YHkvUnoj6KaM4tPtw+iZ5uArOWaSY35C3pBQgCxtg/ntWO0yCwtn2aWoLXHyIe60rYfvByMoMtWgZCeIE11CLWnQP/dTEgQBJZTZ/oOjea57kzDcWpR4Xey4X2LF83V3Ga6vrhmitT2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:51:05.6249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b42867f-dd1c-413a-16c0-08df36ae5f21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000046.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_105122_824018_9E4C76B0 
X-CRM114-Status: GOOD (  18.35  )
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

Since commit 730670b1d108 ("perf pmu: Support more complex PMU event
aliasing") a json event "Unit" with comma-separated parts matches PMU
names with an optional number after each part. For example, the NVIDIA
Tegra410 PCIe PMUs are named nvidia_pcie_pmu_<socket>_rc_<rc>, and the
Unit "nvidia_pcie_pmu_,rc_" of their json events matches all of them.
perf uses this match to attach json events and metrics to these PMUs.
But perf uses a different match to decide which PMUs to combine in the
counting result, and it only ignores the number at the end of the name.
So the RCs of the same socket are combined, but the two sockets are not:
nvidia_pcie_pmu_0_rc_<rc> and nvidia_pcie_pmu_1_rc_<rc> give two
results.

On a dual-socket system, this gives one line per socket under the same
name in the default output, and with --metric-only a metric column per
socket, a "none" value for the other socket and a duplicate metric key:

  $ perf stat -a --per-socket -j --metric-only -M pcie_avg_wr_bandwidth_to_all_dst -- sleep 1
  {"socket" : "S268435456", "counters" : 6, "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "0.0", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "none"}
  {"socket" : "S285212672", "counters" : 0, "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "none", "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "0.0"}

Keep the existing match, which ignores the number at the end of the
name, and add a match for uncore PMUs with a comma-separated Unit: two
such PMUs are instances of one PMU if both match the Unit of the first
PMU's json events.

After:

  $ perf stat -a --per-socket -j --metric-only -M pcie_avg_wr_bandwidth_to_all_dst -- sleep 1
  {"socket" : "S268435456", "counters" : 6, "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "0.0"}
  {"socket" : "S285212672", "counters" : 6, "MB/s  pcie_avg_wr_bandwidth_to_all_dst" : "0.0"}

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 tools/perf/tests/pmu.c         | 72 ++++++++++++++++++++++++++++++++++
 tools/perf/util/parse-events.c |  2 +-
 tools/perf/util/pmu.c          | 65 ++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h          |  9 +++++
 4 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/pmu.c b/tools/perf/tests/pmu.c
index 13e8d7fa80af..e722cd08e30a 100644
--- a/tools/perf/tests/pmu.c
+++ b/tools/perf/tests/pmu.c
@@ -629,6 +629,77 @@ static int test__pmu_match(struct test_suite *test __maybe_unused, int subtest _
 	return TEST_OK;
 }
 
+static int test__pmu_instance_match(struct test_suite *test __maybe_unused,
+				    int subtest __maybe_unused)
+{
+/*
+ * Check that perf_pmu__is_instance_of() returns expect for uncore PMU _name,
+ * whose json events have the comma-separated Unit _unit (NULL if none), and
+ * uncore PMU _other.
+ */
+#define TEST_INSTANCE(msg, _name, _unit, _other, expect)			\
+	TEST_ASSERT_EQUAL(msg, perf_pmu__is_instance_of(			\
+		&(struct perf_pmu){ .name = _name, .is_uncore = true,		\
+				    .json_unit = _unit,				\
+				    .json_unit_checked = true },		\
+		&(struct perf_pmu){ .name = _other, .is_uncore = true,		\
+				    .json_unit_checked = true }),		\
+		expect)
+
+	/* No comma-separated Unit: only the suffix number is ignored. */
+	TEST_INSTANCE("Same PMU type: same name",
+		      "nvidia_ucf_pmu_0", NULL, "nvidia_ucf_pmu_0", true);
+	TEST_INSTANCE("Same PMU type: differ only in suffix number",
+		      "nvidia_ucf_pmu_0", NULL, "nvidia_ucf_pmu_1", true);
+	TEST_INSTANCE("Same PMU type: differ only in suffix number, with a number inside the name",
+		      "nvidia_nvlink_c2c_pmu_0", NULL, "nvidia_nvlink_c2c_pmu_1", true);
+	TEST_INSTANCE("Same PMU type: differ only in suffix number, with a number in the middle",
+		      "uncore_type_0_1", NULL, "uncore_type_0_2", true);
+	TEST_INSTANCE("Same PMU type: differ only in hex suffix digits",
+		      "smmuv3_pmcg_fe0004030", NULL, "smmuv3_pmcg_fe0004620", true);
+	TEST_INSTANCE("Same PMU type: differ only in hex suffix, with letters",
+		      "smmuv3_pmcg_fe0004030", NULL, "smmuv3_pmcg_fe00053a0", true);
+	TEST_INSTANCE("Different PMU types: differ before suffix number",
+		      "nvidia_ucf_pmu_0", NULL, "nvidia_nvlink_c2c_pmu_0", false);
+	TEST_INSTANCE("Different PMU types: differ in the middle number",
+		      "uncore_type_0_1", NULL, "uncore_type_1_1", false);
+	TEST_INSTANCE("Different PMU types: differ before hex suffix",
+		      "smmuv3_pmcg_fe0004030", NULL, "arm_dmc620_fe0004030", false);
+
+	/* Comma-separated Unit: an optional number after each part. */
+	TEST_INSTANCE("Same PMU type: both match comma Unit, numbers after _",
+		      "nvidia_pcie_pmu_0_rc_0", "nvidia_pcie_pmu_,rc_",
+		      "nvidia_pcie_pmu_1_rc_5", true);
+	TEST_INSTANCE("Same PMU type: both match comma Unit, numbers after _, reversed",
+		      "nvidia_pcie_pmu_1_rc_5", "nvidia_pcie_pmu_,rc_",
+		      "nvidia_pcie_pmu_0_rc_0", true);
+	TEST_INSTANCE("Same PMU type: both match comma Unit, numbers without _",
+		      "hisi_sccl1_ddrc0", "hisi_sccl,ddrc", "hisi_sccl3_ddrc2", true);
+	TEST_INSTANCE("Same PMU type: comma Unit, part without number",
+		      "hisi_sccl1_ddrc", "hisi_sccl,ddrc", "hisi_sccl3_ddrc", true);
+	TEST_INSTANCE("Same PMU type: comma Unit, one vs two numbers",
+		      "hisi_sccl1_ddrc", "hisi_sccl,ddrc", "hisi_sccl3_ddrc2", true);
+
+	/* Comma-separated Unit that doesn't match the other PMU. */
+	TEST_INSTANCE("Different PMU types: comma Unit of other type",
+		      "nvidia_pcie_pmu_0_rc_0", "nvidia_pcie_pmu_,rc_",
+		      "nvidia_pcie_tgt_pmu_1_rc_0", false);
+	TEST_INSTANCE("Different PMU types: comma Unit of other type, reversed",
+		      "nvidia_pcie_tgt_pmu_1_rc_0", "nvidia_pcie_tgt_pmu_,rc_",
+		      "nvidia_pcie_pmu_1_rc_5", false);
+	TEST_INSTANCE("Different PMU types: comma Unit part rc_ missing",
+		      "nvidia_pcie_pmu_0_rc_0", "nvidia_pcie_pmu_,rc_",
+		      "nvidia_pcie_pmu_0", false);
+	TEST_INSTANCE("Different PMU types: comma Unit part rc_ missing, reversed",
+		      "nvidia_pcie_pmu_0", NULL, "nvidia_pcie_pmu_0_rc_0", false);
+	TEST_INSTANCE("Different PMU types: comma Unit vs suffix-only name",
+		      "nvidia_pcie_pmu_0_rc_0", "nvidia_pcie_pmu_,rc_",
+		      "nvidia_ucf_pmu_0", false);
+
+#undef TEST_INSTANCE
+	return TEST_OK;
+}
+
 static struct test_case tests__pmu[] = {
 	TEST_CASE("Parsing with PMU format directory", pmu_format),
 	TEST_CASE("Parsing with PMU event", pmu_events),
@@ -636,6 +707,7 @@ static struct test_case tests__pmu[] = {
 	TEST_CASE("PMU name combining", name_len),
 	TEST_CASE("PMU name comparison", name_cmp),
 	TEST_CASE("PMU cmdline match", pmu_match),
+	TEST_CASE("PMU instance match", pmu_instance_match),
 	TEST_CASE("PMU config helpers", pmu_config_helpers),
 	{	.name = NULL, }
 };
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index f3ba70d4f76b..9455a7679468 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -193,7 +193,7 @@ __add_event(struct list_head *list, int *idx,
 
 		first_wildcard_match = NULL;
 		list_for_each_entry_continue(pos, list, core.node) {
-			if (perf_pmu__name_no_suffix_match(pos->pmu, pmu->name)) {
+			if (perf_pmu__is_instance_of(pos->pmu, pmu)) {
 				first_wildcard_match = pos;
 				break;
 			}
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 01753d5c69d1..df2abdf23697 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1120,6 +1120,13 @@ static int pmu_add_sys_aliases_iter_fn(const struct pmu_event *pe,
 				/*val_fd=*/ -1,
 				pe,
 				EVENT_SRC_SYS_JSON);
+
+		/*
+		 * Sys json events are not in pmu->events_table, so store their
+		 * comma-separated Unit here for perf_pmu__json_unit().
+		 */
+		if (!pmu->json_unit && strchr(pe->pmu, ','))
+			pmu->json_unit = pe->pmu;
 	}
 	return 0;
 }
@@ -2435,6 +2442,64 @@ bool perf_pmu__name_no_suffix_match(const struct perf_pmu *pmu, const char *to_m
 	return perf_pmu___name_match(pmu, to_match, /*wildcard=*/false);
 }
 
+/* Look for a json Unit with comma-separated parts among the PMU's events. */
+static int pmu_json_unit_callback(const struct pmu_event *pe,
+				  const struct pmu_events_table *table __maybe_unused,
+				  void *vdata)
+{
+	const char **unit = vdata;
+
+	if (!pe->pmu || !strchr(pe->pmu, ','))
+		return 0;
+
+	*unit = pe->pmu;
+	return 1;
+}
+
+/*
+ * The json Unit with comma-separated parts matching the PMU, if any. Such a
+ * Unit, like "nvidia_pcie_pmu_,rc_", matches PMU names with an optional
+ * number after each part, like "nvidia_pcie_pmu_1_rc_3".
+ */
+static const char *perf_pmu__json_unit(struct perf_pmu *pmu)
+{
+	if (!pmu->json_unit_checked) {
+		pmu->json_unit_checked = true;
+		/* Not found in the sys json events: look in the CPU json events. */
+		if (!pmu->json_unit)
+			pmu_events_table__for_each_event(pmu->events_table, pmu,
+							 pmu_json_unit_callback,
+							 &pmu->json_unit);
+	}
+	return pmu->json_unit;
+}
+
+/**
+ * perf_pmu__is_instance_of - Check whether pmu and other are instances of
+ *                            the same PMU: either their names match
+ *                            ignoring any suffix, or both are uncore PMUs
+ *                            matching the json Unit of pmu with
+ *                            comma-separated parts.
+ * @pmu: The PMU whose name and json Unit to match.
+ * @other: The possible other instance.
+ *
+ * Only the json Unit of pmu is used. Instances of one PMU have the same
+ * json events, so the result doesn't depend on the order of the PMUs.
+ */
+bool perf_pmu__is_instance_of(struct perf_pmu *pmu, struct perf_pmu *other)
+{
+	const char *unit;
+
+	if (perf_pmu__name_no_suffix_match(pmu, other->name))
+		return true;
+
+	if (!pmu->is_uncore || !other->is_uncore)
+		return false;
+
+	unit = perf_pmu__json_unit(pmu);
+	return unit && perf_pmu__name_wildcard_match(other, unit);
+}
+
 bool perf_pmu__is_software(const struct perf_pmu *pmu)
 {
 	const char *known_sw_pmus[] = {
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 2c8916ad073e..5263d97b8f20 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -148,6 +148,12 @@ struct perf_pmu {
 	 * @events_table: The events table for json events in pmu-events.c.
 	 */
 	const struct pmu_events_table *events_table;
+	/**
+	 * @json_unit: The json Unit with comma-separated parts of the events
+	 * matching the PMU, NULL if none. Units without a comma are not
+	 * stored. Found by perf_pmu__is_instance_of().
+	 */
+	const char *json_unit;
 	/** @sysfs_aliases: Number of sysfs aliases loaded. */
 	uint32_t sysfs_aliases;
 	/** @cpu_json_aliases: Number of json event aliases loaded specific to the CPUID. */
@@ -166,6 +172,8 @@ struct perf_pmu {
 	 * been added?
 	 */
 	bool cpu_aliases_added;
+	/** @json_unit_checked: Has json_unit been looked up? */
+	bool json_unit_checked;
 	/** @caps_initialized: Has the list caps been initialized? */
 	bool caps_initialized;
 	/** @nr_caps: The length of the list caps. */
@@ -300,6 +308,7 @@ int perf_pmu__for_each_event(struct perf_pmu *pmu, bool skip_duplicate_pmus,
 			     void *state, pmu_event_callback cb);
 bool perf_pmu__name_wildcard_match(const struct perf_pmu *pmu, const char *to_match);
 bool perf_pmu__name_no_suffix_match(const struct perf_pmu *pmu, const char *to_match);
+bool perf_pmu__is_instance_of(struct perf_pmu *pmu, struct perf_pmu *other);
 
 /**
  * perf_pmu_is_software - is the PMU a software PMU as in it uses the
-- 
2.43.0


