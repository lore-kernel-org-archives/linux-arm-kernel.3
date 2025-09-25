Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8020CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeZlF/gOTeCRetsrRlUANmOpsV0fCfSphWIX87QbBiY=; b=j6j2iUQNbSOxdWdHMjP3iuaBWd
	UsyocA+NUt5W1oeODja68+UZrNjQ91fMKybHjwZoBdBoOaIYEYLEmBofKjK0CNI0XHdoATuJRpgPX
	AWJZCBjejjzr9jJATwwRCs7ey5bp4758Os4vIne3mU+tgH+WqxtiSGXGaN6gO4ainynb+G5Aygh4E
	FBZYI0t5wf+pTxbMF38HWQvlONpRzMV4HBNdhqQeLsS0AOjMP75owoxisrftb8LVc+sEjGPwsQFwK
	zZbKpe8CvhL5/OB83o+v1eVXbfjBHnOzSYOmPKxF9HDhpJN19Ez+ZnC3+SLyk1CjJgzptSQcD4jSj
	VcUA03iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1imX-00000007sVn-0RUY;
	Thu, 25 Sep 2025 10:00:57 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1imT-00000007sSk-02Tp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxE+Fc/hnc7ioBj4hbfiahQE01t4W75uawFZlsMk7WFuhYxHcCsB0zv5vx7sRvxq7tQkpsfDu9Vd+ITiUMgLNXg0FN4C4yro0tsNP8A/hQ8z5rP1Om5l5A9aPQaHmbT5J3a/wYVL4DyRalBu3jyyUfKWb9xV/AmLJkWp1mbKgvkLWAe0ROcnUUdhXtPmitT54T11ofH4AiHBWYThy3LTDnm+goMfa6DYUonUVEMpeHCfAwfKiUJlv61TZXB7Ycd2hcxx2E77CgShxL+mWKm6sOyGiWR6aP8yi+Ijammq9dGdd4tMZaZ1y20Pi+bucAAz5iHxv61/o2BfdpxQ4fpn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeZlF/gOTeCRetsrRlUANmOpsV0fCfSphWIX87QbBiY=;
 b=FcyLX0285ssrqO4VK7X4XpJ+Fls572EgWilzfNcJe5e/uE8gj8fXE/Rq8oelezrWfUtSCZll5RECvCCmtZIcVx7t7A7MGndNBDdbfrcGgUsJ+JtPmKNRQ1akeEAl6JP6EL+1fBo7ukdxPRYx7cNy60hmnughBUEh7X876Tp2lJfKxRA9H/S++oaodg91x5Ojri0Mg71UioLQkEFjFl00mk4cnbCaa2/eRbyoEHpzYyNGYEaES6oSle8z7fTEEX0KAuoE3G41TyGhgizKm+jiZmfNSselTC52EHj4OGIdTzUVOiOzD9p7Y7mqtCwKaie3m9AZC3nssnd8VJcnuyu1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeZlF/gOTeCRetsrRlUANmOpsV0fCfSphWIX87QbBiY=;
 b=Ftw2T6khLLEGsQhlFni5+HTKCxcqhAQF0itzTXPqlB1V8QwwT/w3/aQabdbqfW6mrW1BONLkY+q/bWjvXybhL2Hj6fy77f8F6u5p47wGJI6RKVUluZGURlDtcHY+qeqboaYRbFDx1KnNo2zcAzkTPNh6Pbq3facxZTHv8jXJ0e/GLFHKtC3J6iIoUasnwJtobItllh1MKTHN8CV3S/2fsJEO84FGB4pY7ECwg8xX2wuMABqXS1q41VIsYR29//p0s53CJY/2BamreOLzmIk4E2DfUL3TMnqoIn7tJm7WlZqKDl7lNk9imT+f0OsAzvp8YfMq72uJK7MNDJrXYiTSww==
Received: from AM0PR01CA0145.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::14) by DB9P195MB2970.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:5f6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:00:47 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::8a) by AM0PR01CA0145.outlook.office365.com
 (2603:10a6:208:aa::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 10:00:47 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 12:00:45 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-am625: Add OLDI support
Date: Thu, 25 Sep 2025 12:00:37 +0200
Message-ID: <20250925100038.3008298-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250925100038.3008298-1-w.egorov@phytec.de>
References: <20250925100038.3008298-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B3:EE_|DB9P195MB2970:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c393d8-5a14-499d-ae8d-08ddfc1a6669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHNhyqWzfmxX1bmfEEaaAr33054Afx3HnOfPjpavzVsPuqoOoOJ8nL6NOdup?=
 =?us-ascii?Q?sF2Kdgn67aeg2BWobJKWzWzyTl0jQg2CYOiaKwB7evep31T7eFTqrhDPFYHL?=
 =?us-ascii?Q?AvIiJAUJvo658YBpvkp34KDBq7dbhsvWA5T8lEd/JprAELUanucVWVfFw+sZ?=
 =?us-ascii?Q?ZGFhUJZ8e2N6g7UlAYd0BLQXRp0jKWS2DHU33XAKeU9SJ0R9FI4yvyheVttN?=
 =?us-ascii?Q?AaDPJ4aiDx/KYpkWIdSMZ/SkE8Wur65KJ6Ia0QNsPpfRbciFKMULYUWIgsfT?=
 =?us-ascii?Q?wBFl8Lsoj2mF+b9dQ6nySdr62YyhCxhHkDETi1iJwYLWhxp8lOv/9nOUrEWb?=
 =?us-ascii?Q?gTCLhMMhDUxZ4wF9hXjOVr3xmypmus1XR2n6T1ktIMJexiwYG20aMxUDykPT?=
 =?us-ascii?Q?dYUgh1SGzVjnm/vvsCj51C81i/wIshHrr0v72qi3iBEcMfEZG8W7p3ciRmZe?=
 =?us-ascii?Q?1fTVVIUBzJFD1FgGKNIdHXdw0oMVUNngOnXe7eYz2YbqY7voF0eRZE+j+gvm?=
 =?us-ascii?Q?tcHIAuMK6gyB8IJ9iEjND997cpz8PkpuXsKw8s+8jP4CAf/a1PQDHC00UDQH?=
 =?us-ascii?Q?ihc800SAu5TTZUYTZvLKyiYNIE1FenYRy/Mh3ZePTD7CEiBicJ67tYjVOJsk?=
 =?us-ascii?Q?Z9eyGMNkw2/2s6f+7z+u3laHrhzeN6Part5tAZmAvVklLrv9k/Ze1d4a714m?=
 =?us-ascii?Q?JnPNyKZdiEJz8sHYVnXD3mTd/giz7DsyyhjpITZASy8rCQCl/1K4sc/SoxkH?=
 =?us-ascii?Q?hAuCmOPwd5VPxis1PJ4GH/25mx0wB6r6UlIsiB5/37/YjU58ijAF/iDrIJLH?=
 =?us-ascii?Q?PlxJVLodTNHvGp+TILyjbgubMwmgvUqS6L3vA5rDTwIiQvHf6sizDCn6T7GV?=
 =?us-ascii?Q?H86mmsxVPoKr1vNXtVJBR5U4TueLrr6dFoa+Lczom85G6MYwkaAohI/vFZ7h?=
 =?us-ascii?Q?woDii7VAaPGJDKwqSkase0M+FjHywA3q3L2boujUwIvpaxaCVxtsxvMrf0YK?=
 =?us-ascii?Q?GYttOmsVFfvnsCvYZKXD3bxO23tGuu/vxVysKQK7tNGmEE5KnbOXnS2ed5zf?=
 =?us-ascii?Q?EQDGSC8hf4KOi4teiYBsjxZDl7vX/LlMgzmCZOsU+nCXHEWGOByc6rKf6/uH?=
 =?us-ascii?Q?14GH+J3OM69ITTrtOpdWcjUkzKltVk8gkBSL5OD81z0p+NggNt/29NPZ78qF?=
 =?us-ascii?Q?Z6tG9v6ZdpTcQbvj43hUek9jqHbw52csaGSFcHWNID3co5s82oXyQ38HA7/r?=
 =?us-ascii?Q?lDqbBfcB84rPGOve5lmOXZS4AOz/XAmsuF8ujvRVvtufkWwke+Qpb5a28EMJ?=
 =?us-ascii?Q?pGMYnZcfoZJyliJB+JmxRO3U3Cbu9huNo+xSRSZO+rZileOlEgk3Adv1DPYN?=
 =?us-ascii?Q?QWinnuTmVOlSfETD1LzCp08z4zQ/S61UVX2A2l6X3KGtDYku03yptAJ4rvpT?=
 =?us-ascii?Q?TzfkL3qIDNSWOkjC+y3gyDwpJaGc8FhX/GNUbrAuZgzoEdJdVdWxptUJe0NL?=
 =?us-ascii?Q?kFJa/Khy9pdlyg1O2f8doHD5m+mUs6zAFnD3q+g9/L/YT65IlRMilErGZ1JX?=
 =?us-ascii?Q?uRp76GpBKfSbEmOMZm4=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:00:47.3597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c393d8-5a14-499d-ae8d-08ddfc1a6669
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_030053_345722_E5C55927 
X-CRM114-Status: GOOD (  10.87  )
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
v1: https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/1065766.html
v2:
  - Add dummy nodes for ports to fix dt-schema warnings
    'port' is a required property
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index ffa485545a5f..9a1dc117d6fb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -793,6 +793,58 @@ dss: dss@30200000 {
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
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					oldi0_port0: port@0 {
+					    reg = <0>;
+					};
+
+					oldi0_port1: port@1 {
+					    reg = <1>;
+					};
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
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					oldi1_port0: port@0 {
+					    reg = <0>;
+					};
+
+					oldi1_port1: port@1 {
+					    reg = <1>;
+					};
+				};
+			};
+		};
+
 		dss_ports: ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.48.1


