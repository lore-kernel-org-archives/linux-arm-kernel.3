Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C92BD46634
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 23:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QKVWbH+ORs7/x/ktvFD+TYvUmzfRLuZF3q1hI9sogCQ=; b=clNva84BNn1gWgUoQ6mHGg07TV
	7nHTaVbelYX6VeXu6wQ9qBiY0dHyIOKnqWelRFsC3M9L6MGu6nhmksipdcwE79bMYVrwYJ/Y4xRY/
	XOUAWJtMiPPeuzHL5nU2JFIBy2eoYDRY6PgONlQVAynNlAhpAiyXyBptzFxauUDJyxs8dMJOhuz6r
	pIR1lrypU6oZf2l2Vd+AoDEP7JNUDY7lpPPoHotyA2fOJfhzzW26zPa4u8au+G6qba1Rkn1q+A9jZ
	aa88yKSKtrU/ofSp9gdtoMVvUXhxdOgM0lB2VdzHN9Sottr8s8oJAuO8REzZbWmCsP4o9KzhnZ2GH
	Rub9VqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWRU-0000000DIfV-3voM;
	Thu, 15 Jan 2026 23:07:52 +0000
Received: from mail-southcentralusazon11022072.outbound.protection.outlook.com ([40.93.195.72] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWRR-0000000DIep-21Il
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 23:07:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+FeTcfkG1UDD7wNlsrH9CZHAnhaIBK5Ip27MEz1QJ0xT4Sg5EOk/dAv3ruLbk4tvPrrV5KdcrsaxcV1kuC9C0i+qNbhrLGM5XzFP4naTVhLcK7lnoeET79xItye+REWplEuQMC8/O1zfSt5POauzbBQLBxaJsJQSjlSIys/lVtcqi36h2LwO2yFBZfJDcLOwhyqXltuxC9qaQXBOvP1W2VREfZhhCxamPZ9H0U921eL8XbUq9JM3d2vOsdFaR+NKmqB9KLGjmIdPU4SeSBSDFLL6HhMniJByK0KLG/85i5dOPXXHRjNJd7jdY+Z3lK1QSFmBysnnN9WR6ctgk2zDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKVWbH+ORs7/x/ktvFD+TYvUmzfRLuZF3q1hI9sogCQ=;
 b=LJeTkWalaRPYHhUKB2QszOpkhVCYR+YFach94j2TDUeWB8gdxEM6HhQJhQTizQSFk/ZufflDVch8SOX+3+v1JpD0MulKQz+POMq8SbxAnM2Uj1wcGoNv8x/AKHGB2lZ7ymEE0DZRgMfymh701ouA9ZyXnQ+t/5AwZy/htELk0fgb63vP/5gfHzKHD/mU8wci46jlBX+guECiOwaS90Y7hXJXom8ycNiHyI/d4ryCaVmrXWmwMzZq4eTacQ1OSLp7QYEfsDyDu2ugyYdoFsTRY8TX68L4n23WrggrHSaGcNJnMcWW/5frJukchopplOMnax0sokpVpPH+8q9TywgSRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKVWbH+ORs7/x/ktvFD+TYvUmzfRLuZF3q1hI9sogCQ=;
 b=n7BsYBtTu3wSrebJR5OQJWH3Hdw9/v4PD8e0qsbsBrRb+GhPCcCW8GRkYLXfVK9qhBOBzXeHyXeXdZ3hu7EVJFajzhJ9vpVBHTTs095pE7qFNdr4P2AvniweOzZo+PlBcZEdkKW5hC4on0PXCBb8mZYgC9ycTDObjZYV6d6Whxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BN0PR01MB6862.prod.exchangelabs.com (2603:10b6:408:161::11) by
 SA0PR01MB6252.prod.exchangelabs.com (2603:10b6:806:e4::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Thu, 15 Jan 2026 23:07:43 +0000
Received: from BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83]) by BN0PR01MB6862.prod.exchangelabs.com
 ([fe80::8a1e:34a8:2ad9:7f83%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 23:07:43 +0000
From: Carl Worth <carl@os.amperecomputing.com>
Subject: [PATCH v2 0/2] arm64: mte: Improve performance by explicitly
 disabling unwanted tag checking
Date: Thu, 15 Jan 2026 15:07:16 -0800
Message-Id: <20251030-mte-tighten-tco-v2-0-e259dda9d5b3@os.amperecomputing.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRzaWkC/3WNwQ6DIBAFf6Xh3DVAo5We+h+NB8BVNlEwgKaN8
 d9Lvff25iWT2VnCSJjY47KziBslCr6AvF6YddqPCNQXZpLLWvAbhzkjZBpdRg/ZBmgG1fSmMTX
 XghXL6IRgovbWFc+v01TOJeJA7zPz6go7SjnEz1ndxO/9H9gEcGhbqyTea6l69Qyp0vOCEW2Yl
 zWTH6uyWHccxxf64dvJ0AAAAA==
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Taehyun Noh <taehyun@utexas.edu>, Carl Worth <carl@os.amperecomputing.com>
X-Mailer: b4 0.12.0
X-ClientProxiedBy: MW4PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:303:8d::14) To BN0PR01MB6862.prod.exchangelabs.com
 (2603:10b6:408:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR01MB6862:EE_|SA0PR01MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: de661d35-48e9-4d77-6017-08de548ae372
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aktVaDlLRzdKZjdndldvL04vVnpneVBuSmhHZHFBUDR1c2VOcDJJSUk3cGZu?=
 =?utf-8?B?cW85NE5NVEptNmtySWZBSDZRaWwwTEh5N0M4L1FxbHZWaVR3UkZ1M2t5N2Ex?=
 =?utf-8?B?YkFPY0VkNTVPUXBZLzREbi9jMUgrSDlDQ2N6MTY0SENaYktZZXcwUU9iWi95?=
 =?utf-8?B?NHIvVTdjY1d6MjRrSEk0cTRGUnRKc2xneG5ybWk4VFhEMkhqQVhMQjIwQ212?=
 =?utf-8?B?REc2dHdFT2syRE5aamcyMUFlcDNsK2JVOXdpbTVWdkNZVlNZUVF6WUxZdXlE?=
 =?utf-8?B?SkZSTDlkK2x1eGVscXlVdWdrZ2VjOE5YRVV4cTFkKy82Szk0NlNuZjhwcFlV?=
 =?utf-8?B?VWhoYnQ2K1pRMXhkWHJZT2l6R04wRCtJN1YvN29aOEdtY3ZXdEhXbnJXK3Qx?=
 =?utf-8?B?aFRTd1lzUXBhQUlRYnZOVERiQVE0MjkyMFMvZFY1MUdyNXJXVk1pNDBlZWFk?=
 =?utf-8?B?MVc1cFVhTHhGaVNwZnNXL0hoLy9ka1BpZzRWdjE0UnB5QWRkV2NScTV1UDVi?=
 =?utf-8?B?R0pRWjFDc2RpZVZ2WW42VmdvNm9qQytoaXhKMDZFSTBVOGk2M0RQZGNEUTRD?=
 =?utf-8?B?a0d5dUNFZCtQY1B4QWsxTXM1eG03ZElkK2hnK2c3cytTKzNwQVVoaktWSWFP?=
 =?utf-8?B?NWFSUlVFVEl5ZG0zdGhGajc0bkxxbnZlWndOdjFldVc5NjgxeDRta0VMdFY1?=
 =?utf-8?B?NWRpYUJsOURXMEt6ejl2UEZPYUFadURLWExGaVRibHU4RFFRNEJIZkRCdHlB?=
 =?utf-8?B?M0I5UzF2aVRjKzVCZ2JyK3M1Ry9pdDJFYUtpWHlObHlOblpYc0VHUnUvMWFm?=
 =?utf-8?B?WXd0QytzM1RNNkNEVTE3U1NyS2czeHRGTEFtU0RsVzZkd2NNSlFNVXNCOEVj?=
 =?utf-8?B?YW04TEpjcmNmU0VmTmFMZ1ZkYU9wU1VXWUlxK0FRdnJydHBrbkJNd3ZmWG1L?=
 =?utf-8?B?blZFVmJ1TFR4VjE5azZPeEdOdSszWE55TUdEc0F0cWFLQzFTbnFaQ0tXaHI2?=
 =?utf-8?B?RG1JdlByRVVjMitKTS80YXhyZGIrZ3Q5SnBUUTNpZmtvVm9RZHBwdzVNcThK?=
 =?utf-8?B?R1BUYjVjdUt0M2swRm1velcvWWRKS0F2MUJwLzNmbGlWYldKMTlXV2RqSWlE?=
 =?utf-8?B?OW1HVFlVV3FQTDJYLzg3OFNvZjRoVVIwczViMnkxbjFxRWZGUzVCTDFLSDd3?=
 =?utf-8?B?dTJPUVBCdFVPazV0VUJkK1lRcTJoRkpDTEdtRVhRSTRCNllUNDB3OHo5dHBn?=
 =?utf-8?B?ZDZ1RS9rQ2RLWm9FdS83UXA4NlYxSnN3QVROQ2NpaTBSZzJXMW9SQzFNMXFo?=
 =?utf-8?B?Uk9hZ3M3RGZ2dnA4S3FWejNUUGhQWXhCM2tzN1NOQ2dBaE56SHMzTk1BM2tt?=
 =?utf-8?B?K3VYa0Evc21lZW41REUvRVNvdmc5dFZFZGtJN3hjSFpxVHBRV3QwTkp4YWxR?=
 =?utf-8?B?RHJKZmY2VER4c1loWTNXNnM1TGw0d3NUalpXek9pY0dadERkTFo4UEV4cU5K?=
 =?utf-8?B?TTFacHRFRXhuMGhmS0N2bWRpbmVSVldINmd1aVBnenJDL0JoSWc1Mno3cFNz?=
 =?utf-8?B?SHoyU095MVVCSG16RG4yYWdWbEJLZDhzcWJDTVArWlpjMmFDNXN2R3Nxd2Fj?=
 =?utf-8?B?VVVNa1h6aVMvazVlYWV6ZUtKbUNVQkl1WjZTekpWS2RmaG81dzRTK24rUEpT?=
 =?utf-8?B?SmFyY29wdlh0QXcwQk9LN0ppK1E0Y3VWNUlnZTFvc2YrKzJUbXF5WkFaOWF3?=
 =?utf-8?B?TWg3d1FGL3YzajNYOTdYaDdFQXpMSG1DSmJjWXN0cEkzMzhSWTMza2hBWWdO?=
 =?utf-8?B?eTR6ckMyZ2Z0ZHczMzE3VU5wTjBrRnlIOXBFcGNvZXpnUVNWdnZlZCtTWHE2?=
 =?utf-8?B?eGl0NkFDeDJkZ2R1a2VJcVR0T21QWU5KaS9tc3NNQ3UxSVNmTTZQdzZwZG5D?=
 =?utf-8?B?UjZ4QXFxNEQ0OTJIS1ZvZEY1cGREZGFOejJaNGVNOTRCcnpJbVIwSG12UzIw?=
 =?utf-8?B?eHVxU1gzYlE5ZDZoOUsrQ1NPaXVtRURLWTVNMmJXN0NvRW5NNWI0d1hEWEs4?=
 =?utf-8?B?UHBESmtoWEhMZ2dvTStYczFaMTdyeHZUc0I3NHdXY1VhVG92WHB2bzBxa1JF?=
 =?utf-8?B?aW9DQ1RjcTdhWFR1SWM3TWJtVzl0bE9TVmtQb2FVaWQvYmovaTZiZzVVSW01?=
 =?utf-8?Q?I8Rg54UmoVgQlztrkEfzebc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR01MB6862.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEFORStiYWVtWCtSTjJuWmRLZ2d1UkF1ZWFMSW9Ielp1REtOSlVFeFhCVHdX?=
 =?utf-8?B?YkkzR2xhS1hxVTNyZE5xTUdmVzRhSWZzNTllenV3dVBUbGpSMnhIOUZoU2V5?=
 =?utf-8?B?cnkwbnpWQUxrcFZPcnliemdLYkxWcHhMS0tHaWFReTZObnlhZmV5ZGJKTDFT?=
 =?utf-8?B?TU05djArcGxXWmlMZDd6U3RlWExMck9WQVdEWEVzRHF6dU9SS3FNQndiRjhS?=
 =?utf-8?B?aWZSMWY1c3k5MjE0QzB6NVFqOFlSZ2ZYb0I3OEZNWVA2Mmp3SkpMQlhtWHhF?=
 =?utf-8?B?M1ZFZjk5eXNCVjlTd2t5RkIvb0IyS0MxeDdmeGRaNWg1aUFyNXpnVHlKZDNk?=
 =?utf-8?B?a052TUhjbWVReUp3aHl0a040V1hic1RJN1FOTHR2OFJuMlUvVmxRVmZmbEM5?=
 =?utf-8?B?VG5BaWQyNTJPNmZvdDZ6TFA2ZWdTcHBPUGk1RWFkWisxeXZtbmEyYTcvL2RB?=
 =?utf-8?B?Wlkzamx0T0VtS3lwVmpidTc1Rm9kaUJpc2I1aWZCTG1LQ1dGY0Q2OHBKNFg2?=
 =?utf-8?B?RkNSU1lBU1Q5UkhlVjFTNUJTWCs1TFd3ZVpwT1RTZklkbURNL2xidkZmQy9i?=
 =?utf-8?B?V3gva0tKdXEvY3k3SUxEVk52WVJnZURZeTlOSlFwamlEN29zd0VjeElNQ29Q?=
 =?utf-8?B?VVI5YWpIQUdHSjNzcktnRWNRV2VSWmVVd08yaVFPVE9RaTFvREZJZ0N3UXk5?=
 =?utf-8?B?Qmhja1ZXRU5yTTgwZElUdFg4OWpjYzVWVTJic1lTYSs4YXNVUk5PdDhWZGls?=
 =?utf-8?B?S1ZOUkJvTVhnV09IbjEyUUdCcTN2R1VWdEVwV1hITlZtdlJpWFRPMWIvQWxy?=
 =?utf-8?B?TkFFUWs3UXZyZDl2bUgrdXJvZVd2OHJaVHl5VEk0TXdHVEk0SWVhdWY1aHha?=
 =?utf-8?B?WmVEZjBtNkk3dlZBcjZyT2hhK2pYc01tY3p3NFFDQkc1b3pvUllXbFBlWStj?=
 =?utf-8?B?eldHMEtBd3FseFVXZVJnLzQ5Zyt4N1JZMGdCTHNJL2NkRGVPKy9SYU50SlFl?=
 =?utf-8?B?ZldWZjVMY2lKWDlEeVlpS3J1NXBjUWFhSUh6SGUweDIrRWJBeStoUUtaVjFB?=
 =?utf-8?B?TzZDdjhKY01qNFJzYnRvYTdnazU2THlLQTR4WmJPckVTU254SlFoZUZyMG5k?=
 =?utf-8?B?NnVoSnl0MWUzYk9ZM3Axak5Vbm1ZZ09YSGF3UVNwcGswa0YwRGk3WXJDbU4y?=
 =?utf-8?B?WmxVblFvd1Z1RnJJUU9TT1RTNnI2MTBVTkNqU2x0cUIrcG5QajhXdUF3WU9m?=
 =?utf-8?B?WUtXSG9scUgyc3RhNWFTQzBSaVBGRDVlM1NGM2x2cVo5WWcxbE01K3ZXUi9I?=
 =?utf-8?B?bUZZYzJPUUdHYVBudDJCelpHMkFhL2t3MElvZXhvdXN5QjdJRDNvOXhDckxa?=
 =?utf-8?B?Ty80UEdJSHJCcmdpalV1Q1pQTFpPNW5sWTNjdEYweks2NlJZVkc0UG1Gc24y?=
 =?utf-8?B?Z3d6bEdjWS9Wa0JjMjBMSVkrOW9XV21WNkRRMlVwN2ZhNWxxOGxlMlU1Rldv?=
 =?utf-8?B?cENOOTBEWjVlcktKUjE5cFNDcXc4MVk3N1JzUklEUVEySGorRXhsZzV1MnV6?=
 =?utf-8?B?c05Lb2tmQkU0UUMzQk1JdC9NRWpVQnM3UmIvUVhoYjB2YTdXUWJqK29IVEZ4?=
 =?utf-8?B?U0hLb3BiWW5pTEM1RGpRbXN1NFM0T3JWMHB4Titib0ZVRDZ4MlBpZnJuZllU?=
 =?utf-8?B?Q3VialBwbzlhUS8xN21PNkNpeHFDYTFOMnJHVWV3bC9iWUxSMWZUNDBFdFpi?=
 =?utf-8?B?bzE0TXU4b2NDcVdvTUdMcTQxRUtXOElWWGlmQWNEUEV1K2RtWGkzTFN2USti?=
 =?utf-8?B?N3IzK3Y3aDQ0VmpRdkYrWmsyUnY5dWFZeEdiSGxlTTRuVUh6ZVpKMU1mZFla?=
 =?utf-8?B?UXpIVWZtTGp1cHZUaWlLdFZSRWZUWnRYbEFnTU9sL0RsMlREbVN5cms5UUs4?=
 =?utf-8?B?eElvNFlZWkc1U1NoRDFHNVJjUjNKa3N3K0RDdldya1ZRM1ZTZW9FcEliRXh3?=
 =?utf-8?B?aW5HTCtNTmZGTno5MVB2ZUZmdlpvTnF6YStjS2lUTW0xMkRiOXpRY2VKWFNq?=
 =?utf-8?B?R21qNTRmcmNHd1drOGJ1NjFhQ2FEWGVlZmxXMzVuc3ZCZE9nRDBldkMrQ3BC?=
 =?utf-8?B?WkZhWlFRcGJXUitpcFFmbm5MVlo1Qittd01URkExOU12Uk4zVFZiVjZWcXph?=
 =?utf-8?B?RXo4NGV2ai93d0tpaVNicVZpUFNoYzNmcUpiNENLRXl1WlRoQ25MYm10QVpo?=
 =?utf-8?B?ZEEyM0NhM1p0UEtvaE42Rjh6U0V3VjJBNG96SUlSdVNCdzQvRE5kZHpCN0Uy?=
 =?utf-8?B?aGNiZkZacUY0TytjUHBLUjlGaXlZWDNjOFZPMm5yWU5NYnNIMHl1VHZocGFO?=
 =?utf-8?Q?jx/X5vbJ9IrKI/8w=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de661d35-48e9-4d77-6017-08de548ae372
X-MS-Exchange-CrossTenant-AuthSource: BN0PR01MB6862.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 23:07:43.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gg+Ws5fGfRUk1Zi7TURcBQksH9JswvgZMoVQsgMjB9iUhdbRPzP4aNADn7YJxOneTHtB8bzp7SeF8DW+FBSNwcR+E8q8V+BVELgZbRkxWbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_150749_561081_A242AEE6 
X-CRM114-Status: GOOD (  13.38  )
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

[Thanks to Taehyun Noh from UT Austin for originally reporting this
bug. In this cover letter, "we" refers to a collaborative effort
between indiviuals at both Ampere Computing and UT Austin.]

We measured severe performance overhead (25-50%) when enabling
userspace MTE and running memcached on an AmpereOne machine, (detailed
benchmark results are provided below).

We identified excessive tag checking taking place in the kernel,
(though only userspace tag checking was requested), as the culprit for
the performance slowdown. The existing kernel implementation expects
that if tag check faults are not requested, then the implementation
will not perform tag checking. We found (empirically) that this is not
the case for at least some implementations, and verified that there's
no architectural requirement that tag checking be disabled when tag
check faults are not requested.

This patch series addresses the slowdown by using TCMA1 to explicitly
disable unwanted tag checking.

The effect of this patch series is most-readily seen by using perf to
count tag-checked accesses in both kernel and userspace, for example
while runnning "perf bench futex hash" with MTE enabled.

Prior to the patch series, we see:

 # GLIBC_TUNABLES=glibc.mem.tagging=3 perf stat -e mem_access_checked_rd:u,mem_access_checked_wr:u,mem_access_checked_rd:k,mem_access_checked_wr:k perf bench futex hash
...
 Performance counter stats for 'perf bench futex hash':
     4,246,651,954      mem_access_checked_rd:u
        29,375,167      mem_access_checked_wr:u
   246,588,717,771      mem_access_checked_rd:k
    78,805,316,911      mem_access_checked_wr:k

And after the patch series we see (for the same command):

 Performance counter stats for 'perf bench futex hash':
     4,337,091,554      mem_access_checked_rd:u
            23,487      mem_access_checked_wr:u
     4,342,774,550      mem_access_checked_rd:k
               788      mem_access_checked_wr:k

As can be seen above, with roughly equivalent counts of userspace
tag-checked accesses, over 98% of the kernel-space tag-checked
accesses are eliminated.

As to performance, the patch series should have no behavioral impact
if the kernel is not compiled with MTE support. And the series has not
been observed to have any impact when the kernel includes MTE support
but the workloads have MTE disabled in userspace.

For workloads with MTE enabled, we measured the series giving a 2%
improvement for "perf bench futex hash" at 95% confidence.

Also, we used the Phoronix Test Suite pts/memcached benchmark with a
get-heavy workload (1:10 Set:Get ratio) which is where the slowdown
appears most clearly. The slowdown worsens with increased core count,
levelling out above 32 cores. The numbers below are based on averages
from 50 runs each, with 96 cores on each run. For "MTE on",
GLIBC_TUNABLES was set to "glibc.mem.tagging=3". For "MTE off",
GLIBC_TUNABLES was unset.

The numbers below are normalized ops./sec. (higher is better),
normalized to the baseline case (unpatched kernel, MTE off).

Before the patch series (upstream v6.19-rc5+):

	MTE off: 1.000
	MTE  on: 0.742

	MTE overhead: 25.8% +/- 1.6%

After applying this patch series:

	MTE off: 0.991
	MTE  on: 0.990

	MTE overhead: No difference proven at 95.0% confidence

-Carl

---
Changes in v2:
- Fixed to correctly pass 'current' vs. 'next' in set_kernel_mte_policy,
  (thanks to Will Deacon)
- Changed approach to use TCMA1 rather than toggling PSTATE.TCO
  (thanks to Catalin Marinas)
- Link to v1: https://lore.kernel.org/r/20251030-mte-tighten-tco-v1-0-88c92e7529d9@os.amperecomputing.com
---
Carl Worth (1):
      arm64: mte: Set TCMA1 whenever MTE is present in the kernel

Taehyun Noh (1):
      arm64: mte: Clarify kernel MTE policy and manipulation of TCO

 arch/arm64/include/asm/mte.h     | 40 +++++++++++++++++++++++++++++++++-------
 arch/arm64/kernel/entry-common.c |  4 ++--
 arch/arm64/kernel/mte.c          |  2 +-
 arch/arm64/mm/proc.S             | 10 +++++-----
 4 files changed, 41 insertions(+), 15 deletions(-)
---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c


