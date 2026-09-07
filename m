Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3766EC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3ErdVwhslrfzMCaD/lQoPrrw/XkadqDDRtMB8TLhpo=; b=hTVzjfr8sWsRgZZTimwGsWsMNs
	ZCHwEJYQO5VF9Qi/T04/AOzdQGcU3yqINBc9ZLqfZRCIiQF3gScvAuwFrMObbM1ET4NjdHsMdnK/j
	dUbgvBcIK4o6WRpUzSQS150y2Wt+s/XYOryhpXIfOgWOA3giBm6uC6NhZ7ZJqe0lAKgxmWLQxt14r
	+OZvCpzDIxjS0L5jJYoO80zO4qMWy8QbL/Q1f6EWq35DnwwiIdohE0sSa+KncaYvaOR9ulZNIC76Q
	wPHxjshiv7B3RZ4MUzWAFz5ZNNPOEVrjN9X4LbFWNtYEUohiXDPG0C2MoLRciwLexIxahFpBPUXyN
	nxdhan2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ajE-000000075dy-3WTA;
	Mon, 07 Sep 2026 14:53:48 +0000
Received: from mail-southcentralusazon11013000.outbound.protection.outlook.com ([40.93.196.0] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ajA-000000075d7-0ISO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrkh1b/ipe/GVKewYVr3JX2B0BOoP/4zVUYbTjt8jlT8zq1jqWfwh4sHuYN8k2Yso/Kjh8aPEfycVFdZc9cCeGlsqtqNj1ZAKoNm6FADU6ZP2ivm9fuZqi1fOD12OZfz/GWZDK5FtsY3uRDfRERQOLpR2RNVqzHbUDTwCx/AruOqKjeVjRqJWFeal8+IRBQBl3AfN1ALnHi5xXfNqXQbN8e4zMtn4xmbW8Eo6xQA8LXsfxWk3kCIsKCdDYQKClRgQ6bkavaLYIeX27s5HOqFcNhcciCRQfzYZ08TxWRLqUC1PNkOLdE50gnlZFfPSvKy4TzWEuhQi+yxDg5uvFAlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3ErdVwhslrfzMCaD/lQoPrrw/XkadqDDRtMB8TLhpo=;
 b=TVmgc1XupTRq3/RMcbpxKE8TeDmY0FdBS3+R7whTYCCqOdjognZaz6UrNGSLN0KvNpEL/LxCvhg501T4s/B4bKXMqHZokeD06AsZtsAterGNW/xpZEz48tjLNAI67lnCrBV8G8WB0LPHRtjgXCRdd+6MDP7yxFDjYrD6Wi98PFtSgz8tBFhrLwJGSFdWAEVN1qZezxJlkFMsGKgaaCgip5E2PAJmbHuo53cMOrqNfccAcz4MRT6iVNz1QtjSZenn3T7gLCV58m/SiN2JmqvXU8WcYx4NE7/LG5q+sIpiNV8qlwppDMW2SSC9uMmj4kE/47LPP/LUsM7rhRG58DHqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3ErdVwhslrfzMCaD/lQoPrrw/XkadqDDRtMB8TLhpo=;
 b=4jOxBJkYIpwDRXL/dMEAE7wg5kubEYfhd1Ruta0W6q/VXdS48oNP9si9CXKWNaG6KhD0f29QvK6OD9//slBZYfpZJn8zEORkvWGI0Z6Mr50t92BJNw76gsNiPNBNoEOJtK6CZZRN/6ldD38HlZxkgjMAePxfD2Kkjw+E6Np7O3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 14:53:36 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 14:53:35 +0000
Message-ID: <3369241a-b591-415a-9f40-36f95bdd6a9d@amd.com>
Date: Mon, 7 Sep 2026 20:23:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] dmaengine: Add support to configure and read IRQ
 coalescing parameters
To: Vinod Koul <vkoul@kernel.org>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "Simek, Michal" <michal.simek@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "Katakam, Harini" <harini.katakam@amd.com>
References: <20250710101229.804183-1-suraj.gupta2@amd.com>
 <20250710101229.804183-2-suraj.gupta2@amd.com> <aICPiS1_ITwELrxq@vaman>
 <BL3PR12MB65713879CB569E3B330C1E76C95FA@BL3PR12MB6571.namprd12.prod.outlook.com>
 <aKxJQLx6yprNdU03@vaman>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <aKxJQLx6yprNdU03@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PEPF000067EA.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::26) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 342038ab-dacd-4d7d-b2e6-08df0cefcb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|3023799007|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: h/BX7nrxXeM9FxC8/Ch7g1Un5gFENaB7n7tP7j3E8FujWmI97+wvDVqI0s6AUL7D53QWkKrHcwuQtaK3UmVCOutVGWvDjq9PzC20wMHmVSqCf/hD407+I3DVV+qqZ9LrNxv0/kBWCqyTtjeNMHkB5nkUBkY3Dpgaqx+poW+/TxKdGFhPzFsMdxOrcuKtQ3khbc7RX0xcl4hH083dQIMZgJBbduSJFLKxRiOxUaMA99vGAJoww491jCvcI5kea/GfMiA5gsCM7nyz5usB6RVt6dU2pRMsjpRldKd1dI1PkGO2kaWQoog9ZtjQv1tgatbq9Z4ms6GBwJ9NazkfSU6w2PmlKsbkCZmiIgPLpSpmirI2u+UVI9JRpLH/Gb/vw/GG9/m+lNA5R9fxFs2crv9FKHA3rewTvG503njeWDoa8zlzSVSkMjMNd26a3sTiNsncOevSDLsrtNq+lwONTMHM9eA47ol6N41IAHSNPpjOH6fjjLo3mb4uP4v37+IOkVdzC86odfrpQkh7n1HatXNt3gEoBSqIC5jG0HW2L5bz3eOLhGQ8R1vw9k9cdgzTxSso+SgkgD7N48EZNcZ7d5v9z7a8Ji8jv0xiaJlY6J2Z9e7G1KB592fw9N4DXtiicjm1+dtOsQFhA7/6cpFpd1px3pOhKjUP1uzwj1cK8J4kk3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTNPLzVzUklmN1FsMWtQcGtBeWxFZFVLS1dETkZST0ErMkpUWWZMZ0k1Nmxv?=
 =?utf-8?B?bDFmcERDUXZOS2Q3VC8zZ1Jha1E2TXQwanlrYkVIdnRRS041TzA3RTNUZDUv?=
 =?utf-8?B?SG1ncm8zekM3N0VnRFJyWlo5bk9BQ0tySEZEYnRqTCtueE8wZTdVRWU5bTRY?=
 =?utf-8?B?dnAxcDhORHFKTXFGNFpzMlFKbHMxMUJHQmJ6cEgwLzNHWjdCTUlTejlHSnRQ?=
 =?utf-8?B?b1dBK1BPWG9yR3IxUW4xK3IvTTRTV3k1WmtVMkdPREFJQ1lRb0NmS0ZqSC9L?=
 =?utf-8?B?SUtHb0grM3BIYWxCT3JweWRTU1lmemNKN1piQVl6MWZkNVVLNjZWcktLbWdT?=
 =?utf-8?B?dTYrK3hFZEpHV2J1S0FFcGlseExkeTJ4ajlLOTRIaWVVRXVJUUhaRkxORXJa?=
 =?utf-8?B?b0JXNlZrNUw3bG9NbGJOZGw4Qm5RdVdsTVR1bmVKdExVd1gvdjcyNVRJN1Bx?=
 =?utf-8?B?cm9xVnFFd1JuWEI1ZFVrcHlRbzhCaUIwVG9lSXRkOThEUXVKZy9pMjVEVDYv?=
 =?utf-8?B?MzdsVWpJM2lqWE9ZSndKRk9ibVF5OVhkWm96enNUd2ZkL01ZSzdLWUZJOCt3?=
 =?utf-8?B?d25EVG9XdGl6aHpWMEdPRXhCMHNOREUxZVZOaXJobkJOMnc1b0IvaWVMaHll?=
 =?utf-8?B?UXo4WVBsdzBxSTRFZlYrakxtOHQ2Q2liMXVjUTZjTFN3TmNHRXNLUHE0KzVZ?=
 =?utf-8?B?c010MDY5OFZuTWk1TFdJNjVIUGN4VVdaYTFhRnRMVGVzQkIxK2w1d2dHTDVF?=
 =?utf-8?B?SG9MK1QrWnlOeVVJSzc1eVZKNUhsUEVLcE1kVmVUdkhEQitZdDlhL2NlbFVC?=
 =?utf-8?B?T2M5R05yZk5UVjFTazJlSm5FY0oxeDM5K2dUWkd5V0Njb3M5cC9zdU1LRWVE?=
 =?utf-8?B?Q25odHhkcHkyVnRCTzRuQW9xcVZlck1Ob3JiSTV2VTdxeFIyanpyZnVWL1BM?=
 =?utf-8?B?S1NQcmMwdkZ3d3g1M1hVaXg2T0VXeEF2THQrZXg4aUl5VkdWbXl6ZDJYblNE?=
 =?utf-8?B?bEdVcEtYdjU3VU1JSTFxTlVOa2E4bzFUQVlyQWhuYWpsM2R1K2FkOVlRaFJ2?=
 =?utf-8?B?RXhhaXNjOEJaSnFhMDUyVDU0a3J3dUhQa2FUZUxadmNkMXp3T1NmSGd2VlBI?=
 =?utf-8?B?aFZNRGlyTlM1ZXhBU2hzNENvdC9MQmNyUWs0SEhLa0hCVGdFVlpCT2N4d0xJ?=
 =?utf-8?B?QVRmMVJBS2t5TEU0S0cvSDdkbnJ6eUE4TDJUdmhwV252TjIzRVI4RjE3akVQ?=
 =?utf-8?B?bUhldUh0RDhrZlZmeDc5T2JZOEtCMytFSHF0RjJzYk5YN2ZhM0U4SDJjMnJt?=
 =?utf-8?B?YW12akFRSFJDZ1NuazB0cGdHYy92d1pEQVFlYW9qZEdwVUt5OU1iNEsxTnFW?=
 =?utf-8?B?bFdrTWwrWkZWSjg2bUVVVGRzMjNXaDJkTUpyaDRrRnQ4MjZMb1ozdXdlbmU1?=
 =?utf-8?B?WW4wTG9KelpEcFRscis3bmhvVUNNSHlMVkJaWS9aS2R0Y3p2QnVNc2pDWXF5?=
 =?utf-8?B?elR2N3ZQTkxtQnE3dTQ2dk5wRERCKzM2ejdPMjdCNWNTdElwWUdjYkkxcmlm?=
 =?utf-8?B?MnFyZDZjY004aFFLM1QwNWFMYTh1YVJ4VDF2RHhmcStBNXlJMEpyQnNNUDB5?=
 =?utf-8?B?a0U0SkJISE0wbWRoQlZ4OU10K0o0VnJETWJEVmpldjg2eGdhQ1VyRVFrVDJG?=
 =?utf-8?B?UUpnbXFBRjBNQVB6UERHMmZyOTFZZE91dWQ5eHJ1N054YVNGampkK0FydmRO?=
 =?utf-8?B?NzBmVUpYY1B5VGMwWjB0K3M4aThlTlFCelRuOWl2ZVNYL0tob0cvUWQ1Z213?=
 =?utf-8?B?bU56dVYrd25DaitJcFYwQ3h6WmJWRzlaVnpBZHhzdXJnY1lyTlJCaHd5UmVq?=
 =?utf-8?B?RzMzcytjZ3h4OWJGTjBRMzVPRzVhVFB2enFLUGFORFJwSVN1T3hZcGZEU0hH?=
 =?utf-8?B?ZTBVQnlUOWhLb3NrL25CMWNIeGdIU1M4ZEhtMmpvaWJ4bWxEZXJiNnc3NlNo?=
 =?utf-8?B?WGppdVRiR2NKY0MzUjc1WCtrTmRDYWQ0eE9XQTU3RjYzQzhSZ1hsR1o3SEU4?=
 =?utf-8?B?THpHSTA2NUpXVG5LZ01DNHJUdW5wS1VrL0JHdnEwcmlKeDhTcHFOU3pmTVZZ?=
 =?utf-8?B?elQvbkk5aDRLWmgzb1VuRks0S1N5M09QeXVUcEdyWGhwQWowQkdVMWFxaGFV?=
 =?utf-8?B?enJ2RTFYVGhwVVFNKzhwbSsrOFRtYTVkYUZmZjA5L2xLV21kSDRLNlJVTjV2?=
 =?utf-8?B?VjZqWVRjQWprSkhNMjRzN3ZmZGFtY0ZLRUtFRWN1djZFSHhrdWVlRFlSWG5Q?=
 =?utf-8?B?N2FMcktUSmZGeENrUXZ5SWEwQVhRWW9Ja3ZwSU4zLzI2K3JKOUZSUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342038ab-dacd-4d7d-b2e6-08df0cefcb22
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 14:53:35.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cV+Cy31gRg4vpuKBWQHWWSgItztsVpVif67abwq18N4Z4TcdL4ohe34Z2IxJSK/rfh5Ikiwg6i3wML9CoV1kPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_075344_343332_42AB8387 
X-CRM114-Status: GOOD (  19.30  )
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


Hi Vinod,
On 8/25/2025 5:00 PM, Vinod Koul wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 23-07-25, 11:49, Gupta, Suraj wrote:
>>>>   struct dma_slave_caps {
>>>>        u32 src_addr_widths;
>>>> @@ -520,6 +528,8 @@ struct dma_slave_caps {
>>>>        bool cmd_terminate;
>>>>        enum dma_residue_granularity residue_granularity;
>>>>        bool descriptor_reuse;
>>>> +     u32 coalesce_cnt;
>>>> +     u32 coalesce_usecs;
>>>
>>> Why not selectively set interrupts for the descriptor. The dma descriptors are in order,
>>> so one a descriptor is notified and complete, you can also complete the descriptors
>>> before that. I would suggest to use that rather than define a new interface for this
>>>
>>
>> The reason I used struct dma_slave_config to pass coalesce and delay information to DMA driver is that the coalesce count is configured per channel in AXI DMA channel control register[1].
>> AXI DMA IP doesn't have provision to set interrupt per descriptor[2].
>> I can explore other ways to pass this information via struct dma_async_tx_descriptor or metadata, or any other way.
>> Please let me know your thoughts.
> 
> dma_async_tx_descriptor has dma_ctrl_flags and one of them is
> DMA_PREP_INTERRUPT which you can set for a descriptor and control when
> you get the interrupt
> 
> I am not a fan of adding custom interfaces.
> 
> --
> ~Vinod

Apologies for reviving this old thread. I got pulled onto other work and 
am now picking this back up.
Reposting the context below so we can converge on the interface direction.

As mentioned earlier, interrupt coalescing on AXI DMA/MCDMA is a 
per-channel configuration (IRQThreshold + IRQDelay), not a 
per-descriptor attribute. Because of this, DMA_PREP_INTERRUPT does not 
map cleanly to the underlying hardware model:

- The coalescing delay is a per-channel timeout expressed in 
microseconds, whereas a boolean flag cannot represent a time-based value.
- Linux Dynamic Interrupt Moderation (DIM) adjusts both the coalescing 
threshold and delay at runtime, requiring an atomic per-channel update. 
Flags on already queued descriptors cannot provide this capability.

DIM is important for modern Ethernet drivers because it balances 
throughput, latency, and CPU overhead at high speeds.

If adding a new interface to configure interrupt moderation parameters 
for networking clients using DMAEngine is not preferred, would either of 
the following approaches be acceptable?

- Passing the coalescing parameters through per-descriptor metadata, or
- Using the existing Xilinx-specific struct xilinx_vdma_config from 
include/linux/dma/xilinx_dma.h, which already provides coalesce and 
delay fields.

I initially avoided the latter in favor of a standard dmaengine 
interface that could be used by other networking clients utilizing 
DMAEngine. However, I'm open to either approach if it aligns better with 
the subsystem's direction.

Regards,
Suraj

