Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608F8C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/KyVCtY7F4WUAmqcTHdYeVb2be16vEeFYi+wrYA6do=; b=2qM4C6sRgGr1aeZbRa40JcTTHs
	Ei50SnY79vxXCP0O8HFTVUoEF3FiEmmu6JVmicQswVZiLtONpO2UhXIC583RPfTEC8eycN130CTGg
	Y3ZGT3yVPVvWMn8EsCCku4j109NT1UlvgXTJpgYhTjITFrEvpFvuUJlOKX6GIyNAnzKD72hfeDEfn
	pw1Hy3stakKFBXRXyjbuwPuSZqavLbJDLuQjpV7aSDRWGEZ4AtQv61R00/FP5yQOZCr5tWpxrZHLy
	oXVtu2Fu1pvBkpnng9w/JNXcgjCze2SHZT/QNJOUFQ1Gwp/TdnnmvL1yrS9vLZFmopqLAl1YqzuPL
	G3Voo5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAf7-0000000Fiwy-2u23;
	Fri, 24 Jul 2026 07:49:41 +0000
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAf3-0000000FivO-1ixP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yu9+uQ13dNnNtfIZMy5NWfwShJ86uqQanDi2hSksbRVCH+LtEmyExsfTtdnh/r5MQl2mk5gC2gi4ODiGB0Q3eq5BK2ieUPhncuZRtgpRQ43hEoup0IIRXYzqwtrx003nxLjDi8nzThhed2KhC1K+PoE0/4r5wRedsuxU0esBW3jWc/+Vtyi2Hcx74CPkDCgKoGIZOxntf+M6FfMVghvJX+Dk/J10IyNY9vSV0ScPq7ocmjf2sVeV1quuzyzTeg0iNI5UFX2T2PY3/ck7zTDnhWj3od0Hdo5VwZZGLJLesSuApcVo+Fq6DJckUaYIqbvC+RPbhtCwiQPCrSmnx4xwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/KyVCtY7F4WUAmqcTHdYeVb2be16vEeFYi+wrYA6do=;
 b=BUj+DZoTAFRDlAmBpKE9rgdO4Vo3UrgO6aENeE3PzM8taUmgpZVGEE7vvjNZMgpp5kknMcfP01z5HPZ4pkgenLfTUGCZPB7dxyPWnddyHHsixK87tHN6gOk9pIBog2/6r87df+072FUrWkJY4SNJWrEbXzTuOynQHQ/sYeBvkQ1iz2N9+VxUc7OCsaZHkGq3Bi0TMoaSQZX4fwwR7JML/2VyFxOp82X3XMJuyR3SPDmkoSlGknA1pjdAMwkT022q3L9eUy4WdaHOTXxVXiO9rHpgIJ9QliscL3p098jF8q2hrUhC0wogD0Qjktwe6SGfIIlUkherZJWFST0rwJfarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/KyVCtY7F4WUAmqcTHdYeVb2be16vEeFYi+wrYA6do=;
 b=K/1hg3tIc8bx5oOF5EHDIrqu5MRpynC2mLZlcPt2d0y2tmKkMbKm9PagVpF5TL+r3gauB7Sc7XSfiMAynuCaVupnUWrmPAth9Prf9CsmVQoa3+wOUwyEWtJYuAmrhFPpajh7rgmQ4G/ZACii4BaSV8cFPdOyEGEyaFTC5UZ4IzyaCoQB4qR4TsWQt9mUbmzS2QAYVcMmQnK3qXK36ymqWRX+/rDlTz3Mw3lC/pyjHitgEehlt+p7xQYCk+itWfFEQL88VRqy7xEYFLr00bWpcFzv5HLb4VPNnh1SYVj7IjSbQy9GOGjpdJukpSXgoNdTtZGCJXigDo+IZTKjleLiRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:49:32 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:49:32 +0000
From: guoniu.zhou@oss.nxp.com
Date: Fri, 24 Jul 2026 15:52:57 +0800
Subject: [PATCH v4 2/3] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-isi-v4-2-27df7b5f6060@oss.nxp.com>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
In-Reply-To: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784879577; l=4848;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=6aW5Gxspe2hmQsP07FnJdw4wxhOn0r0RgT67abG/4xo=;
 b=xD5ag4b+Sm9a/hwRnzesOWNqZsrI/VnxeEiV8gRXsVCLOkl82WKta85DCBuxBnFMrvAS083/a
 FrUJBCpZD8DDwEY+yC4FSikw8qpgPsh0hg7opudHLckD4JJshoZtn6t
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::17) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|VI1PR04MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a2521a-68f1-46ad-1fdf-08dee95818df
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|23010399003|366016|921020|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: FMJ82MVMAfG4qbhD2+JCIBub9bzc5+kHsFub/oYlCpUcSRzxiQvxWypdZgAZhe1yLs16LleOsQ6OPduPtKy8QrKRRbwp8y45VPzprycJUOqx+fMipCShjSCy/HtGyHAgSfCie1LjmpyjP6Dwq7WVoi6oGjEco+eZFLQ8reWujDIc2+W8+WbMNvZW3GOq1ulM/gNKmukUW5fnVFmbfBTFwj+wY42ZC319jujqF+8nuitP53hI7U5GoFBukUxiXGVZ+RXXBpoDCNXZLuwTdkMtYTlW96QqZUXWQpNHhgYsjYbr5QbEu6jXYwJixtpljQOSjXqW55mkeGr/NvMJjxpB1YQDfWYGUUAusxY6u+QSaaBHWhZLPAxzAi/GaBxte1+lMrVDl3UIioWN7MUwbo4alVD7v6st9c0/Zikl82vdWH5dEv8kU7HgUz0MO91cEv4CDmXTD0oZ3piOOPyqEuhmfm/zfQdw+ripQWcJZXUI4RjhOu1ZMcM4hg7Vs0lWa1JlSdYTZO0knCiOPWK5UYYyrwtYepZXHBurPxMk/4p0tbmAMIgvDMU4I/1+dJm1bVKWJpMxTcGo+GjtQv+D9UT3OWpNVT5epP32vSd++IJzMRJ30hr8L1fBi3KlHap/FkQbAT1MMLkCCa6IQUNtHFAJBN7Sd+eYDQI3gAMzO7GfRErXIm5y0SbHWwm0adPSQ6qAv6/Ig4U6OWmGa7lgBk1gzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(23010399003)(366016)(921020)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlU5NDFKYkI0MWhFTDU3cGRNbW85TC9OeEpqYUN6QzhHelVaeW16LzVVRzZk?=
 =?utf-8?B?RkNJaFJRY0JMTnpKc3U1WmErMzgxcTM3UWlLbjZGZVJqRjZQa2VGS3dHbnNU?=
 =?utf-8?B?OTZoeTVVS0hBZ3VJOHBXbHZVdzdJN2wyTXRMOUwrdm5sRkwvTEtmR0JPL1ZD?=
 =?utf-8?B?OUJYZUZ0Z2Q2WUNxR2loZ1JQOUFINEVnVS9HTHRiK2dOK2djVnhKblRVMjRv?=
 =?utf-8?B?WUw1Wml3dFVQZkQ3Y3BVbFFZT0pQMDA3LzNZOTRvZHlXckNnVHlVYWljTFhw?=
 =?utf-8?B?ZmtBM1FhL3VweGlaYWEwckJncGI1VXVoeGlkMHFFWml0dlpOM2VkRENhNFFC?=
 =?utf-8?B?bGhLcVVML1IyNHoyeGpOd0pra0R1ZllaYXp1dHU1alZSek5yZHJlelc2ancx?=
 =?utf-8?B?VThvZEwwYUdVT0hhT3pSWFBtSDg5MEdjQlhFUTlRTTVEc0tjSUkwd3NIUkZT?=
 =?utf-8?B?a0JoUlRLbmJ4MUpCck5lQUIrRngybFFVK2NTejVnUjR5RVMvWWJwL2hrOVVO?=
 =?utf-8?B?MGJpUkd6TTRseVczUitYNmU5K01BaVhoNXc4cWQvUW5EQzJZVmJDZEtpZzMx?=
 =?utf-8?B?eUprSWc4NEhodXB1RmFNRkpnZTJteFhraERseWhtcDgxUmJUWWdsOUgrOHNa?=
 =?utf-8?B?TitnN0J3aTExZ0VVWjhHQnkxYlVMdlViYzhLYjh1UWtZUnRMYVlzOXB5a2Yz?=
 =?utf-8?B?VFJvWGdVNVNWZEJEZmpGdFVtSFpmbEZVcmlTSDJDTHVZTldVS2tQVlZiZkh0?=
 =?utf-8?B?eFMzZ1BKZHJId3F6RExFWWJTMEJIMytWVmVnNGJsaG5oTjdFU0EwczErNElS?=
 =?utf-8?B?U3pWT3I2MVpsVTBqRjIxd04waks4SU5DSTBKREhzejNJUjNGaTllaTB4VDh0?=
 =?utf-8?B?b0VjS1BrQ3VpQXFERkhnTWVlUXY4U1ZtWWRDbVdId28rSUNpY1pYVjRpWVRB?=
 =?utf-8?B?ZlgrRU5JNy9CSEE2Tm1zQTJSYVh0RCtDZVBFZDR0bHhJZ0ZMTTdlT2VNUStJ?=
 =?utf-8?B?SWZGNUtXRzRISmhNYzdUdmU1eUVQVTBEcUFGSGhzR1B4YlA1TElFUEtLSTAy?=
 =?utf-8?B?SmRiS3BkRXlaWUpSL2NzN3BnLzRGWmtuMFM3QXV4M3ArVCttOEwwK3RiSXBl?=
 =?utf-8?B?Yk1LZ29OdjZnUi82MUdNN25yRC9aOURQZUhxVnVyeWJFM1gwZ3o3MnFvblZL?=
 =?utf-8?B?aXFtazR2YTBjUmh4S0NFWGdqak40RXlBV2E1ZkUyUm9oT3lJT1pBbDhWN3JW?=
 =?utf-8?B?YkhKMmN3bExBRWRQMHJNVlZDamhweWJRK1l6TlhhUi9ZdGVRVXNJZ2lyK1Nr?=
 =?utf-8?B?OFMyTklxOGtBZktWejJMNkxOekpQNmVva2wvL3pwNnFUQTNSY0xIS1pPdjdl?=
 =?utf-8?B?NXcyQk9SRS9Oek05d0dKcHZIZld1SFQ1dXdyazVBcDJLbHgvZ2E1WWpmL09M?=
 =?utf-8?B?R0JmbzZGOFk3UDc1aVRlTnZEeno3L2FOQTUweXVPdWV6SWtIeS83dW9yczJy?=
 =?utf-8?B?a3NjandJY1l3YnRoc0FPa0syRE9GeEdOd2lDU1BRVCsrVVdQSGp4MTF6SkZw?=
 =?utf-8?B?MmJoWE5iZUpIRGNZd3dsS1RGOTFvSWRKVkpiOUlBbGJ0bUgyNWFwaG5MeVkr?=
 =?utf-8?B?YVFoVU5INGNKcVBhTEwxdG5ubXJUNGxrMVc0VXlEWjFzVUxiSVpZTkVoc1pT?=
 =?utf-8?B?N3BxQkN5dHdmRzVoR0hiUzZPOTY4MGpkK3pMUER3NldQWmNyRitGMUcrRGpt?=
 =?utf-8?B?cU9jekozRFNuamNjdmltK0hOZ0QxMDR6NjlvWTV4Rk1TZjRSNGNyM0ZwdGpV?=
 =?utf-8?B?MzRqWHhVMDZoMDdLRS82Nmw4WnVKWVBLaENaendLdm82UWErTU9PM0pRN0dm?=
 =?utf-8?B?NjdwNk1zSmk5S3pnLzZVSEhlS1BKNDBWNGo2RG03ejFJNE1tZm9XVUxGbXVl?=
 =?utf-8?B?N3pPaGRLaEs2S0lXenU1dStEY0JsdzJObExyeXl1T3puYkN4cWNHOTFlZlVH?=
 =?utf-8?B?WS9WZ01aU29HRy9sYmpXdnR6eWVNeUs5bHF0OCtaM0dJaTF6YVBvYnh5dXNn?=
 =?utf-8?B?NGJ3ME1id2ZleU5qNjdpYmYwaml5N01mRG9zTlJkbFAyUStqTDhITTIvMFgv?=
 =?utf-8?B?V21ibm5ReHRpS0dNazM3M0E1MnA2VWI0QUxLeTBuc3hacVBTczd2ZS82T2wx?=
 =?utf-8?B?a29qaElwQ1IwOExqMzdlKzZleWtyUVcydEhmNkJFSDFYMEFVMVVlT3FtcnBI?=
 =?utf-8?B?TTUvZVBwRU1jWFpvVHNsYnRCOUJESUViYk55eTB5QUs5aHBoa25uRDB1ZFFi?=
 =?utf-8?B?ZjRZTUk0Rk00QUZPVHdUTTVHbmc2RGRCL3BEbXJiWTJvd0pjRW1QZjE2TEdq?=
 =?utf-8?Q?yzL4UVEBV64ByilWgXpga+s5sqaTHU1+eW7jW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a2521a-68f1-46ad-1fdf-08dee95818df
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:49:32.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qqh8M8xGq0oH/rZ/DZiauJAZ6a+bqlnFq6YBVsFVPBeOAqb4DL+XKZZaUZsYnv2mi6HbOBO7olxaqENkttX6o1bM6NJF0nfkWjufwhL4rXFr6S7vcwHExTse1oJHJQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_004937_455090_110D1B8D 
X-CRM114-Status: GOOD (  11.40  )
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

From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
SRGGB16) to both the pipeline subdev and video capture interface.

These formats are used by image sensors that output 16-bit raw data,
enabling the ISI to capture full dynamic range from such sensors.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Remove "high-end" from description as RAW16 is common now (Laurent)
- Add Y16 (16-bit monochrome) format support (Laurent)
- Add Reviewed-by tag from Laurent

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 30 +++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 45 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index c0ec59856374..934f7b356258 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -83,6 +83,12 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y16_1X16,
+		.output		= MEDIA_BUS_FMT_Y16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.output		= MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -179,6 +185,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 056603055c81..a6e044056762 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -212,6 +212,15 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y16_1X16,
+		.fourcc		= V4L2_PIX_FMT_Y16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.fourcc		= V4L2_PIX_FMT_SBGGR8,
@@ -356,6 +365,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SBGGR16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGBRG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGRBG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SRGGB16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{

-- 
2.34.1


