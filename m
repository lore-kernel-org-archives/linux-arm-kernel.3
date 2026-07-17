Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87E9C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=; b=k7Fkeez5xbxDa+JMaHhFtttzoT
	cHTKMsHF2g5WUN608giLBJM/VJ0I60TwMFPUJy/Urtcx9PbgcIm7HT2mPRVG2iqrIs6q0gV6N0nGo
	YLJ11MsH1h8mXIh5/6YObslKNFj92CkJtwWuoKpw87lwXU+7jiSCbIh1U2A6lRSkdJ/1T0AbbPZj4
	y6/qkhkrn1se8FSfF8Uyvi9vFlFrAnbAxjL22SM6Bg6iCJxj4dXZZqRUoi2qTaEhfT7vQ0cL+wMgv
	ZouqGWrJR99yG94KFzc5uiGB+u6hQ20zObP8zDo/CiCM4i0ywkGBNFYk4MfDrpdAnmnnJ0wiZ6TvI
	dt2QJFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgEa-00000002422-2Nmr;
	Fri, 17 Jul 2026 10:56:00 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgEV-000000023uL-0MFh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:55:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zC+mpjULZ7xjmkIvi4ysQilarBHLKr7HE/ZYk6XA413d8herDreTKJjI/nS1yOw4PuvTD1scGuRysXTPmFjr3+X9fj3dgvXz49bRyp96ERjHHnvXgn2N92MnlAf+BhDqhFRDEw1O7s92RFNaSI1ZgheSAbQVZD/Dwr7PQpax9EXJZ2k3vycflK5GScI5c8DSzIfAt8DB8nHPAv7ONjNcoL1/s3VRrnkWcBty2ZKplRuXhh2SRviKO81mRRc+tc7jAeG3ydM/sJwbPvIAo40NKonbTvbIyl4M3XeUG4QGgpvyHO1a8tYZev/ec26BVnvCFZpAcxl6ntRthGArrQlJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=P1gDEGwHfzPJ+hpY5eSBavdW7qahkgK9ZljGPzBs173D6tema+qRoMvCPN6kQYzOalyqEFDQ2XhF3gcDN65OYgGtHHX5aVXiP5PKwkmz6MMukO0cqSrS5gBINQa96cQmK59lUFto1PYiVPTk9hfqbJFp5XtB62pQ5btlfvdO7ytFr4mVDtOjxXEmlAY3aoU7ME2gTCpSl4REzR3dEjh+CMtmTOoxpP1z3j4+nhTSKxIouBIV/mlvYLUEtkeywTv1EzCgDhMscLhaY+IKtidH2avDsQF267L06mNHxR+b+RGZZ18zhZaJWJWr9Tnf9R5dEiRzwjaOpJix0AApJtxUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=ClbZHYYZqJgENhao/NNbHw4fADQ8kveiaVJaRRsULlGJfb1tEXs0ff5UbZazYoR9+MYi2u9xJW+hELUp8qNJLlW5OWahpB1i7gzWgMMu32q5Hh9lcR0lPk9JHwRd/D5uWHFx0reAEE5sVU4FvLC1mA1AqlMHvjGYxKkuI0E8wHPJH/dMIIoE1w1o/K8WdVhATzDRw3WmTzXEUru3uTprSmSAYfcizLwLqFn8E3szAk9L8foSBMYbgyrKFk60MlqAYzAQutrXVNewN41RrUu82SqXuTdzlKHYjTwV2zXNx5TzzQqcRWLqJa46LjkXfKbKjT/cmXqyjJwokEfzv2RqQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI2PR04MB10224.eurprd04.prod.outlook.com (2603:10a6:800:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 10:55:49 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:55:49 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 17 Jul 2026 17:15:37 +0530
Subject: [PATCH v28 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-imx-se-if-v28-6-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
In-Reply-To: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288732; l=1315;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=/Cm38yt4M/hkBFoKCi0zK1fscSGHpPw358A2kZ01vrY=;
 b=gGSO2ANpSXAEKde3g3TNqK4d8f7g1qp/gavMvZkif2IQQq15iRv7tVOWbrC57mqYcDYtS2lDc
 WAU23bYuJ80AuuI+yzvAyjU4Q6i63ol7GE+5AdSKkVWoeLUwDuhtDFZ
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI2PR04MB10224:EE_
X-MS-Office365-Filtering-Correlation-Id: c6187749-4e62-4d34-8387-08dee3f1f673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|7416014|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info: DHiKT6gPQF1wfpgU3CmxxKV4Zgnj+pj2KBEYDTorwYCYXUaEE8sfopo+uVOBGlNB3aH5Bl55+k/TFK7gbA18ZQnYW08riJ8xL87hC+r4ex2xS92LsAvYLgZgdVMSqCI1JnzAfGkcDs3jacHuTy5dCofRRsDMPec3k3txao7FjlAFu4lHXRYlM+FwWYxZ28GFtSILQxqoNQNDfmJ5WyTKZqiW/OxJbQXOpMAcS0o6iktlLvxGpniIuVTP2xxasNACiMh6oBcXRoOQSdA1CevwPxS0xmYGaZez8cQemnrTpP2k1s5SNq/oE+fi0aHHI3StT+B0Cje8S3wMlDPqDmDzTBkKtXrAVhmeyslQJdW4VZBPYFAkoswVDK9AtN1xW6FOlAZPYRv35aZYq6boa5wnQIlaJp5mqbsS9RZT4f9021+kM2CvLeByfHASd6CQkz7vWth5xeqfZ5RYCbgMQesyXZjHe7dO9WjCdCQGhysLYZlDVoTbzysnUxyzxZfDj4/+u7UYDZ400UWxAbm3TBE9eRoI36/k+J4PbjBBdJG5nRXPqmrbxsdoJWDraKMvnVOGL6WlCyMKX5LVyowKyGe5/xddJttgXUdQ25BRzWqZiNKmyMKIt5qbl1KuOsgYOpQKzimF87HVKUKuDnnbvndONfOiejPo5rFScPq0h4uZGsSeW2aU9sIzD6g/10WHKLnlLKELGbGuyDXVg2rl0k7KkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(7416014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFWOU1qbkc1S1hoV0Vma2pSenFUN2s2VjNhQ3h4d0NneFZVQ1AxZThOalNa?=
 =?utf-8?B?SmFhMjF1aDUxS05jaE9OQXN3RU1jcEgxbWxaV3o5RHA3ZzNjSDd2Nzg1aCtj?=
 =?utf-8?B?OWhLckJRc2poenBac0FiTUFUT3B0WGtBRGhSSE9DanY0VEtBYUFjRmQ2eFRn?=
 =?utf-8?B?VHZWbnVTWW1zZ1g2WUtzNjQ4VzRZWWdRa3NuNEE2MlV4TFRtaUMvRkZLeUhl?=
 =?utf-8?B?Rk1FbzFkVkVoR21JeWo5TGpMcHlFRWhGSDRkQmhQV1ZHMXp6b1NlcDVOaUNC?=
 =?utf-8?B?Z0NtR2l5U0tOZldiVE1rbXVjbm5xNXJDMWlJc2tvSnU0NW81OW9kZTN1TVRQ?=
 =?utf-8?B?ektkdVhaelpzaytLaEQrSTVPYUl5YzQzcjdzRlF4amx3Tlk0RVpCOGpWTGdB?=
 =?utf-8?B?ZFR5aGVOMFVackxvNGVVUEh1bmF3N0FWanV1bDU4aFVxb1h2L0ZZeEdScElm?=
 =?utf-8?B?N1dRb0IyeG83YmNocHUwM1NsNFZXMHBqeVFWRVBtOGlpQmo5YjJMZUVYZjRo?=
 =?utf-8?B?MjFXU0FvcVhKUGNaT2NQWmY0TTdkNm9UTk56K1hJQ3lVWG96b2hoeHhzTzg5?=
 =?utf-8?B?MlBiaWVvWmFvR2NVSGRqY3R3OFBjYUFkRFBTQVYvLzduS283eTJzcWRkSGtT?=
 =?utf-8?B?K0ROK29LM05rbXNkclJRYXhkb0o5d25VODJkYk5EMFBudG1nTnJSZ3RmcDN2?=
 =?utf-8?B?OHZPZm5DMWtqV29NdUtnQmsrSFQ2Q3dsT0hUdlZDY0lDMGYveDlRMytnd2ZR?=
 =?utf-8?B?TVhkRlJ0TE1hOXl1dTRBRmNsM1pXUmtsdlcwaWpBaEYyR2VhUVJkQXVkQzMx?=
 =?utf-8?B?RXQ2U0FEMUdsbzJYeWphYzJhczZaL3VCMWFaU1lrWnlNZEZoSHI4TE4vaVMw?=
 =?utf-8?B?NXJ0amFOZk9Ba1RXM29hdnNzZXpRZlpiWFJvbzFuUTlBY3JUMEVmVVNNNVZW?=
 =?utf-8?B?c1NTZmVkNFdCQzV5WGdIL1cxMnpwZVhNMWRTM1NXOFU1MzhIbUR6TlVYWlJo?=
 =?utf-8?B?TGRrTW9Wc3pFcFhidnhyVHd3Y284RFFFRmlmbGFvanhLWkVLYzVhRUJ1bnBG?=
 =?utf-8?B?bllxcWRoRk5SczMxT3lQSk1BaGRiK0NoeVM4dDhueFBZcWxrR05NTGh0REJX?=
 =?utf-8?B?M3E2Q0pUd2dnSC9tbEJVTUZUU2hKSDRmaXFLRjFGWDlYTEVmMXQ1aDBWVmdX?=
 =?utf-8?B?M3Y4NmNmVU5nOWdPWEJyY0c2UHhMNlNNVTI4Y24rSGwwMlVDQ3RzWlBpNEdX?=
 =?utf-8?B?VEZuQ0VmQS92enVxWlRoMWJsTzgzSFFxN1RSVXl2ZVJtcFdZVjVpbi9zcWow?=
 =?utf-8?B?VGhXZkJEdmhld2dNK01KK2dGK0h3V1djRVlGL3RlcWNMNURVSU1XSVkycndw?=
 =?utf-8?B?cEFZSTg0ZTV5Z1Y4UnZOS1ROZXlTcThNMEc3SHZKUlAvK09JK2Z4bnR5enp0?=
 =?utf-8?B?d3BselAxaThiMDlBbVpLUGpsNHVubGNoNGxzVG4rK3FKTEtQd3pvUXlDM2hj?=
 =?utf-8?B?UWJOdmh4ZVF1aDJjZGViZ0VzZ0N5SDA0NFJhS3FjS2lPTFlTTmQrbFVzUXFO?=
 =?utf-8?B?eXk3QXd1WkRLMC9hNnY5K2o4RVpLQWxrWFQveTZZWFh4Wnl0SDZRNlBBN092?=
 =?utf-8?B?bmVyb3FJTlhpY0FEcWd2UytJMG8za1crT0RKRjl3eUpLOUNRUTRNV2dza1hD?=
 =?utf-8?B?SmFwbzhlV0U4S0JvbW43bmswbG0zZmNLdnZ3UzlCdXB5eldkckV3Nlp2ZTVl?=
 =?utf-8?B?eVF0QlpXN3BhbGNSMU1TOUpPbFQybmczY1V3NERWbzMxOElIRVFvcVhJZk1Y?=
 =?utf-8?B?ZklwZ1cyOGRMK1NsUTZrN2ZPUzZaQmxjdzA0OGdzZldoTHlDamMzYW10Y3hh?=
 =?utf-8?B?Q1huaVR6TVRYZ3AvRHFOZS91ejJvR0ljQWJSem44dTMwNG0zcHgxMTR4Wk4y?=
 =?utf-8?B?c2hVcXcvTjBXbDBxcTFMbEU3UU1PREMyZDlpVGNpK3pwMHBaRWlTUFB3TEE4?=
 =?utf-8?B?Y2xkSGhkeEdGRmZ3ejdUZGNPL3BBY2FqYlJOS3VJN09mSlJxTU1sYVV4ckRr?=
 =?utf-8?B?dHgzQkRNbkJrWHo3ajA3ZVNvT3FTc3VvWER4UWY2TjVJTHFmckpyZFJlK2V3?=
 =?utf-8?B?SnZCbysyMFBoY2xsSWNQOVQyb2FleHhqVDE4QUVtak45QkdxeERXVm5RR1hQ?=
 =?utf-8?B?WENNaFVGbW4zU1lNWEoxdi9qa21heHBTNlVMVGdFeEgvSUt3MktmUlpXSDNZ?=
 =?utf-8?B?M2dDRkFHRjJNRTdWN2Nydno2Vnprb3UxSkpXdm1PMlJCWHVYUHpuWHo5dkh3?=
 =?utf-8?B?Z2dHN0hoOTl0VTFTSGV0aE1OeUYweDlKSnFCM2RucUtPakNrdnJtSG41OUdC?=
 =?utf-8?Q?mbh6u+8PaPU3Rxmn7RabzGvSo8mHXU9jN2iL1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6187749-4e62-4d34-8387-08dee3f1f673
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:55:49.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/AXW1YsSnckuaqxfPQ7zjy5ksuqqWbCcINnj71NGfgl/53mUgIkkpitcu07hnbjTIAwRU6XtqobgBICcc0etOrs+a1YelG7BBjHqkC+8wLTOOWNysGmEEC5l5YdXzAR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_035555_144815_C57E4D51 
X-CRM114-Status: UNSURE (   9.57  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..182f1444b643 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0


