Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E09CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zCpLkfnIPuVRZZJcn7+tHHgouN8lV7rK07rn2B4cOY=; b=jCzS7hk7VRcmXQo2vMrh+/URx8
	UO+InihcG0bFpFkF2OAnVB5pvr+c5Ww2nsqGkWsgw5+yzpYDsza9+xD3iiv7+IZbCJb+4sZY2ADwB
	Q/rmex0MQKgCKhdXDYIXi4hSolNj4FbE1RcdLMi1Lu5JzWoA9Da55P7v1P//RoMvgvNp3B+0XnqPC
	yVokHM60WLTLi95UWjUxH9mQwa9ZjGaXc/2GpZzSGWz1QTac08p702udrJYrfah6orEojM0qV7pbK
	3mrC1L9mjzX0CWqJDIB5SgOMVuhg9IGFA3zXxJreY3lCtfS8bddw90lZRT794KPBZGvYppGM0l5uq
	bR1paAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFGq-0000000ATOH-0cCs;
	Mon, 12 Oct 2026 12:36:49 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFGd-0000000ATGV-1iYN;
	Mon, 12 Oct 2026 12:36:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ecy8s533vzofQUcL9J2gFlSghiO7bmm+MlM3qxMOOM/G2rB2dOp2kQvQP6fW77eQwHJ2/doOcVAFVLFoE2ECn+8eNcA23+MrRcTyO1ovEdT8/aFoXTmD4U7iNmuY4V15taOFOi2acbgDIQXrhziN7jzTw0gEG5EN33fAVAJy0FnDSWIAUDy4cR5nPKD4D5MI9fEaQmQ1gaHod74M9QKd+0Owkgq+9gzji/ueFsM3gNPfpo0H2wSv8ewgvn8Btd6/Qltm68uBHKGjjRi9NfwNycfYE10pz8yAHfvksvVlCUT4QjG8/FB+naHcI+MsLiaRqujsCMXU2f1J53zTHtxtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zCpLkfnIPuVRZZJcn7+tHHgouN8lV7rK07rn2B4cOY=;
 b=WPa3knUHJa3q5MqsbQ5buUvMkSmW2/9GW5xEO+Dqf0kcBgyNAYWwMFMAQbHNCYrV9fca4IHQqKU0a2qzuSax0mk57KIfAQMLcMYAsW2QNN2kqNaUDcRYFqpu3/3mD0z5FTor78SqH/W/L0P2DoBJYVmqt/9OUvDEueYZbN7zBI0QMQ+ZJPbJ+/Dw/6tsv6G46iImoHj/mGXoTzBV/yfxh/3aIPEO2Ze2GthbY+z98fecL8s9DyZ+BswqfNyRC3iYzusFgxc5AhV/igQ9bMLgysKHE8JtkgZP2EE1yCvBnO3bcvnIzorV8I5Ishd+p3UEE65yrK63HZUeWJHVIqAOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::20) by
 OSNPR06MB8139.apcprd06.prod.outlook.com (2603:1096:604:45d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 12:36:22 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:140:cafe::4e) by SI2P153CA0003.outlook.office365.com
 (2603:1096:4:140::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.2 via Frontend Transport; Mon, 12
 Oct 2026 12:36:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 12:36:20 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A227540920F6;
	Mon, 12 Oct 2026 20:36:18 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v2 3/3] arm64: dts: cix: Add Sky1 DP PHY node
Date: Mon, 12 Oct 2026 20:36:18 +0800
Message-Id: <20261012123618.648930-4-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261012123618.648930-1-Luo.Liu@cixtech.com>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|OSNPR06MB8139:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d9c47189-2379-4cfa-aca0-08df285d6bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|42112799006|23010399003|921020|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lRbs4UBlG1jK/mkbtSmHIX08ymcuy8//Ed6YNIc5W3w8wzEmCEa2WZ2zoNTYsRqakwjI60z8EE2zKmTc2VZ+ssg1zVX8ACuhirsz0z6AsP6jsb/l9sv8WTiL/Jf8Uss0MnweR8/3Ww/VVGiZYIFLrw3gCcaNv8QAcdDqRZFxwcKGk1rmZQzrr0qg9IRA3rPcLHhgeSXHFiN0fCg2BSUaw8s9mSIdP3Xm1pA9tlZpSVuUVOp0EYqetg3DZpB3wUHFAIduK0GNBQ3vhV+BiT0CPgoufNq4RLoDE1SVPgKXBeWdPF7hsWjh0QJchHz7FvPuakyguc4lVAN10wTlNbUscWOPJ+MrERMNt8Rs5f8ZsWoYxqSkFdC4Bt8do00oWxF6xfxsxDSjYGRihpDTwd9FjOvlpbSLlyj3L8ROMaMN8IVoW7JMrZA39Kz8ERztb0HssFCX1CBZMO3ZUUs6h1SW4rETWWSERHnt7r8r58HTV7C5jkxFI6/rLZB710UW68IiA56AsJhbsI5MwU/a/e4kO6iRYdoVzqCdzBhU4LYYX+lvqvr0e2cgF05CZrhNrzMN9F0cHTdsz876lQX8h6ESQzqp74fbO9qBQ0g4sJlcrGFhkK6EYW+i1+ScF+rvRWy4Y9108utEU2mRDCs8yVkNtZKBtDQj5Sp0U6Nbd6cJYSbteeRWnckrNERJbXy5CnlxO445sBJGcFmV97ooRWaZjvnCBoEy7VrOV/hbvQL7ehkexE2g204IOdCbB4tQMStp
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(42112799006)(23010399003)(921020)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wu3T7o+ybWWmwXKTZ9435hnYBL4Z+xm6QUe0r81hOVYK4bXfVnpDgUir3brrN1iSfgAdh/1ja3VyMyZ/qn0LZP04XGGYOy8pR0bILkfPp+YyimpFs2v+4a+GjnH52w9t6otPPgypKqO0eyCCgN/T5EJbgxxqxe32mJHtdlMWlxk+2SQyW0Kw8o7BjUE+21lvzzkWggCBw9XxZWi1KQsnPGFpuuzCv6WlpVEATqCFHtWi1ky7Ypwu8xTjMnjyNGNWQjbBE00cUJIAAX26eQTqpHx7E7yXEVeJ+mVcm+CkrvvcUy6SS9U/Md4yBqFeVwrA6nt4VhNOtr3DpZtX3BxQeqRqGtnJS3p+kwQG80c0zsbRgZ1iWwaap/PGuohWTSYfg0KeIE376TjnHfXPx9F2nRjksC7dFsSianefq6FniLIJeO5iUfyhq2zYSyZVfWBe
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:36:20.9039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c47189-2379-4cfa-aca0-08df285d6bd4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_053635_558386_4A62C398 
X-CRM114-Status: UNSURE (   8.99  )
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

Describe the Sky1 DP PHY in the SoC DTSI so DisplayPort can consume it
once the controller is enabled. Enable the PHY on the Radxa Orion O6
board.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 4 ++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..b659c10f1f4d 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -36,6 +36,10 @@ linux,cma {
 
 };
 
+&dp_phy {
+	status = "okay";
+};
+
 &fch_gpio0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..33bd2173fb85 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -762,6 +762,14 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		dp_phy: phy@1414c000 {
+			compatible = "cix,sky1-dp-phy";
+			reg = <0x0 0x1414c000 0x0 0x4000>;
+			resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		s5_syscon: syscon@16000000 {
 			compatible = "cix,sky1-s5-system-control", "syscon";
 			reg = <0x0 0x16000000 0x0 0x1000>;
-- 
2.25.1


