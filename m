Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BC3C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTLuWrxigCdYjUhCg0RKUWoK8ojEYDZIvP7o2bPbCdY=; b=1C532gGI0Xt1MlnUCQORvqAKgd
	Ck+P/ze3NTCtXorM48nYy5qeHNNWf2q0ne0nV2ZKOcuXrctZ/+nr2Ds3HZ0Db82qVlawJqUbqFx0t
	nFGUYQU8WlOGlRnNNCHa54KP5vpArJHmyHVzmo+CFAK6AP2n2dyJX+u/LPxwiK6uDzXIBr0FeStH7
	thEtVfjv19kjnQQdbGeMSMezvLwPrCGIbrznVoZ/ALN59QitFpjttMw5fEuFgoh8QLS/rzWP79ccg
	4QmunD365WfOm5zywxOg4+i7vQ42ZnhiO2ZW7NGd3aaC0AkR12evMnFORLqGFWKltH+d2Y0GjIcWD
	uw3+bmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Inp-00000008iQY-1PVb;
	Thu, 03 Apr 2025 11:32:09 +0000
Received: from mail-vi1eur03on2071d.outbound.protection.outlook.com ([2a01:111:f403:260c::71d] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ilz-00000008i8S-2BqV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 11:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTT8JajrjFJ8QSbsZiTQiiRPWK237ojW7DCXYBM7+MR4rTQpck2K0UxQUW4yVTzCSuPYjYkppbYO3xa8NapSl9WL45zHgAv7NEP7e/gw2XC55Xi9i3G/jher5KPBr5vsKHs+nJU3A65QAnRBb+PVO/tCJ01k81aPuhy2in3A6y6pBRl2q9aEJoxIdIwywwHJMBXiBZ1AATltEt9OlHuDlSQLtnKEATuLwSDDglUTwrSEPzZ0TqFB2tFxTV2fontfRcSY+nbbV0vzy7CD1Q7SV/2gx7LjVeOmV2op6glqX34hijv4k/6y1l5zZGrRxikhBBvww7RlY32LVpsZ6oAbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTLuWrxigCdYjUhCg0RKUWoK8ojEYDZIvP7o2bPbCdY=;
 b=i5MXmmwg1BpyVVNPDbRbBKIqTJXiJR/N90kpAg3AyTDioHw2F9KMNyKa7Tl0x8ElMlrePd7u5NdO7qhtmCW7yCzhlvQvY/3adlhCVeX8mS90iBo2zMnW3LBoQfFo+SaPc0THVGAJnqTvReFSZP89bZxbAUVnERm5kGo7uq64n7zV4aJvamYQwgWJIrJbRJ3Z5XBROz3zouHvsdDkG+H6UNrMxiNMiWYXRoUwjVYiSgoZVbRkkRcRpjAfwDzHoTWlbsBGApPi4tKd/CipK7AKqyJkNjphNKHaSKZP9HkxNW8nZhenZ1Pzdop4GDQL5gmKu4bd3hUqF5Ryk+032i9I0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTLuWrxigCdYjUhCg0RKUWoK8ojEYDZIvP7o2bPbCdY=;
 b=PcCQUUTfTCpGaGbbnxSzJUBVWgDm8XN3hthzFTj6Tc0gC1T6Odv6v8Um8KPYCisom2obbQ1QGj36UmwjBBtK43YTnBCq9RusiYLniim1CLFWwEioz+z9WpxsVFnihMbk4xFITzF3MxeCMMrsHL0fkCXPcV2WKjqM6woNh5awvJbcMlruZpKQnoQg6AgY0kwnNqHL0abpr7w3PdPX3PQdeqwspSE79WTeQiQgukXgwRlTJ5DlXAx4J3vwvcKTsfxB0NZHDkDTA3KElVBkvvvCe0PwZceD8lT7GEq70G4uIc4c6On2xMyI3CmhW8L6/3tRdUfKO5V65I4/clY+UkWTug==
Received: from PAZP264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::13)
 by DB8P195MB0600.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:147::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 3 Apr
 2025 11:30:09 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::8d) by PAZP264CA0047.outlook.office365.com
 (2603:10a6:102:1fc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 11:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 11:30:08 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 13:30:08 +0200
Received: from [127.0.1.1] (172.25.39.168) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 13:30:07 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Thu, 3 Apr 2025 13:29:27 +0200
Subject: [PATCH v2 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-1-c0d2eff683ac@phytec.de>
References: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
In-Reply-To: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Benjamin Hahn <b.hahn@phytec.de>,
	"Jan Remmet" <j.remmet@phytec.de>, Teresa Remmet <t.remmet@phytec.de>,
	"Yashwanth Varakala" <y.varakala@phytec.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.168]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|DB8P195MB0600:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef40e21-6a8b-42a9-db41-08dd72a2e3c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akcxTjh4VUxjMmtPZ0VNc2toWDQxa1J0bTgyT2FKWWhoUnNHRG9jbjhxZlhG?=
 =?utf-8?B?cXphRlNmRjhIR2Q0d3ozaG9RRjFwNXdpKzd3RWpESFlrTldXQVh5dWZkZVlQ?=
 =?utf-8?B?SmdXUnN1YWw3dnhWSVlac1RIcVhDY29VZjJqaytTS3lFRkphUGM1RjVNYndV?=
 =?utf-8?B?eHhJYnZMMmNlWDVReU5ySnl6NzVKTEczTHFFNHVvTTV1SmpMYTgrUlI3cHJz?=
 =?utf-8?B?emlRVjVEQnhiaEFVMUY4ZmlwejFvOHorbUhZMllwVHpaajBGRFFZTHIweGJK?=
 =?utf-8?B?d3ZjRTlEajNxc2F5bUdmVTdZZmJ5TGJ3QUhFMklXYS9rNUl6eFVQUGZDbVFL?=
 =?utf-8?B?Z0ZnSDZmYU1Fb0YxbElYVUJ1V1hwRC8wRnVjTWcwVUxBRUxhNE1EejF4VFBJ?=
 =?utf-8?B?L3BqVGQvQ2oyUElBcWdCdEQ3aEIrQWViRDcyTGVRdXFoVXV0bzB4V0ZtSEcy?=
 =?utf-8?B?N015Q2t1Q1plam1mV1JmN2VPRUhNdVBhTlpzejBGWVlDOW5NK1VxeFVxOTNY?=
 =?utf-8?B?VjdWdGVGVGw3Y01ZVXQrRFJhQTBOeXVIaVBTc2dWREtZS1laQ0dISUxjUkVG?=
 =?utf-8?B?WVNFOFNVTVpmdnZhSjdVVm5NRW9wYjJreGI0UlE2eGtrcUFHa2k3ekFHTU41?=
 =?utf-8?B?cWJBUG9NM25kaEFNbEdYMFc5VUdpQjM5Ym5IUGtXM0Y0N0lEM1lDaDZrSU5S?=
 =?utf-8?B?QWI1Q0xLUEpmUlIwQlB3R1V6MEZkaUk4VnpqQnRteWRpZFFUZFlURTFaR2Nt?=
 =?utf-8?B?SHg3OWRVaXE4MnAwbHBoL04wN2dXYVpMK0VrUVMrTGt1YkdEYUNsc1RTSzU3?=
 =?utf-8?B?SCtPc3dGenZIVWdJVVpDaHlCZno0VmZSRStYRUwzWEtUZEIyQWowK2svK2NE?=
 =?utf-8?B?NWxHN3JBYmtiYXk1anR1RWFJTkVmMlVpdllMQVBPQUZVTDcyOXJldDgrVWhq?=
 =?utf-8?B?bkUvYTlpQkpKbVF0UWFtd1FrRmlRclBOQVhCVUcxOExmaWF5UjZVRi9VVGla?=
 =?utf-8?B?dWwva3Nna2NxWWJHN2hzejRHekhqSzZ3cUhtT1YrenMyaG0xbEtFSGI3MGE1?=
 =?utf-8?B?YzlEWE1xRllKaStpVXR3UmE0MTMyUHBPdVBNeUZlN1FzR0lLWXZNci9mT1VQ?=
 =?utf-8?B?cTdIakEwZ2VxTHozZDU3WUJoREQ4bTNQOTBkVzdjSjRyNUREQjM0UXVVTDlF?=
 =?utf-8?B?ajZaUWFzNHJxdjdKWEpLU3BPYWZEQXNpNWJReERXWHhabDVNS3R6a0tacVVH?=
 =?utf-8?B?TVlPa1hKVDQ4d2lCYnBqM2Y2a2hOMmVLRmNOcEtRQUhucGljM2QxT1FYWlRk?=
 =?utf-8?B?RlRrdHo4WlRrRDFaWW9TakJsL3crYUFBRHVIQzR1YjZNRkVFQ0pCdjRPeXBV?=
 =?utf-8?B?OUpKVXkzQWt2TDBhcDhHSkNxSkZSWmY3K2ZaRjVRc01KMmlVOVpQOHlpV1Vs?=
 =?utf-8?B?WHFBem9mQVZyQzRxYk5SaGVwQnJreXpkTlFtUFhzVEIrNWFENU9ZQXQzekhY?=
 =?utf-8?B?bnNoV04yN1RLYUpWL21QKzQ0RzN2Vy9meGdINzA2Umt2WkxDTHFVV2R1TkNt?=
 =?utf-8?B?MjRxWDJhRkgzcXVkU1lnRFEySzNwNFJnTWYyMnBBSXpyd1NhOHlGZkJWZXNX?=
 =?utf-8?B?dm5DeUt1ZnJDVFlwajcwd2VyVTdHTEVUN2pSeVdJZkFOR21YQmNBNmVXUUox?=
 =?utf-8?B?Nk1zeGdIS1NiNXNuR2JnSGwyRWNRL1pFQktFbVBUU3QwenU3QWRXY1dqa1dC?=
 =?utf-8?B?K1ZTbi82YVd3S0g2VWZBWkNFbmZEVTJiRXpobisvSGRGM1NLZE92NmxvVTEy?=
 =?utf-8?B?dDJoaS9VUGNPblNMRm1VdVVObVZoSVlpNzUwRHVCSHN0dVg5eTlYMkEvM3Ew?=
 =?utf-8?B?UmJuSjI0ZndMdmRzU0JPSWtZOStsRExtV3Z5c3NTenpVV2lRbEt6Mmw3cW1T?=
 =?utf-8?B?WTVtU0hGNGF1YjNkUWZ0OFJMV3dLM1RZYkRhT0RNSzNrSmxlRk9jTmxWODA0?=
 =?utf-8?Q?oMFEuvoFiKf+pLzzA76bGi546OzAu8=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 11:30:08.7541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef40e21-6a8b-42a9-db41-08dd72a2e3c3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043015_873144_9D20AB12 
X-CRM114-Status: UNSURE (   8.41  )
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

imx8mp-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 8M
Plus FPSC SoM. Add its description and binding.
The imx8mp-phycore-fpsc som differs from the existing imx8mp-phycore-som
in its physical form regarding the ball grid array. Other differences
between the SoMs are missing SPI-NOR on this SoM and 1.8V IO voltage
instead of 3.3V as found on the existing imx8mp-phycore-som.
As a result the imx8mp-phycore-som is not compatible with this new libra
development board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22e49355dd1f932bf3d84cd864b5f..22f05e6709fd60bef1d22a378cf0bd57090774d4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1156,6 +1156,13 @@ properties:
           - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
           - const: fsl,imx8mp
 
+      - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
+        items:
+          - enum:
+              - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
+          - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
+          - const: fsl,imx8mp
+
       - description: PHYTEC phyCORE-i.MX8MP SoM based boards
         items:
           - const: phytec,imx8mp-phyboard-pollux-rdk # phyBOARD-Pollux RDK

-- 
2.49.0


