Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE3BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+7ZIcayKsHZ0SJIw1CWnPpU3rnWURtzIqNo6MW1NKE=; b=dU+JesSXcwlMzV4ujbiBZKEqac
	DhprGJvBPBvrR69m5+7NygvgwG8BgQM3ZEgdWGgyESb9Y4ZIEg+nkm6gPRciTSM7xYbttjtzewI2Q
	Zu1FvLWmIDACeEKS7825PqEarxMLHqwPMZDDoSNOKSUtNZ864C3WCG7JC+yxtU9C4pBiRb7tKuFL1
	VcHU6CmhPfsyB72tWVhMvO8JotIsWKdBS3kgg0RTDtm9UsjaMXPfBIuYm2HVX4UMibTpk2E3OXbqP
	fhOBod8Z3qak6FY3s+EaXkkl7XA469BUnGfC62L5wxay//hpj43sFpwgYYiWFixhKZv9SfT9nJVnj
	HiLpXlRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1PB-0000000G2pu-24j6;
	Fri, 13 Jun 2025 10:13:01 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1IW-0000000G1IJ-3tno
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 10:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hM9WAq9RaTIrF+5i05MpR/IqbJ6KmGEitv7ScnqUrm8P25kSXMojVefZ5F8Pe7ygTnmXVFzVea46sZntfNA9SNUGGzY5rOjVnNX9jdAe3TqD043DioqhyCLEdGm17kZvm1zaJBo18K6BCz7pSZ5cP+ap+o6Ct5E7lnP7dFWcl5opQlekUcsIKI3zRlPvhnxwiMTdMtjDqmlMMRzykt0QPLJOz+AxlghYBzwWS2/T7UiZ/luqYBScKka5FicHWthRYS8UK4g57d39u7XJOL4gZPuCO6V2IsCoBq7lEOlNYfbGI/6sY1zhL4Qa4RLH69qet3iscTjHWEBEWO85q3W1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+7ZIcayKsHZ0SJIw1CWnPpU3rnWURtzIqNo6MW1NKE=;
 b=maOxLyJrIF2rIqMzOP/dPfVOpFasmOTOLLxfUfvlfTvClXoQMc4Ia8TORYKJlOlOiBqOWMXbwqSLhAOQNBaTiwpfgLyLa3JZJmzBwrpkNV95v47sxvlmwg5D5tQZGdQ8Ti8QleiqdN7rmcpbVp4qJor/eig0lo5kVQvqtAYbNfAzjHpgQf39uERL/F26oGU8swx6Gzty1BVErG0zrUW/ve4wTem+E5CJpVyPij96qgUlNKIwo/SqH9YoAHAsQk0O7K2FN5i6My9yzwGX6q203ikEMbezO143zya/q0S3IKJAuJfly0Sa7hPu/5neoS77u1it0y8eygNfU+sSvXy5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+7ZIcayKsHZ0SJIw1CWnPpU3rnWURtzIqNo6MW1NKE=;
 b=BYwHUZG3iOHWF/9mPez73wTlFfjoMJr6XPHn7V63v8vGJIgPZsns+nXRLN/4UuqcWsdQruh/aq2W78QMvCglzLFLyPYmLdPsfIxydK3ahmH/70uLkJkV1ygJ+asXj2u+wnqjvO/M9/0R8LR6A1/Pq9MYVJl5jndWppc1qpbxnqscwyZ3LgknIwcRuD1WlYUOB2usgYpH40h3g9kELotBHdBaHPtfLWsmeSJouN79I2gGWgD3g1lKd8U1K8QMNrKYwJrxX9tMVyjsUzUrmV9bA8JSxlw7VC0VgZdz+VIPb1KTbnWCKZZVUYMdaHWDmMs4WJzkb92RhhlgDDrcAHgD1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by VE1PR04MB7294.eurprd04.prod.outlook.com (2603:10a6:800:1a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 10:06:05 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8813.018; Fri, 13 Jun 2025
 10:06:05 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	ulf.hansson@linaro.org,
	richardcochran@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-pm@vger.kernel.org,
	frank.li@nxp.com,
	ye.li@nxp.com,
	ping.bai@nxp.com,
	peng.fan@nxp.com,
	aisheng.dong@nxp.com,
	xiaoning.wang@nxp.com
Subject: [PATCH v5 2/9] dt-bindings: soc: imx-blk-ctrl: add i.MX91 blk-ctrl compatible
Date: Fri, 13 Jun 2025 18:02:48 +0800
Message-Id: <20250613100255.2131800-3-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250613100255.2131800-1-joy.zou@nxp.com>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|VE1PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beaac33-965e-4e4d-fffe-08ddaa61e89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pMUIaB+CXCKBxt06d1KcBte+5PzrVlD+Xehze5xlbORBJ7ixMZ0Q/1eXI8VW?=
 =?us-ascii?Q?JpSNcCL2829+w5u2cT+nRbcQM4GnqPMnXKzexQwbZp3cKH2Z+wigDmbM41vt?=
 =?us-ascii?Q?1K5vqfM1oz4XmW94Di0Q1ncaM0TrocYPgp6acWMBLcHEB5jA3iRRkX/oCBLp?=
 =?us-ascii?Q?9BXB40lbaxDjrq/xr4OXV8PKalTYVI3UgtnSCcIJwnXbRUUyeOX0/Os+oG5T?=
 =?us-ascii?Q?sswoi+jErZp13NdYvBLiKVpuJNYyBdYGYQMtgaSiNw5usxWFC5G1UuybQr/s?=
 =?us-ascii?Q?dKiDo8j0MiZ88Mgpsv8WeZgDW7kLS3/vX81rG1tWTd8OqTvsbs+nUeD1nMFE?=
 =?us-ascii?Q?Gt7LMR+kY9ClRkK+CCOEqfvpdBDAmLwMoaCyBys8I2NgxQK+SjoQ2MRJH9Di?=
 =?us-ascii?Q?T2QXsDwBlcFJnuUYCTDQ4KLi0XgJHylMaakGhw9ozHM+33AN0hkRS78t+VNf?=
 =?us-ascii?Q?R5eAHW8nWCNzi6KY7OvB5yXrx34Khz5YdtvKFOu5mFctz9KKlk1+iWaavU1G?=
 =?us-ascii?Q?l23KZ+V4magMrThUaxDgvEoK7xgw7FYb4bFQOar9MK+51Hq8CikziXDGaeeE?=
 =?us-ascii?Q?wwZCaR6JcSUW85PaykoeVbM+zwzBLWX88E8YbIHV7bHyO+EWF5tzap5VyaOt?=
 =?us-ascii?Q?ss8GymVqXmWna95t2sqDqdNzCqt/2kL6MDLU6PnxB2p+XLTr/yhwCtO3YN81?=
 =?us-ascii?Q?6YO9+bJIaG8BE4IebwEBLCS9HnKdsNbIXgCGV3aTDSG3Mt0aM8CYF/1+djU0?=
 =?us-ascii?Q?dvDIgyHFjEtrbhBKjGYBN46x7VKa6pVASB6sEpGDTCukwON4QM4gFseBcMGR?=
 =?us-ascii?Q?/sL551+pZYRTd3szcsR4ByabUEUdebDzKX9y2sPrcZgFO3KjX0cDektJdW4D?=
 =?us-ascii?Q?JVP4KSj2dl39u2N6T3zYrJsLpMXAQXHsq4Fj5bn2n0YJGEJfqHwZkm1Mc/CJ?=
 =?us-ascii?Q?HwpaZrli3KESP+oNateT/UkDDkq1npBmG+GA4q6uggS38e8k8THoGUrCa55B?=
 =?us-ascii?Q?TnfJKWrmRAlh5HICVuqqkyFxKKFXDtGRJotfVO7KXzcI0cWryCdCWnatke6i?=
 =?us-ascii?Q?yXq7qzCln05Cs988nDAhLcYGK2Faqc531qjVYEipe6mviWLYWoBQOwLIHCuw?=
 =?us-ascii?Q?U1RnUwqiCO0R05SpKNdGk628P89MFj1jjwp4DIK9NxwtSLg/IH7EvZsyOLEG?=
 =?us-ascii?Q?zbGxsOWXFTh/18xYbqyP+8+XEyxuL88S2XdjOgzLFd7SNad8hJFit9++O2y5?=
 =?us-ascii?Q?P1f+14EEKc5m3SzNrt32Bb9aRT9HCNtXC1/EHMKd1+Dlw2dlv6lC15tNvLHE?=
 =?us-ascii?Q?+XQNj6mPbIhFWI378kXxG8D50YmkHT6M3EhsTjqI3F08j3tkzSrONd9+fIzP?=
 =?us-ascii?Q?+S6cbVEaYw95AwQvDe/HfpXW45i/tLRJY6LoBlLqUOhgcHhcjK8ue4Dbcq3l?=
 =?us-ascii?Q?AG1Bta/Ircj8TNdQy/geow1JLun5CvfkvgcmJFKy0rCwgIRnaaLPB3CBT8Rd?=
 =?us-ascii?Q?199KDh7hfdrsUl8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFYgAa9j+gNvdIKVIxupg/LttZqqkke9UCAOIpiH2rSTmz/3eE3otnTgpfId?=
 =?us-ascii?Q?YHw+D4I2DavlILT1sSuahvPCxDjz55oRkhDeZjWp8xqhXsTLjO0/I03Jblm9?=
 =?us-ascii?Q?Hw4CK8t1d4H5Nc+lQAzMklaWECGUwEGG89ZiDLSDM2T2Hnhb9hMsTxch30hU?=
 =?us-ascii?Q?Jkz1c/PR0SXPy0ZSSueVHvgCRtOKKoSpqA7ykbrq8CjyA/To2Da2KExZTaup?=
 =?us-ascii?Q?nh8uAlUiQaI7axz2OK8bj/cHSnYOvCZoGy7ymqGxlzGKD3+bl/1iASmdI4M6?=
 =?us-ascii?Q?rLOKVaLkyfrN37nhVPwX+wyG1MqQjUW0Sr7ao0ex5TFU0EqAxDCw+gwHHuU4?=
 =?us-ascii?Q?yxaPue/QuFPPztewCjRrNH2gRFpsjU3X+1LvmjwCLw4F5W9rzBCMfzsi7wUg?=
 =?us-ascii?Q?3ITrDYba52npGB7piIz/gJ4ma+6L7Lww3JJ44AoSEIQPaVHAYOovx85eUI9R?=
 =?us-ascii?Q?VYcxwW4Cx9Hr69QfRstSsI+WMQyvQRIHZWAOv8pOsErC4Zza37VeovY15oDj?=
 =?us-ascii?Q?COWfxjXO/TbUTDAqbSR7PKrGfTvvNrZE/rCql4r76+GLVaMni/8I/NCUifJa?=
 =?us-ascii?Q?G4Mz7zN5kCnTpRGX+6lrGhy0LESUsyIKtFLoVP80cYmEfwEJd/BAuGs4amL0?=
 =?us-ascii?Q?kMcwdhAs7utRuAO0gp/lUWpYrhZixpYKgUSepuGXkhudYSAHWMk9MNO1LbBq?=
 =?us-ascii?Q?ID9lW9cwRzQafukIMDui7UCd/gsEVWJPdkJsRRQ6sRL9DriogAjV1KhJzw1m?=
 =?us-ascii?Q?sgz325H+rYtKaxH5g5kfa9CaMMGd0QpeMbJL6hToErI4hx2/hXdtVPnyVe44?=
 =?us-ascii?Q?BW191TCRPWAPJmjyfhMC2YJcFjiFAZLSYpbPc0BH85nb6UngU+cskwkjFYuz?=
 =?us-ascii?Q?px9KYmxwF0PkDgx/Qkl6qvQfkUi8+WADd7dqYbVNYhVtedygfAT0F94+3oMG?=
 =?us-ascii?Q?oolz3Jo6mKksLtXxUCFVKGsaDk/E/1tGKIHEVF8B2lgEUepU8JCz0XGCluE3?=
 =?us-ascii?Q?D0KBzxYuYusVY6H74cY0q9tVCIvTtd2vmluL+ksGOeRmPwm0FN9smzXPCL7j?=
 =?us-ascii?Q?hpzdrQHkPqxew+LYRsiUvvyEKy0Ok3EkEkiOiKwN+gDPBIp/v6cwiDc0suQS?=
 =?us-ascii?Q?usp96Nyvt2qz9V0R5iGQ+pOCrDc7xM+K3a6mW/aRep3avC/07NLmAlPWsxKl?=
 =?us-ascii?Q?em722jlR70m6sJxaJV7MuvtH0wUWg6HndcSlzVqshXUnFU+wPFK9uUtF+dfp?=
 =?us-ascii?Q?qncC/PzJRvJRPOI5ZF9J3EDGU67rzY8g1S1kbLfodw64IgGFQ08XldhY6TWB?=
 =?us-ascii?Q?/ikbgeEEZd0wQ3g1q/iX/IKivrYv3Jhcq1XAgoL27an19uWvOlsPbqv5eFPQ?=
 =?us-ascii?Q?o3H1+Vcu6FCzYQFTngCS69fpapcAkmxYC8rf4SulC6mBCMu1AVJR9Ov/YLvA?=
 =?us-ascii?Q?j4k43I4WOjq/SxsSYc6of2rHkXmfYxDNCdYlIYNOThuPd0nbMtVJtYbe0HU7?=
 =?us-ascii?Q?B1x8B6FD0hdznA6QrutWaK4zTPcJTprvz9lGQM1QSypPDarh1HM/Z5BLS9QH?=
 =?us-ascii?Q?0WFrRRiLdfls/mB40xi9xmWSZebqCBf2CVT9FBEA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beaac33-965e-4e4d-fffe-08ddaa61e89a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 10:06:05.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHiw97YtNYPzDgArgR2xvVowSP3qgGmkOElMVV2nnP2K8+p0IXSMjHY8EREK5Wex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_030608_977097_6A720281 
X-CRM114-Status: UNSURE (   9.46  )
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

Add new compatible string "fsl,imx91-media-blk-ctrl" for i.MX91,
which has different input clocks compared to i.MX93. Update the
clock-names list and handle it in the if-else branch accordingly.

Keep the same restriction for the existed compatible strings.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 55 +++++++++++++++----
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index b3554e7f9e76..db5ee65f8eb8 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -18,7 +18,9 @@ description:
 properties:
   compatible:
     items:
-      - const: fsl,imx93-media-blk-ctrl
+      - enum:
+          - fsl,imx91-media-blk-ctrl
+          - fsl,imx93-media-blk-ctrl
       - const: syscon
 
   reg:
@@ -31,21 +33,50 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 8
     maxItems: 10
 
   clock-names:
-    items:
-      - const: apb
-      - const: axi
-      - const: nic
-      - const: disp
-      - const: cam
-      - const: pxp
-      - const: lcdif
-      - const: isi
-      - const: csi
-      - const: dsi
+    minItems: 8
+    maxItems: 10
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-media-blk-ctrl
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: apb
+            - const: axi
+            - const: nic
+            - const: disp
+            - const: cam
+            - const: pxp
+            - const: lcdif
+            - const: isi
+            - const: csi
+            - const: dsi
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx91-media-blk-ctrl
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: apb
+            - const: axi
+            - const: nic
+            - const: disp
+            - const: cam
+            - const: lcdif
+            - const: isi
+            - const: csi
 required:
   - compatible
   - reg
-- 
2.37.1


