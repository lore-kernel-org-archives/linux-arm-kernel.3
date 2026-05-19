Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1187FCD5BAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7vuOoNkUAvMKDLxJ6ugWI9ZV8BE+BMTxzxEE+I3ql4=; b=c4Re7ntW1B5cO3RnIPdiO9fFVt
	DwBj1eQsc3Sv0rfeoY3cTiadsqRqrq/WkyOGYDFxUKObkLZqwJ+HaLtISgGvbg1Tht/MNMBvUhQie
	PiwroqfGXgsMKn8nslvznFCJ5DDag0bbK2T9WATKJZ+Bmq8WT38ydlpODDpzWpZwFKZL6DvIgbwgC
	WAOR7ae99V6USKAZ0sGElCDJWRdGvGcSziZVT+Loubhamq0PBIAfAldxfYoLMOytxkqdNEtPpHqqm
	ksY74ZyQ6vHl/uxmwh/i5l0ng3KXlT+1qxlr5fvuLSMtBcdMMLXpr+aL/XMCOu2quytbxLCcxkRF9
	67ks8QSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLfK-00000001sL6-47hS;
	Tue, 19 May 2026 14:43:26 +0000
Received: from mail-northeuropeazon11011049.outbound.protection.outlook.com ([52.101.65.49] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLfG-00000001sFC-1fRK;
	Tue, 19 May 2026 14:43:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvGpglMk1+bO6pRXChNXcDZ23eMFXHGmhgOS3h3PX+WvnMv3wkj54503Mom/9WHt95/RSNQ+3NlPZ3YvN5tVqPfm9b8+64MjaUJIa94TKhGZxttLCtoeEaxcu2qsw8hAS+YKTN4XOn9CTaXmv1mXbxARiRM7CCkRD45o5WIGzkcmHCtNN/Kb/rrDcpTz94ope8FEunLYovEpa0suoEDAgfxuzwZWlsKUeN69P7wuJxjLbFxW3DKpgQIFPQEB5duLyt/kRX8qjCKgRmdpYUXStM8IvSqGr9U+HDUY7Yf995yp7a79o7r+7Y1OlUYzb376viA9abd7nQh28LmbVuavgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7vuOoNkUAvMKDLxJ6ugWI9ZV8BE+BMTxzxEE+I3ql4=;
 b=gGnymA1c5nN28Nunx931YxhnNpeL7I5V1sZhwOBNuHoWIHN2uIzUuzlwbv12Mw64cuPJs9I8HgYtJ4D/7hDW7m8EDlPNoyYIeSwUhYoEr07YTUiKesy2IqtvZ5oVRqhjYBS/DfNa9Du84PO+eYeWGJW8rZZs0Fv/pgli0z3p0GUtGvUc8q1Mb1RXWL00JHU5pPURJBElK1UtCt5WdxwSmy87Vd7e1CvREwvOQh7vfXxkfZIc+zPbsMAFEIxZ20mGuHYJn7RTLNc4AvCfsbIFiAhESFBBwwa+ZG00ESfMQzedDspqJWpQ6ga0DAV+2tfdeDjjEil1H9iWVGIwg3EVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7vuOoNkUAvMKDLxJ6ugWI9ZV8BE+BMTxzxEE+I3ql4=;
 b=U54jEIsaLYAhfMzilR5/DrBlAitn+uYYABJgXpp+GfkD9IX6t6eHPwYcA/JG8tyMGShr2GTpavA9WqjFA4dfFxIMOjiXnq1lgt8/Ba1xd/6Kql8FEaXSt47shtvfQZn/8iqzGF5opbALLRh2cqVsGjhtpffukUhbm8cFLqiadj7zYKz/aMh98Pk22rra1vj1xTnuCFkcgRejcED4zju0dTux//2ggbmmM7sPlrwuYyEIEv6OHnsPaKCtPUN1KaGLtjTtIWoPew+N2f0yR30/X/RVC7yuTHK/WyeSFY18VX48th9zSaksuE/Dew9LjdqjNPEC1q2QzJULwlyHU0ztAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:43:15 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 14:43:15 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ying Liu <victor.liu@nxp.com>
Subject: [PATCH v23 3/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue, 19 May 2026 14:42:26 +0000
Message-ID: <20260519-dcss-hdmi-upstreaming-v23-3-5615524a9c63@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::15) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: fe48f8d6-26c2-4792-b6a8-08deb5b4f5c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003|11063799006|3023799003;
X-Microsoft-Antispam-Message-Info: 2gbX8F7MmSQ/qH/qwRrAORnwR/GYvPs0/BZlYTWO2gffWGaFswSo6SRuWQ0P9QuZJc/5DrETmz7G6xdXBtyiP0Vm2nmzx4JKGcgBu70Q+EjnHY/PGB8GKw2ir2AuvvYDLQWJocdR54Go/F65v5AVRN3ngvNB57wV1CVOnGYMZPKCOE9Kd6a/c4L+gw6EM0EtiEv6VKAUe0hMeAQ8W/88vjrVGNJwi0p98QwyFPRqQeacbAJKnP7/mWeXWvjFu23GI+pXFfZgmkl4tk1vy8+MzXNMwH2Ssq2qIVsLKxlNKkq907QI1LTJv85/IiFTXAoYBdGtlSuVmCXvEVVBgKDjQd6tMzlTBBjISwxyDJ47auQSt+cszqhyGnqChH2EiwfbYjByuziK4syEt5mEaoQgGqIWd3bskpHVGzhcw/wq+8rcY+3/aWsf06pe5ceJuxuxoyhgJHu8gCNTynxk6VHJZviCLcRMEilDJng2HwSl8X7iX8N9J3NaUHi4sEoxrnTLzCwruoafZMgWlf8rXm3UkcN7yqAO7gkwvMvxd4Bp6KQpsedxrYtgwhxc+pHCO4x105gpsVzwxCo56o0/N9Xsuu+Z02FAaVYRH12zOvl8ZL0DzbTC0/tI8bd2WLZBC6M9OaDW0GiqZHaCgiRZYTUhow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003)(11063799006)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkFOUDhJWVBBOGN5RzRwQ0g1QlM3OStCcEtrZ2pMYlh1WXJwNDA2ZklqL0Vh?=
 =?utf-8?B?d3JweW1LZWFHS0V1Z1A1WUw2SWkvK3dlRDdNK3dBZkRhaHowZk9ybjJhWHNY?=
 =?utf-8?B?VThoV2p5bVd6bjFvcGc0ZkFaVFNlOGR4VEVTMFhxelJFMXJyZ2V3R0tQVjVw?=
 =?utf-8?B?dk5JMzgrb1NJZDdhRGVURE9TQkVvR0hGVE5mNlo3enBuTndxaGFjUE9FYmxQ?=
 =?utf-8?B?ZUtWOEc1M1BXZWRRRnVOejdRWmlPRjRJR0VtT21xcFVNVzFTVmFuWlRKL3R2?=
 =?utf-8?B?ZUxjV2VUK253eE4xdWJZSTBzUGdhS0NEMysrb1Z5T1FKUWVjSzVhNEpWdEE4?=
 =?utf-8?B?ZDYrdVZZN29IbE1nNWViQkNRelk3M2l2RXJza1RNN1RjWld5cE1RLytIalFS?=
 =?utf-8?B?bHRDZ3pucFcrWVZCYmJwUjQ1YUxiNHVkZUJiR0kycU1hc1JBbW9MUjh6MXM4?=
 =?utf-8?B?cjNKdE5hZWx5SC9BSEZVc05RbUNCWCs2eWVkTzh1dUYva1JKRytYaDFlRmNa?=
 =?utf-8?B?WVVZemZqc3VRUy9DZTk3cXdZZVBHOEl0WGxmMWt6emMzeDRnTHRqMm9heWk0?=
 =?utf-8?B?QUpiNlVMK05WK1lUY1YyNXF4ZUQvQTJBWGJiNmxFWGxtUWh5UUg2QXJReHow?=
 =?utf-8?B?YzhLMEdrbjZaRDR6MXhKajRMbVNZcWp4ZkJ0bWI2dVZUYWhsVTRiR3lBMjJu?=
 =?utf-8?B?aWx5Q3hsV0t3a1l6MTZrMEwrVC9Lc1BXOVpmUHU0NEpLNXkyd1hMaWhHdUlj?=
 =?utf-8?B?T3hDOHJEc01FUnVhdnRIVlVScXRDckYzMUlBVy81R01OazdWekJkSy92ZFRL?=
 =?utf-8?B?b2tBZnZJZEtWVXpMMlgwRHBIb3I3Q1JXSm9HWU1pSjhkSGhNeVpZMUZvakpW?=
 =?utf-8?B?SU5xcW05Zm45TGQrSEJGZWxrUlZEbHRHcVh4N1lxVnBIaXR0bmw5UkhzRnAv?=
 =?utf-8?B?T3NpMkVIQll3YWhzWDVxWTVSOWZVM0o0MkxtTndxS3VPbmxkbU44aFRrQ3J0?=
 =?utf-8?B?c3RwT2c1bDBiNWVHMUhvWHd2emRUM1pHcll2SENBY3pyY1RnNmllMHhucW9j?=
 =?utf-8?B?eVU1bm5vS2UxTGZpWktDSVhsNzdJUzNYZktxVjRid2UwT1lNZzFjQ05KMFNk?=
 =?utf-8?B?SUFLVTByallNQkEyWE4yc080TG9pRytqVW1xTWpmNFZzZEVTcnNkWkxMa1JN?=
 =?utf-8?B?K0dlK0o0b21Md1JadDJEdkovbEVLQitiUUlCZW1EbWM0VFhvM2J2UlQzV3pT?=
 =?utf-8?B?WXVQVkZBSkxOK3pzYWhrTGRtcFpEMHcrOTRJd0RGVmhGVkNyUndra08xZ0Z1?=
 =?utf-8?B?a1h2U3dEOGZzWnFVYm5HVG9jenluY3VsQ3hCZ2taQU9rYzM5aWVDdzV0RWE3?=
 =?utf-8?B?dGora25EU2tVWFBrWmcyQ1YwWlhzaytadnpDMzMyblBpYXQ0U2l1V1htWnBS?=
 =?utf-8?B?TnBiTlZPVDlFL1drakM2RmtibnVoTzRjZjcybWV5NWtHK2dnUE9zS0kxNUta?=
 =?utf-8?B?eEZGbndWOGVEZmVqOEowc3VGam9mYk9QdDJobmtnZDd0WlBPajBwbittL3hN?=
 =?utf-8?B?YlIvQ0lidjBaZW5QUmZXNGw5RUlOMERFWGQ5NGdMNHZmV21MeFVJTDRXZngw?=
 =?utf-8?B?ZVkwNGIrOFpwWWQzY3JMdENtTERTYUdURHpsbXNDMmdJYXRhN3NSVGpVaVpv?=
 =?utf-8?B?aVZpT2VIdE9acUhCYWZ3SCtKY2ZUdHAwRjYrY0pPVlRVL0NsOElGT3Uxb3dV?=
 =?utf-8?B?Y2JmNG1TcXExQmpZRWVDWm8xWnRJRWRsRVdXNi9IbDB4ZlMvSWYzNERkSjAz?=
 =?utf-8?B?YjVQQnBaTW9NVWtiR2E2dlBOUDE1LzlaczVHbFZLTDRVY0tvZlpWZGljQ2ti?=
 =?utf-8?B?eFFJdFB1dnNqREhFSmZQbm1vclM0dWFBZVdhNDd4S3YyQk41eXFsem1DaEsr?=
 =?utf-8?B?aDZWd09lSnlndXNhV3UzTHA2TGdsSHZDZStPRmFiT3BvQi9pNnJEVVZoZ3Zo?=
 =?utf-8?B?T3N4V0JJbWgzWVNtMEx3Q2plcDlCM1NnOExEdUhoeFJ4RlI1bzljNkdlM0hH?=
 =?utf-8?B?M3cvcXpLUzYrcHQvWmJyNHJTOTVpZk9GT0I2U0dtQ3VUYmIvVm5zSlFUVitR?=
 =?utf-8?B?V1Q0V3g5REJ6UzlyVGZxeEJiRmtyQjYybldSTVA5OFVBZTFkYUZDWXIwNllM?=
 =?utf-8?B?ajJqRnArcUJYdkJiZnZkZ0gvTXQxcFBGR0hkdkFnV2JWVDBzVlJlMEVtNkp4?=
 =?utf-8?B?Z3cxVnd1TW82dDMrK1R4U3h4N1lDN0VjY1NsZzdTdS9meFVlaDdIQTNCNzln?=
 =?utf-8?B?c0FxYTNUZXd1RXgxNm5CZndmVXdRdVdqNEJ5YTlkQ0RXYktPVFp0cGk1Vng3?=
 =?utf-8?Q?QTmLO2CfVcQLjE5M=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe48f8d6-26c2-4792-b6a8-08deb5b4f5c5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:43:15.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi1tpnvWGEM/ps+7WubVab851PgwNDk1VcRFjumCN6r5vlRA4RVjUrqmDS29+4dpG6VSlVy6f4omzSrdeIXFwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074322_444473_12744035 
X-CRM114-Status: GOOD (  10.33  )
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

From: Sandor Yu <Sandor.yu@nxp.com>

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/phy/fsl,imx8mq-hdptx-phy.yaml         | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
new file mode 100644
index 0000000000000..b544c260aa073
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-hdptx-phy.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+
+description:
+  The Cadence HDP-TX DP/HDMI PHY is a child node of the MHDP8501 bridge,
+  sharing the same MMIO region as the parent bridge node.
+
+properties:
+  compatible:
+    const: fsl,imx8mq-hdptx-phy
+
+  clocks:
+    items:
+      - description: PHY reference clock.
+      - description: APB clock.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+
+    mhdp {
+        phy {
+            compatible = "fsl,imx8mq-hdptx-phy";
+            #phy-cells = <0>;
+            clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+            clock-names = "ref", "apb";
+        };
+    };

-- 
2.51.0

