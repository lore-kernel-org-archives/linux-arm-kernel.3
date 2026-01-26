Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87660D19519
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9+46TuvDrShb5X9erEbYJC3/rtoYvjCKJO2Lvvg8QI=; b=QhMNjUW6UAWSK+s2MLVlNIeLDM
	OWb4FH52prXWkozpkZiNpVPYrStU+5ab3eySoRovgwNETFvtCXWSTvUtyYOCezMbY5eFL07cegd4V
	9Cjlcs31cbUdtFSBmb1cOJq2OX8xN/UNya/YiAU3PmF7TUfVDWtUi7ENWfWrnVLVmedaRGYwAQkBa
	FLFNTRppTM8cbqWt7c0ER1opDzQVZ7L0IQ/8Ax8ps8A9hXpMHjUQbD/ZvyTyZnTImWNVldLClrd+K
	EVD2Lv4MYeHAnmhFXXT/sP/CdZXqNZ28tY5I9dXHvSOK9AGfUMAL9F0RuDRDI0mJwdirAt0kKtuF9
	q4XAsQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTXb-0000000DEEw-1OpJ;
	Mon, 26 Jan 2026 20:50:31 +0000
Received: from mail-southcentralusazon11022127.outbound.protection.outlook.com ([40.93.195.127] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTXY-0000000DEEO-1odf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 20:50:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6giRtTzHuv5n8VTZIZ3uUDMujEgYiWobBFOOmJCBKQ6bpmyFAjbkpPgZAT+sdDUchtt0lKHNoYWPl2t77ywqE+7TDPYg5PVlnYzj2hAWW0byrzJHi1Kxi5kAZ4ab06Fl3CxPWqkyR25Yrl2LIMQIjD4wzX7vxZ/wrr4q5gc2ZMOe9Pa6ssOA2qYs6za+Y6OOOVEs7Lv0HdWTnyxUvJiB4U+hzEYjhUgV7s/R1J+aS+tXKf0ozANb4J+Ty+QG8feUBbxKw15QSkkBTYMLz5XkQOgCl43r+k3D0FcsBllSz8fvU6/tLvLrW7vu8Kw98mW6WmhT27I9pL9GKOuuwDB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9+46TuvDrShb5X9erEbYJC3/rtoYvjCKJO2Lvvg8QI=;
 b=T6BKGuer9kN1ZmKMiZaigXoGxuZhVznwOO2nCuzOYH6Gu4HL839FcB770WZwhXbwK595GDJ8KTmwcKSy/5N/vlX20gHzP1ecAgVFSLc8/cZ7YDOkdqEug2Tqr+1/5HQPo3u7QWakJHB8f6Xp9Cu5VfFnOk/4KlvdVRxTrMls7VqzJFWzdrWeIdi8ukkqiK5JkFRJA8rtR6+qDPl38zdSRrJSYBEURZMHWAkcsF8DMlPp4PWJ+qG+6sba9bVPqQEziSzKz8wWQ79bmfkeX+vfNV1c43Um04d+Js9AwSreCn0iiGQwCoLoIQD+lofh7Nq7PSzLycznrqE8sqaP7hm6PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9+46TuvDrShb5X9erEbYJC3/rtoYvjCKJO2Lvvg8QI=;
 b=Xo4tEgn8yPSpmIlDD/pSLPfEByP88s29zGZvmJ4JrVsK6L8c0vuhmcDNyuw1iBiDOfPWTEzeMN9JGnXIWyB1LhL0jThGcbj0fSzQZtz0EfiXXMch6UHgf4iUqMo3UWlwC1SsfCinyE7BE7L660569/5XCG1BVYFkDsGFQZXkZAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CO1PR01MB8892.prod.exchangelabs.com (2603:10b6:303:276::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Mon, 26 Jan 2026 20:50:24 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 20:50:21 +0000
Message-ID: <f0214a9b-74bc-4ef5-95db-670802ceca4a@os.amperecomputing.com>
Date: Mon, 26 Jan 2026 12:50:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 cl@gentwo.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
 <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
 <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
 <a0aeed19-02d2-4d74-b82a-f906dc41e240@os.amperecomputing.com>
 <aXd2rud1E0Gff8-2@willie-the-truck>
 <04f816f9-5533-4fe1-99b0-cd405caac485@os.amperecomputing.com>
 <aXe5WHBdHLEnh-Bp@willie-the-truck>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aXe5WHBdHLEnh-Bp@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CO1PR01MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 5923acb5-eff0-4d63-b053-08de5d1c85a6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFd4RGJ5Z3dDRjIxRjJMWHU5akgyUGkyYTFiaSszU1J1dW5UbWRPTmxGNkFB?=
 =?utf-8?B?Z2p0ZXQrUThiWUlEVFQrMVhzYzZteVV6dVpVdkFHOXF5eW9ZM2NUbXVrWU9w?=
 =?utf-8?B?ejl1dURtZ3ZSMi9EQmIxN0ZRY0h5ajVrRHlUejRrZ25NS2NGZHhibXB5Y2xm?=
 =?utf-8?B?SXRMRE9EUWRlMkFqVGQwcEt4bFJucVVBbnB6VkhMZmtnTHlidjI3NittYm5M?=
 =?utf-8?B?WWNTa0FrN0ZiSnprZzFmWDNqK0EzN1k1M1VMcmdpNnBPTllqdjdodnVkUk5N?=
 =?utf-8?B?anZpL3VHbjNsYVFxWFhYQUNxSFVrYnN1bHBoZXpWaWQzTFhIMGkzbndJWStX?=
 =?utf-8?B?NklBYnJWeFA3YjVPWlJHMWVWNFBmUWVBSy9yMHJmc1FvL1JiYTF2M3NhcjFw?=
 =?utf-8?B?RTN3MU8xWE1mMmk2dXoxMm8xZ0QxWUNadHlXUjV2UVVzVy92M2NRU2tiS0Ri?=
 =?utf-8?B?V3hydXlRcmxNaHM0T2ltRUc1TU9rOFE1eWR1VW81aHdOTnN0WGRaS0J5OHNr?=
 =?utf-8?B?R2tRbFJEM2VRbi96S2FLSVMva1pSL2RhZEZwMExjSWNZUk5PYTdSWHlXWjhr?=
 =?utf-8?B?U3BwMDYyRHNHK0xaUEV6TzhSZldmTHdlK3gxcUI4WDNWMVQzdnZ6STd2U0JI?=
 =?utf-8?B?RW5iZm1nOWtTTGtpcFZPc2ZrYjhRdlNvZXlNTnpSaXZvMExkZm54NGdvZEE0?=
 =?utf-8?B?U3Y1aWNpaHhINElWTUpsNklkTWpvK2xQVTl3OGpIaGNpNXdTUWlMQTBVQWE4?=
 =?utf-8?B?ZVNuMWlHT3J5dHRPQ2YweG1JbG1QbnFFQ0YxdGt2ZDRLbWNOanNOY1J5VkJM?=
 =?utf-8?B?U2JRUURWMmNXMS9JK1pNVWV5TlRMNjJ2Qlh0cEdJckZVNlNYWjZ5TUdZcXZN?=
 =?utf-8?B?RkhlTEsrVjlNL0Z5S29ScFNFMzZDZ29KRTR5V2FRZjRnd2RJV01wbHl2UEV3?=
 =?utf-8?B?Tld5dU1oa3BucjJUdUhJRGNneDUvWkY0SzlFTnJXbUtQWFZzVEFTSENyMUhP?=
 =?utf-8?B?ZnpaQVI0S0VMMmN3MG9uYU03b1A1NHZ3d1VaYkpObXJUbzEyVGQvRE4wNjdv?=
 =?utf-8?B?RjFTY2NOMTdiK2Mvd1M5MUNNSzVSK0M0ZUpsSElIVW84RFBBbHgwVWpxZEtP?=
 =?utf-8?B?TWlTNVlaM0FndFJjYWVLcGRVNWxmMjQ4c285L0diTkVsdnkzWXdxSHhObWkr?=
 =?utf-8?B?TE1EUzZuWE5hYjRXdVUxN2FYa3hRbTlBS1M5aVBtTCs4L01CWThteFA0ZVRy?=
 =?utf-8?B?eVhqZjVQblB1Y1dhM2dkTFI5SFBmeFhjUDlFWnBldW9CbXJlWVdDd2NHaUxq?=
 =?utf-8?B?UlZ1S2VmZ09qV091UmVQR1JEeldaOERxQS9xdjBUT0RHWFBrcFI3Y1lKMTB3?=
 =?utf-8?B?MmZsUGlYOGMrbUtRbzVjZ04zMTZzNnNKaEFOSjNhZUw3MnpPL2M0NHJZbldS?=
 =?utf-8?B?ZWYvL0h4cHlxbCtxdzFrRXlqSGI2YjFXMmEvb1VFcjgzdG1ST3VzV3NLNDhW?=
 =?utf-8?B?Z29YTlpObXBYV0UzODJXSE43R043Z1JUa0xWN1NlS051ZzZ4QkhKeTFoM0ZC?=
 =?utf-8?B?bTlsWE5wczYwT1ZLVjNHVU5BWEg4RkJPb2FZNmo3TkFZY0FYZS92YjB3ZnFZ?=
 =?utf-8?B?L09pK1ZMcVlnbWRwZnQwaXpibDNlc3Fua3BRTEZ0N3FkU011aHNTVW1lMXNU?=
 =?utf-8?B?UW50YWFKQUwxUXVxZEpMM1dtVWJlQlVvQUdxZThiT1FybXpMZDZHTGJPTFI0?=
 =?utf-8?B?YVRZemk1OVgyNHhGaGhDekdhQ3lKNGNTb0tKSGVCaDlOcXhVUmQrR05RdlA2?=
 =?utf-8?B?SVZrSTlmV0FRNFNobmdIWWFNcXFhSGRvOVp1Z21OMFJZRjY1anlESjN3czIr?=
 =?utf-8?B?MWhnQWIrWEtJYnY0eEx6WGRuaERMWWFzM3c5OW1oKzRzSENpT1pKaVJpcnBm?=
 =?utf-8?B?enBQR09zclZXRzFCQVpiQ0tzTWh1VmczRjVyUlhXR1pnL3k1UTNtK3lLSzdS?=
 =?utf-8?B?YXVGVEM2RXVGTjhkb0ZQZ0ZQVWNxRjI4blRXRG5WWkMrZ2EzMTRYMlA1d29W?=
 =?utf-8?B?YUxwZkRCWjJEOTJ5MGVwZ1ZWZEwvNDFjeXdLUlBpc242RStCWmUvVlpRaFNJ?=
 =?utf-8?Q?Ke7E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTEzNlpLMlg4RktnM2l2blZzVVBiNzVRVG13ak1ZNkdwRU5ZSlBKTGdWSFF3?=
 =?utf-8?B?d09jSmJUdkpid251OUhrN3hmRTcvQTFEMDNmQmJVZnU1dWJDcGRoZzhwNVgv?=
 =?utf-8?B?L0JxbW1OdHIxWVV5TWlJTWFYcWs3b2s0SjRWemxacUZVbXRSTndsUS9rb3JD?=
 =?utf-8?B?ZHc2SFh4aG1ITElKdFBBNm5OZ3dGUGszTnYyZWJ1TVI0ckFtMHp0ZUg4bG1m?=
 =?utf-8?B?enlmaWhoblRyeUJXeGFBdnU1VitjS1hpdmJUZWNjeXVqYWlkVmpPaThFS2s0?=
 =?utf-8?B?S2pFcU44ZjU0a0VKcjh0dmJtNTRyb05NQm9JdGFBNVlkeHlLL0RHb09zOXor?=
 =?utf-8?B?OEVPNXpSZ2l1bFJPcU9saTVJdk8vSGxtNjhLQ0JmY3JyVVhMV3BXVXJpRmJX?=
 =?utf-8?B?MFpVbUtFZDJNZTRxVDZLdDREVGMxSzJjcitKbW5Lc1p6WXdJVnNzUzVpNkFo?=
 =?utf-8?B?aEFua3ZKOTZKeSt0clNZMVhERzRVM1lMb1RqUHpGUVZuMyt1blNkVVErS0ZN?=
 =?utf-8?B?QkpMa05pUEpkZGNYT3FyTTdOenJsWTU5aldpQkozaGdlUCtIcWFvbXkrWU9m?=
 =?utf-8?B?V1FWdVVOU1g2dlg4d0ZjRVpuK2puRFlLUGwwUGt4TTB6S0NmOUVCNDVOelZX?=
 =?utf-8?B?T0U2UHdRY2llZ1RlNnZld2pIQXZCbkdDaWQzcnRTN2tBK0tIUVJ6aERPaWlL?=
 =?utf-8?B?QVRkY01QamxqNGRiMHFKVkNYTytLeXV5Ri9VNWRMZUxKZG1qL0FoakRPa0Vy?=
 =?utf-8?B?bE1hc3hIeS9MVnNobkdpZ0FzOG1HWWhsMmVTbjNaTzVhQ0lOcW9yYWxRYS8v?=
 =?utf-8?B?d1BTTCtidDAzNCtyUEN5ck81b0Q3cDVzQzA0MjRtR2ZoNzhUbkdpbzdmZnBV?=
 =?utf-8?B?ZVNES3Mzd1ZOWkR1V0FqUHoyMXhRT2tkRkt2amlvM0RqSmh3MUh2bDlDQVc4?=
 =?utf-8?B?cWgxMlNvbEJJUlh2ZXlNbWZjWS83YmF6ZVAxYjErRUsrc3dBK3g2dTMvQXlD?=
 =?utf-8?B?T21wa0NxTytqQWRwV1VndXdvNWVSMWZxWTkvNkdVYmFicUlBUWJ0eVJoRGtX?=
 =?utf-8?B?L2Vwa000TWZpQnRVaGRVTHBGWlF3OUZoRjB2MDZKb1FaK1IrNlFpMGxsRDhS?=
 =?utf-8?B?ZFNjTHFOK2hINnViems1MnRWU0NIalRMWERheG1EcURYaHhYSklycUFvYkdH?=
 =?utf-8?B?OE53TnpybDgzNEtrOEhiKzZnZHQrZ25VRmtGeDdOYUM5Qi81aEpHZlo4MEZ6?=
 =?utf-8?B?aUs0Y3JyM3ZsSUp2VmZsS0hsemhmaHZrbHNBTjBVL3FwMUVwdzRqOU84aE1K?=
 =?utf-8?B?S20ybUlFbDBVemhPWURkUFpoZVNxTkRndTY4UVp0bmYrOVZsajB5YURFdGZU?=
 =?utf-8?B?UCsyZUJmK2NXZ3V5dm1yMkZyYVJCNUpXZE1KNUozM0Y4MGVmd2RtWGk4YmZE?=
 =?utf-8?B?a1pmS2xIUHJIUTdyUXdOUVdsZUtDSXluL3ZhanV5Y3ZSdHhKVjI0ZCtqWXE5?=
 =?utf-8?B?M1B6eG1KMFMzSENUbXhheW8wL0pVcUN1bzJlTXVmTGtGVDRNT0N1N1ZUK3dk?=
 =?utf-8?B?dnIzTndvQlV2T2lScS9ScUFLQVo4NGR5OEM1ZTJGRWdzOEJuY0FqV00rbHNq?=
 =?utf-8?B?N0d3Lzl3SnE2RW9SbldTbUZzZS93MGdOOENuNFJmT0hVNWNXaUsrbXhNN0lx?=
 =?utf-8?B?TW5yYS9RVHJtOUZrTzVseGwvTkd5ckpzellJNm15ZzNoM1lOQUE3QWE0a1dU?=
 =?utf-8?B?R3NwblE0bDQvRlJ6TGlBL29nVXhndVpFeExNQWU3ZE5TZUMyamE3dWE4Z3Rq?=
 =?utf-8?B?ZU1mV3U4bG1mWk5ialByK2dLMlFmWmRlRUVTUWcrLzJ6QzJQRUVHVE43ZTl5?=
 =?utf-8?B?UXNOK1kydWs3a0hvT2JMZWYrMU5oUHRjL092ejU0QjhpWHUzWlJjcDlaUzlZ?=
 =?utf-8?B?bmZTOHJRTEpzQy9MSHNQUEQ4d2x1RXUvTGp0MDFsZ0l3YWRsaGZCTWpMQ3VY?=
 =?utf-8?B?c3pCLzVPdUE0c29tQlNOb2dGZnYycTlVaUtjSjI1R0FTR0lHbVZvelJYZnpI?=
 =?utf-8?B?VFY1MXJ3R2FINS9XeExadGxXbFJEc29Va2xSYVlacXYxRktvQVF0TS91cktw?=
 =?utf-8?B?QXlzYlZXdG9yME9EbFp6aXJDZmd5MjhpQ3lnTGo1a0FQUnhRcnZOcGpCYk1B?=
 =?utf-8?B?dC95b0Exb2FneW0zMStiS2NFclM0RzlqODU5U3B1WkNEQm9rR0Q4YUxBeXNp?=
 =?utf-8?B?TDBLRXdWaTJNR28zckRNcU9KclpwcStRbVpNcEo2c0poWTFRT01zK2VYYmRr?=
 =?utf-8?B?MFVpVFhQTWovWnFOc3BOS0lPWWVFRlBJM3A3cTM3OU9KRWFzN0YweHNwWVls?=
 =?utf-8?Q?ObKGIJskleTqmw8U=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5923acb5-eff0-4d63-b053-08de5d1c85a6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:50:21.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmWCaTE8IS/ZlBFIwYqnjk9HUnOT4H9ofIdJ5Kk8proJCzL52lHeBR94rYbtAckV1cnDOcaKdDna5f6fOI/ihZpaL0uDFky1duAg51zeM+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB8892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_125028_526934_5907D49E 
X-CRM114-Status: GOOD (  27.32  )
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



On 1/26/26 10:58 AM, Will Deacon wrote:
> On Mon, Jan 26, 2026 at 09:55:06AM -0800, Yang Shi wrote:
>>
>> On 1/26/26 6:14 AM, Will Deacon wrote:
>>> On Thu, Jan 22, 2026 at 01:59:54PM -0800, Yang Shi wrote:
>>>> On 1/22/26 6:43 AM, Ryan Roberts wrote:
>>>>> On 21/01/2026 22:44, Yang Shi wrote:
>>>>>> On 1/21/26 9:23 AM, Ryan Roberts wrote:
>>>>> But it looks like all the higher level users will only ever unplug in the same
>>>>> granularity that was plugged in (I might be wrong but that's the sense I get).
>>>>>
>>>>> arm64 adds the constraint that it won't unplug any memory that was present at
>>>>> boot - see prevent_bootmem_remove_notifier().
>>>>>
>>>>> So in practice this is probably safe, though perhaps brittle.
>>>>>
>>>>> Some options:
>>>>>
>>>>>     - leave it as is and worry about it if/when something shifts and hits the
>>>>>       problem.
>>>> Seems like the most simple way :-)
>>>>
>>>>>     - Enhance prevent_bootmem_remove_notifier() to reject unplugging memory blocks
>>>>>       whose boundaries are within leaf mappings.
>>>> I don't quite get why we should enhance prevent_bootmem_remove_notifier().
>>>> If I read the code correctly, it just simply reject offline boot memory.
>>>> Offlining a single memory block is fine. If you check the boundaries there,
>>>> will it prevent from offlining a single memory block?
>>>>
>>>> I think you need enhance try_remove_memory(). But kernel may unmap linear
>>>> mapping by memory blocks if altmap is used. So you should need an extra page
>>>> table walk with the start and the size of unplugged dimm before removing the
>>>> memory to tell whether the boundaries are within leaf mappings or not IIUC.
>>>> Can it be done in arch_remove_memory()? It seems not because
>>>> arch_remove_memory() may be called on memory block granularity if altmap is
>>>> used.
>>>>
>>>>>     - For non-bbml2_noabort systems, map hotplug memory with a new flag to ensure
>>>>>       that leaf mappings are always <= memory_block_size_bytes(). For
>>>>>       bbml2_noabort, split at the block boundaries before doing the unmapping.
>>>> The linear mapping will be at most 128M (4K page size), it sounds sub
>>>> optimal IMHO.
>>>>
>>>>> Given I don't think this can happen in practice, probably the middle option is
>>>>> the best? There is no runtime impact and it will give us a warning if it ever
>>>>> does happen in future.
>>>>>
>>>>> What do you think?
>>>> I agree it can't happen in practice, so why not just take option #1 given
>>>> the complexity added by option #2?
>>> It still looks broken in the case that a region that was mapped with the
>>> contiguous bit is then unmapped. The sequence seems to iterate over
>>> each contiguous PTE, zapping the entry and doing the TLBI while the
>>> other entries in the contiguous range remain intact. I don't think
>>> that's sufficient to guarantee that you don't have stale TLB entries
>>> once you've finished processing the whole range.
>>>
>>> For example, imagine you have an L1 TLB that only supports 4k entries
>>> and an L2 TLB that supports 64k entries. Let's say that the contiguous
>>> range is mapped by pte0 ... pte15 and we've zapped and invalidated
>>> pte0 ... pte14. At that point, I think the hardware is permitted to use
>>> the last remaining contiguous pte (pte15) to allocate a 64k entry in the
>>> L2 TLB covering the whole range. A (speculative) walk via one of the
>>> virtual addresses translated by pte0 ... pte14 could then hit that entry
>>> and fill a 4k entry into the L1 TLB. So at the end of the sequence, you
>>> could presumably still access the first 60k of the range thanks to stale
>>> entries in the L1 TLB?
>> It is a little bit hard for me to understand how come a (speculative) walk
>> could happen when we reach here.
>>
>> Before we reach here, IIUC kernel has:
>>
>>   * offlined all the page blocks. It means they are freed and isolated from
>> buddy allocator, even pfn walk (for example, compaction) should not reach
>> them at all.
>>   * vmemmap has been eliminated. So no struct page available.
>>
>>  From kernel point of view, they are nonreachable now. Did I miss and/or
>> misunderstand something?
> I'm talking about hardware speculation. It's mapped as normal memory so
> the CPU can speculate from it. We can't really reason about the bounds
> of that, especially in a world with branch predictors and history-based
> prefetchers.

OK. If it could happen, I think the suggestions from you and Ryan should 
work IIUC:

Clear all the entries in the cont range, then invalidate TLB for the 
whole range.

I can come up with a patch or Ryan would like to take it?

Thanks,
Yang

>
> Will


