Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E273CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Th72fDh6nTetvb7OeR07ovitTkbQqC+avS75Ms/0yag=; b=3ekgN43IrvrT6eQ71pH3OSe82b
	c5bbjxuYWYueihJuWcK5b6EEv0OMGupj5dSzcrqi8rhHNxKPnAjnzFPMfJ3UnG7K1NMlC0qNpuBQ+
	V1qVL4u4wAjfCFnqoLlPxUAfAnJRpIVCZbe5NJ0u3RF8HEzugzXlRe8KveJx3/yp7eB0pWOcX6yJ6
	6NpuZbj8X94clkf1YLQvGkPQkIcV1NCSwnkkMjogU/M9N/xQSZGvln7s+aSzKZAXCXcRca1oOyFi4
	pGx59+Jqu5hzRQnaTfUoFcAor9HPrpXpFOdFV1z+AsEAF16/Ie9G7iuBlO5MmaJiR06GVQbF2Bog7
	HyBpLQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbFC-000000094NB-3cv0;
	Thu, 11 Jun 2026 08:58:34 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbF5-000000094JP-3xvY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsxdMacSTFpF78MaQm/2pDXQcLHcq8rZ9kMnNw5yUShlpLzCWe8fJZAGbulh7D8CkTSlAbC0jQ0LfCqO+c73JOSuZ2zMajexRwdDAcNr5sz+mAyvapEKK1QJ7bbiWAX+JYnWqLjsqtCIVhnb5o68FWD/BkaGmsncB8seqgMntpqrb1SA1DTwbX7utCZJQNDNkrJ19EJkN5/K/nV6ySqZ7dR1MFX7eMIt1bWU0WdZ7kAo+ETe+bjQJ2yOZyyun0iSt1syRXg7yPxkiPTrL5oJXWx1tjm71IGyfHXXsh+d2Sd5Bia4rJqMFxOc35AsehwYLlbLjfQHpezq/tFEMpVEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th72fDh6nTetvb7OeR07ovitTkbQqC+avS75Ms/0yag=;
 b=cRBf8IOHeiKkN9B2Vr31vZCF16b4mt4Krf7w+O/gjt0B0A72npRSUQAtnGTCX/tG3KoGVk/72I6j2qcxV4FKZcTCncc1dXnyNoNxq01WcFqaKRfSZShEr7lnxdpC19su9yzFeUkimBLS70dm3isblPGKtaGQtbzLHwBLERRoFIbtfB2nCrAIA/tEC8tIqMaw/f0fCZzUWwF0/1E1aNRx0y5ci0HZhw4VbAcs0kT5tE6uLQFIgKI84LIFhVgNZ1qJ+RuIRqYNjhhqTyR1NnHsjCQeFEjo99p0Xg54eWggbv2Z+yIh7jNeE62/03w3cIiTTRf1sIqFLTU9LlBSXIii8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Th72fDh6nTetvb7OeR07ovitTkbQqC+avS75Ms/0yag=;
 b=hWukgysqCpHBEx+13Zrv3wMOagztfGoda+PZUt492x+nYeEgNvDSGekN2j61/lhtwir13LvJVMYzyQ4uHjIgM5Uh4kvbYXQP+VVLwTqPYS7SHN4JcvcopvDG8/cMP3xl6Wl+Yq5qbm33ifWSYio6UJ74HyYNlRIFxQWcM3Y4Z5U5bbU2vsn/1FfxO+hEPgkUagsOTXsQno0upaqp9YrZMSVePUA0bYn1dU3vmMKeP8M0BKPLYn6U6wi1dJIhDvd1bMgi+Vw92NLtO4/Fx3TUc83EHzi+Mo7EHf1sC/kWYKvo/d8ilf/MJPtiJ8cL996g6BX7Y0y1w4Xd2mUtsIJm6Q==
Received: from AS4P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::14)
 by VI0PR10MB9286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 08:58:19 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::59) by AS4P189CA0010.outlook.office365.com
 (2603:10a6:20b:5d7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:06 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:18 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:15 +0200
Subject: [PATCH 1/5] arm64: dts: st: reorder ommanager node in
 stm32mp257f-ev1.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260611-node_reordering-v1-1-7e519f2cb456@foss.st.com>
References: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
In-Reply-To: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|VI0PR10MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3ac89e-0ba1-436f-5f40-08dec797954b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MefNhrHmPftbgTwA9LZKf+ZDpfGXKBmIV3aoVSvtYL63UOrtskN63bcBlIoervpD/gmabIdKOQ+M+FegKm/6Z+QdEzxfZpE7kObYUTG+4NkjKM0xswQrh7E1mrtdMNCA3aFlN69GgC4O51uVlA2Odr+9FagPyplgUF4s12Y/j3oyI6Da74VoJSXD96lNsl7cOA2H7eBLzlUROpMbXTK48Tr+UdB4ZfckCpDeutfGIRXJTS2rmCu94JGiw39nVDnBNyfea+rLsYzqhfq+NcjJG9Ji2xyJRNlfw1IkWvPczM8oxyl8iJQFiajNhy+wP2wYUxFNN63bLSA9cU5RCdwX2dyMHRUyEU2ePUi8VAuHOsRDtgc7dmZD5BmOky3IigwaQNmBZqMkTz0rX0iT0Yj/4IhHrvtblgBS8nCFK3UjNNdTZETZ2yU3PWHd6npraeh0aUQ4IGl5Ca3R70j5DKtBovNiKfmOC7bVvm/ANbutWeX4juxU7b0sylme7kk599/cOXvo3i5mVsK5YkvG60cgfFIz8QV8cUg9H8eVTH0aDDZyLZENKR7Ki9ux23yvvcGjM0sAij+/0/De4Tdlp53CaswT/RC2NOo/xGc88E4zVLGqkPvRTWhfoXf55HolzuPRBx1ocG38fCMp7UMkcmpX3mPA9qt8E5b4nPptPdj8Qrj09GWa7iJK4mj4rH0S9yMoIIPc1ADPkT67gBLMJU26e9irjtXxc8wlBTfzOU7Wg80=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: icE/X8/ZdD36eoSlEHN8mleaEBTdYhQeNBpwJePXtbOF3pfhLOFaNVrG8cFzCMm55FMftlagnBGkX5+aq5kipu6ABTWgwtoOs/bc5tqaLDzGLVzYdCOXaADZFtnAZkC1Ym8RucKzOlSOS9BcR49ccSg8UX6wDr2elrN0PMGnzfNw/im80a8mTeKntL/QrgM6IF3XibQ9vFLNVrwCK9RmZDynWyftdigBKCCxz0Fefsh+hRB5mxpXjh7DPsghEGIKZbzjj+QRVtmdwSDssM8EwFffKQm2HJAVXnOeE24A2cTtnHQ1sT+8rjNVLZESttGw5MI9HlwfmwX6LMbEtW2ruzpAsJKi18FUcVp+rFFMSHbcQJApksL5wdsqc5r5yd1hlNYTvvJ+yp5BwIQAsYRE9wGbdV1/EShenDwuiZHaGjumDZB79AhsLmU/QRRX0FTC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:19.1023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3ac89e-0ba1-436f-5f40-08dec797954b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_015827_989809_1BCB97FC 
X-CRM114-Status: UNSURE (   9.64  )
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

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when &ommanager and &lptimer3 were added
simultaneouly. After that, &ltdc and &lvds used the &lptimers position
as a reference.

Move ommanager at the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 56 +++++++++++++++---------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..f044331b8b55 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -307,34 +307,6 @@ &i2c8 {
 	/delete-property/dma-names;
 };
 
-&ommanager {
-	memory-region = <&mm_ospi1>;
-	memory-region-names = "ospi1";
-	pinctrl-0 = <&ospi_port1_clk_pins_a
-		     &ospi_port1_io03_pins_a
-		     &ospi_port1_cs0_pins_a>;
-	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
-		     &ospi_port1_io03_sleep_pins_a
-		     &ospi_port1_cs0_sleep_pins_a>;
-	pinctrl-names = "default", "sleep";
-	status = "okay";
-
-	spi@0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		memory-region = <&mm_ospi1>;
-		status = "okay";
-
-		flash0: flash@0 {
-			compatible = "jedec,spi-nor";
-			reg = <0>;
-			spi-rx-bus-width = <4>;
-			spi-tx-bus-width = <4>;
-			spi-max-frequency = <50000000>;
-		};
-	};
-};
-
 /* use LPTIMER with tick broadcast for suspend mode */
 &lptimer3 {
 	status = "okay";
@@ -374,6 +346,34 @@ lvds_out0: endpoint {
 	};
 };
 
+&ommanager {
+	memory-region = <&mm_ospi1>;
+	memory-region-names = "ospi1";
+	pinctrl-0 = <&ospi_port1_clk_pins_a
+		     &ospi_port1_io03_pins_a
+		     &ospi_port1_cs0_pins_a>;
+	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+		     &ospi_port1_io03_sleep_pins_a
+		     &ospi_port1_cs0_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	spi@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		memory-region = <&mm_ospi1>;
+		status = "okay";
+
+		flash0: flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-rx-bus-width = <4>;
+			spi-tx-bus-width = <4>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+};
+
 &pcie_ep {
 	pinctrl-names = "default", "init";
 	pinctrl-0 = <&pcie_pins_a>;

-- 
2.43.0


