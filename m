Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J1sMtWR0;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Hnla2h5Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PeQyp24lotSnEnIrmE0yQFUm7VeGpS3XIC5MhTYw1a8=; b=J1sMtWR07s3QRB+U9YpRBqUEJs
	ID1X4sIuEST1HW8x2QzSSAvjXnTi4RK2WzE7ndAzMBsEK+/AC21Ga39QhqKfbXqeHLtjEkmF4lBt9
	fruVrfVjsF1+MUHbIjc1Oaj4KxlP7AHDaJuhZb3mmASG0kY1I2653UQjfr9u32ZOF0xK1CEuseJ0W
	Jbwy/fati04iDSeUlVGspKgeSF+tlwNlL7ET6msa7vEKKc6JJTUMXNn1D/Ur/kg9BPdx3xTgVEtTB
	9W5rpVdn0dDuyPuq88RvWlBDS/tUj3hRJ+yTJ+1M0XKVIhXdd2d+45/ao1SNDqv50i6Bmbp47sys8
	5EVY+OgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdYn-00000005tu8-0xOj;
	Wed, 04 Nov 2026 16:10:01 +0000
Received: from mail-centralusazon11010030.outbound.protection.outlook.com ([52.101.61.30] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdYi-00000005tsc-2beQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YltxaAovIPMIVaMJ3kBByPGD6WjOK7dJsooE9tEybuplF3tCPt1hAX53Bw3/DIKqXfHfQ8fpPa4jZU0BstPr/Fz6zoMEoQI/byQLvJEKF9aK7pjzpvo2xtD1Uww3vG215pjm8fCRrA7k6yRUWLb7b2CEessym9D+dwttUQRds6z+hBrlAWGBW5lzwCF2R+w/aD+gPPJcEnPNEnkqITudFCXIhPo62nww6+FmD7jCXua97yiJ8ZIOyvDIFTXB+GeFvarfUlJm1QNxQ7oy1vzN9tOo8TDY88bsxfzPUKQlcXOqzpL7pD4WQilvhrVypGudQB7uNfOgZZtSnqHH+Ijd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeQyp24lotSnEnIrmE0yQFUm7VeGpS3XIC5MhTYw1a8=;
 b=r0SWFho/jYthpPmuG3mwWf5aTUTHmC4w+sPUi8t57RhBSM6jmSYOfWiYDFPke+nYrHXM6HDA2CqTCuMWu08mHH2oI9qguml+NLIfvUxzh50U47We/yiFL8l8srDk2wmQ10YwIQQTIkVR8Lna/0V3QVTGdNVwtFSa3PI4HAQZT5M0O5tMjlo4vLZMrLLE/8cCNq6oQSc9aoMyqQUQWWLhMgT/IAL1EkX0Ts6sxtaX8G7bR6gKIx5M9k/JF30S2KvgkAjWvEc2TH5jOcXna8P4u5nL0rCwzlz45Np19+j1k0gLknJr6sK6mtxjkSnjGpwZFgBAUHcYtRDiGifcL36yDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeQyp24lotSnEnIrmE0yQFUm7VeGpS3XIC5MhTYw1a8=;
 b=Hnla2h5ZM4qvu59jS0oFpe76Dwv6e+JWnilw8b1xpi/R3DNxot/Z4cFV1JaOKKxG1pusK63+5xZ1z/Ho6KSIv10rOj6jKCmJpxo+oM+neDXVvpND8lT5dC/j2o406RmpGfUpa5aWV4QqhC63GzrufHjjKgqrCPeJ2WFKYfUCQz9+C1VQ3jRSM/WgM0QIMRP4ObpYDwzI03rlUieyeEqe+/dNkNenjUBXf9hHuEoKnrFU9Z/yqPFP4vULbgyaDx4GqpiPH1okmJalTD1d/zfdsFy91sO6fV4VA/e+zNKEOzCRtWPO2KEliV5xWkz+NfL/6VgKAog1ClyJrN0O6xJlOw==
Received: from PH5P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::10)
 by BN7PPF0D942FA9A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Wed, 4 Nov
 2026 16:08:37 +0000
Received: from CY4PEPF000392D9.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::98) by PH5P220CA0013.outlook.office365.com
 (2603:10b6:510:34a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 16:08:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF000392D9.mail.protection.outlook.com (10.167.247.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 16:08:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:08:10 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:08:10 -0800
Received: from build-bwicaksono-noble-20260804.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.56 via
 Frontend Transport; Wed, 4 Nov 2026 08:08:08 -0800
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
Subject: [PATCH v3 7/7] perf pmus: Treat both numbers of NVIDIA PCIe PMU names as suffix
Date: Wed, 4 Nov 2026 16:07:16 +0000
Message-ID: <20261104160716.2910873-8-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104160716.2910873-1-bwicaksono@nvidia.com>
References: <20261104160716.2910873-1-bwicaksono@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D9:EE_|BN7PPF0D942FA9A:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b492c6-5fbb-476c-424b-08df3a8de243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|23010399003|376014|18002099003|6133799003|22082099003|261102123227099003|56012099006|11063799006|261009223027099003|10067099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: gxnznAIVJqEh8Nx8IkNxiQYLOoKpo5CmfMU49h5+JVC4wn+d3VXYq5edP1r+4hB3F1dJ5O6lrcScQ8lK0SLAyDLDbmOLCEzGkdAMj7hYem/hSrsq8oawpotkwae+46JAUkY7VMWwKG948xdKoNmV05EG2XbzjYmk5TJ/WcAaw31gssde5mznVfw/r6pPvWiY1ftQqQmCCjyJcdzshHVoVcRWOuMzx1n/vU94Ua+Y580A2j4aoQXev9KGFa6Y7tshNCNVhnP4NQkHBVAx8pJ+rOtdG6m/eEjrXx6UBHgS4pRc4KnXjpNHOsmBDsC7oZjULAo8W5UZBYRSKm6xtfJhnGj5hF9sQkS8U/E1tsBiHoxlL9xgnSnpCe7bNiBZ9ufqD6iWR4trIi/uUtHcBry1Nkm+6WdurW5Tl17hjJoXlMZfnkgjKZnEUndiTl2cWH0vcoN5NS9Jhge+URe7IxMbMlRrWN/7Hv+C073t3u8dTu/LeZkY8CcpHro4pSMN28fqsmiD85gEKAo/hGHpIcg/YwohvQcMdVt6lo3SYoV+aijzdVG3A3PGqhgtHXwgCBBw6zbnUcCwYt/rMtMvgwrcFxHRXwiD9uOr+jdMEGncQtD5EK6jdSvvRniFJzYHExxCm1QbX3ExieqO07Gtrnci/XxJzIbBIXOiBSRbawJf/N7Any/kCl7Q7uBsALBqrqoGQVzk8itsoV8z12Bh/yTEzQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(261102123227099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: m+1A/ZU6gdWSD1pRA86TyVc79rqNaEFDkrOWvhl5Ax+5Z/Jfdwva7CCxaBozLlsn0o1ksyYWf2shMG8abgO4bm6odyH5qLKGyih0BH7nJxabSJTiwvLb7j3H238XgPy7kBwrWm3ix3AN89Stq79uBHPiR4kixNFmC4EB6YyWkps/0qp8pbuAvjI2xW4wwcnu78IalGOOSEZQ3PZQzgW9Psh1asNG57hQ29ib+hygL39fkmp1qZHgn4yFQht77mYq1UMEB29BdTqE/HAuUyzrroW1B3hNReGa/N6kRwRiru0OOVPEinUeApGF42yr9/II7CMjyELhPEWQl1E8g5nvfOvgDHZr+Kbf3DBawM8RVRNiwHdMbj4+khgiOhDR5kwBfTf7ESS1Zzaqq6lRBx5vi4AHUU2nPrGMWZNBAFKWAi/FgZzHm5Xq1SMiwEOTkC3I
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:08:36.9787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b492c6-5fbb-476c-424b-08df3a8de243
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392D9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D942FA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_080957_887666_51AF2155 
X-CRM114-Status: GOOD (  12.56  )
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

The NVIDIA PCIe and PCIe target PMUs are named <name>_<socket>_rc_<rc>,
like nvidia_pcie_pmu_1_rc_3. pmu_name_len_no_suffix() only strips the
last number, so perf treats the PMUs of each socket as a different PMU.
An event or metric on all PCIe PMUs then gives one result per socket,
each labelled with the first RC of its socket.

Make pmu_name_len_no_suffix() strip both numbers of these names, so the
instances on all sockets are merged as one PMU, nvidia_pcie_pmu or
nvidia_pcie_tgt_pmu. Also accept that name on the command line, as perf
list shows it, and sort these PMUs by socket and then by RC.

Suggested-by: Ian Rogers <irogers@google.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 tools/perf/util/pmu.c  |  9 +++++++++
 tools/perf/util/pmus.c | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 01753d5c69d1..1ae8bcf71c68 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -926,6 +926,15 @@ static bool perf_pmu__match_wildcard(const char *pmu_name, const char *tok)
 	bool has_underscore = false;
 	size_t tok_len = strlen(tok);
 
+	if (strstarts(pmu_name, "nvidia_")) {
+		/* NVIDIA PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]+. */
+		const char *rc = strstr(pmu_name, "_rc_");
+
+		if (rc && isdigit(rc[-1]) && tok_len == pmu_name_len_no_suffix(pmu_name) &&
+		    !strncmp(pmu_name, tok, tok_len))
+			return true;
+	}
+
 	/* Check start of pmu_name for equality. */
 	if (strncmp(pmu_name, tok, tok_len))
 		return false;
diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index 1355b317f3ed..8d3238fd23f1 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -67,6 +67,15 @@ size_t pmu_name_len_no_suffix(const char *str)
 {
 	int orig_len, len;
 	bool has_hex_digits = false;
+	const char *rc = strstr(str, "_rc_");
+
+	if (strstarts(str, "nvidia_") && rc && isdigit(rc[-1])) {
+		/* NVIDIA PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]+. */
+		while (isdigit(rc[-1]))
+			rc--;
+		if (rc[-1] == '_')
+			return rc - str - 1;
+	}
 
 	orig_len = len = strlen(str);
 
@@ -106,6 +115,20 @@ int pmu_name_cmp(const char *lhs_pmu_name, const char *rhs_pmu_name)
 	if (rhs_pmu_name_len + 1 < strlen(rhs_pmu_name))
 		rhs_num = strtoull(&rhs_pmu_name[rhs_pmu_name_len + 1], NULL, 16);
 
+	if (lhs_num == rhs_num && strstarts(lhs_pmu_name, "nvidia_")) {
+		/*
+		 * NVIDIA PMU with a non-ABI suffix of nvidia_..._[0-9]+_rc_[0-9]+:
+		 * compare the RC too.
+		 */
+		const char *lhs_rc = strstr(lhs_pmu_name, "_rc_");
+		const char *rhs_rc = strstr(rhs_pmu_name, "_rc_");
+
+		if (lhs_rc && rhs_rc && isdigit(lhs_rc[-1]) && isdigit(rhs_rc[-1])) {
+			lhs_num = strtoull(lhs_rc + 4, NULL, 10);
+			rhs_num = strtoull(rhs_rc + 4, NULL, 10);
+		}
+	}
+
 	return lhs_num < rhs_num ? -1 : (lhs_num > rhs_num ? 1 : 0);
 }
 
-- 
2.43.0


