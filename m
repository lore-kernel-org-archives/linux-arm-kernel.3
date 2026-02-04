Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF13DE8B389
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=641mfZC9UhARD4jrIgtik2gClfPhuW2WKmijqdYnG9Y=; b=VUe8VrmgU185Uk/+IqnBs28Uop
	5d2TrK2Q2kR/QpLgn2700dmVDfFQWfYL7agKrvVKEo2+UWIEmTdeVnNrZ8rD4HDdqOfo9ZuVgvt1a
	qjvXlByQkmX4NeWtlQTK6k8DOkYRxeSg90mFRn2uyCHCy55OpMvoFPvCUM1I/SrloV0bbFR0eXnPf
	zI/N65Nb1lZECyitiF5xeDeNFLutSdNqwSaUXDvZtELmwmBQd6/Fk6CbzQoQNg0c77bWAm+QIiuTi
	P4LgQLQmUTOfXg6tjOvWFaGWztbuXvtbZN0ZTF7phMt6LBAlWINSamTm4EGfQoblF16jlMAejcdfX
	ouoeebUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSIE-00000007kBo-0yIG;
	Wed, 04 Feb 2026 02:06:58 +0000
Received: from mail-japanwestazon11022082.outbound.protection.outlook.com ([40.107.75.82] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSIA-00000007kAc-44EY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AowMmUIq66gHSh6dwezvjhjagxYId5zXiY3vRp+aXnrieaMNWV+df+Ow0nUU5EP4vCliTPdS4FNOdmHbxP9xnLIIlfquGklwoICxuViUw5BHf3fr8103EDfnhpiRGleTXav6EqXPxnNNjfKcUf82c4J3Ir0audItwVFbrLL4XzTZoWz1BIh6AronbXqUGhuFtqpFP5kxBgepZB9Hki4EWVfERX5ldlg61D6EtwJyXQ5ntmjJUlCQ8C5fKyQHgWe/W22XJ4zmoK8jLGuzODjR02REZ2f5EF2WlAqRWwHvf3RhooFjRfQ+SMtevI7AzPzuUVSELPrEKW86VxH1kMEA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=641mfZC9UhARD4jrIgtik2gClfPhuW2WKmijqdYnG9Y=;
 b=r0WrQ9zhWVQmnIZGhAnfI0+YE3p1sKwRriYZATw7fS1ZjUpwsvQeq2krcTHqWFYVFFH0tzzZsMwTohRjFJJcsHwyfvtfhoeETjOKNEq1ZYIPPynKHzDDtQ1wCjNiJ5bp8VGbOFM1WiP0b3rbLBCW6Luj8Ln5xUl2Y7X1d+jTwAfVPCq5bMYzcP9xB+zTP1qg7sgS909cvXiMLLujvWTgejvpUIXWZsPsMf41kgvh95Labi0T+CHDwqZux3RG88weOIiYx8/wr+V2SZV8D+eBxHjBYZLvLAMwSHf6hVuioumG0ZVOovmK3F/WBdmYZu1LfpRHR/fLc0VFK3DOdbZQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0199.KORP216.PROD.OUTLOOK.COM (2603:1096:101:19::22)
 by TYZPR06MB5249.apcprd06.prod.outlook.com (2603:1096:400:1fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:06:46 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:101:19:cafe::eb) by SL2P216CA0199.outlook.office365.com
 (2603:1096:101:19::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 02:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 02:06:45 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5BB5A41604E9;
	Wed,  4 Feb 2026 10:06:44 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	alchark@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v7 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Wed,  4 Feb 2026 10:06:44 +0800
Message-ID: <20260204020644.155094-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260204020644.155094-1-gary.yang@cixtech.com>
References: <20260204020644.155094-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|TYZPR06MB5249:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 505bf1e8-377f-4708-b53b-08de63920c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|32650700017|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kt77FIQ11LUmymdTvSIQMA0n7SDRYF2sFks8iFSWPNPfEXejhr9BCNSBKdy2?=
 =?us-ascii?Q?QqPsf9DIkamw0EjI+2/0701nJ9QxvLRQ48jRb5v+oZS5c/mwc17yPm8GfA9F?=
 =?us-ascii?Q?gpMUfPsTD0QMekxDsDV3yBSVHruuA8ItHOPNQlpW99cTNxDoGnYuM27w14+s?=
 =?us-ascii?Q?UTsVzhPEiilPoDYiM5e4eYp4Fd+vD3z+SWNk0bA2MS6GvqxvYEGrHf7LIUD8?=
 =?us-ascii?Q?9LiZJxBsKk/FvBvWaqihVPkVfR1PMZSgkt02Avzmk3R++AgTzRIYJRwR8rOT?=
 =?us-ascii?Q?Qrxu46wenYG0duML0d1rxKHkTtWS4Z95TuaXcqiudLUVxc8UQMw62mNY/5H8?=
 =?us-ascii?Q?UGBiNZOJkHCg7L8PVCGD606Fn5SXu6MDDR/QLr79CBw5zQXhAb5qydETfpkP?=
 =?us-ascii?Q?p6QU7293lbz1yNkiuRUHCGjDPRgxj97Ipk5lPiQ+MgNI63T09l3aA/xjLluQ?=
 =?us-ascii?Q?E174SWnKixtptx5nNAx42MC9LDKA2Jiu1PjOn4Kib4+38uPCjhDp376p7YCf?=
 =?us-ascii?Q?LHFIw2MAi6ODiqr1LHrRoxHayrM8iVjjq2dm0gtj8U4Hh96KelksEWkTADUe?=
 =?us-ascii?Q?nFxvp88Pcbj8tmfxC4sWRKW8uPwyz+CokMOMW6sTJHZa/DEHzPKJ9VlsSO+6?=
 =?us-ascii?Q?K/JxR0bVQUDs2tadlbL56kMYdtg3mwUTKYhuiBgSHqs1+0Aqghq7Q34zGKNz?=
 =?us-ascii?Q?96pkVrndHrwISTIdLGTerFNFWrrNDD6rgjvLdcHdK8MR9ZMf+9IrXK8tHIRX?=
 =?us-ascii?Q?fIEZgVK9oEWCv5tcn3regnxWKbS0RNlMHhSTdyT5gX+5cXEe5uy+/fbkVTg1?=
 =?us-ascii?Q?gyUugO/p6RnDrKep0RqXcsO2dd3fggQ9UhJzSc3C/LoUC0KamMtEotQGVW7G?=
 =?us-ascii?Q?/rgMa8dqCSSB2g4IcNgiqfKQDRH08NwcN2Q8LWFevnZzLeWRkLuqRcRcVJ/c?=
 =?us-ascii?Q?avQpOVM4wSRDAjOZwORCz5QdWqbIOWA0heHMbU99YOYdxW34eEj5KU1v65eB?=
 =?us-ascii?Q?c+XuiLEXu0a+7itBeTGZsveZSpCfPD1QveYZ/3/S/hf0lDPpOXfk0d70HJqM?=
 =?us-ascii?Q?bCPP35G0mNz94TgNaoahqTk+q888UT1AoIAZW9XA08yCUsvz2IyJIm3c0FVR?=
 =?us-ascii?Q?9wJ4KOZRlovGVxqoPmix4H8Xx8sOiAdphuBtclA6QHfchRyMvhbrdZJOwIml?=
 =?us-ascii?Q?jC2875U+ef7Mm+zO/j2HHlGqm1DdTRSzwQRsKSslUIsyOcCBGBzC8U1LI1+t?=
 =?us-ascii?Q?avshhznJnDlzVRiwsTIH5wxdXn5fJojXDYOEuNaf22NMb8GOEnQPK/efOpWh?=
 =?us-ascii?Q?WUKmgM8K8J/mCwhBa+V5WEDrD19vUt1dGGLbSjwBF3DwnphY2B/Qf01TTXkD?=
 =?us-ascii?Q?EwjAjvQOOa6mpV1CzhpIaH10rtNrQp//72LHhjhXOWZ6DMlrUne5ScWfaEJr?=
 =?us-ascii?Q?Ln4zARKXV7W0mZ44XgjL0dmwZhujCBWbO0HYLsPsXKEowJOh2K7prJUlJzTH?=
 =?us-ascii?Q?cnno/U4xgIB4wDenf++hA3a1HBOE1pVjmOfqAkutPTllp2Q2iZrCU8hGOAo/?=
 =?us-ascii?Q?pqLGvxI0T386Xdc9gv6sxPrg7taZ2WlMfhoa2eP3zw1TcGoiASmnLMDrugul?=
 =?us-ascii?Q?8468sy6nCAG94twv+0q43sw9O/wBQ4tTljw4IEvMu9OgPlexgWVQn33AQgu0?=
 =?us-ascii?Q?NzfEZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(32650700017)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /eaMNeJ6PjcaQnzVAwEr5KSjW9GRK4oMxvRITqBpvVJU0LrdgEFpG2vKth0UR1zmcJkZNpAWubmiZh1LRYhsiShK8AK2Qzdlc+I6H2cmtmsRtVo0pjP4VCsIQWFjd3QBt17/3FubZ8EZA4mj2khJwl2HzDIS7H9BZmxr7c9gN69FfP65XurqdeMhW3UmNN9Y6tf+MaxlXJd7ujfEn+bx7AkIbyFveud4mOknAzo8GfAiRlWa+WRb/J8LXKEhYAu7v7o919nSRv+xfHlD/q0VEZ9rgYp4dpRV7clOUpoEkVo+Y8JWG5ewaR7U/QC/RH96n4OVMsiBYCOTQKH76j1Rs7bJCRSTLxiQ/SpcKV3BrS+FaFyHnV760GhtE6X6jIG1fRKohxVpaQRa+KbqDIvba68mnUZb0XIRuq4clgZwuhCjagKqeF6attleKQyJX405
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:06:45.2579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 505bf1e8-377f-4708-b53b-08de63920c3a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_180655_002966_ECDF7598 
X-CRM114-Status: UNSURE (   9.73  )
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

There are two reset conctrollers on Cix Sky1 Soc. One is located in S0
domain, and the other is located in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..37dca97b6b67 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,13 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@4160000 {
+			compatible = "cix,sky1-system-control", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x4160000 0x0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +575,13 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		s5_syscon: s5-syscon@16000000 {
+			compatible = "cix,sky1-s5-system-control", "syscon",
+				     "simple-mfd";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


