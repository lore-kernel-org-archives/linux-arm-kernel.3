Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B373C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3cFZUDtLpV3rGg4Ecl/e1G720JbKBizKOICAHhtmAE=; b=Ly2gIdIxCfoFnRXbuCjsPSjLls
	Uos6AVI0MtG39d05BFyg+BoJ30IMkmqPIYd4HpNHZnf5AY67DdwT2vomBHWCbQ0K8A6JFJ8B8vbqT
	uhfelx0Lnx4lnCbnb9IOha+gndf9WQ9OKzEONQ+3hzUOp4zciZpghQYdIhu8QGYEmWW7Pp/ZpeGoz
	E2ZJk6/ffADS5y5m1DjpBhE9MGxD8xUyrEvvFpgLsLoovjlvDNNT6T9shKfJ9IhZkKkx4d63MB1+t
	3YESGf0nKbUTWo7qZbtMNQe62nhe8BD5piSMPMvrx1XoOaDfxw97xq/YEpMu07RyzvcuIlfe9ZMjC
	jFItTzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkseO-0000000FT63-18vv;
	Wed, 19 Feb 2025 22:34:40 +0000
Received: from mail-sn1nam02on20611.outbound.protection.outlook.com ([2a01:111:f403:2406::611] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tksct-0000000FSkI-1dAz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpguQK8x5bnsV3G6h1176GGv8lE0zNbgfZXbIY1mo4y79k6AV5nL3xYRr3GbPjAZY3TTkMBPDssnYPy15jGINQAl1wtTm9fxuA0umPRLudWGtkkIJMsuZSRpaJSeZNunuQnmrVoedW5a6KIUWwSctQp8BH2x3AgNVoqBuhrS7q5/bXlje6+5OIzd+sDeEfGdsJ0JqmoKWdadM8Ekf2mRSj7uULmeG0o1iXEw2rk3bTVH9t2QPnPqoylUyedSLurwZpyA2uZVYIQ/4TBQCUYOD3D+HIopAnqoZW8AF/mW3N3BWUKsGKPagzIDjYtnLyWatfF735Kjxf3Aw7hITnkkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3cFZUDtLpV3rGg4Ecl/e1G720JbKBizKOICAHhtmAE=;
 b=wPqPSmX01Av5CUMC+uPlu/20g/WFuxrGQV4BGZjj8NB+iLIHnhF6qge6NpwMU67Z47rtJUqPSGwNpR1F4g81t+The9HGtITqplhqfLlZD7ygxdRtYZ6PA697FbRsOgTwi619H3De0OZ3Nb50BPyfjBHlnjoSG9J3uapezQuXr07w57p82S4p9nV6k0x7KExRd9V8eWwyn/MR7KVfwXFhTeqn2zzLlPqeC2IqoQoW4EKmPmqKDmleo0AeukcmQ7/PMOritHMYvAGaxF0dpF1GvsD9Kb91dlPb4dNxwbVLR0fgQu5112OXTQXPf9QQO0PfcCbA1TVT6GaoEUaFeschqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3cFZUDtLpV3rGg4Ecl/e1G720JbKBizKOICAHhtmAE=;
 b=T8b4kKxNB0PT/AJD6Sylw03EqZr4Sv+HecQa1nIvS2j0j2JtHqKdrTT+PWMjFB+/Bu61e9f1PS94/QoCIZZezlMNfSRQ2daAbr1YPc9ydDfZaQTRrwdArq/EEhaqDw1lEyo91UWgaBAf5k/4hhniAtV+7EHJjmiA0qQSu7P5KwJC/D4F82d9Ilb9xnE4QuRb7BzfDWdL/NtYVwLz6JTEN9jI/SHVrNFVfjvRZowjoM9SGZEWe5EKF3TIrFoBmYJC04SJX7Sy/24qtOA/2DmzI8gyyQTd1Cc4XU5Fi4p3lAGzFt2dRGdGx5K/ZLuwLGH1ayCiF+bNdz6W1YKR8Gvw6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18)
 by CH3PR12MB9123.namprd12.prod.outlook.com (2603:10b6:610:1a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 22:32:58 +0000
Received: from CH3PR12MB8209.namprd12.prod.outlook.com
 ([fe80::9127:5857:7ba5:a7f2]) by CH3PR12MB8209.namprd12.prod.outlook.com
 ([fe80::9127:5857:7ba5:a7f2%2]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 22:32:58 +0000
Message-ID: <7b6505ca-6082-4644-be4d-6e1372c183b7@nvidia.com>
Date: Wed, 19 Feb 2025 14:32:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] Frequency & duty cycle measurement?
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 linux-iio@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, timestamp@lists.linux.dev
Cc: William Breathitt Gray <wbg@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::20) To CH3PR12MB8209.namprd12.prod.outlook.com
 (2603:10b6:610:123::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8209:EE_|CH3PR12MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8e8023-379c-4854-8e96-08dd51355c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azRBZ0dwSU9aVkZmeUU5NjBBTHdVc1ZidEkxTk1jSmJmUUNEUkZ6L211WW5r?=
 =?utf-8?B?RDFxZHNsbUkwaW5CZ1FJRmp0T3M5VGFHWDVidGdNRHh2bjl4M01jMDY2MDdo?=
 =?utf-8?B?M2hnbWdBSFRKMzRtUWRFc2gvSlQzdG8wWjZTVWVST1J4WHR1R1BqWHFqSlUx?=
 =?utf-8?B?U2cvdFJGQTVsUXFQOE5VM1NQZWNCOWlCbEEzbnNNbkNURVVEOUdHRGJOQUhx?=
 =?utf-8?B?V2hzNUkwUnloeFUvVno0YlQ3SjVmVWxudTU5Wll2czYwTlBnektTenMvVmp2?=
 =?utf-8?B?Y1h2Z2o1RXJhYkF5Y2lOVjUyMlFDRU5LV1NLRzVhSjFGKzdrTmdkbi8rNk1v?=
 =?utf-8?B?YUFkeVp4MzRGSUhDSFZqN1BOQXE3bnRGanhnZFNRazJZVUdxWWYrNWdtZ0d6?=
 =?utf-8?B?a2hCZmo0S3JrMCtEc1ZvTHQ1am5QYWFVMDRSSWJabDBuQkJjR2IrMGJZM3Bo?=
 =?utf-8?B?NExJTmFnY1VFb2x4cS92TTYrNmpWNWpqTTBIVVQrd2QvNkNXUTVZQVVBOXUr?=
 =?utf-8?B?UjVEYTBRaWVrbFlvZ2cxQVV6dFpjTWFMbXlJYko5aHpSdEpvcTQwWlVKOXhS?=
 =?utf-8?B?VHBoSGVTc0J0dno0SUJpZkVKZUI2dVNYRzZ1elczNytvbHlpb2RJNklIWXor?=
 =?utf-8?B?VkR4T2xJaHlrQUdNNEtSdTNEMkdBa3dFZHRwTFhIWEQyVUhTUmhESGdwWXdp?=
 =?utf-8?B?ZCszMzRWWjRCYVhYMUd4NmhFQ01aRERqeDBuTTFTT0ZvdG82WVNha0JCSGhy?=
 =?utf-8?B?ZjBVL3UrTXU3NmJOWWNub1dEMGl2T0JURXJkMExXc05UMEhEVUdkaGtZcU1D?=
 =?utf-8?B?WU9kak15N0Q5UDZ4MHR3bkM3R1FPUmFEK2ptVmJsaUdBYk5hQ0tBYWVFaUlj?=
 =?utf-8?B?M1h2SjBqdjIzN1ZhYnorWkpRUkNCWGFsL2Y0NnUrQnZZZWVwcjdsaVVTN1cv?=
 =?utf-8?B?dVZXMldYUmljcHZSSWozdFdGVGNsZXgxRGl1ZGVmK04vdGg2c09CV2Z3T2tC?=
 =?utf-8?B?WHRyZUJUTDRpeERpZVlMOUdGc2Q0NnZULzdzeXBzWURVUkhoeUhST2RBQlJp?=
 =?utf-8?B?YkVic0lpQzBZbUlVdDZPOHU3VkFsYmMyaE1DMGhabVFmUTBmWm1nenBhdldW?=
 =?utf-8?B?cEx2NC9zM21YYzdYVE9BOGEvd1dETUJpdzFTTERYMllSSjFoRmRHenZrbjF0?=
 =?utf-8?B?eHRrZXp6VnZpdFB6TU9Pby9tYnZ5Rk94ZXIxeGFLWmQ3bG1MYjZXUmpBMWxV?=
 =?utf-8?B?cFlxZGpCSXdYbUVzOTV4aURRS0NBSGk1UkRFL0JEOW82TkRLaUVUNkRvWDRR?=
 =?utf-8?B?TFVYaWlqdE9WdFU5dCtqMk5mQWcxNHE2ZkhGU1h2bjdMWU1NdUt3VTIzTFhs?=
 =?utf-8?B?MDhvOFlyU0NiWS9yQVpGK1NFcnE5R1kzVnkwbzJvUWp1TUFyZitBUStKU1Iw?=
 =?utf-8?B?c2FjTXV4VHVLY0tIbDAyMXNZV1owMFNCZHRmWmR6M2pPRi9HWHYrbzJNRllQ?=
 =?utf-8?B?Q1lNT1BLUEg5b21DeGxQclZvV0tmK2dKOXkzRXl2cUNGeTBCd0NqdlFOVFFP?=
 =?utf-8?B?QlBXWVZLSnZldkJwOVRFVWlua3FpN1JGbVFCZ3A4YUZQZGRpTzhBdmlZejFh?=
 =?utf-8?B?ZUpCMm5RSTRuQ0pudWJJVEkwZDZVZlpYcm0xQWQ5bytFb3ZtU3VRYm55ei9X?=
 =?utf-8?B?ZWdiOUpWTGhzb0pyNGFPampDMGZ5d2VYWlJUMmcvT1dOYlRxRjRCQU5SazZN?=
 =?utf-8?B?TXNHY1p5ZjhYNENhMHN4bFZWMjFyeFpXeDJ5NFdTeFBVaGtYeUxnMjNqOTMr?=
 =?utf-8?B?cGFSMGNpUjM5MjJJeFcyTFdQdm9WMXBwalIyQVNFMCtHbG9jMmJNOWpwUzFl?=
 =?utf-8?Q?1Iwp91MO2cCQe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8209.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJxZzloN3d2YnNlQk9vMnNRUjlSd1Zad2ZGVUxTcUQ5TVFrVEZXbnlaa003?=
 =?utf-8?B?MXdQOGVKS040bHNjNEY0QzUvSTV2Y1ptSTF6My9ZRkVhbGxIWVVQZXRSR09Z?=
 =?utf-8?B?Rlo5WXpXY3BvQ280R3l1dGlSTTZPemJzMzhNRmFEdUlSUXA2cHlzbDEyTWJW?=
 =?utf-8?B?YWdCalU4aU8vVllnMnBxZ3J1UndrU1h2aTRrbGplQTBBdWJzVVpUL3hsei9o?=
 =?utf-8?B?aDYzUWlEQ3pFS1QvR2ptYlhzS1dxM2lMU3FVTFh6a1pLYTlRMHBleDZPL0lW?=
 =?utf-8?B?RVRKMVJ4UEUweU9tSGJWSmpDYXhyUEJsZ3FGb0s3UWw5dW53RnZTRWV4c2Js?=
 =?utf-8?B?dGRlb1lMUXFpL0tsNEYxdnVPL3U0MGhidTBrczg3UzNIWmtPdEpJc1JKY0I4?=
 =?utf-8?B?MXRGUVl4VS9IZUtvNjRTSFdiQjhySmtVQmtwejdXQis3eDFGVFFTMlMzUHFR?=
 =?utf-8?B?YlBTSWhyVzFGNktyWlJES3IzYjdPZHA5cktnUlM1NlRCelB5RUVyQ1B2dmpj?=
 =?utf-8?B?WVpzVTE5RlZGdnRnWEpmQ0xZcE02VXQwdjIrL0Y4NVFYUGo2eHNnbDFrUjVK?=
 =?utf-8?B?VkViWE4xUVFUTnRmTDluU2VabkRRc0RyTVVGMGR4ZkF4QUM5amdnM1kzYU0v?=
 =?utf-8?B?LzM3aHZEVUxLQ2s4c1VDSTJpUUZUUWh2RUJBV2Q5L1RYUXh1Vk9RV1Btd042?=
 =?utf-8?B?MlVQdEt6SG83WVd3YklQT2drWmJQbWhKUXpNODRFMHQ3QVE3RVhhNzMyWm9C?=
 =?utf-8?B?S0NhZjZwdE9HUHRBcVYweEM4dW41d1h4ZzgyOExqMXRjb2dnZVpBeEE2VmdC?=
 =?utf-8?B?Ly84d0tHOXNBVjhQOWFQNWRQK2o1WDM5ci9Zd1dkZDVNWWFGRGtiak44RCs5?=
 =?utf-8?B?aS9DTS9BOFFvLzI1MU5NM2hqTU1aRVA1S2ZGWlRtLzRWMXVBdk5ESUVWK29E?=
 =?utf-8?B?WDRJY0JybFBWaFFlV0ZUWDJQUHJVMWVHdWRUTjRTdndneDE1OUVXdWxjTE9h?=
 =?utf-8?B?a3lORjZlR0I0OXY1OFc1bTEwZURhRkE2NHZVb1dSNnkyWU5LOUQwcFNFeFA4?=
 =?utf-8?B?dXlpL3JzOUJNQ2JXdlB0Y1ZETTl6bUZneE9DNDAxT21ieVF6bm51WWJCMUZO?=
 =?utf-8?B?YWdsRk5IdWZEcXV0dlRxN05WUVp1MkxpZmU0Y3o3MkJUUXJGZ0JHNm9UM2t2?=
 =?utf-8?B?aG1OTkNHQm5hVHF2Z2lsTTc4QlU1Y1R4OEc5UVdTdXVUMTVRSnVpUTB5RHh3?=
 =?utf-8?B?YmUwVW9MekpxaFU5NUllTnNxdXdHNWR2OENJMkw1bExsbFFQY1MrbVlFdjcw?=
 =?utf-8?B?clBSb2M4SzRTa3N2eXQ3YWpKUGxmMFdETTBDYTE4NE5ndkFXMFk2djdvYU1l?=
 =?utf-8?B?eTQ2YWVVcmkwclB3NmlDdlNnUTdaWTJyT1EwVUZtWGlnZHU4a1lsNlhUckE2?=
 =?utf-8?B?WFc5S0dTdjdtR2VaeSt5SHI5RllpMzBFeEcxbE4vVGtHeW50c2dDTVU4T3d3?=
 =?utf-8?B?dGFqamdteXZzOGUwditlcU5QTmJGWXB6Vmc2b0JXdWtsTUxPOE5mT1A4WkR3?=
 =?utf-8?B?aGtrVzEyWG9mUXp5SnluUms4YStMNkxIRHpYNjR4bGM4S1lPVUloQVRUWTRX?=
 =?utf-8?B?RGIxRi8yVkp6ajZYSzF5cytHOTNSYmtnVVJjMGxWTnNjZkpiczJjbWRGbFgx?=
 =?utf-8?B?Q0pwYTZicGxpL042ZHpGN1VBVzZvWUlnTFJ1dFFOV1JoSXZOR3VzblRpY1lz?=
 =?utf-8?B?SlBMeXlKQ1pjcE9DZlNUeDhHYzBvWk1LeG5sNzVIMHNYZ3NCblVuWWd4L3M0?=
 =?utf-8?B?QjdYOXJkSjVScXhiUGJSR0Y4RERFV1B0S0VXNHU1WEViT25UM1lrUncxY29I?=
 =?utf-8?B?SGw5REcySEhkS2VrOE5GSU9BbmFFc2huL2ZGUHA4bFRFeVBGaU1vRXpDV2Ry?=
 =?utf-8?B?cFVPdmlZOGh6NE5vSWl2TjlQZ0g2TjFsNmE1Q0ZCSFJkdHd4Um9WdUFxSyts?=
 =?utf-8?B?K2FaVDJvVllJdnlIemxOWDJTRVo5aHA5QjlSaXkwTENmWnBoT29LMmppby8z?=
 =?utf-8?B?R2tveFNiUVo3ZkhVbEtjK25ZSU4zL0E1M0ZkV3lTK1dHSUdZczFQVjlqWTlZ?=
 =?utf-8?Q?2UiNjCgD5XAz+PMMq+R/yvCb6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8e8023-379c-4854-8e96-08dd51355c9e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8209.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 22:32:58.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMTWE/FByfpGjzLHSvioRdpIOdCIdZP2/ZJZerQubv7RJxaWlLnHnunNHiU3P6n0DOzrO9+xAi9xOP10zSEi0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_143307_430050_50AA6472 
X-CRM114-Status: UNSURE (   6.92  )
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

On 1/21/25 7:19 AM, Csókás Bence wrote:
> he hardware is capable of taking a snapshot of the timer value into another
> dedicated register pair (RA, RB) on the rising/falling edges, and a small
> `devmem`-based userspace utility was created as a working PoC
I am late to the party :) Seems above statement looks lot like what HTE
subsystem is doing. Right now, only userspace path is through the gpiolib
due to usage that time was limited to GPIOs. However, we can extend HTE to meet
this scenario.

Thanks,
Best Regards,
Dipen Patel

