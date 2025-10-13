Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03519CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJEHzmVjNyicAxPmYJSujklw1S8ONvLW+w80PYTgKvI=; b=LES/WYYdtMGoZ/9JZGK8hjdI+u
	jciY/hrz2P9sLoe2Zr6JY8RScDBXw+22yYYLFgyz9ahDEbaE++DCOvpiLJkI3J5EpbqXKpKzeM+lz
	ecZZ24/XpDwiNm0nN0kMlPbojWEJW+60n3T3Q+6/dD1IBno7eLVnbD9QrnWlxFm5Volvs54xc2YjO
	84rvpt/uyQ3vDbnHrX9Wr03TjlVIv0atTkqUTggnMq7IvlbSlqI2RL60isrrkfvpTR27xLlOYAY/y
	yw7nY168SPvtcNgLogWufy78VF7CJx5m7nvSeUGSAGr4dByi81SB87KQdwfcFvx1vrVJRGSxos7Qr
	SUr2xJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8OsZ-0000000EL8w-0mWm;
	Mon, 13 Oct 2025 20:10:47 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8OsV-0000000EL77-3nvZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byXYdoS+1kRx4+eJPBEETFVc0S92oY02+ZmW50d52SbWKXRgEallgPCEzuAAam9uYpA5alazUC5nvYOgsX6UeXmSNLPPFVDTMZHsBPB+QH6u6y+eTgVdRsMAd7IXmb3xxXvEcZI3LyGZcuT0OZBOokYKdrr96Nf5aTrc6YSbRl0+aWqJIZk1igacaVl8lc48aRCeIsLzyTlm+gXF2eL2yTiy4FfCutmB88UajhRsKQ2B2ssGFQgNA2e1LKhybL8+kzzoWm7oAggXorFULZ/Pf4uCZ3j74uUxjwsDK5ouiHYDvFm5xpPJ2OPrjLajzKhKZKLd8Nc3lbk/lZrtGzbLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJEHzmVjNyicAxPmYJSujklw1S8ONvLW+w80PYTgKvI=;
 b=c4o1y+Ncnnh0Q/CGqaNbiYN6kS9o2MGDGgizLumVbIYD+oiAGI0Yt1tlKEKK41D9N67AvuHVhZjRcMVdT5NPxeQUhEKq1SIp/3HemoN6XsQ2SWi+giw4I/w3vOc03Pe9kpXUHJIsid8QFZm17Gx8KFNdSoZg8YHkemibnOXODeoTiQrFV7Hqn6mWpg7iuSD6IDXBiDb0JdCrybYhfDIt62iRILZTy1EcyNlXBo6g5xPwbJEiFWJdA0Dq/ZMaStzSYZ8eIIVEz8/RyOfjy9veO1zoBugFu2hI4FW6SS/lJGiCbGnjOuYpfEtPHrMVDj7rLXTyOFQ4jNqKIv27fh6J1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJEHzmVjNyicAxPmYJSujklw1S8ONvLW+w80PYTgKvI=;
 b=rYbU4Lb2jdGKowr3MIBU4wkNKdu8ePLgkS4Y1Wk1adW26VntS8Lv8vlhDoepBYbf5FNHuwhprgzxrq4yvhVIBBARp8kdFuWlVORxv3+HpFV/fEY9K7qJTExI3bVpv4Il3EKSdpHKoVeJuiAi8lobuh5vPySxkys6qO5lqif65xDBZxJAVQyy+v0jeEKbTK3AA3kWzUQqfPJ1DeCaFO+mnrQ772fnn86dGq1XoVclPDM9hj7fJ/o4TxAATrkMQIvhlHxOEHROwfGMj7OoyNA3FBsQq7ZtO+iEsn/hg1OQrzc8+gDVgujnd1/T2z9NcjYwagbOoIkmxkeoE65kDCFxAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 20:10:25 +0000
Received: from DS0PR12MB7704.namprd12.prod.outlook.com
 ([fe80::e85e:e922:a750:e68b]) by DS0PR12MB7704.namprd12.prod.outlook.com
 ([fe80::e85e:e922:a750:e68b%3]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 20:10:25 +0000
Message-ID: <42c53659-7d60-4f5b-93a6-d3074f72aedf@nvidia.com>
Date: Mon, 13 Oct 2025 13:09:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] firmware: smccc: LFA: refactor, add device node
 support
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: salman.nabi@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com,
 andre.przywara@arm.com, ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20251008190907.181412-1-vvidwans@nvidia.com>
 <20251008190907.181412-3-vvidwans@nvidia.com>
 <20251009-calculating-glorious-oriole-ceccf6@sudeepholla>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <20251009-calculating-glorious-oriole-ceccf6@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To DS0PR12MB7704.namprd12.prod.outlook.com
 (2603:10b6:8:138::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7704:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: bf817b03-1d05-4ca9-6f48-08de0a948bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWFZUDAzT1JLajFEdkNDL2R4d3NYQVJZb3lYQ3BJaCtNektOaGRpNmcvWTVL?=
 =?utf-8?B?Nk5UL2Z4WW03Zi9Qa0o1REJBcTdRaUdNQ1VQYjZHYUV2SmsxMlVYQVBwWFpI?=
 =?utf-8?B?L3ZhUjFydjFHYmRlc0xPS3VyVTdrQVcyOVF0bWNEdGluTTVWMGEwQmd3bkJV?=
 =?utf-8?B?YWhaM3g2M0FIWThjenBIMGFLL3NYNTUvaGhDS3R1N2NoS2x2RExGYmVuRFhV?=
 =?utf-8?B?ejQybXNnUXJrVm8yOHhTZXVUVzg4SzhyeHU2OURsdE45OUM4UGVDdDNJd1c0?=
 =?utf-8?B?elV3OUdkR0IxeFNnVU9rUXk2QlczRHZ5M1hqYkZGRTkxc0pjNUlqb3FzdFVQ?=
 =?utf-8?B?VEFIclRVSG8yOGJZSFo3UThYaHJVaG8rN3JXcjlxUHhQWWtjSW5zZmlGR2Va?=
 =?utf-8?B?UWh3dVgzNWJkN2hNZEhHM2RPWjJQVmJiYjM2VWpGa2UzTUp4RmdIcEExb1FC?=
 =?utf-8?B?TGZZUU5DQlI3Umxiem9VWDE0TnVzb0pBWktKVjVTWjBVRzZhMXNPMkFBdVhJ?=
 =?utf-8?B?WVlyK2FWeVNhQlVJWWpnd1JsQS8zemYwTHpMQ1pZRlhRWXpIQ29DTlZMdmVO?=
 =?utf-8?B?R29JTzBSWis5TlJCM1k4YUZYcjNvNGU0ZGwvRTVjVVAvMDB6aWgxMUdnTEtS?=
 =?utf-8?B?VjFscVE3TmZ4M1BDdXl1QU9HVWlNd1BsZ3NWWkVCanpoRk9ITnQ3eGhvVm8w?=
 =?utf-8?B?QS9yaWh4ZVhJVytIb0FqWUhNVzYrQ2tZSnc2RkVNVTVvQnhvcHB5TFU5VzI5?=
 =?utf-8?B?RXpJM2YwZ3JWM0ViVWVGUGtSeEgzQ0FZS3BLYXNjeTJLc2l6dXgzQmgxSUtv?=
 =?utf-8?B?YW0ycS9odlFwRlk4MGczTUhPcFllN1JPUnhEaSttUVZxUkhLWCswN2U2Z3VK?=
 =?utf-8?B?cGlBek1ETmpRMHNjdndWT2kzK1dZWVNQV1pXL3RWN0RyVkRxQlJNR09JVG5n?=
 =?utf-8?B?L3JwbzlYdG1rb3JKQ3FySmZMcnFKTEMwMXZlVTBlbnpTanl6TXlBVVFhNW1V?=
 =?utf-8?B?akxKTUdiYmRoWG1XUnZEc0tWamgxdk42VHlPeDM0eGk5SkN3UU5nQTNFdDRM?=
 =?utf-8?B?WnM4RXVoTDVadXdBYlhqVXZsOTdKR2NnZ2FidjJ3ZjR4L2g0b2hzOCswbXYy?=
 =?utf-8?B?K2NsM1laTXN5UGk4b0Q2USszUktCcjhBWktSaXVwbklaNHk5K1BZZWo1RHFW?=
 =?utf-8?B?aE1FVll3VlBUaDlYVGtCbXRURVowc3RpblpTVEhiMjExLzc2Ky82bGY5NFd0?=
 =?utf-8?B?T1hXNjZhVVBCQnEwMmhuOW96TmdKTGdoTW9pdXdabHdlUzJoZ2ZUOTVybEpO?=
 =?utf-8?B?dVYrN29qbkZWb0NSZkpqOE9Ub1JsYVE0Rkt0QzZRa3dGUElEdmY0NUtZNW5t?=
 =?utf-8?B?UEZobHVoOUg0QjY0emJzc3ZOM2dnMHNhaDJWYXdDcXNleWNOUTU2Rjlsd01E?=
 =?utf-8?B?V0IvZHdVMExWTXNXOXQ1a0pXOUhacEh2ZlVvNUp3ZjhzbkwzYjdUeFJqc2F6?=
 =?utf-8?B?VnhBMUFPUkZVOG9VelcwZ0xMSUtqMTJCTEZtTE9NdVVLamFOQmtaZnd4dGpP?=
 =?utf-8?B?WjkvMXBSSEVJZGdmQVdqQ3ZodDJDRVdTZ1huVGViWm9xc2oreXVudmVHbnpp?=
 =?utf-8?B?cFFhbGpvc04zMWRFcTVJaUlKY1Q1RjNkSmlvS1hMaWNLUmovcC82UExsd01t?=
 =?utf-8?B?aG5haWZIRkdOZVdXQjRFVjhYMkJRK3loL2JtNFZ2c2xsNStsN0hYLy83UC9F?=
 =?utf-8?B?U2pPQWpJWU9KT0FUYmZWcVY2cGFacHcveEc3cm42S1ZxY21BS3pQUElSU0p1?=
 =?utf-8?B?ZGJIR1g3ZjhZWHFadE5YWTVtZm92dmtRV2ZQTExNV0gvcVoxajM1TDNITWY1?=
 =?utf-8?B?SVhCTkN3QWNpcWw0eUVSU1FkbFZsRDJ0Q0JyeUwxeXQvZ2thOHdyT0NEeUtG?=
 =?utf-8?Q?Q92bbkVWbtbQp6j5Dxs/prxwTzYBofv7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7704.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU5rYm1zTGphLzd3dFMwYzl1QXorSXo3a2pBbU5FeUNSbTFMaVNLZWlacjkw?=
 =?utf-8?B?Uk9zMWdIY0tzVWhqT3crTXpLSXFWRGxqZmlkOXFjTEJxT1FOTWszS29NNzh2?=
 =?utf-8?B?TkNXK0FRMVZjaGxVR2dtd3NYOFE0djBLcmVUd1NtMXZCSXJxOFJQbSswVzd6?=
 =?utf-8?B?OEx4K1BHUmtWcEN3NG82bWFiT0V6ZjN5Tk9CZi85VGZzOVptMlRuZnlGWlE0?=
 =?utf-8?B?VmZuaUlzdFJraXpZa3hubU5ySFNNeHlrS3lzMEZYOUZJbk0vOXhDWWRIUUtm?=
 =?utf-8?B?UjkySWZ0K0Zma1VKRlA3Y3FyTGxJays1MjZ2SW1rbWpmVXVuN2JMempSalFU?=
 =?utf-8?B?WkUrK2NNb1BnTk04OWR2NTBBd0Vudmxrbm5NV1BQRXdlUVE1SGRRbTFnOUNW?=
 =?utf-8?B?a0VrTURxTVp2b2d6dVIzemx2bFNzSjBzSUl0RXJSb0t3TzRKdFJlQ3o3Nllh?=
 =?utf-8?B?dlhqTlduVVgwZnpVdmxNenZ0MW1LUDV1RFJxNlJDWk1COHBMSU1ZRUJaaUFT?=
 =?utf-8?B?VW9JT3JvS3V1YndsbmN3cWRlSGJNNWdZWHpkZ2x4RnF3djdsNXlrS1Y2Z25s?=
 =?utf-8?B?dXEwdkJsS0Y2Mk00RGNiem1QcEF1Vk1abk5Tb0E3dnVhSE9nNVRvVVdzRitP?=
 =?utf-8?B?dHFRb1k4eTh3MWtHelBwYXZhanVZYjNzVzd2QWltMTNyL2tTdG16bTNvTkFS?=
 =?utf-8?B?M2N5L1YzSzE4Qk9hRW9CVGszb0ZMeFBKWTZEQ0VTQXR5K04zc1ltZk10bnJy?=
 =?utf-8?B?Vi9yd29lNURlU0JSSk1CQXZ6aHBhdmx0dm43c2JBdUdVM3lkZkRoTGpBRlZq?=
 =?utf-8?B?WGpIL0JKZ3VJa3owMXlEaGRyZUVWMjlGM214NVZ5T2U5V1FnckVGSUNnNDY0?=
 =?utf-8?B?Y25teDZUSGxkdngwZXk1WE9JZ203ZlZkVXRBbTI5RmUyT3cxUDRJWlVLSnIw?=
 =?utf-8?B?K2V1dDFyYm4wS0NlZUJWTFpTOE5iNkN3S1R0Q3F6MVdGQWNQbVF0cTlMeTZx?=
 =?utf-8?B?ZVdxVU9pK0UyVDY0Tk9KdzZEMHNNMVRRRlpmUEFOU01ackhFWlNONjh5d3RL?=
 =?utf-8?B?TzQ3dWllRGhabjhMbHRGUVZBQlNnNk1tYmc5UmFOK05yTUFtZ1p5QUFkQzlH?=
 =?utf-8?B?bWNqRGo1cjE5MkY4Y1NVVC9EbDJmYVozd3RQRDIxVXFRVVpuTmxlZkxjbnlT?=
 =?utf-8?B?dENhQkw1RHNyZ2tBaDk0OGpGZDQ5RnZtMlR5VHZYazl3NDdDSk5GcEpRclRN?=
 =?utf-8?B?UW9aZzc5K3BPeG1JSVNtdDBTTFZNTk1VaEYzY0c3bjI4TlBJZE5LOTI4S25L?=
 =?utf-8?B?bmZjNjh3cUpqblZxcGFXbjl0TjFnaFRTb0tsVnZEQTh3VVVHdmNPMnc3RXFT?=
 =?utf-8?B?WUZVTFNiRXU2UGN0dldNQjQzc3hVUEtiRUVuVkUzdC81cHphSXNmbWRpYi8y?=
 =?utf-8?B?SE5qbUphMHAxL0psUHdheTNBVXBmNEdRYUM0VlhVZGdtWDE2dUFPdHdNWGNx?=
 =?utf-8?B?aUtpbFkxMGYrMCt6cnZzWkpVcDFvTjdmVnRPMG9TSXBJbG1BQi9Da0wwT3ds?=
 =?utf-8?B?d0xTTmVCUEtDVEVsOGY0Z0RBVi9TSm5XUERDY3daaEdITy9za1pzbS9DSGUr?=
 =?utf-8?B?V1d4YmlCalc0Y3ZjUFFJaFNkM1NoK2VmaEEyWnZXTVdHRDJLNDlTRE1zSGdI?=
 =?utf-8?B?c3Z2bERBK0lKZlJUOGFwSXJ4WnpFdVlJWUJUSWV1OGZyQXF5MG1JS3hRTDZQ?=
 =?utf-8?B?SmgrMkcvRzFZdmVIc3JLSmFCOS9YNERoSElkOFJnMWZaTStyd3hhMWdjK29F?=
 =?utf-8?B?WVo1cW5leE4wOUxpeFh6NnMvSjBGNDZCckoxa0praDNabHBERTJWTW00ODFE?=
 =?utf-8?B?ckI0UmpzYk5acVpGYUphM29wdE84T1lWa1VnZk9Ga3NzSVZmdWlWNE1pdzgz?=
 =?utf-8?B?MFdndDNuZzdzK1hxSXVUWHduNU9KNWplUWpUZmkzVG1pTkJWWGNTcDNsSTVw?=
 =?utf-8?B?eitETlhXbFNqZ1JiVmxHblBmMnRGN0p2NXZqWFRJVTdxaU5uQjhKcmc4dmIw?=
 =?utf-8?B?dzlsYm80M0QvN25aSjJBM29QdFJheEloUlFRWTNWcGxseXNwQkxSYTVaNklD?=
 =?utf-8?Q?LR2c7RXRBgV7gGm9JT85yC3m4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf817b03-1d05-4ca9-6f48-08de0a948bf6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7704.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 20:10:25.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lwMCxEHba1DQywTSkHIuwf2cNQc7Ju+LoaLJ7hrwzOm2wUkrhpeEM103JsS6y41Gp6HivOsLJWfAVMr8rpXUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_131043_966451_FDBF1FB2 
X-CRM114-Status: GOOD (  12.66  )
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



On 10/9/25 01:13, Sudeep Holla wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Wed, Oct 08, 2025 at 07:09:06PM +0000, Vedashree Vidwans wrote:
>> - Add support for LFA device node in the kernel driver. Implement
>> probe() to register LFA interrupt and threaded interrupt service
>> function.
>> - CPUs will be rendezvoused during activation.
>> - On IRQ, driver will query FW components then triggers activation of
>> capable and pending components.
>> - Mutex synchronization is implemented to avoid concurrent LFA updates
>> through interrupt and sysfs interfaces.
>> - Refactor LFA CANCEL logic into independent lfa_cancel() function.
>> - Enhance PRIME/ACTIVATION functions to touch watchdog and implement
>> timeouts.
>>
>> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 299 ++++++++++++++++++++++++++++----
> 
> I was expecting to the devicetree binding based on $subject but no.
> So this patch can't be reviewed without one.
> 
> --
> Regards,
> Sudeep

Thank you for your comments, I will include the devicetree binding
in the next iteration.

Regards,
Veda

