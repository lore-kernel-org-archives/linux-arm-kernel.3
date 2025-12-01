Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA48DD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di4oVPEMq+ZqZZ8Ol505NgTB8/NfxBJfO8wIFS+gUeE=; b=vtYgT8HE74CsMeOijtLMc/eeHW
	EVr/Y8HQLwdjQo/hBgriMkubvvuAgAyz7O70hGYqTM84WkwRVAuRHGToOuS/rz5eaVDzpPh587wgs
	f8Yh5xYwgiDfJ7QZG4Z7RohuyfOpUPevJawbAM7/l5PgSFZUBlVnHBIwEjAGESvzGB0q8bOYaOIk1
	UtkRI29u/2mCtPFpg4CidKU20s13up/EixFMGVVyLUx1LPFo216Dm2IRUvKav0PevNmYj0o39S0qi
	40CTw2ttWwm3jd93HFbRp4G+VEaXk56tec330mDZWGeNQpqQFFKen/QB1uC7gxGzUKIZeb0RbrXr7
	vyKoDgrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ624-00000004Cfh-0ibA;
	Mon, 01 Dec 2025 15:41:44 +0000
Received: from mail-westeuropeazon11013000.outbound.protection.outlook.com ([52.101.72.0] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ621-00000004Cf6-3yl0;
	Mon, 01 Dec 2025 15:41:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AflHoYDP5OsLe7kwTw1STN12qLtcfPCYwMzk4fcQwSNWz3YZEf+ij6P2tSfU0AUxywCROa8Kg73uWcASJB0I0flSJ7tccHax8GhG/+yL8mYel3IltcVoGWEVKJIyQ8jgZq0g3Xdipnp9TAKsvzjml7yGh9EcSDdm0goJfYuVr/e1sUFBcTq6UlCqFl2mcrqgBYX0znIcy0m5r8sefBZRp128s0BnANL4CSEyMReoiCow4zEqOz9XC6rKjW8GXexu1Z7VtqHkih2n8hy5tSojLDKH3pe84GP+i84UkvTmVhWfGAasRh+eYMVG9lfxAPXzwGoucv341wcCJmfWPkBGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di4oVPEMq+ZqZZ8Ol505NgTB8/NfxBJfO8wIFS+gUeE=;
 b=udLAFRvwr8Rq1N1bngtgOUOLe0U7o1ZR17Rb8F/KWQIzozTNrySTyH89hbS4tNTNQ3dYrfYvIn0NYc4X4Wr81SqhZY79CuEciTaN1u9bKDswUNHcu4fvOtAh8M0JGLcjb4qZ3HIZ2l0tLPPfjMhSvBd1IfxnWyrm5rCv+14gsK+0IRxFogwUXusRJT1lGgYIH+M/TKXdtasxvpETtNzgr2T1ozHE2eqcrmzze6i3by4GzuwDSZ7h81pmHfdnZ2KfiCC3JApSLItmTHATWRVSXztx9bYCiVg21tywV+Je6IN7g8N49G7Ey6iAfdvP05MkmpZXzH9nCjvTvK33a//csw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di4oVPEMq+ZqZZ8Ol505NgTB8/NfxBJfO8wIFS+gUeE=;
 b=nYeGxFArdzvy2LLPftassKAf6eGU79Vh9zqhojdgQjHC89/T004+boac1ViqFKDjE/V+WJzJf9SrgzzPXqU65i6bx9IJL5PMb5Y74bglBiLXO5jT7TqAoumLLf09e2YJ9V/eyO98Ed0S/vwSBAlF96RMuVvvAlMAzd4sxpekDTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11056.eurprd04.prod.outlook.com (2603:10a6:10:58c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:41:35 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:41:35 +0000
Message-ID: <efb64744-c140-4421-b72e-6ead771548c9@cherry.de>
Date: Mon, 1 Dec 2025 16:41:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: rockchip: Use phandle for i2c_lvds_blc
 on rk3368-lion haikou
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-7-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251021074254.87065-7-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11056:EE_
X-MS-Office365-Filtering-Correlation-Id: 16275465-870a-4e72-5d5d-08de30f01bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ellMQWFZU2xOUXEvQjhxL1BqaHZiWU5qMXByNjQ1bklZNHpBZE4ySG9mZFRs?=
 =?utf-8?B?SWxGMFlCamhDOGxBdUNBbDZmNk5CRFBjcytWRHZwTXBZK2JjNU8waXJkWUxl?=
 =?utf-8?B?VFFKU0Y3TzAwYkhVb2xZSU91Y0k4UU5BeHUxZlYwOFUzTmlsdlpFc1ZHbEd0?=
 =?utf-8?B?STJqalp5ODVTelhtQlFKY0pJQml5OUJZd2l2aXNCNkc4MENta0p5REhLR05r?=
 =?utf-8?B?SmdRenRJOWM3SGlPaVE0UXVQdE14WmVUaTJsTk5pZWQybTRXWUlGRW1WbmNk?=
 =?utf-8?B?WFU5QWRPSFQwK0kybDFEQ1FWUVBsUjZ3dmhkcWRXRTBlU3I4eHBwbTZPNUkx?=
 =?utf-8?B?czlUSnJuVEhhWjlQRFJKUmVMcnl2MXR0UzA4ZGhSSjErZVppVTFjUC9RcTN1?=
 =?utf-8?B?MWhrRHkwQWxwbGlTUmxaNCtpanEzd00vV1prcEZUd3IwelBmMzU5Si83LzBG?=
 =?utf-8?B?dWFyYTErUWZyN1U1WC9lUjEwdzJlNHNFQjN3bkhhUW53ZHVEb3Q1RXU5aXdw?=
 =?utf-8?B?VmZpaEQ3WmU1a2xtOWw5cFVZaWtTN0dkR2V2dk9TS0lONXQyblgvbjhDMDRh?=
 =?utf-8?B?Y3pWVEFKbjRyVGxtNEhEY01URVRqempkN3VJV3JnZFh0NDNmelpuUm9PY1Mz?=
 =?utf-8?B?RWVYdUZDbEx5akcyZ3RrY2Z5UWRHQVE0YXBsWElkbThTaHgxcTZlL3Byb2Fk?=
 =?utf-8?B?NlNieWNFMnl4WFpRSm1WY1JoYUFrcTloMFZ4NlloeENzWUpSRWhzdXZTOFlO?=
 =?utf-8?B?bkE5ekFSOWdaOGFhMmVScnROWUNFZ0Q4bnNZbkM4QjFRSElnYXdEWXcrejBx?=
 =?utf-8?B?dGZOWkJpV0NIZXRSOVRrNzJLM0pmVmo4bnVsN0ZXR0Z2L3orUW9qYkZ1UHF5?=
 =?utf-8?B?cFNWNlhSN0V3TjJ2elN2MXlaeWxvQnI0cjZzUmZoTEtsUGJQeE5PamJmZ1BJ?=
 =?utf-8?B?ajJZM0JOdWRJWXFkS3BHV3VGdFBNN25ENlhIQmp0N09yZ0VHL29VMm8xWU9k?=
 =?utf-8?B?d1Z5ZlRrMzRyc2QzeHhaM0hNendEd2hvVGFmQ01WV2orUGs5QWVmT0F1TUly?=
 =?utf-8?B?WC95aU1FbmEwYm55Z2IwdG1URE1aSW5xTjg0MkpLUXFhUWJ1eTlsVkpQWS9I?=
 =?utf-8?B?a083dkUra0JFZkR3V1oxN0pkWmJscFBpQVE2bWlicklnMXNjMnI4WUdZQS8x?=
 =?utf-8?B?a3d4VzRQaWRTRElvSElMN2pUV3JCWFNYQW1RSG5BTWlBVmRSTHVNUDlkeGRv?=
 =?utf-8?B?V25Td0cyN2t2K29aV1J6Rk5VZHFYZmg2NCsrbCsyTjBpQ3R0RVpwWHgrSXdW?=
 =?utf-8?B?Tmd4SGJQSG05enVuUDJidHhnUGZMemtLekFBK1J1RFZHUkZDbzVudm0xUW40?=
 =?utf-8?B?YktLYU1LMVM3RmhIbS8wZkF4Tjh5Tm5iK3BBOGNXS1dxcUFTazVJVXRBc0U4?=
 =?utf-8?B?YzdDOFV4RytCOVdQNW9vZjhlbi9xMC9DM2xRRDBqUVlEeEMwYVdDa2FMM2Zl?=
 =?utf-8?B?TDZZQktIbGl1dFdhZ3hOWHFTZngxYU5YRDFoTWxQUHNaM3hCRXRtTnZMNkJr?=
 =?utf-8?B?UkkzcXJ0ZXFWU0NScFVNT3U0cnJFTE44Zk44QTV5Qy9kRE1WWk1NYXM0RmRT?=
 =?utf-8?B?L2k0QTBCYWRwaDU2MVBaVUF2V1dmK2tvSkVWY2lhSVZ3OExMdkxtdS9FeExO?=
 =?utf-8?B?TEcreS9kRk1iYjQyKzlaQ2RSTTlJMjljMmdDdDJIUGZBTVVxZkFrOUtVcnVI?=
 =?utf-8?Q?1DqVUGZDL6hbEb2TBNXao9KXD/kSjqiD2HJLRKH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHVwd0NrYmFBTzJoaS9IOTRRWWVyZ1p6VTV3MFJrNGFTZ0FnRTVnYzdjTU8v?=
 =?utf-8?B?clVBRk9LcEpGcmhMUUJLc0MvQ2w4Ylc4Ui9ndXJ6MUJydEJEZHEwMWFzdkdL?=
 =?utf-8?B?a1pwV0ZZYzM1MlJZSytpdE95Z2xROFpKN0hWSU0yckR1Sml5c1hZRFpGZzJw?=
 =?utf-8?B?UkFGRDlkSk9Cdzlid2xEa0kzcUFyd2lkSEJsU0xYWG5jaHR0aE1Bb0w1OEdF?=
 =?utf-8?B?UHMyc2dmWTdNck5WWENPNCtHWVh4VFIrTVVFU3Rhcjkycm5kR0ozenVDUnN0?=
 =?utf-8?B?V2o0SDVuenlsR3Rham9HWEFKQ2NBVUNiNzBWWUF3MlNFRVAvVDRZT09xTXRh?=
 =?utf-8?B?U0VSd1phMllxUVdyQ1JpR2t2UFN4REVGcktHN0NnQnMwSGQveWVYeEVLUkdZ?=
 =?utf-8?B?dEtoQkY1K0l0YWNud200R2pxZ2pzUzVEeWJwR3dpRFFZZzdCczBkWG0yTUQ4?=
 =?utf-8?B?d3lINk1UNStLaFdaOXhkVGZXaHpibnZCTGloZWxYaGlST3V5dkhhZFBBZU1i?=
 =?utf-8?B?enliciswTEc5RjF6VW5tVkFveSt5N0lFeGE1V3dad0FXMmxtVDVnUFdmdk1M?=
 =?utf-8?B?U3kvNkc1QktzME1LOXFxQWdDRWdEM2IrK0JTeUorcXluY21XNmgyRkNpdXBT?=
 =?utf-8?B?Wm5TemNoNTJCTVJsSG1BWnVqQW1HQTFaY1JBb3VkRkJUV1Vobmk2UStTWVpa?=
 =?utf-8?B?d3JrQjVEOEw5ZHJ5TmI3K25xS2hFR3ZTYis0bG9GY1dOL2o4VlM4NW0wQzZx?=
 =?utf-8?B?aVRYQUpOcVZJbWN2ZlRKQzgxUHFQRTB6RjV3blFFdy9oaFplTGY3SkVEOGZU?=
 =?utf-8?B?TFk4T3pFUGphOWZ3QzZ3ZFlac01aTXp2V2ovSlJlSU9iakliaFZYQ0RpMnps?=
 =?utf-8?B?UkIvejFqMmdYOE1CWVhnc2taY0dyYjB5UmJWTm8zR0w2eUpWekJtRDFKZGFh?=
 =?utf-8?B?NlhETWR3aisrS3MyMXVPbCs4WjJyWXd4Zk5UWGNzL0hUYnZrMWxGbWJxZUVi?=
 =?utf-8?B?QlRHcmNSYUUwRmphWTFBR2xRM1U5cFlCYllpb3E3cllDK1ZCLzRCL1NBbXBy?=
 =?utf-8?B?U0QxUndDakUzWGgyY0JkeER5SEg1Z05TUFVhQ2FVQUpNam5ldXlKUFZYdnNY?=
 =?utf-8?B?SkF1eUNUWTgrS1EzekNOMlg3a2FncmNrZDBEQkRrVHJFYy9SYzRpdmRhQ2xy?=
 =?utf-8?B?MVpwZHF0Y2IvR0JDYzdYMHBVREUyU2dkaWs0anl1cDUzS0pRYXl0L3p0VXB3?=
 =?utf-8?B?ZjREdVh1S0VqR0I3VTl0RDZFSVJlajViT1k3Y3hKUzVJMU1ScjhXUnhxWk1y?=
 =?utf-8?B?QzBvSFovNDZLY1VFb1EwVXpyVE1pZ3hKdisxcUl2cnlKNWNUb0xQMkN0ZUtR?=
 =?utf-8?B?RE03UEFRTGYyZG5XQ2o3NjJxVkd0Tm5qM1VNNWZIL3ZSMlE3Y0J6R1VSTldG?=
 =?utf-8?B?UEF2cEc2YUZKd1I5ZzdoT0oxU1ZsOTdIclFLekxrcENORHFyZ2NFQ0VISXNs?=
 =?utf-8?B?N3RnS0lYWVk0OWpQalF5MXZZaVg4MHZCQzQvai9QNE4wNlRIT210TUZsam9r?=
 =?utf-8?B?UHpyeGcxdjMrYmVqWWRZWExDbWUxbVdkUjAwckI3Q21rTFJyT2xFeVVjVlZx?=
 =?utf-8?B?VTNqMmJGN1hJMzJNYVUvVmZidHFveUh3ZGdDWE1ESWhMbzF3RVlENm0wYXF1?=
 =?utf-8?B?MnE4eUtaeWlWOUo0NkgxZmVlTjFDV0hnYytMVUJNT2p2UFBjNzdDZkxLZFVS?=
 =?utf-8?B?ZUdFeWdiVXR4Yk1vUkFQZ0pnMUhNaXdDVjA1TkR0S0p2UnI3N1pnTjF1c1Z6?=
 =?utf-8?B?Q3J1QXA0eGlQUkhnNzFkRDBWcU54SXlWTXR5V0hzUFpjd3NRTGJkRnN2RmVY?=
 =?utf-8?B?VWFQQVdmL1ppd1ZqTUJKeXRGMzJsZVBGYkJ2SGVWSlJnNHVaYkNHbVROY0Nm?=
 =?utf-8?B?NkRadkpSdWxtTjVRZnNtSnNBcTBydzRZMXRMZnIrSTUzTFY1WmhIL2tidjF4?=
 =?utf-8?B?RnEzZ0NEL3F4clNTdWZQR1Q1SVk3dXB4aDJaZFQ4R2dkWFNDc3ZlTDlDT0VX?=
 =?utf-8?B?WnYxbEg3dHlSUzlmWlNIR2NZSHRSRXNXM3lMRDU0Q0lhalBnNGQ0blk2akJS?=
 =?utf-8?B?enFSVUlBYzQ3WkxpN25VeERsUmtMZC9hNGxMM3lrOXdvL2tmM0FEQlVFSGk4?=
 =?utf-8?Q?GdH4qEhbyoRxfpsNpXElSKg=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 16275465-870a-4e72-5d5d-08de30f01bba
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:41:35.1361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bhov7t+0cUE8VJYTQju9BlQZKUG2X1CreRGadQ3XMQSMGiUDvs/ub3almKWq11PsUob7X0+t4LNp1Rv25fptQnw161PGnW6XnuCvUyxRIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_074142_014348_D439B1F4 
X-CRM114-Status: UNSURE (   8.67  )
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

Hi Heiko,

On 10/21/25 9:42 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> i2c@0 on i2cmux2 does already have a phandle i2c_lvds_blc defined.
> 
> Use this one instead of replicating the hierarchy again, as this might
> result in strange errors if the lion dtsi is changed at some point
> in the future.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

