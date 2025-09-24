Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28021CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMwDNDQccov9ePh20hmK0eImsq+z2gk5UTJS15+5le0=; b=T8n4MX64JsB7M0wfyrluhUQRwj
	751/Gbsn4cN4nFWnrvgDPgvCSDBv0CeMpzRIebbWQNIHTeAdAawBx+qE0ty1yxm15MLRDOWoUeoTO
	se8lRHUb5nkdbuPdlvkcE30xZdkOwCDiKi9I0QVlRxyZnBKe2ujhLz2Kf9R3O2JF8K6O0z6hvBtSm
	2K7g2w9/2AnYC1rFwm9+pGcwxQdmLaHLNaaVsvsBzh+x6Eddcx+LPuCttEVOCZlRKEjIYk8w2UeLg
	b1iKcgX5C44Bp+1ilSvfPper0XnF8z1HRiZfxeFjp/H3nf/BVIzQRg6VlmhmUD7gigfi8UFAq8qmW
	TQwXWpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qej-00000000lNq-11ZE;
	Wed, 24 Sep 2025 14:39:41 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qef-00000000lM6-1hOD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaFdOo5bse2pLxJPr5yGRB3RVFT7+v/c2ulfAmoafBF1Os/GjdknHsbM3/36qLTXR4msaw4RZcmu+rypGM6pPJ+4iTqLWwP22wl8ow2AEl7dfHr72CeHvvSxJ0Q5uQrSKW79Sh8x4KuvW9nwGouOt0oTNVLHh9rwq2NRvEB390cfOycBVvwLTpi5Hlr9DNByUdxttJlwg4OMN2Xri3iUWrHKnKhegMwNL9xwSfvvwJSudsjYNCy1Z61ClJ1TKPjcDYd3mwyR3vV+122Vj5KDUPbhIw530goem134/6/kggvTjwohaCEM4IAyiySnLxyeSpd1w1/KubqK+SNunD4/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMwDNDQccov9ePh20hmK0eImsq+z2gk5UTJS15+5le0=;
 b=y5qJRLHvwbA3tmBRG2XC7Rnpt979Fir3h1JE4pg4xJQ9I6nPMto2uL4Tl9/x5s8CKzjACAz0KJeXnRNqip/i5nxOM+KYykUkKNcYbHAzmzMOtJ+WyVjgVPVixGvQ1MZkaVkJrpSOR/0jHg9J4tT/yLAZK68FzaW3/s7lzoA+CTg7jTarcO6GlpWG3e8dSnKubGgXuVCgor7qGJDtFjDOWnMfylOHhKl7F3V8T22qOUroVH88TeNUdEMAYWsn/eBUzB3tsDS5D0AbQIADBqk/YrGKzZpl5BMoFAF62+Lk4nRELEgUCU8AbDxOEzQdZfvNcnSFHjyQBqddeEsEnf5p7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMwDNDQccov9ePh20hmK0eImsq+z2gk5UTJS15+5le0=;
 b=Pya9pkes87mZYNlLwkmTl9tZ4Z+8fXZCMYAf3V9869s7z43tmHxp4HqEuR/j5wl60piCv0fEiqBDOudB9MmsafQqk+naVEbGL54gf3hf8DZKppjEDGdoS3ALfivgMAav6pgFbCZdBCoXTW/f6007379Mf1AAC9oXYKmMo3SFejkDGWV6A+vrGeK+Lz6x/gEdEe0fTTtDFyNBN2vam5HorAqTjQFKgc29i65Y5d2I3/bbrYARUd5kiTEXsbAeGEGERSCJdO8M6l9mIplOAFfKvh5r8+VNNZQeUOGvZ0wVQx2XSRlziKeKUzhanjIhRjgs5BWdL0Dtf4mGn1hqKQmgaA==
Received: from CWLP123CA0083.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::23)
 by DU0P195MB2146.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:408::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 14:39:28 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:401:5b:cafe::1c) by CWLP123CA0083.outlook.office365.com
 (2603:10a6:401:5b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Wed,
 24 Sep 2025 14:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 14:39:28 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 24 Sep
 2025 16:39:26 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am625: Add OLDI support
Date: Wed, 24 Sep 2025 16:39:15 +0200
Message-ID: <20250924143916.2023919-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250924143916.2023919-1-w.egorov@phytec.de>
References: <20250924143916.2023919-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5E:EE_|DU0P195MB2146:EE_
X-MS-Office365-Filtering-Correlation-Id: d206da9e-5f67-48b8-2c2b-08ddfb782a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZK4TtSLwviku7nPsI2bBGEobzFh0ZD9ENc0/yRy/GNIU7AzK7kPISLJLRuPl?=
 =?us-ascii?Q?sBTpCiGgjssfyYiqYdYs7zBJkobPn1apTW01yvQ+n3v5vpUGaNXVZ/LSqjow?=
 =?us-ascii?Q?20abdNo6rb35Di0L67Ip4zeCsNjU14PnxUPS9oDdKYkLoxLGMq0Gpez//iqE?=
 =?us-ascii?Q?xWnh9SgD7WIbHi+Y9iyIbRQ8E0vcUiscWxksmRGKvIYqv0uSq66ZPycFr/Yo?=
 =?us-ascii?Q?2XsKDJfMM8rTgpwyhBkerUxvg8c4lH7HZcOHa7d92zBf8w4V2vp5iuwl//mY?=
 =?us-ascii?Q?u6ppQvfPRL2g24K/gWbyuXz1IUextXau3MIr3RsO5KsBvTlQH3hpBNP1espw?=
 =?us-ascii?Q?CZSjhiRaFYVKUTe1A6DhzeIimpCFhZTdHvpFSBpCxRmkTbdgqvFbySUicDwJ?=
 =?us-ascii?Q?Gb16gbt7Y9/Cmb14yzFUqahPrK4segI92A2da8SXvSKbaNC3rM9ERoGWZLda?=
 =?us-ascii?Q?kMglqjUGLetW0oMvxOl9t1jF97D8HxKC+0jmtnvPl360QEabbzc5xJCkiBEu?=
 =?us-ascii?Q?RUDNeCQ+Eq/OXPqYPwR/Xny/d1pkcrpgCvlwJ29T8bRV25jJpOIf3axJP638?=
 =?us-ascii?Q?OOzJVgeU6tX2CgII/GWVf2KXHnyWpndnH7ltI1OTxKJVtgTMSqRCxxj0M3F0?=
 =?us-ascii?Q?TaiP3x8W1mknQm6e/9tFGR7N+MwO8jDe+2hEgzQdt86s8O4K2JB08yOGeGR9?=
 =?us-ascii?Q?vYihLCGXXy6gTtySDxdR2Tqeh6reckM59BgAdoW40uhevIWOhxsRuT07Mo5a?=
 =?us-ascii?Q?icJDRbfxJNADmXdFrEq+pIa9KB/6e0AeO2ZA8oEEUjLWG3Kjgt3HFJb1y1dW?=
 =?us-ascii?Q?2fC/IDbdx2zrshy84o+MjBm4ZqPVVUU1PcN1lO2pQkIlhUOII5fuEuGk/VJt?=
 =?us-ascii?Q?BKBwB0xYpXdnEMudx8NnTgGGM2lw/0bFZRJRiaKtz52i158zrbi6bZOh3CnI?=
 =?us-ascii?Q?4UPSoROb+4qfDOp9szxbOctTYG+OE5Jvz+a0BlKd6pYphh+nqNsqHZjPbS+8?=
 =?us-ascii?Q?NRIA7J+PGbeIhkd9ONQEyzAlUIHfaHsnppKm5nJwQ1v3ULz/+oJSAsnuhRQJ?=
 =?us-ascii?Q?EJ9YQlbEedUJsPwxm7tI+uIth9FfqRBuAZifQEFRBVtV4fDmQsmmcvgx5m3a?=
 =?us-ascii?Q?DRMuMC7UjqmnfDgm6hVFYGTX7v2rO9Q5ctISODhtYq06RMhBdBhKty7lbWeG?=
 =?us-ascii?Q?Tmn+5Z4x5C0lVtqVc4sPwZH/LTw1j3fo47+w0B8Zv/2daE8yV3XHJteXXJRH?=
 =?us-ascii?Q?VMR51D4UsXybF1dSrCGWJ1VbhlGP3QzfIx9r8Dtsdne12vqTjjentUCvn7sh?=
 =?us-ascii?Q?4at8P368N0PwzDnTCT/HRPBGfP+L7Ru/S8rRLzQQJJW/KzC4h/VM07ajVufy?=
 =?us-ascii?Q?FVyJA83vZw8KYBPVtDOmd3NeTM5MmoD0nfydNz6tuQ3qUmv1PTI9dcm7PWpK?=
 =?us-ascii?Q?R/GL6py5NhzbOyKH1k97Us8rEz7ZGBy80XkPchXw9SIYb/q9B8+nnGJ0wfNn?=
 =?us-ascii?Q?X2y3Nw6ATIgs95T8RPGG1/Fp8J8faRizpifm?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 14:39:28.0095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d206da9e-5f67-48b8-2c2b-08ddfb782a48
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_073937_752676_4F728173 
X-CRM114-Status: GOOD (  11.05  )
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The AM625 SoC has 2 OLDI TXes under the DSS. Add their support.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index ffa485545a5f..fbb49d9c70af 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -793,6 +793,38 @@ dss: dss@30200000 {
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 		status = "disabled";
 
+		oldi-transmitters {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			oldi0: oldi@0 {
+				reg = <0>;
+				clocks = <&k3_clks 186 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+
+				oldi0_ports: ports {
+				};
+			};
+
+			/*
+			 * OLDI1 in AM625 SoC can only act as a secondary OLDI, if
+			 * required, hence the clock and io-ctrl properties are not
+			 * required at the moment.
+			 */
+			oldi1: oldi@1 {
+				reg = <1>;
+				clocks = <&k3_clks 186 0>;
+				clock-names = "serial";
+				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+				status = "disabled";
+
+				oldi1_ports: ports {
+				};
+			};
+		};
+
 		dss_ports: ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.48.1


