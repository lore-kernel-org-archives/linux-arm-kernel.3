Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FFAD6ED0E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xhROpGdcI64w59w4qMvXT3M7cVR1EEIilBuP6tLPXTc=; b=2XDk/51iivSjARxZN8Q1dAHfE4
	CNnJZaiymI6Pdp22S7/n5dqlR1xbzUomWP/BKNsG8A6HjGqS4a1fWvQZ7bjmZBvTBPLT0q8DY6ZU3
	D+yB0KdPV55J3mUO29Ipa1HXP+SwhWgxR6UJaIE7FN0bzP3+h35oILdeCoZTwL4tEcjyNhzMK9fSx
	weAyqAC/VGDKeUaN3OSI16/V4hdsjKzv8sWtLoK+igrDi818yrjjil8nDXUFi65IV/ohXULFo2Gr4
	TjohLFfS3ZzKRyhD1S6D1Sz7SLcTZ2wwxwq+3i/lJVQDF5hAbCP76dMcO9MmpaflQtqp7wh6Uaa/r
	O64gX6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5U1-0000000HUzv-3gk0;
	Thu, 21 Nov 2024 11:36:25 +0000
Received: from mail-bn8nam12on2062c.outbound.protection.outlook.com ([2a01:111:f403:2418::62c] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE5T1-0000000HUno-3R6S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 11:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPYcF9TVS2ioNqOnV+WcPaKhYU4dild4QNnyvjif2SyeyuBYg+1VyosKnssB64sC60FsU3TdYlCq8BESQMT7QEsRRuk5Mf7WD334fGIospXCSsYkjI3HQkj1FDPrUpAtvh5G/zAocaz+wOdcIfknvm0xb+u6hkcrIBv5XE1UB8UR7xey9esWC5w6OGu4aN/RTF6H5np7gdmFogTJzQNRimluKOMwevDJn32Czm7PVzC/0OJfJrXC+VPl+XACAljj+ro+I0OG7K1TJkaYmmCR3lG0ZdE8ZnWG5KLs59VbnCKDy1VqPpBueOCE6KkiwjxwjjBn6o1EbzYbZ75D9vk4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhROpGdcI64w59w4qMvXT3M7cVR1EEIilBuP6tLPXTc=;
 b=ZLiQPUgqdMMZerp2TFbI1y9Je4X0vbYWwc956YyqbnvvfgxB0Un7lw7ZAR6rVDFe09gYZ0iohrskny7Qx6pB+m3d6O0DosRf6RbycVBdwxEQMFh95iZRAe6DgbAEHTFhufVzQ5JlCes5F+W1P5P2AJ93m9J2jftZnakTg1z1PV5HUyw0JWf/sG6DoxriTU2d9yzyTnCxjCAyZUTCma0EHyutfZvotPu+q+5A/q6lK9k+RCnEPDg5X0lhSwN3Vh3p7BYPks+iwoLojCAQwvkyIzt5PSzvceAdwZEI9i3QsnLcBHtiJpNCe86lkSLMRp+nbjuL4kIna3d4WuqMLSvAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhROpGdcI64w59w4qMvXT3M7cVR1EEIilBuP6tLPXTc=;
 b=oXNVZvAQZFU2NrpCf3r4YmJl35Cb6W0jeCOvmE9BKpD3cE8KW2JVrThZCdmxFwCZgdGSDTP/nuAEbNq7FAqlWF+klZZACBhXk7IZKiJO1UCrIdAE71/eL4UddVxK9ov72FjWbYQVwQfsuFDphA8+10MeNAYBIV87z1E3+Ld4BKU=
Received: from PH7P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::30)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 11:35:17 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::3) by PH7P221CA0022.outlook.office365.com
 (2603:10b6:510:32a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend
 Transport; Thu, 21 Nov 2024 11:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 11:35:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 05:35:13 -0600
Received: from xsjwillw50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 05:35:12 -0600
From: Naman Trivedi <naman.trivedimanojbhai@amd.com>
To: <robh@kernel.org>, <michal.simek@amd.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <senthilnathan.thangaraj@amd.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: zynqmp: add clock-output-names property in clock nodes
Date: Thu, 21 Nov 2024 03:35:12 -0800
Message-ID: <20241121113512.992747-1-naman.trivedimanojbhai@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: naman.trivedimanojbhai@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 990e53de-efe3-474a-e2bf-08dd0a2092e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sFphxO3MDgo39/9eRyWOVG9bH02QPuUmLqxLJM12Q7kj14blNbjPxkih1Eb/?=
 =?us-ascii?Q?uwea989QclwQLwwCi1r7wIY8+JsglLiaRxhpDt5hWBq6oIyBZMBya4NEeFN+?=
 =?us-ascii?Q?iWH7LakyIZHXQ13HB89sFHmlNQmBxe2AIUej3Qt+Cy5269b2MIsVjeJqR40I?=
 =?us-ascii?Q?HBkCfjHjKe57l3B54BBtPS/YCzuKXfzDyVrwbdoEXvpgYRH1SKC1LTIyLRJU?=
 =?us-ascii?Q?jzzXX+QflHFkmyzeu/4QwZXn5xCqoar68CksBvfOTAMYvh3LQ1QDP7lnUhvq?=
 =?us-ascii?Q?8cdp9zIaWFyfXHfW10+B5Kmw2sZyqGNeqZWJ+X7RyIDF/H+kFvy32cGV0DhH?=
 =?us-ascii?Q?zqNJF83ZxI5w7v5F/OeZToDr9MqQMnwd1wOICe0wkPQjRjxmx3HBErOmtAvO?=
 =?us-ascii?Q?1Mxv94Xry8p29erzKW1ps2IKWALGXG1SN+mv8C++hIodl3olq/G2Z1VRa2IV?=
 =?us-ascii?Q?9/yQ6TZ/JwOQfpGQse9BheO6oATEiPsPLWWyH675oyV7nLDrPmeF1BJS25o2?=
 =?us-ascii?Q?zttfnhpbgCBqEyfccJvid1HuEcDLV5h7KO47kb2Z8+z62JPj7tTiiUNFTKX3?=
 =?us-ascii?Q?NpgD5Ex2Y7DjLbhICof6QclixGX+LN4GGSCnF9H19iqw0fAdBaV9pLe6XzMn?=
 =?us-ascii?Q?VkMgQXznFIQhGzYV3vBYZLc5Z/EFVbNFOeEv+4BYk92qqjV30ZMxffTNNvSN?=
 =?us-ascii?Q?o24rvY47S81aHL2SmhkBfTqJKrf9Ljd51UEoKOe8kBw1ao+aJWdfODwJhPfK?=
 =?us-ascii?Q?mVpEP7pF8dWp5AOHoWMp8yQ9lsjLINZM42LODGgQIC7mza1cPeQVijh5NyLm?=
 =?us-ascii?Q?Mhq9EGkrkkVq5p3TL9WA8v3HCz8SgIVQVQStAiq+mpncaWNsf0LyA8Dd4+++?=
 =?us-ascii?Q?zRXvWu+Ltq/V9ddWDyttHH+oWYIDJy8Fs+k9qDGEl3dRD4vxbZ9OEzn1nxZE?=
 =?us-ascii?Q?yTRUgfLm9aNjbV0LKtTxh947lnHZUqFqKrSf4qe4gtIRZRYgPK7aDDyHA63s?=
 =?us-ascii?Q?e+iYsjCb1VkEIN7HlsqPRGNJBbpjyq/BJgo2YyVr9mipzFv+Y7I/+Urd80hC?=
 =?us-ascii?Q?8wXkja7CjtmsTIU4zkf4AEKM24sNDnAA7I5uyQbtrvko36g3YSK/gWcUwH7y?=
 =?us-ascii?Q?f1dGTWGmSRJbenc+Jnrvd8NxQOv5f2VzYGs7dIlSpqBhLzGX9xNL5OhQAitM?=
 =?us-ascii?Q?TdHJR6bzIk08G3vlzPtp6uxxzBBVcgrQqx1kzVt97FOQZPtYentaxrFZSf9L?=
 =?us-ascii?Q?NiQdXJCwHfepdmnMKO5ar7jzMwR9v+tQlLmGYUlsX+NFhxyoxI7CnTw+GdZC?=
 =?us-ascii?Q?qiFbt4phxps+Y+5uSVVmGnyVWRtGE2Rzhx9nxWitFQRdg86HDfEwwrHORkcz?=
 =?us-ascii?Q?H0cFsWNPp+sv9PznVebdGCWCSau/Q9KedSPeNH4oJY/L3kNW9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 11:35:17.5311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 990e53de-efe3-474a-e2bf-08dd0a2092e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_033523_939953_97666BA1 
X-CRM114-Status: UNSURE (   9.78  )
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

Add clock-output-names property to all clock nodes, so that the resulting
clock name do not change when clock node name is changed.

Signed-off-by: Naman Trivedi <naman.trivedimanojbhai@amd.com>
---
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
index 60d1b1acf9a0..a231122002da 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi
@@ -15,6 +15,7 @@ pss_ref_clk: pss_ref_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <33333333>;
+		clock-output-names = "pss_ref_clk";
 	};
 
 	video_clk: video_clk {
@@ -22,6 +23,7 @@ video_clk: video_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
+		clock-output-names = "video_clk";
 	};
 
 	pss_alt_ref_clk: pss_alt_ref_clk {
@@ -29,6 +31,7 @@ pss_alt_ref_clk: pss_alt_ref_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
+		clock-output-names = "pss_alt_ref_clk";
 	};
 
 	gt_crx_ref_clk: gt_crx_ref_clk {
@@ -36,6 +39,7 @@ gt_crx_ref_clk: gt_crx_ref_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <108000000>;
+		clock-output-names = "gt_crx_ref_clk";
 	};
 
 	aux_ref_clk: aux_ref_clk {
@@ -43,6 +47,7 @@ aux_ref_clk: aux_ref_clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
+		clock-output-names = "aux_ref_clk";
 	};
 };
 
-- 
2.25.1


