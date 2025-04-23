Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A861C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXkXVymyWQhTGYb5vmkLVdNFecyxR/Ek4Tz74vmkB1U=; b=f6JGFPkClcZBvdUNAB79+OYmXy
	3lT2eZgAfAN5a1wy5TS0ETRSAUcNZ4SmladG7m0CxHSq6Xu0xhvowQi3fuf+PaFPOJzffc1P7lnGq
	thRHybtgjD+z516ohNEZjsybJRy5oI9uCTdeHzBq8KApvC8HjY+Iq/h8iQXsOlX5npbqiLflOjpma
	U0wBYdcu65RYqC3LXqDLg8kc4zqiL7QWCwuvFx6K8ejymWQGqG1BPOebSoAw0pUX9R9iIT6zBqIL1
	ASvMFqErdBcF/CRmW1YVRfvE81s+VG17q3Lbw67tWPYmeLkbp83J6sACNB0eCHGgRhNVH1wY9uHmi
	52jOBQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U14-00000009PQ6-1bZy;
	Wed, 23 Apr 2025 06:55:30 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TP8-00000009K8l-2si2;
	Wed, 23 Apr 2025 06:16:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9j4aRTlE1RRaIn7nL7Bgd4wqGB5Xt6WPfRzfOaLvgL4bGkZMb7oemeD4l9yj1lLk5yjiWfvqXV0StUnTg5axawlcbmGn0RANyN11aNl10jeYBqYE6z+rK9y66HJeSojvUYV09Kof6tlnAi66X/pLcbnMTlwnXXunl3/cUqHylh/JCtOP+qMuceQJH9dIpsI/og9Ff2h8MHfswizOXO9o4WHJL6evKlmRQFhcGpl8jJwJhqP4F3aue10mNiv7NEauLQQcPm404xxCBj9Nvoe/c1jYVNNeIYE5+BtrVL7WeFqpHb9l3MObLnJvBZEmezMypGtSqL2SBSYHVS3u7ALtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXkXVymyWQhTGYb5vmkLVdNFecyxR/Ek4Tz74vmkB1U=;
 b=p3Q6xmjXunH6VhnQhUUKz9kpDECpQjTs+WwjOVgLV4MQFCAyDUi5ZtFKuQbDSPdEQq7HmHVT2wpo2DQaJtL19a1WR67LAEQmPsZfInXuhrn5svmPoSRhBUM+nus8Wdi5q1wS/dtcmAzUguc4BepaRWtV38gz+evNk7EhKLRXqIWKGt4O0CxpcTgegt7yKlmjx0Ewna2Vwwl0hyIbvXFI/mJ1h+wbbgVH5ZKA9dypqoh7Ab7pmHnoX7yb60iq+zfI9CWmLRhZHdL24/9ltqDfwRypLTnpk+yoOmkUwywUlDR1CIwJZP02GgSvMLh776m6ZwJn6bUkwPK5KdNQoJjaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXkXVymyWQhTGYb5vmkLVdNFecyxR/Ek4Tz74vmkB1U=;
 b=nIL+pQo86kMSq/rDUAOw1hyR+V93vNcusnS6yeu5EA5+QuryICA4Nx0NO6GJTCRKUfAQXg+RkrXSkP1oZAL4+kvVkLxgEA+1ZVQ80iejrNBspHgi0UxONGKVba6yM/asi4fWaaFErCVCFjlYqhjusAVDVUq498jfMOZ6FbVtPvlTtKPiRJQNQTIchppWydxSr9NbXpl3OJ0m+CpZO8I7+V91BuSYidvguugJeYV+huhOw7tBTodg6XlxrxkbBUxvsrsT7v6MN1zgSfYQcXTQhhJbyc++3T+bTboTCbGmLx5W0ynAws8CsNFHOus27kgl0iv6T5E8NUrO2LRZBdQ0mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB6598.apcprd03.prod.outlook.com (2603:1096:400:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 06:16:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8606.027; Wed, 23 Apr 2025
 06:16:04 +0000
Message-ID: <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
Date: Wed, 23 Apr 2025 14:15:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <a175ed1d-9e57-4150-af8f-7ca785203108@amlogic.com>
 <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c65eb0-6664-4404-0002-08dd822e53c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFRlRmM2ZWpjaFNkR1VWN3lKV2FKZ1d5b05rWmx0TVpHNjkwNmRrWnNTd3Vj?=
 =?utf-8?B?Z3ZyN3p3Vy9Ucm9hcUMrNk4xamt2NXA3c1pTcExpYWEwbWZnZU9TaCtWWE8w?=
 =?utf-8?B?bUZRRzZuMlNGZnJVdnNQdzUrUk9OKzllclJRRlVHanlpUEx4SnZRMEplWE02?=
 =?utf-8?B?aWg1SkJrS1J3bE9kQkU0WEZ1anhkNkNNNE1tYnZEVkJxWTd0c1BFeEN6bGZK?=
 =?utf-8?B?Wi9QWnMxTEJwNU9SWlZLaTlKUkFLWGlhY0lpdXFiRnZTcmxVZnprb0NzVTFK?=
 =?utf-8?B?T1MveExFenhiY1M5SGxGSFUzWXozQ0hyeUQ2c2xoL21FZytPNENBZ04xWU1q?=
 =?utf-8?B?TlhCMWJQMzN5QkdyKzEwd1VDNjVzRjJZcXpXZlFSSnlmRzd0UVZiNE82Si9P?=
 =?utf-8?B?QkowWHVRVG5lSTFBd1g1Tk5QQXRZZSs2UFZkSnV2WlhObGF0L1ZueHdoSG5j?=
 =?utf-8?B?ZXgvYmFBWWcrZ3hSOC9Ya2JaMUptTjc0Zzl2N0oxZU5mS3BoZUlaRnd2dU1Y?=
 =?utf-8?B?TnlQNm9rSXZMakhGOHRwbHNrOXZHSjVPUElJUFFZS29QL2pzT2EybXMydTRr?=
 =?utf-8?B?ZmJKU3gwSHlDSUxxS3grcHB0TUlEYVUwK0RWN0N2KzVtUC9zcTRrNGNVVFBJ?=
 =?utf-8?B?dUowb0dwelZPTjBhYnFWaVhnQmRyQ1pPZmtDV0pyK05jYTBER2FlRHVQZmRH?=
 =?utf-8?B?OUE5cksvR2trbW1qZVVqRWpOTWROa3pwdWNzR3kyOVRGOWdRY2FsTjVlcWlF?=
 =?utf-8?B?U3NqN2VIMGd0clFRZFE0K1RpWWpTdzVVV2lrL0pBVmY2ZVQxQktKemdtMGVm?=
 =?utf-8?B?emRGVlkvSisza21BOUxkbUVrOVlvRXE4MmF3dlZ3NmtCSXVBbFdlYzF1NUlz?=
 =?utf-8?B?SzFYbENFd2lKVzJHekNHS1RuQUZ0Y21UeHAyWHVtam96Q2UvYUlkdlhzMWtB?=
 =?utf-8?B?ay9GUTRUMXR5cFRHVGE1dmZleEhKUUpEWlp0OXJ4WHJWdGZ1SVlwYzlvUFdO?=
 =?utf-8?B?THpSK05mMFpwMlhyTWxiTTl0RXdaQ2pxbTkyKzl0VmhLYjhoaHFwNDAvTEhV?=
 =?utf-8?B?b1NlTjl6aFNZcE9nem5ReVdLdDMraDRremNzZkZIMkZ6SXBNYy93S2FwYkZx?=
 =?utf-8?B?Y2kwYUN1RlRWTWVweGw0dUtGMXBhWlRKS3poK0RIZnpTMlNTRmZyanBNWXo1?=
 =?utf-8?B?UnNxVEZqOFhNY0RndnJpRnA2UERIbE5PZHRGRXFlZGpIbnBLVndWRUpEZGk4?=
 =?utf-8?B?bk5xY21QQVZaSko4SXpUQklxdkV2Rk1DZ3Znbksycm1PZnFmbm9sdkZncGp5?=
 =?utf-8?B?N0xLR0RZcVB6NXFydlVmY3QvRys2RklyN2ROK2pMZDU5aTdJWk5IUUZGVXVj?=
 =?utf-8?B?SWgyei80WjEwRHE4azJVSFJFNytMRlZWMGR3QTFRZ1F6RGF0eTlqUzVyZ1Bl?=
 =?utf-8?B?Y1pxUWNReUNSNFgvOUxlNlZjVnpKYitUNWxNeHJyTjZIZ3dhNmlYK3hBRE5C?=
 =?utf-8?B?UUd6eG5xVUxGdjB3TDFTdUNqTW9jdGRqNU9IS1JzM0M2OU5EZDlEVm5rWTBy?=
 =?utf-8?B?cWtGdGczSGJ0V2dDQW8vcmdNeXhkbkdIdVFmUll5eFQ1US9iU0xGR25wd2cv?=
 =?utf-8?B?TXlHVHlaZGZDdlZrOXdzMG52bVhPYm80SkJwVVJva1ZBRmp4ZVpjSkFMV1VX?=
 =?utf-8?B?dEJYN1Y5OHBZQTRFUm5KMnZ5TDBpam1EanJiTjNQRTdaeERNMzF2NG1pQnV2?=
 =?utf-8?B?REF4ZWhuTWNYS2F1dGx3SGp4T2YyaWlVeFNKZk8zR0JrLzlDakhPcmRoZ3ly?=
 =?utf-8?B?d2dyQUh3eEVNV1cwZmNUUS9IRFpzUDUyZjNya1V4STU5R28xaWFPWDNlS01J?=
 =?utf-8?B?SnUxdmNvWm4xQ3o1bXV0OUxZbVlwL2tWQzRVK2tlL2ZObXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGtmaFJGOEVhQzg1TnR1cHJiaE5xMWU3VDZ1dWpGemwrUVR5RWxEVnFnb3hJ?=
 =?utf-8?B?cG5EbitvMUNJZVpnU2JaRjFTUjUvSGxELzFhUFoyMEJMUUo0dXMzVFI1R1Zs?=
 =?utf-8?B?d0h1MExXS3N6MW1ISEQ0KzZnWnVzdERETWZUbGhpdTVJYUt6RVVLVlhQVGJR?=
 =?utf-8?B?eHgxQ1ZlV2ZxbTB5SjBDL1NaL3VBclB3U0xHK3NValgzY0xpQ2NyVVdLSUYr?=
 =?utf-8?B?NGt2cnhSM3locEVjUVFPbHB4S3k5Nk1tbVRxV1BQWG5GWEJkbU9qTE1pWk9S?=
 =?utf-8?B?ak1LQ2xPSnkzdGZEUzEvL3pVN1p4QkhTb1MybUFHNC9GamVIbGZZUGVaMGs1?=
 =?utf-8?B?ZzBGMVlmbHorNDlTR1QyMXJ4N09uYndoK2lNYlJhektXbVdQZlRxRFFka1RM?=
 =?utf-8?B?b25kWGxqWjVuVXhtMzUzL0tpSlo5NDhobC9QeUluekNvSjZSV01HaXZYajRU?=
 =?utf-8?B?b25wMXIvVnI0QlF1TUtUK0d6SUlWeHJLWDc1UmI5QlBScENPNDVMYVo0THJP?=
 =?utf-8?B?ZUxaVWhaSnF3MVBhSU5wdzJ6UTRMU2FpRnVWU0p1TDMvRFZPR25sTUZLdm9q?=
 =?utf-8?B?RUExZy9lSktjQTZBeE9GVW5YdlNYaWZjRkJHMThVNFZRR2FPbkxHWWRQYldM?=
 =?utf-8?B?YUg1UGhGME9wSGtXYm9LeTJ1eDVlMU4rcmxodGdJdzdVMG9kMHZsQTZuTUdi?=
 =?utf-8?B?Sk9JdWg4N2x4NDN5WFZrNE41TUw5ZFFsbHNRU2dZMkhKY1h4RUxFYkFHYjhK?=
 =?utf-8?B?SU1MSTlLcjg3L3U3M3JDcGl5T0U1amJxdVFRaVFFTk9xeVNsVnhHaXVOeERF?=
 =?utf-8?B?QnBKOGRLVEUrT012UzdCYzJ6b1BhZlJsczZuQk9SWDRLNHI2dU5SN3ExQUU4?=
 =?utf-8?B?WDhqV2FReUptK2FWQk1NbmVCdllFR1N1cnFLdGp1VVdzeHNkaVkvdU03Z1I5?=
 =?utf-8?B?QUNIbGJhWTZaWFJ4Q3VCckVxMGFPY052OGx0RDQ0bGxJODhWaE9vSG9wVWJ4?=
 =?utf-8?B?bmVIRWdid0gzSnBSR0tKcTYyalRzMzR2VzMwZkpzNm8xK0ZOazYrbDBZTU1S?=
 =?utf-8?B?RHhCU292UHdLQTRXRjk4djVYMU9ScE9mTkZncGoyYk9hTUdDNUZDUTJ5YlF5?=
 =?utf-8?B?UDBCeWk0bHBFRkRsRFlpY1F0NnJHQ3dvZVBUYzViTmhodXlhMXlaQmpJbVBz?=
 =?utf-8?B?U0lGc1A0ME9IQ25UYkVsdVAvSjVlU0k3bWRyMzU5ME1NMG1hVURWZXd5YTdU?=
 =?utf-8?B?aTBOQ3k1d2R6MVZmRXVKNDdXbVBqcUNKbDFKYmZWV1RpV2tEZEtaQlRYdGhB?=
 =?utf-8?B?djc1UWJzcVpnSFcrc3ZEQlJIWlR3bUNsWldtMnlXR1lTWkxiWG93STNNTjZG?=
 =?utf-8?B?Tmc5Q0FOcWgzVU11YlZZZGJQWVhKYWJjeUFSblZvQ2dqWDFuQ0s0Uzh4STg1?=
 =?utf-8?B?TUJjY09CRTBmMHROWmRBS1NtT2ZmT1Bma2dnYmROS0RLNy9nWC9nR1k4a21I?=
 =?utf-8?B?b3VvOXoyU0JxWEZ1ZFVLdkFzNzd5bnFnK2pYMENSNHVoM3VkUWI4QTkrNk51?=
 =?utf-8?B?UklhUThnZ05vVmNFS3ZVVFB5MkY4WjZGd1k1S1JHaWhCVzVNcGErT296S3dl?=
 =?utf-8?B?RmFuWjZ4S2czQ0thcExrMHphaGVIWVQ4MWtVNFpaNno0dXc0K2ZqMUVseDda?=
 =?utf-8?B?WDg3M1ZnR1BabUdVSTZFMjAzSVdPRGQ2bHJYTFk0MGNtWGpMcXY1M2VXUnc4?=
 =?utf-8?B?eGFMWjAzcktvT0VZeEtsbEVaQXIxankxZzM0QU5EdFdJSXRycDUrSnVYNmVy?=
 =?utf-8?B?Q2pzdkc3ZVMrUlFVMmZkWVlRWUtVWFBkUzlHNjBWbUlHVWk1NUU2UWQyZE9x?=
 =?utf-8?B?UldrVnRwem9icDZ4UUlFVmFtYmU3NkR3cmhCYm5NK2VwNm9NamdEU2UxY3k2?=
 =?utf-8?B?QVFBelNmVzhNL0xINGFtNjhMYW11UUU5RWFFNzl5YU1jbUtFTDMzN3ArZFpV?=
 =?utf-8?B?ZVpYUjBGejlwQmJVSUtQZXliY0N2SW00ckYvKy9GdWZIaURNclRtUzBlUDk2?=
 =?utf-8?B?WEpwUUsreDAvYlErMm45Y0Q5R3dJNHlZZmM5R0NUcjdUY3FTTFNBdVQxZHUr?=
 =?utf-8?B?ZndYMlhQbHNobmZDTUJMUEU2eWFVb0VUK1kyRXFWeDNGWHVkd2JRYVdNRWRm?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c65eb0-6664-4404-0002-08dd822e53c1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 06:16:04.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0OS7IHwpgyLW1k4vyYBXoybxoosHdWqyjzp1gXfhLy840U5yzzHkvgw4p4B44cbawPd2vqtzIQXOnjdjvXnb9fGLz/FKCTla8HQsXiNRP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_231618_741379_202BFCED 
X-CRM114-Status: GOOD (  12.75  )
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

Hi Neil,
    Thanks for your reply.

On 2025/4/22 21:49, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> On 22/04/2025 13:45, Xianwei Zhao wrote:
>> Hi Neil,
>>     A gentle ping, thanks.
> 
> I'll apply them this week except patch 4,
> 
> so can you send patch 4 separately since it goes via the tty tree ?
> 

I will send patch 4 separately.
The following patches(5 6 7) can be not included for now. Without the 
patch 4, the command "make ARCH=arm64 dtbs_check W=1" will fail to execute.

> Thanks,
> Neil
> 
>>
>> On 2025/3/17 15:16, Xianwei Zhao via B4 Relay wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Amlogic S6 S7 and S7D are application processors designed for
>>> hybrid OTT/IP Set Top Box and high-end media box applications.
>>>
>>> Add the new S6 SoC/board device tree bindings.
>>> Add the new S7 SoC/board device tree bindings.
>>> Add the new S7D SoC/board device tree bindings.
>>>
>>> Add basic support for the S6 based Amlogic BL209 board, which describes
>>> the following components: CPU, GIC, IRQ, Timer and UART. These are 
>>> capable of
>>> booting up into the serial console.
>>>
>>> Add basic support for the S7 based Amlogic BP201 board, which describes
>>> the following components: CPU, GIC, IRQ, Timer and UART. These are 
>>> capable of
>>> booting up into the serial console.
>>>
>>> Add basic support for the S7D based Amlogic BM202 board, which describes
>>> the following components: CPU, GIC, IRQ, Timer and UART. These are 
>>> capable of
>>> booting up into the serial console.
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>> Xianwei Zhao (7):
>>>        dt-bindings: arm: amlogic: add S6 support
>>>        dt-bindings: arm: amlogic: add S7 support
>>>        dt-bindings: arm: amlogic: add S7D support
>>>        dt-bindings: serial: amlogic,meson-uart: Add compatible string 
>>> for S6/S7/S7D
>>>        arm64: dts: add support for S6 based Amlogic BL209
>>>        arm64: dts: add support for S7 based Amlogic BP201
>>>        arm64: dts: add support for S7D based Amlogic BM202
>>>
>>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>>>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>>>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>>>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>>>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 
>>> +++++++++++++++++++++
>>>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>>>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 
>>> ++++++++++++++++++++++
>>>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>>>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 
>>> ++++++++++++++++++++++
>>>   9 files changed, 443 insertions(+)
>>> ---
>>> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
>>> change-id: 20250221-s6-s7-basic-f300c30877e6
>>>
>>> Best regards,
>>> -- 
>>> Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>>
> 

