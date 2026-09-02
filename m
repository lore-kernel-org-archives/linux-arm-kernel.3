Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72FFC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtrsMB1RjM1MBDhb0CEcq1/Q0Z0cEZH0EfimO8/yelg=; b=ZjFEfyA7hkrtiDwYRj1hF9urEY
	yZ8Ix0NwlSuj5t3IUZfyGY/3mxkpreHnFHuoctOiS6Rs9ObZVlk3gTpT4Qhatzp2us8AqIJ7y1E4i
	Ly1PoV4Nck4Df3HNcg3iG0+J7UnZHJ85PXWs8sD8fRHm8cezHp6DZCeJaJmb2DFMHTcJF4vNGzS7W
	e89jmMPhWuFVJ1wq7GvMkm/PfrIUcEWwZpe0OOdPUillB9WpXBmUM511zCPT1BlOFJ4PwW9PktdZQ
	IUGztuTB2Wq+3sTuJDf4BOjE0HGO6++dIeQnt6hCNGp5cmgXMUi341Jtaohh1S6a2t4VNHjoZcz4/
	kDTFsSZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1i7R-0000000EKyU-3Mee;
	Wed, 02 Sep 2026 10:23:01 +0000
Received: from mail-westus3azon11011029.outbound.protection.outlook.com ([40.107.208.29] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1i7N-0000000EKuP-1AoC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:23:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTw5HRXAkjs+YwcXaHVnE7CIudS48TXZN3Oda7MY866TOWDc/cczUAq/vWdSxkJe4ApxRHMitPHHz6OhaWVIR7tcFCRnof0biMfJg80KrjRDe+IavvH/xNzJqC8fWHaCqF6N+Ofyqbo0A5P79a8diHEW6H6Gq1wbFiKfc/Tboioqb5ntC1CwTVFVZmy8eZ4iqQJyz62rOR1ek6wlfKb19iXgR7tNuwvVoj3ys9apm8sN38ayS5sn/ZQaE4rtedJYsl/TXn0MhUj33fvL7FfT2DMzN2Z1Tpck4R27gyJOnkbefpmG3xIslTnjgOZQ3fYuEIM4D3Gs+m4tohRSDfdQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtrsMB1RjM1MBDhb0CEcq1/Q0Z0cEZH0EfimO8/yelg=;
 b=qPR46KfDN6lEN0dku31CjYI6uNptY/tmaIP7Kf0NVTN6tUllWXPPb67GIPEUIOp+1AojvtOiRvnzA2bEChUGu98yKOCwvRjyEU7HJFR3MFGozkd6jEoU8rRJtIJcHce4SLM+1lzBtfV4c/qVkLs7r5fcEH9aD9rVb3Spffya3XvFYTJk3XVwaPB5smJH/FrchLqLt67+c7wDdhfqG1MQmDKLkl45hfRUO2EwYw3WX2xWBOfBA4Q8FEyczLYEGdeob10W/hcOeVVqdnRD9dnnvVmEH6jLTYwOVx595WIHJ141WwmisLmS4se7vS3V+3x09Yn6K0jbfcw8ERINdbYBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtrsMB1RjM1MBDhb0CEcq1/Q0Z0cEZH0EfimO8/yelg=;
 b=N0/ure5KJ+xTbfkaj1Tf7cSBUFdCA8w+y/nc1AFQH1DA96VPekdZ5Zu5ak0X5+Wf64hmDGUGF/R+P1DD+P31cEaFTKkGVmwHRWzxMkRTAeDeU5g9iQGsy04wmDbE9rPBhN+etiFJexxsvUcYyvig8S59bpyCYdbjtEe2vWO6DlU=
Received: from CH0PR03CA0105.namprd03.prod.outlook.com (2603:10b6:610:cd::20)
 by DSVPR12MB999149.namprd12.prod.outlook.com (2603:10b6:8:383::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 10:22:37 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::7d) by CH0PR03CA0105.outlook.office365.com
 (2603:10b6:610:cd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:22:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 10:22:37 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 05:22:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 05:22:36 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 05:22:33 -0500
From: Colin Huang <colin.huang2@amd.com>
Date: Wed, 2 Sep 2026 18:21:23 +0800
Subject: [PATCH v8 11/11] ARM: dts: aspeed: anacapa: Add SPI flash VCC
 supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260902-anacapa-devlop-phase-devicetree-v8-11-69c8eb2a7cda@gmail.com>
References: <20260902-anacapa-devlop-phase-devicetree-v8-0-69c8eb2a7cda@gmail.com>
In-Reply-To: <20260902-anacapa-devlop-phase-devicetree-v8-0-69c8eb2a7cda@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Rex Fu
	<rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344509; l=1484;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=5PWO7D0zuBpdKoQ8bwidQqu/R+kIa6VCkTBo+x6SPOA=;
 b=+UhpI98q0jfPLZ5nCCcRUBnnuBhzVox+3/HUeBm5+oJGVfXZhKahvarXv+DIwI3saxGW+y6QB
 VUq7+H/ALmUCMO8EY8+9i8m22PXJ6wMEOL3EwBqTVovaQ6L49m1jQtK
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|DSVPR12MB999149:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c702a5f-b4a9-4080-71b2-08df08dc1c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|7416014|1800799024|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: K+YeG8uxN85EP8R/HiOh0SiVzrp+Hd5lhssEJJtsWbr/FkXj8hZbIgixL4E6BB01pDAhmNc3UkdObddFBE/PcF+98lrIvy3h22K39+qy81SolJVh6vouUUVJg6766TnsVVSmw7x6CBhhr4QXlfiKIZm1lugrNR1tS+Hz+TWUE3aZ4CwbV/GFxGmeGVk2fpZXc9AlsdDsGJcvolmVPtWcgXTcYG6+id8/jXVdiwoYAMo2yrfvFblJoYPy5FPvLXzfYM0l2KYHBC8AWv4CmLs5DadcaPt0MYxDyeBYmoXN7ofpY+4uQRZmyeb/JreDW30x1Y2Kn9n/CSy/vatS22uAfEwek95xPcgEm+7kYcatEH73cQdVTQLHOnSIwDTBn3KE2rCswNpy75Gu3CGvTVGFyR//IKihhQAxlMZCE6StRXYH961KOkR6YRXVnZ446uQoW0lgJg8lgPU2Ks4NAqcIRbd3XvQjsRsbLzzN7GxCxr9VjDpeYjGuVi15GvkaSpcL1WKHA7Fd78DwP0FtBAK9J3W1MysBYVTxCgqOeUgSesDZ/EOzwK/RlB4EJSnqbKq2BppgO9Mvfvvk/ns3McMh6ZhrP/6mqwMdJqEbk4wnVOtOqtIctCaueqwF8ZAXrCz5LfLGGViT3FwkuI5ZHX9PC7JJ8wiA2o1W+xAzbN1iBOjZki8bNLumQxxELurZfPEEQMoFzFCRdDsTY4nM9kwyWA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(7416014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +XYB8w/O6S2nqFCTxRATbT/Os3cW9PBlTko1xb5opTApqX2h48ggSGeO7bK3aFfuD8gVihZkNViXxSK7XoPJw6ZRu3rI+hFGLreD/aXlflXyDfpIg4kAlCZATpO5vfZIXkXPqy6TnxloggX+Gg2KGAJHiQ0IGWxcZMd0QS8MdOelER8FUgPbliyWoHoRx4Ch2KWCD3nVK85G/Ny2Jbk9djBeBoLr5optDibCoceppF7dEVmOCyOqzKA11g0sKyTZmRbE3d7dgz+gOcw8lc1XBwIgwYGrw6zSv1jhSZDXpTzzwGjhCx2+wztMNXlUhs3PDL1qGe9MDS4XDlP7pwULGzt5IVPQ/TVeItalYoJ2vrhiKh0x6jOVh0tRr3O1jL56LNpYmK5bwLE/o77KB3SK1rrMlRpQJf1N1cGoEixdgBtKE12iOE9fZzOF/pl7DNcY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:22:37.0264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c702a5f-b4a9-4080-71b2-08df08dc1c4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_032257_334627_80875677 
X-CRM114-Status: GOOD (  12.74  )
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

From: Rex Fu <rex.fu.amd@gmail.com>

Specify the 3.3 V auxiliary rail as the SPI flash VCC supply to
avoid using the dummy regulator during device initialization.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index 5f9cfeec39cb..e429f7be46db 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
@@ -92,7 +92,7 @@ memory@80000000 {
 		device_type = "memory";
 	};
 
-	regulator-p3v3-bmc-aux {
+	p3v3_bmc_aux: regulator-p3v3-bmc-aux {
 		compatible = "regulator-fixed";
 		regulator-always-on;
 		regulator-max-microvolt = <3300000>;
@@ -170,6 +170,7 @@ &fmc {
 	flash@0 {
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		vcc-supply = <&p3v3_bmc_aux>;
 		m25p,fast-read;
 
 		status = "okay";
@@ -179,6 +180,7 @@ flash@0 {
 	flash@1 {
 		label = "alt-bmc";
 		spi-max-frequency = <50000000>;
+		vcc-supply = <&p3v3_bmc_aux>;
 		m25p,fast-read;
 
 		status = "okay";
@@ -1073,6 +1075,7 @@ flash@0 {
 		spi-max-frequency = <12000000>;
 		spi-rx-bus-width = <2>;
 		spi-tx-bus-width = <2>;
+		vcc-supply = <&p3v3_bmc_aux>;
 
 		status = "okay";
 	};

-- 
2.34.1


