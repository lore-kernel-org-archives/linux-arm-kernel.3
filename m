Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74D1C98325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYEzPh2HCvulMM7n8NLZihzPYqqg9U+hllx69esfCrk=; b=pPjj+9xi1cXGiL7GM30qoJZ7Un
	WnkVP3D2EokV00uI0mQmeeuLcZyLK0xGCDCl30t3trfddBtG+gj/ciiYu5WBpGqRUaMDcelgZBIK1
	ACx1Lxgi2X17314pdghgkIfIbGOk9I3XVXSaHlyac6LGvz/6wuIQ1Wux92APeQjm6/DsSU8R+Vo6K
	K9zh3AGI2UFARdP7kLiM16fT4mjKfMaK8ulGw9m9zM1epe29NhIqyEeg40S+tCH5KSliFyaRqr4/v
	WqnVXSfUtBxVFfcwVyZ31QWW0Y8i0N8G9BU6iRQfejHcQ6deG0uLgjRWYGBVLYlOU9T2bZ8v5BKjj
	BETJLvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA72B-0000000Dbfq-3duE;
	Fri, 25 Sep 2026 14:36:19 +0000
Received: from mail-northeuropeazon11011062.outbound.protection.outlook.com ([52.101.65.62] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA71t-0000000DbSh-1oE9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:36:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx5WTLU8uWVakv/H75wNr+0MEQJKUd/oZr+MnP7rfHklONZIGMqW0Tepgk9G5xxshBsFO2hBnDaFgByJZTt+gkwdTvbBR54/fCQYw2EycSkgh0x18RP+I7/q1rt66408V9FK5/aIxpMdMvFgU7baEO+KYFXeuPIhMkcIeAXLmm+SrTfOFisu+5KWpIg1qeW7OsW1Muw4AyePTqQVQUtmXPHDZ4Ov/Px5y16C3WMBhY4KFLsw3MYAOd0yQBj3lq89+IIE1A6PmLDaeY6knUhEUZhO3Rjs9wuLxF1rTDdBnr4K4a4mOOro1Riv2ZsUqdN658diXEySKGwZUTq/4la5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYEzPh2HCvulMM7n8NLZihzPYqqg9U+hllx69esfCrk=;
 b=aOe7FjrO9Z466nMsK7h8x7Aj+Zg8Ms1XlDicFkir5RP9mtmMc9gifnD5Ilk0E2ScbGCGaaoADQ0WHK0Wb8mjUzkZgKlQduSqGvNEziz0o1xK6ETDxQkuwhLUFyg2n0GqFKdQYh/nOE8LCZ3Zy3lB+Uo/N/02TdwRfmbZHrLbXtITrg/yX/o+1N6h0fcCi3uuw8V10eEDSac9/EFpS3DX8p9KmR+WTBPorGEAg7BS1b2JsBQ4xj/rShyA+Lfa5oPq23wHJVnULkKBJAWrMHXDx4DZ/5pDcodcx/vFV9jZdkNlwMl0/q1R8Zf7Z959+qFUmbGke2TxmNT1gknOb76fRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYEzPh2HCvulMM7n8NLZihzPYqqg9U+hllx69esfCrk=;
 b=hYRy8DMHOLchSurFtNp6AgcxIxyP7UDiDXuLbBIjgmAr9p4VJ+EvCQPNn7Sy+jn2EFhDJcv/QkqxZtgioXFJxhXyzESrmH0ysV+9mK+C48s/Gk78UZaAamNJmoHOu5r6K3o6G/KKMpTnyBKRHfOyMRIsioJRniFepbokOC9URxcynuEfZnlpAXVGOpk8D5fr+Isy11p2IQ3yfaHKPicWeQnjLDp8f9j2mNkpI8CnRgGCh4ZHOTu7cHDhIDSL3E/PWvA078pLSwEjoL+0yLwx7/+R7H9cWxidMu5lALjofGi+wFrM6AA4u6+JJG2HCoDQvrn6rzX0NGr1ubnKqQtrUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by BR2PR04MB800621.eurprd04.prod.outlook.com
 (2603:10a6:2c8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:35:56 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:35:56 +0000
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
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Hannes Reinicke <hare@suse.de>
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
Subject: [PATCH v6 06/12] scsi: ufs: dwc: Export common clock divider and link status helpers
Date: Fri, 25 Sep 2026 16:35:28 +0200
Message-ID: <20260925143534.3298540-7-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925143534.3298540-1-larisa.grigore@oss.nxp.com>
References: <20260925143534.3298540-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|BR2PR04MB800621:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a60ce5-e1c1-4579-7be3-08df1b124f46
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: Gcd1lXO74Of7Fj62DHk5mtC0ommtOmZ6EJILHR165wKN0cjWGCUqhNpL7SqK3avaQplhdtXJvr7GO5Luin3clrbGOcs5XQFFbIXZA6BOEz42YHZCTl9J2xkmxO3cdeA0jC7M6ypfWb3+06SbXBvR662dWcknK+SOrtYuI2jVtfRQwE2eItpxsYgfSF/q6zbTn0yXRB0VpBmBEmLmO4+QUlL8L4bisMtjlmiuFRe34wK5SgLmomn3TORva9W0/sXXBIFb6ebpQoRFwza08Crl7W8UFTomuHNTkD4JsHS4ozlo3M5Qf1MbvSVSVA28/Y06Hw4jlGPm0YjfapJlaH91+IWzaRdh1JOzQQUsnqi+Ekz+b/wpHBMAaZbnB9ezr0xOYDOL3jbdUyydumvdcjyvnqQT7mB10RthJKr4e66Df4GrN4MOYx3tMEP2+FMqCPZTqCeme49Zz2XVHxpWQo+YnHE6f7Qv8Ea+RkuymsDTcbW2zLWA6uADbVLCrLcHBIcEk2lAypA2ZqWWsxbmz6BPHT5CumliyICSWCwHRw4Hynyd4ubQydKUO8KgKsA7cA+BkaL9Y2at99+D6scoQPyOHyY/yh+15JO1snLQ7+78fa/AtPHGtPZks72T51sle69vFXuBKo+yhfUxGncsn2WolyPnGGP+UsVRt+6JQYfAaIfuJJM7zhxv/FU9aiiZj+uDfpcjdjQTyn0REbchFwmIjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEF3N3l0aTRtbFpyZUtGZXhHYmJKVkRKZDY5RlRnYTZTTmFHN3YyeU9iVmRX?=
 =?utf-8?B?eVZWSjVDUjc1SFZGelV0aHZUeC83aUJMKy9JZ2plTy9qYVdZR3hPV0ZIV2xl?=
 =?utf-8?B?NnNzT1FLVlM5UVhFUGpwbWxFN3dYdUlnMy9MQjFlZWdldGdwZ2hyZkpxMk9M?=
 =?utf-8?B?enZYaTRVN1V3YytoZDFqRjVpaG00aXRXQWlXTzcrdGFWVjl5Q1VRZ2hpR1Bm?=
 =?utf-8?B?TldVZW1sYW9XbmFVRU5FekZqai9ONHU2NXFiNWJiVjVlRVNoSVhFZFF4NnA1?=
 =?utf-8?B?dVpXUy9qVDR1aTFWOFhPbjhpQk5aS3dzQ0xSeDhwdDc4T2dGUHNISmlCdlhh?=
 =?utf-8?B?VWdLVjZOd1o5RTFTY0tYS29id3NvV0FOeWY2MDlOc1htOXJZTU9UYjM0eGJq?=
 =?utf-8?B?ZFhiMVNJdzVLYWJuR0R3cnB5cWlEOFVSZmNhelpWelFDZzFBNXRteXpmUTdQ?=
 =?utf-8?B?QlNpaS9RVWVlaHEyMm5FREFaVzltRGFpMEZRS2lDeHFyTHh4TC9POVJnbWJo?=
 =?utf-8?B?dEtDMnhpcWRQbzhINGVJYWFyTkc5bjc4Y1dRZlRUVFg5UnU3Qkk3NCszYWh4?=
 =?utf-8?B?VHBwOUV2bGlpMjNVR3B2NUoycEUwZ0JJN1dVMytnWFFGS2tBV0FubmRaRnNm?=
 =?utf-8?B?cnRVM2xCNUd6SFB3U2V6MWpJQng3Y1h3clh4cU51ME1OZGtRU0V4c29hWmVK?=
 =?utf-8?B?M3lwN0hjU0NMeE01R3J3MERrZlpHc1lFRERLTXlkSmx5eU8veXRhczdIUjVq?=
 =?utf-8?B?MXJmOE9aT0wwVlFtdFFmckYvTzc3Z0NKMTRzWnduMkVaNTBrVEt6aXBKOUVJ?=
 =?utf-8?B?SUtwbG1SQ2NpbFBMWXo2a0VYMU9FNWVMa0RnbUx6WERKR0JHSTJjb0V6V3FZ?=
 =?utf-8?B?cjQ5ajJjbEpsZmxENXZTakRQNVZmc3FYV1QyL2pod2V3OGJuYVBLaFVIek5v?=
 =?utf-8?B?NFRwZE9kZkt0bktZNnM1UW5FK2ZYa1A3RFMxTzZ1OGQzdjA3MStDUm9XbHNv?=
 =?utf-8?B?TkIzMERKa0NVL1REZzMwY2pkTFZoUUdoVHUzaEUxdkNNRHFZbitvM0hnZlRG?=
 =?utf-8?B?eDlWR3BQaGNDdHJCUmNPckdKcU5Gd2R4bko0YW00NjNOc3FjUHJnNHFUZDJq?=
 =?utf-8?B?WG9IMkMwQTJUaTUrQXBMTjVGWVpTSkZwYUZDTEQ2S1hxY2ZOTVZoV2E4UmxB?=
 =?utf-8?B?aTkrTjh1QkRvb1dkU3Y1elZ5dzRHL3A5THBHbWVVcnhKemdUai9oSXhwY3I2?=
 =?utf-8?B?dTVTQmdPcTBieFN3djhIZGQ4WS9jV0VYMW1ZUzRHWnRNYjdKWEVGZ1AxMCtC?=
 =?utf-8?B?dktWWXZaTnU5cW9pOWQ3aUprYW5sQ2ZnRHBTL2FRS3ZUUEtza2E2UUJUZi84?=
 =?utf-8?B?WlhLb0lnaDl6S3JYYzYvQTVYTTRQZmZoYXp3T3ZwcUhhUC9YMlFweGRYS3Fw?=
 =?utf-8?B?MlNsVlNldWVyaU41T2srYjdRK0czSjI0azI0OTFFUEJPb0pqOVRZajBOMlVI?=
 =?utf-8?B?K0YyRjZtcUF1aFdFSHNaZXd6U0E0d1pkQS9MbkN1REdldGxKSlNDM25ENExv?=
 =?utf-8?B?RGNyQnBGdDJtZG9xbDFYdVcrVyttYWxVSmhhY2hZSXBmY3NZeEFDTmh2M21w?=
 =?utf-8?B?SHRLejZWU1ZIUFZGcHI1NkhXbC9mc1NvbTU2Z0M5aFlRaVJ3NVJJWnhraE93?=
 =?utf-8?B?ZlRBdkpDQ1Q1VnprN3FmV3RoT1NVQWFHeVFsdVFQTHArTDdRWWk3MXlxNFA4?=
 =?utf-8?B?emJERnFrbHRjemRQeGc5bkJBRU9XazF6T3V3MURXODlTWEhKVWc2UEdReXox?=
 =?utf-8?B?QXNIU1ZOV21MbnNBRGFldEJSVHBZa0JrelBNOGVXejRVT2EzendiRXR6NFlJ?=
 =?utf-8?B?V1F4Tjl4czAwc3grandlY3RiWUdUeTBzcjhsZ28za1ltb0RBK1BBT1hzM0RT?=
 =?utf-8?B?azcwbWpJR0tEK1J5d3BSaW4vS3NtYldvdm9XZEJkRm1ZSDlMV1ROMVByRjR0?=
 =?utf-8?B?c0x0ekYvS3U3WklxQmNHRGF0NEd0R091SHNTU3Y5ZStlUkE2Uk1HVkJ0c1k5?=
 =?utf-8?B?Z1FuR3FPMytRelNXV1NjRjVYamRlYkFHeFZqRWhxM3ozS1hkdUpuaW9LYkdF?=
 =?utf-8?B?YnFxNjdxeUI0ODM5c2xEVmFmZHhUYmdpZllJbWd5UFBmWmtOck1NTEhxOEFV?=
 =?utf-8?B?V1d1NnRBZzlObmtSRjlTbk1aTW1SMlJjTmJuakpqaEJMMjlEbWNNNE1SM3k0?=
 =?utf-8?B?SVZWQjJBSEQ5cEJzS1diTy85Y3RNV3Y5MHZtNXhpMEJpTUJra1dzbnV2R3g0?=
 =?utf-8?B?dGFiRmhnQnJnaTRBNERGcFB2eWhBYkttazZ3R0xrR0ZJSi8zbTMyQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a60ce5-e1c1-4579-7be3-08df1b124f46
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:35:56.4013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUSSepvtN3BzNDchx0T8RmEKUULN6yfIKqOUXkheEjplmHIBn8oYiI6ZZCu3tAPHmjTpE49h21Uw5cjurbH26g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB800621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_073601_479075_0502DA46 
X-CRM114-Status: GOOD (  11.52  )
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

Make ufshcd_dwc_program_clk_div() and ufshcd_dwc_link_is_up() available to
DWC-based platform glue drivers. These helpers are needed by platform
drivers that must program the controller HCLK divider and verify link state
during their vendor-specific initialization flows.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.c | 6 ++++--
 drivers/ufs/host/ufshcd-dwc.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 20b7174e9498..037b99d1148c 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -39,10 +39,11 @@ EXPORT_SYMBOL(ufshcd_dwc_dme_set_attrs);
  * @divider_val: clock divider value to be programmed
  *
  */
-static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
+void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
 {
 	ufshcd_writel(hba, divider_val, DWC_UFS_REG_HCLKDIV);
 }
+EXPORT_SYMBOL(ufshcd_dwc_program_clk_div);
 
 /**
  * ufshcd_dwc_link_is_up() - check if link is up.
@@ -50,7 +51,7 @@ static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
  *
  * Return: 0 on success, a negative errno value on failure.
  */
-static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
+int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 {
 	u32 dme_result = 0;
 	int ret;
@@ -66,6 +67,7 @@ static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 
 	return -ENOLINK;
 }
+EXPORT_SYMBOL(ufshcd_dwc_link_is_up);
 
 /**
  * ufshcd_dwc_connection_setup() - configure unipro attributes.
diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index d8673cd54d4c..53b523ef59df 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -47,4 +47,6 @@ int ufshcd_dwc_dme_set_attrs(struct ufs_hba *hba,
 				const struct ufshcd_dme_attr_val *v, int n);
 int ufshcd_dwc_phy_reg_write(struct ufs_hba *hba, u32 addr, u32 val);
 int ufshcd_dwc_phy_reg_read(struct ufs_hba *hba, u32 addr, u32 *val);
+int ufshcd_dwc_link_is_up(struct ufs_hba *hba);
+void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val);
 #endif /* End of Header */
-- 
2.43.0


