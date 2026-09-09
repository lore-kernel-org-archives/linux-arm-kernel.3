Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A983C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eA4tusOFXfhcaiHuyadK4PeOPJJDlwnqDawxa472IaM=; b=Nw3RgMXmrUV2l/9j3yqFdR2YDT
	CzEQOBm19TiNkJNqdmNW130kpfq+O9HHA1o1dGdrOxdsUlwWbNL+Z1j6iu0Lz6cNnXg04Wwac+YdQ
	ikDIUH04YC3q5hYcUS+tbhMQ13Oga/UO8GGK4zOM2ZoSqgP34fNNpO673pYgYkfLuQW5abkQQhXZ+
	n0ka0I9gRPY0VvCGAf/nEk+OGdiUovaAHsR/ukkYZD/3GHhgnuetELQUXq3krwfcieGoi8luAO44I
	56pYAoIxGqfMngRPfA2As0O0/v0zyw5KL027io6dddUnY29CkKrlG2Xc9tGIBaqWxf6PzdpT2ZvbR
	30eChvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DYV-0000000B5Ew-1N15;
	Wed, 09 Sep 2026 08:21:19 +0000
Received: from mail-southcentralusazon11011037.outbound.protection.outlook.com ([40.93.194.37] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DYR-0000000B5EO-41p2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dq4M2IzvyFcjuUnDkf/MhbZ4PbkiS4jRlxxsLBG11qaljngWFMYbZemPFMrmbnFwsRVxCNcSp90BSs6num110vZAtSRN43jgitYb6U46DpSqrxWFku9fSRsxSQuH3/tiT+EsAgVJzbvuejb27ew77yVUvMNm31eO9izWpaGH0igbVmHTwIvZtdpLnSJFPJR8X140I+aQIl/RAg17I8s+Vg4SreNKW35lq4DxViOgpypcaq2TRMBO6RruX5jGVhK2act7EsyubX5ODmKhUuN82WZS3X1yDCZijm/dZ+GKP5enqTdHMEte6xF8apzxL00cAMWxPtjbevEi+WZJtfjmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eA4tusOFXfhcaiHuyadK4PeOPJJDlwnqDawxa472IaM=;
 b=Gf15pgGEjbabTAC6ionl3ILSdsRPK3s+MpmqLAN1ujLf87JwxNCBPI+AGc/dEIQP7EgfU85V3O1SN0fF0omrU6yxre/yWlEIelkOJnWgLBId0jyG8b08Dkb99Ys3h+1plWkHU2NV/xJ9Y0YmUyzvdPJVPia4XXZxOhYMxw4pGAKjw9KerpxU6hqbuSrPEX5YiaZTq54htRp7NiQvaqDSy5mCs1wHGojUNf1uf1biJZN7fWDox5+tyk67Aa/lbEgRhvfTUC0HmgYT5Wun9fHDvXvvXuTx1yQlQAqa+0MNaRwKv4CggHBYBPsuXNWMnEVAxzGkv1q/OUdiuexbrtzudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA4tusOFXfhcaiHuyadK4PeOPJJDlwnqDawxa472IaM=;
 b=C8nRttIzO7qhbM+OSpOmvjtmmyJkOfg5tIN56FY5ALm7iFbxbC2oBRAaZRodueGmobH2qWRtgaiLBVokFrSbfjkBmgzUHcN6k+IFqTW8Z+q8ppNCySEtSWsVr5Se4BX7NtnTiYEzCQt0gvg1zqnweAA/KBMxJMqKYPRkJ3ZUN24=
Received: from MW4P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::29)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 08:21:07 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:303:115:cafe::a6) by MW4P220CA0024.outlook.office365.com
 (2603:10b6:303:115::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 08:21:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 08:21:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 03:21:06 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 03:21:06 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 03:21:03 -0500
From: Carl Lee <carl.lee@amd.com>
Date: Wed, 9 Sep 2026 16:25:02 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: add NCT7363 fan controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260909-arm-dts-aspeed-anacapa-add-nct7363-fan-controllers-v1-1-f84ba4254db6@amd.com>
X-B4-Tracking: v=1; b=H4sIAN0XoWoC/x3NQQoCMQxA0asMWRuoU62MVxEXsUm1MKalKSIMc
 3eLy7f5fwOTlsXgOm3Q5JMtFx04HiaIL9KnYOZhmN0c3OIWpPZG7oZkVYSRlCJVQmJGjf3ig8d
 EirFob2VdpRk6TsGf5RElnGCEa5OUv//p7b7vPyYjzECEAAAA
X-Change-ID: 20260909-arm-dts-aspeed-anacapa-add-nct7363-fan-controllers-0df635ebce64
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788942304; l=3094;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=Q0Tlo+7/FNd4dAozajRjGWzL8Oacu73LQ8s1SIcPens=;
 b=/O63VCPm+8eAY+T49Fw4k6ECeRcM8FZ3murHr2VyY4HgGut+LN5vyyNpnkulHDv7MOe0r9umx
 LnXYEXEe6oIArapev95y4RGX4cQYVCSi8rGPKNXIBbCcnBsAor+CeLJ
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ece34f-a09a-40ed-bf4f-08df0e4b4c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: ebjYRuDM4nzmfUdbyIcZNtLl/ba3wGS0Ab222ET2hcD6hRaapU0+BXsidF98YTDxU6co6E9wzDhykV/KSYVJZ2FqY9UPSJ7CggdnEknqw8YU9KqiEGkwRFnNAHhnMVtta3dFN+XConoWPOTWUX53UHLiKYyv1iOVDRS77DqdtsdrzTZHDiFZOQAgyLUNqaL8zjU/czu+KkVUCctJo9Y8+1DpzmX5u0+dFcWFG8Vg5/Y0hP7jV+Q1S9UjKd8NNxvA+sz9/Oi3l5fG1FJ+xpiFqkcSl8omyfEgu1kgWBaqxHJz3lIkXbdbcHVISVlpAI/XhQSRTdjjC6mZLjJE+FCSKrMoY+Y8cPLQ3lqVGGn9/W4jwP9oHzFuEuY/MN5caMFCZedphXkwSV8Ai5u6rGLKIS96vak/FcNTniCwq44/Xf5Tbl41JsXBHqibeE3JPMFV2uWDPHmvpggJI8Wk0NcwsowVznIOHRmvB9ynS20U53Eaa+8w3Hl85jhc/CmXDAiXDb3BFO1YNzUC/AdRWS0Qo3d0Z7bARKHc0OWTOAoIal3Bki1zxvBfqXz4tYqvMgXIHM47sKUgWX/cRo2FohOt21YGx8RdmhEyV3w3NXbmoH+AZFhCQj5eB2p3mcKogTRSc3jggZ5vejMvGWeqVYjMRFvr13brlxBgj/GwYL/2/E47wt9//1V3eowLZM9+SAFlIVEWmRgdC+cjahyzDSGp6A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D9GWRG9co8BwiyjS38oFxj8YdjIcV9ZFSvm9ezAGRAW+Xim87bZsQXz6HremtQ3PNJYZy8yh6StD8+NyF12z1pgJQzjhF9twm0mfGPc4ybxeohjTumv8A67n7ZZuAeXddLA5jl5eGu7Wt9xznxIjKkn5aIfyTrKODzrx3t5GnotohhTJpAa2tj8Bt4U5Wg0W6T/RNSvnPy9gafWWZPUq6IXZw+lZ2PBv98gKKnV2edrK239MgipwaNaE5+rWqSKHIS6XBRJnWzyQz9NLgr9eBhpUzK9XuUGrggrmZl8vQjv/xeC7z4Gt8wxxHdC7Pv1d/xkUlwqIPFhZfFGSLcCcbejzzUgMVgegpZG8MA1AJv/n9eXDY/fX9XuuMl/xedymcKwe2+cTf45cJW+QNDgZ3D8iBgm9wqcVk1A1Za6eKzODfXaKrdeYlYXzNv3VIMb+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:21:07.3611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ece34f-a09a-40ed-bf4f-08df0e4b4c45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_012116_862787_FCCA8AB8 
X-CRM114-Status: GOOD (  11.00  )
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

Add two NCT7363 fan-controller nodes on Anacapa I2C mux
channels and define their PWM/tach channel mappings.

This matches the fan-control hardware layout and allows the
kernel to probe the correct fan-controller devices.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 1fddf3a5d138..281e226fa2d0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -475,6 +475,45 @@ adc@1f {
 				ti,mode = /bits/ 8 <1>;
 			};
 
+			fanctl1: fan-controller@21 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x21>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&fanctl1 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-10 {
+					pwms = <&fanctl1 0 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-15 {
+					pwms = <&fanctl1 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-0 {
+					pwms = <&fanctl1 6 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-2 {
+					pwms = <&fanctl1 9 40000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+				fan-3 {
+					pwms = <&fanctl1 9 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+				fan-5 {
+					pwms = <&fanctl1 12 40000>;
+					tach-ch = /bits/ 8 <0x05>;
+				};
+				fan-6 {
+					pwms = <&fanctl1 12 40000>;
+					tach-ch = /bits/ 8 <0x06>;
+				};
+			};
+
 			gpio@22 {
 				compatible = "nxp,pca9555";
 				reg = <0x22>;
@@ -549,6 +588,53 @@ gpio@22 {
 					"LPDB_PWRGD_P50V_HSC5_SYS_R","";
 			};
 
+			fanctl0: fan-controller@23 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x23>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&fanctl0 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-10 {
+					pwms = <&fanctl0 0 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-12 {
+					pwms = <&fanctl0 3 40000>;
+					tach-ch = /bits/ 8 <0x0c>;
+				};
+				fan-13 {
+					pwms = <&fanctl0 3 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&fanctl0 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-0 {
+					pwms = <&fanctl0 6 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-2 {
+					pwms = <&fanctl0 9 40000>;
+					tach-ch = /bits/ 8 <0x02>;
+				};
+				fan-3 {
+					pwms = <&fanctl0 9 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+				fan-5 {
+					pwms = <&fanctl0 12 40000>;
+					tach-ch = /bits/ 8 <0x05>;
+				};
+				fan-6 {
+					pwms = <&fanctl0 12 40000>;
+					tach-ch = /bits/ 8 <0x06>;
+				};
+			};
+
 			gpio@24 {
 				compatible = "nxp,pca9555";
 				reg = <0x24>;

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260909-arm-dts-aspeed-anacapa-add-nct7363-fan-controllers-0df635ebce64

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


