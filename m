Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92521C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10JxktMxTezX6RXzwxCx+SfKvk+veEM+ShNVDqaCH2s=; b=OMpn0rPGi8urlVhfrAKJ89qeWD
	NKH7e95bOG1B+qPd48JsCJQDEcWu2qZOQI13YT6NodgMpXnl9BsIdMbVD/IFhF4+uhas4GiM2w2/z
	Df+7sIq5uVpGroPjxvQKrHItwpngvj6UYiXjZ7vJN6ylnR5U2U4+SmGTnz3ogNfSBF28AWpkp/fJX
	H7byFhnzSUt0mUS/wFQir3uUMSu9TaiuOEk8T3kBWct7W/5+cVBky5X/+NWhRZlDCEcJD8SNjVx2T
	63CZ8wCeSMZHTyeleiK4r80HPQyZSaEERSjopvkd7TAaVUNs7ltDyMOiF9grtOgrRgNQJ4TXkJ2zn
	FtSV+oUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyl5-0000000EnZG-0exb;
	Wed, 15 Jul 2026 12:30:39 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjykz-0000000EnS5-0sfY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otakum8UR5WnstelaXcTJTPmz5l2CIbyBp/2GlsWDOXbP3TNVSprhI1cYwnL11NpcSxy0LJAYH4QlUmYBPAlLwPXrNrRH7bjB+rVq0HHjEk4gQP2n2rk9XRruchj00uYD/QUJTopwbUQ0/zGtTcEy5W2Guk5M2RARF50qHqb7U8hXQH4/ltyUvxcOqLeJLqeL0HCZz1Zf15ja7VQOP8mlHgdynADHFLS39GYsfyIh0qAlwzV/ZO7ufGzfIiBFJVKmxmDArrpc4QTgRaG90Io2mqnf4b/9KNYwyCRIKdn3jK4Y3+lU1m8ySaQVeW0oJabn6S9H6+wehTyOrfsL+UoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10JxktMxTezX6RXzwxCx+SfKvk+veEM+ShNVDqaCH2s=;
 b=T3sskFnlQtHUrPTRx0IWK33vhZ5+XOjkehR0/EmksC3OfPVeUhtccFdlLHPP4cn7/CCgMmgWxgQrFS1N/qqsCq6RhT4w07SZ8JraAEtgA7sjPnemDDRvhaJUNaB4Rhx3tmhcN1PjP+SkkBOaPDp4HxT2L/DLRNzKJaMwE0cAX7bC73H/vd+rB8lA4sopAx94+mUT7UvLogXIJHYGe9Q6l/IU/tWsmzADgiKLiCyFjSIocNApAkAqN+GyF0WBYpJzPiDQ9LdeX8TjI7lczhET1pZctu+ahRn62tOsO8EmnGeoruRXgU1c0aZEKjEiaHJL7E0lpS6S2OQ6TKZx5Plvzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10JxktMxTezX6RXzwxCx+SfKvk+veEM+ShNVDqaCH2s=;
 b=mUcNdc7xG5W7s1GdpYkY428nHYZ+tRgM0+J7hlSedV9WrkIylgTBftQ+hjFeIsDodIT6Ez/f10Q2usmtSyyDEVi6sjbM1Lild7ZW2YGbbH76ZgEIuvSTNN3q0IOIv9LW1n6VOVKl4HPgVVYcqxoDKT18mxdHGRZsqyzgL3V4kNLqFm07A1k63sRjlo78mgDObUrOXuuqz2/b361GJyhsQINbBXzcqD6wt2rfcLjKG46FHwVcZUECeIp4FLgcNwa69s769k5C1/JAJdWHmMHxsA8w3b4mdOxkw1hjWR4SwT1M1OpxScRMyHqZ4cWbGvYsBVjXvOl5GvLVgrHotLXoAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:30:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:07 +0800
Subject: [PATCH 6/9] arm64: dts: imx8ulp-evk: Enable LPUART6 for Bluetooth
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-6-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:295::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: ac587249-9d35-4b7a-60f4-08dee26cd9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 471hj7N7t2dLNYf3p0hpPc1ZzRxmc9l1YgfB+DI+inpj2wLQelLY6m9imj/Rg0PjUtyEvgILxmmRNPLN1U0ygtnckkXMzbWfyDfKydI+bdVoWYRHuoH84Mal4+Ir0ezPbjneBBYyA9B+cwnUyaQGGGm8kWu/HjIyC3811iEmB5GtFNRb0KQ1vT1yfpi4zlGKNXvF+/PwY7r+B5vwboEVLTSW1tFujXTDwWktCB8ltW2K1WbbASi3iAWzpHX83H7aIy23vYl66QDE9jeaDdpeVQNx+7lqo5cRVxDRtx5PcT3tqU/hQSrUwl8bwqiIE0CJqflC2xlWnjm/7dlcl4xwJanuBXUGVLSap1VA1QDYs/ouAJ4lFYf5ogj+FoUfQtEvLhxduzxwcmgpER+TZAyknvDTO7Vr1WYkl+Krj4eeVnQVAcdi1GDusi842N4M7w8FQbiNSdsXTt8HpTi+yoL6jRozDx9Uy4oAJRVzU92b/ygguwvSGIHuhlj6GCY7yOb115ggzqHPotTazgINACNv7CAwxKH2OA3MOiTKkiIUqumo7/Xm55EZctmMpIoDauBi46YRjTZnVpiCAt3TW+CKI77w565bo5m5ktPJLzUEwoDQpsOfTk9jYTCpQfmtSGTxyCh0WCj+uhLR+rlIrFldjgN9c0aignowSJ7LTVLsIHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emI0ZDJCL0V5djBobVN0VXBVS1JyQVFDS2J5SmxpS1hKOVBzQjl3RElUQkE1?=
 =?utf-8?B?aEIyVENjRW12eGxFaFJTUUhpZHo4ZHVZbU4rZENyVnphaHNUMWkwdkdnVDFY?=
 =?utf-8?B?K0lZUytNTHVEMGVLZkVKNzY1TXdydS9FY1BWVW5XVWo1NThKZkJKUFVpV2kx?=
 =?utf-8?B?cXJOSmovZVUzRnE5eEM3M2F2UmFhV2h3NTFEeGdjdnZ5M2daSnhiUk1xNE9a?=
 =?utf-8?B?ZzJRSWU4bkV5UmVpZVJBdGxNNHhaajl3UFhwZGE1enEyV2owa21tMVc3VnNC?=
 =?utf-8?B?WFhXZCtTVlVrbEhPTGNLSW52U293NTc2QnZnYnhsaEVMd3JpVGUrczJBbEww?=
 =?utf-8?B?ZWswR3dKMFRIYlBtVUVPanhJVkU3Vis1QXFKeTNUSjN0aFRiK1pBTEc4aTNE?=
 =?utf-8?B?ME9Bd3ZwOUNqNUVVbFBUb3NESFdJbUhKcUpQelJFWTV2N2VUNmo0a25IKy8y?=
 =?utf-8?B?WEtVSElNaDZKWUM4V3JlRyt2blZVcU8ybmVXMFVMU2NKUEUyV2QyQ2dmSk1X?=
 =?utf-8?B?dTVFK1Zscy9ZcThrZTZRWVhneXE0TDBia3pzWUVYb3Z4bm5SVXFNUkErZjZq?=
 =?utf-8?B?ejBZRytVcmdyWGVHbnFROC8wb0NjVEdHaEV1VTJnaGFuRktweGhkdWVSN2Vm?=
 =?utf-8?B?MCtlU05rQURkLzhFeVN3UjQxb3pFSTRhVFJJM1UwWlBaZUE3L2N1MW94S3J0?=
 =?utf-8?B?RU5TMUN5UVpiS09SUjN6Z1lJTUE3KzRJZlJoUWlRcXdFS3Y2VHdoMVBXVTho?=
 =?utf-8?B?Y2NtTVZDMW1XV2hkeVhNMjFXcThSMnh3R0ErRXdyTTZ3d2tFbFJtRzB2ci9R?=
 =?utf-8?B?czdwTTJ3OERMMzZyL2hSMTE2amtEazlHLzMrc0tndEhnSkhqQkNNQlgweEMy?=
 =?utf-8?B?Y0U3bUp4THF1SUNmeUZKZDZxVmpKc3U4SnlvUUZwbWYxZCtXUlZpZERKN0Vw?=
 =?utf-8?B?L1RqQjdVSVRONFhzUmIwSUVYa2hiNmZuOUdMUnRLN3QwUEtrSjl2S2YySFBm?=
 =?utf-8?B?WkVoQWhCTFVqN2lGVFlMaElFQ3c0Sk5NSVNXNzJOL05yWGdXM05tRFdmdEts?=
 =?utf-8?B?dTNNT0ptNWZ2UEt1K05EV2Q0K2pBbktxU0F5WWd2R1dwK1daZ3o0M2ZSOWU1?=
 =?utf-8?B?Tk9ic0pOSUg1UHhRK20remgvZVFFV1FvV0tVN3grVEc4RTA0TytnZnlzU0Z2?=
 =?utf-8?B?NzQ5RU9jNlo2czFrSnQzY254aVNZenlvbS9nMGpPTGEyZDJYUkVJZGNnZHJy?=
 =?utf-8?B?VVhadFFoSmtTSEhGRXJRdmZwbmlxbnV0ajFaK0hQYzE0dm10MjVoRTBXTCsz?=
 =?utf-8?B?aFpNUC9XQVJJWjAvWjltNW9SVEVYT1BWSkdVRFFEam9QbE9ldmVPL2E4OU5I?=
 =?utf-8?B?M0szTlNjUmNzZEU4WVo0YmkyUS9Jc2ZaN1lUWWVyUzRoejdiQThUTkJlOVlO?=
 =?utf-8?B?R3dHRC9jWnpHZm8yaUpqWGk4cGxxUUtiTGRDc2VTVjN5MGpzeDVQOU05Ritj?=
 =?utf-8?B?RVczTmpDRW9uZTFkYnFST3Z0VkhETHJodjZ2VS9nSmxOVGpublVaMHlRN0t6?=
 =?utf-8?B?WnlxM2xmQUk0WWVvRjY4NTYyNDN5aU1mdEJEZlV1SjRBYlk3WTNUUzVIc3dV?=
 =?utf-8?B?UXVZKzJSN3hiSVRuS05SMExxK3ZaclJCRk5LRW1qcUVFeUZPWEozUEg1VUR5?=
 =?utf-8?B?aVpHVnA5ODRUdlRTa1d6KzFlWExEVmtZYkppMVFsZWJodnNacmZqb0pSMmg1?=
 =?utf-8?B?Vys2RmV2bXdxelc3aXE3bXd2Slp3aUZXL3VRbU5wT0pFNjdUdzc0UkUybE5R?=
 =?utf-8?B?ak45OEZ4bElYOHE3NXkvZ3FkekZXN05Uekp1ajFSKzNTSk1tbzlUWGlhRkND?=
 =?utf-8?B?cjh0RS81cDY4OUNBTkJNNFNvcW11bSt5cjIvRnRvdldleEQ5Zi9QOWE3TldO?=
 =?utf-8?B?OEhqdTIvS25ocWl2aUZCYTd3MzlFK0lOd1BUc01xeWlGcE9EWmluekFKTjdP?=
 =?utf-8?B?M3RFVzlmdFdjQWlFRWoyVklvSGJYMDBXVk1nQ2ZxUlpIYStvSEw0bW0xNFdI?=
 =?utf-8?B?VFREbDhoVENRdW9CTThyUDllQ3FOSVhHaUw5OEd5QVYySG9PR1JkaE1ibHhH?=
 =?utf-8?B?cDAxQXE3NFhWb0JwVmpNZm5iL0JPdzR6Unp0VXJYNCs2eXdMb2RqRklsaEV0?=
 =?utf-8?B?ZmVjanduZ3RBQVlKN2I1NllRTEZZMS92dEpXL2dkNjBHSEhZb3J0SkYreXov?=
 =?utf-8?B?bGZkTjc1YmM5NHdKTTZ2c3JvRHo3MDZZSWdVbk9sT0FOeHhyMU5uQUhqVzNT?=
 =?utf-8?B?V3VVN1ZqQ1VNckx5bUNyd0RUMDhQQ09KcVFETWRNK1EydDJBeER3L0oyalIw?=
 =?utf-8?Q?URvK8fbDvH0aYOfnr9teGY+sgZiOfIs/p4AG8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac587249-9d35-4b7a-60f4-08dee26cd9d0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:27.4438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ty1lCF+v33WEAhWiZ2jgmWyh0z8FGb2Evk5JdIIhLKNCZbG7zZ9CZYcG+uJodPAWz7PUsTjGfJSrdeYrz10SWoo9HM9bQGaBWpR5NtoXZlinMAVBJf/TmbBrfQkrCx6Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053033_274665_2DFF3918 
X-CRM114-Status: GOOD (  10.81  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Enable lpuart6 with RTS/CTS flow control on the i.MX 8ULP EVK board
and add an NXP 88W8987 Bluetooth companion node to pair the UART
transport with the wireless chip.

i.MX8ULP 9X9 EVK use different lpuart6 pins which used for M.2 bluetooth,
also use the sai6 instead of sai5 for PCM interface on M.2, so need to
update the pin setting in dts.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     | 21 +++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
index af8f0d6087f71..71c66c58edc4d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -75,6 +75,23 @@ MX8ULP_PAD_PTE20__USB1_OC		0x10003
 	>;
 };
 
+&pinctrl_lpuart6 {
+	fsl,pins = <
+		MX8ULP_PAD_PTF18__LPUART6_TX    0x3
+		MX8ULP_PAD_PTF19__LPUART6_RX    0x3
+		MX8ULP_PAD_PTF16__LPUART6_CTS_B 0x3
+		MX8ULP_PAD_PTF17__LPUART6_RTS_B 0x3
+	>;
+};
+
+&lpspi5 { /* conflict with lpuart6 PAD_PTF16-19 */
+	status = "disabled";
+};
+
+&sai5 {
+	status = "disabled";
+};
+
 &sai6 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai6>;
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 6a92c5ca9a412..66e99cd24040f 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -167,6 +167,18 @@ &lpuart5 {
 	status = "okay";
 };
 
+&lpuart6 {
+	/* BT */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_lpuart6>;
+	pinctrl-1 = <&pinctrl_lpuart6>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &lpi2c7 {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -349,6 +361,15 @@ MX8ULP_PAD_PTF15__LPUART5_RX	0x3
 		>;
 	};
 
+	pinctrl_lpuart6: lpuart6grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE10__LPUART6_TX	0x3
+			MX8ULP_PAD_PTE11__LPUART6_RX	0x3
+			MX8ULP_PAD_PTE9__LPUART6_RTS_B	0x3
+			MX8ULP_PAD_PTE8__LPUART6_CTS_B	0x3
+		>;
+	};
+
 	pinctrl_lpi2c7: lpi2c7grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTE12__LPI2C7_SCL	0x20

-- 
2.34.1


