Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C390FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRlgENUMw3PNonENB4KpS81bXVdOSr8xUOobK5ZNSPs=; b=Hk8w3kaISAZ18QV0DYx5fxsssr
	KAbk8mqqsaxgyPFiGQPlyl6Ral/jWKaFad2uuBclfBJRApOoDi6IVl7wdZ1nT8S6FyRoGS7MpMyz9
	gN93UxASCYmBBXbDzrIo/1yvkWAXtmZIscl1IgavL5/YDZR2R7Fi+58Mm5l5P4KhR2GG/coz5oCM1
	cQoVxh3S6WnlxWa82mWWw7/MCgrV3C6C2xcr/drO8SZHHiHsB/d+10aaY+lAxiXtHaOV2/mZ+pU2k
	z1cd/seO+tu1yVRi9Dc+cmqL4UkWaxF1giHDSu4uCc/W74dFN1UvOlYBEhGl6czWYuFUY/CN8wcAD
	KAjyKDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNy-00000005M2j-3XrR;
	Thu, 30 Apr 2026 11:16:50 +0000
Received: from mail-centralusazon11011035.outbound.protection.outlook.com ([52.101.62.35] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPNv-00000005Lzf-3GY6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gu4kYC3htKA7F812POiNsVV5XnzmGTVeM9OE/PccngQABOugwZebMjbbHw5XYrAqu6pyFiDw8EU20oMRgr62VkM7BnFmGK/Y9rY4zpyqQc93VaEFZ+VOGFbtYo6RQmK6jCP8Ae+BV5poXF1fikZsyhDfryEtAULaEXbNaxJO5/zvt8adCX71RNYm4MiodN6Xwga/zBdiWhjt2e062e2qrXL++JQZ+JvCIf74J642X5YYZZ+YHgzxCjYWG8ID8yoFTz/u6tKWcG7WEDvvw5b47TVEHV4gqG14t/ynKhZ6UAGKiCCuB8Tk4t3ehMSUCeJnftXBa+jqN5Wn5kbzHfIbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRlgENUMw3PNonENB4KpS81bXVdOSr8xUOobK5ZNSPs=;
 b=evASfex+QrXr7TEzww2Rv6boln6X2KTJ3R7XxpLD+4SyP+h4jfopo1iA/f3ugh/u0IrODTVR39IcBM0OoXOyXaGzLRc6Po++QAVr8R53MLX0BiRtn9jm4xS8dNIpo4uZZHsmza/eEgQ8UfSwuUWYd79gKE7Ghfk0mzqin5SAknFUAy6ncEZyPhyONNpOZ6L3k1yM+iQXVMaBndp7FaGYq3gAPKawoA605fkt4K7fc5Rp+G/0aApsRtkLoeI+GcWcj2JtQKRZ5fW3IZ1HLVotocUy5v0OrNpptQrJSTtHrIclv6PlNVu5znchHyP7SygpfYFzAdmjvgdir071uCRt5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRlgENUMw3PNonENB4KpS81bXVdOSr8xUOobK5ZNSPs=;
 b=dZddDb+11iLsobEi5PchJFlV1U6MpHDnw5poUIVssO9MI6EOwI0lIinrTAyaOzULU3wQBzirTVtV7gq5Vw7LoYv4o6uujbcTKKJFRwD4zvdZGD6ZyXaRaBtjR/UCxy2HylSkEfP3BFbx5XCcXaNx9JZNrHk4EZ3bz2iPk0pRqwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by DM4PR12MB8572.namprd12.prod.outlook.com (2603:10b6:8:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:16:42 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 11:16:42 +0000
Message-ID: <921878ff-8fa2-4633-bb93-e9e54f40e681@amd.com>
Date: Thu, 30 Apr 2026 16:46:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/xilinx: Fix stack off-by-one in debugfs UE injection
 handlers
To: Shengzhuo Wei <me@cherr.cc>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260425-edac-stack-off-by-one-v1-1-4b2dd2b9c7df@cherr.cc>
Content-Language: en-US
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
In-Reply-To: <20260425-edac-stack-off-by-one-v1-1-4b2dd2b9c7df@cherr.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0248.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::11) To LV5PR12MB9828.namprd12.prod.outlook.com
 (2603:10b6:408:304::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9828:EE_|DM4PR12MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b44812a-9c45-459d-9dcc-08dea6a9f4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VI3/Go+X/hmmbYe06tJV4FsbjneSF6EGxwbiWw3dP3VLraDqwLSrfuEow+wvPSq5T08eKO4FE/OFpVgFDJNqclWqGjFs0cbmSmO/7rKUrkUEMpfp2gUZTu5SF0P583Bnyxj2+9I3sf0UVRyVfdokjw5atEXVcc+0fuGnwLkcowrH43zwcdC8ZlWbhoY0fFZxZnjdKsc/hmmK3ogyOY/XTsFaST1NiXB2WYV6g1K+Fpc9egTpw8Z47+FJv0ZZ4+qj952mstatJFFv81UbowGAnRmLJJzYtIcp2yxqy3niOv3wIjmX7YDF8UEIkdPwaouRUf0/o0fePtAokiycmmFQ6pclIgKKal2fRifajldbTqPFXNrLPLgGv7+iyzVFfOEBd40mNGc2nagHNBhxOyxk1+Hjv4Tf3tdwdT9mSgcDX+DEY2uAggwqyltxwWmj2IDeOLp4NYEthZE5WeZmzJPVSV65TsV2NCh+cOZvGmzObwnpXf78iNKqNengBSVn6slqMYKVVoZrIQf841A+ykJWEs+G27472ees4617au0wox92LDy6l+FrOzY0tqsKbpA58K6efjeoSkAIRq/9HF4SypvPHVskoDHOpsUvFXwbxRKMxtvj6q1SiLShCdNVcfmST+dkwL27MTBNL+OUlEKgVSwa9r+fCcZVDf40XdbCpbb/SBfRY5DbFcwQvLJlS5HDjOGQS4jPIwpalQ2a9YtJ8Ni7aDw+qfidugQlePsXUrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFl3T2RVUkpuQ3ZCV3o3VFduMDBFaEJiTXUxQUs0UVROVXFvQ1h4ZHZMUlpB?=
 =?utf-8?B?ZHRxRHBocGYvY0M4YUlyWHpLN3R5ZHp2VktOYmdxU1FxVWlxT216bEVwWDZF?=
 =?utf-8?B?Qjdvb3g4dkVJc0prZzZzOTFBenVmaFNjVGhsazArdHJzbUV0cXVGK0IzR0VT?=
 =?utf-8?B?cEQraUpqU3orZlI4NUE1MFhCUUFzQURWSWJpV2JQR1ZCSWRNNkdxMEswM1or?=
 =?utf-8?B?eUNSem11TUFiVGl1Z3RFWWNVV1NzRFRKS25wVjEyMGpWTHUyZHljdE16R280?=
 =?utf-8?B?R09GbTVFZDUrd1psUk0yRTVVdlZ5bVRiRXhCcE5WRVpoRHUrRVZaV1pDNVg3?=
 =?utf-8?B?TUxqSVJrK25CUE1NUStlNkpjQzdPY2pwcDVpdzNoTmM2bk1jRnIrR1hVOFBl?=
 =?utf-8?B?eDNqR0JGRVpoZjVSRXhBSVRPRFZjSlhwSER1cVlqLzJwTzQ1aEY1di8yM01W?=
 =?utf-8?B?Y2svQnlZYlFCMFFFWEJjcjUvTE9OY3FuRUFMTDdXTWxwNHp1RG5Cd1p1SFYr?=
 =?utf-8?B?Mnk1REprbFBqZHdxRmFYZlRlUVFRbGozNEdKMXF4RCttd1E3RFVTTXBrRGQ5?=
 =?utf-8?B?N3ZQSkpPR0JWUDRzOEtFVDF3K2dzS0Q3anlFbHBvbFppdDUwalV2K3A5ckVX?=
 =?utf-8?B?OCsyYTVlVUtYWG1nSWJiMnY2WDFjMThHYmlaNXdvSkRSN2tLaXpUMlU3b2Vz?=
 =?utf-8?B?UkJHWFBHRFJyNTNEaWxoOWtVcEQ2b1FKYTZ1Z0g5S2laYW1FVFl1RStDbnZ2?=
 =?utf-8?B?dUhXbUJlaVNTdmovck5RZHlHdXo5UFpRN2NrOExid3dHZzJoOHk3WXZBOWpI?=
 =?utf-8?B?aktZSE9TWHdqTXBYYXFGVjI0ZWJmQlRYM0pZaldycEFrRWtqRGd6dnpwN0RL?=
 =?utf-8?B?OHB4YzNveEVaRkNQUEYreGRkMWc5RUQ5aDV2cWFmTnZPNVdiVWNTQVVNeWhr?=
 =?utf-8?B?KzJjYjZGRXJoZGxUWlNNTk1EVVd4RXI5YXhOWk1WVTZLZ3ZVdlFFYityT3Mw?=
 =?utf-8?B?aWhvRitjRm1XTSsvOTc0TzdaK0xlWkdBbXVKb1VnWm10L1prenhLZDUrWElU?=
 =?utf-8?B?OCtXTno5UG9meG54aGVaem1vbFM5TEtTWWQxVFMrT0tqWFV5UDcrYy9ZUHEv?=
 =?utf-8?B?K1NaMVFjMTN6KzZBZGp3TVBqYmpHTHVaaWc5Q05YWkRzUFRXYWp3Rkk4WXJR?=
 =?utf-8?B?cGQ0TkJPbEs4YU9nUGlleDlkVTdFUlJyQ0ExMC9JTFBtWTNSQ21oRHg1SVBz?=
 =?utf-8?B?SE9nVkZmNE90WHNxdllHM1lzaGpHT2Q4cnc5SXJURElXc05RSnpaZkZFMlNY?=
 =?utf-8?B?OTlDSjZWbWgxNUpPbVAvSXdNV2xwcEpNb2JodW02OE5PaFpDc09SU3djNHdP?=
 =?utf-8?B?cnV3V2lqbFBSZ1ZCcDRJVHJDLzBXUVNTckZyRkQrcnFlS0h2RzA1NUdTNGM5?=
 =?utf-8?B?Z2ZzMVQ2S3l5QWYvQ3FKZWRQWkJkc0tDcEEweWJsT0Zwc0hBcERiN3NEZjlu?=
 =?utf-8?B?c1dnNHpWWXZPZWJlRzBpWnQrc1NWTm5wZ0NQdE9UWkNhWlovaDN1Vngxbjdr?=
 =?utf-8?B?VHlOSDhTcGcvTjdhOThoRFFIMENJNkYvOGFUR2N5d0tkNkd1aUlZWG9iR01T?=
 =?utf-8?B?enRaMnZDTU1Bdnl1VENYUnNWVGk2QnhSblg5M01UR3BvTkgycUJwWmdNcWRm?=
 =?utf-8?B?K0tqaFJZdEpaZjNJaUR0L3lyV0JCekkzV1NwamI0WTZ1czFZVHRQZXZRcFhY?=
 =?utf-8?B?U00rV2wraFVZN1B0cVpwaXlmVWkvK3Q0alVOS0pFQ3Z6K2FmejR1bVdTQUZm?=
 =?utf-8?B?aGppNU5RcTA4SDJiOGlNRnRadEZtYllKMThYTDRkZTZyaU0zYkxwRGVXRW9V?=
 =?utf-8?B?cTNqSno1Z0RDSlROZ25MbUZhTXVDQ0dDUkRrMUErYVVxVTF0b21RYnh3ZkMw?=
 =?utf-8?B?SU9RL0lMd2UzMEprdEc5UjQyQkdQOHVWNTJhQURQRWdtRUFCWkZvYUJVem1q?=
 =?utf-8?B?WlRQQ1RVQTg0OGpobVEyQlo1TUJCWEdNZHl2bWZ6RU5lUjhjaGx1QUkyUGow?=
 =?utf-8?B?QlFiODQxQ29uSDF6N0NGeTRhMSt5TEpOZW1GaE9TRjVSS2RjRDJQYTl2K3gx?=
 =?utf-8?B?Ui9XNFJjNk5JaW1ObC9xOXhRTEZVa2lGWDZ0Uy9uRmFPLzdObEJHcUNyYXZw?=
 =?utf-8?B?emt0VlZLbEF0bzFZMG1PU28vekZ1VXVodHNNUG0xcmVOSE1SYlYxRTRrY1Zv?=
 =?utf-8?B?MTM2Z1hJWDlkY25OUXRZcC9UVEtyQXlYOU1zK29aVVJlbUdOWlcvV3pDVDhD?=
 =?utf-8?B?dDRrSEpWYjlNcERIVGdzSEc2aDRvSUxsSEtIYlZyTTRuOC9nZ1ZDdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b44812a-9c45-459d-9dcc-08dea6a9f4d3
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:16:42.3272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kda0AU6pwfNhStcHoWj4n1ReRaOFCrjcBUZPZ9ojY7Sq8JS1/YT19xdVZNGi9mrqSMIZYU4l5iBDkAi/1vc+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_041647_997570_535819A8 
X-CRM114-Status: GOOD (  12.68  )
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


On 4/25/2026 12:19 AM, Shengzhuo Wei wrote:
> [You don't often get email from me@cherr.cc. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Two EDAC debugfs write handlers copy up to sizeof(buf) bytes into a
> fixed-size stack buffer and then unconditionally NUL-terminate it via
> buf[len] = '\0'.  When userspace writes >= sizeof(buf) bytes, len
> becomes sizeof(buf) and the NUL write lands 1 byte past the end of the
> stack buffer.
>
> Fix by clamping the copy length to sizeof(buf) - 1 so that the NUL
> terminator is always in-bounds.
>
> Fixes: 3bd2706c910f ("EDAC/zynqmp: Add EDAC support for Xilinx ZynqMP OCM")
> Fixes: 83bf24051a60 ("EDAC/versal: Make the bit position of injected errors configurable")
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> ---

Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>


