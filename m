Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364A2C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=; b=GQNdY9pvQ2cS8edAOj1BhVyip6
	zIseBPmbjYWFOd4d6kZhfNdK7v592dF3OzfxXFO4rfvks9EyK1KTYjHDc6Ra3R6sdXSZbo6ZgYdfb
	qtrQLqjOI87+X2gq5MXz5F9mT9yhnGOX/glrY/IT6KFjvBK6CUY3CXu2ewnRztuE77vYUp5hdtBGg
	DI+op2d156UllrPPtEI/yphhrocg25pFvJS8xewU+yKPpAZAoVW0rl4bKp+hRVxxulcOUNNOrT5kz
	TXhS0ojY3fVBP1H8oJLDslw7QlsoOwzpixMYjnu2aO441nWPT5TImx7qGNNDKFcG9v5LJ5QZT23OW
	mTEClO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgEG-000000023oe-2Qpd;
	Fri, 17 Jul 2026 10:55:40 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgE9-000000023kh-2lqo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:55:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lhg0e+SNcvZQeiTBV8p5uBT95ack2UF//YRyV8aU+y3chWAr6kzVP4uU6b2yUtcLw9QY2bH1mTy03PmF7E/Lvk3xPyeHcyisJr+Hcc0ihFdmDpIR7VmRLKWwu4+DuwHqiwUTQBdJAU8xYZkCAP0qbkmwQOir6t0NNtfREhfnooTvnaMScmCbMbH8QKXLp/60UKuk+WU37wPACAC+3r/izC/6gvtFC9+s0ZjPc3467YSP0zPPIcaf7JPBrdmW9P1w+Ev77lgLdlIQzpFDDmID+9AePRS5iw5mvse4gW5KXNyGpwlmc/xN8IrQuLpthNUOxhbdutQF41SDLZ+7qRfVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=c+Q2HOMefKs72LC1KxnGYZWNKZHUPkPkAgdkEuGJ0Ly58IxbhdCLSs6QqIxpL1f4FB5RaUUmto0ChGRL7hS6wBtcce77656liTAC+jwxQQ5ipEy1FVoVZcRn4uEGPu+xCrvl1a57Luft86pzrf9dW8ZSqF6ZDJRfngzwG8tPCudPUB1+0K574ciMAjNLd9/aVgCg/An5SrhXuoHoF+zHtC9eLP5X3T7MPxzPArRvcr4dLkYmxqArdaXXKnjLM8+0A1aKhC2biOp7w3qqQA9mCqFEKIostcVZlZ5rcSRHxGToGjYfxIuMPje+FQzbafrFPo70jIR5OIR51f/ddZBsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=tbb01lMZ9zwGHquFJA82cCNbKKu+DzjWll/OC8VqqEdnLrsUd+c+dxrrh0GILDIJUTQAmocTstgVyezP9n9YL9XyU+YM6W/BH5ciR4LKg/+Pm/hFCwhe37FCQQXSngGjqVmCwX+cH8lL3gOZzhWq01IqLPeXILHRmCGj5LlJraqzalXx7Qmz18gNa5lZZBeqeY8jWQpu2AC7UJ12hIHH8pod8MRwkLfapHbLy+i2Bjsli7mj2GKIdvNdyfjN/TWMMJ5grER+cEzWOOIiqslToW0sJb6zCJuXWRx9oI1THETgGGapip301xwZnBi3tL+LS74xZC/ozpPr3NJ8KMA0ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI2PR04MB10224.eurprd04.prod.outlook.com (2603:10a6:800:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 10:55:29 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:55:29 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 17 Jul 2026 17:15:33 +0530
Subject: [PATCH v28 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-imx-se-if-v28-2-0a9659c7e69d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288732; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=qE26pOvp2DzEGXnbGvVyzoG5eM5x/8b/7wNYPsme7E5gB4gOtFs/ouozAreShhcXvznmhTETm
 slo1I3Sxok3C6umaXNegtSCM2KEUolZ97AGgRpVsLhhCBxuMY4JNT/m
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::14) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI2PR04MB10224:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8eb50d-838e-480d-eb4e-08dee3f1e8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|7416014|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info: vaOQ3xgDnNAolSz9LxIxgJx2G9+dliBG2M+085iLzJlVRuj4vnBCX/JCt9fh1taMqFWBT9P9ZueKqnDvPMsiYaTahzXaRX1MeibaWCMsLR65yqHTVDeRXgpIa2qnEqx4gqDAdPlpuND0584QIBtWZW5wn3Lxz1IOsDkApmzN1L2ptTdQZPk0VbySOTx+eNpfkVEurJiOgpfaJ274i/3Mqnz7IPHjdKx1ny3K111ZvPgGBPeWDbECCRI2pif/6ti5kWlV0JsPQTTsl7bcrxmz/a3AuS54V+uWYXD8koqya86ZjXexgzNkulKijMP+SMQv3GNEaX851rXGO6oXgZjHR4QP3kHOEPgXEV1DFLkD5zM67tAHlbuvVvubOFJSdwph5+DYmTBFHjuLBSGpqJQ3NWzTlH8mY/lbwl0ZPf10cAbKbGUxtwBOcaJ6LFV92JHGQ4OkAcofcFjEA1S3qNiLXyvbFv77qzAlzNZUs47+04xsjgrF+vfJ2qTT0SA6YCt1yI7TCnS1xkljjPOMTIEbHGCWwqT8kr8gnKN2zo7PNWeAJ3xKuRQx+XyWB3ZJhWhla694Fn61xRo9lI30KE1bIwUAvTwecX2hgiVzvwjLO8513bJl2t2WBYN7HWis3SgKTp0o1m2oczY4fOzVOuhsqy1xNt/5/Gd4iiKHnaDtT/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(7416014)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkZKOVFOeERIYUdrSmFpWmdSVTRPbXhmV3hlMWtqQkhFVzdQOUwzeGdZOFAx?=
 =?utf-8?B?YlV6WVBzQnJOcXhzNm9tWHk3V2dDS1BrZm5wZ3FuRUpGakhQUFNFSWJ0d2Jy?=
 =?utf-8?B?cHpkSno0MXRKQ0pUdi8zVVZzaC9vNlRwbjZ1bm5ZOFRPVFN1S2YvZlN6VGRV?=
 =?utf-8?B?bVZNOVV1OG1zODNRcFR5VXBZU3h1ZCsrOHYyUy9Mc1F0RS9veWVkT3hRRnpP?=
 =?utf-8?B?cldZQjZSSSs2Yzh2NXd4SEFBaCtFbTF2R3ZSd3lubm5IcWoxNURrdXo1TkdI?=
 =?utf-8?B?cE1Zanh2SUpTcEJoQUk1NHRSYmE0TVp6am9mYXFWS2JYTkJ1TWFxbFpmbUFQ?=
 =?utf-8?B?alBRVEdXb1NnSjBlNWdWWmFJYmtGUjdjTnlUdXZBcUt5SnIrVDEzRDRZT29s?=
 =?utf-8?B?NnRZM2M0VmxCb1JIeXdoT3FxWW52bllwUjNQTEp1bXNKS1hTRmIxOTdNbEd0?=
 =?utf-8?B?SkZOejJYY3J2NGdqVEJ5bDhLUmZqMEpoVTBXc0hrdDVsMExMd01CZmZLQzNS?=
 =?utf-8?B?dTI4NVJmSy9RMVMrNWhIQzU1amxiQkhHbFR1Z1creU9UL2U5eWM5M0JXU0hh?=
 =?utf-8?B?c3QvWlBVZW9vZFBnbXpIeXdkaUx3RmdKak1LODlIY0VHQTlsaE5FcUZSaENq?=
 =?utf-8?B?Tmx1SFNLMUdEN1dRejVuL3F5cVZ0ek9DOXZuNjBGQ1hJZXJRL21ONmI2RTZE?=
 =?utf-8?B?OEtjQ0pkdDJFZS90Y3JPNXhzY3JidC9PTm81d05kcGN5by9LWXdhT205ZVJD?=
 =?utf-8?B?cWR5c29oeE1RSDhnTXdZdnkrNmFrS0pSSmtiSVdKRUF4ZmQ3UlpDcUF6RTYw?=
 =?utf-8?B?cWhNZW5NUTk4UHpieGlodFhzb2dlNFNPNFI0SEM1TWV1cmJRcGZRcm9RbnQr?=
 =?utf-8?B?NHpXeVpkZC9YN2xPVkFxVk9mb1BQYVFuY3lZKzE2eW1IcmRUeURtZ1BOZXRj?=
 =?utf-8?B?M3E3WkxheUord21iYUREUTkydERYWElTWG1SUDlGWTJOSmdkaHB1LzFCSHRj?=
 =?utf-8?B?TVZtVG1PeFFFK1htcFhWY3h3RU1STC9BcDIza2U0eEVORDA3OHpsQk95OFUv?=
 =?utf-8?B?Q3pEVmNmR0pHbHdCK2RycHpGMjJJQm1peDJNVFArbUR1S3A5bU05WGdnV2RP?=
 =?utf-8?B?MWVRUzZJa2NYclRqazJxYWh1NW12djR4VlVFT3VNZUNmNFJNQlM4bTNaWmtu?=
 =?utf-8?B?MFJ1TEQ0YzMvejlxd0FPb0tmY0NzM3NlblBkaWhpRndHUU9haWxydng5MGxQ?=
 =?utf-8?B?Tk9ka2ZRMERXVUUzREZOMDlPMXdxMCtnTUoxWDZodmNGZVZ6VER4NndjY0t3?=
 =?utf-8?B?cnpGZzJnc3ppOXNIM2xQbkxOTmpHYndmVFpCTWV6S2pwU2tYOG9Yei9qNTJz?=
 =?utf-8?B?UWlId2t6bDhXbHdEQkZYOUN5UlhOOGRzOEEvbWRmaWdJTDVFZHFzL2dtK1R0?=
 =?utf-8?B?ekVhd3Y5WnlBWmhscVA4K2xObU9oM09pRXZEL0hRTXVkWllNMCszZzh2eER3?=
 =?utf-8?B?aGZuZ0luakdVdUZDaEFhUU0rdnI0QVpWbWJ4bTkyZGZxNnVLT2pjR1lLRGd4?=
 =?utf-8?B?YWdFQXh1ODZVRWc0THNRSmNka3JDNDYvVkljSnpKOUZlQ2x2SkowdDRlcEtj?=
 =?utf-8?B?Z1p5NmlCWndnaG1oOGdOS2s1RW9BRkFtaEVPNjNSS2ZqVGdBZmR3TWZ4emwr?=
 =?utf-8?B?VUZucXRsdE1BZndBMmRZbi8rWWxIdVFhYVFJOGhQTExVWDRtYjR0RTVYczBB?=
 =?utf-8?B?YTB6WXJ4akxDR0JzWERuRWdNSVYwOHppRjZWMUxOOG1ra2treE5JeE9kT2VZ?=
 =?utf-8?B?OVhjYTlpQkxHeTBobTlybkpJYTNEaWhUdzV4ZTJVU21GRHhiVlp2Vi93ekhI?=
 =?utf-8?B?K3VQSkc4Y215MkppV3I0bXVIdDBsb0JYdUc4WFAxTkFGSnpBaUM1T3hqMlRv?=
 =?utf-8?B?UHN3eDQvODRMVGo0N0Jsc1lESDhLcmIyMnMyRzZhK1lrNmVObjlObkhmUDFo?=
 =?utf-8?B?UytFa2psWWgyVHg4SUdVVWhJN0haQWNhclJUVDVpNXFxNHp3YVhZc1lRTjAy?=
 =?utf-8?B?MUxId2QxdU95UGxNbGRKSEJyZlpEZGNDRmJWbEphbTVRcksycFR4VEZYZkRv?=
 =?utf-8?B?MXlwSzE4VjZCM1ZiZ0Zma2NVNFBwdjgzb0hBdm5meE40UlE3MXpQZnhVVkdj?=
 =?utf-8?B?cm4rNEN2YXpaZjgrU250Z2NWcUJLRXZwNVJoc3NiOXIxWm1OeWxVamNVdmhy?=
 =?utf-8?B?SkhoRWl5c3AyMXB3MnhHSDdrZk81RjRBTlY2QXZHck1XR2NOZCsram0vcm1I?=
 =?utf-8?B?S0QyZDQzcDFvUXA1ZXRLY1kzRU5CU0NPWUl5S1cvWVJTWE5Ca0EwWTRlcy9o?=
 =?utf-8?Q?YOV9zJvzsGA8z6XRJB+TVXd+wcXUAVeNUzfXc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8eb50d-838e-480d-eb4e-08dee3f1e8ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:55:29.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0QMBiTra3/uo09HjBmr5Dyo42jS+fe/hAAVSDlj+HhAWOjaGCA7YGppOCej3XivpVcp8xZSHCdiYTQ5j0gSB+i0c+78clwrc/oa+/KsgB6+27D/5l9E7rUu+fhwKVBc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_035533_715312_5773F1C4 
X-CRM114-Status: GOOD (  11.67  )
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

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0


