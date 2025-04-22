Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDB4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGLVkwt2jqk2ZHYyr1oqD3e55+KwgqHWl8hgqjDYMRk=; b=C2NcUtdDBt3M75hMLe3aGB3Idz
	O98Ip560Eg/JKb/N9bHDIHfU3lwEQqnOhTIfun2r8Wgu30HPfq0Y8OZVgeV7OhiVkCnh7sRaLAQvU
	b8zJpSzqMzYkw/pyOoT9ApVRohQWFxS+zgdoxGc+MvwvPCTi9Wy9SRxBVybE8Vyty49ZxkIJLs7jS
	YolB/Jczi3UskLG8cfK7DfGMmukkXtEdnhYqoK+f6kAJMHWg09juCETUmxMTZ8G8qPz/4fir3Dl11
	6S78E4i5UsUQQWPRFbsNKHJFB4tI+4AAzcJLz2DuzkCxMGZXnqc8AuVSYCcWDt2npv2syexY/y0Qf
	kuvCyX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EjG-00000007Wfm-2JQY;
	Tue, 22 Apr 2025 14:36:06 +0000
Received: from mail-vi1eur05on2070d.outbound.protection.outlook.com ([2a01:111:f403:2613::70d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dac-00000007HWN-43x5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:23:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umlNN9ptTGqMGEKBLNREF19L7NIzzf/VMa5j4WEjsmBlFhkGDFAl5wKZnAVkbHYyRCRtkQMdDK2uZzVBFmknjkXaDP3usEGdiOZ7jE0xhXu2CBMQWySYTlKdx1APEm0yswF9taizE1ToCr8NWGWC8nkFps+cMi7WnMsuzgimYwdK4Rs7PO3r8wJ9JiDGj3ed9QRm1PTnxb+6WoVSkqAoBxJudvWZkqSdvR8eFT8VgJfs+5MpIWsR+XhTvGt18toB09A1mSxT20ZdjxR/EwPkqBtWui/6nYLeUYp8YprQyL0rT9UdXmV1VwoZhqyYV7Z3SuExMWHl5myEhj95Pmq09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGLVkwt2jqk2ZHYyr1oqD3e55+KwgqHWl8hgqjDYMRk=;
 b=I9/nhs7y44V1YLh15Y9oaayVO+qnbz0DjhkeNOeO0ZtRbto2yNdJ/sFNHchH2Uj0gsFvSZcaUMYq79k4xjFjvugZwP8zkBT2br+cPjCOgRWLjbMj/VThnVvwWGzba9PcwqR+Hn47Yp/K/duZbR7RiI1bUh8QDHaxKfaJ1FADEZftdilLDZiZiEnjBRlnlrZpjnlqyUELkrmX6MmBb2vGv4bpNduH3c6PpmE5SNOIWQ7jCIkBxeg/NwLYnNa+ixMvbWA+KJ5DMi517FfZsTggsYWcp7Sow6fxCm2+ayw+Gf6CW0cAiGBvhYOxclfllwpI1F7yl9U7agVClnBQ+Tty+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGLVkwt2jqk2ZHYyr1oqD3e55+KwgqHWl8hgqjDYMRk=;
 b=CTbYP4H4y2WLFR7xrncVNG41yuD7j9nt4WtkPARKYVjWgpBkew5T/pz42CRKOeSDfLyBI1HAXxdHn3mEzfJJs20aFwSmeuKX11m1kHpN7y5TuxP/fwH9Hl+lj0UEAc9dF5xytAwLG/no990BOpbyfStCMISmJMIrmXkBTZDmYNHISrdCmbqsZXeJ7cW0kYsRY4MDewK3gLOwcn5dokYGas4IU9BSV94MKrGJgIDhcZEAGo2JopTTLLwYcBIk50XVqxnHjs/8gidJSjK2ODuKUN/eF//rjiYdY4uKOrY5xkkAKHLwo2hZA0ojcsP4pk+dVSQEB4MgYGz8LwlGhp2tnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DBAP195MB0809.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 13:23:03 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 13:23:03 +0000
Message-ID: <fc733432-40c9-4fda-994a-9668cb4dbecb@phytec.de>
Date: Tue, 22 Apr 2025 16:23:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for
 PHYTEC AM68x based hardware
To: Dominik Haller <d.haller@phytec.de>, robh@kernel.org, kristo@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vigneshr@ti.com, nm@ti.com,
 m-chawdhry@ti.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20250417125921.100580-1-d.haller@phytec.de>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20250417125921.100580-1-d.haller@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::10) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DBAP195MB0809:EE_
X-MS-Office365-Filtering-Correlation-Id: d77e477a-7ea2-4831-6218-08dd81a0cf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVF4ZmkwYjFvajdBb3VCTjlNam95MlFHTkN0SjlWSlZxWnZmcFFWZHZ2ZGdy?=
 =?utf-8?B?UHFTVGJHMXRxeHczdzg0dklHOCt0VVFxWEsxUWNjcGtTN1JSZ3R4ZDRIaWUw?=
 =?utf-8?B?WnNmRFpNUWp6WGZVNTFzTjN4UTFnendJWGlxTTF1RE5SZVNIL29IZWVkYnd2?=
 =?utf-8?B?eHMyUmZRdnJVMTZ0NXdVZk04bEVuaGlFbjVMSlNORGlnZHJ2UEdLR2NMS29X?=
 =?utf-8?B?eU1iaUxHUUoycDYzQ3M2UUdKYktZZEdqajJFaS9OZm4rTWhVUnR6REJHNUwv?=
 =?utf-8?B?UVlWdHB3WWtWWFRiTGFEanBHQnYybXIvQU5VSHF4SExlUitubmJNUXhsejZW?=
 =?utf-8?B?UTJmZU1BUmt3WThCMjlCMElYY2dkTVNzc3BCVlM5cDVqalp5RjVaQUlnTllL?=
 =?utf-8?B?ZWt5ZkJIOWhrYjg3ZjF4K2V3ZUtVN0VqMTNndnJjZjVLT3JDdU5BNEx2Q2Ja?=
 =?utf-8?B?MDJaUUZEdGNqY1lnaHNEMWdGUWtrR3d3cTVQeTZiUmZBM3NUblJiVlB4KzF2?=
 =?utf-8?B?MERjWjlHYnAvNGJqYnNMcXlTSTN5V21tamI4YlN6ZlhCSWZrSUJRK2pXYzh4?=
 =?utf-8?B?bHhJZzkzNmNSS253ZHlHcTJkd0tzYjVhV1RCV0NEU0dLM3pEYksrNy93WkZz?=
 =?utf-8?B?aGVXMmtvd2E5eHMvVm9kUVlseUhwcUxvVkFsNHhUdldDSmRvc3E1WlNJWmFL?=
 =?utf-8?B?bjRHL3ByT3NoOWUzYzZGZi83cXdwWFh6QStVSXROWmhsa2FBZ2R5em1QRFk3?=
 =?utf-8?B?aEEwcVp0U3JMaWZ4Ykl5aUg1U2s0RHpTazQzc0UzdHpJSm92c1RQbi94VWpt?=
 =?utf-8?B?QVZEbEtrMXFrUGZDNGRNQkJ6NzBrR1RsbTFnTTRQMWNqZFVJMUt3TjNiQVZ5?=
 =?utf-8?B?ZzU4V1JuUFBmUHhaLzF1eHgxMXhYRDZKYUFubmNkNjRxTXAyMDN6U2FPZnRM?=
 =?utf-8?B?WFl0a2EvQjBZaSt0a0JLMVBHalkySXdzWmNtRFFIb0RsLzkxNFBZeFVMdCty?=
 =?utf-8?B?RlRsMG1ZTkZHM3FOaTNKdkwySU5GSkdBcUFPaXJYZGJ3OXMxbFJSUG1nMVda?=
 =?utf-8?B?SHQ3b3ZoekQzbFlGbW5rSlZENjFETnFyNjJ6TXBGZGlOMTYwYk9mYTBORnFy?=
 =?utf-8?B?eHlaNzYwa0c0M1ZLcFRZbWxFTnpmeWpDU2F6dU1RUlRmOWpFeUR3RTZmZEVS?=
 =?utf-8?B?RGk2R1hleTlYVDlYNXpGRTV2TjZTQUtKWkFaOURBd2NGRldRTzNOdlJVQWth?=
 =?utf-8?B?OERHWXVERkZabWRLQ0ExZ2FsZ083U0J5dWsycHI0ZElzU1E4MTM2M3NaSHRN?=
 =?utf-8?B?T1A5SkRhdXZlK0QySHBYY1d1WlhrNm1obUN1NXdXZ1o4ZjdMajcxWEJuVjFx?=
 =?utf-8?B?WWpzbVlFbFFIU2xtVjZrb1R2dWh3R0U5bzZWb0JKRlRycFNVSjFoRW9ibmZm?=
 =?utf-8?B?UUZkdFlUc1BDejE3dkNiQkVDZTNaWUl2bzdwREhueHEzL2FwandZNXVxMVRP?=
 =?utf-8?B?b01wb3ZwbE54dUpoYzdXanBLdWpMSDJCeUdycUxudXVVQTg5c1Q0U0R1Mzln?=
 =?utf-8?B?aGdsL1NXdzNQWjloSlAwZFl1S1VXVU1TNXVqbGp4WkYrTmxpK2VyRGNIcUNN?=
 =?utf-8?B?aDZ6elpES0crbWRVNTBhVDZabUQvOW54cXh4QWFLcnQ4dERKRWE0REI4U1RN?=
 =?utf-8?B?eEdRQ2tzc3E0S0hSUTltdHR0a3I1NFAzQWR4UjhiQVA1Q0pkTFhwSVNyS1JL?=
 =?utf-8?B?UkZnZVBqQVplRFNqdDlXY2tOT0ZzWUVJVURsTFF3T1YzTUw5M3dVZUIrUlJE?=
 =?utf-8?B?cUZNcjFlRm5PeDNnRDFpaXBUYWJXc3R6ckg5elF3dnNQSW44OGZNM1MzeHkx?=
 =?utf-8?B?cUNGOHBqdk5DYU00eU1OOTdBNEgyUmhoWFlabUpvRXRIcnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVNYW1TRHF6czFqdTJrVU1rZ0hpR2VPbFl1Z1NCb0RvRm9CdXh6cWttb1ho?=
 =?utf-8?B?aDREUGY2OGNWTEcyUWdTSHh1bUpNdFZuYUxMaW9vRVVMVWo4ZmJNMlpuVFhC?=
 =?utf-8?B?NjFDRWtzMXhaVmFtUUczMmkzWTlHSHZ2OUtVRXdSY1pCb3pMaUN2MUZBN1RH?=
 =?utf-8?B?NHhyTi9nRU42bXlNSmhoU2Y3NFhmbVl5N0ZlcjEzY0RySlpQWnFDMjM5L083?=
 =?utf-8?B?NXQrUzh6WlhIa3U2NjFxRTB4K0dIdHl3VXBGYnhmM3pXNExBUlNzZXE2NzhH?=
 =?utf-8?B?VVZZL3JkQ0U0YnNNcmJ2cUFpMy9hbUxUeVMrNzM3aGJTQWxsWXVGdzBRSHJh?=
 =?utf-8?B?T28yaVBqREs0eDNVMFRNNUx4SldEc0NIQWozQmFnVm53a0Q5SlJCUkdTMkZZ?=
 =?utf-8?B?QzAzRnVGZ1N0SkxnYnloNGtucm1kWnliaWoxOVIxdHFHMXNYVm5xU2JUdE9D?=
 =?utf-8?B?bjhXYTQweWkrY0Vqbk5BMEZUV2ZwTXc1MWRuajRWZnFyNUQ0cjJpaE5IYkNJ?=
 =?utf-8?B?N0JtWWpucURZZ0ExcVY2L0tqVDNyVk44b2d1a0k0alZKa3IxS2oxVEllYWcy?=
 =?utf-8?B?cUhlRFNWV0pSbFZIbFVsZHlrUFd5M2pLTlVBRDRnWFdqQWtNY20zVDdWaUl4?=
 =?utf-8?B?MGp5RzJQckEzYnNtWEpsK01JZ3BSbDBVVHdpOXpCZENtM1kyZ25kcHZXTHBi?=
 =?utf-8?B?Z0Q5Q0hBUEpnVW9mSVA5SDBTcXUwNWVCNjgveWJVV29XZGx4MExGbWpYSXVH?=
 =?utf-8?B?K2pFenJqb1FSdWxXMWVRbUo2YWZNSHFTL2ZmakVhK3oya3kyNWY3aG5waXpn?=
 =?utf-8?B?YTE1ZXprRFRRaFQ3cnJqQm54dHFTQzM1bG94QWM5ZFRWN3JuUFg2eFVPQ1hI?=
 =?utf-8?B?TGo0bjlKSEU2VkZHL29GbGNFYncvVXpyZ1k1c1cvd2NtTHkrWU5pdEZGdjAx?=
 =?utf-8?B?NFR3SVlaSFVyTzJiTllxbGd1dWIyTWpXSGp2YWpJeWFEWHVFRDJtUFI5Q3ZT?=
 =?utf-8?B?MVFrNmFydC9Ebi9iTFRmWGhyQUhmSTN5YXBWdVVFWkYxcHVIWDQrb0pGamZo?=
 =?utf-8?B?cGFXc0FHbWdRUXpHcnd2WndGZzR5UTdobkpvYXAwSTVaM0tqNEdUMjduZEl0?=
 =?utf-8?B?NWIyVVFHOW1qTHFsNlJTR3l2aW9QeW5jOUFYOVdzejdLYzFDWGJxcUdoQWxV?=
 =?utf-8?B?cUMwZDlraXYyWXJTM1BxN3A3SGNNL2pxTCtNUFRZNDlpNzM0RWJ0SmhLU0p4?=
 =?utf-8?B?L3ZFMjFKc0tJdkdhNStDRVdmQWFyTENFeURhTVZUcUJTZmxlWENzd1p4SFds?=
 =?utf-8?B?SEhBcDY3V1o4OGJERzc5NjRON1FZZXU5bmpOckdBTjJNOWpGOHBXVnhOWkVw?=
 =?utf-8?B?MWNhQUlXYjFjQ0pxaWRHemZsZE15dnR6dXJNdERRcHNndC8ySjdiZ2JpSVNv?=
 =?utf-8?B?UzdJS1MzaldYeVVOcU1SaHk0dkdIbmpjZC8rTGY3aTlZSTlDVngzbnI4cFU2?=
 =?utf-8?B?dDR1N3VVTWRoYWVUNFJjcFlFZHErSENLeTNZbERsUnU5L3A5K21meHVUWmNP?=
 =?utf-8?B?MENsUGRFV0ZabUxxanNDTk1VbEVaK0lqNmRuNEx1a0FrMmtzT0VhWktMZEdU?=
 =?utf-8?B?RUxKNXI0SHcwK1FqVEtHdTNSQkkvM21iZ2tQQ1BTQ3BGOUgvMHNYVkRrd2o4?=
 =?utf-8?B?dmlqOG1pU3h6WDJmSVIxaHN3VC84cXVNZGc2elJYbEdEKzV1R2gzRENvYllE?=
 =?utf-8?B?Uy9GZEphTnU3RkkrMU9zVW1xWnYrUjBWaUYwbldhN1NJcUxNQmZnOFB3VWdJ?=
 =?utf-8?B?UnV3UGJCdWREZ3VpQWFIQlduOXhMaDZVWWNwb1ZzdkE2NVNKZ3ZtUFVQU2hV?=
 =?utf-8?B?ekVFekdTMUVTZEl1cUdlSXROTVRQajV5c2p1NEhlS3I5R0MzTksvRWkxSUNK?=
 =?utf-8?B?Tkd6dTlyd3h5ZzZwSDhEalVCQTRsNkNVYVc0bFcrSVRKVGY4M0kyMjNpNHFu?=
 =?utf-8?B?blJJL1BHdHZGTVVuTE1SK2htUXdLV2ZCZXV3R1RYRXloQWxvdWV2aUVQcEFJ?=
 =?utf-8?B?OFNFSmZhbHNYWTQ2SXM0THVqcVpEZHRWaXNpSkdlNG80a1l5L1JwNXg3ckE4?=
 =?utf-8?Q?et4SqO7E7kXTZfDbFyOPqaElz?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d77e477a-7ea2-4831-6218-08dd81a0cf4f
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 13:23:03.0606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfDEMjpg42DP/eRsYc2p+JbZenpyAygrFz1bEwFL7HfPDHefUyp+nPG/cHRqwp9oLS6jQOWV0Di8FsBws5R9Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB0809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062307_012687_BE774650 
X-CRM114-Status: GOOD (  12.64  )
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

Am 17.04.25 um 15:59 schrieb Dominik Haller:
> Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
> and the phyBOARD-Izar carrier board.
> 
> Signed-off-by: Dominik Haller <d.haller@phytec.de>

Reviewed-by: Wadim Egorov <w.egorov@phytec.de>

> ---
> 
> Notes:
>      Changes in v3:
>      - reorganized compatibles into their own entry
>      
>      Changes in v2:
>      - no changes
> 
>   Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> index 18f155cd06c8..30631daf9a84 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -139,6 +139,13 @@ properties:
>                 - ti,j721s2-evm
>             - const: ti,j721s2
>   
> +      - description: K3 J721s2 SoC Phytec SoM based boards
> +        items:
> +          - enum:
> +              - phytec,am68-phyboard-izar
> +          - const: phytec,am68-phycore-som
> +          - const: ti,j721s2
> +
>         - description: K3 J722S SoC and Boards
>           items:
>             - enum:


