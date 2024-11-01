Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E6FE6B277
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJZ+PJLkNKLJyNtWJ1uZGnldcA0XefQZHaSjcPMw0i8=; b=p/r2siADef/QW78PhsMXquTTW6
	2TkL4VyD6trfL/1Q1wUrlwbS1pU+y4GY/dUPLimyID+MuWzYyBNUFtvmrDoChVy6VaGC6UOVXv00G
	0yYO+nnF8gWmb0i+QnqxX6dRjkpYZE/5IPvUdmf7gcm1PnR80crBE8WZI3KiiTHxFJNh3tTk0I9kP
	C6rIAFTGv41vem5qRmGPNXm0IHAbVRuKO++vVKoKcR3lpUadXV/ldbRHe+mPmbtBL9BU6MkyspZQP
	2WHb2LcHWqPbVRGqLvrpMOfh4UJ+KkX01Api50e7fnAmYbZBRXFKRnYYCu7vUG9oLEv612VwqyIhQ
	oGD6Ewig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rVz-000000078zA-03iB;
	Fri, 01 Nov 2024 13:16:35 +0000
Received: from mail-db8eur05on20713.outbound.protection.outlook.com ([2a01:111:f403:2614::713] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rUG-000000078UP-1Hdq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:14:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcxrpbzGWcz7J600PiZBCmNILfhL/gRsUu8T3+OBqXr54QPnTpizyasooJ7JPsDMDjSJySBo8bmVRsLJcXaB1hFn+8TALq5oRQyL0mEW/OhKDOy/Ir1OywVWzrSpibWKbPA0ZIkwLpj+K+iFLHaVlf3T4MR+QPEjVRzpzxgthKzVSuH0RHTISBoxJI+FiWk2r/g+sn87Wyz/C6ywgcuuCUiHCaZ8cXQfz19yhyM33Y/i5YoZ2EExZbfRDlc/l25hDROua3k4VwLMUOh1hpK4rddxHA31mrgteB+8ATrDvv2ve7dhYYj+yObqllxoGI+N8SJeAbVZBYAuFpWxyFHDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJZ+PJLkNKLJyNtWJ1uZGnldcA0XefQZHaSjcPMw0i8=;
 b=HCSrG0lI7OSKuNTHG+cRTFbVE67+/0s8k61Xirg5a1aOpfvO3AF6fJYVRXf09tDEk7Wd1easAmQioVtUvMUhv1NfGiLgTwg4lJeEAxkwwtX6stiXb/lpPPFZdb+hmoo3i7OzJulbkIb9viaaCO16Qb1p8tXAidA6ewynTTxvPMSbfCbpUHCxdz7Fu1bgnFUKjtECXhk5p3hOlslYZBiojf4Oadlhy0rGsSyEKwRKKrADhyMX4RtE9jwVHfJEdkuJYJgkMwtlul/FdLwqkwONbZs3qOoopJkGhsdG8zKTVnaYofDVBYuDy2fn5kbQfiBIjOFfQypFp4DFHk77tNzJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=none
 action=none header.from=phytec.de; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJZ+PJLkNKLJyNtWJ1uZGnldcA0XefQZHaSjcPMw0i8=;
 b=PQWohHxKDXOfG5MI1zzKz/zIcYl4aJFO324ZfpeaE8ZqUruXaDbejC6ggA3GV0uyRh0GJcPnEjmBfCHSKtbBouijVqfhQn8hOF12mZjEpRX2oL/pWRWeW+ath+81tWNbMHjZM212kR9l3CJIhytcmleVHkSfyqYQdBMpy38PRt4=
Received: from DUZP191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::27)
 by AS8P195MB2213.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 13:14:42 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::44) by DUZP191CA0010.outlook.office365.com
 (2603:10a6:10:4f9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24 via Frontend
 Transport; Fri, 1 Nov 2024 13:14:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 13:14:41 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 1 Nov 2024
 14:14:38 +0100
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 1 Nov 2024
 14:14:38 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <upstream@lists.phytec.de>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am62-phycore-som: Define vcc-supply for I2C EEPROM
Date: Fri, 1 Nov 2024 14:14:26 +0100
Message-ID: <20241101131427.3815341-3-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241101131427.3815341-1-w.egorov@phytec.de>
References: <20241101131427.3815341-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|AS8P195MB2213:EE_
X-MS-Office365-Filtering-Correlation-Id: 3315f4d3-db6e-4ddc-6863-08dcfa7725b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fiY7T3SVECv7+G05tFx7PEkCMATkZ2zvl9BgaMLRUitU4MRlh6rKQ/kHJ2IE?=
 =?us-ascii?Q?sODIGhMfdX/XX75aQ4veqYdVrJLtBTnGUELTeMjmhZ+AGEWq+iBxRAtUUC1i?=
 =?us-ascii?Q?4vL+eVSaSBYg96GbCh5A+OxLDhF+zEAY0592U+boj2dxjpZnNnaflj/moWsr?=
 =?us-ascii?Q?UShHoC09jaZOLqsB1Kpgcz0cjok507up1tTIWtdgJyBXwJFUxs7q0YURgigE?=
 =?us-ascii?Q?nTAcBYEKJdnMlkVuBWi6fC9YHdKHasm+QOFmmOjis80e2DKIj/3TsQSMf7B1?=
 =?us-ascii?Q?41Xi1BmtwUuF9DxW1GBg+Ez9OvsbZ6Tmrptpb9QAmqKyvsXLN3tnm5wsZiba?=
 =?us-ascii?Q?6+lPBcOTkGqarvZsd9Ww4XrHY5xgNNgcWygbik2tJmWyWd3t1RlN3pUnQfyw?=
 =?us-ascii?Q?RH2jaQO41sqZqt92CLM1WxMkcAWYIhBSmShpE72axv0rG/ifBBimyO3BVYhq?=
 =?us-ascii?Q?jkWsf/J9MVKuYA9fc8W6mN2nWCm7IckrIKvFkWeqxxCkfu4bbIjZAwW6oJ3s?=
 =?us-ascii?Q?DCzW6SIB/YJtHPNPDmv082aQHCnAvGUJ5aab1cOYHJXPL9jKvENSfbhzFN54?=
 =?us-ascii?Q?Ch/DEJa5JdHAisVA1vGeDN/YVROOAPEGD3FjWuAVBd6yJURd3Ym1PbrTpPD7?=
 =?us-ascii?Q?bPoGSFEgx0Spm00jx7X7MjBGP5HEEtOC3/F1uYuOS5LwruPqQ54QMMXd2FLq?=
 =?us-ascii?Q?VB9CIizDZbNrbSwUALQmGAWlrFRQ0MVbdVHNcle0zt3tjgnqkBQG1YW42Oz0?=
 =?us-ascii?Q?7LD/0qPM5vJTMQzZx5l34UNmPy8rrGaN3yW2zNxnTSfWNKOJo111WRp9ev2H?=
 =?us-ascii?Q?D8h0dpUTcB5zkN0QOpGPRIqUtUFrG2pqqs5j5k/u8HVF1Yj6kRTcaz9xtq84?=
 =?us-ascii?Q?ga5qVrtFlyJUqeBuFGyjoxRMMIP2kfUsHQgQ9jnFTpz8e2SFs0bCbPg827MK?=
 =?us-ascii?Q?ryvK2TmlhzP2goSlFSKidrilb3K4ijks9xSjDH082kMQbv37w1gHaGrv6nE9?=
 =?us-ascii?Q?1chUiD8tvXs/pAG7VzEhGCFukEyJtYpKt8BVKr6UuGcTmJd7AnhiYn5pIO6B?=
 =?us-ascii?Q?DPNCEsgagKJktg4qHsHbMi9QN6KvtpzOhav9ipR/5DedADrLPY5Kxfv4fq49?=
 =?us-ascii?Q?ubgj6l8aaNMvlQLDa48W6BLinIv8kBp+H/utcG+TthcZcGYXNPgRvzzDP/H2?=
 =?us-ascii?Q?XR4RZA1XrLUaEGWc/B9xr1GE7fTrVu/Q2QU83TIAxEfJ6JNURc3Om+1uxmrm?=
 =?us-ascii?Q?w5PPT1ETQJdy6CsKnJ/kPHy0nYJSlYHbZWK5UE8N3vSCpbhIW+iM335OOoPp?=
 =?us-ascii?Q?J9hUYX3DNF5IgmDxnCfbm4PPwLyads69MQyZtUMzLJ7a6cru/Zh8brouYx5W?=
 =?us-ascii?Q?XUGBQxV2Q2oBTKvU2thZRcMhiKB6PpGPVmZ4XUHdTsrrtPbf4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 13:14:41.9487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3315f4d3-db6e-4ddc-6863-08dcfa7725b2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_061448_381577_46E05894 
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

Specify the regulator for the EEPROM supply voltage and associate it
with the EEPROM device. This resolves the following warning:

  at24 0-0050: supply vcc not found, using dummy regulator

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 43488cc8bcb1..1d6637ff9c41 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -83,6 +83,16 @@ vdd_1v8: regulator-vdd-1v8 {
 		regulator-boot-on;
 	};
 
+	vddshv_3v3: regulator-vddshv-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDSHV0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdd_3v3>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -287,6 +297,7 @@ eeprom@50 {
 		compatible = "atmel,24c32";
 		pagesize = <32>;
 		reg = <0x50>;
+		vcc-supply = <&vddshv_3v3>;
 	};
 
 	i2c_som_rtc: rtc@52 {
-- 
2.34.1


