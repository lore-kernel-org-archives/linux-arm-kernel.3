Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74533D41D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FGdmC3TrE+O4pj5mdRtlfEFF0vFS/whiIZkS0sdoS7M=; b=iRp4ZErz2KcTxKqSDsZyIdkt6b
	XS+qy7Vut8YUUcl6RF1IOJD6OIWxrqn7jIHt2AfNnq4sOPboWwzHaEIDgGTc9iNa52zshdUORUbV3
	Y1siqqrh67c1fLeyFSXB+3YWkmPGG5Y+tOQjaZWUMwD0zPafJyjF8X6AQ0yVguE31VS+9DB1LzOPy
	ZwA3sAy+5XXJ203io4jC4XzeIQW6+J/I3AXyYo83CCHK21nla1HFYdpGkFF1ETHQexWOCd65QHvVC
	96LUUMZfq5QjPYLoQinXUnAGH/nJw0h6m0awnfLgH96Iw6bz8tu8AUbD3cWE4zQ2GD6OXq14DFVdr
	yunKfMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Y5-00000003EyZ-116a;
	Mon, 15 Dec 2025 08:03:17 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV3Y2-00000003ExM-1fyR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 08:03:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmxDgb9BzLr00edWqjzyB8QqDvA3XQasBMTvgrcJc/Ms4Ll8qo0zXQGwqZmoErPRQUsTHqWLMZQl9sF8sfbkE17VrRvyaEh80RKWYaCrZakAcKTgNViDdqFWu8KF7oxlGjeOmGZWR7iWXGze8pI43265Llk6uoTW7O27q+8d6/YndfX4+8pFEjWPppZbP8AOotiPxV+aETdP+c2a1Ksdtz4TFq451g0ndJekdROpBWiGlwleEjoeLh/PxXRaPkHcrOFhsPgA5Ueqc0oT6t2KXG3QuoBGXnjik+c5hFDycvfxrxGuhF2VUc5IwvYHM/ep4ETnWc2QhgFCXrrfZUSGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGdmC3TrE+O4pj5mdRtlfEFF0vFS/whiIZkS0sdoS7M=;
 b=kfaIYj0jpeSIcLjTE3rpsxUKnnjn/Et+zfCkMDKgMWDeiWZWixElf3BkxIK2cCqU8LS2RfjcHS0NtvsAYqWbTVwsj8SUOAfietg7vXySKy1drymsa9SjdEr7HUGf2oLprgqYe4TXN4amwDTGd62OL5o3E0J732VyTo90DyQ/RR1DDBMb1+8PnebR2BOYjOZ7Bg09xlFhdyLJJxC5htTCZnmztUdGVj114sl6mWUV9ZzGBVWgFgWNPQXtqluy/tEwKox+hlzzcQBk0sm7pNSe7nmiivPTToEMob8zTA806WdnGVvIrgBOsGMedml1titmWo7c6r+UmEE4pU/CFU2fWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGdmC3TrE+O4pj5mdRtlfEFF0vFS/whiIZkS0sdoS7M=;
 b=YMsG2fhmL4DLi0zz7IW3HAD2QBHyDr47XEnDg3JEEa+43NyF0OgWdTVPUP9o+9bw2DK/PKiwjmd7VFAoMP2FjOGTm4f0nWtTs63K+2DqgwddlWPify0OHSgOgz2Kaj81Hs0RpH02PZJczBCHpEY33/XPsCiHKO4wuzIg+3uwMOk=
Received: from SJ0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:33a::6)
 by DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 08:03:07 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::f2) by SJ0PR03CA0001.outlook.office365.com
 (2603:10b6:a03:33a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Mon,
 15 Dec 2025 08:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 08:03:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 02:02:19 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 02:02:18 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 00:02:17 -0800
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: zynqmp: Remove ina260 IIO description
Date: Mon, 15 Dec 2025 09:02:05 +0100
Message-ID: <7e57f76deca9e73be3fcb914aed119f567c9bf8a.1765785722.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4651; i=michal.simek@amd.com; h=from:subject:message-id; bh=LcPwRbHDsR6qcSO7UTZv7wizt4r5xoe2DgKwnHLqqXo=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWTaH6i/Vvk2eJ7qrIl8xTsilTcVKt74dvDVo8k9D1LsH x26aSuzqaOUhUGMg0FWTJFlOpOOw5pv15aKLY/Mh5nDygQyhIGLUwAm0tTF8N81Ze9aqYovwd+4 7Y4FzT718Pqna9KSP482vrmewb47VGUpw38n3sAHfFtPPttTuPDFOr3IQ2ruT2WWzpuoV1lRW2+ SuZ4XAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|DS7PR12MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9c97cc-36c2-44b0-7f09-08de3bb061af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zSwThxZtEZZxTF3LGKvxO/w64hTQZNE3dODp/9sb5OeaYFAWIbQibe28kr8v?=
 =?us-ascii?Q?hA0qA8a1yzZhYhU8Vw/DESl1A8OKf7ebJxZDKziqRWYdJHdR26qmB3+mt73U?=
 =?us-ascii?Q?B3/nUK62g79JCbUyTzJlx2F+nShK7OALBnDFjZfqrsmKhhb8i/to0Mvr3RTz?=
 =?us-ascii?Q?b4Q1FPRfEM7rsk4cP0Y+aTln29NclATEv6C22WrTNLx8yBhpw0BpyEZ3Bc7s?=
 =?us-ascii?Q?lXlpCCTUV9ipf73la4C2vr+wVzF3IZD1JC2royVNI/8ZKJBNrvi7FS/eTZtk?=
 =?us-ascii?Q?qQFR8pdH67y2cJkcsw1XjdLzSMQa1Gs/70Eduupc84PpLKEFBjowGjdmMlaH?=
 =?us-ascii?Q?dxG9LnSnt5sSoIEOPvLNMrIWA3Pd1jGzFa4ld5xoSzMviGj3SWZg04PF97WK?=
 =?us-ascii?Q?I2m8dfiPoIAGPqB+DVc1lbJJ5qew8jwcSMEyEA95AsvRZ7PMJgC1UPIdU+6k?=
 =?us-ascii?Q?8XZkSO0IV4AhxuwRxjFDspPyR7dYnPn9OHonD6KVOfUTY7xjHPC32PZXQDfP?=
 =?us-ascii?Q?SSAHXuK2LqR44/zEPJVJ87MzXBLtvg4Llt4cm2bFfnwJ0mgO1eYn40CYiUlM?=
 =?us-ascii?Q?Z3uR9EYl8m/s9BjTj9WjcbKeRC6mmkBhhDzobU2UuXJnP7d5X5uxmbRcd8Kp?=
 =?us-ascii?Q?6ufldZR5Ify+W/QlXOv4NnPcOr77UBardc2y41V3CGDP81XwtceNDOH7GMbw?=
 =?us-ascii?Q?giCb8PLFEfC+Gxmn/QGjo2Me04/fK3TodFZfZfOJfpKWDYCHA7/XiefK+DpP?=
 =?us-ascii?Q?nyQKQpTfkL4zTANo9EFVkvRtJNxF6rlN7CSwPNyEHF1YJYslp2U7+RCEmVll?=
 =?us-ascii?Q?lqYMcR5QgctS6Yye4eW6sprNDuAP7+mbETagz4UyM1uU5nj8r0sISAbkIQ36?=
 =?us-ascii?Q?us9m6G191uaHm9sJtHnzBT++U3iNwLud24NhVBg3Ldm9mwJ4Loa4a5Wmhrqw?=
 =?us-ascii?Q?jmaBHjxvis9P4l/BfBkoFcIZWPqm29IBo3sIiyalKsB1QXKoNvEMxsAzse9/?=
 =?us-ascii?Q?YvmBGI3yRF+vPnIagTahZl/WYeLbWWmeIJxgmg0tIiPAQCVCg1hQwN4WZ6oF?=
 =?us-ascii?Q?8hMKi4GvJgx1RA+AYgvpj4BkJIubkWGQmdRgehfSE+roNqNQNDIiB15+QwuF?=
 =?us-ascii?Q?fCWD1C3ZpuyCAoaKvEtqSZeADHW1IA5eKlcAfdNNsUmHx8O3XriMmA8jGs7J?=
 =?us-ascii?Q?ueaAwc7U7X2MsikeNQYfaJaO75f0n+3ZzIcuqo2uVv6REQjExnDGKK3W24wo?=
 =?us-ascii?Q?zg2zgu4A2Hv+OW1YqfZ+KjeY5RFJRDwyj1aGO/eOJJpvcMaz9/UWKJYImQiX?=
 =?us-ascii?Q?OIgAPtBsM9VHQ8/HfeTZ6gOCyUNHblSBCbq+9l4KfMUb6FbVg3HIVM/Hh52b?=
 =?us-ascii?Q?f6Vsol0z5RaOi4e5M0YogjanH/+T6co+/WJNG0jbviu+KmY/0eKUKpQNDVsN?=
 =?us-ascii?Q?QWH3eQNOKKfj7Gia/xdVXtYgCHOXbhcutzU94g2/ISXCU2G5+2th5pzM25UC?=
 =?us-ascii?Q?qLz8zhWMfOFsiwX/9a65OmTei640Z/Ic6iFBx3iDC6ahKiEZxas8cTOE/TK/?=
 =?us-ascii?Q?4KBQT1eHerjmCEtIrAM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 08:03:07.1274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9c97cc-36c2-44b0-7f09-08de3bb061af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_000314_449954_0821507C 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

Kernel has only hwmon driver that's why there is no reason to wire iio to
hwmon converter which was describing out of tree ina260 IIO.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

Upstreaming of ina260 IIO driver was tried here.
https://lore.kernel.org/all/20210322105056.30571-1-raviteja.narayanam@xilinx.com/
---
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso | 6 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 6 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 6 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 6 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 6 ------
 5 files changed, 30 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
index 02be5e1e8686..832dc5ab2458 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso
@@ -26,11 +26,6 @@ aliases {
 		ethernet0 = "/axi/ethernet@ff0c0000"; /* &gem1 */
 	};
 
-	ina260-u3 {
-		compatible = "iio-hwmon";
-		io-channels = <&u3 0>, <&u3 1>, <&u3 2>;
-	};
-
 	clk_26: clock2 { /* u17 - USB */
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -67,7 +62,6 @@ &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
 
 	u3: ina260@40 { /* u3 */
 		compatible = "ti,ina260";
-		#io-channel-cells = <1>;
 		label = "ina260-u14";
 		reg = <0x40>;
 	};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b92dcb86e87e..b88efcce0162 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -25,11 +25,6 @@ aliases {
 		ethernet1 = "/axi/ethernet@ff0c0000"; /* &gem1 */
 	};
 
-	ina260-u14 {
-		compatible = "iio-hwmon";
-		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
-	};
-
 	clk_27: clock0 { /* u86 - DP */
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -95,7 +90,6 @@ &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
 
 	u14: ina260@40 { /* u14 */
 		compatible = "ti,ina260";
-		#io-channel-cells = <1>;
 		label = "ina260-u14";
 		reg = <0x40>;
 	};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index 99ad220d13d6..817797b21679 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -25,11 +25,6 @@ aliases {
 		ethernet1 = "/axi/ethernet@ff0c0000"; /* &gem1 */
 	};
 
-	ina260-u14 {
-		compatible = "iio-hwmon";
-		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
-	};
-
 	clk_125: clock0 { /* u87 - GEM0/1 */
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -96,7 +91,6 @@ &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
 
 	u14: ina260@40 { /* u14 */
 		compatible = "ti,ina260";
-		#io-channel-cells = <1>;
 		label = "ina260-u14";
 		reg = <0x40>;
 	};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index d7351a17d3e8..923a70d750bf 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -32,11 +32,6 @@ aliases {
 		ethernet0 = "/axi/ethernet@ff0e0000"; /* &gem3 */
 	};
 
-	ina260-u14 {
-		compatible = "iio-hwmon";
-		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
-	};
-
 	si5332_0: si5332-0 { /* u17 */
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -96,7 +91,6 @@ &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
 
 	u14: ina260@40 { /* u14 */
 		compatible = "ti,ina260";
-		#io-channel-cells = <1>;
 		label = "ina260-u14";
 		reg = <0x40>;
 	};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index a4ae37ebaccf..563e750b0e08 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -27,11 +27,6 @@ aliases {
 		ethernet0 = "/axi/ethernet@ff0e0000"; /* &gem3 */
 	};
 
-	ina260-u14 {
-		compatible = "iio-hwmon";
-		io-channels = <&u14 0>, <&u14 1>, <&u14 2>;
-	};
-
 	si5332_0: si5332-0 { /* u17 */
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -92,7 +87,6 @@ &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
 
 	u14: ina260@40 { /* u14 */
 		compatible = "ti,ina260";
-		#io-channel-cells = <1>;
 		label = "ina260-u14";
 		reg = <0x40>;
 	};
-- 
2.43.0

base-commit: 138cb5c1bc67058542ea83109dd6e2d0d2451528

