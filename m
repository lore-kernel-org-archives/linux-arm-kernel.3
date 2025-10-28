Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B5CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 21:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rABTTFZBFQwtr5xis7+txKec9oflYXcMtuYAQcXsFuc=; b=NL0LvC5b+JPU+uVPwpQAck4sOm
	6qa5hFtluMnRZ8cZ+MGaUxsVyjGPSaiwzqqrFY+v2IYOJr/8oYDaHRM1HgjDvPQZ6023JD4ozSFZE
	CVECp40Ekd7yulEJjQDKfMC436sjZXGdixsdhjxRxfTbt9vXeiuQq8ai7yNsPGgeiRklgK1LS2ST+
	a6cCcGDhkT+QrVmuevzv2wFis64eqY+EN10ejCH42h/DvWIaI5qhiahnt38YW7aVoBq6GQdg7jVth
	zNBw+T9znJyms8iUDYggf47RLbdPDpzPtM8d8icxTxEJY4gHVFfjw1QDv4Oav0HMHES646frtq3tM
	t32J4xFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqqf-0000000Gebc-20D5;
	Tue, 28 Oct 2025 21:03:21 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqqc-0000000Geb6-0yan
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 21:03:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKrClS6lBhJco/2jhJfJ+41rtl1Cq+qPWOyELAY2qVAgqvmJOwWILExNLPJOqWaW3Wfy7PG16ZeOdb5mduAP70QIlxRRM3miq/kg+LL2VzXRhN9B4ezEOqFioFHIacQi8xr2/E/lRBlskhNm4hNXSxDBWbuKVTTOQ1uMWwwqaD8VH9ml4J8iSWMkEQMyZK+dOWonUQwvp9FHgapvcdKzbKg9rGKQn0EyV+SKAQKjIiN6QV1iHMXv/+1/ukaNnSDB/A0RS8jJCsoOWHbp1f4l0RXhwJGk2ioMWkiD8N5yNtNpFByn0nY/b8IuMnPeDwdkMl/YFL8yYCrMR/rlsyfpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rABTTFZBFQwtr5xis7+txKec9oflYXcMtuYAQcXsFuc=;
 b=tXOPEo7DVdL8/feAoV4vbtlwhTDBklmIHCA20M/h79zm7rN7JwAhLSwoEHm3t2vju69lPwlnb3BVV5uo97Tov6LhCntaEM8ryxvcSnUhI8BHp19GmAmapm1//xnLDnEUuHc4WWv1kSjkBWUdAAQhEoACJz7tn60r3Omj9MtYvUSlfl7mEdfGXEBZ4oXI3K2iJ/Z8yv2XVvTYaKAQa3JpHD4Y/2OTk/eJVFmWfDSsGbyObWH7tVKwDuFYFkdxA9pYjlWuOcYR/r/akugUSXikbTYTQedJuZf98MHfOJuAvRAldB0sMQJb/BDCN+mHNAtegNSxWEqHQpj61dGiLjcPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rABTTFZBFQwtr5xis7+txKec9oflYXcMtuYAQcXsFuc=;
 b=XdRhQw/uTx5gmZcz2VSJDQB1yJ+qM+smUlR0h76t58QTHaV8HADSpRyqekm74wdz1WlRkCYGupdWf938JVQq3VltakjfwcIv86EqcoDQalA2itVdpBD9+WVooM26/4AlBEIphQ9p0N4hkpC2ORba+FpIcWhv5NtZhwzw2nj1bEE=
Received: from SJ0PR13CA0150.namprd13.prod.outlook.com (2603:10b6:a03:2c6::35)
 by IA4PR10MB8520.namprd10.prod.outlook.com (2603:10b6:208:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 21:03:07 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::e6) by SJ0PR13CA0150.outlook.office365.com
 (2603:10b6:a03:2c6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Tue,
 28 Oct 2025 21:02:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 21:03:05 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:02:52 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 16:02:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 16:02:52 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59SL2pPm2932959;
	Tue, 28 Oct 2025 16:02:51 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
	<s-ramamoorthy@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am62d2-evm: Fix regulator properties
Date: Wed, 29 Oct 2025 02:31:53 +0530
Message-ID: <20251028210153.420473-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|IA4PR10MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd5134c-648e-478f-2422-08de16656403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34070700014|34020700016|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hnWqfLjf3fQyRP6CceHZrHSvWgQ/Yd3UFjxeB4bLo+rl0ptzonDoI/nM2ryr?=
 =?us-ascii?Q?BSUrrdoKYia+gVjGH+/EgvcXWHLi/EwpWebyOIxzN3QjaVIBEjRY0k3Ehp6T?=
 =?us-ascii?Q?rQM2/3xKxtrBGRLspHoOyR3Vy8eRQSyr9vlNl1ipMpdOJ7VW6Ohevw2ZLHYP?=
 =?us-ascii?Q?PrgQoWE3xQkLfXefY3aOq77oVhEBgF9nAGIoeO3ku8r9w/Mc7AwY5Mq5ggZg?=
 =?us-ascii?Q?DFdgOmb5EBGYpCrUWGd+HV+0BkPsureyI7NGvTb4cb5U/3NcCBN4VUFwNUvQ?=
 =?us-ascii?Q?iQSdbYNq4kKvt+OpNFsQA6A+S+unWDDmOeCdNzQC4GyKmhjOAP4mIHRksSTK?=
 =?us-ascii?Q?lDBGrysIl2EJLRpnMJvft/mxNQfsrhbiqmEro/vD/pBDKolRdo6gMzIrwDfL?=
 =?us-ascii?Q?b44fymZ4nDsbRFVh2yn5nEXN6jZ9wiLvdOkbccZCV5A2OFHbWia0z+qv1ylj?=
 =?us-ascii?Q?wwxVaZKy9ySYDYE6oZ7/tXtvgOL0ud4j8hjszbtHQXmRXy8+KPNOclKdzG8X?=
 =?us-ascii?Q?5NsrmaWyWWLj54EqUqunvZmqzhLv+nEAijvvmckIoAUS8pxunQ94xPKJitQ/?=
 =?us-ascii?Q?vk1o1CazeA5EvK9e8my1v84eBMB0KSFv+Oa7mVHfzYwdylcf43cR26RRNcTX?=
 =?us-ascii?Q?gS5IDIjQtLpr9O9HUnp3oBYVBP71tPYANNxXjkhmHpTquolTUeHEnOdSgvky?=
 =?us-ascii?Q?Z0x7bbFZnoFw8aJrshjAdGyg1ruPRV4LE8ssV6QwwUcfzIXmvg23jULqvhpT?=
 =?us-ascii?Q?dBV0Uf8GqMAJDtWU5oREU8u2K2L4aiG/jIXalFKUBbluGAcRbQ3zsHZtdxcq?=
 =?us-ascii?Q?/iER4/XZfkNfSpw7Qs4eakDGfjlWXrs1JAG8Y3Vec+nc/KfhsKz3UkoNQYci?=
 =?us-ascii?Q?nBtKqlvItg+wua8xk0aNNRGY8qI/stuO5aK//yep5rDr0dT4rwyK5TAwLf1/?=
 =?us-ascii?Q?Xzo1yK/SVcQ9a+sfI+5DQXuTssrHH0nuMtUF/TVwrPB2u2QNIFBxTALRCaAv?=
 =?us-ascii?Q?xcxWOvcKp8QmBGscFmq8DYsSyNTSMcRCNbPewt4nyxKbhlLBkkxkIy+J54pm?=
 =?us-ascii?Q?vtrUmCa/3xuLip/xTbY+rgD42jGVpAxoUsihH7VYBA8ZMH01EazZhOkJFMvz?=
 =?us-ascii?Q?jd3cskNWczFOET7gTOvayMm/Lmj+kRqMNaEW6TtB0CnYNVRwk4D003ptKQU7?=
 =?us-ascii?Q?G2D2BGjwfbENvg9L/wZQtzMbOGWyP67Hl+oAIL4fvAuMC1L2vCjP0IwzfEKU?=
 =?us-ascii?Q?hAyedNTIHjj09g8fMLEarrAPwB7LG9RqTIdmcf1/y9FcRXZVdSaitHxkvlGQ?=
 =?us-ascii?Q?3WJPwDqmOjfwzPHGJC/5KNPdYt8gXEaBqB0jDdkpZV0CPGJ1tVKW+jbweRRA?=
 =?us-ascii?Q?NO6FToNe4YO+SZ57axGPGNzfL42dQ5Ijw7GFCzuECHCia2SyQxFpRMQt9F0p?=
 =?us-ascii?Q?/klcpY7ifONJ844eXqDJNRpDpsok8yLzOojd4AY/OiCQI9rcz+v5Wo15uC6l?=
 =?us-ascii?Q?zpeH6Ci7jqpyrFg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34070700014)(34020700016)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:03:05.7510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd5134c-648e-478f-2422-08de16656403
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_140318_416858_FA6F06BF 
X-CRM114-Status: UNSURE (   9.72  )
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

Fix missing supply for regulators TLV7103318QDSERQ1 and TPS22918DBVR.
Correct padconfig and gpio for TLV7103318QDSERQ1.

Reference Docs
Datasheet - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
Schematics - https://www.ti.com/lit/zip/sprcal5

Fixes: 1544bca2f188e ("arm64: dts: ti: Add support for AM62D2-EVM")
Cc: stable@vger.kernel.org
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Reviewed-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
---
Change log
	v1->v2: rebase to latest tag and added cc stable@vger.kernel.org

v1:https://lore.kernel.org/all/20250916090736.2299127-1-p-bhagat@ti.com/

Boot logs
https://gist.github.com/paresh-bhagat12/9a4a1aec5119ceedb386743921432c91

 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 83af889e790a..d202484eec3f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -146,6 +146,7 @@ vdd_mmc1: regulator-4 {
 		regulator-name = "vdd_mmc1";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_sys>;
 		regulator-boot-on;
 		enable-active-high;
 		gpio = <&exp1 3 GPIO_ACTIVE_HIGH>;
@@ -165,14 +166,16 @@ vcc_3v3_sys: regulator-5 {
 	};
 
 	vddshv_sdio: regulator-6 {
+		/* output of TLV7103318QDSERQ1 */
 		compatible = "regulator-gpio";
 		regulator-name = "vddshv_sdio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&vddshv_sdio_pins_default>;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v0>;
 		regulator-boot-on;
-		gpios = <&main_gpio1 31 GPIO_ACTIVE_HIGH>;
+		gpios = <&main_gpio0 59 GPIO_ACTIVE_HIGH>;
 		states = <1800000 0x0>,
 			 <3300000 0x1>;
 		bootph-all;
@@ -334,7 +337,7 @@ AM62DX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) UART0_RTSn.GPIO1_23 */
 
 	vddshv_sdio_pins_default: vddshv-sdio-default-pins {
 		pinctrl-single,pins = <
-			AM62DX_IOPAD(0x1f4, PIN_OUTPUT, 7) /* (M19) GPMC0_CLK.GPIO1_31 */
+			AM62DX_IOPAD(0x00f0, PIN_INPUT, 7) /* (Y21) GPIO0_59 */
 		>;
 		bootph-all;
 	};
-- 
2.34.1


