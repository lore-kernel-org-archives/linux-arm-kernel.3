Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA4FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buoVXNhmF1jeahlagtzyHKLHczoBcDE5+4KTZwBjQ70=; b=sGih744Or39P44DiDiVUoH0/zl
	NKSztxOHztu0aPkPtRgyqzH8YCvUdVZWrN3dXHbijizLavL8nt2z2+g9R/Xyq9KGtfOFnKyLfuqPS
	OkvrtFW7WdyySpqqFLNEk/hXkE0/0SAg+qtLh29HdmNkdB6ohmWx1naHppfIyPZFGd8uApJcDFtDq
	moAg+SQyBo3gyUNZ57pExYtVS4Il6uNbmcUmCMf2S+LVHilzwBtBUH0p0r+RtfUkM7AH/C27fK61Z
	vNjRT67ec2hVzQU9yb4u3Vw1rCoSn7UXoHwGu2auF7hcJ2I72uNk8EwLs6pEINNwarY4gcL/d6n8y
	yo/XLijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNIG-00000003fhm-3kGT;
	Fri, 09 May 2025 12:57:36 +0000
Received: from mail-db8eur05on20717.outbound.protection.outlook.com ([2a01:111:f403:2614::717] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMeA-00000003YLz-0wDO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:16:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9tYDRn3ujVLMrldK+kiCpAiK26zzAfJSGtD/jSGP76D/KDu6DZlW0KsJqgYK27gaWVm7sLQHRVjqtW1896v+xYlFFZp22FGEQUVKrm8h8g8kZ3hkHehzzwMUzrHK/4VXtZBVROqhGzfzFAiz5A+wVzATjryGUCYFMaupYmv+WMu29pGsf30SjMhwVWhzqGHcboEFojQ/84KOsqwia0yKPcnqGkB6F13V4eeLaHMRy/f4eC9eJcU+VgyBehiWYvHZKJPpF4R0exEDO113kjeXDLdQHAJPmdCITNGAYLUziziTAB6v9UQrjE3KO9Sdtq1isZZC895/PPQ7xPtvWT9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buoVXNhmF1jeahlagtzyHKLHczoBcDE5+4KTZwBjQ70=;
 b=fnOYouzizFiQpt5CpBHttHpoabzqWgyUrKPJn8dpvmcsHHB5RiaJ5JAvkbCP3DvYCGt1+YkdRWzGztaAT87V4R2aPcMsIGGtWkr7NMUmaKpzMBIEbsSHnXtJR8AtqMAq+OFL5PTd+PbcGN4fQn+vmbia3CkgTbMgAJu5cljt4GA1FfM8rcCRTGj+8r8aeaNRCGfz0+IyI7T3Enzn1FEAG/48d7ndVK+2MIR9FWrmHLSiiwPgy7lchjkFyuEOBLtv81j7etU19CpWS+k08ijRTDARe12GIAVdPhT3HU+NF8JD0kLtQl2vNejgov7gIhY0TPp7As2ahz0IlMApB+v0gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=arm.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buoVXNhmF1jeahlagtzyHKLHczoBcDE5+4KTZwBjQ70=;
 b=EltGWmXE5pTnJmwUM3x2MrzETHVwXjy8c3+hwwz0AjY1TSINCfVZWJmg2F63TphZYw4BTTOKeGmpKUerXGFnGMPs1a9dnaGQJpW3OwhErIblQVbwGfcnAVRR8KjA5g3srTryPU69UqYk0Qc1N3gGNMeNB4T2KL+qiU1rmlnTLki6InYgHRj2JkEfEFwDG3yVNDwEz9y6yMe4mGOCAUgyCxq4OGzD/rMhlhSaM7GT0A04KWEFccELHnbY7Wut01/88uYlz8vUFkv0Q3+KX3IvqmiYM7T3Zn0bXJCVsg2AlEIWbz3rRY/Vyspvu2bjmwU6Hqi/3uPy/g1GaJ5rq1eHgA==
Received: from PAZP264CA0135.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::10)
 by DB9P195MB1633.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:37d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 12:16:01 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:102:1f8:cafe::e3) by PAZP264CA0135.outlook.office365.com
 (2603:10a6:102:1f8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Fri,
 9 May 2025 12:16:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 12:16:01 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 9 May
 2025 14:16:01 +0200
Received: from augenblix2.phytec.de (172.25.0.51) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 9 May
 2025 14:16:00 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 9 May 2025 14:15:50 +0200
Subject: [PATCH v2 1/2] dt-bindings: add imx95-libra-rdk-fpsc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-wip-y-moog-phytec-de-imx95-libra-v2-1-b241a915f2be@phytec.de>
References: <20250509-wip-y-moog-phytec-de-imx95-libra-v2-0-b241a915f2be@phytec.de>
In-Reply-To: <20250509-wip-y-moog-phytec-de-imx95-libra-v2-0-b241a915f2be@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <upstream@lists.phytec.de>, Benjamin Hahn <b.hahn@phytec.de>, "Teresa
 Remmet" <t.remmet@phytec.de>, Yashwanth Varakala <y.varakala@phytec.de>, "Jan
 Remmet" <j.remmet@phytec.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.1
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|DB9P195MB1633:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1b921d-1fd9-41a3-b0b8-08dd8ef3438a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VC9BTUNtSEhJZWpGa1BKdVN3ZW1yelFVWDQ2Mm1JYjg0VzZQTlFZMnVyOHR1?=
 =?utf-8?B?TWZHc3VHU2JrU2lnb3czWVRScUNzY3YvRUlpdFQ4TDU2MHNmTDVYK0gyS3My?=
 =?utf-8?B?YU85dFVYY0t5d0h5dXNxVVNZUGp1Rkt4R2ZzWDh2endPV2d5d0hGUkJLRmVT?=
 =?utf-8?B?ZktnaDRmVmNMakhHeHZJV1hxZUl4VnNzdFFYOHRUakpjR2ZIeFRQVlZqcHdv?=
 =?utf-8?B?eHNBeEs4QzdZcFVKMUZRbWxPK3V4SkdWQVpxb1lLNXVGOTRJUkVQb0E2V1da?=
 =?utf-8?B?VHh0R1NHUk5FL2VmR0J1YUE1RFBtUnhWUXhTSjc3djVYQ0FwUGVQcSt1VjNG?=
 =?utf-8?B?a0JEY2d5eERPcTdwS1ZYVzNPV1kycy8vQ2VZUFhmVTZzTlZNMmZLOFhBU20z?=
 =?utf-8?B?RUhPb1dtUVdtblYrL2huNEJXSGpQbHdaVUtaRG90aFNBYkd0V001b0lYSCtW?=
 =?utf-8?B?aTBsT3VQVHFVN0FuamhkZzZYWmlDdDZWRWU1VjNNNTJUaC9xKzJ6dlRlL2hm?=
 =?utf-8?B?OHRiOFBOQVJCcVhTeC94bjFmTnVuV2NJODNVc3VJdVVkQ2FWTUxvbDFsaTJE?=
 =?utf-8?B?dGNVWTgxeVdWUWcxc0QvTXVDWHg4T3B4Si83VG01dkZ6TWR5anRNNldIUW5D?=
 =?utf-8?B?Z3I3V2dpOGJvbHNDeE9EYkdqWTVhaUpDTWM3d2VrUjZUd2FuMW1NZ1VZVlRI?=
 =?utf-8?B?c2R4MFlBQlpCRmtlZXRIcmY5OGdNeGVnYlJjYUo3ek10aVBtVENXczA0VUV1?=
 =?utf-8?B?WmdjTkJsdzN0NFRZcVY2VDlPbEVXSlBkNFMwNUhpT012VHIxOXJJOTZRM25R?=
 =?utf-8?B?N0IvTWNlcis2b0U1cWpld2VCK0dvTUUzVENKeVBFSVhVMW8raVNSWStVUC9N?=
 =?utf-8?B?SWNzaWR1a0puVmdmNmU4Rmw3Zi8xUFhBVmFSZVBGd1Jsc29JT1NFeCtOTTE5?=
 =?utf-8?B?bWpCYWg3bUZuUDJtMEJXSEVaVC8vNzFBQVZFZmdyM0hBaUw3aFovL09vUzda?=
 =?utf-8?B?S292MHpKQW5xdnlnWVdCeGtuTzhqNjhFQkVPanFTT2xxcGMwbE1ySm5OZHpS?=
 =?utf-8?B?S2Q5VTZ5Z3VHUnQ5M0ttd2ZMU1ZiZWdmTkpsN1NuVWlGOHZSVWpEeHFFUmg4?=
 =?utf-8?B?YmsvRzZHSkpBeXc4YnNWYU83b1N5bzNzRTd0czczbkNKMGJJTmZaaXMwaFZM?=
 =?utf-8?B?YU9yUGttanFldnhtTG1pZ2lVaGdWYjJLU3lYOUQ5YmV3NTYxcy9VTElJaWFF?=
 =?utf-8?B?TVBCc3owM2o1NU5wY1JreWhkS2hKZVBRWFg0cUg4L2hyQUM4d0hKMk50T0xR?=
 =?utf-8?B?Wi9rOEYvVGJsVzhMdkprd2l1VlNHamJjeUMwWU5YL3FyZWJ2NHNEMkxoSkJZ?=
 =?utf-8?B?bTVGa0ZpRm5HSnc0S1MvdGt1ZVJqTzh3R3BrKzBZZEJ1WU51ZWhwQlk3a1pv?=
 =?utf-8?B?RWhrczZLWkY5bEs5SS9CZWdWMWsxZkRMVlNSUXEySlJTeCtielBUbnRLWDFj?=
 =?utf-8?B?UkpOOHpKVy8xa3N0b215aXUrNlZPL3ZKbnlGMi8xaDl4aTRZQjd5U2lrQXBN?=
 =?utf-8?B?ZHBZOGQ1YmpLZTdmKzF1cGovVFQvNWFUYXhBRll1eGduOW1iR3hGQmVER0Q5?=
 =?utf-8?B?cDhGMmZvMWIwQnJGYS9JL1k3em05ME12NXpSdzEvT2wwOGlIRWlrTE5aTUt5?=
 =?utf-8?B?c2ZhNkNsVm5TOW11YWNZdkcxN2owQ0hjNTgrYStYemVoQ3dqQks5bVIrTXJ6?=
 =?utf-8?B?MXM5aWlKRWdrVGd0S2RUUCtWMkM0MHErUTlWRjdwclNUUkhLeUhkY3AzWXVP?=
 =?utf-8?B?OWE2SkgwQyswY2tMUHY5czIwRUR3bXJ4ZEgzaWtmbllUZDBGeWJ1bFlJcEhm?=
 =?utf-8?B?K3pwYTRmVDFUVjVHSm80cFRTSmFqNHNMeVQ2WE9WVmx2ckp1WGV3Tlg0SDFL?=
 =?utf-8?B?RWUyOHhPWnZRYk5BMFZ4SjA3TTlrTnhSVktQbkFqZ3lJRzU3ZEtkeFRRTm52?=
 =?utf-8?B?NFZKbURsbjhJVDhSdmZya3FnZk9PejJPK0lMOXp4WFF2blQ2eklGSG01MHh5?=
 =?utf-8?Q?AT50Nm?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 12:16:01.7384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1b921d-1fd9-41a3-b0b8-08dd8ef3438a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_051610_570444_55272B4A 
X-CRM114-Status: UNSURE (   7.78  )
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

imx95-libra-rdk-fpsc is a development board based on the phyCORE-i.MX 95
Plus FPSC SoM. Add its description and binding.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 447054b52ea3..5484fcaeea72 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1366,6 +1366,13 @@ properties:
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
           - const: fsl,imx95
 
+      - description: PHYTEC i.MX 95 FPSC based Boards
+        items:
+          - enum:
+              - phytec,imx95-libra-rdk-fpsc   # Libra-i.MX 95 FPSC
+          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.25.1


