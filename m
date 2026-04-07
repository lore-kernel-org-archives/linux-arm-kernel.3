Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D94AFB5191
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 05:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AjRWgcGdthCD6JjpX3GvlV0YkC7deUEizHFqQArMR/I=; b=3a9S3gUJCMLEc/yW5uOLmg8gav
	sWmGqpqK63FWSTlQ9eGN0Qc1cUoumx+KFFvNP1Rd5mhmuOqbzsF7DMDWNj5OgD5erdBzGbuTjbjtt
	VfwBI8ZfgtG09MPzHfIFOPKq1zbDV7vP1E3bCouKjxpb50olwLOGlNkD6rKiXpH8aicIr2XNnlLqb
	eShzaHGksaWYzTqHYPPm9YigxGklXhnWe/v7Q5zA9DWST40PL2BsjoWL+hSKJY9q5Mc8sl06frVmE
	wcD5vNlcNIb3lEFX37xLBkiV4A+CSKDzAIk127PTRhiR+g5Jtft8n6sVnFx/xNzB0y5NAPcTa8y24
	6GQxjekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zD1-00000005wHm-0SvP;
	Tue, 07 Apr 2026 05:42:43 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9zCx-00000005wHQ-3N1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 05:42:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFUqACgNt6XdT5jsvcypw6WO3YmsRjBKtX3s1XO/uuRq+hvXSrRtQdBo0eeks/89qymUiOcb3aoCzjPEFV30UBYSI+ZPsE7OcES0zQvOBFLMoBR7Rd/45519TF/JCtphdnbjWSBj5Lfg+/5hL9xn4IC0KrR2FM+IqrB+ZGZrQ8Q2J96y0Os8/t4eVILUkFOKNMtHQRgJW9hihG+DpxzztfBfoFt0ImcbkfFToJGJJK9qG3ZzyOT/Ry1yRhAnS8yzPuoGuHoVpNnWA2PIMg9mpPd5ZImbz+gExhxOkLUhpUkMq1vQNtZAz9TmOOSEZ+HeCigiZG4ny509cy2pQChaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjRWgcGdthCD6JjpX3GvlV0YkC7deUEizHFqQArMR/I=;
 b=yKzOcMbVbpWMJrGObDZj7C/gulr1JbcEBrBlRbRp5er6KOyCzWK4IqvIFmjFNgpT2iE09FkY4BcPYEDBoZMbHskOvSGA+YTqesmQWGrxPjQ7J+V5/rZP5M351/zGTxnivPM7t0W1CPmi5Mm51brl4dOZybKHh/tqOsXavOPBswzEaBirZNRIXlFj9fWJbGsjJqZoQ0xWXtCfLPykmc0Z9yeYdk/o/BKmxjpPbXS/2Beiul5Nz4N8AtepCppD8VuU3cYz4/aJM7++e7ue9r4aY6jXAlzsthiKFfC1ON2Jo29YRygYC76SkBGjCwuV2WMOg/68hQKrGkMsxXVF4xHrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjRWgcGdthCD6JjpX3GvlV0YkC7deUEizHFqQArMR/I=;
 b=TVKOveEqX+1jptYl8dO4UZ/Acj3OIjW5/ah1tWQNwwvvvG2i1Q41qo7ivQ1dkjOqYwwilTP46Yao4K/jgqaRlame/UQAekB9y9Fo9XmTBCxugbhbsNu2f2AMldEKINhlmvXVG57bP5RiKqEs9UdzivqJpKC1KHR+C8R4t7VF51U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 by DSSPR12MB999211.namprd12.prod.outlook.com (2603:10b6:8:375::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 05:42:33 +0000
Received: from SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2]) by SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2%3]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 05:42:32 +0000
Message-ID: <90460b8e-fcee-47d4-8568-fe4aa1af4664@amd.com>
Date: Tue, 7 Apr 2026 11:12:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/5] dmaengine: xilinx_dma: Add support for reporting
 transfer size to AXI DMA / MCDMA client when app fields are unavailable
To: Frank Li <Frank.li@nxp.com>, Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Vinod Koul <vkoul@kernel.org>, git@amd.com, Frank Li
 <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Suraj Gupta <suraj.gupta2@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
 Folker Schwesinger <dev@folker-schwesinger.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kees Cook
 <kees@kernel.org>, Abin Joseph <abin.joseph@amd.com>,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260313062533.421249-1-srinivas.neeli@amd.com>
 <20260313062533.421249-6-srinivas.neeli@amd.com>
 <acqe_AF3YHPLNzoV@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Neeli, Srinivas" <srneeli@amd.com>
In-Reply-To: <acqe_AF3YHPLNzoV@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::7) To SN7PR12MB8147.namprd12.prod.outlook.com
 (2603:10b6:806:32e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8147:EE_|DSSPR12MB999211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4987f378-1924-49b9-1f21-08de946876a3
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VrsZeE8GOgghemZAoSRnxLJv/TqYHETPpwEUt2yqnLW+KDI/XkA5pbHkuClh3RVyxJyTiVyuOMSDw6gzMFAa2hg5o2rdhR3IgvgxmVt/2mqga7XytbqUDImBPRlksijfiF1NrHVuohOiNw/VdTx5tw+WmNNBSfV73P8RZj1tC9tVQK+3UTvaZDWnQ6ZLwT6aGnEI4gXi/fM83SCySaUTtuXJ5x6K3Iih9NckF+eNyOE3FuQXC2uxUXg71LQ94YZkPNd4nUuhav+DEuFdq57M0C1umQUv68eKJVbRXzK0AVguD2/jp7eSWf6rk/zTOMgqkRSk8OvYo+fuJ2GG8LGbZyKb/JrHdmmbfEwPTMFb+PeVdqE9CBwJuPoNECH+75J1mF1kC+p3tJ4s30klqM1Jz6E4MMIeMGmJ8ZIgEDKRF6GfcWO6rDk+h1+pOUEeCvoSeFLjBr2K1G/zsNjEyJaXGFPe2pNOeL2RUqkBhmD1ol3s0ZgkBV2E41tXSGDTEV5mT5hiUDaM3HCAP+kzYSAGYADpQasTlvA4C7X5baeflPkqyzmbREYKA/bPiwP2dQfKwAtlMvYUrTVexIDTrdLh/8zXsX2+3F0XdOHa8S4noAjUp/IXOx8LUsyay8kOJCsgw34WT3vB1VVntgcwA9KzDKSttbzfByIKczHNx2ziQGd6fEFIFwPz3vSMOrTeh9d6y/+IbNBJfEqTiTzF8JSxo671nbLJ6W6G33bULakzbv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHlPR0V0MURQbmxqZHJJWUUwOTA2VVZuc0F3aUFxdGhBWnZWWlM4dUF6Zm9w?=
 =?utf-8?B?MnB3YVl2QXltQkxKS1hVSHNnQkY2Z0RPVEdkb2xmdXNQenFySGRHcitUbG92?=
 =?utf-8?B?blN3UWZFTE1xNG9Fbm9hNVQ4bDJTR2gzRjgrYkNVdC94YTZOWFhZczFZeXZq?=
 =?utf-8?B?ZUwwQVJzeG5GdWdsOVR4dTkyaHN0MGtBMldEekh4dU9QV2dvb1liUVdLa0FS?=
 =?utf-8?B?alVnSDRLMnZocUliNEVmK2V4YUZ5VytGTnlDeElHQ0NDREZFVVh1ZGM0cmtr?=
 =?utf-8?B?RGgybHZ5V2JEOVJhejJVTDlOTjQweGJKL293Z3RwVmJlUkRRQUxtUWY5dkdX?=
 =?utf-8?B?VWdnaTBibFNGcGtZVUswUDZCODJKeTVacnU4eXF1TExGdm9aMlpkd1RjTkhz?=
 =?utf-8?B?ZFZDU2J6VjlQdDFRUFRGMmZPV0xwc2s2alNjZUxkaEVyUkJhZXpLYjZMZTNw?=
 =?utf-8?B?blpKTzRWZ0pTcGZ4akpsK1dBeEJzNTBrbEZvaGllajFxTUc2OWhCU0kwSXJn?=
 =?utf-8?B?WjBIZ05kSXVsbGt3N3hPMEgreEdQdFB4SnFzTUc3ekFmb0FmSTFENjBHa21n?=
 =?utf-8?B?OXljV0FtczJteFFOcjUzMzdvSGtVWm1HbHRYcGhOZzF0b0pSTUxKNzl5WFNO?=
 =?utf-8?B?YVZwMWhSN0hlVGw4OUIzUW96UU9FbzRaRU1SODYydGNoUytQRXlod0FVeFJh?=
 =?utf-8?B?Y3YrSlhTZFlHYk9na01mdUl6SlB3L2pnYVEwTXkrWG04TVVGa3lSTmdKYWp5?=
 =?utf-8?B?YkN6WHJVSk5XUU85U1pJdGlEcXptMUFtczJaekJyT3hhSUU2NEtCWUp3TVg1?=
 =?utf-8?B?SkozOFhjSVlwMmlKRXF1aWE1SnBOakIySHNFbWtxRi9ETTRQUzhOcnE5UGlX?=
 =?utf-8?B?eFFJdU4rRUhTT0N3RFlFOGRZM0p4WGQ1YVV1aDlVNlltNkZPNjgyYzY4NlM1?=
 =?utf-8?B?Q3o0UU9rcUlZd2s5bjd4RmRmbHBqclhXelVEZHU2aVJNbkVaMjRGcHNJRXF4?=
 =?utf-8?B?SlBxWExON3EvZkk3U2srb0xrak93OHNoVzg2R0ZWamJQVDZQSTlvRlliS1RW?=
 =?utf-8?B?a1BzRnk5cjRidGtiNjJDb0JwdXJBZEM3aEdBQUgwdWZtaU1QT3AwVFJGQks3?=
 =?utf-8?B?a1JDOXBSZjdMSGp5QllxRVYyZzN1QUFXZi9jZFNDa0pUMC9HQjIvSHgxZ01L?=
 =?utf-8?B?TVozMy9IUG9qNDkwTmhxSE9VeHFGZDlqNUd6dTQwVEJnanBDcGdWaE1BTUdO?=
 =?utf-8?B?cy9TRW1XQnYvcTFDYnZvellzbUtqandIT0pvM1JzUDF1bjRKVThsR0ozR2xz?=
 =?utf-8?B?bzBxSjVtUytRR25lZElUMUlVck02bFkrbEpURzlxTDZrdVlWUUF1SGNESmRu?=
 =?utf-8?B?WXZJQjNseUhxdjNUMExKT3ArMjVhUWZTSHpUYklFMFRvd2xRMGdWZXF6Si9K?=
 =?utf-8?B?VTlkNzgrUG9TOEw1cG15amUrR1R4aVJGQThLRUF4V1U2a3ZmZzN5SWU0b3pl?=
 =?utf-8?B?OFp6QTZPZ3M1Y08rbkRCMzkrRDhBcGhySHE2R3RZYTBBa1FTYlZuN0hVVmpO?=
 =?utf-8?B?Sjd4Ukp1cnBraXdLbkEwZzBob0RaNndKVFQ1dFRmMUFXR2hHL0gxZ1Mwc2tF?=
 =?utf-8?B?NG83VjhRS0dUSWViNU1oQjd2MVhqNzhuTGRsSDZiUUhrbHFVdE5OZUtLaVpz?=
 =?utf-8?B?TEtPOWF0TVZWbytHaC9QcnlTcXhGSFNzbm9idk9QUXFsSVhlRWRvV1Y1dWJx?=
 =?utf-8?B?THh0bG1heFh1K3J6UWNnSUcvV3cwNmEzbkg5VFFIaElRWWl4Y3BtNy9VdXpu?=
 =?utf-8?B?ZG1Uc3dVanY0OHl0TnNtZGg2RFBJYm9WMTd0L25IOHNVMFNQaGZOUDNUQzBX?=
 =?utf-8?B?a1RMR0FvNnRZME5xS09hdnhGakU3cDhhWnZLYzNxK1ZWdFNxU24vQnZNK0oy?=
 =?utf-8?B?RmlBSmRwVXZIQ2VkTlErdVRtTEdsZzZlRktwRlR0VjE0YkJndVk0MFZVUzBi?=
 =?utf-8?B?OEF2aW4zRmlzTHJGbzJpZm42dmwwckl6bjVHU1pOKy8yT0E3R3VYdHJHd3lG?=
 =?utf-8?B?dDJ0dWhiQmdwZ2lzaFllaXZvNnJUMWNNd3k5a3ZRUkIrQnRkU3RHODRnYWFP?=
 =?utf-8?B?dStaT0ovWDZHZk4wTWYyeVdlcFFqZE9wYnFUYmNFc0wxRldUNTIyYWg1TFRp?=
 =?utf-8?B?OHZTMExoVHQ4ZXo2WnJZWXBYQURZNTNzUWZKdEVuM1I3eUJDcnhYUzJ1d3Rp?=
 =?utf-8?B?S0dCNDdFdjc2T3BqY0l1UWZEVlFuYmJWKzc1eUxjMW52K3pqRTY2bjE5aThk?=
 =?utf-8?B?T2hPUHFRUzdTbEkxbFVjS3lnSzd0VUxBMWsyVXFRTkU5MTVpZjhRdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4987f378-1924-49b9-1f21-08de946876a3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 05:42:32.4396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZH8f80HHCgyPRQSnFjMhFR0i86ZFhVaTZ9VXw4/4RXzs/HzA64/aFQaIiz5lSR1W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_224239_991012_E948DCC8 
X-CRM114-Status: GOOD (  24.89  )
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

Hi Frank,

On 3/30/2026 9:34 PM, Frank Li wrote:
> On Fri, Mar 13, 2026 at 11:55:33AM +0530, Srinivas Neeli wrote:
>> From: Suraj Gupta <suraj.gupta2@amd.com>
>>
>> The AXI4-stream status and control interface is optional in the AXI DMA /
>> MCDMA IP design; when it is not present, app fields are not available in
>> DMA descriptor. In such cases, the transferred byte count can be
>> communicated to the client using the status field (bits 0-25) of
>> AXI DMA / MCDMA descriptor.
>>
>> Add a xferred_bytes field to struct xilinx_dma_tx_descriptor to record the
>> number of bytes transferred for each transaction. The value is calculated
>> using the existing xilinx_dma_get_residue() function, which traverses all
>> hardware descriptors associated with the async transaction descriptor,
>> avoiding redundant traversal.
> Can you split this change to new patch?
>
> Frank
The changes related to the xferred_bytes field and the 
has_stsctrl_stream property are tightly coupled and cannot be cleanly 
separated without breaking functionality or resulting in incomplete commits.
The xferred_bytes field does not serve any meaningful purpose without 
the has_stsctrl_stream check:
- xferred_bytes is computed in xilinx_dma_get_residue(), but it is only 
exposed to clients through xilinx_dma_get_metadata_ptr().
- The metadata accessor relies on has_stsctrl_stream to determine 
whether to return APP fields or xferred_bytes.
- Without this conditional logic, xferred_bytes would still be 
calculated but would never be consumed by any client


Thanks

Neeli Srinivas

>> The driver uses the xlnx,include-stscntrl-strm device tree property to
>> determine if the status/control stream interface is present and selects the
>> appropriate metadata source accordingly.
>>
>> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
>> ---
>>   drivers/dma/xilinx/xilinx_dma.c | 28 ++++++++++++++++++++++++----
>>   1 file changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
>> index 52203d44e7a4..f5ef03a1297c 100644
>> --- a/drivers/dma/xilinx/xilinx_dma.c
>> +++ b/drivers/dma/xilinx/xilinx_dma.c
>> @@ -380,6 +380,8 @@ struct xilinx_cdma_tx_segment {
>>    * @cyclic: Check for cyclic transfers.
>>    * @err: Whether the descriptor has an error.
>>    * @residue: Residue of the completed descriptor
>> + * @xferred_bytes: Number of bytes transferred by this transaction
>> + *                 descriptor.
>>    */
>>   struct xilinx_dma_tx_descriptor {
>>   	struct xilinx_dma_chan *chan;
>> @@ -389,6 +391,7 @@ struct xilinx_dma_tx_descriptor {
>>   	bool cyclic;
>>   	bool err;
>>   	u32 residue;
>> +	u32 xferred_bytes;
>>   };
>>
>>   /**
>> @@ -515,6 +518,7 @@ struct xilinx_dma_config {
>>    * @mm2s_chan_id: DMA mm2s channel identifier
>>    * @max_buffer_len: Max buffer length
>>    * @has_axistream_connected: AXI DMA connected to AXI Stream IP
>> + * @has_stsctrl_stream: AXI4-stream status and control interface is enabled
>>    */
>>   struct xilinx_dma_device {
>>   	void __iomem *regs;
>> @@ -534,6 +538,7 @@ struct xilinx_dma_device {
>>   	u32 mm2s_chan_id;
>>   	u32 max_buffer_len;
>>   	bool has_axistream_connected;
>> +	bool has_stsctrl_stream;
>>   };
>>
>>   /* Macros */
>> @@ -672,8 +677,12 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
>>   				       struct xilinx_axidma_tx_segment, node);
>>   		metadata_ptr = seg->hw.app;
>>   	}
>> -	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
>> -	return metadata_ptr;
>> +	if (desc->chan->xdev->has_stsctrl_stream) {
>> +		*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
>> +		return metadata_ptr;
>> +	}
>> +	*max_len = *payload_len = sizeof(desc->xferred_bytes);
>> +	return (void *)&desc->xferred_bytes;
>>   }
>>
>>   static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
>> @@ -864,6 +873,7 @@ xilinx_dma_alloc_tx_descriptor(struct xilinx_dma_chan *chan)
>>   		return NULL;
>>
>>   	desc->chan = chan;
>> +	desc->xferred_bytes = 0;
>>   	INIT_LIST_HEAD(&desc->segments);
>>
>>   	return desc;
>> @@ -1014,6 +1024,7 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
>>   	struct xilinx_aximcdma_desc_hw *aximcdma_hw;
>>   	struct list_head *entry;
>>   	u32 residue = 0;
>> +	u32 xferred = 0;
>>
>>   	list_for_each(entry, &desc->segments) {
>>   		if (chan->xdev->dma_config->dmatype == XDMA_TYPE_CDMA) {
>> @@ -1031,25 +1042,32 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
>>   			axidma_hw = &axidma_seg->hw;
>>   			residue += (axidma_hw->control - axidma_hw->status) &
>>   				   chan->xdev->max_buffer_len;
>> +			xferred += axidma_hw->status & chan->xdev->max_buffer_len;
>>   		} else {
>>   			aximcdma_seg =
>>   				list_entry(entry,
>>   					   struct xilinx_aximcdma_tx_segment,
>>   					   node);
>>   			aximcdma_hw = &aximcdma_seg->hw;
>> -			if (chan->direction == DMA_DEV_TO_MEM)
>> +			if (chan->direction == DMA_DEV_TO_MEM) {
>>   				residue +=
>>   					(aximcdma_hw->control -
>>   					 aximcdma_hw->s2mm_status) &
>>   					chan->xdev->max_buffer_len;
>> -			else
>> +				xferred += aximcdma_hw->s2mm_status &
>> +					chan->xdev->max_buffer_len;
>> +			} else {
>>   				residue +=
>>   					(aximcdma_hw->control -
>>   					 aximcdma_hw->mm2s_status) &
>>   					chan->xdev->max_buffer_len;
>> +				xferred += aximcdma_hw->mm2s_status &
>> +					chan->xdev->max_buffer_len;
>> +			}
>>   		}
>>   	}
>>
>> +	desc->xferred_bytes = xferred;
>>   	return residue;
>>   }
>>
>> @@ -3284,6 +3302,8 @@ static int xilinx_dma_probe(struct platform_device *pdev)
>>   	    xdev->dma_config->dmatype == XDMA_TYPE_AXIMCDMA) {
>>   		xdev->has_axistream_connected =
>>   			of_property_read_bool(node, "xlnx,axistream-connected");
>> +		xdev->has_stsctrl_stream =
>> +			of_property_read_bool(node, "xlnx,include-stscntrl-strm");
>>   	}
>>
>>   	if (xdev->dma_config->dmatype == XDMA_TYPE_VDMA) {
>> --
>> 2.43.0
>>

