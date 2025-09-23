Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32323CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 13:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7JQEniHWNT+x93uSxXrGwu2CE14CqgGzYmtYLrCSyw=; b=k10EjzSHHFufHmB+vq0Lh87OQE
	NvnC3JP4LWDZ/wsyWJkHwBcCHLumXdC6bhZihD/wKYC/BPsg7i0lzFZSbiHs7tRNfaPn2ZamY2AGu
	rQO8WWUksccUwRTpmT+8o4kFa2Sq+s0XgR4XMj3TUyB+Oa6zygAAXmVfukChqA0uSuUehO37Q6/nP
	8TYxcpiJFVVSgGFXEkKCfpZaPznNuK4u5yZZpKHMxnC8rZOs0lTLUIB/22I/WPIf5g4A6m/W6qqnl
	SUxY18ItfarD+pyFIXkAI5mT4w9t955cKUYfdZ0pkSmJurre01TgJd6GogbJkGr2wFesGYr26JNbY
	V7t5Ak+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12lw-0000000DR1D-3SCg;
	Tue, 23 Sep 2025 13:09:32 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12lt-0000000DQzZ-2eGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 13:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htx1UMS47rRckcPwJrJptir+3uYW1JxLVesLeDALwvVShFjeR4CWcqdbi0d5N5MWNcMQA+sF2G40wmkJYPB49NoCxLMMNTl/Y7I7Ps9n8K+tI2jhdExockWKbrNy3nDeplje2eCVLp6ykJFTrnvfuN/Jgnsqqj0cfxFjWfwdhYv/4jMiHFWzZuq49xV3UA4lFQBOfDoi6uzFFRfYbGRbT5SXOkyb7R4Z4Fn/iqR8jRi6/7qn0jyJgLDhzIfum1pzZ94PEXkx3fotUKrCDa2jEEhCMliIL3UrVpsnynIe2A34uyWMs1cKDikI638n8GyF+k31yckIPwFHq9tDr2Wefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7JQEniHWNT+x93uSxXrGwu2CE14CqgGzYmtYLrCSyw=;
 b=DcVv342R3ohKjh4bj+TbJk79O6U2Dslz+oUf0KKR2qLKqZ4oNYYl3K0jnuyQmUiI8I7AyOPeyrcX8Or5TlD+Psy4t3mArprnq7BBiwCBCdqI1GqNwlUq9pPoKQ2l/Ewim8saJ6OE6D1XRjeoL+INSQ7qNpgUPPotUUNSKQN9RnR+HbM9tzPR5C5ftR/uUlrIteUgCLOkvAp72ctkpayMw9O+JDW1DE4epdpshp55ShN8cbMb0g7NOEfsSzgx9R9Gs5cpLmJoZrU8q+IkRj1b7FweMlO+RHKK0oa28JAM/9OusYgbQCjuj6m3QIQmeSMX1CcgPESPe/obc4PRqvwtxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7JQEniHWNT+x93uSxXrGwu2CE14CqgGzYmtYLrCSyw=;
 b=K1XuejZcUueReG00RgcGeuVFDMtlL1seVgxAa6JVjHi/OBedb3iJpkPxKXPUYTzrwK+hjnAznQHC9bYodpsUQLbQdyDdGYpvDpJYGoItDN7VCGVgX7JN75pt6dCTbJyegCFIvGiHJDb2TUENJqqGo9K2rwi0bDkAtl4l6jo5u+Dzff4HAqItxHL0XTvc9KkrvRhlfIJOQXOT+g1DKC7KOvGDzo4P4XCFJ2B3dCxc9gePilSfeF2aSJckP1ETCXsu4OCGx5c6uminAWVe9CYXKnx/cAE8m01OKk83mwiI5TN/2HLBPTRikn0nRz/iTfyusPkB1xvAyMDAUMle09ZU4g==
Received: from DUZPR01CA0114.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::13) by PR3P195MB0636.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:31::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 13:09:22 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::3c) by DUZPR01CA0114.outlook.office365.com
 (2603:10a6:10:4bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 13:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 13:09:21 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 23 Sep
 2025 15:09:18 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62a-wakeup: Enable cpsw_mac_syscon in U-Boot
Date: Tue, 23 Sep 2025 06:09:01 -0700
Message-ID: <20250923130901.4110013-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250923130901.4110013-1-d.schultz@phytec.de>
References: <20250923130901.4110013-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|PR3P195MB0636:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e49017e-49ea-4bf8-8a14-08ddfaa26956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?62Mlb6SwOtn/gWURM+SoUjx0Pb0pigKrq1JPQ1NEq6LVF/WAf7Q+PH6fqnni?=
 =?us-ascii?Q?RefXpm2mS6IRCZW/Cab0s8Y9B3HkQuaXmQdd6jRP1mab0qMN6oke2DPMTCjU?=
 =?us-ascii?Q?YAvdJ3PJei6PMvqxWayRINVj2lb5VfM7yV7ml40Yf8O/62FHqcRz8quL2anX?=
 =?us-ascii?Q?M5xWnoYN1K+lzWdqC4l+Ve/wxG0Rjmx68YBKjCkpXV1vPgvQK903s+8UUEl6?=
 =?us-ascii?Q?sIUzLkHafpsaIusSTFqgLcm3lCPU4+hXVRYFeXiJTch7BOl0bZP23piVFsGl?=
 =?us-ascii?Q?Bka3RAWdytrHyOqJrMpViEud6Qnhs6QRUKxadudGFFRrzIQagirH81eA+x26?=
 =?us-ascii?Q?vsKnbplUlZLX9bl24DN765qs/BXc4qz7ee0/LUDcH4+YI1NV1aus9QYQQsV4?=
 =?us-ascii?Q?NSHw3JAwPyNfPZuxjpFegRNUol+lgmAqI1znIzFbcbi6ON0AuNA1ykzH0cR4?=
 =?us-ascii?Q?cAIaUWfyp7KEBLDgA7VGUY8xcKmbR4kRLGk4N+fTTf0UCldUCVM8FRAmezRj?=
 =?us-ascii?Q?LXTlTYnqssTQMy6atGfyPXfQ1Ul5hQpPjfs0vr8+PqS5ydNb7WLwG6SX/VAR?=
 =?us-ascii?Q?r4m8Spcj5YKnSb+oyoe6ONJjVPPKZVTbJbz5mNxtTHazJr/4S/DGs5+pVyxl?=
 =?us-ascii?Q?ss3A2BekMXO5ZVO3/dz3h96B3I4zXTVn2Gwta70ue8bNISLI+Pekvt9aksM9?=
 =?us-ascii?Q?JOw8iISfWfj0yFUSuNAYwVgYjD90e9DghZLVrIo6Rs1z2TrjIb8eSgweuxi1?=
 =?us-ascii?Q?lyU27yDmK4tSZl3DXNbwsaR1CodMj2u1oG6tg6Jsispxy2VrcIZx3YQgPHiB?=
 =?us-ascii?Q?y2fQpbyiICj228tariBdu910jBjFPOEnoRI8oBB0UwiZqGzHIdoXIAHRu73a?=
 =?us-ascii?Q?vC8sLbdC4p6QTEiHLwlDIY9knpZY28ktunCbmfEYD4qtRkESC3ak5qN3zyNU?=
 =?us-ascii?Q?EndaKQQeLA2Z+9VevZeb2F2lHX4OB4iOfbJe4t3NJuD14gafEqzqkww2X71d?=
 =?us-ascii?Q?BHAY2iv8wd9toSJ/EOO1HIFhuxzuMEnPMVDTruhtzqe0k0C50d5/VP2o3w/4?=
 =?us-ascii?Q?iTetXkP2nwLtbyFVNETd5kvnyE0QNzR3fKU2wQT4oLVuTmqiRg0skHkPuZxt?=
 =?us-ascii?Q?U6i5Oc9Z2JJddD8kPqE5GNhWB2MxOWyFmofNLMXMZ8DTHezgpi0rbRsxXqj+?=
 =?us-ascii?Q?p3ORTd1WpKp6mOu0lfWeCQMUzMY7yde7A6MSYqsQdkk2qdV0M3Y8nGOARzsB?=
 =?us-ascii?Q?b93O/tQSFJik8do/qSN2KyjqWndMfiwmyWpOYpziGRsoN5cs8nol8/a2MeY6?=
 =?us-ascii?Q?GOxtpxrtqq/SqLXxZXoK6fZgWEuBbjmZ7LsQ7s4VSRdLaVlzC8+mtWWVZiDA?=
 =?us-ascii?Q?HtYSn2qFgxPZs6Bh8KMjH2pF1WPWf88w911W4zvkZV6HATsoa5Cfh6r6KPO/?=
 =?us-ascii?Q?z9+jxgoeoEOLmOuumdtSDmB4zeRTm9Ob0DDsIuqRFZgDW70Gi8bCkdeWlBPk?=
 =?us-ascii?Q?FoNvgAvRJ8SiqwLUF4FdKzqnh7Mw6D4a7Lhu?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 13:09:21.4696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e49017e-49ea-4bf8-8a14-08ddfaa26956
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0636
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_060929_667747_20D373FD 
X-CRM114-Status: UNSURE (   9.44  )
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

Add the "bootph-all" property to cpsw_mac_syscon.

This fuse region contains the internal MAC address. Without this
syscon node enabled, this interface will get a random MAC during
network boot. This is problematic because the AM62Ax network
boot is using BOOTP protocol for some binaries and this protocol
does not support dynamic lease expiration. Therefore, the DHCP
server can run out of free IP addresses.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 9ef1c829a9df..f29279d1e4a9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -28,6 +28,7 @@ opp_efuse_table: syscon@18 {
 		cpsw_mac_syscon: ethernet-mac-syscon@200 {
 			compatible = "ti,am62p-cpsw-mac-efuse", "syscon";
 			reg = <0x200 0x8>;
+			bootph-all;
 		};
 
 		usb0_phy_ctrl: syscon@4008 {
-- 
2.25.1


