Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFDAFEEF51
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJuHIUO/DhqJKb2TAlKIanoLmJ88Koj9zgq8uB9d1Ec=; b=mTlAUXCLzn/H8X5vnp1cdxy0tv
	H4lYmQDLk87h2hsp/bPZEbC1P5xl5Q9svpKRQn1o504+CvDpvEtlK5c7c9KUQ1EOHSAAnes09aMez
	KpuJ9ypx5lLt8u6hiR9cEjSdTX6yaxzuzE2qkKF8VXuwH/vQfNiif5INZ0JFiuFYCEeUJwKw+qTgr
	kncsSzut3a/Ce032DcwvBWg0pgT/13emtCW4rk1WK+InjtFcyPsSflHHuVwwT8SiEcK0nIed1w9tG
	OyyT33TE3ebzFbwpMV7F5noecPZZi/pSG+fWlu0kMdhC5oAvFH8ls2TKzOu0RE883vJrvJVUr6v3M
	iBqWzGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Tl-00000006cdn-2l6j;
	Tue, 07 Apr 2026 14:32:33 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7Ti-00000006ccF-2xeR;
	Tue, 07 Apr 2026 14:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2pWTIOlXHrNHpXZfP2Z97FwoZTeUPOs9IA8wwHNeU8l3+p524xGpUPM0p5UljdqB+AFP5DM6UhU20u1XJ6teh/lRix7dUJGnxQtH5PA+hFOGWbgGRg3FqO8+2zfrUjqArJkDk/5veUtHFNVyND11rKGgmLzSZUJoJbcD+5/auHidqwwgAhghQeBF8/0qe5JbBwnI2pM7f++b/bSdLsIZaCWaRfvrnaZM5NCuSt7pXvIHPkblhZu4uzx+X+IdRjiUQjl/FS+luxGBiKggiw4n6At/qGpaddMQY0pvx4sR/qmwbwg1SGEugEnEJFOw6j5Dd8BpBJecNR7BOy3BYwOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJuHIUO/DhqJKb2TAlKIanoLmJ88Koj9zgq8uB9d1Ec=;
 b=h/VZCdaUNedFkNlEnXCyhBUVxyH+2/ShJAx/0qO5D3afT7CqwRXePBmzYmFEU4S658aXFOtAhU4PUahutYUXt8S1+ojJxJP8nin5k8pER5slzw5pIfgJkhzu7RkDIRiTa3lvDp6bWu3+Nh2Wx6WhnTSbzt5G9P25PxUNCdnmvk5dR4flBd72EFNRBZL48aqSnJ5gv9hmOSAZFPwvxLECK690307BgJuALFOvlU/9Q7lw2OlehL7SIL0P5axMPzGjD7ol85yVYtbXkCgheWdRr6fPQVImI4MkWgrZNDL48F/UeX60GwVzqco0oGHsOyKL3XSn6HmyUWk5BRiOPoQW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJuHIUO/DhqJKb2TAlKIanoLmJ88Koj9zgq8uB9d1Ec=;
 b=Si+WZksr1RBna6TJGxdqTmDHeE/Bp+dJ5ez/sH5D+z0mjirV52UkEPwLdbWQ//8zZag3L5811ryxFUrnZjrVxz4Mr9+CaW/tmvL2P63FpydYll+th3ex2ROePsq19JUHau/On7APiuAb3umbC94yjVY1sf8T8yQSGdUgMIOmwHPXXomPQqIL6QV8u71YT/ZQNpe0/zwgFF2WnM/LbBX2GtPtA6vIGweetlK2WLyqjINY4tmGTI9U0xYjYLpbK+8hGhsXXzrKtZv5a03goCfX/+2FoWEYDoyt1nuDQ/1xYTuf1asUkNvhnGuyE7p9oXDD+nuqXq93KYNWFH5tmrscFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 14:32:25 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 14:32:25 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Ying Liu <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v21 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue,  7 Apr 2026 14:31:29 +0000
Message-ID: <20260407-dcss-hdmi-upstreaming-v21-5-4681070ab82f@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>
References: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::7) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2f50c1-c63a-4716-683c-08de94b27c88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r45V94DCY/0nyW0VCapRLfCOp2cP8VlIlVuV+S+pufkgjf73g520VgLRO7yp+ujwyTYYDofusha7iiDh2+r+/Jc62eaFuMvXFEsoJ9ZdKtqJdr5TVVTI4QV1hvKMkgFRiNO+L5Dx783aMWQcMt5bn9TBPOx7y+rz9vqkXPTR1vCR9gKBpvmTSHdp9lS75VelaPxEslo+aE/bE4TWhny4A7TQK+CzaqKLAK1/6j9V1ijtpOI/vqsoSQ3LqZ+QFSHhFdTV24/w99rRjLVhv26MZ6n8nfQAIWfXc/JAWNVWSr/UyYwGulT4Cx0I99UITUUS00fynjUzzobiO2XO/7HWDXxsjrqcUFO371QkHhzGX85PE8hvrazR91LNl7p725h9I2V8AztCGOBiK6O9sguPkAXphMa6BDO82BvcUtBgOINhQ5GDn0WMZ2UBeWHZAfevf5iQhyTrMKiDKRr9YSPy1dX7ZXyvIsvKBInvX/Bj9toA1VG8ueqR7VJXAYdjeTxhVTgsXw4ibFP9F3OX59PEicNXlRBj/C7Yl0mC73WG/fJCOKNqz5DZF20BCXOWUPLFxwmjnMzfVGoj6IxRu9gG75Y6bS4yi5DQwDOoQ4fcMAkhQyZLfaFp5OsvZy7BXfQV/LAfSFE0wuMaxmLz8ahyP9CFTWa3qL47B5SCIASnGSMER+xBqnqmupGC7YDDzzmhZwZDJEJMzanJwI+nIcP7RVJ/fPpcDhYk1iKyrgYloXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFWV3BINVBtZ3ZQZXJBQVdDMFN3S0k3VWNpaE5lYTZpd0hxbGRkdU8wUm1V?=
 =?utf-8?B?cWZBZyttSjE0UXlNaXBQM1grejRocGVLU2VWVTI1U3VXcTB2ZlZvcDMwWSt5?=
 =?utf-8?B?SDJpZHFiR3kzNGNrS1ZLaTcyNDNySTdySVBaSmJiSmphaHVxSU5Xd0dqazdu?=
 =?utf-8?B?L1BlNGVyZ2J3dGE4NnFoRmR3dzdid2RDZGVUcnZrdmhMMXIzNFZmMlZiV1pL?=
 =?utf-8?B?NUJmRUswa3RNdkFVbmdzR0t0YVhEOUNhVnhQcWdTUGY0NzBiaDZmb0kwNm5U?=
 =?utf-8?B?R2lYZ0Z6YjNDMndLbnROME82eTRsc2RLV096N2haZkh2blFYZDNRY1ZZSmIr?=
 =?utf-8?B?bDVkd2V0ZUE2K2JVTUMwMmpOcWUrUkFsMFNrS3htWWRrUlRyaUFqbk9ZRVRE?=
 =?utf-8?B?bkxmdTZzR2V3a0tSd2FPMnJIUlpjUTQ3L3RFRWc1Um1GR2QrY1NtWjJ6L2hJ?=
 =?utf-8?B?ZENLb2dGbVp3TGxZM0NKNEJDU2RRV0QybDY3WkUrUUlJUVc0cFpubkR1eEJZ?=
 =?utf-8?B?b3R4RWo2Q2xQWUc5R25XcWcvRGdKR09WWmNHTDdYQTlDMDFDZmlWaXBYY2RC?=
 =?utf-8?B?anpONGZWeHJJSnFudXpGZjNUcTU4akZmR2wwekFXeDVMdXN5ZEJwelAzREhR?=
 =?utf-8?B?WnVrQjNCd0c4cVhyUTdLVWg1N0JjOVJueEF2YjVFaGExQzNGcndDQnhKZkxs?=
 =?utf-8?B?emhaQ1h2MDB1NW93OC9WZ25YVW5YZDZwMGc4Tnh1bzhTWDhNZjlPb3FxSnhx?=
 =?utf-8?B?ZlpXTm83Y1V3ZCs3UFlEZnFaNFJJdnM5ZHR2Yzd2VTVldmhHelQ1MDJSR05o?=
 =?utf-8?B?TG9FTENGVXlZKzF2eWJCV2ZkVjNBMU1INGdMYUZyQUJPeTMwbHk5UTIrckhR?=
 =?utf-8?B?TkJFTmR1bzZHNk4rWUxOc3hEaE1mNkxxMDNGYWZRU29nZWo2ZWswWU5XZzBz?=
 =?utf-8?B?ell5Nkd1VWlzeit1YnNHSmN1bG1EVnRhSEJTWEd2N1hMUmwvM0RLdWE1K0dj?=
 =?utf-8?B?QWg1MFppMk9yOGRQbnA3V1FGQUZPSmRSWEZmNGV4R0d5bXkrMkdMUmE0TkVB?=
 =?utf-8?B?ZDdhZThaL2U4S3IrenZQUjc1ZTVTNmpLTzh5QVRodlY1Z2lwVUlWQi9kZ0JO?=
 =?utf-8?B?bWFNNTdMOFBrLzRnTEtGR3dsWDZuRHF3MUxoaTFiTE12QWZTL3N6UUxKNHA3?=
 =?utf-8?B?L0RnamN5azRVcjVmY2lXa0RiLzllc3NTeWFmT3JZSXBaWitFL0RhLzZsYnZl?=
 =?utf-8?B?ZEVHR1dLakJJWElyWWVaQ2d6dFN3dExucVB5ZWluTC9JMW1ETTh3ZHgvRVFu?=
 =?utf-8?B?YUhvL2x5T1E0NmZBRzdYcWcvckQranJsaFUvcXZKQS9CVlhiQjlBMjFyWG1o?=
 =?utf-8?B?anh2UnZ1T1NRL1h6Z2swb3RSNHNrRG5QQzRWV2MvcUV6SDdZK0c5clNpMkVq?=
 =?utf-8?B?TVpVdEgwTlJDODY4VUZQZHIxUnZuOWhYaldzVnIzTmxtMmlOVU9GbHVxdkU3?=
 =?utf-8?B?WnZuNFdHVytQWVdLMTJEaS9hb3RLTHo1UFRnRVV1SUNVaFRBNDh5c2wxUktO?=
 =?utf-8?B?VkVBenlBa2tPbjdWQWpLYVpWMEsyYUxOaXFXOXRlczRYYUNLV044THNQOFFO?=
 =?utf-8?B?Mk1lRE8vTDZOQkFUczh5NHFYWXBLOFhRV1VHL1dkNnE5ekMrZnRXUFpDam1M?=
 =?utf-8?B?ZTNBaHJDSms3L0p1dGdvSHlJYWxZWHlkenJ1U1lORnBnL09qY0dJWThkcXQw?=
 =?utf-8?B?dmVOUy9EQnpCeFdXQzhLUHV1a0JQZXV3TGpVckNidEFrZVdmRi9nb1R6TUs2?=
 =?utf-8?B?TjhpdkNrTnZJNHNxTHl1aXAxRk1BRDAxTit2MDBDemw5WFBuNmprQ2VGbnV2?=
 =?utf-8?B?WC9uM25PaXVpbTJBNzZIS2pLdzlmbWltdTVSaFd6NFVzV0JPazh2VFhWNS91?=
 =?utf-8?B?bGFKRUMwcEpPYy9jOUQ3SGRSd3NwRnh0SXI1eGNDKzBjdE8zSldwWElzZkFM?=
 =?utf-8?B?YllwSGRZRi9sQmFXanNJTVRVUTFYLzZvbDZ2S3VnM0pLNEZseFllUTRndTNo?=
 =?utf-8?B?TWREcG0vYTBEbHViV3cwZnpjdlgra0VwYk02NDRhWW5lR1BBTVFubGliclZr?=
 =?utf-8?B?a2ZFbHJjNTAwOHBIbjRkUThYY0UxUWUzY0dhZ1NteTc0YlZxT2cyMGJWOE1O?=
 =?utf-8?B?RXJGRkUyS0ZWMU01MnRDeERkNG1uNW1vWERRZm1CZi9jeFV3MHdYWERiNkd2?=
 =?utf-8?B?aUE5SFppcHlMYTZIUmZZbFlCbnM2VytFYnVOM3dPbWVHZUNtRFBtckJhcG9K?=
 =?utf-8?B?SCtOTk51V1ZzaW1ra2M2V0c4cSt6ZENSNWJiQUY5NHBTUDgxR0dhT2tRSkpZ?=
 =?utf-8?Q?47ubU6j9ou59Fajs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2f50c1-c63a-4716-683c-08de94b27c88
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 14:32:24.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MzowVPKJdZ5iJYWuw7vZSGiYwNlxbqxnfgCkBiXezJ8eVfJbyHrfyxSeXvSZ5+wn7iYsGXf0aiAz8uIZhAPfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_073230_755870_EA1C38D3 
X-CRM114-Status: GOOD (  10.53  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml       | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 0000000000000..c17a645e71bad
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mq-dp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mq-hdptx-phy
+
+  reg:
+    maxItems: 1
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
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/phy/phy.h>
+    dp_phy: phy@32c00000 {
+        compatible = "fsl,imx8mq-hdptx-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };

-- 
2.51.0

