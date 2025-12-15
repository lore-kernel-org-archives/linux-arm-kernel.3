Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F13D5B841
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rYdHbQQ8eVHdDXWCdQQSzlKAz617YGYpmzM6jq7tPk=; b=CZyjSPOHcZ7ILgIH/Wp3j4JGcO
	+xDfRR1OjNOARERCgvP60xOKU5soSgofqWmiESeH5VlMwF+H+cqI6BV1DAsSTXPoWqxjWGS84ZM5D
	CNCRZBkTJBLq+0RQJXBL6eBdRvVorYH878xRhYPwbb6F9y1hkJZt9YcBxye3mvYZIVoPeJAdGV/Kv
	TJ4b8e5DTAaOXrmuDNAzspOrDdNaGCx0i/hhLH7OCURlIhrV27A7diMBmABGTb1zRuHuVZKF1gNh9
	GVT4Bn+ooJNAPipSdQV8Fj/4Q1R18RcJgZFn7KJHiMQy3QM3R/8KnCNuE4MoUN3ep01wknGYAz6gA
	/Wpq3ZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAOa-00000003tNp-2IXW;
	Mon, 15 Dec 2025 15:21:56 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAOX-00000003tNV-38Yk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:21:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NttiCZS5BMpCUDhdwwJGblXpDtxXijZx2/csZOMihDq+j0N/v+iIDKsi98Fzj64XLdxTaqRHxKjkSaP6bsK1Ca4o7UonWaG6tmrXUE6aDSArHL/RgtQvj5I5a/h5HJc9KwWHvID9MiHhSCbOO+XW6+AZZz7B/AP6x4tgJKtSfZGYRCdpML3t+tCU1JiVQdMDlrelvSFwCvtVtwbBj55rl1Y5hOkCw5IMei6oNbAr2w58gdisUdmbnK3bOp8lYCT7XbuphsH4bmdwAIBdYvM9liPPFTliuB4tH+OmG3DAgBxkN4FRJpsr3a5wmAlT7bKdYjrCKSK3bKbgPdHFVF7gLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rYdHbQQ8eVHdDXWCdQQSzlKAz617YGYpmzM6jq7tPk=;
 b=Z/o4mCe4nw9QdUC7TMTUcWsHVf3iWpBC3dgvReP4QwmYZL1a/kFvW6tW9MWQmo+phjDlTjRA/8cPnS71Ojv1GdNYJuYylWyyE9k4bFqj769zMAL3c0YhJ0V4TugoziHOwEQR68eUXNWUzQckR8NZ2ybY3SB87h3+C7mVbXlV2eFQwn8sCnV3R2HBKtCl7+KBl0Ixgy/YdC9ThPmhcbxJXMujaPqcPbnDzbQ/vRiYKo6nIzHZ5TAzhIYDWOBUpS1bu26Y+zEolk+ywyiA9c6Yb9fCe40tE0cNuIS9sbWAIfLtW49eTtNxfGyvyuiGuf9i1lKRrRlMtWiFB2XQWvKXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rYdHbQQ8eVHdDXWCdQQSzlKAz617YGYpmzM6jq7tPk=;
 b=NxQfYQwpEgS2xBVO9OSnVAst7kgwl3WUh8GqpH0nmQUAI0ICJOFr431YOHYPxuwxpUsWogvM9W18bJGVyQTPgJbq9Haqr0r3zVECfitX0d6uPHpqadUhZ6NpHLw/4/Uk4FPNVzMA2UuPSBy28UutQ3IIxdHbiliAVNC+HPK/Vr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by LV9PR12MB9784.namprd12.prod.outlook.com (2603:10b6:408:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:21:47 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 15:21:47 +0000
Message-ID: <db79cd4a-548d-46f1-b498-aac82ca53010@amd.com>
Date: Mon, 15 Dec 2025 16:21:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "arm64: zynqmp: Add an OP-TEE node to the device
 tree"
To: Tomas Melin <tomas.melin@vaisala.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251125-revert-zynqmp-optee-v1-1-d2ce4c0fcaf6@vaisala.com>
 <88b72343-e86f-4b13-adcc-ba09683eb898@amd.com>
 <199062ba-9a0d-40ae-ac8c-0fbed5615cf8@vaisala.com>
 <3654c600-553f-429a-8bec-1add7f6eb5c6@vaisala.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <3654c600-553f-429a-8bec-1add7f6eb5c6@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::21) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|LV9PR12MB9784:EE_
X-MS-Office365-Filtering-Correlation-Id: 6621a01f-66fe-4916-69ae-08de3beda971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnRCTi9QdFRoNTV6YVIzVHR2WlBxNGZqdTQ4Z1RaVTcxYW1razVDZDFYLzBt?=
 =?utf-8?B?cmlYUGdwdlYxeWFQZUlOSGV6ZHJsTkdQbFRPZFhiK2pvQmFlYXU2ME9Rd0h1?=
 =?utf-8?B?TEdiUVB5emJndkh6VTVCN2hDbnJ6Z1FlNHNrV2oxTDBJSmdBQitPZEVUeUVB?=
 =?utf-8?B?UUNOdkFrUU1NWWJtYzhvQWErQ05CVi91aU8rTUY2L2RrS2piLzgrQzRydGtT?=
 =?utf-8?B?VDNkV1g0Z2V5TVVqQkEzWW5XNUdtSzRabnE5TXlpVndtelNVWWxJSHYvNE5B?=
 =?utf-8?B?OGhqclhUaDZad2NUK0dOd3RQSmMyU0NoVEE5NlRURW51MFoxZHdnbDZaTUNs?=
 =?utf-8?B?elNheTNDdmNzL2ltamtTZnFMcml5RnV3T0U0VXBzaFlOSVlZelNhY3lONU9I?=
 =?utf-8?B?UmhMdk9FdlFxNnBSb2J0ZzJIR3VpNm9BZ29oWnRsYzBsOXZTUE9YWmpWTy8x?=
 =?utf-8?B?VkFNL012a1FCRkR6cEx0L1pTL3BzNG5GS0pYS2pUcVBIWGxtam5nZzBpS2hJ?=
 =?utf-8?B?Z3ovMk81WUNobWhyNmFNdkVoeHExeVhYNHFnb3pXVi9iaEgrY0grRVhnT05s?=
 =?utf-8?B?bFcrTVRRNFpoRm5Gc25hRjRTN2FabnpPaW1PbVhXQjUzYWxnaUZwLzJXNjRF?=
 =?utf-8?B?NEZuSDZtaUJMc0FLQ2habTJxemxOWHRLL2cxdDl1cFJGNnJjSGpIditFZkta?=
 =?utf-8?B?a0p3OVJxbG9rMk5QbHJWYjBTSVlNUXdzVlgyaTY4YTJaeERqMlpwVkpXZktM?=
 =?utf-8?B?R2FrOXZxdjdpb3FJVFhSdkVRcXk4ekllRDdxdDkxTmxKTDJYcXJFTDEvcUNY?=
 =?utf-8?B?TU9ta0QvY0M4Mnp1R1huZEpUNmdxajJjVkkzS3NIUUZvRjRnWkZYdnZ1NzEw?=
 =?utf-8?B?dGNZTCs4V2JRVXJTanBZTDR5SGtwenMwQ3JsZ2tqTmJDaTBaZ2h3VUppSGxu?=
 =?utf-8?B?RGlGOGcraGpKTzhia1U2aVJ2T0tqS2treVA0Ri9FZVgyL0dPNjdVWVFScm02?=
 =?utf-8?B?cjNhWFhtZlVHSHBTbW12VndaYzRYdTQ3M1NqbHZtSERlMHY2Z050cEVCODdj?=
 =?utf-8?B?ejJWRVQ0SXZOcHJBM1dPQ1MvcGNGTVFUc0RjeU1TV2h3elVGQTZGS3J5OXQy?=
 =?utf-8?B?NTJ1QjNSNm45RHo4VmEzcmNkWS85TlVWT010RmxzNGxpRjc1Ymh0TUJWbXlj?=
 =?utf-8?B?ZDJUbFR6NlNvS002T1p1eTBKSjdxLzd2RHAwdURXcXFkajRUN3M2c3JDMnpD?=
 =?utf-8?B?U25La2ppbXRseGxqU2pVellSRGVZTEdaL21OZHV0MkZhbWo5eUhXZTdoVDF5?=
 =?utf-8?B?Z1pCOFJxYlFDMEZlQkF0aGNkNU5PQ0JleXhrdDQrck5kN2s5eHFNVlRnM0ZS?=
 =?utf-8?B?dHhpaTNiKzhLaXRFOWh6Mi9rbzFtZ2svK1gzb2t1eUp1WXFKbHRFczZUcDZV?=
 =?utf-8?B?M0duSVd6cUVGZGlha0E2eVh4c1FWaXJuUUVVYzZQUndwR01LT1QxOVRsUXFY?=
 =?utf-8?B?Vy9KSmVIN2ZoRmtlclNjeXBGUmdYNmd5MFgzWDVJSFBNM05RQmxmK2tWRHRC?=
 =?utf-8?B?Y0tGaVhvc1ZMb2k0S2gvYkZzRXJnWUcvTG1OOCthL0JkL0lpTkZFTm1yMlJ1?=
 =?utf-8?B?MXpkRG96SVhVdG9FV0RpbkNscTdITVN3VVlxRll2QWtmYThwZXFJS09IVjlW?=
 =?utf-8?B?bUFZWS9KZDZmd0NKYTZMK1EvOFJEb0lFOVVYMkZFeGxHb01PUlA5aDZXOTht?=
 =?utf-8?B?R0hhNXBWOW9VYjlqclI1S3B0enZIMjJqTGJYMXNJNGpEZm8wcUxJaXVhYmZR?=
 =?utf-8?B?Z2lDbExMN05iRkhxaEgvZmtVbUYxR2xmZjU3QnRTVFVtSktFZW9SQXF4dnlC?=
 =?utf-8?B?c0FQYXdBN3czWkxITG9lbGhON0RydC9PSWMzeWVGcG90UFFxQ1pIUnNZVXpS?=
 =?utf-8?Q?dk8S17GnkVAjsy6jgMrrFMrjLL0BG5/f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHQyU0Y1UFRLK3hZbFc0cWFuUXRmNHVTbmtZa2Fsb2lNekx0UzlFUjBpM2ZB?=
 =?utf-8?B?eURpQXN2a05YUEFGME5tMG1kWGl2dVJIU3JmOG1SeDFldG82cHBaZmg2Q3Ux?=
 =?utf-8?B?VUtVZ1RlTENHZGxNSnF4Unpnd0JjekVkZU5XYTlxajR1cFhlVjlFd1FpcmJG?=
 =?utf-8?B?RFVWTGxCbCs3VlJhSzl0cFBwcUJoZW5rQVRpSVZtU3Vaazd0bk5vRks1d0Zr?=
 =?utf-8?B?ak9rMFhVR1prTnIwaThyOG5jc2hxRXR1QUNsK0JqTmV5TmhDOWFDV3RSUW5X?=
 =?utf-8?B?MzN1Tldsd3RvT0JrOTVyQ1h1TDV1K1hwMGI5NFBqb1dJWVlBYXIxZDJaTGM0?=
 =?utf-8?B?aFJYcFdEVzdYOVpieC9DU2JMWU50eXNvdlZCWFo3V0Ryd0p4TDJrazNLOFQ3?=
 =?utf-8?B?YVA2clZtVXlzckhWTDhmQTMwYnI5dTJIZzJHVzlJbGloVGJSTk1Td0gvK2FG?=
 =?utf-8?B?OXFLYUxhR09XY1FSbkcyeGdXOHpkZlEzTmpYSXlHbXBpVGRENTRlUFdUYmpP?=
 =?utf-8?B?SUhJd0tUZEphOE9QUFlkWjRlQ2thLytKVmE3ODBrMkQvVTVVUUYxTmdUNnVZ?=
 =?utf-8?B?R1QwTHJFWVB2QkJZOG82ZWpneXNBczNCSTR3TGZGdlFCYUN0ZitHSHJZcDZs?=
 =?utf-8?B?V2xNSzF0emd6eUVjWDJCcmNWaklxVXZmTkxHby80ZjBLWmJLem1DTHliQThq?=
 =?utf-8?B?U0gwT3cxb3FMeEpnaUtsdXdiSTRnb213MjNuN2FWRW40YXdVd1RJUFV3TWMz?=
 =?utf-8?B?Q0pjRGdDaHFFUFNpbkRkdUdUZmwzWlVxcDUvMjFNMUZjaVR0VDJZdHdVSzFu?=
 =?utf-8?B?WGZUb05CZEQ2UnE1cU1jNDJjbGVMdm0vRVFnNWdWRFZYSEJTTVBUTlZnNklL?=
 =?utf-8?B?RUl0UnQ1QmovVEZYUW4zRkhPVWU1b2FTQkU2K3VJbHZUWDlmeEdFdkJlUlVI?=
 =?utf-8?B?dzVuRjJvSmJCVTJtdVM5QmNwN1dZL1U5bk9WRmlnR3RYRzJWeU1sUE0rVGs2?=
 =?utf-8?B?N3pKMTB5clJPT1ZKOFlML2x3WlJ0OGprRnR0ZjJmeUdoNklsTlNhaUtCcDY5?=
 =?utf-8?B?MFhwZG0xKzdaNnI0Z3BJRlJSam9qTytUSG5OdExKSlNmSjhOS2xBOHQyNFNa?=
 =?utf-8?B?OHJ3dDdvOVVjRzZwaHVEamh1dlRkd0ZSZ0FtVVk3ZTZTSGNxLzF0am52Rjkr?=
 =?utf-8?B?OWlEL2ZYcjVaMlBXbVlQcjA2MzRTK3RoR01qcHJWUW9BdVNEOGJkZWFvZkJG?=
 =?utf-8?B?RVZxbTd1MHlFWS9mZVZRdDN3OHhreU9USGtGbWVpQUZ1Q1Rpc2QxcWZsVk8w?=
 =?utf-8?B?VW11dU01MHYvanlST2VWRjlSNWVyUC85dVkvWUpyVjl6dWFpSVRZQXdhOERk?=
 =?utf-8?B?STFiZktRbWhPbGZsOVdiWHBIa2cwaEgrcWRXUGY2c2hDdHRjbGF4Q2tXdDJr?=
 =?utf-8?B?M25qVVROZzBLSHl2MXpuVkdPUHhhb0FjcDZPS2svU3RRVDJ2NE1uUnJ5WENs?=
 =?utf-8?B?UmsrL3pMb0FDRDhrUHo3WWMzQURzZGtma3gvdFFLcXpVem41WEdEaERFeDBV?=
 =?utf-8?B?dEtqL0hnelVXU0dzWVVObncyazQ2NjJzZHhHR2lkOFpQOUpTZkxYN3RDbG1j?=
 =?utf-8?B?Zk9vMjkweWlMNXZaT1RXSXlGYmpIb0ZOVElXcmJicGl4c0xNdDdvdmZmYU1L?=
 =?utf-8?B?QXRvNndzM1NONWF0eXV5YVQvdWo0d3o5UTdldjJSN3UwK1lkNllQZlJPYTZo?=
 =?utf-8?B?SFpGTXNlRWw3N1UwalZkdkdDV25jejBuVnZwRmY0MVpxUUx5ZXFUMS94amJC?=
 =?utf-8?B?RHBPOEc1b2IzNVlndEJ4a0pOa1lTcjlFTTZSelIzMitibVhJcUJLZjZjYldz?=
 =?utf-8?B?a2hkWFp5VDVONktVc3pucVhvR3BMYlpSZzR5RmxUNlgzcTF1N2RhSUJHQWdG?=
 =?utf-8?B?NXQ0OElkckVpNC9VMEpSbGpnODJMREFuang4K1VUS3RsNTA5WFVnZHZXUERY?=
 =?utf-8?B?SEJJb3JEZ2NWK2ExQnBjYlBqNVdVOUlWV1JRSUNJNVNpWnFWUTBLd2V5UGU2?=
 =?utf-8?B?MVhXWXNjV1BKUkY2S3NOcWdBRFZ1NGFvd0pTWXlURTU4eDJJOFRvYmFQRXlu?=
 =?utf-8?Q?nig4KhUcvJ/fMVtkdJro5xevj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6621a01f-66fe-4916-69ae-08de3beda971
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:21:47.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQtVHUBfpJ1/e9evj6vecwFa9320Kp+sS8KLsu68GOSQMQ79Yz9XngduY6kqVjeD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9784
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_072153_813401_0F4E2450 
X-CRM114-Status: UNSURE (   9.96  )
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

Hi,

On 12/12/25 13:09, Tomas Melin wrote:
> Hi,
> 
> Is there some more specific information I can provide regarding this patch?

I am trying to identify U-Boot code (2026.01-rc4) which does what you have 
described in the commit message but I can't find it out.
Can you please point me directly to file, line number where that described logic 
is skipped?

Thanks,
Michal

