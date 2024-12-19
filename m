Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D005E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5b+8lvSWf72oyG3sh/GLDPJvSds3uAw8YVa+FWkxOw=; b=SYx9NN2YNd7+2nAcVecLB5wtPc
	eH4lqDtVrAB1nPW3V725liw+MsQ+gDmnL2YGhpWSJPFvr4oaN40EqGm3K3b+wpltjN6JtOZ+EJxM6
	FQ/EkrkieHdxMBmeMZpnYPapOKxHjeaDO7jqeJAv6hChoBc5gwXtl0KoNn8pz2aIQ0f4o1SKNdbxF
	FWbN3GQKx0xrMjXa9jrCRJ+cvM4H+Z0ZGmps9aj5zX5fW5U3bcLY6MTrUdt/wBOgrqko5UFVlkJWd
	WC/85P7Zx4uzVEiNdsYJ5vxvKmf8VihAbZf445oUOMTTVfjmob+c6WtCiuJaH3NhLDYSsqt+Er6kw
	EMba0/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM1V-00000002p2Y-1kFc;
	Thu, 19 Dec 2024 19:17:25 +0000
Received: from mail-db8eur05on20616.outbound.protection.outlook.com ([2a01:111:f403:2614::616] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM0O-00000002oik-1zDe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKf+x0jjt/L+7TqFQTOO0JVg7hCWXt4JNuJMUfPanzBIol1OraMPSh5QASW5wKDrhwJybK0XmO8ugOriJBbAvA3OdIcjhqYY0JdzlI7N1oAJ1Vyc2XK1KCY2r93Vazkg34AjzO9qb3PKpuzbI2F9u+0x6sgTiMlAq4mdjfuWng12b0UhfVm6utQkDJSFJNIS2g4VU9SEvcTaeZWK8vnEgW3Ura5j59nS8oLjGf68m3/ao43kZNkLnu8DgniVEdIO/sEYHmJBRe1y3KqZRY3LoWgOGVe2TzNg6VqRSFsOFCsQcKZHl2enXqRTUGtWDjfyiP1UrwjWzEdrtVm75q/qXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5b+8lvSWf72oyG3sh/GLDPJvSds3uAw8YVa+FWkxOw=;
 b=jYoUPwyqk9zB9NGk5vlKO5EMH/McmoVUt9HpDcaEwiUWDnTAj+whzee1DBROfnlr5x6+lmH21SNirGIH2MJVLSrWMSsrCOg6Al+F5XfmK0e93E3muG1ahdFjHEU7AkykwSx4ORVXry4lQJwFLWzHg2EIPBlnXFuZmFCnSRhnRop3c++LhFzBq0vPyuXR58BDcUSATY7BpNN/+5KHGTq3qrD5rhQMi5K3czHa3auXD66V84CSKvgkYTTZHgD9H2BRzmOuZSjNA1H8PizEdh+SVKdIY7vIiqyi5eLUPlz+3PiCTM7dmybXfoIy8rboi6dGMuLWfe3fLCJe75mzg/Jwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5b+8lvSWf72oyG3sh/GLDPJvSds3uAw8YVa+FWkxOw=;
 b=bMAvTcidTg/B7ASyS9ZaXPTmYyuLbiMQaHR3GiQVyzYYD0oIuNxnbjxR7SZtLMMiSigxAgqS+EySHn6QATTRCaQ7sW8acCJ0457p2U2s77g6MMq5YdFMEFDdqRziXDwXnH81aZUmHzqhKlFAmTJIh5VVDcoH2qv0m8uRJNT65i3b9nsXhJ3gOXyVd1xiv9yXsUBim84w4qRTjuj7i2tUJOFIIrDZZEGR6XVhskonh2h9a33vlWq4TDOSu2KAG9qULHyXikGchRtgb8Vv1lFSr3WKSJIIpP9jMp0cwrrgfsNyyxBLiJJZ1q0MG0dc7t8qA3PnCSARAhXFhn7bT6PAtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7293.eurprd04.prod.outlook.com (2603:10a6:800:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 19:16:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 19:16:09 +0000
Date: Thu, 19 Dec 2024 14:16:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] arm64: dts: imx8mp-skov: increase I2C clock
 frequency for RTC
Message-ID: <Z2Rw8qnn9hULyh8l@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-10-38bf80dc22df@pengutronix.de>
 <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
 <30dbe486-7e36-426d-8fa4-3ecd83193a10@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30dbe486-7e36-426d-8fa4-3ecd83193a10@pengutronix.de>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: b3567b10-0d52-4cc6-809f-08dd20619857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFNSbkdpNnE0aXl3LzFON2V1YVVpYUpFM003YlN5dEpsWWswUFJKYjczNWtw?=
 =?utf-8?B?Q3ZON3pLZTJRVWxaT1pnK3cxeW94L3VuQ05nRDl5WXJiNm01clorZURaVlRR?=
 =?utf-8?B?T1VBNmp6bXVVcVRxR2NlRDFtblhZVVIwMWI5WmF3ZjhUK200QUo0NURLWWpS?=
 =?utf-8?B?WWNTek1GL3hjdE5nbnlLQktTdzcxelhjclJqWnB3cnVLNGFiVVpWa2IzZ1p5?=
 =?utf-8?B?L0hTMjh3QmhqK081aTNZTnlvbmVZTTNqODhJd3pRZFdveHNGQ29NSzExMTVY?=
 =?utf-8?B?Ri9ES2ZiK095dWhaVFZYdkNRemNtL0d2bnc1UjhJcGdWV203Y2Z4UE5GQWhL?=
 =?utf-8?B?dExFNjEzeDVhcTRKRTVIK0JXSFMwVFZKL1lrTnVzY3BQVGwzUGgxNGdaeHVr?=
 =?utf-8?B?M0VRT2Q4Z2Jhb0RVRkg4bDJUVWtiTUN1Z0FRTGlmSWNITDhlT0lJMTd5VHN4?=
 =?utf-8?B?NnRZUXNib3dPb1RJZzFNd3BQaXJ6QTY2R1hyeGkxc0RNZlBKMFZVek1BRFYv?=
 =?utf-8?B?R01NcTBLcXlQbVc2S21DNkdJenJ0ZGNpUVIwUURaSUltenBRZU12T0lxejR1?=
 =?utf-8?B?cGtuN3Fua2JpWnhCenFEU0lIL21jUkl3RzdVR1NuYjlGbWhmYzVwQUl2LzIr?=
 =?utf-8?B?MlBWUXlXdlYyK1dQZ2t2WFltbU9rc25Vc3FHYnh2WlRzRzFVTmI5ZElkbytX?=
 =?utf-8?B?TjJnNm9ReGljTjU3YWhRQW10VmcxbHJhY092UzhZU3AzVncrS052bzdVMjBI?=
 =?utf-8?B?cVZtSzVIdjBWSEg4YmYzdGVaelgySnpnMjJOajdDRUlQZ0ltQnlUVmMvYVR1?=
 =?utf-8?B?dVBIeEJLS1UvVlRISEVicTdrcE9NVnpSdlArWjlJMjYzaTJIRW02eVR2Z1hp?=
 =?utf-8?B?bW9RRjVnZXA0bDhERHZDMCtwZ1dHeGVkKzNRdi9ab0R2alpIWmI2dkxXajc2?=
 =?utf-8?B?TTkyVnhiWjhreGRaSGg3REdJdkxKUm9qZUlRVk11WWdiN055Z2hmRkNSdGpC?=
 =?utf-8?B?NnNRcXoxcUNqZzhkYkNjay85T1EzTmNPdHVVQnQ0SXkrZ3RpTEl2Q0ZZWWc3?=
 =?utf-8?B?alRvazdQM3pBZ0Jqd05HZllyNjJyQVNDTVo1eG5xVFFiZCtLWHZNRHVXT0tB?=
 =?utf-8?B?ZElCZnlJVHRKc0MvbGFScGVUbERQRGp1aWc1YW91eGRNWTdVb3I1TEtOamNi?=
 =?utf-8?B?bDdJb1M4SWZ1YjVKMHovM1p5cWR0d2lndGlYM1QwUlJPbnoyN0gwQnBDbmZp?=
 =?utf-8?B?Rm00cTdneVpPSXUwUHMrQ1h4ZFFOTnE0d2dBZE1Gd1FYSGI4Z1ZTVGFWcWdE?=
 =?utf-8?B?OW5DRmZoOVRvbkJWTXlRZVFOdVdvd2Y2L0pwc1BoV1lES2hCWTVwd3pPRnVI?=
 =?utf-8?B?UDdYWU1tbnZuUkdlTDZZQ3ZVVGltdklsaXlQRUNwUXdhT1dkYkNUUURybWR5?=
 =?utf-8?B?Wk9SRlJ3MHFXS1hRZndSWVZ4SFgwRmZwZlJVTC9OODNReG90MTdJTHVvWnl0?=
 =?utf-8?B?N24yakxBUk5oWlhJKzBPNDRQV2tLUzh5akN6K0JCTW0xK3dLZ1BMUmd2NDc4?=
 =?utf-8?B?TDRUSHhzWHJRRnJtTWVHUURxZi9KTTJaWkQwVGlKdG5ISEhsN2ZaZmRMZCt6?=
 =?utf-8?B?SVQvU2tReVVYL3N6a3d6dk5wd2ZpZ1Mya05hYVdKN0UwNnNqYTBmVWhpQ0FX?=
 =?utf-8?B?WU5ieUtyVlBtVmJuL3Y4V2FUTU53VjFaUjRwd3p2VVZkbCtNZGhGV1kra0sw?=
 =?utf-8?B?bXJZTHFOR0hhc213azB1ZVp6TGhNWC9YdnFMMjA0YXBMYXZ2ZlMyaHJwOUpz?=
 =?utf-8?B?NjFVN0xPWkNGaWVMdnl1SDFQREtHWmFNcUNFT1BWV1dERWxCcFJwQzhDTW9C?=
 =?utf-8?Q?RuwCu/sIbdlW6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjF3SzdjY1JEZWxSb2YwcDU3WFozNUFkZyt6bG13TDJpWVA4a1VlWENmb0dn?=
 =?utf-8?B?WnIvMWJ6d3A3dVpWUUs0RG5Cam9MNFFwRHN6bDh0SDAxVTQ1ZVdndmtnUUUy?=
 =?utf-8?B?bHliTzNFdnRBcVNya2h1SVI1RWNjbWlzK3pDeFpINnNkeW9FWFVzVUhCM0s1?=
 =?utf-8?B?MFk2RlN4R2V6ZlhsYzRXZ0xPMXJ4TUNMOElYaEpEcnVFM0d0ZzJVL2NuNFU2?=
 =?utf-8?B?ejAwb29qTE80UzRUU2syWkI0dW1Ja1V4SmFTVEhwRGlTc3VLQ29IODB4S1J2?=
 =?utf-8?B?cWJtMnRXN1RocVdaZGRIZnE4T0lFdHJjTE4vZjRNTUloZ2RDSkViTGZFb3Qv?=
 =?utf-8?B?Nk9BUElQM3A4ZUduRGpxQlZxOGpIUmVQd2NMS0h5SFhLZUhFWUhxTlNPVDAy?=
 =?utf-8?B?OEVwY3V5K3ZCZ2RSQUVpa1Rqc0xQZnI5NDJJWmxzZzBNczBSZG1HV0E0d2dO?=
 =?utf-8?B?MUNZRFl2UkxkWVRXd1RaVFZGODlpNGpXYlBCR0NQbmxJNThWQkY4Znd1R0pm?=
 =?utf-8?B?LzBUdGNHZERJVFRRVXlKQXE0NTgrV1JxNFJvcmhPd1o2a1AyaGw3YmdXV3Bx?=
 =?utf-8?B?blQwVWxMVzRaeVYyNjhKaFkxRnBZNjEweFl1OFBkbjA1bUYzS1gvdDY5eU5B?=
 =?utf-8?B?eG4rN3Q2d2Y0OEgzdDVOYlRYaUp6N1pBSHE0enFGOEE2aGE1bVdqN0VPUmZS?=
 =?utf-8?B?cTBvQWJsTHRCd2RzZzU2bE84WmpDZDViZkpzdTlaZzdsc3lZbUt2U2ZjYUxl?=
 =?utf-8?B?a0Nadmh5dGVxcndhaWJaSjN5U09qSGJBTmR5UVVsd2c5YjkxcnRTTFJSUE1a?=
 =?utf-8?B?bllDd1FsNzNUVUFsRjBVOGthazMrRXlMR2RTR3VkelpMdEFJQmRMZGM2dTd2?=
 =?utf-8?B?OVNvNFpSTW9CbktxaGtyZ3lRQlA3MWgydTIxNFJHemtDMkVjRVRXcmY3NmpC?=
 =?utf-8?B?OWFHTGFIbWd1c3R4UjF5TDFWOUNjNU1vMHJEd0FqR2lpNWhHK2RjQU1pK2tC?=
 =?utf-8?B?eWZJQmJCMVViakpVTm1DTVZna1ZFQzkrZzk2aGRYL2R6NUZEL2hMb2IyYXBJ?=
 =?utf-8?B?T0lMQzUvZjB6WXIrejd1UFNVbXM4TkZZRkdVZjBGV2hXRGNSZjJUdm40Yjl2?=
 =?utf-8?B?eWs5Y1U1TS9xQjdDdmxPTEhlZ3o0TFRUZysyV0gvaUhqOXlTWWFlcU5WemMw?=
 =?utf-8?B?bDdBeWxMNm1CSmkrLy9PaDNhcnAzaVVuNnRrOUIxQTk2M2d5NnJqRGd2V0Ux?=
 =?utf-8?B?cXFYMng5VWh0YmZ6YXhhUTF6VC9WcWdjYlhhWHZoeWxyUTQxcWRJbS9QNCtn?=
 =?utf-8?B?S2YyQkxFOVlrZ0V1ZkVIUFJpUDBOS2d3RXFqblRnTlBxWnJyMDlGcThicVBu?=
 =?utf-8?B?RHpuNU9URDRxb2JydDhLbGpGb0NaZFlZeTZXc1FhY1dFbkJIZ2ZDR21iR0hV?=
 =?utf-8?B?bmJkTXV3ajM1WlQrQmp5R2lOYmZVcHkxalBvVVlpN21BQy85SjdLUHJZM1VF?=
 =?utf-8?B?a0ZodG5sWDA1TE03WVU1RjdVMHdPYUppTGVxUWhLZStjSjI2bUdFZWpYaHNV?=
 =?utf-8?B?eHA1V0dyWWpYRHQvdk9ST0J1dlJuTzkzSWU0K2VodGRrWlpzRXVtNEhFQ2I3?=
 =?utf-8?B?NUlKR1BtRHF0dHlRck9wOWlUbWFTU2RwcDI5bHhLamFueTJCRml3N1lnUDV6?=
 =?utf-8?B?KzhPVmdhVitQNE1pc3ZNdFEvN3diTTFtaW1rYWlzZUxJMURiK0gyaXlWcm1F?=
 =?utf-8?B?L2htaW1jNyt4NjJpUFdmRUJkeGx5cUpkclNhUUcwakQ0N0oycmRMa3l3R0JV?=
 =?utf-8?B?ZXBWcXpCamNYeHczMTA4SDM0K2lMbVBFUmtmazhNVnVjZGRxenVHdEVmaWNB?=
 =?utf-8?B?NmExcmdOWjQwZW9aQVBBMnNSSnRDdjlVQVF4aGQ5RTgxRVlsdWs5cklhcHZm?=
 =?utf-8?B?dFFGNXlqc3lVWTFQSm1ZVlRuU2NOckNXRXB5NmRuWTVSMVFCUHg0YnpTUzRP?=
 =?utf-8?B?eHVmdm44OTlZVFJod003eHVkT2dld1FuNHFPWmQvRXdtOXlXUlcyZUVzL1hS?=
 =?utf-8?B?L25ZZ0E4WmN4Vi95b3VGL2lrb0c0TUc3c01RcVFQNWVKREVLUEI2MUhIdnIy?=
 =?utf-8?Q?xYlc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3567b10-0d52-4cc6-809f-08dd20619857
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 19:16:09.7386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYTMRN0W+gTcd6TclQiSOKEcUDnjtA08Jy73ZwG6xbt1Ej9GGCfzgywpNXoGZPbp38Mebk+ObbAfJa4B3tRbQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_111616_533647_EE4C2F08 
X-CRM114-Status: GOOD (  24.17  )
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

On Thu, Dec 19, 2024 at 06:51:35PM +0100, Ahmad Fatoum wrote:
> On 19.12.24 18:47, Frank Li wrote:
> > On Thu, Dec 19, 2024 at 08:25:34AM +0100, Ahmad Fatoum wrote:
> >> From: Oleksij Rempel <o.rempel@pengutronix.de>
> >>
> >> The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
> >> frequency, so let's make use of this instead of the 100 kHz bus frequency
> >> we are currently using.
> >
> > Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
> > support it.
>
> Unlike your other suggestions, these is no information lost by rewriting
> the commit message as you suggest. I don't mind, but must admit it feels
> like bikeshedding. What is your concrete objection to my commit message?

According to
https://docs.kernel.org/process/submitting-patches.html

Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
instead of “[This patch] makes xyzzy do frotz” or
“[I] changed xyzzy to do frotz”, as if you are giving orders to the
codebase to change its behaviour.

Generally, avoid use

"this patch ..."
"let's ...."
"we do ... for ... "

Just simple said

Do ... to ...
Do ... because ...

Frank

>
> Thanks,
> Ahmad
>
>
> >
> > Frank
> >
> >>
> >> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> >> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> ---
> >>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> >> index a683f46fcbab..ec7857db7bf0 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> >> @@ -333,7 +333,7 @@ reg_nvcc_sd2: LDO5 {
> >>  };
> >>
> >>  &i2c3 {
> >> -	clock-frequency = <100000>;
> >> +	clock-frequency = <400000>;
> >>  	pinctrl-names = "default";
> >>  	pinctrl-0 = <&pinctrl_i2c3>;
> >>  	status = "okay";
> >>
> >> --
> >> 2.39.5
> >>
> >
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

