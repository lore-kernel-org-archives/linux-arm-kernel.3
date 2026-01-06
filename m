Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741F2C47BE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yf24Kv+HN9iGRnmSnIUEdsQG5GsxLtIfLvwcTtB9yI=; b=W/TxsgijNWpFU3il0IWnLKLa+P
	55Egw7lgheNz02F8b3ZvEYyTFPK61Du2aVVWlM1x+LGQUf6IPxsYNKa4ATN+oxko7mEnrajaPz1Ot
	UAhDAAFV6ZlIq2s8JT9+M0ZjozYBKfJRPWyyavjnLrAH+Si+hSquBYHp0NJtEdyxOODTU4NiVYcmk
	97NKNHcAPhh7pkx30zEh1gqdOM//003+tcnJ3rdDPFjhNwXYIhApxIFGOU9mFbbMc9jSg/MLbEduS
	wsR5xyIXLDDNdscBtQD7R/u0kad5iJx+mDihQZdKwr9zBAQRT/QuFVCE0F0+uC72iwb8juHiI/ClC
	oL4mG/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4by-0000000CozC-1idD;
	Tue, 06 Jan 2026 10:48:26 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4bw-0000000CoyR-2GDo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iyj7zmcsqPBd+NC99QwE5vN9wXuU1jAwH9sA+SeLc1WY2T5b5jLIHAqhDg7cCN+KJh+Eyc6ENL6dtyr0nX3FFOrILnLaot03GN+gdq/xzgAnPFn7DWlsjgg+QDDn/Q1plE1bPjER31OO4NUrjHcibGvmRctk8vQYYUJ0B7HdIoSAt8O8w673hKD0UKE7shk53bPJMUd5C0UVCdPoYXxrGTwjyUsLD2fKQ5mCjfom3bnVdVUIfFn6mo58kjc47fwA8Hwl1vbt3yTDXRX9FoNoSBK113w2t1yVXFOklqKg+3U6RoDWTcI5yDB9N3AtO/RiBlwnNZ8IfllYCOasiC4Ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yf24Kv+HN9iGRnmSnIUEdsQG5GsxLtIfLvwcTtB9yI=;
 b=vYhfx3s19f2+CsZaEQqW54FOOwxexvViXtyNMhzVyu8Al1d9zz5RSkO4IoZFGntHWNI74UDpk64CZZr55X3KjyG2WFXSwGuD42kbqNTmYH4EvsXgA5BbSzswghjgSAjAIoc8OzUDx83izrWEgG6STAHCAxuD/i9a8yewZnD1QHd1nA72RRf5i2WgMhnlYEvyucYuVd3JFvFzBTcvi+bSs7m/tCj6ov9zEl1VH1aVLJVQWXdIx0EAC5YOFz71l9dIZHT2Fl+HJB3vYzlE15ctUcGENau7JF5tH0MJV7LPbViHxjy4003vz5hm1lRfcb84bFFtLfsuLNflCnhk4jgt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yf24Kv+HN9iGRnmSnIUEdsQG5GsxLtIfLvwcTtB9yI=;
 b=cIZErT6ZpHh3YlyBA0VmqNCxOcoWhE4UTs5nKKmcSVVx32I5H8v93DKR3zixEwsw4jbw+aY/MJYMyD2A9pa/uPtef5d3APOlcKXr5PZUIbWSnuYp/iY7QlatZPlzc9souL4WJfkXjGQ+6uNyKYGGwulv7ZVrxqdDA7pkxErnKng=
Received: from SJ0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:a03:33e::22)
 by BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:48:21 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::b3) by SJ0PR03CA0047.outlook.office365.com
 (2603:10b6:a03:33e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 10:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 10:48:19 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:14 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 04:48:14 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606Aluwb2890257;
	Tue, 6 Jan 2026 04:48:10 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node
Date: Tue, 6 Jan 2026 16:17:55 +0530
Message-ID: <20260106104755.948086-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106104755.948086-1-b-padhi@ti.com>
References: <20260106104755.948086-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|BLAPR10MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: c117d0d8-f7cd-4ff4-20f1-08de4d111b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ZASgNot5t961+Mrl2sk8abWkbdOgIsnXCdn49T+O8p84MeAA91mcFmku3Za?=
 =?us-ascii?Q?zROg48O8o9QwnRb9/aI1wHyTJ7Y9Fd3suQXoeKsBIbSKD8Ja6PrSa3PfBxFP?=
 =?us-ascii?Q?aNjD3sGUdun4ozPemukhXvMjkSfsSMzohNI9a1KxgESP/JiHueIESKPp+ejQ?=
 =?us-ascii?Q?zal3Wl4IpxjALIWpnyfARJw0osEAigLHhRJNnAJihD/UB3WHd2Z+OYfPtgLG?=
 =?us-ascii?Q?eceiBMqBc0x0Gqh81IaC2Pzho1wHU2dyel5pnq4nVXG0Ksb/tvQGd1Tv/9nd?=
 =?us-ascii?Q?oEX3nNO7lAQrWHE69R2K0qu4lzykq6uV54ymGxLvBvRB8TfkM7pAsWr/l6la?=
 =?us-ascii?Q?cwyU2xcb5MbVWKUkjHGhK6LzTleaQIxzHkZ/zLFV1gEOAhQQMlKnK7RTCs85?=
 =?us-ascii?Q?N0R2pCHZhdA55x8LQDefA9VJPPkhh/UHK/WaggLz8lr4Y2E37D/MiuodTHEx?=
 =?us-ascii?Q?arHxkIfU7jg/HUzAEHaRW6j8zkeTqbH8UNDpTOTepQefTRVpBiCk5yG99JRQ?=
 =?us-ascii?Q?R2fN/Auxcq3CmY9I+jA215V394NtjLlmpAbsw2E+N9JKBgx3J20o+68ayOh+?=
 =?us-ascii?Q?9K56qLXgHNr2QVFs07E+Rg9SGDBbgyLg1+1mFUOqQLhQ0bSBxz+NoxvMXUMk?=
 =?us-ascii?Q?7k+cFMdezJmXjnncFeArwLQfhlOp7Kqno1mPGnTaxIyBOoEnlJWgXC0P91AG?=
 =?us-ascii?Q?MSrruUc+4n0ixbX+LaAey6IdkzNaEhbRIFM9313DeW9lXbRiqcWX1gOQc4+E?=
 =?us-ascii?Q?qYZ6dlIkTLpcjJucbRGS4YDLrQOZOPQ1cnXHIdT2J+NfAO488n6pkKsKziKl?=
 =?us-ascii?Q?anJTlNEeO+ALWIn1hn9MhbLi3IBUUu1xW49BCS6YBQZeKMXl+Y6Mpfxy1gwU?=
 =?us-ascii?Q?JOKtEOrxqyjAIBbg0Kg9SwouvSQDKtRsAeiLpczb8MoxhTkPg2AnC+ZGBw5q?=
 =?us-ascii?Q?k/K8xL/7qnG4htcJumgvVgDjXQCZPSkhsAYlYnTuX5HgZM5zhP6ioIe1hhnc?=
 =?us-ascii?Q?ttZeUDsiQ/OoyKPxSyoos5CHlkdNnjpde16kao9U+5qRVwWLodq0M38H4j0k?=
 =?us-ascii?Q?tAyLnnx2HhIW8zNGSojExJntYo2SOG4u9yuyHVeFoaecWUEH6sfPhE4to2Wk?=
 =?us-ascii?Q?F/ClhnALPr014IOAek3tuyRHW1LCDnNndVA/C7ZyG8ZelN3ZxNst4piwIIOJ?=
 =?us-ascii?Q?CCq5OelyKNGjgZyNR1yywQBw0irXjYaaHthocz+tJcwHKlW/+FxZvplkBSo8?=
 =?us-ascii?Q?5alOWbSKwUYdWzPOQUSLbvXV1jS+qjXXAEAgKlImgV4RTnmuIhWyzpr/qLoj?=
 =?us-ascii?Q?pPhWgekrVHKsmFilg3c5/P6DY9BAIH1dnl70Ra99VCuKLQgMYuAp05VwUsRo?=
 =?us-ascii?Q?LVa7h91Dg9QLDDmXBTfrL6sza+PK23/o9BLnkdr0SPD4kGDLHMRyccca9F3h?=
 =?us-ascii?Q?D6dz459/0sXTy4BscbZYoaHYk9gYq8/pZEUWO35u5+10qdu2guzBvuTYGRpi?=
 =?us-ascii?Q?rVxp4sj7xgY0ejQ2UPIEwf0XHDHg8FARaMtrKm6M5TgntJ3i0vstGCBjBz9/?=
 =?us-ascii?Q?knCu2W1nGHzrO5bpx1M=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:48:19.6003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c117d0d8-f7cd-4ff4-20f1-08de4d111b10
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_024824_583390_CE732734 
X-CRM114-Status: GOOD (  10.37  )
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

The TI K3 AM62P and J722S SoCs have a HSM (High Security Module) M4F
core in the MAIN Voltage Domain which could be used to run secure
services like Authentication. Add Device Tree Node definitions for the
HSM core in the respective SoC common main dtsi file.

The corresponding reg ranges of HSM node has also been added to its
parent node's (cbass_main bus) ranges property.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None

Link to v1:
https://lore.kernel.org/all/20251231165102.950644-4-b-padhi@ti.com/

 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi   | 15 +++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi              |  1 +
 arch/arm64/boot/dts/ti/k3-j722s.dtsi              |  1 +
 3 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 3cf7c2b3ce2dd..28586cbc57613 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -1117,4 +1117,19 @@ vpu: video-codec@30210000 {
 		clocks = <&k3_clks 204 2>;
 		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
 	};
+
+	hsm_m4fss: m4fss@43c00000 {
+		compatible = "ti,hsm-m4fss";
+		reg = <0x00 0x43c00000 0x00 0x20000>,
+		      <0x00 0x43c20000 0x00 0x10000>,
+		      <0x00 0x43c30000 0x00 0x10000>;
+		reg-names = "sram0_0", "sram0_1", "sram1";
+		resets = <&k3_reset 225 1>;
+		firmware-name = "hsm.bin";
+		ti,sci = <&dmsc>;
+		ti,sci-dev-id = <225>;
+		ti,sci-proc-ids = <0x80 0xff>;
+		status = "disabled";
+		bootph-pre-ram;
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index e2c01328eb298..9d6266d6ddb82 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -96,6 +96,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core window */
 			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */
 			 <0x00 0x43600000 0x00 0x43600000 0x00 0x00010000>, /* SA3 sproxy data */
+			 <0x00 0x43c00000 0x00 0x43c00000 0x00 0x00040000>, /* HSM SRAM ranges */
 			 <0x00 0x44043000 0x00 0x44043000 0x00 0x00000fe0>, /* TI SCI DEBUG */
 			 <0x00 0x44860000 0x00 0x44860000 0x00 0x00040000>, /* SA3 sproxy config */
 			 <0x00 0x48000000 0x00 0x48000000 0x00 0x06408000>, /* DMSS */
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index c8b634c346779..059c65ece183f 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -173,6 +173,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x31200000 0x00 0x31200000 0x00 0x00040000>, /* USB1 DWC3 Core window */
 			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */
 			 <0x00 0x43600000 0x00 0x43600000 0x00 0x00010000>, /* SA3 sproxy data */
+			 <0x00 0x43c00000 0x00 0x43c00000 0x00 0x00040000>, /* HSM SRAM ranges */
 			 <0x00 0x44043000 0x00 0x44043000 0x00 0x00000fe0>, /* TI SCI DEBUG */
 			 <0x00 0x44860000 0x00 0x44860000 0x00 0x00040000>, /* SA3 sproxy config */
 			 <0x00 0x48000000 0x00 0x48000000 0x00 0x06408000>, /* DMSS */
-- 
2.34.1


