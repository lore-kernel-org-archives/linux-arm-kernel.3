Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C367BC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD8Xs65NqB3NPkrZ4GuegmaZeaDY7nBWFyrwzWk28PE=; b=HF/HUTJe4A3amtaBuMkh0jlm04
	V2+EJmT9znEnvi6L/95tqjSOtT4khPV0qJTqZQoqAO3MXp+ZJEXn3j3tNN6rddGYCIaO3A7pbYiUL
	krnlgddUPhrDrvm6DgCU2XnPlHhUnx6B6a4gnTn6i3S4cMRcwHesJhJ5zc4GGbitL5usUigLH4Zt4
	cfKRDZHHc7NuIewdzwUo/S6sysz7Qkp/twrFisXdsMt5NEV7z+ikjZwJdlTMUgnfLN2EIydGR+YZF
	SF9+SuYghiUc+8wXMs8kM3YLPzwSszZJcehaSX/w00TRn2O9NcftO1E3tFibEsdp8ZxRLPbleQLxT
	2yUhqrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3y4-000000080b4-1Cfu;
	Wed, 29 Jul 2026 13:05:04 +0000
Received: from mail-francecentralazon11013012.outbound.protection.outlook.com ([40.107.162.12] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3xp-000000080RF-2pQG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MR/PGCFTovcfm6xqN5hT/EyRcop/dOU8Kqh7YVHs+vztTk1WT7Y4jx0jFTFsapflHs5BOPrb82kkFqkjQXFzVUZ966T15D85JrRE56C5ndo6an3gWDFIcr2X/X9BkJKcUgC0vmLWD/vjVsQTVjmXts9j/Q0g1w5ANgGn8Npxlm+gMuuEiFQ1gVgQlnIW7dmix7Pb/jW08olBGT7LZrzBOpjCJa1J48gWeEE8HXU4kkp8wUfZH2rFHfumOtMql5NwDngvk/hCeXMfIN1VRx5k5o941cNvyXijtDrUTJCelNkiWfubUNnl23NFijagKddAT7xgPqeCdAn5Utp7ivkrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD8Xs65NqB3NPkrZ4GuegmaZeaDY7nBWFyrwzWk28PE=;
 b=rOwHM18TNXMsDTL2nAy8MQBix8TBkt5gISVKV1npOY3u3Duy8tkuWQ6OOMfrXxIRLmgQTEs9qBXOF5e2EWj/RFWSB6fVTTHpq2HcgxyTltbmL4CsnB4pV6Uml67MG9pQ+i6zShvCKNfopx/CWWdenFff4W9g0apH3Jzwfy+jSOl7GpIxbSQcCNdLxbqhl7TwIJOcTBOnV3xSQ2jg1iFdE/aFCwEIZH2m+U3xW/Dn7t2LcyyhrbBLOtt1TjxItShjfWlhBjzzCsIrjgwkpV9GZe/yoLmPCIUyvGzkCkGebagcqkSp03XqacYPAXFCM32qP1pDNXD7cYeM2zWVTBYeUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD8Xs65NqB3NPkrZ4GuegmaZeaDY7nBWFyrwzWk28PE=;
 b=ca0O7E7ReXWJuYKOjLnxxCqMZePpCBMwKyx+ZQQUXrYE91yAww7viTrOjdX9mhDMqec6odSbOBJ85fxafE8xPObw0SNqKa6s7WaHuu5B+vX3uSzKotNtTEiQ11tqf4Z4ESPc1LYcRLfvPlO+W0RDoCBAvWB7CLIr6Y2Yp4WZEKQe6ftkvtaoE+E2+iC8ZSnDjquef0DKkyulJlQ5elPybjjUb55Nje81LOSH3l6PB7KKLpsH32n7Kz7PLyq3qlm3DHKjQ19K3EBqMlnzH4Xy5lXqKOKwPSw1TVJLF0Gq8MBQmlFZyVjrtZIBE+wzJx/L+v53fnyXhQ5A2woUNyX58A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB7113.eurprd04.prod.outlook.com (2603:10a6:10:12a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:04:45 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:01 +0800
Subject: [PATCH v2 05/12] arm64: dts: imx8qxp-mek: fix dsp reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-5-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 06cfae58-582d-4ce4-73ba-08deed71f63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YdJkW1AWSYJhl/+yIwmVkdww68VBMHwz8QxBVGKk4RL4vwBV3G1140ds7FGyWy0Lq89MAxsw5YVdj2gYkhVeSBGqaunGY2ae+vlffcKA5OL1pnLsy9e3dhhrtlA2hiPTMdECkWWN5Og8lkPusAUsqJfny4oL0jbDZYbcDs4EnP6eH6d9A+suiZSHU+2AsARBMpRK/ReqIw088gnf2qAR0m+XCaV8SQsCwDK8jFgIYRgTZrnG6RXXrtPCAlrIjR/HJ7XwOVbanXtvcqm0get4zl0RecGMjPdLNBRHcVn9ZuIu7VTJYEYWbzfMCbinS5x44GbfkFyJZN6mha+SpEc7akbjEXKb1wT9G8Gow84HVL/ipZWE568PmZfqZ82Tt3iVhdSO9DiVNsj7ehJgoOwKcXoM4V8Ikoe0fgf0IwRUGxDSB8vk0HqE2Pov4QSMjanvHkm4Jwl2BM4TeybA8S1LltQUZMS/t0FOm+CyadZkA1OYd9B8Nz7jop3gtC98zhOpEY9Pe+PI3ehRiitxwvTq1mKEET336Cq+g6fzndHRBp4NlGrd5/dV7ESFf0hKlae0cI23FecdWLqTychuwAJ6ReHIHBybO+MWzuIE+YHbe47yYEqCZH2eA2jEYrLXv5CHh68I2ZOXsqOe1FO/lcWFcIUEpYMLSVVQKxIvpz0HqUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGNFTktOeWJISW0ramZzTlIwa25CYnN0dUtMWlhiQkhJYUM3WVVwWUFtd3Q0?=
 =?utf-8?B?ZFpvMkpISzNGTEN6TjQ4dzZYR2RMR2QwR1NDZEZQZ3V3YzR2VDQyaFNMTE4z?=
 =?utf-8?B?QVdkVGtXYmNSNE95cFpwU2hJcjFCbVdNcU5UTXp4NjR5RU5HMmxCdlNGZlNU?=
 =?utf-8?B?M0NQTDA4SURLc3lVemZRWjdEOC9xMnBYM280R0NhRFU2c1dxRUFsYmFFWGho?=
 =?utf-8?B?Q0ZiOUlRcklPZzJ6Q3pCRThuck9EMHFMeENBWS9mbk53UEZNalFCZUtMR0lT?=
 =?utf-8?B?R21ZRXpqUmtnZ0xnWDdMWmpESE8yaFpPSkNhb1Y3WXFNT014SE9xbUFCaUpS?=
 =?utf-8?B?Znp3OUlmazBxZkhOWVQ5N2NEcWcyc1JxblR2MnBYUHE2Y09RL0llaUlCaVFS?=
 =?utf-8?B?ZzFyT0lUQnV6VmJSbEVtd1JXQXF6TjBvWUZ2b3UxQ2hVeXQ1aGNHVW8vdW9R?=
 =?utf-8?B?cHNUeUZMeXhKQldkYzk0UFgxcUkrNkxuMEM5S0hKUGI1cjcycnhDc0RYc1hH?=
 =?utf-8?B?Yk5yTHMyYm0xQ0ZrT3VHM0haRHh6VFhGTTdjOHBBSXBmL0cvcGRPMys5cHNG?=
 =?utf-8?B?SU9RMDJCaXAybHZuTXBmU0U5UlM4VWlEdTRrUlhnamhtMVdjUTltWi9waGFt?=
 =?utf-8?B?UnpPc2hCaUJINGgxTDliVW9XZ1cyZjlveTZjeXkrUVNQY3B2OE43R0o5ZUhz?=
 =?utf-8?B?UytOOUY4UUw0c0QrNVh6T25HOGpUcUttampwSWFyam5Uc294Y1h5K3Z5R1Jk?=
 =?utf-8?B?V3pNRitFSDI0SnVRbFFNc2RHaEJRQktGQUE1Z1ZFVTdScUpWWXR4YWdHMUlM?=
 =?utf-8?B?UWJUdWVwbkxXQlhtcDNmS1B3a3JvRjhFeHhFczNYeWJmdXVIeFNwMGdBd096?=
 =?utf-8?B?ZGkxYXVYbEhGLzNBakR3MWJacENxbGp6cG5iNzZiQUdHZ1p3R3NMR0RYb0FT?=
 =?utf-8?B?NlQwb0FUY3lGeFUxNm1aSzdmQlVxeXhYZmwrTXUyblU2L0piZXBSU2JaUmpx?=
 =?utf-8?B?VUtqMzVSZTl3U2dXZWtiQ2JCTDdQeGN1Wk5UQTlpYWdENE1ZWkRwZWZLQ2o1?=
 =?utf-8?B?VDFaUzVEa2xtVUFOOFRoZlBiWFN3VlgzYmtWUG45d1JNcjFlRE9GcDkwWTQx?=
 =?utf-8?B?cUlidEg0Qnk0NWVVQWVqcUF0VHhiVDRiZmszcmVuZmR5aDV3MmZ1L3RTSmlk?=
 =?utf-8?B?OExwRjVSSTk0WnVRTURsZGUxcnNORExyRkNFb2tEVDkySCtLSE9uRFUzL0sw?=
 =?utf-8?B?b0twVldWbGx4L1Z2VFhZVEFhTXVWa2pCTWZrVlF4UHFYcHdwSWVpdy9naGY5?=
 =?utf-8?B?aEtoN29qZ1ZlZzk3N1Y0ejVqMEtLbWszVW4wZGJRNEdrSWdrQ1U4WE5mYjBo?=
 =?utf-8?B?QXVUdVMvQWFVdFUvWjNTcVhSaEJwSDNEQ0ZOREpFbVJscGRyN2FLOUhHSnF1?=
 =?utf-8?B?eVRhMnV4OWdtTkRJYVpxNURNREFtd3BpU2tFU3hXMDEvclYvc1JFU1FPdVE3?=
 =?utf-8?B?L1dzRGp2K2hGcGl6ZEZraTlmRVhPNmpRbUtTeG1Eb0Rnd0hwdDhsTkxOSU1L?=
 =?utf-8?B?VllXbUdRMG9SSEl2Y1VrcDNGelBpRG95YTlXd1Zoei9EMFlmdnZwbm1TVEZJ?=
 =?utf-8?B?R01lNCtieC9vT2t1QkFqamdVOHU5ZXBpUGI0ZXpGeStOZ29DdVlJOHhHNk9o?=
 =?utf-8?B?ekNlK3l6Q3Q4b1FuNXVLeTZIbEN5dmhUMXFyR0RBUTkwNkxUSC80RkVMNjlT?=
 =?utf-8?B?R1FadUJScjZpUDluVEU1d2tqSnkwU29IYkhsRUdtK1lzc2x2Z1QxaEtQNnlk?=
 =?utf-8?B?UkRRbzlYU3Z2UGdINjA1VVdYakFmOUFCdmdWbWtGQXZQOStVTzBjaSszSWJN?=
 =?utf-8?B?M29NUTBTNk44ejd0SDIzbThXcTJoVDRESjhXVFJZUUMvLzY1NjNMekVGL3Jp?=
 =?utf-8?B?RVBvMTMxZmVwMHAwYUR0d1p4N2NiVFJTamNFejdaaCtveS9JMitVN3p0NGFh?=
 =?utf-8?B?OFlKYVFnNzNaSXFXb2JCUEExd1Nzajl4RlFMdHIzZExidzkrTThPNklHWGV2?=
 =?utf-8?B?YmEraUhTVHZXbzhaNTNlNHVOdDZZN1YvNC9nZ0gxbENUNE9BSldUUnhoRmZZ?=
 =?utf-8?B?emh5cHRTTTY3ODNLRUVmelFTZDRIM3NndFovUVhiTzRCT1B5VXYrM0UwZkIr?=
 =?utf-8?B?MUNSMHRwM1Y2KzZNSUJ0Vm9HTjQzbDVZdTVZNGoreUx1aDk4ME9pSnJPK1Zv?=
 =?utf-8?B?djluMlBFQ0ZzOFU5S2VMWkZvb1JCYm95QTMzbThCYmh4cTQ3bGpZS2g5S1Vm?=
 =?utf-8?B?Vy84QURXekxMdTJGREtUS0JteGFPanlldmRhK3VlbHZadGJrOWRMMVRSbUdB?=
 =?utf-8?Q?gLWySNmbyFvUyVYsiSn5cUbnMfDh9n5rPJQ3b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cfae58-582d-4ce4-73ba-08deed71f63f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:45.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz0guuvvlfdaKKEtgONsx0Bc28oOYthT+vnr+PFKjSSkVVy4UIBcf0BlBv8N+DDR8BHOQTTEtgyFbMmSdcX8Pvm9qHakU4YRqfmbQnDl4UGd3z4Teb1G4iTexMdYTSrz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_060449_721820_8D7C5198 
X-CRM114-Status: GOOD (  12.02  )
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

The imx_dsp_rproc driver checks for the name "vdev0buffer" to skip
mapping the vdev buffer region, as it is handled by
rproc_add_virtio_dev. With the node named "memory", the check fails
and the region gets unnecessarily mapped.

Rename the DSP reserved memory nodes to use proper names for
consistency with other remoteproc reserved memory regions and to
ensure the vdev0buffer check works correctly.

Rename the DSP reserved memory nodes to use the expected names so
the driver can correctly identify and handle each region.

Fixes: f3e22e1d8171 ("arm64: dts: imx8qxp-mek: add dsp rproc-related mem regions")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 6322ff471175c..eb994f3e28729 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -273,17 +273,17 @@ vdev0buffer: vdev0buffer@90400000 {
 			no-map;
 		};
 
-		dsp_vdev0vring0: memory@942f0000 {
+		dsp_vdev0vring0: vdev0vring0@942f0000 {
 			reg = <0 0x942f0000 0 0x8000>;
 			no-map;
 		};
 
-		dsp_vdev0vring1: memory@942f8000 {
+		dsp_vdev0vring1: vdev0vring1@942f8000 {
 			reg = <0 0x942f8000 0 0x8000>;
 			no-map;
 		};
 
-		dsp_vdev0buffer: memory@94300000 {
+		dsp_vdev0buffer: vdev0buffer@94300000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x94300000 0 0x100000>;
 			no-map;

-- 
2.34.1


