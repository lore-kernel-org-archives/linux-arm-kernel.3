Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77518CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=; b=RRMidXO7AuIFiEtn/lH0C14JRm
	w3HOxsI5GKwZWVHADT6V8RCcwHPZHaPCLg3+ft9iE3TXnQmT+Sl98e3+IKtsS9VjGDrZLEnXJcKZF
	qUYVeqp779oIw8F+9tmbzzSkp1ZZILUkWyhIQWsFTpJ+vaRDsFJsTtXC1FLvvabZzjKHvm1F1AHV2
	DOh+fgKZHk3/NSG21/5qC+M5gHjyf8SjwWZj0+913/Tpc0QIMuYCQQ5BBJeaSHSUx5mzjpkCoV8fa
	KE1B84pYyUlLznbNJgb8yGXe5EC/9kEIDAkx69duaJt2NtZj5oCnj7st3WN+9wNeBd7FFuIJiPSUE
	qc0e1qeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUo6-000000034tm-40o3;
	Tue, 29 Sep 2026 10:11:30 +0000
Received: from mail-westeuropeazon11013034.outbound.protection.outlook.com ([52.101.72.34] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUn5-000000034GB-1tEc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:10:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8pUhr3gcfl1OsdsWRHgSAO9NtnXgGsLWKBy2ppLOAob15b2bhDNPk0vJuIuvqt7azAAWbvvjqAU3EUmu8zwn5UKVumbpI+aJh4u/RA8iIdphETSDFxI0zdXGv9+Z6ybSOx/KIkhr53IkJuv7IW3CqH53IRF1bm/uoRg3+pDIwrhzX1ycpp9PsX7JYjkm8W/yHme3NCHcwIVKdiDH+62UkX9Reis46e11M/stDcGot93bAOjg7fG59ZlfCN0dS+NBq6FL42pfm+OVO7NekY79sai0TFpu/jh04Cx2+DyRMBjQnqv+kmnLQO3E69FiWMgVvevvWudJCM9JgxzQcAxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=;
 b=wiinfg08lYODTCvWKD436QUFYNXBY6SEUt6nbdECrWcxvRHxXDUZw1SvhbuTd82jI7Z4gZC4nrU15IKLwVKHZuttqidXwuCH/cltFxU1Wn9tuu0itNupImnAW1Vt/0xh/Xmf8iBzccK17JH97oY/B7D3z4wvy4QA+M0NVLDdaVCuQxiASfo9twM8+mGbMl+b1ZesxN5moTNMQWmwXW8ujBaqlhD1nOBopqy9u26J8FWbCYBCyJeM38efdHrKntkTGNAltyJqsyQPOsTkUl6jIkt5g38E7SMZ1ybJro8c2ykZ3aQbsve95gkQaInQ1GpMs8CGJ/gTsLCIXDd06MFPMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UOWV9fRxUwt8l0WY2hoefG5eR2DygWkQFZDWhOqVZ0=;
 b=LL+qzq9roiMfAy6a7y5L6EiQfJozPya1dS2+8t9cvY8Zo80DlhajOF1at83o2795XSXihOKmkDFWG37ICqYCghMiPyGYyIeLDT2nWB+mmYCFdGNmErp0bLmNVCZjsrfdniDHL6OXpLvXYrjZE7/qi0IypAJc73nMQ5vCX583TickqO5FDQcbpXTPpBNRen0ApcwLpvC42XaMLOWxMocNXp1YHkJXPCXOvFx+rzci6rya33kS9bCQlUyxXxOXkxceDm9sONZAp2xP9Kxp+ZmAadlTRNIwQYD6Ccs+CuORHG6YIvsmkvkj2wK90tYJA2x6Kfzpi8AeDSXc+Yo+uct35g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by VI0PR04MB888289.eurprd04.prod.outlook.com
 (2603:10a6:800:366::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 10:10:21 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 10:10:21 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Hannes Reinicke <hare@suse.de>,
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Subject: [PATCH v7 11/12] arm64: dts: freescale: s32n79-rdb: Enable UFS
Date: Tue, 29 Sep 2026 12:09:45 +0200
Message-ID: <20260929100946.693962-12-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929100946.693962-1-larisa.grigore@oss.nxp.com>
References: <20260929100946.693962-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0010.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::12) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|VI0PR04MB888289:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c36bed-fa6a-45dd-9821-08df1e11deb5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|366016|7416014|11063799006|56012099006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LShwBQyPWzLYVN33P9ApcTw0CQ/vof285S9nnl4LxnHT/Xif/M9n4Fi6E2K5UXoilt0QiSJ0GbzAyCIGbpj9C3cjoPPeSgNqBki0zn1Trj1Bq3db/63H7oRAYBTvtFVLrYxaQlxPwog1QoMa5vWRji6pumZZNYCRLL+NvURlBOZizxxDeRe3k3JY3a9Rgps41ULXHvVtM+YFYjiYpoNt5ZIrP40RIfVmQSe4jgpnTHUb6QTTJp3utsrT7KuZ4bIEWVr2VgWluUvJp+0yG3E52nMZqvKUvZIhu8EEnPv7x0g2hnkDAfChK+AgUU+dqFC6gokgxnlyjhKjewRtYYh73XIFFRWrlfpsgoYiq+oVHxy+kUSmQuu7NBzBU+EMHgoNDg5r4WCl4GpXsX5hJfP7Io1+10NDoN6lyV8p2+24fO2T5/sz0HITD/vuilb0yvQRXbkhdJJW5Gst6j4Q1aDilG1zmzn0UER9N82C5v8unEyBi9VV0h6rLip/a4OdPZvIfP/piAjyzSb8Di6dF1c1ipCokxqD/35sjXEk15V+8hTD2jSFf0M5jDvS04EK7h5MtetRmREi832Drc88myMYahVeXdztOFURqHniE9GTyABP2O/1gq9RpCgaZbTwL0gyWLs8rr647lFox1p5k4oAxgXGXRDjNn7OlEMtruKjIu0tgEvMQfFf3ZvtbEFHEA8V20ydBeaN5pl1llaOv26PRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(366016)(7416014)(11063799006)(56012099006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2IrQ0ZabzRnWklJdVB3NDNOdmhXd1JQYVMvcDJFREVFczd2SXBnbG51dmVV?=
 =?utf-8?B?OGVmVm1JL0s1ckMyeDl5L2RCV2kxWGQrN2ZDMUxuZDYwbzdSaXdpK25WSU85?=
 =?utf-8?B?YjJ0aGgwNUZaTlh0NllnL2pQOFJPTTNqcGhkbDNuZERzcmw0dzJiYWZUSjVo?=
 =?utf-8?B?bENmRFBFMlNoNlhRZGw3WFVYNUlkUVNqblhOWm15ZHA3cm85MjhiQ0NuTHk4?=
 =?utf-8?B?Umc0T0xMSFYrQm80OTQzM0pMSTJxV0FGb0cxS2xIeVVlUWlEZnpDQWo4ZUxk?=
 =?utf-8?B?VGliZnQ2Q2srVEpZT3ZVdDRncXd6L2tLQWlUWG5XS2xYd2ZjYkVqUmVXQS9F?=
 =?utf-8?B?dndZZlBMeVA4V0laNWFNeXhPMENZN3hTeVU4ZDBLZThNd0lLSWdtaEU3Zkh2?=
 =?utf-8?B?aEdZVnUxK0RNVzlNdHZONHRUUjl0MW5wUll6eE1GbkFHdHVwWG1NZHg3Q2Yy?=
 =?utf-8?B?dEVmOTVaNFB6NENoUys3dDFqL29laVBlM2t2MzFqYld4VjZNTWdOUnp0Zit0?=
 =?utf-8?B?d2czMVNFcUI3QzE0SW55TFZ5RzhBOS82bmNQUFJUdWx2NDRMYk5wRWxlS2xw?=
 =?utf-8?B?RTh4aFByYVl4YzVISlVtL1dpMWFKTVV6ekZENFBaTk91cG5wQ09rTXVWdmM3?=
 =?utf-8?B?cld6UzJ3bkJmWnA3cExET1cyWDhyaU03RS80YURKZVZZbTYrd296NHczTC9o?=
 =?utf-8?B?bVAwMndZYUo3QjdMK2JiRjJXRnUwM1puUzIvOHlETTFRZkFhQ2Fxa1U4VzQr?=
 =?utf-8?B?ZHEyYTh2V3k4NjlxTkZaNnA0UUUya25sTTRONzZLS053RlZDY3phdmhFOHVm?=
 =?utf-8?B?QWdTZVgzY0U0WnVEY01vMUdKdnpuRm5wNHdCZnEwL1oxN0VEN05OaDhPVER1?=
 =?utf-8?B?bEdZdG1FaGtMaUhuUVRSbkxselF0UFgrMTBrM1dpRUVtdE1jYWp4aloxQVIx?=
 =?utf-8?B?UVk0a01JWXhZcFg3ckVxZTUrY3VDRWtYZDBNRkl4RUhkWk1UK3ZWaTY4bVZO?=
 =?utf-8?B?eDh5c3BIc0hTK2FraXVyeW9jZk12ZVB0SGNoNnBFTnEwWmVUQ1orV3BhZGFt?=
 =?utf-8?B?Umo5eVZ5OCsySmJ2L1NrSUtmaHNhZHNzMis4Z1N5R2lQY1MyZTI2WWhNV0gr?=
 =?utf-8?B?MEtjdXNxRTVRaExnMGpoT3dUK1V5SFN0YjBUVkJkdEJEWWRvM3hsQWtOcTZh?=
 =?utf-8?B?WlEwUXZSZ2M2N0Z3cno3VEJFbUNPYUM0SGlOSHNncU9tcEE5T1NKQjJkbTBi?=
 =?utf-8?B?cDRXMEhXS0NqR1FEekVaT3JiZlJmK05ZNjIrNmIvSGVQaHF5bGhWbXhCbUdv?=
 =?utf-8?B?N2g0aXpJR014ZXpmZWxsQXk3d2U1dDJScmgzWjVjNFBpdlFoR2JqdXRsRjNy?=
 =?utf-8?B?bzlUcTBjZGdBVnBSSWduSE5VeWhNNmFVY1dsY2tHVGh0Q1FlK3RwKzdwdWpo?=
 =?utf-8?B?amdpQVROSGw5dGt1UlBMdFZFeVlUQkh3YVlzK2xMME5sdEI2aytsdjBrK0R1?=
 =?utf-8?B?dTN2b3hKVnJKRmJHRXM4Vm9BWlE1Y3RmZ1RsdWVwZ1RPdjNqQnF1dm96b3M5?=
 =?utf-8?B?bnQrRU8yc21lbnV6Vy8wY2x0RUVLTnZtS1Vtd25tNjdaYTkrT0c3RkE2N1o5?=
 =?utf-8?B?aWtGK2dFZ3ZXK0hjVjN5UkZQcllmNmh2RGxiN3pxSkRpdzBuRENMMnJpMDd4?=
 =?utf-8?B?cXNRL0VaSWpqZ0FwOTR3N3lMbWtvMTZmdk9lUGxvaUc1dFJNTXI2N0lqWFVm?=
 =?utf-8?B?QkRYZGh3YlBmQTJ1WVRmQUxVS3hhdExucjFFSzlaU21BQlZaWTBMSVF2bVhr?=
 =?utf-8?B?Z2Q5dVZYV0F6d0FZamthbytrbUl0YVJRTGdXRWw4aThTS2JqZXhhQXo5bHp2?=
 =?utf-8?B?dk9PYWJKQlJOM3VIYmc5NUp3VkRLbXFkOVdJa1FDRGR0WGZXZDBCNjkrRGV6?=
 =?utf-8?B?SS9YTzgySTJDNzVjUStjeDh1eDdZNFNYU09jaXA1T1NCUGlrNG14Rkl3WGNp?=
 =?utf-8?B?Z3BUazBmOFlNNFY0NURxNmY5T1BWb1RMUThQSngzRU1DcTVXbTNnTTBoOTZH?=
 =?utf-8?B?ZGpVNE8wenRDL1pVblNYT21raFVWTGRUVzlNZld3a3VDNHJwbHUwcjhlZHJG?=
 =?utf-8?B?VndBNUkwdkE3Vyt2N0IrOE5nTm9JZXRROFRhZjZxL3BadE81VllLUHozQ3VU?=
 =?utf-8?B?WmJFS3E1T1FJY3cwRUtDK2RZOGpheHRxZldVRm5neVViZGF0Z0ZnT1dNZHgx?=
 =?utf-8?B?NHlVdUI1b253RXlSSTVsenFYdWYvQk1nSGVtc3hmcVM3TW5uVUJGRG1aTW1h?=
 =?utf-8?B?eWVEL2ZuTitPRG5BYTBXNTJTQUYvVVNEUktRVWJCcVBnWnJDT2Fsdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c36bed-fa6a-45dd-9821-08df1e11deb5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 10:10:21.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORfcQK6Dk9WIezhQ3UBdrA1iPL0Rjj4kjDMPnAyzb7AT255KoA6+mwoOhErCUqzGr3O7Rj4TIIFBcL0U5WxD+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB888289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_031027_509831_40D0C1A3 
X-CRM114-Status: GOOD (  10.07  )
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

Enable the UFS host controller on the S32N79 RDB and configure it for
two lanes per direction.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32n79-rdb.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 1feccd61258e..38c5699e6d54 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -63,6 +63,11 @@ &uart7 {
 	status = "okay";
 };
 
+&ufshc {
+	lanes-per-direction = <2>;
+	status = "okay";
+};
+
 &usdhc0 {
 	disable-wp;
 	no-sdio;
-- 
2.43.0


