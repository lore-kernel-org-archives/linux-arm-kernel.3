Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6424BCD37BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 20:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VyfSHD44nu84c6yJeGUPekuWX1/QX2fZVWDDrH3/Lg=; b=ox6BxAZ5n4E2AfTRIlYf8dzUE1
	H1RPukdt2N3KredxTSP5MGBB7I4DgoMEPBIh8HRDzyay88mhY5oQCiHfrW7T1T4UCPmiC7mDO6no4
	udrrubdEtoQv3TippAVTQmAk+aAwQqQHUOd0W/s5eN6W4frvmmkLKVHW4BWQkJ+yJqndyoSRbPszC
	KKLmhfqHjElGm4KfYTwru1NxWZa2jxxIGNBmYqKFsCOGcZx932nhvfw36WE3SZ/DXmRDnlBSrAGiQ
	QthhXFe4uwls+NmDpvF/DTHUuYaKHBDAv26Ts4VLvfaGEPf1BeinpgP81bAUs+1s8RBvyFGUaeZg8
	vcX6ckeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHNn-00000009ThE-0z5v;
	Wed, 12 Nov 2025 20:23:59 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJHNk-00000009TgT-3j2L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 20:23:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idU7rEwJyRqwZkPkqL+qXxiva53hTAgA1BOOQn46Z/o1G7w/Q+/WjmiH4f6CTsNxVo87K7DbOxt0SBsvlRYYm5AuQzaVFZ2BgByGR3YGUsgcAefeU6xVzoNO9+4vyxIWfXZfHij4FIt0TGFiAJJODlZbu07RUJK09xG2+0M+cztaF8NGGqhdvFHS7NUF1VC5SDAH4qadCXlNVSs8Bh7aiIqnk/xkwkawhfT9jJUMyh3IHxeJaGZp0nqfI3bdUkVldcmaQ4B6cyOuqE7WCBDuuY+bbAHb2YLabUK4Fpginfd0FSUbexRPCj26Pse0ATdfsTEmVg6xM83rDY8O7boB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VyfSHD44nu84c6yJeGUPekuWX1/QX2fZVWDDrH3/Lg=;
 b=geia66Ru7OPaik1B/vNVnBSXV5SpUIT6v6eFyLvmzbKV+qj845p8aU5d67nbq6X4vaGcv5nynBxDOUabQ/mjEB9Sau7FE8W9HyDwSTF4ZLADzYjocKedOOpjj9SeVVBe6br21I6ioMj9JyeTTSS2ktrJnzEaWnJSyDLiDlUFo6q8R6hSjm6Emf5OVRaDgZ9Nd63X1fUWrAEeEwlfHHG8RSP8JLqIPPVEOC8aMndABedtN7Ba9k8HTX6J5rGQnYA7QKzGuacz085UKFjYOcIMS+2998HFDCWr/pnbqdYJDEjGzGgyzD9ash3xHZvP14PoqO/S5Cu67qfre0Tfe+N6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VyfSHD44nu84c6yJeGUPekuWX1/QX2fZVWDDrH3/Lg=;
 b=rFdoNwVVJACbE0muoY6TdtUbZZso/YRNciEMeI+dg7Oev1FLvy940TRgn3UdLaQehKEcBL1nne1rkqvyZ2U1jGAzdRTBYz5GtuY12noiVJzCDcIiXnSqmwKW37XAkrk2i+JN5Ha+bf+TtNZukoviq23dwU45aY4IGMPBHAOJz6d1jPfpOBwvBkHISWTmfhtKTMRUJyCLp2Z/WnZ1ePI9WrzQ68vrFkktpN49Vv0TaNmTKSAxTkFq6tOt60kbpfx+1sbFR2xp4JmfYnF2cBZo1OkM0jyoPgIfAYUZAZH8NR0FothYTqnv7gt9QmG1zp8ffg1ouQq5g/OquQTiFM2eSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH7PR12MB5620.namprd12.prod.outlook.com (2603:10b6:510:137::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 20:23:51 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9275.015; Wed, 12 Nov 2025
 20:23:51 +0000
Message-ID: <2d1bc3de-8d4d-47e4-8f3b-618881128b1d@nvidia.com>
Date: Wed, 12 Nov 2025 12:23:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] ACPI / PPTT: Find cache level by cache-id
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-5-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251107123450.664001-5-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH7PR12MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: 51170a30-85b6-4a8b-9bde-08de222964ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUdXanhOSm94Q1M4bC9DbWJjS2Y5MGVJcjhtMDJ5b21KMHU3eHliS0RZRWdy?=
 =?utf-8?B?Y1ZCUEtRQXdwUFEzZFp6a1ZPZXZUUWJoSTJkNXdrQ29FNkZZOVhsRXoyYWx6?=
 =?utf-8?B?TlR2eDFHUzdya2VsNGFnbmVQNE9GdnducXpOZWNzNWUyWW05VVd3VUlzeW04?=
 =?utf-8?B?RjZsLytCdEViRjBhVFQ2Y09vVXFIbldlaTdNQnQvQUloR0NTYm9aZFhrWlJO?=
 =?utf-8?B?RnVEUER6dXFqY2VLOWxmSk5hNEMyMnQzcUN4anBxcktrRjVuQTlEMU0xMXp4?=
 =?utf-8?B?RDgybVMwU2oyVTlVaERzdFVEdThxL0h1bU5FOCtRbnhkbjRaZWl5S3hSckpp?=
 =?utf-8?B?TlVveFJNNHFST3NLdThDS0E2Y2t1eW1hazhIaEtwcTZYTm1SSnVyMVEzN0xs?=
 =?utf-8?B?RUcxdHp1M3BrM1E3aGNndis4R2ZHOE9RRHhTeTBya3pMdnZDYVdtZnhvUUVK?=
 =?utf-8?B?M3dyTFJjOW1kaHJNdU1JMnY5SGVvUUpTRm5uYWIrb0dIeHNnbEoxczA2ZlZP?=
 =?utf-8?B?M0gwNWxTNzMxQzY3L0xhL0ZCTXBLTGtIZzVsKzlVVUNRMHNFbTA4RUVETjV0?=
 =?utf-8?B?SG9ic2g0RENPOXNaTlQwMlRPQzRiODZ2ZUlRZDBEem1UanNSM3d0Z0RqU2hB?=
 =?utf-8?B?RUtSZXlIOXcyUVUvRCtCK2ZKTXNKUkNvMjRDdjI0Vko0R3NHMzNDTlo5cjhr?=
 =?utf-8?B?RnhMRkMxRDlhdk5DOFd1d2tJM0lLa0R0V3BFMElTeXRVb09Ja280VWVtS3RE?=
 =?utf-8?B?YUVsZ1J3U3YwSk5jODIyR0t5OU43UU9ZRHlTaVBVR0VrT1JwTXRLSllXa09X?=
 =?utf-8?B?aThBb21KOGlTaWY0ci8rVjMwUXpXMjFqRlBKTXpGUnRzMllSVkRRL21yTWpM?=
 =?utf-8?B?RlQzYU5XNmtnaUJyUjZ6dGJMYXh4TVVpNU1nRkduVVhHNDBnSjFWMDAyYm5t?=
 =?utf-8?B?ZWNWRkdNdGFMTTNEeXBtWGRwZ00rTnArZEJSMVY1NDc2WmNERC9GRUhGcUZQ?=
 =?utf-8?B?WWp2UEI2bGJmMUY3UmdhbjJZUEk3WVIxNHA5Z21JNzBTbVo2Y2JQanFmM3hQ?=
 =?utf-8?B?eGFXeHIwbkpvUDJQYXJsKzBQWlVvZkphbmx3U2Fnb2xmSXhXam1xZXZsWGY3?=
 =?utf-8?B?R2xURUQydTRBU3pqRnNZcG9RVHprVU9BbHVFR3hnd3cxQWc0WG9zNDNsSGFq?=
 =?utf-8?B?MTk0Z2xPN2R4eGlLUCtXTlp5Z0FDT2pVRk1hQU80SFFaR1hLbHMvaU1BTi9Q?=
 =?utf-8?B?ZGZnOFVSREE2ZlpzbHd2VFo5aEdUZ0hGbFh5REhVd3VNQlE0Mmp0RENKMjRX?=
 =?utf-8?B?R2wzcGJPK2xLd3Mya1ZYQjd1SFhsYjhJU1JKaktUQm9KVWFyTjZBRFhrNm9n?=
 =?utf-8?B?NnhvMGJ2YWt0ZXJmVlJIcS9rWm9UR1REVDFWZzNMK1hCRnNWdWpvRTJnb0hY?=
 =?utf-8?B?UnJZcGN0cDRYYUhzUWQvNHd4NFBDQ1BWMjFhUVU5NXFuSUh5Zjl6TDcxWEZr?=
 =?utf-8?B?SXlxRGdLSWlDZlNUS296aEN6NGc3SE5PSEJqMm0zTlBNQXo4MFdVSXBFM25r?=
 =?utf-8?B?ZEV3ZjhXSTNacGJYbFlxZ3RSV2JnYzBnNHhIaHJhTjJMWVd2S0s4YTU4TFcz?=
 =?utf-8?B?YkhuaXk5RTNIUzJLR0E3d3pUUytaanhEWGZIZ3BFVEhDMm1UNTVoM0VBbm9X?=
 =?utf-8?B?eVRCaGN6QU1BcHM0b2xkYzhHbmFWTWtWSzdCK0QxWnBSbmErMDY0WW9WT1FH?=
 =?utf-8?B?dkpuSDQyVmM1TUNRT0tQSnJDRmdLcmw1R3dneDFESSsvUVBrTFNXNncrb0p4?=
 =?utf-8?B?enRONmQyUUFuODVETEE5eU1YZFJKVFJVWExmTkl3eHE3K2hPS1ZRVEx4WVVp?=
 =?utf-8?B?cXM1R0xreTZrRmlSd0ZTd2N1bzhGeWxESnhoZm9wN3V4TkZndkgvWUpjTTFt?=
 =?utf-8?Q?gGLHIO0fTC4eGJDxapLb6fkNo/6fpru1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU5DbFVEeUpaSitHRDAxNUh1UU80czcvVFlZTVQwRmFrcEpnRmM3UUlIcjFB?=
 =?utf-8?B?bkVzeWZrdmRXZUtZcWYrME5NN09OcmlEcXUrUDZiTGFBdmhLS2dHZTlJOWYz?=
 =?utf-8?B?N2h0dnBRWGMvdmY1RFRBdU9UUXIyMXpxZXZTR3pBdFdiUkovcHd4R1dtMXpN?=
 =?utf-8?B?NTFUY1FhRnEvWm9xQXBrWGNSU3dNWHAzUDJ1bHlZd0NydENKUHBpTERCeUxq?=
 =?utf-8?B?eEZ5RWYrWlVYTUF0Mm5VdmZibG9BOGNwTHlTZkl3MzN5VnJmdmZ1QU15SzQr?=
 =?utf-8?B?V2EvUjZGOEgvWXZTTC92QUhxTkdVWjZ1SVpEMWNwUnZ5a2Y3cXVDeEFLaFBP?=
 =?utf-8?B?Uk0yaVphSXhGWTBJOHZqV3haUHRBREo5QUpCeHl6aVhONXhXbEdIcFI0QlR3?=
 =?utf-8?B?MjY4ZzlpMjJxSHNCd01oRXNyV3dTcktKUGZ1Z2tMMkJqSlhwVUtmMGZxN0lk?=
 =?utf-8?B?cUFRdDdYKzRROTFJTTRETFZCWjBxdU9PUUNsVjY4VmpsTVFKeStrZDk0RHZS?=
 =?utf-8?B?Qzl0RjBkN0NNd0g1SHJmQzRiaTZPazAyNFVYdmlQcGdoYW9ZQ1lOWExsNzRj?=
 =?utf-8?B?aUExNUxCY291YlM4d05lbENZWHUvMEVVbDZhc09RdThoREY0SG8wWHAwaDJH?=
 =?utf-8?B?QjNxLy9DL3EzK3NYSEtUK2Vkd2NpRlVXTUpXaVQ0eFpicko2cU9wQUhzZE13?=
 =?utf-8?B?aU5iVHFkanUwanZ4RkcxY0phcUIzOG5XcDBzeWQwV0ZHV0dGRGZ5QzdXOVJH?=
 =?utf-8?B?ZXNqMGUxR1BwZzVRMlY3K2Q5Z1ZsbC9UUVRzRTlLNXpjNnRoNEowYU40Qmlh?=
 =?utf-8?B?NnRsQ0phVWdKRXFmdkswS1FUdnozT1d1dE9iSFROWXNhT2NnRXR1SDAwMlFL?=
 =?utf-8?B?OXozaEFXMmFXWi94Y0dObTFUcHFtUDlJRnNvOWJIOGdOVXo2d3JpeTZGYlZL?=
 =?utf-8?B?a0JZSTdLNWZvckJodzB4MklRQ2I1ek05UFhZNzZ5eVErWFA3aVJRY1dsdjlD?=
 =?utf-8?B?L1YrNkpGVm9ROFRyWUZXcGpEVHlGYzZvaUdOdmtRZmhxN3hyWkQzZTFzVWNq?=
 =?utf-8?B?QmR5N2lzc054OGV4TlBZSG1EWWN5Ui9uZ1RTN2xMUmNNN2NUV2NZNFZXSzll?=
 =?utf-8?B?ZFJSQjdiMmo3elVmcks0ekoxdm50aGRtZzVoa1VHSDl6RklPOFluY2NsNWpK?=
 =?utf-8?B?YzcydisxTlMzZGQ5OEkwaDhZT2Frd2pTR1VrVG51VVZPTjZlZVp1NG9RYXBo?=
 =?utf-8?B?NDliZkpab2IrcnpNN3RoK1pxMmtlaEZnOUdFQnlleWlLSmNLTlNSUm42N1Q3?=
 =?utf-8?B?c2JDek91cGhOR0dCM2l0eVhJTUJ3bWp0Vjk0a3dranJRaTJPc1N2cklEenZ1?=
 =?utf-8?B?RUhYaFFUWXV1dklCUUEybnJ6akh2bHBVdmIrUEx4ZEYwNXlLUmNxT0RsbzMz?=
 =?utf-8?B?UjVoUGxQcXFDMnQ5RE9HT3ZYY3M3WGlIZllUNEZPby9iOEdQdHMwNXUvQXhL?=
 =?utf-8?B?RXRrOG9MQWNxcXpqdERtc2h4SzdCUnR0UHliWEU3ajlCMWM3M3VWQXBDZFN1?=
 =?utf-8?B?R00yTmZZWXY2UjN3YUhla1dvbGJsOWlidTBwbXBoejNVR2VPci9rZHVVc0tM?=
 =?utf-8?B?aTIyYkpRZEkrNWw5WnNWRllodmlvR0VENkNQQ0ZLN1I0WlJWUDgxMk9Bd3Rr?=
 =?utf-8?B?TmR4SGtsOWZxR3RPYzMrUUE0dkJuTWFQalg1RmZIVEtqY2xETzNGemg3OEZW?=
 =?utf-8?B?MW82SkZFNTVJSldvNFVxU3M5TU5SRHZCR0FMK2JYc00wa3c3NERlUVNGd205?=
 =?utf-8?B?bmcwemYwZW95ZVZQOEFNMjJNWXYrbVN6N0pTK3ZIMWhKZHphNnlHYXdDaGxj?=
 =?utf-8?B?K1A5U2ZIcUdGcFFraGtFZGxVakFxVXg5QTR2UDIwdk0xTDlHM2lVcWlTYkRi?=
 =?utf-8?B?K3pQNSsvTmlqZXVqenRGc2pramlVZ3VSb3p3bVEwR2ptaDBTL0hOYWRTY1dQ?=
 =?utf-8?B?NzdiSXpEM0FlbGRzbGhaUXFnRkVzMHgrVmozNEZuVGhIa1NNQUdjbzFuS2Qw?=
 =?utf-8?B?MzVvdVlzczNpbGhRMXJydTgxdWtoSW5US1JBZHlRVzRucElkNEFkTWFGdng1?=
 =?utf-8?Q?/duEwMY+w0z2LSGbNjLYWVknx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51170a30-85b6-4a8b-9bde-08de222964ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:23:51.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvmUHa8HDYbymJjKkZfqdHQkrmhjVreoO6VSC23v+GcT45cwWAcViAAxI045IXBB7DGVnAATZ4jHJKWdkSJa7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_122356_938561_C611C68A 
X-CRM114-Status: GOOD (  10.17  )
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



On 11/7/25 04:34, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> The MPAM table identifies caches by id. The MPAM driver also wants to know
> the cache level to determine if the platform is of the shape that can be
> managed via resctrl. Cacheinfo has this information, but only for CPUs that
> are online.
> 
> Waiting for all CPUs to come online is a problem for platforms where
> CPUs are brought online late by user-space.
> 
> Add a helper that walks every possible cache, until it finds the one
> identified by cache-id, then return the level.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
Tested-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

