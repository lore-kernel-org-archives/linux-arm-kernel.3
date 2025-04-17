Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC98DC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b07+5MlQvG9FNgEIFayj9q9rv7iWVzkyg+aCGeR/4OE=; b=r62sdBXLwjgJsjaQjHHmnubJoM
	fgfSXnIZ64isMEDXStcE4qCpsT6PrfMDwzZbql+TzB/RrKJs42n20zzu3yV3Aad7+mV4B/cvsNbKk
	rgIdBOWdLVccVG+FZe5Zbgd0isU/ePxaSEuuYYpLlEXsBL4EfzFjueHSxBgpYqm13jh0LFBIxyg05
	tH5H12QAao1PWIFwHvEvsvnyPTWH8WKfagAYlq62ojtAlz5rilqR3HgertFv8LxtVchymNl4AA/y/
	zmhv2mhIlKIqxlYhWhKv9fN6wzURoFalpTHmEFvCWndu34IuHmWLbLXExFDaLiBnOtU9awnvN3zAR
	ncx6xGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NyH-0000000CrbN-1RTU;
	Thu, 17 Apr 2025 12:03:57 +0000
Received: from mail-vi1eur05on20705.outbound.protection.outlook.com ([2a01:111:f403:2613::705] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5NwP-0000000Cr9Q-068t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAUNZoEin3yojK27QpSjk3tyVrB8b7/SdPNHKo0oncDgPbjvA4ZMQAfW2Jr7nEtNpZ5D4R/3MO+R+iwlqqO/qdWFzckOVj4p5c4e0qMldvm7lFqwlmSufBKStRYeoz+tl8zJPqJUED+ku3fKSSQIWQnLC9idTKfh5pwoYa8XDluUZCjPgmVrILkvlxU3FyWLOVFexCPpxEEOH5KAT16Xzllsyk58fGJrAEDV48xzvk51Ce9kC4tWCAFCQEvKQi8jbtILSLvNwfPPA0D+ufKVKmmj8uk1jwaCKXw+1IkrG0aQeKdO3F7lO7XPe+8BLJcJYuwKs5Neq5yB3slGKgCO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b07+5MlQvG9FNgEIFayj9q9rv7iWVzkyg+aCGeR/4OE=;
 b=MakGwKU1X2qYXgEFCMvyV4BYeU42/HLWuSYlJYaJg3OBCLUy1kmOGDsKs6jDaJYvqa2BFzb2Ok+SVnzNswNfOrqsB2T5LmVSuDfcKdMBfo0LnokAk9ObFHaCsHoGxD0Lx6GlxA5dNimfbWdMzNWUF7Kn1P/nHmJkNA4Y8SFxUWDHC1ulesR7TI66maiEP6CUKIhJIEb2Q9OC9pxk6ESSkr8JY3JFLD2iA3/D8hbV4QoPm9VE0hdtqIUkePBGFztWGfGiBSSzhuCC7QJ/vIubZwObHO7O87LNuUK648NWwtfwoSELzkgHG6m2Ug+AN+2NVoh7eCLedcm7C+FIyFRLHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b07+5MlQvG9FNgEIFayj9q9rv7iWVzkyg+aCGeR/4OE=;
 b=mvNHFNUB/M8rAZzCOvAiAt2pN7wnWNbxB3u0Db4zy/IOR60/q98ls5tWMI+iBxOivMQZBHHxO8OJdOQeeQH6P2CAe0pIEBWVsz39cuwu7kh+/xxx0uDuKluAE4rIpII0ZqAlZS0eYi26dbiCMyHg6uUN4HbKml1JOMa/Nko0TohYA8kWRalEEhBA4yvgKEGSUXNljtxOR0I2XNe97BA8BjdFv4YooRIsyEyTUt0qBzk+EYUxJDTQwPFbIrbFsjyUHICABKQbJd4aO30NY1ZVYNjlRjRi517NZZpTRunXIum7x7Wn9XWPLDjl2sgfUoPxO273S1MDX/2hdCspFLxGxQ==
Received: from DB6PR0301CA0090.eurprd03.prod.outlook.com (2603:10a6:6:30::37)
 by AM9P195MB1299.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:01:49 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::e9) by DB6PR0301CA0090.outlook.office365.com
 (2603:10a6:6:30::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 12:01:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:01:49 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 14:01:48 +0200
Received: from llp-moog.phytec.de (172.25.32.59) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 14:01:48 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Thu, 17 Apr 2025 14:01:12 +0200
Subject: [PATCH v3 1/3] dt-bindings: add imx8mp-libra-rdk-fpsc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-1-ccb885b38ffd@phytec.de>
References: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
In-Reply-To: <20250417-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v3-0-ccb885b38ffd@phytec.de>
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
X-Originating-IP: [172.25.32.59]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AM9P195MB1299:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f57d56b-0d11-469b-51f1-08dd7da7a297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGVLeEwzSTBjaWpEU21uNVEwaEEzWDVjQWlVdWx1ZThNczF5WFBlYmFkeEZs?=
 =?utf-8?B?Z1N3ZEpWQWVWc0ZUY0tFMHN6NFRuWWQ5ZXJTbHhUZW40ZVd2N041a3Ewb0Zl?=
 =?utf-8?B?R0toNko3b1pIcHhHVGZqZDdYV1VxUDR2Y1JZMG0zN1FtV2JVKzRIZklzMlFx?=
 =?utf-8?B?ektHMnJEa2l2Y2xrWitmVVFtWEJIaWhEUmE1dDhPUGFDNmgwWnptOFFKY3dy?=
 =?utf-8?B?a3JlcTRSRWJBdXhOMHBlVU82MFIrYktWZlF1M2NJZGFpOVlMNVN2bnAyMnJq?=
 =?utf-8?B?TVNhWGtHbTIrcml1VTRqeFZVTkhSRmxYWThwNTlDemVsOW9aQWlEbzNmZm9J?=
 =?utf-8?B?WFFvM2xhTmJtL25NSVBYWTFNY250VGhTZjUvWVo2ZmpiMndrTkZ3Qm9WUGlN?=
 =?utf-8?B?MGk2UXBQT1dMNDI0bmZ0K3RFcGZaS2NCcVhhdVljSHpsQU55SHp6bWduTVFF?=
 =?utf-8?B?WERGTHl5R2ppeTA4aVl6eHJSWlZPTEdCSlVlSzQ4cmlWejlyL1BwRC9DVWV1?=
 =?utf-8?B?Y2txRWtWS3VlR2N5TWpDVWIySExuMTJZc1lZRmxIaGxEU1BQVGRhOC83a2Jo?=
 =?utf-8?B?VVkyYTQ0UWpBZFRIbTJXSTdmZ0hkcHdkQm02elA5Snd3OGQ4YWExQTl1UjVa?=
 =?utf-8?B?OFBzanpyc0s1QVd1T2M0aTBqZFJHM1FWNDZ3ZDl6SzhyT1NBS1hNWEg1ZkFl?=
 =?utf-8?B?RnB1bE0veWptNCtjeXJ3U0tVQ01JNFkzRXM3ZVdkMzVnemdsZ1hqWHZ1aCsy?=
 =?utf-8?B?ODhZSGlPcjJzREJJelFzNkF5RGVEUmNCWFhuUTcwQ3RGbzNOek05S3d0cXRM?=
 =?utf-8?B?TEY0aHBvRE8vbysxZGhJUVpmUkZRUG9WZEZrZkFsKzI2VmdzYTdUY0xkV2R4?=
 =?utf-8?B?ajNWVlVqclJuS3NvU1VXTnBZL281VDhPYlpZcjRtUExpb2hPZVd2dTk2bFRK?=
 =?utf-8?B?L01PaDVYQXJ3bVh5WmZxWUpQYjVNSWIxNUNzeTdJYXdzWTBrWGhVQVRDMUVX?=
 =?utf-8?B?dFNYcDcvY3hXZE01N2R5N1JKVWJwZG9YSXpiTTkvRmc3U3VoeDRtTFRSTnF2?=
 =?utf-8?B?bzNDMFRIYVR2QUI2c1pqQ3NSZDJxbkNIRmRIK2JHZmhSTzlXYjcwYWF6WDJu?=
 =?utf-8?B?MFNTbFVxMGpRaUYyNXJmWGNURS8rOFZTQk05a1JPUGFGbWpZMXBNY1ZZTDNZ?=
 =?utf-8?B?K05Xai9kdmdoYmVxeC9Cand1QUwrRy8yQ2RhU1BnNWdZOHltY0djdFJ5Tlpm?=
 =?utf-8?B?TTVwdnVrUlZVWmlwR3hMMGZZbnBJdXM0Zy8rWmd6cVF4b2kwWCtSbFNMTkRH?=
 =?utf-8?B?UklKN0NFbG92RnF5ZUNMb1IzdGduZ3ZIVTdqL1crSzF3R3loOE9rbEo1R2Ez?=
 =?utf-8?B?RDJNVHdXZStUNDduM0ZHUFVHeHNjZnZTN0ZOcngrZjk5TTcxdjVoQzladGpX?=
 =?utf-8?B?SVhYL21mTnB5Vmh3RVhVKzl1Rkx5MFZjREdJd2t2bkJaQVlEK2V5SFhXOG9D?=
 =?utf-8?B?RHd2a0VJQURTOGJoVXkxS1JudFpOSERGREY3MWs4VVhNMmNXSVFzeXJvbkNu?=
 =?utf-8?B?VGtwWVE1dWkzbEYyRHU5NHFnc1V6T25mcnJKdTRNYk4ydC80RFRjcEFRRkRy?=
 =?utf-8?B?c2tZYmsxVWVkS2gyMWFvSzdmcGUxM3hBS1JJdGpjcHp4RjY0NTFJaWtYVUFK?=
 =?utf-8?B?dDhLVTlTbVpjREdBSmU5c3gzVnBoNkw0a1hZR2NoTDQvSXhleHZhQXM4TFR4?=
 =?utf-8?B?aFZHakZIR0cybXJxblpzK2tKQ1hRN3ZwNlgyV3NFMGdES29hUWpra0RicGov?=
 =?utf-8?B?WFVTdXo1QzZIK0paaVRBMjBYRVpRTnZ5aDRCRUp6MWRmd3hiQTJWb2tVbXFx?=
 =?utf-8?B?RVY1QlhpdDJ6cWRnczY4T29UWFdFWSthd2lnTk14WStobnVGNWEvRmJVYTln?=
 =?utf-8?B?dHRjRmtsUmsvTXVOWFcwQmdJZUt1NXdkQlZFend3MTVDdi92eUw3VXU3SEpK?=
 =?utf-8?B?UjdaSU5KU2FZbjhsUUoxNlVSRk5aajh2TFNUS2lsZ2tVNE0wVVQ5Tjl2T1pr?=
 =?utf-8?Q?C5Y3tx?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:01:49.6622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f57d56b-0d11-469b-51f1-08dd7da7a297
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_050201_067582_114B0C1C 
X-CRM114-Status: UNSURE (   8.02  )
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

imx8mp-libra-rdk-fpsc is a development board based on the phyCORE-i.MX
8M Plus FPSC SoM. Add its description and binding. The
imx8mp-phycore-fpsc som differs from the existing phyCORE-i.MX 8M Plus
(dts: imx8mp-phycore-som.dtsi) in its physical form regarding the ball
grid array. Other differences between the SoMs are missing SPI-NOR on
this SoM and 1.8V IO voltage instead of 3.3V as found on the existing
imx8mp-phycore-som. As a result the imx8mp-phycore-som is not compatible
with this new libra development board.

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
2.43.0


