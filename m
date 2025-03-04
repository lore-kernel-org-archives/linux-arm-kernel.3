Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45C3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdST2mWAb0UFHFUtZG5BrAT83pl4Qk9noVNXHU9QDvI=; b=nDqWJtM8Ju84wFgwhx05jS4lNB
	5rccvbJ6k2JzVx2LmGsvtDzq8k/js6mOo6T+FbOUmkks3o6Hv1v/SCwS7BI4/ejDnqpQNgQeSV9ND
	+8/hnZqXiz46kjXQazM7WDNccqht0mmA8aUZHjhj01LB/Wpj3HzxqY8zbgc2bTJrNe9EVHdCzpQ5+
	2dqT5D3lVPl6F7qzJpLYXmIo6PtQhWGDXwenxID8JJ59OQRr6YLv5O69DBgGM9+eLd+7cFOf2jAwN
	wHU6a4epfIP6SGRGsJiLmTy5OZIyNt/U4sUjCj4r6KxuEvE1eNfECSLYyo8TxCHmt9YzyEvhV/jCS
	73YUqGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpagF-00000006Oli-3hIz;
	Tue, 04 Mar 2025 22:24:03 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpadA-00000006OM9-0l66
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 22:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vI0qgrH5KiaPoIUA7VQG1YjmZVudbc743MY0hAA7dD0Mae5BhP1y8Pyzyx8ihg/FJbpmFUvNx3AK2npI/YtOpN4yHeWmhzr/6yyvuCIOl6ZN8S0hdJf+qmlo1ArOCF176qXc0qXXezZ8ENqj5Wo1Mj057/W5EtBYSeuCf4O5YSTi2wRaDXDYg86KHVakn39qY7/+QBUFwlDM0uCk3OzQ8joyB8bwM9TDOsTPC6tVI8kkQHiXZinGNUi5wMsXaSwWob8SjEzwDFwthYsfPDsnpCmK1G0mjc+zaK80FLwrZXMZBKMGejcsCB2sd+fnFBVW1IjhkfATcXIzjLUnVcqZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdST2mWAb0UFHFUtZG5BrAT83pl4Qk9noVNXHU9QDvI=;
 b=Uv8l4vyWcbZOqQ0wLsqlg9Fcy5Vp2lIV09WOhCX75L5Q1hAGCOq4Gqif9uI7WIHTAS5wpITAlFy7LaDc2S33U4k5ftmM6dHseZzOgJUuxLbF21GdQYi32I1m3XPqbPsc8TfUEnoCCY2bcDxGiiqv7Br/5cV2w/GOG3rspDrQ7W99iHqFFPqlCLZtLgH6COwkcZD6DgaWLg3ckg/gfRGl71vxkRWgEFuoQpxZPaPu6bZ+4U/E8mBOlws2BGMw7IYw66sjdQdrnRgb6yoTNQKKFxxjtHGB/9gsdSeDqn33HCR8FWuUj8omOE6TCdz1zYeVBEqMENjT16VNkqUjAYmX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdST2mWAb0UFHFUtZG5BrAT83pl4Qk9noVNXHU9QDvI=;
 b=qZExP4dK/lPGygJlgMBCcpLzDwP/6eU1WuVxF3GpCc9hhanD13zOkv57JOXv3ZcZJL/xEZF4f2WTJq9lP6x/KW0Vk9QIXpGGswe5tVdkzxGSps6M/g5PTJxbrbDsrtt/5xMPEqauIPMG8As23SQI2bWwgnRbJXuftlU9PNfZ3S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH7PR01MB7931.prod.exchangelabs.com (2603:10b6:510:275::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.26; Tue, 4 Mar 2025 22:20:46 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%2]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 22:20:46 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	Miko.Lenczewski@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [v3 PATCH 1/6] arm64: Add BBM Level 2 cpu feature
Date: Tue,  4 Mar 2025 14:19:26 -0800
Message-ID: <20250304222018.615808-2-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250304222018.615808-1-yang@os.amperecomputing.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH7PR01MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6305a3-9871-4444-8218-08dd5b6acf50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3VRaEcyR3FvSm5iTXRuVTNYVmhqYnhMVDZiZ0N2MHBKdVYrVFppR0JZak5J?=
 =?utf-8?B?Y2Irb1VXb2hCYUU2TmlDczR2bVhuS2YrNWZEWWhIcXBxOHdGcndOZElsQndC?=
 =?utf-8?B?MU01bk9FTFI0azZuL1FteHplaEFoN2hJeSthZ2U3UmJCaDVpWHpWaERiQzFO?=
 =?utf-8?B?Nm81RWFpOGtZR0R3QjNhUDZ2Yngwb2hXUHlSUitQeTJFM2UreWVJek8reUUr?=
 =?utf-8?B?K1lNVlpHQ1ZKd2ViRGdOdXNaRTdyekNlOEV4N2tOd2xrTVZYejRHN09SNjd2?=
 =?utf-8?B?Y1Z4cXUvcFV2aDBkTzVrK0t6S2RJUUZPdm1MSkF2UU5NdHlRWU1La3ZLdER6?=
 =?utf-8?B?Z2RJcVVHTFBSKzhvMVB1ZS83dVUxeHRPMDBaVjR4ZzVodmxTNjZ2ODJFQXdN?=
 =?utf-8?B?V2cxUWduQkN0aW1MTkNSQ1BvS3NJWDUxZXVCZ2hQdFc0ZCtFcm1yVHljYWNp?=
 =?utf-8?B?QXdlODVqZ2UzWlNCbUZuMW1taGVkdXJhQUpSaXpMbDVZVWlYKzJ2dkxFRDBD?=
 =?utf-8?B?WlBqUFQzZVB0OVQ0YmZuVTB4bnJlS1UwZzdzZGFVeVkzZ2VWeG1GcnpDcnVo?=
 =?utf-8?B?K3BkMlM3OFA2WWxQVjh5SThDeE1vMUJ1ejhEZDFRcytqeTcwTTN1M1NscHlD?=
 =?utf-8?B?eUNGSnNQWDFXQjAyYS90MUw4OFBPU1l5eDNzRHJHWCtnMUc2elNzM2d0MXU3?=
 =?utf-8?B?VzAzQ1RuWGRob0IrbW1tZ09iSk4zdXhBVlZNMmhzMXNJbklUM1VtU1M5dlFo?=
 =?utf-8?B?K3BKVllyS0VoRDQzUkhRSWZIVDJUSXVra21hYWp4QndvNmZPa3g5Q1BRSXcw?=
 =?utf-8?B?ZW1nMUwzM3ArVWNvTWl6MUVoQk5GcHZQMnZGUjF4dzlOOE1TVXluc0xCT0Rj?=
 =?utf-8?B?T2VGcFIyOVlIbjV2T2w2L0hzTDV0bG80cUxHd1FJL2RlRE1wc3p6aFZDUERE?=
 =?utf-8?B?R1RRbVVPY0MzbGtpVXpENStZdHRIZ3c0YUlPcVhHa3FLYUdaL2I1UnZpbGU2?=
 =?utf-8?B?OGtyNGU5VExCRnBGWmM4bEZLUHZsTWo3TnJWOGMzeXpTeHdrVk02R2FXSkFS?=
 =?utf-8?B?ZTVETzFPRnZ3YnNaVCtvZzM2VzNOLys1aFBPV2pEbW5yV2w3dHgzdWwwQkoz?=
 =?utf-8?B?QTNGZlc0bzZmMjJhMDBKcmxFVnhuL1hWOVRXNWZJTHBRcCtPMjRkM0ROOGsz?=
 =?utf-8?B?SlBvbXBVU0tEWVRCZFdnUkJid2tLR09nTjVXMjZXa2xYWEtXWkI1Uks1Ulhk?=
 =?utf-8?B?YnhDTko1YlNEZWZHOFljazhldm9UU1JQMXpsd21BRUVXY1NvclpMcGtkMU05?=
 =?utf-8?B?cWJySmRGMlpzVW1peDU2K2wvNWlRMmhKbmxyVFZGNEZkbStKZWd5VjNDcmxx?=
 =?utf-8?B?Y1AxZHcrbHFYT1RJeWZkZWlrTjY3QmVDRlJJRGkydDVXYldyd0RxTXEyLy9X?=
 =?utf-8?B?eStIVG5la0p3QzNpaWc5QnNxcnFxODNZeVo2bGYrTkZTQjdKRFhRTy80cTZK?=
 =?utf-8?B?VEExbHZJamZES0l2OG50UEJqTWo2TUdwQ3MvQnY5QTdSTWlrWWNXVjd5NDVC?=
 =?utf-8?B?dXlnNGtVeFRTcmthT3BvVElKU0JaN0JKVGZvWi91K0tCd0ZLdzF4L25Walk1?=
 =?utf-8?B?VGFBYUhyZzdFaDNMYVU0RUhRU1ZCNFRpUTdVWEVaNjRzdGc3Y2MzWlFsUzVD?=
 =?utf-8?B?ZE9udU05cGhjelBERTZBOExJTHUzM0lvT0c4YnBSWDU3a0R0cUZ3UlMwWmRT?=
 =?utf-8?B?bjNtd0VWU0VKN0wxY3krRzVIWVdZUUZmYWNKNTVoMFZ2L28yVDlTVW9LbzY1?=
 =?utf-8?B?ZjlyZURPYWxzcGJSRnVLbVJYWWJZalFBZzVUd1V1Zm9ZYysvdzY3L1A4ZEgw?=
 =?utf-8?B?aFFrL2NKZUVteE9EQjU0UVNVZ3lNbzJFQjJYSEFRd1RjYnpsbUVMMEY5QTha?=
 =?utf-8?Q?jA3FdjbOq9anIlSpXPG28NaCTQdGDh5j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVh3ME5JMklwRWpMWjBuekNxRVd0MnAvMjdrOGkrYTlZVmM3cnBjVnFUM3Yz?=
 =?utf-8?B?dDZXYnpMMjBqUGpqK0lYeVRoWmpSVElRREVqcy81QWZ2cXI4TkpnbTFyN1Iv?=
 =?utf-8?B?alJGZytSK24xbjNWeDkwdHZLMVVya3BFV3BzSENTd0EraWRUdVd4OVZQZUhU?=
 =?utf-8?B?UTJOUjI4aW1LbUNPR2VSdmJuNzRQVTRTRVU2ZHB6aUZlU05SMCtnRDJvMERY?=
 =?utf-8?B?QnF0TGw5ZS82d25nN1ByMmsxbWhHMmsxV08zNHIxR05QZXUzMC9IV2VOc3NW?=
 =?utf-8?B?Yjh1dEZrQUprSGxhZUx4SFQreERpK2FpNHNSQmpYcEdiSGxJZDFYdnRYR3p3?=
 =?utf-8?B?VHpwZHR4dVZTTVl1R1owVU5NdWUycndTTDdoeGkwbVVHMzNxZkY2WGF1d3JE?=
 =?utf-8?B?b2d0eWprUXpUOGJna3JiUGd4MU5Dc2ZvYk8rcWFTbkc4amwxL1oxYUhxbGNw?=
 =?utf-8?B?VW40amxRbzlnZTdyZW8rMFVyTnB0eWtnZ3dwL2thaHRWSU1EeE1XWGZVdXJD?=
 =?utf-8?B?SHNaTFhIeitwcmFESDRHdCsrUDJKY0Z4WmRadllBWTdtV3R0VTJyRzlLVlYw?=
 =?utf-8?B?Vk1WbXlWUjE0cWlwUktoMHhyZ0tGUmZ0Qll4Z21ldzVPZE52eUlYNUs4L21X?=
 =?utf-8?B?aWpBVEhab0pHSjRlTmNTVndkZW5kYmpwUXY5ZzlqZXhTZGw4ZW0wYkErQytj?=
 =?utf-8?B?OUpKbitZSWpXN1NzMitpQXhCYXlPYmJxQ2NSNVk1S2pLS3B5RC9zSzA1VVVV?=
 =?utf-8?B?NzIyK0pRSU5OSUNlakRSa2ora2s0RGFPa0IzclpqbUt5aFFHanQrTXoyVVdP?=
 =?utf-8?B?TXZpVEF3aXF5VVlFNDV4cVJyc3B5WlhsSEpBaUZCcG90UEsxaXVURWhwNmUw?=
 =?utf-8?B?Y2dTVTg3TUhlWHpWQ3RvNWhWVlhodXJsNlZsUTc0dW54Mk1EaE9SQURKbzVS?=
 =?utf-8?B?eENNWkpnTXkyamF6cVVyTUtCL2w2WmpOTlRkWnhDYlowdW4zUGczN2lFSVZN?=
 =?utf-8?B?R3pPWFdVQTQwVmFKbkk1N2gzd1FJZElORDFwTlBkdjJ3ZWZONkpvWWozbjRx?=
 =?utf-8?B?WFZsWU9UbkEyS3N5Q1BsNXZVRkFxcTVlcytqejcraXpQNzVHaWM1T2ZJTy9n?=
 =?utf-8?B?TDhBbmozVllScGhYVkZOTS9LUklzRllHR1dCbHl0RnFHQzZWQjVIVjRZUTY1?=
 =?utf-8?B?TmFOR05GVlA0NjY5Z29xRlJaRStaWFBBa01FMjkrSEI1b0NOUUVXL3Q2UWJz?=
 =?utf-8?B?UUsxcTd5OTRVL3Y5R2tVVytPNWw0Z0dwZ1JOZnQxd2M4YWZrOGdqTmsxa2RY?=
 =?utf-8?B?a0FzNHZ5a0FBd0piTlNkVzFVdE5ZVEpZbnNFQkZJRVdzazlMTEtZOHMyeXdD?=
 =?utf-8?B?YXVMcjdzM2Z1UythUk9Ib1RHbjZYSkQxZjRuMnNBaWtNS0M1ZmNWaTRjSUd4?=
 =?utf-8?B?UWE0UURQem1mMlRZMDlUOVYwVzJCMWhYbVE2SEs1RDdRQ1lVdm5nSzhnV0Zw?=
 =?utf-8?B?dXl1VG5XVWtyNXBiaTAxVDlzZ0tDZFRYUHdXU2UyTzRqekhiYWhndGJIb0VZ?=
 =?utf-8?B?QzFQajBha0gxS2hPM29KbEFMRm11QkVTZGoxMmtRb2JnUzBnWDJGdVZRN3dF?=
 =?utf-8?B?L1lxem9xdUZBcEQ0OVV5bWRHYVlBZDhPTkxrc2puNGgvZUpYZHl3Slh5ZlAy?=
 =?utf-8?B?TS9xRW9aWXhGaTdlNkJBUWFTcERZeUlkNlZQbjhzUlp6UkZIcERnUG12ZmxH?=
 =?utf-8?B?Mk5yUTVZQkVsR3QwaUdMWDBTeEtBWVk3d2tZRlg0WlBHekNlNGtXS292R0NJ?=
 =?utf-8?B?a0JadHRUM3dOUWFETXZlNXEvbFlVZ2xxUXVsVE5MaU4wTTl0dzJwMVVFZFpY?=
 =?utf-8?B?U05LMk92anIyTWUrcG8zSXJYaDZIbjlDT0I5R3VCczBSZW9LRFlpUXlQRGxz?=
 =?utf-8?B?alJJMXRtdmVldFNEcFNOL2Qrcm9VNkl3N2J3Wkh3dldzeDFqTit3MktwNHBy?=
 =?utf-8?B?MmlMbUV6WitiMWx4OGZ0MGRqMXJiandWOTh5WEpraHZBeml4emtJTDMxck5T?=
 =?utf-8?B?eE55QmZ2WnhvZThlZUIyNGRuaXg5N2d1TGswTXJnKy8wQklkQTdhNStjbHVZ?=
 =?utf-8?B?OFk4K0lqMzg1enZYMWtCR0l2U1FTcmdvWGh3YXBRQ0xnSUNYSE1LQitqNnNv?=
 =?utf-8?Q?+n6PfWk32jXW535VR5sZDa4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6305a3-9871-4444-8218-08dd5b6acf50
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 22:20:46.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oGf5/5jnhAfPugm64dteAeDq0QS0AOpthggg+u9zIIHMq+2AP/fbVzBFWVHODo/M9DcTLlM2oMMVRqYu6+6/pqF9BU3R1BzEXL1Tq7fFsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7931
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_142052_297405_2002ADF0 
X-CRM114-Status: GOOD (  21.25  )
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

From: Mikołaj Lenczewski <miko.lenczewski@arm.com>

The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
and this commit adds a dedicated BBML2 cpufeature to test against
support for.

This is a system feature as we might have a big.LITTLE architecture
where some cores support BBML2 and some don't, but we want all cores to
be available and BBM to default to level 0 (as opposed to having cores
without BBML2 not coming online).

To support BBML2 in as wide a range of contexts as we can, we want not
only the architectural guarantees that BBML2 makes, but additionally
want BBML2 to not create TLB conflict aborts. Not causing aborts avoids
us having to prove that no recursive faults can be induced in any path
that uses BBML2, allowing its use for arbitrary kernel mappings.
Support detection of such CPUs.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
---
 arch/arm64/Kconfig                  | 11 +++++
 arch/arm64/include/asm/cpucaps.h    |  2 +
 arch/arm64/include/asm/cpufeature.h |  5 +++
 arch/arm64/kernel/cpufeature.c      | 69 +++++++++++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 5 files changed, 88 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 940343beb3d4..49deda2b22ae 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2057,6 +2057,17 @@ config ARM64_TLB_RANGE
 	  The feature introduces new assembly instructions, and they were
 	  support when binutils >= 2.30.
 
+config ARM64_BBML2_NOABORT
+	bool "Enable support for Break-Before-Make Level 2 detection and usage"
+	default y
+	help
+	  FEAT_BBM provides detection of support levels for break-before-make
+	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
+	  can be relaxed to improve performance. We additonally require the
+	  property that the implementation cannot ever raise TLB Conflict Aborts.
+	  Selecting N causes the kernel to fallback to BBM level 0 behaviour
+	  even if the system supports BBM level 2.
+
 endmenu # "ARMv8.4 architectural features"
 
 menu "ARMv8.5 architectural features"
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 0b5ca6e0eb09..2d6db33d4e45 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -23,6 +23,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_ARM64_PAN);
 	case ARM64_HAS_EPAN:
 		return IS_ENABLED(CONFIG_ARM64_EPAN);
+	case ARM64_HAS_BBML2_NOABORT:
+		return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT);
 	case ARM64_SVE:
 		return IS_ENABLED(CONFIG_ARM64_SVE);
 	case ARM64_SME:
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e0e4478f5fb5..108ef3fbbc00 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -866,6 +866,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
 	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
 }
 
+static inline bool system_supports_bbml2_noabort(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HAS_BBML2_NOABORT);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d561cf3b8ac7..7934c6dd493e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2176,6 +2176,68 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
 }
 
+static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
+{
+	/* We want to allow usage of bbml2 in as wide a range of kernel contexts
+	 * as possible. This list is therefore an allow-list of known-good
+	 * implementations that both support bbml2 and additionally, fulfill the
+	 * extra constraint of never generating TLB conflict aborts when using
+	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
+	 * kernel contexts difficult to prove safe against recursive aborts).
+	 *
+	 * Note that implementations can only be considered "known-good" if their
+	 * implementors attest to the fact that the implementation never raises
+	 * TLBI conflict aborts for bbml2 mapping granularity changes.
+	 */
+	static const struct midr_range supports_bbml2_noabort_list[] = {
+		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
+		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
+		{}
+	};
+
+	return is_midr_in_range_list(cpu_midr, supports_bbml2_noabort_list);
+}
+
+static inline unsigned int __cpu_read_midr(int cpu)
+{
+	WARN_ON_ONCE(!cpu_online(cpu));
+
+	return per_cpu(cpu_data, cpu).reg_midr;
+}
+
+static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
+{
+	if (!IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT))
+		return false;
+
+	if (scope & SCOPE_SYSTEM) {
+		int cpu;
+
+		/* We are a boot CPU, and must verify that all enumerated boot
+		 * CPUs have MIDR values within our allowlist. Otherwise, we do
+		 * not allow the BBML2 feature to avoid potential faults when
+		 * the insufficient CPUs access memory regions using BBML2
+		 * semantics.
+		 */
+		for_each_online_cpu(cpu) {
+			if (!cpu_has_bbml2_noabort(__cpu_read_midr(cpu)))
+				return false;
+		}
+
+		return true;
+	} else if (scope & SCOPE_LOCAL_CPU) {
+		/* We are a hot-plugged CPU, so only need to check our MIDR.
+		 * If we have the correct MIDR, but the kernel booted on an
+		 * insufficient CPU, we will not use BBML2 (this is safe). If
+		 * we have an incorrect MIDR, but the kernel booted on a
+		 * sufficient CPU, we will not bring up this CPU.
+		 */
+		return cpu_has_bbml2_noabort(read_cpuid_id());
+	}
+
+	return false;
+}
+
 #ifdef CONFIG_ARM64_PAN
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
@@ -2926,6 +2988,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
 	},
+	{
+		.desc = "BBM Level 2 without conflict abort",
+		.capability = ARM64_HAS_BBML2_NOABORT,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_bbml2_noabort,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
+	},
 	{
 		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 1e65f2fb45bd..b03a375e5507 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -14,6 +14,7 @@ HAS_ADDRESS_AUTH_ARCH_QARMA5
 HAS_ADDRESS_AUTH_IMP_DEF
 HAS_AMU_EXTN
 HAS_ARMv8_4_TTL
+HAS_BBML2_NOABORT
 HAS_CACHE_DIC
 HAS_CACHE_IDC
 HAS_CNP
-- 
2.47.1


