Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F2D262B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXci1HBjZfqO56lQ+8+kZYirwzcZqTf+QvI73r+MWe0=; b=hNvtrr6x2N3J0xmxnxl+CjQ5GA
	M3YnHOx3fB33PYdaNEHgfjNFqab8rg++U4i2jiZeCEOCKLDBAvu2ONmbvcCP5UgXhN+Q8bqPLh+53
	pU/RbCSwvH6QQJfWjbRNmwadTJS1A9SUoR6UTBlEZnK048Bmft8Rxx2fq9PITvH0KY6UP0k4tWqj1
	lu9FpynziUPjA2+t2nkeHPQnWAC+WF2e3u6doYCq3f7az2sbdp8VGKyliBG0hdGRFQI1OwM91SXed
	dC0Me4XthejcfM0cpgyYJw89kiRML7eydOsr2mDWx9b6u1C9G+WKGaey24ZUpD3qrWqQdJgY3oNIT
	9DJmqdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNkG-00000004lMS-1nJb;
	Wed, 21 Jan 2026 02:14:56 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNkD-00000004lLq-2ohV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPiQECitYujSO0vhmqhR6alndysvS2DyJDHT4rlS8SYuEZkMVbEnwMcyHj527+nyKzFAkkGnegSpk16kM1nzVCNezDLlA7snVKs+7eejvgFH2BzCseSM7hnT4tkl9twjzRNuFiHtIOSniITFSW/ZdaZcYL3WACyx/e3d9Kno6/cKCIPQoFdRi0UbX0qqMNigxc99sCbBRV0TtK2VZWyV3vqVb2pAYD6QI9xzHOXEg9zi1dIVnY6jn1ID0zxJ9M2XuuweQ5qp/lM+QIB76VAaS4qUg1xXadBFbFP4Wq4fmHHBnodFE4ku6iPfF64XlG+lzqxsi3cLq8mJ3HzjWdBCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXci1HBjZfqO56lQ+8+kZYirwzcZqTf+QvI73r+MWe0=;
 b=Fdu/IUOX7Cd1/CdYex1ZPF8Id8ISn8SiWsR+0MnVyfmMtTxdL6/vfXFL9tjHZMHdmKfH1JCrogBQiLlcQvs4xNfFeqn5n2S2Z2Bi9TYlbBK+dVLRzxgRTxQoy50cJPsAEO7aWdSpSY0SM6nlOVB13nTj9jR/QQLWsunOUgclnqkr2QxX6pw0NiyhUSqAJKiBCJXGhaEoHiM8/WMJ5Qduqy5NlNWe7XmMgw1oJZJCctZm5tQ0gTiSziNbLDqaqTGA2B9rKee8PbEI43uxd/4EwJhL+zFdB02tFLdFm3nb5lXLeX/hZat8KsrFByzok1zLMSIM3IBltFJ5V4gGn5NA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXci1HBjZfqO56lQ+8+kZYirwzcZqTf+QvI73r+MWe0=;
 b=ECjfCelga9/+kKI9dz4ILSjQVkZLyftRwuHyMKS+VUWwBvRIKo9l4hJDelQDZPvQXdDblTbUSFXr5jPotbDk2Q4oVCDTYUf4Wrm0GONU2b4C3EV6IW0L3ZFsve5rGP5b76vAhJfnLar7r5Si1yXn0vjfw+K5xdA3lbvZkmPf3vuAivyq9yZmfSYvt7yOjdDdv4oDjvLw2o+qdl16zLuiZTVBWE8mjs34XZdespLaiayHFjriBGp5oHRyVCIjBxrRzbJO224jXovsJ7bz0dTB03VrxKsKro8nJsma29xJov3wvzdJTU3rhHP0SUpq/oa0B1/5NUc3UgLO7MEIgYqQZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from CO6PR18MB4436.namprd18.prod.outlook.com (2603:10b6:303:138::16)
 by SA1PR18MB927677.namprd18.prod.outlook.com (2603:10b6:806:4be::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 21 Jan
 2026 02:14:47 +0000
Received: from CO6PR18MB4436.namprd18.prod.outlook.com
 ([fe80::d3e5:42d6:c423:a253]) by CO6PR18MB4436.namprd18.prod.outlook.com
 ([fe80::d3e5:42d6:c423:a253%5]) with mapi id 15.20.9542.006; Wed, 21 Jan 2026
 02:14:47 +0000
Message-ID: <95044497-a40e-494e-95b5-916141297287@axiado.com>
Date: Tue, 20 Jan 2026 18:14:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: axiado: Use lowercase hex
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251223152432.155299-2-krzysztof.kozlowski@oss.qualcomm.com>
 <5cc6b959-4424-4d34-a8b4-eeff237266e2@kernel.org>
Content-Language: en-US
From: Prasad Bolisetty <pbolisetty@axiado.com>
In-Reply-To: <5cc6b959-4424-4d34-a8b4-eeff237266e2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To CO6PR18MB4436.namprd18.prod.outlook.com
 (2603:10b6:303:138::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4436:EE_|SA1PR18MB927677:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c54043-53b4-4712-653b-08de5892d9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVFuT3U0bnBtVXJRYkxFbmRaa2kwTWE5STJ6WEFtNVdJMFlyT1IxNnExV016?=
 =?utf-8?B?dVZnamZmdGpOKy9oK3VxL0lkSlhTZVRvNDJXZmFHVWppUElFSXdvZmxpVG1B?=
 =?utf-8?B?MytKUnlBQ2lmYmkwVFBXUEU1L3pCY1pDY0k0cVNwbm9qSml2Sk5yemZmYWtC?=
 =?utf-8?B?SXE5R1VKb3JCMVdaWTU2NzdWeEtQMWRmZ1R6OE9ERE9uUEpSZXViSU0yZXcr?=
 =?utf-8?B?M0Yxb1BYTnNFSlJoK3U0UkFCTHdHandlSTlONXBibVRwc21zckY0a1pCNXc1?=
 =?utf-8?B?dEpERnMzbEV2SEJKMS9NM0IyYjRWWEhmSWtySnpqTGJ1UU1WWitYcHZWd1ZI?=
 =?utf-8?B?OE5aUTdzYkIrS0sxaVZURkkySlJzRVBsYjZ4cXF2OVEzYmJEVXJQVjJFeHJ0?=
 =?utf-8?B?enMxNEJjWmtQV1RzMWd6cVJjVUlHMnNHK0dBR2JsSndKcWoyVk9nQklnMTdV?=
 =?utf-8?B?QWRGOU1OT3d1T1JiU3QxQ24wNVg5aDdkQkJzVVFyNzcwUE9ZSUxtWGxjTzhy?=
 =?utf-8?B?SXd4VHpqMVFHaElna1AzQ0c2d2JjVWZhM2dlNG9BNFpQTWVZMGt4MjRKYXkv?=
 =?utf-8?B?T0JuUWUxS3hGbENIU2dEQk1Sa2xTNEdaYXFadytvYnkrWGFnMU1wKzVlZEFP?=
 =?utf-8?B?bXBRUkk5aisxRDJ2TExrUE1tQ1JHczRkVmh2RUFBeHU3bGlRV2JWem4wQlRE?=
 =?utf-8?B?Ui9sQzZsS3V3RkZlbmpPcWM2b1pvYVJScCtqZGt5Yk5WYUpiMUxxcmhTeE5Y?=
 =?utf-8?B?Q0hBdVVHbXE1bTBLT2YyU1d2dVJjVXBmeUlENlR6em9zUXRPR3hiVWVRUkRS?=
 =?utf-8?B?dE40Y2lvUzhkd1BnU2wwM3dXNVh0WHlEMlBWNTRlT0Myc3Z1aGFUQWVIV1Ir?=
 =?utf-8?B?Mmc1UE1jcGdZbStQZWVMR293VFRZdys1V25SUUhZeFRvRkRIR1lnRys4TVMx?=
 =?utf-8?B?cWM0UEw5c3NEaXFMeGY0ZlA5UUtJWG9xY0VDVTFFVlNQV2xrNHREajFOTTBu?=
 =?utf-8?B?VkptajlIcW1vbmhhMjZaSWNuZTFVTDdJeThOOUlHYW5ucS9qSXhmelllWVZ3?=
 =?utf-8?B?VmpwKzBXYkNQOHprRGplOHZIbEp1RjV5aFZEZ0V5NE11cFloS1FYeFlsRWJO?=
 =?utf-8?B?ZzVhR0swWjloNFJNTElkNXJVUUwvbzhyOU43b21XWHdzZ0FRSy9IVmJpY25n?=
 =?utf-8?B?dzM1dmMyMzhFMHJreFIwWjFUa2pzMENWZVFOMlhMM3FmNXZleTNocTViYmpR?=
 =?utf-8?B?VkpxcHRrbi95OE40cXRnZjJyWXFzWG9LK2w5NXZhMCtKL1VGbnYrVmloRHJQ?=
 =?utf-8?B?a1NCTmlEWFkvZW8wNkZORlZRYllyckpZd1lPU3ovQWMrVW1VcGV3czFvSEl2?=
 =?utf-8?B?RmpDMlhPRnVhSk9DQmprNzNGRkFVcUExTTd2OVdjTVlSZ29HS3dMQ0tiYWJR?=
 =?utf-8?B?a0VTZDB4ZnJ1US9abVhSdisrUGlaaW1XY2srTHRObjZnUVY3SnpMMlpqdk5k?=
 =?utf-8?B?MEN6TTFJdmxMRFhydnNoY3dFdVBFeWI5b3pSZEFjNVkwTUNwYUdleGR4NElj?=
 =?utf-8?B?UHNxM2x0UmdzSlR0M2RFdXQ2aHR0WkkrZFhYQm93VHJIaDA0RlgxNEl5cjJP?=
 =?utf-8?B?T3BVSUc3d0tDcjlORzZyQUNNcEZSM0RtUk8xK3FWaHF6b3hzY3VSbHJodkNG?=
 =?utf-8?B?TWhFK0VHWFNQNjMzYUlVck80RFhOZFBPYndaU1pnU3FQYnBEOWdSM0pHKzhX?=
 =?utf-8?B?OUtlcUEvZ2Z2aHNGUXN2NnJWNFNMVVJVbWpzQU5RNDhxUWIxNkZaaFBXbE9x?=
 =?utf-8?B?UTZLT0dOREJjR1pDRVROWlNrM3dWUDRJempCY2tKc080K2t5blJRNEw5Z2hy?=
 =?utf-8?B?cVpTTDZUNW1DWmh5bjNUSHd1VEJ3aDZRNXFJS0FQQUxzZ3JmVy8xY2l1aVVS?=
 =?utf-8?B?b3lWMEhVNjVpSWh5RjV4a29pNEVuVmJPQVY1MkdGRmM2UGttckhJYyt4OGcw?=
 =?utf-8?B?SjE3REpLeWVSTkllRVc0NjdXNkRaL2EzMmg1QUdweU5EOTg1dTErR05lNFdU?=
 =?utf-8?B?RkhZZkdPZDhucGVCVUh3cWcwZ21uVVhYV2JwYTNIeE9xbXBZNnRlR01DRCtx?=
 =?utf-8?Q?32VQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4436.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnM0WEFDdTFzMnJWZTNGb2JIamhrS2NsWC9tMVdocnExMFhiZUk3NmtNYW14?=
 =?utf-8?B?aUxhVE9PaTh4Y3UvWm1GNTlYNlhDZVlJZTQxTFo2NFU4K3VWb3NQK1hTSUc1?=
 =?utf-8?B?Umh1NXprVnVJUkhFU2l4YWZqV2wrYXJ1akpYUWtWdXJ2Q3JtVUp6WVRmU21p?=
 =?utf-8?B?QWh1UWxwdGRCOEk1dVRneTFUTjFuRUJsSzV5ODRNSitXNUpaSHF5TzIycjEz?=
 =?utf-8?B?MkU4dU4wMlVMMXpDVTRYQ3FzSURBLzBPbHNTOERvZUdSWFBZUkcxSFd0ZEpZ?=
 =?utf-8?B?OVJWWTBNZ0hUUHp5MWlBTHNrdVROYllSeG0vYWZmVnRISE00R0pNT2NENTA3?=
 =?utf-8?B?OG1CbitKNW1pYmpLZFlUakY1VnVRWDlFQzhqSERPMWJEdGoxN29ic2tOaFY5?=
 =?utf-8?B?cHF2azFVVHljc1hwSldXOWEwM3NzeDEwYU51WnNDVWVyTjNJYWVHZndLQkIv?=
 =?utf-8?B?SThvZ0F0NFpXd3lYbEtrMFhlY0FQczQ2bTExRm1XK0dtSUZhblBEenZ3WmVz?=
 =?utf-8?B?VkJ6VjJtYkdhRXphbllGVE9jaFNJSk5kV2haWTN4eTRYYXJoZ2l3Mk1nRkVx?=
 =?utf-8?B?MmJqZkxTZ2RzOFdpeENqSG9xa3MwZFhvU0pKMnZ0aGM4WDZZVy9YbXpHWmVL?=
 =?utf-8?B?Wko0eGE0dkJMSDF5cXlPNEg3VmZQREc2NGNWSUF4d2dkaEE3dTBrRXlXdlFR?=
 =?utf-8?B?aGFicWFSdytNbVZCNDBRYlJlUnBTT1JSVnEwMXpETzdoWjRZRHlGY20wRzJy?=
 =?utf-8?B?N05ESUNnM28wNU9GcUN1QWlOOE9FNCtsQ2NqcFdNZmlBL3hVbERmaFNGSUIv?=
 =?utf-8?B?K29pL2oxTW40cUkySlZ2NFpUOHEweE0zdlFWQTFhbTdpSzBMY0EwNnVoYWk1?=
 =?utf-8?B?THdOUzg1K0dsVUlWdDBub1B5elBPbzFmbWFDbkU0NCtiVGtQVGpUVHU5Y1Nx?=
 =?utf-8?B?andqQkwrZjN3VGFEenFJUGxtZG1ER3U4MFUrOVgwTXZka2oxMnpsUDluVmxr?=
 =?utf-8?B?QW5sZUZnb0RVbHdJQ2VielRXOG55ZFg4UUJ3YTZJNndrSjZldldQdXFjcjZG?=
 =?utf-8?B?c1pYZ1R6a2taRWFFQ3NiMkFxaU9oSFhlcmhtT0c1RjJQVVZTRktZT2FpdXI3?=
 =?utf-8?B?VzY0OXg0T29wNG5GeWRpT3hxYklqNkRrNUxwaVJYeEhBYXdCODlsUEkzTWl0?=
 =?utf-8?B?VmQ2WVFzUVljcTJQdFdNbFhZdmNRZlJHNkdoRnFKQ2dRMGZLSXBxZHBLekpI?=
 =?utf-8?B?cWlSU2hzRWR1cFlCalh5NENzRm54ZVFTSFRESk8weHkzc0RMWWtmN1lDNEJz?=
 =?utf-8?B?eGR2bnFEdmRTd0orZ3VGTENyMy9NRWVJbXhQV3BRMm8wd3Q4RllpTlA0Nk5I?=
 =?utf-8?B?TzZHQi9QUk8wM2Y5cjFIUGR5UVUvd3BzVUx1cFhXRXFBQXdBd0Z2S0xuMmZE?=
 =?utf-8?B?REpUNmJTcHF2QmF3UFlmeVhSeHZEenFqei9Dbit0RUN3OGw3QmFadEQ5Zkc0?=
 =?utf-8?B?dVJVd252djY4dVpjYWwvWS84OCt1ZXhQcktYRkk1UllnRy9uMnpTTW9Zd0Y4?=
 =?utf-8?B?OTE0OWNMdEZndnpzYnFaVmlGbkYzRzlkaWtzUml6MHRqWkNhRWx4c3BaRkpJ?=
 =?utf-8?B?Nk5jVlJic1ZtK3E3cm56eWpnWERhRHErTC9SY2VXVEVyellENUxPQ2d0UHNV?=
 =?utf-8?B?VTJwQmJoRUwvSVJVdnN3MGF1SXl0eFZxMkpGY3E4UlI4RXMzUlJQYnJvSmJS?=
 =?utf-8?B?WnhZbUpZMGZ2VmFZRzdCVGpYYU1pcmxmMWlWQlB5VzlMZldQNFNuZnV1TW5r?=
 =?utf-8?B?MWFscUhWYlpnU09hL0hEaFRXUTFRRktOeFFMZVNSOUpzK0JEb3VveWJkUDRY?=
 =?utf-8?B?NTVLNjk2R3ZWUGVBVnBCeVIyMHJLa0NqY0hURTJieHY2eTdXY2xDanNPaVhp?=
 =?utf-8?B?cmVwSnNrNzZ5VGRPOTdLUmUvS1VKRTJEempWTUhOMDl3NnBNdmdndFczaWVa?=
 =?utf-8?B?cmxTVXhFMXVTdWxMcHJIeUxFelRCeDdmbXcvNkpZaTRhQ2ZpaUtuWE5odUR2?=
 =?utf-8?B?NE92TzFVZnZzS1dPdHczVi91SEFmTlBMeUdNMWxsK0tKbG03Ty9zeWdkYVRI?=
 =?utf-8?B?Y0ZFZ09oZGxQUVFYSExmaVlTa2swSWR1Wnc0ZEtueU5CZlAwUjNBcWVBMlFm?=
 =?utf-8?B?STFGZGtmQmxLeGxMbzFybll2M1RvODFPK0crdk1USUpwZmlRWWs0U0ZmQ282?=
 =?utf-8?B?WkJSMWg0amNxZ3BBMEE2R0FpZWhyd1Z0VWphck5vR3VKZnpndk9WSUtSLzQ1?=
 =?utf-8?B?ZExrWGh1ZzNNdURtYU5QKzJELzlpN2NBNE9mbjYzZUlFb2lNOWk3UT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c54043-53b4-4712-653b-08de5892d9a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4436.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:14:47.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjKqYE4vrbLiUYrsUARJtWYLNwbmfRAMxJF3WZgkSatofpyfmCqgKq1xu7ZkZurz3XTwrYiTZT2tH0D+8wdjWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB927677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_181453_729191_4798F3C2 
X-CRM114-Status: GOOD (  11.34  )
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


On 1/12/2026 12:35 AM, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> On 23/12/2025 16:24, Krzysztof Kozlowski wrote:
>> The DTS code coding style expects lowercase hex for values and unit
>> addresses.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Patches done with sed, verified with comparing unflattened DTB and
>> dtx_diff.
>> ---
>>   arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
> Ping! Anyone in Axiado is handling patches?
>
> Best regards,
> Krzysztof

We are working on it and will update.



