Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBC5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai9o12gZz9c3ClnlIUf6eDiVSwHzhJTVJqIs5NOoVOM=; b=Lgz7VZkXdfLbYnqHBhATqii3Xu
	yUbpmmZFEg6gvLb6WT+agp35a8Ez7JYH7D7UiSTZ3cyRjnw8k59mBIargHbmsx1m/B4nt2U7h+AB9
	Vz19UGFyI+Ry+7u240PmwWBvC0EhNvKMX8YejLZsLV9uqe8MwwAsSE5Q5LOSrAkV4XcJhhedscq0B
	DvbGDTRT16C0d2Kw10cyNGwXw8WPkxMGjvOHyWC9Ln/YRVs49/pwnnkLXNKxF1EfSC1+qxwm3d7IP
	qgXJLaZCSd4CVYVOixz/OJ5Ktl1lIEVwbxYFS99iW6Ds1Zo+S+dmfMl3D3KUfS7I+CPi86c8RumY/
	IC8FrH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjAF-0000000CQHy-2V3w;
	Fri, 18 Jul 2025 11:22:07 +0000
Received: from mail-bn8nam12on20623.outbound.protection.outlook.com ([2a01:111:f403:2418::623] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucibD-0000000CKzX-08KC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:45:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ub2ZdZl1NBCD43QQ2cZxKioSNCqvyfNnvR+ddgt+ok+23kx9sIwV837nex620R7ItztQAc0zFxPii90sl0rZ0UBoKvf3UUKc+zLKyl8E8SoKQwi+qOlrYjXVsyGbSvJDTctj+cuzR9AAZtMzxpIEflR27VaEgqMEI6lzetH64I1LervSlkxuxhfqDk3pla7dCq5remCWQf5sFVnnDdbnXvBHn9eRjguKyOh58RGslyDAfqZi6HwE6lGtDWZkk7x43xeMWevo1/eNwHkPs6QFJLMv80bjJtfYAGBJ26rcmJ5AsAS7A/v29igzLhcf/ujzbjUQEDzmOtmN49V02EBbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai9o12gZz9c3ClnlIUf6eDiVSwHzhJTVJqIs5NOoVOM=;
 b=fauR4DjR6v92DuRJbpABuonXBZ+guGx2rmQPhj+y4NtZjL3IaDgiOYFw+ZQBBjXCQZur685pz5JF3CuxcpcWC6+VXYEMj30l/UijpSnWOkEst/F5RH+SPQIbvO64RCKVH+siFq6NLO7nK9817BA07fEYIX5e4OCbAfBWBZYmpTnwh3pXCkFJrPn/i70kbvtQS4l6DXB7N5W4fz5zdV4xk1EacS84TfX/HM5vVZa0cJib5ORllDuBKvZoWnNu0B7w39pFzaEB2E7qFLWojFOvM1KZK2RJLKjTHZtwUrVooOZmVuewkxFfDuEtV3qgCQc9jxgBCi//SRN70oAenDezeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai9o12gZz9c3ClnlIUf6eDiVSwHzhJTVJqIs5NOoVOM=;
 b=LGjNf0NA+Dc4sRP7ABjPddgpTmFZqlsxkwoj1T+TV7Vnm9vhYfkcjguas3Exa9mCRCFlr7HG+1n3UHgfHewkhbfqn5DdyULDl22+9N0lrAt7i8fdxIP/xJvJQBP/HKklAThVkWM0jz+zZ6iOG/+3jn6nbma4/0oWfjbDgf5JTHg=
Received: from SN1PR12CA0047.namprd12.prod.outlook.com (2603:10b6:802:20::18)
 by DS0PR12MB8786.namprd12.prod.outlook.com (2603:10b6:8:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 10:45:49 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:802:20:cafe::8a) by SN1PR12CA0047.outlook.office365.com
 (2603:10b6:802:20::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 10:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 10:45:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:47 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 05:45:46 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/7] arm64: zynqmp: Introduce DP port labels
Date: Fri, 18 Jul 2025 12:45:11 +0200
Message-ID: <99ec1532d0cce877b1d365ede9bd15a909706637.1752835502.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752835501.git.michal.simek@amd.com>
References: <cover.1752835501.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526; i=michal.simek@amd.com; h=from:subject:message-id; bh=7VKXuoABZueUuGhvzHQ/L58/dV2TVnf4vh3VpLbY0Eg=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRUqe66ZJ13ZO6aF47rpebHPKy/IBlstHVjacpa86QXA plPXV5+6ShlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJGO5h+M3yZrO/zIM/h1nv +VYbvggyP1/6yCPtq0TqAc+wpStXuyow/OHN3tXw6JvY2ZPNFismqAd9Y9YSdnE/7ObR8aNxRsc FBUYA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|DS0PR12MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: cc247ab4-451c-483d-14b6-08ddc5e8425c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tYl4c76FewgYg5xF2YFr7FF67rvOF17wudJIANBfAnnQEAxAvydbowH75EKL?=
 =?us-ascii?Q?KBKRgGc44BuWn8QyKRRqg/Ug+ZZaHTMJi8IU0MGKc/20Bx0FWfqQO9uD4WhH?=
 =?us-ascii?Q?MhfyVuwytdl/GkAwuj6oiLEaPRir+QNof9I9ti2w/owXWETU9CueejjgO9z+?=
 =?us-ascii?Q?6El/eHGxbAQO5rfMmIWzhTwxrfC+9Qvn1PeylM5S+0H/Gvc7vGbAKm7wyiAQ?=
 =?us-ascii?Q?aCKmK+c4stJDXli9qy2GWvtR5ZS6/vAJA2U7RDnoTM/AYp2Z/YYDJl/b+I8m?=
 =?us-ascii?Q?SDlVamIuPRVz60dbm74ahlEzXBVhDd4eWPIFOBgIWMtIpP9JmKYVBEoeoNdl?=
 =?us-ascii?Q?/LrG3XLxrP49c3VTRG/e5pi9GETpYR2lu8rT2flQ5DOQVF21W+/KJ2z1O/qW?=
 =?us-ascii?Q?lRQBd+gh4poUZh0QAxMg0dhzEOAjJAF4fyhjfjWWq4J6xaQ7ZXw6kwizlp+5?=
 =?us-ascii?Q?WQ9VDtigTBwjJMkbRSCS/TTmjFRbKmeO2doQIX8lt20thTjpfQPQYfsoauSK?=
 =?us-ascii?Q?SX3BCSYBk6LzL7SRZfQNJkcF0+/qBC8aumjPUqFvhUAQ5cMuY/IcWnY05++l?=
 =?us-ascii?Q?5Azh8NOstxWpqWKiHDPrpKEhzuYEPkonh4QwZ6OdPENYnAhTiM3JfXStxaPX?=
 =?us-ascii?Q?Vpqt9UIcBT2SO9uTbW3czHnCy9TJlTXZPbXqAGfQU6CK96oDZfapLhpikn4c?=
 =?us-ascii?Q?cMSAZdiT+NJ69M6kFqvWfWyDFlthYgvfgoekzyFn+yjWlzAmR8ocABH1O5SZ?=
 =?us-ascii?Q?T27p3XHt0eQ5M8++YgTpeRHPuAn4zR6FBQE2bitn6G2fLIy797vEZe6NfVWu?=
 =?us-ascii?Q?N0fro9Szs/dXvls9F9ECGQ+57Wp+dmQZVdCByai5n9ojlFGHGlZnmHNkcMZp?=
 =?us-ascii?Q?7q5jCTlvb7GVM6rytNDMVFUVaHPGO+pezuJahCma30LtFNoJe80s8D5jtD9+?=
 =?us-ascii?Q?nWexGANQwv4njg/0bP0VbUiBJ+ETN+dvPXk1uBFAT/im30iMN6u2Q1tLBxQR?=
 =?us-ascii?Q?Mf+jJ1F6V2Dyiropq1d8efj0CcXXm23/Aapiq5VjZ9wyR7uPvIcO6zMGEhHf?=
 =?us-ascii?Q?s63O7kjiTYkiyJASC4GhConq+N9UBvJTsJxk6Iu613QTe7D5U2/r/W8rDpE5?=
 =?us-ascii?Q?G7DJCbbq1erVS8X4iKoYd6M5kthpdqhDXfly46FLpuiGJRzQWR7xRBWVM3En?=
 =?us-ascii?Q?QxI42N5UhOVnx5t73WARC3R7mj8+sePncgnvu/Q9D60+8K/YSbEPPs7/zVXf?=
 =?us-ascii?Q?FfLJPMrP2KGbh7FooqZdbaEKVS1GZaxN1p896IzjvkJn7CJYbWmD2cQgWzKp?=
 =?us-ascii?Q?t4mrxc/o9NPPL1ExGynn+DlyJTMLpP17wxseFt7+cHZrNhpsdPmMbJRboQ5B?=
 =?us-ascii?Q?QzrPpDRq4rHzguL5OrIaba4yYa0fWIgj4NMZ4ZPpDMHKtU7u17hnC7euTJsJ?=
 =?us-ascii?Q?ObFAd8gcGnrbf+YMKPvif7SV/Yw2bszV3bGVhz9VSrjjNxAmR3e8caA0CelW?=
 =?us-ascii?Q?OeW7aAwUpJgFztxMkYQNw7ZZCwlaL3+lj5Le?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:45:49.2239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc247ab4-451c-483d-14b6-08ddc5e8425c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8786
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034555_072090_906A7340 
X-CRM114-Status: GOOD (  10.98  )
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

Describe every port by unique label for easier wiring with DT overlays.
And also labels help to describe which port is used for what.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 10 ++++------
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 10 ++++------
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi               | 12 ++++++------
 3 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 7490efea98bd..1d2b46d7949e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -112,13 +112,11 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0", "dp-phy1";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 0>, <&psgtr 0 PHY_TYPE_DP 1 0>;
 	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
+};
 
-	ports {
-		port@5 {
-			dpsub_dp_out: endpoint {
-				remote-endpoint = <&dpcon_in>;
-			};
-		};
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 7beedd730f94..cd132abf6e00 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -1042,12 +1042,10 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0", "dp-phy1";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
 	       <&psgtr 0 PHY_TYPE_DP 1 3>;
+};
 
-	ports {
-		port@5 {
-			dpsub_dp_out: endpoint {
-				remote-endpoint = <&dpcon_in>;
-			};
-		};
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
 	};
 };
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index e11d282462bd..b20a560741e5 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -1319,22 +1319,22 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				live_video: port@0 {
 					reg = <0>;
 				};
-				port@1 {
+				live_gfx: port@1 {
 					reg = <1>;
 				};
-				port@2 {
+				live_audio: port@2 {
 					reg = <2>;
 				};
-				port@3 {
+				out_video: port@3 {
 					reg = <3>;
 				};
-				port@4 {
+				out_audio: port@4 {
 					reg = <4>;
 				};
-				port@5 {
+				out_dp: port@5 {
 					reg = <5>;
 				};
 			};
-- 
2.43.0


