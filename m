Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB77010775E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEw9zvYCXPHlCXx7qyOB7CKHTnsxdXs2msnIQmW052s=; b=N8HAA2E4aGTQNZk3/PW56VHkjJ
	+4bpKqIAKJgtZvuICfGhmK/X5DG62wCiBQr2zYZfyalPSK6Vngo43fFGgTKASX+dWDdRmJKx/LoEJ
	OGwXmuUNNBAk/yyeh8xwkgHNd7hbV52erJDSdgXvRHghLv/4avraPm18n5XwdGU5y7hRKWRO2Jj17
	XvpYlR0naNSVHN+38y2qSrYgD4NQb2wK0rsV2B6pqGSNRyLE1hpqf0AhUpU8JoKEQF/LQXcf5U9rd
	VP6otEbZQseNA8FyhaXJn/UFqM3DCQRLo3jJpesfTJaISeep8ipxWx34oBswhNGL4u7erkE4/L+YY
	H9o821hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tQ0-00000008tBL-28du;
	Wed, 18 Mar 2026 16:06:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPx-00000008t9J-3Dik
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:To:Subject:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=HEw9zvYCXPHlCXx7qyOB7CKHTnsxdXs2msnIQmW052s=; b=EdFayKuhyveUbeE69MaoBRZj3j
	GQd3wFD9jfYhBN7YNV2W3dt6w+W/KsNtT49x+dQT5c2cs6HI6tQwPUHB0s8v0Jcqoksx43rNXeayp
	2pXZqppHi3CUfWKw20Dy8b9s+xW4DFL9GTABfYG5aj0Tb/HwKjtkLrjYpfth1FQxmn/mbN5BrWREa
	4EdelNE+HsWSuE3HgU3ZOGfGWJib3KEWO7l3ifCG3DP1/98hpTIOMfHxTVR014xu0sjGV8ph2MFTe
	pwKJJ/wFhKUplgs3OC6Yh+pxfvCFaXSfbqx3MB2XEeqd7N8+RokN8z3UjnC77aG3w0BTJrXcHc3Eb
	DYHmgRVA==;
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPs-0000000Bfbi-2lOM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr//N+pL9Xszee5tNkqo83N+BeNfFX6X+7D5nfapwD4jlAuCI7e+kWpOt0roBHrausfi+GBz2ypzjLG4Am1ELjQ/naKVkKsz+Vjet85R7ivk/DcUbBVwwYYNU9a8boYh6vAZzVObnXtsFsgO2/dQpKRBCnjfOZ3TL4Zr6HjfUuu69i//kOQ7bxKAFQw7fgwSmmI2uL6/5hr/vfnryIj5WnQqisKrCRfL6PyPng8K7lDk/1pQAEwG6FIdDReloKQoIE2H6X3idduX+/Bk5pYLSEJzErfcS1GsGZX2h6c5jAW1vBVrsgLLlIoeBSJwqjrN0wPxgdUAwgTdXTcrvJ1JkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEw9zvYCXPHlCXx7qyOB7CKHTnsxdXs2msnIQmW052s=;
 b=C/cP6XohEtL/O40EHRD6KcnsZrBClKIeGgNfoBuGIIna5XQt1A0AxtNFdcaFIeTC6gaAxigOVsFfuHiuz5lxScKlWZShp/BbpTLyW6VEhSXa6+xvSlGbarz/KjwHSUAI0S5sFDuRUoyX9dOVD15zzS2CXlb+4l4gG64B0ObsAzjHFCz5nHfkDLMtdeD0TQBDMRa9tJIX51HLD+n8zJLmUIe7K6Kf+ctjAvq8vrCj1D/rBwev9+J3BXAcus+xb/npgZvozX2127PBlUVTGYYTWCiexR3RGSD6HPVjGWphIHqzC/KPp/kmzfmYY6HwJiFTi4hCWcGbA0aBdSk0op1j2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEw9zvYCXPHlCXx7qyOB7CKHTnsxdXs2msnIQmW052s=;
 b=zOXTfyZbUBKdpySTZvoX1a12pKJ8BUcHj0yholH4WGYPQFUFSFbsjdH9mFKwjBZVGd3MzWVncXngsT6uYG38KMdWt8YZ2C15NcKf7432ZUp1rxHSSZg2zaaHmS+CSpmvtb4rbKA17aPziU3LvdNeCkqOJ6hoxqzL2mTs95ZWL2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:06:29 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 16:06:28 +0000
Message-ID: <fa75334e-6cce-4a6e-8072-132b8823deb9@amd.com>
Date: Wed, 18 Mar 2026 17:06:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: xilinx: Shutdown and free rx mailbox channel
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 jay.buddhabhatti@amd.com, marco.crivellari@suse.com, tejas.patel@xilinx.com,
 rajan.vaja@xilinx.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260317133517.1324319-1-ptsm@linux.microsoft.com>
 <20260317143643.1329013-1-ptsm@linux.microsoft.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260317143643.1329013-1-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::14) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: c9eab99a-fed6-4642-c690-08de8508502b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: HKSCOBGKrioACGsi4Eh1ogukMU0i6bwAXESq4+sK1rULku/siBXQ83mxnhBjxAmWUWGaobl0CtvSqvP5Q2JNHkx8BeymyMZ918qlOeyKZ8UY/X8f+I0PIMXXKVtAoaMhrHRXBL2YQmyYtvHQ2z/ApkXCqM2vDQVI/tRugC8LvdIHJSm+SzK/RG462O1R1U5IP2Qt/RHiOdANt1NeXOGGxpQZhWjuHK1o+lVeCEf+l62K+13iZ5AQmRIIYBoREfDHHr3QVsJzvM2iLuj2ZNp2cku+JyKY3/zrUh2XZgyvIlE6k5NNQihi0q1PRWFc+IPxMqxJcOgrPMxeLzKv2/2uIjnLU6sHyqZifajWwzcnWyel5XJgg9/ga+pHaNGevfnXY1p2r8dsXV6ELM0TFOAnG6QgVe8R1d8ysaplY+W3ntJ/uiv3g+cFgt5b581Iq/oq/sg96nD77rNLpUM5QHaxV/Ej8wrYJOLihQ1UI7t/kiCJBUGWT8bGLAHMLa1hrQilG+gJX7GnNaYkzWsGHG005bQML7ivls24CxRTIZp0Af+0kzjeDkP4NwNwdaC5ZY9/sjuQYRLXm+OVR2cg+f4peBPCbvNdOSAYgI6urom+/hkhGuCDADW9Rm5WXj4BF8NftBJOZQjBQTcY1Zv81KzvMDjDQoVk8szE1ZetEZffJpgSpYT6mxht6/HT29uLty0Rs+C34jBlTvDgOjHQagf7lP4QmuDnMmFAA0+7+fOR2hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STREbUdmeHUvdU1mbHBRK21TeFMxQ3NkdlVmblU0WEI5L1gzYzh2OFRpVERO?=
 =?utf-8?B?WXpsZ3dzZEtlVkJBUVpWb2hubm1pdkI4NUw5c2FDdlZQTzF3TlQ3VUVWL0JT?=
 =?utf-8?B?dmdhYVFzdVNrVlF3ajNSRVB0VVY4amRYL3REa3dsN05kWkprbXB3MG1YZE5V?=
 =?utf-8?B?a2hab1hnc3dTUFBLaHpVZCtWazNTR3dUbEp5ZDYyYW5EVmdqWWhZWnlibzlT?=
 =?utf-8?B?dU9OcmlhejZ3bkVreWRpYkxhRWlTODFhbkVrbHhmcWM4R3gwUHZCU1I0akIw?=
 =?utf-8?B?MVNuZDJFTk9OdTViT000WndvbXhCOHVVVjBwRkRaWEZlbnBIazB2bzM0dU1p?=
 =?utf-8?B?N25iMkhEMmZMSjNReEoyc3lmaFZQSlhEVUh2ZkVJTFczTTFwVlo5QjlGU2Nv?=
 =?utf-8?B?TXJGY0loMmtVNUd6czU1b083Q0xIQjFoTllTaHFlMnNkTy91cDNvL3AzYTY2?=
 =?utf-8?B?Q2E3ekZVd2NRTlZSZjRUcExsYXdZakJVWnNwaEJjY2FQcUVpMkZ1ZFIybmR5?=
 =?utf-8?B?Q2JnYldiMnZsMU9McGVxcjRDa3JzRDFhNzMwam9ZYVpORG5nbEZZaEJ3ZEMw?=
 =?utf-8?B?WHcrc1krS2xIU0h1eFJtVGxGTmRvekVTdDd1YURKbit6NTZlYUozaDZacmpl?=
 =?utf-8?B?VU5qQXhMQy85eEg0QndQVDlVclAvdDR0cjFQZzkzN0htMWZiSGp1Qm16MWJx?=
 =?utf-8?B?eGpYVEo1ZXpLWnVOaWJoQ2djWkZhdGJ2RDF6T3NNdWMrVUVZTUdwZld0NWRi?=
 =?utf-8?B?R1pLNFRkZk5reXZ0bFZOeWJUcTFJckdBajErYkVvTWVnMjlEQW9tNmh2d001?=
 =?utf-8?B?VDFRc1JSS0dyWG5wczVNZ0k4azUxTktMQmN4V0VxbC8zcHc2MXhJc0dnOExm?=
 =?utf-8?B?Szg3TFVXV1V3QjhLVHAzcGc3Y2haSzM2SUgvM242Q2RHeDZiZlVUdFJuZkY4?=
 =?utf-8?B?Vy9PRDd6VURYTS9VZHNXMjNXZDBzR2pjRXdJUFpWMC8zWlhkOCtlNEZEcGdO?=
 =?utf-8?B?Q3MzYldOaEsrTzJpaG0wUVNzakYxUDU5OUlNdWpOb3hwYVVjSXMwMDE0WjhK?=
 =?utf-8?B?OFY2WXBCbzJJcHg3WUZmdFQ2UThEMVNSeGZSMkhPbE9rRERNTU0xSENoUEJS?=
 =?utf-8?B?WVYvaWMyQVpxV0wxaDluT2ZtT1J0c0FkcXBQMXo2YWIvVEVWTVR6aDY1WkVo?=
 =?utf-8?B?WXZybFh3VXpYaStvV1F2V2l3WEtLUitZWStQZ1dqVkpJNkdWSEFlNGVuQk4w?=
 =?utf-8?B?SFUrVUt5eEs3RUxXWHRTbSszeTJIZm13MVJReVJqalhYV3ZZQkhRb2hUR2ZR?=
 =?utf-8?B?WVRiWmhoUXdySGlscStwcXVPYUJ6V1JPa2orTmpQdmkvaGVVOVFLckF2dEYr?=
 =?utf-8?B?aHkrN040N3NJMlhYYUJEV1Ryd1pBNGJoenZ3Tmgyd2NrSzBic2I1bEEzQzFK?=
 =?utf-8?B?eThrZUVETlpoajBXdkQ3bmhUQzhDTElMS0JsL0hKUU5kejVqT1dnRVhZNkdI?=
 =?utf-8?B?TktDREVSZmg2R0Y2a3J3OGsxQ1dJbTVBL0dpaTZBRHVoK1Mzc0lOTGF1Qjdu?=
 =?utf-8?B?ZSswWDBVdEtNSTBzS0NadnpuNXRHb3N5WXRsc2dLZjhOUWpxZmhveEJRUGYv?=
 =?utf-8?B?enQ3UnI1R3JxUEdwb1lIazV1VkV5V3kwOHZEdWFFWXdISEZlSEFMRHhEUTZq?=
 =?utf-8?B?cWpJS1NlRktIemVtNGdpMkY5bzBnalkrcE9xVUZBY1BNVGt6dVZtZWVLdk0v?=
 =?utf-8?B?RXV4KzdDK1RVUG4wRlpiVjByWUROdXB6Z1lOTFgwYnhhb2FYYStLcysrc1RE?=
 =?utf-8?B?bmMwbXRGYkhUUkhES3Z1c2JySHFCNzJ5NUQveG03RE42dXdFVnYzRzgzbTZL?=
 =?utf-8?B?Q29vUlFLRDJoNVpOdVY4bkdNaVM5Vi9TejVhNnlEcUoxdFdGWGNKRm1icGxF?=
 =?utf-8?B?TzJaS1hXenJDNDAva2pDRCtYNUQvOURsamw5YzNWTHJCMFgzdUlxMWI4SS9k?=
 =?utf-8?B?Kys0bmhFSkc0SUtwUXdvbXh4SExvcmg5V2ZZM3RSZHNtOWZOaktQUHJWQ1h2?=
 =?utf-8?B?T000RzUvT2d2Qk9TWkZnaWprd0k5SWQ2VkRhYkVNK2RnbGJmV2VGMStCS0R4?=
 =?utf-8?B?RnBkMUVQOEo4QXpCT21vN20zY2lMR2NLQkh3MnBGTW1QeGtOY2FoWkx0dWgv?=
 =?utf-8?B?cUdlTWx4eFU4TStRVy9CcUpxL2dYakgrdFc5TUoxSzlBZ2drdEYwNE9sQWpQ?=
 =?utf-8?B?VFRncFFlM0FDbmg2bXp5S0c0UmhEbjZRZlZEWGdvOXNLS3VBWmJEOHRWZ2JM?=
 =?utf-8?B?eHcwS21wYitwZmtmMUlZT084SXR0MjlFT3JHL0JHckRzWHY3UXFRdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eab99a-fed6-4642-c690-08de8508502b
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:06:28.6359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4871M3hVtoMeyMoG62t7I9nfv2JA9aPMo9z7dbtNW4zPqt1d+TwdY2BcApeJ94Ho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_160640_792358_DA195131 
X-CRM114-Status: GOOD (  18.31  )
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



On 3/17/26 15:36, Prasanna Kumar T S M wrote:
> [Some people who received this message don't often get email from ptsm@linux.microsoft.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> A mbox rx channel is requested using mbox_request_channel_byname() in
> probe. In remove callback, the rx mailbox channel is cleaned up when the
> rx_chan is NULL due to incorrect condition check. The mailbox channel is
> not shutdown and it can receive messages even after the device removal.
> This leads to use after free. Also the channel resources are not freed.
> Fix this by checking the rx_chan correctly.
> 
> Fixes: ffdbae28d9d1 ("drivers: soc: xilinx: Use mailbox IPI callback")
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>   drivers/soc/xilinx/zynqmp_power.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
> index aa35b63b45a3..5086c1e6797e 100644
> --- a/drivers/soc/xilinx/zynqmp_power.c
> +++ b/drivers/soc/xilinx/zynqmp_power.c
> @@ -398,7 +398,7 @@ static void zynqmp_pm_remove(struct platform_device *pdev)
>   {
>          sysfs_remove_file(&pdev->dev.kobj, &dev_attr_suspend_mode.attr);
> 
> -       if (!rx_chan)
> +       if (rx_chan)
>                  mbox_free_channel(rx_chan);


Please also clear that global variable because when the driver is re-bound there 
will be old reference to rx_chan which shouldn't be there.

          if (rx_chan) {
                  mbox_free_channel(rx_chan);
                  rx_chan = NULL;
          }

And please send both patches as one thread.

Thanks,
Michal

