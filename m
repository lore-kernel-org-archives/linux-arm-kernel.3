Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89D3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9RjkiOCeg55FZGIkDCBAU7Y1LFpE7tEqe2ZqYU1puA=; b=n2nNI4oPHT/ok/3lxeBBjEYE1c
	x505rm5FvZzie/WprwzbqvAAygnHhjSFkWXc+bkUD2GVSVqz/5k8IK2vFtE9gsUmtUXLOE9OmRNpQ
	hIMG1R3eL7y89BaTb5gTwQKucXRJWajayi3Piw/mUQIvJvweJ6EgAiP1RIuoN+ztEsm8ZQxOrZ0Yg
	C/KSROYNsoqPikCUCi5A9KtQILqGj+5FekrM+/JN+hsOFniIou+gzXTBqE5yZFet2Go5gqs+CAFYq
	O0WnuPWV8vdpGHv5uK5ZoxVoDAHNFwogmeQrwuFfOO8iQZvpaG67euLb0rfVVUuN650mRkmZUTNzL
	yZIc+sOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhfp-0000000A1Mx-0fLz;
	Wed, 19 Aug 2026 14:53:49 +0000
Received: from mail-westeuropeazon11010043.outbound.protection.outlook.com ([52.101.69.43] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhfl-0000000A1Kf-3rby
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOhNe3P6afOOSX1XECGnGmI5JA/ZCJIxj+z31eF+O9vU/fMr5o/48aN4BRgQ8MrFcc7NhHuCWUHICrScU0Hjk7eb9p/7AtlmPSFH6cI0lrnwOW9xvxyChsSNokYvLQLK7TPxUqTJyfv9m6jPRIDzf3E3jYsGikJ7tSY4pjQ6xRkd4CF70mOdWL1KRimk9XTdMyTN1nvI7kJluK+VDnznxoREzYFGPaVTf/e0yviu/yxOiPZHCEe6lCb9UzIEh/Cjyq2gDarYpFd8/polrAvYCG8DDmw5K6cgJwWq/nxKECZJKSfqxa974Lpdxos3HeuP3+XQviVduGlkjq5oydlgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9RjkiOCeg55FZGIkDCBAU7Y1LFpE7tEqe2ZqYU1puA=;
 b=WzI0jvg1JqsuuXOVPDMREtwhw8Qhzdt6iYcbY8V/qHmLsqPiRDACcVmHNdOAJXsGfIYFO2kMScVJtC/A/5V4Pbkx1KPzsSNpBSn6ywQ/PpdaOobR9igI/Q+wQdb4ek41i8j8whJ2zbI0hudfjGpPMNR+7tUxZl/C1Z9bi6+1C+egAG3vHNh7guIEppZza8FjMDQ7Tfjho5VbTtud+pEYKSDH6i+AfQVAQLQde8VeBu8jN1FHGgUJ3U6/IJpupgNi78OZlgkAfANVdbXoO2XpGWKKZbNnlMIZPtOyjGfpTgrKCW7i66+MYsVP6ovgfWSSixjmW5U4pWzglhYeXAxV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9RjkiOCeg55FZGIkDCBAU7Y1LFpE7tEqe2ZqYU1puA=;
 b=PIFUnHhePTE46BA860gS8RYIQl/xmVW3ljWhZSyFfHDhviPro5W4LZzdlY47fMTqmsZTZlIjJSk/YfatHNe/4wlhc4Vd19qflU8qQl8IfbBgPMWx/Q62ovOT+LcJHI+3C101byl14NIQyMJQPnkOpoPSLPuyHVA4CBqVWaEfLzV2v1Z1WISPDmec/KPEs2rR0Wo84IZ05/j7VjgPwrsII6Fh301jYmJY4hzkBr0kOrbZUIglTm4WRBGvNqQHkLTHgrwj63Hj/SehBf8f5yfuFlKW7+f14HRpqELpU6ROrMpLvrD/3h1+ijZokSI68V6JLyfAIR4pFpeV59Cb8AkSVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8885.eurprd04.prod.outlook.com (2603:10a6:10:2e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:53:40 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:53:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Aug 2026 22:51:20 +0800
Subject: [PATCH 1/2] arm64: dts: imx8mp-evk: enable CBTU02043 for USB
 Type-C orientation switch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-imx8m-typec-v1-1-befc92ecb70a@nxp.com>
References: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
In-Reply-To: <20260819-imx8m-typec-v1-0-befc92ecb70a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: db5bbb76-2d74-4e2d-1eb2-08defe01a830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|921020|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 08Q6Nu0yQdt++K9GQxnlAfRMkJ63ggunDz5x8xArnvyd4cJyBbEUJFN0UGLnebrGBpStOzCMonBVzBlcnK77F1+zL3sc974IveDjgyiMfO99YGYTz6OWTm2ErMcP5JO3Ku6Zc8hjhLsShO3r1AADOVqpIXJFO0bs7KDx6/C/a8M/IuXYdk90VoIYZnkUfgfiXDlAE+ND2K5/6Mw+WcBzer5786uT9B38B+6CidgaueXlyI7MKStK/yx/Yu/NhfYlMJlXOzJc8zrATbpoZvI9E1WqSZIGKl6A+GT888uNlgcdKwoXQyeQNiIh8i7sUEKycHNtAbLh4GEMbcE40S6Nyzikhuk2xagewhoy/0DSmNRk7SX5rE3/u07ngNRMPjXhjVemK8bSoFj+wzXqkjuq5ARnFupRoEOY4LNSton1yh6NTWyUOHYS1sqvwLZ1WtyC/WncnzbBUnuroZgx6kqUJYMHJNMupQO0vcgKXmuZrcnPnwCyODLxtfJNeOXttnHdNd3P4Z+kOmBa4bWnllQaF2JRaI4zw13rTszVnOw2hKyajnYdo7cBgexVJisg9teCQDGVGiV5hTav6zmgLou4A15rYq4dFWL+qAzNrMocraakoM/CvpeFeI8DaSh+80YYFP/ROjXoOsIg37CciTLEb+XThnbih0vEMPATtzzILeAKVlBklmE2auXIE2YSMlGWC+MnAI0ECfmioiUVknmajw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(921020)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXdYbVp3U1VSU2FzM2hldlZYTkdHSHNvbEpxWUI0b2RISVRKaDVzR3U0NHhr?=
 =?utf-8?B?dDl2bmVJUGJtdzdlMGNoNGt2WFB4MFpORGtXNDdrRC9ZM1piMEp6R1U1SjFM?=
 =?utf-8?B?TExWeGVLbko2MC9JdkZ0YzhrZUpXMWNzeGk5cGhTNVBYWkdpZVRBZ0MweUsv?=
 =?utf-8?B?NzJqenY0WFpUWjZvVzVJN3gwZnJFelQwRXRYa0xaYVpsNE1YQTlobGppR3Js?=
 =?utf-8?B?Ykx4MWRCV05pdjg5UmVvNklISm13RVpQMEVabVBuT1FCMUZ5MFNHWExuNGo4?=
 =?utf-8?B?cmZRai9IM3JUZ1NtWHBOSkVWRGZTK21VcEpUb3YrRlNCODcwa2QxeVVNY2cr?=
 =?utf-8?B?bTkvcVJhL3NTbndDejdEVGQwbG5GSTROZ3FVbkRQcm9paEFWR3YvUmhOQzB2?=
 =?utf-8?B?VXpaYS91L3hzVGJzSWh6UFdTb3Y1R2xDQUM2dkNRTlhFSEoyYm8xUEg1bENZ?=
 =?utf-8?B?NWVnM1kzc0ZRRHVIZXdMRG1IRVVlL2RJWnFkQ1RLa3BqVndmbmIwZzhJNlYz?=
 =?utf-8?B?VG9ibGVDNHpiVkpyRm5rdUhJRjJic3dGRjRlck96SG1iMk9EYTdmRk05QUE4?=
 =?utf-8?B?RndRbFdFNXE0bWtFd3Q2Uk4vQnVVKzNHbjJsMGlBRDU0ZTJwKzgxeUtuaWlY?=
 =?utf-8?B?RG1ReVhCQ2xQUGpicWtxaDh2RGdKaEQ2OWlENk1UY3FyKy8ySlUrL3pHajBs?=
 =?utf-8?B?M0MxK3R3Q3dvTlpDZnYwSGhRa1ZJU0o3UEI0Z3VaWlBVM0hiWnNtNXRGV01B?=
 =?utf-8?B?YVQwK0xvbUwvZnoxcmhqSUtPbjg5OHdUTk9xM2RNQllPQkVJZkZITkVaMmpU?=
 =?utf-8?B?amlwU1IrZEUxT3N2WitZVzlHSTFpa3BJYUIxOG5OdlR2WkFvc04xUlZWeDUv?=
 =?utf-8?B?OVpjR3crRWxjNGNLU3BOdFQyc29UMTRsSEQ0TUVTemxWRzZxelVPaUpHWXJu?=
 =?utf-8?B?czZrcDVjODZaa09FczRMZzV1YS8rK3JZZGVIOWZCU1RuY1ZJTC9Vam82TUFi?=
 =?utf-8?B?Rk4vTG80OVdVdUhMUDA1OEVVSFlrck1INWErMHhhSTJ0NElVNENPK0tST0VW?=
 =?utf-8?B?R0o0bk5xZ1FGL2Jic2JFaFBaVTZrRmVPdHVOV2NNUkVUK0dKc0tiYTVGNnNJ?=
 =?utf-8?B?Q1ZMT1ZvK3ptTDJuOGFJQ3FnbkhtcURWcHBGUTZBRDFCak90ZFFJdEVNeVJx?=
 =?utf-8?B?U0hwandLMU1pc1hFREZ5L0c2ZGt3Y0tYN2NyTjkySndCZkJGSndBWEhIK0ZO?=
 =?utf-8?B?VjRFa0UxamZ2SXdUV3RhVVpaQnNOWkxUMTdZWU5zWGluc1NFMXNybFNxNW9Z?=
 =?utf-8?B?SU10eGgvR1BaeGtTdUxPWWVPTkU3SFFGMVAxRXZ4a0lvVEFmbnlGeTlXTlVN?=
 =?utf-8?B?R1NvOGhOZ3IreVB1SlNWcXlpa080ZDBTdWx5ME9xMG5xeVNjNUJRZHNzcEc2?=
 =?utf-8?B?UE1acjJZZDB1ZGZLSlc4dGxyVGNhcysvRFg5WjRIaW1tLzVaOFpaTkZGWUxt?=
 =?utf-8?B?MnA0emNGOUdKeUtEWXhTRzlBR0dqYjc5YmVmS095QUYzVHRQYUJPNGlGOExa?=
 =?utf-8?B?RktETXEyTHVrV09oSEpBT1lmRTVUUnROYzVNUzNXSU5seHFBYlVKQy90Lzg2?=
 =?utf-8?B?MGlnUndOMCtxUmh1QVF1K2JDb1BFM0FCcmJQN2RXbVNiS01qNHRSTC9NM0s2?=
 =?utf-8?B?RHpsR0ZVb0c5MGhnWXh1ODR0ZzAvSCtMY2tpKzRDWW12c2J1T3lRWXFtT0xm?=
 =?utf-8?B?ZTM5K05Lb0lzWGU3dzJWS2pEUjJzK3RTUVZtMUE0bE1XMXFDNFZuZThhSUhZ?=
 =?utf-8?B?VWpRNHpjNE51NFk2dW5PS0ZzRWdVOW14UzJ1OGdmVjc1T2d0aldEUWs0SnBa?=
 =?utf-8?B?dVUydWxqMXlYaGwyMVZUN0xzRWt6UnZseUlDalJYam9CZEpQc21ucFQ0dzlp?=
 =?utf-8?B?ZmRXdDNxcHBIZGdVSUtaQVVvaVZiMmVkYXQ0bUdpOCt0andZenBpbXpBUXJ6?=
 =?utf-8?B?R0I0bE5xUjRNSDBOUTBpcFJnQ1IrcGlEYWJkRXAranVkWXp6ZUthalVwdnVv?=
 =?utf-8?B?cVdMTkdKMTBmSndhK3pGbkZLQ1R0dDE1RGFhek02K014c0p6WE1pbHpaUXhk?=
 =?utf-8?B?RU1uZ3RqTFZkeGdBdTdEZEJ2MXVoTlFxa1RGMUh6NnM0eUZRaXdMOFVQRjdL?=
 =?utf-8?B?b3o0L3kzSmh4cXBGRDR0cWlldEV3VTJUd1VKT090M1BXL1FOTHhXaTcySThi?=
 =?utf-8?B?bGswbzd4YjZQTnJpUVR3YlNtL21ubEQxclBCeUYwSXUxM3RTUDM2K2tWMFdv?=
 =?utf-8?B?YUE2VFdsWWI5M2VKOGc5UDNYWHhOTEJPcXlaZnJnNEpVeVlDU2k5dmNHTS9F?=
 =?utf-8?Q?nDruwIQ1nyEh5Uyl8OXWfH5is1Q/eT7uTvjbr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5bbb76-2d74-4e2d-1eb2-08defe01a830
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:53:40.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jFT9cAZQyESO7Jj8mIWCrp0ND1HdX7deraTFmYWRW+udNo6O3a6jV0ebaCw6qWGB4dd/zBJ6G74kGZz0/CqCII92bApad/jE6h0TWZq3MgXOdOHySVRd2RY/Cu8V355
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_075346_005202_E3488C74 
X-CRM114-Status: GOOD (  12.27  )
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

From: Peng Fan <peng.fan@nxp.com>

The imx8mp-evk board has a NXP CBTU02043 crossbar switch between the
USB Type-C connector and the ptn5110 TCPC. The CBTU02043 SEL pin
(GPIO4_IO20) is used by the ptn5110 orientation-gpios to detect the
CC orientation, but the switch must first be enabled by driving its
XSD (shutdown) pin low.

Add a gpio-hog on GPIO2_IO20 (MX8MP_IOMUXC_SD2_WP__GPIO2_IO20) to
hold the XSD pin low, keeping the CBTU02043 always enabled. Per the
datasheet, XSD is active-low: LOW for normal operation, HIGH for
shutdown (high impedance). Without this, the orientation switch does
not function as all paths through the crossbar are in high-Z state.

Also add a separate pinctrl_cbtu02043_xsd group for the XSD pin.

Fixes: 6e62bc736674 ("arm64: dts: imx8mp-evk: add typec node")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 7bdd641292fb..dc3baeac5e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -935,6 +935,17 @@ usb3_data_hs: endpoint {
 	};
 };
 
+&gpio2 {
+	cbtu02043-xsd-hog {
+		gpio-hog;
+		gpios = <20 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "CBTU02043_XSD";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_cbtu02043_xsd>;
+	};
+};
+
 &usb3_phy1 {
 	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
 	fsl,phy-tx-vref-tune-percent = <116>;
@@ -1021,6 +1032,12 @@ MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
 		>;
 	};
 
+	pinctrl_cbtu02043_xsd: cbtu02043xsdgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20	0x16
+		>;
+	};
+
 	pinctrl_csi_mclk: csi_mclk_grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x50

-- 
2.51.0


