Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFDACA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9ZUbofLbeQXy/5eEUxBta6UbHCUF/092K40j8sDf9o=; b=j+mJNlku6q/C4N670SYfpVW+ZP
	2ecrAaD+ip8OpFTlsdtDgsvJDtgb2mc6VPvvHmX3IgJaYqwDxnmvRtCxAS8dmUjsJgqg4cKKezMD3
	W7TjxnHnQOrAu+Q120X+A910TKKHBsg1XQoxdnn/RTL9oRS0Ph21DSgNq/jsRAamZgllNlHaqpM3s
	+v428KViASnlFoSWdq/4fb0GqQELrVW4f0Q7hniZCEEc94CJQIBtNxokPTNRy3Makk6bRleHmxHE8
	8y/xdP1l4dkompUP43KZKH3k21n76/N567Nm0yupepkAM+ryeohGoN8IKdYc4pCWWpwKBly7/ZBP1
	7dN+PPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM8K-0000000Fy9W-2XaL;
	Tue, 02 Sep 2025 08:12:52 +0000
Received: from mail-bn8nam12on2060d.outbound.protection.outlook.com ([2a01:111:f403:2418::60d] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsl-0000000FrZl-3Z6n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEr6juJXoFLRDqg0vxmrr2+qZwIhgw4Nww1go7sHldTPyFNnGHH+Gl9sH7lh+8kQKkCB0/bOykLd3IPBUi4cMP40FesCqs5uc+mspZ6blROEhPb1CfA6QZ6VBzSAj2JtBHET6SqqxvfWC1VeXQvjFyl/bAg7LzWRusJJavT0UG54vZhHHccwdonZZ8LpfyuZa5qiilRVbHdlgMpaqnwgTsOn1rxvPiSnl3GVY4jUZDWkUmT3zYcmq/ynpKY5kkTMMnwEJDqGpnbpenYTy/ip3ijtCb+chsgUzNlDL/25Vg52D6cnf/nKZVdgKu4U/uHxiB8pIhPLKRV4vDu7iQ3L9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9ZUbofLbeQXy/5eEUxBta6UbHCUF/092K40j8sDf9o=;
 b=ZW2Q8g6atJ8DUHERcKBfTwFIxqqMl3NQ0ag730D5IpDbX/HNcDARMnXMjC0QZuCPXhBcdO4OAH4izL77Cy8Qt7JTy98uwML8tFwVm6KakZjVmWu05Cq6f8ihSoOoCJ54zRlLI45Xibsm3ZQKTnIozd5XF+pqIdgiCJHWLfng35R6Y9Xj48Y17gur+XhUcwlIX6OYEFVhuNV2RiilesyAO/rt8LlMOophksD0g98QPsVbhS8RM+lm6dn4jNpMRn6QWBKtLjc8RZ1wrM7qtPJ6nJVbZQMhfj58fIlpSdiH1o7bRvYGxWP0baLTGjfH+xQmcgEsVRlObkFT9UEreXbstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9ZUbofLbeQXy/5eEUxBta6UbHCUF/092K40j8sDf9o=;
 b=cMXh00sWBaXbP9D5NHjGWfbGmHUBmuxB472bnjoJ63/S1wArCCG35wwRyppNdc6E62keUEoZjAfF9/w5718PcUks/ex1rojZAighARfRfQJL95BRVvPNPyqUWaIcApHaF++zWVL+nGvx7eLGqp5xTr8VXB2xETkmmQbJ69ccMgM=
Received: from SA1PR03CA0011.namprd03.prod.outlook.com (2603:10b6:806:2d3::23)
 by PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:56:40 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::fd) by SA1PR03CA0011.outlook.office365.com
 (2603:10b6:806:2d3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 07:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 07:56:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:56:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 00:56:38 -0700
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 02:56:38 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/4] arm64: zynqmp: Describe ethernet controllers via aliases on SOM
Date: Tue, 2 Sep 2025 09:56:20 +0200
Message-ID: <72304150f87fd5e3338e31e2be8cf5d29955cc02.1756799774.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756799774.git.michal.simek@amd.com>
References: <cover.1756799774.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=michal.simek@amd.com; h=from:subject:message-id; bh=Cd5RrsEv2Ix2M+moYVFip4oyjkvTd9vJW6lQIz4X1Gk=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRsW6zSOfH63UPpRzoP6RV0F+3TNyph4Dleu1f+zZ1vB 9c1tmXYdpSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEfk9j+F+sG5nm9+ls/pdS R04Za9PPh+LitW3ZONmOc9U6p2hetmBkuPa4PdTKe+N9ZoMuXhUhj59P5KN/dTHdKLQUDdvBkRL KAAA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 02320e43-12a3-49c0-2d74-08dde9f64000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zu5JzX+j0ttWM7PanHVT3Njl9N63VmoIDzI04I4tWk98ILLUBmEIcJV/U2k9?=
 =?us-ascii?Q?aR7wTevnKK4S0UFfgETaJxbGDj0xiK66FXAHZcXsThb+CTN66/OdjCBEEYU0?=
 =?us-ascii?Q?15YxNs7Bj4NM+vBDTM3O4HaWKyPgZ7AmYusfcx89Zxe7p3MRHMc3L3V2EUQ0?=
 =?us-ascii?Q?Ym4Nx1+JSOusb2ytfWcOHhMNluvsC4NN8hFwPHYWlqJhMauQy/RMypOtmn8f?=
 =?us-ascii?Q?JVbssqR0E12OA3NGvy2+YynHNsCPMneiSu96Da/Za7p8zIkdGI/tsWywEdWR?=
 =?us-ascii?Q?a+nGj/I5qzpgiPw6jC2KuzDYCsGr9+sXUuF6fgy4+enbTXWEDWqh639Cm3oe?=
 =?us-ascii?Q?xxHmRvLmYxJ6Kuw8faphBraGFS0a9K07aZpISui5ODryuVgnKhDhjl5EhqqO?=
 =?us-ascii?Q?/JuCIP8sgNzDgg/1Ebb8VzhboyRWul24fIKMlWkVbnapGA7OPQNrjJQRkZiJ?=
 =?us-ascii?Q?xxgc73WXKdRA2yGbJ5znFkboP30NczHVMPXyRKWXAPxMxGLUdyg3jH0RjMjX?=
 =?us-ascii?Q?18afhxWTMQvn72BZ8vOExwVj8bG0tHCs2eZWHAOXsXt8eIcBKGwrqrzIV1uR?=
 =?us-ascii?Q?b3UFWny7DEPRPwIFWOwyFrmKri6iVFnHICThWLDwyD+i2b3Q+eakWXZBx38T?=
 =?us-ascii?Q?phNhTge1AmgrwEwkmNnVkygAUcRLmTojG+W6gxZDyeOFLKdm7sI7cVl1Zs8Y?=
 =?us-ascii?Q?khryIUnsom20LpTWeRt611StjuH3/bWDoRWDl7NXM3IJmDkp8jY9T2GHP8qF?=
 =?us-ascii?Q?XQaepb6MkAYKnYOXlFAnbeulq/joacG8GeRJiA3F98+rgq4K3zJT0yUPRrkJ?=
 =?us-ascii?Q?Lgl7wLoeHJFM2s1nYKi7uJ+XGhunrBpDWg2vM7wSUQG6RfUHZfi2YQWHNqA+?=
 =?us-ascii?Q?D4Dlymq0sbSiAqpUifZeSiG9amSm5JNdWbyqd1VnoHW7eccdwOC/VRcUZjjd?=
 =?us-ascii?Q?X13XpKRjQw3mN+EpZlUr8W0zT3rkngau595pT14KeYoC1erunr8c1d+IqLaN?=
 =?us-ascii?Q?J7ktlbJM3TvZgryaYdTLwzBBP88gT/g8chUzw7MPFhXd8aq2MnHa7RodyeOG?=
 =?us-ascii?Q?mQV4tILYoxXugByjYlpcHNhuZz50iUsKNHqioIXEajSFyBnkpIlzTETi3R2u?=
 =?us-ascii?Q?IyMNWTczgM2BTu1ICW+mP6bPU1m72+/VxjhugrAWUd2F8tLynqSBXbrs3oqZ?=
 =?us-ascii?Q?3QKIWAh9z2YE6396y3o1+74R9f5+JeOxrvIy6cMAbrLaX2pagpfYnLq6Mzfn?=
 =?us-ascii?Q?1zrT9JxlNbQjH1Thb0LLlM3/lKzW4L3SHHKnU3TjTRqXw3xHuwhKNOM13bBZ?=
 =?us-ascii?Q?tGj+0FvtOc0HxqlV6gDsTXpPp58ROwAqIhy7B5ZmOMwUsiyXZaD+nk790lIb?=
 =?us-ascii?Q?ssTQuQ0k1L6IF5psDLe2mFBf3dUvwSyk6m4ILuZqf1bx2lM4oueLYb9/ll6i?=
 =?us-ascii?Q?ZXRkuOX6L8ewjgLUf4aoh/yD5rsBNDmBnbA5o4V0w/yqoOnMCkwVvxw57tbt?=
 =?us-ascii?Q?Lhv2SfofJrzt8qoMsJbsOEV2Q1JF8J3CFIBJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:56:40.0682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02320e43-12a3-49c0-2d74-08dde9f64000
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005647_928720_926AE2D4 
X-CRM114-Status: GOOD (  13.75  )
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

Add ethernet aliases to CC (Carrier card) description to create a
connection which is used by U-BOOT (fdt_fixup_ethernet()) for updating
local-mac-address in DT.
On Kria SOM MAC address is read from i2c eeprom at start and based on it
environment variables are created. Without creating aliases U-Boot is not
able to inject local-mac-address DT property and OS won't get the same MAC
address unless another i2c read is happening in OS.
Also aliases are using string not phandle (because of dtso) that's why full
path has to be provided but that shouldn't be a big issue because location
of ethernet controller is fixed.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 5 +++++
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 4 ++++
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index b7cda216b179..99ad220d13d6 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -20,6 +20,11 @@
 		     "xlnx,zynqmp-sk-kr260", "xlnx,zynqmp";
 	model = "ZynqMP KR260 revB";
 
+	aliases {
+		ethernet0 = "/axi/ethernet@ff0b0000"; /* &gem0 */
+		ethernet1 = "/axi/ethernet@ff0c0000"; /* &gem1 */
+	};
+
 	ina260-u14 {
 		compatible = "iio-hwmon";
 		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index a98a888d1385..3c36eb52e968 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -28,6 +28,10 @@
 		     "xlnx,zynqmp-sk-kv260", "xlnx,zynqmp";
 	model = "ZynqMP KV260 revA";
 
+	aliases {
+		ethernet0 = "/axi/ethernet@ff0e0000"; /* &gem3 */
+	};
+
 	ina260-u14 {
 		compatible = "iio-hwmon";
 		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 1d2b46d7949e..a4ae37ebaccf 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -23,6 +23,10 @@
 		     "xlnx,zynqmp-sk-kv260", "xlnx,zynqmp";
 	model = "ZynqMP KV260 revB";
 
+	aliases {
+		ethernet0 = "/axi/ethernet@ff0e0000"; /* &gem3 */
+	};
+
 	ina260-u14 {
 		compatible = "iio-hwmon";
 		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
-- 
2.43.0


