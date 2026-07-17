Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CC0C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 01:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esipi9dulbIpBE+N+GyY4DlvuRO65cVZjy0tHJ/qhiA=; b=KZWRtankK68zggxhFjKUYopfGr
	q6vUlOjNn9K0/1pjX9Xxc7nt4AOGr5PWYG0mn+7fiZGaZ/Ju/AMns+iLXhmJoL7jX2hWxo7ZTfr6b
	4Gr6pY+ObueeUj2SFw8RA3cZlUOdIxkVfpvwhCA5R94A/a6Dp/yYwqWePv9YqRQWaIGVu+2NF29I5
	qNAYn1FLY6YEHyA2aQryg1m0KTxBqpjRH/pS6/Z61U6x0G25hM53AR2qfpEqB0STO6bjakF8pwF+B
	VW7ndQz6lX+Btk+yj0mSWenfWYWxcPLvOvpXnuHuxA2T3HMfgVEMAE0iLM98Tz58d5sxR5LIb0DvB
	eqnNhF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXGp-00000000tUY-1kuS;
	Fri, 17 Jul 2026 01:21:43 +0000
Received: from mail-northcentralusazon11020097.outbound.protection.outlook.com ([52.101.193.97] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXGm-00000000tU9-2d5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 01:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajK+JQUIKrY4sd7lSvPtbxV5nKqk5xLIXzw5n0W7frgz7rwpTp41BBxAiEQOXPe4mm2ncdHkZOQprV0kXWxczZsehEBSmzauSVhHbm+BJkCs3F8MXXrxb/TcHEHhGQwX6F+/w7EtRNSuzIBwtl77Qduhkf95cwHJYAri2Cvq+WHCPF5FKY4nlqjVvLH1Z7hAVGHI7Sut3b7FbguaxstdaC//VRd5raxl21Pa8aLA/23BnCBQYdTLP0UPQtIHxtGgVS5MJYpVVnw87ShD2xw2nQEtZTiI9lF5RrWH9jiXS85HxPxeORA8cuEQSUJ+Ys1ZyUfKM21Zj3ULW5Ee8mngsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esipi9dulbIpBE+N+GyY4DlvuRO65cVZjy0tHJ/qhiA=;
 b=LT9YlaziljlfR2V9A15nAEoTe3x0T9oWHPW2X+fWFiGOrDt4xo3F1cwzUrrcRYRMtSlDBESu+3ztX8Dl5oz+uYYDitjBrUWgEiQ3kLYdch/1u1scHEFFP8x7nSK84OjA7+P6suF1NuVLBgUrCmJOrkUDRKIrivaPDLwmAk3KnG9seojKzNxrYwgBGvfoRMWh9thsSFK6jGZ6nKBPSmxLZpNKp2YRXTsqBlFfA+aT0xpcKRyN6RkdF+fSzLvJpEj3asqhk7+I0ADCO/aM7dKmCpDuzx2kqU3NQMyWmCGqaVJlWh/rHu402CFwMTcsYjwsaZeGG5BPn2ZTqR6oqtmw3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esipi9dulbIpBE+N+GyY4DlvuRO65cVZjy0tHJ/qhiA=;
 b=FrAmylXH8DC7Ne1E3I2Wa9Da595R5l8q0w07QhzeiSwb2IsKhAkfjpkbhnJLXfOPxYElECdOaSww9ao03eCkzRPpXgO8SScSe+ReWDMZMOC/ICfhdGZxIWi5LGeRP0TnkQbHjYoJHhtVudg0LCv8AUe6IgQJ3/6/Xjdm7BL4KfzR9Rb3eiHGhvHWEMithMT+BEHibFmtgvJe8HLFXlibcSImuUWFBx0xhtn65N/w5l4Mu/zUinwGbjXuYure1Ny+1WmZJ4Izt7YScKHleJxEtlbx5ik1ly60dxesovG+qPNXcHG3v1v5oGGmZkU3QNTKa5lMjYyTaBjYMt4Q4SQFSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DSVPR18MB445268.namprd18.prod.outlook.com (2603:10b6:8:380::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 01:21:35 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::ba9:422:da8:b963%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 01:21:35 +0000
Message-ID: <3763f165-f981-4078-9f7b-09bc45c78622@axiado.com>
Date: Fri, 17 Jul 2026 09:21:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] spi: axiado: merge identical if/else branches in
 ax_transfer_one()
To: Babanpreet Singh <bbnpreetsingh@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Vladimir Moravcevic <vmoravcevic@axiado.com>,
 Swark Yang <syang@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Karthikeyan Mitran <kmitran@axiado.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713060807.7-1-bbnpreetsingh@gmail.com>
 <20260713060807.7-2-bbnpreetsingh@gmail.com>
Content-Language: en-US
From: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260713060807.7-2-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DSVPR18MB445268:EE_
X-MS-Office365-Filtering-Correlation-Id: e38df724-fc48-42e0-e0b6-08dee3a1be02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|42112799006|1800799024|376014|22082099003|18002099003|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8YK1KocyNspiI256iLjqwr/DUGmwVPstIz6kHrX+KpdFWQac5dr0xR54WS8spQoH+KO5g40jTMZWZpi0qraxDsAOqLoZdn1Cdx4H1QuaggdfNStx1ifcq89QhNo4goX1e1LkvIsFSIq7n82faGB1rY7a1KALyyELiMHwWBvY5/EAbrTVjngu6wsHN1VwEbWcX4zY/RS5sf7AjT8MI2XmkxwN20LcQ8ko3YOHlrvLuJLGn8WopYWTBfAJMqeDH1YIb/P4U2eu2+EGJUgPvyJUaH3fo8f+hvg0tlEDDJSO43FnXV2zDHKp0FMh3S73ZJA32jpc01BYA5LyEWHmkjI//0jdO+oqc+/+WCZ48b0rs9bTO05cM5O60gRAGClewRxc9FaJXUmUgZrl3vOq3DHs9Ur02S0Si+bLBkPayvRznEdN9RCQFjPIkKUBH/u1ASLnnHUkSl8lzNGvks2BBSE8eGEugxJCiUoFH5Lprba9EhkdjhInlLfhKwcL+DXyeCGehATlo0tEX+xH7unxkJX+yNUdkNrXFOI0kMU4BwdhChfknfFu57RyEOxHfucmXCTj9Q/fFSHx3HAtv8xO5I9/ACcHf2iX1DRpVAms2DPHyhC/X2s2tMgo07F/nM3StpUSjP/qO4b5eIKoEPVpwRpoFBDaqcPaldM15pClzDRBS7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(42112799006)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWdDNGR1VjdqU0EvV3IrNEswRElJNWFwZ21ibVNaLzYzdkt2MjY3bFQ1R2k4?=
 =?utf-8?B?aUJabnBVQnJ3ZVJ0KzRlcDhQalZnVkMwVDRGY09pL0k5SnROQmY1UmNlSExt?=
 =?utf-8?B?ZWdpK0E1QWxDcmhOWEFHYXRERTgxWncrZ2l6ZFA3U3hPNUlmQ09zVFp4SDly?=
 =?utf-8?B?M1FQeGs1QlR0VDVKVWt6WDJWSE54TXh4S2hCeUhORllUYlAzVUlyM2htTWF2?=
 =?utf-8?B?TjF0MU5iazBZVFZEaUR1b2xlTmZhY3BjcHcyUjJwdFlKUVp1UnExbnYwaHVV?=
 =?utf-8?B?NFlrVDlEbnNBNjhBM0VEYU1DUGVZUFdzSVhOUU9nZCtzVVp0UTR5SmVYT3Z1?=
 =?utf-8?B?b1V5UW94b1VoNEdtVnUvejFpYWs1RTFtTW82YS9jb3E3RDB4UEdnTituR1ZT?=
 =?utf-8?B?cmpVcmJ0ZURVYjg2ZWRmVUlVYUFXeUNWWldmRWNwNnh4cS9hOXJhQ3pRYzYy?=
 =?utf-8?B?VTQ3YjR4STduMzNsMXQwU3lVY1paNHhFeWZadkZLRFIvUG81ZXJUZjJoVVla?=
 =?utf-8?B?d0NPWmFZZVJjZ1ZvRlpGK1FncEJYNER2Z2h3cHlIbU1oR1lENDlRN20reFNw?=
 =?utf-8?B?MFFpdk9KQ0p6VXJZVEIxWFgzZHlKdjk3ZXBJc0J1aDA2ZE83ck9xenpaZ0FX?=
 =?utf-8?B?VmcwRzFOa0p2VEJKQk80dE4yOGhITU9pU0JlSGZKUk12b3o2MzFGbmdacyt0?=
 =?utf-8?B?T2tEYVFockdQakFmL0kzcEN3Ti9lbjZoWVlqNmhKendKYmpkdVpER0hTUTI2?=
 =?utf-8?B?dVBkNTRQcThQbnA0em9uTURwL1plNVpBazZ6Zjh3Smw2TUsxbis2MUZKQVpC?=
 =?utf-8?B?SDExOSsydEQyeFVsODdDUFo2QXRSTmFsSytoMzFHY1RlUTNUcEwyOU9KYmNE?=
 =?utf-8?B?eVF4RkNsRU1UeVlMb3FZYlNybEpqVVV1bmhTc3NlenBZbkNrcnZmanVhaDhi?=
 =?utf-8?B?cERGT3dPS1FuU1R2Y3pHNHRSeEc5MHB0ZUlyb281ZlROaCsyV0c3Sk5paFh4?=
 =?utf-8?B?NW80SnQ4VmM4dWdqRXJUOVh4ZHI2b29ZTUswSkpnVVNjT0N5ak1aaFNyMEJj?=
 =?utf-8?B?VXNYZk1nN0ZzMXlnejZabUJsRVczdldUQXp1cE1aTXdZMVBUeWt1ZGRXYVBD?=
 =?utf-8?B?S0NGcVBkUmFNenZSK01RUmRXVHplTW5nR3BUT3BnWTZLNTFpTzF6R3paMXJS?=
 =?utf-8?B?TDdkWkpjcXJHSnhCRHJDaHB1cTVwV2NTTjNNWVJVZHVuZGZPbEUxOG9xQVdX?=
 =?utf-8?B?bTAreENPNEJEOThZQzZmRUJsV1U4R0dwWGxZa0Mvb0hPTFFYSTduL1N0NHVm?=
 =?utf-8?B?RWd2dm9FVFFyWnpDQXk3U1FmS3FXcjlIY0UwaGVYK25ubjN4TFkyT3NYV3cw?=
 =?utf-8?B?VU9tSVMxWko2dmExWnluVktDd0Zsc0xIVFJLSkdnTENXb0ZLaVM1aDhqejlF?=
 =?utf-8?B?VWxLMEIrTXd1QndFdCtpMHhBWlpRblE2dnlNMXI1ZUxNNzBrUjJpT1BoanFX?=
 =?utf-8?B?bitGT29RMzFiZkFDcmE0UXhXVFQ1WERVR0g4bUpVMG92V3MwK1hRNDczOFpk?=
 =?utf-8?B?T2RnRmVTS0tSclFQYmI2TEc0UngvY0pWZFRPSXdFMGMrYVN5Qm93bFRoNkQz?=
 =?utf-8?B?dWFwalZvSzNmZFFYYnpMMVpUWHprNkUweWtkbGZuUXlzOTdLTERSTzBJci9Q?=
 =?utf-8?B?aWFueXVkaGNUaUtERWNYcWlrVVZPZGQvblYwaEMvZThhWU5ta2xMa2dTY0tY?=
 =?utf-8?B?Tkx3Si9jNzkvaHFkMEl5TVdkRXFQdWpXcm93ekV3UUcxdzdkOFEwVTVXQXVu?=
 =?utf-8?B?amJCZ01VWEU5QkNaZE1qM2x4YUhaMDlIWTF5STAwSDIyeERUMEk3ckNsOUNt?=
 =?utf-8?B?eVJXeThXY1U0UTVvQi80UWJDck9oSW10YUFpb0dyU01QSk1JZHM3TUNCSGp3?=
 =?utf-8?B?cXF4UTBPenNRaXV1TFIzM3VjblVyODY2MmtKOVl4M0MvcER3L0ZKaU5IeXNl?=
 =?utf-8?B?M1EvRlIwa0d3NFl1ZEI4RS9hZUlnRk5YMzV3YWxodm9OcFIwdFFFTU53VU5U?=
 =?utf-8?B?VnFaa2FFY2VnRW4xVGcwRHRiRTVtbEx2eGdPM2ZrWVMwUkxnT3pibUE0ODBk?=
 =?utf-8?B?ZnUrckxoSTZyMURVNEkxTVo3cEVJL2g5RGdjckdEVnZGZFprTUlwM2lwR2Vu?=
 =?utf-8?B?WG5yWDJobW8yMjk5MEtnSlAxWnVSVFFsZENnOE1GbHUxWnQvaG0waEtWS0xI?=
 =?utf-8?B?eW9iQ05LZFZBbEYrUGRQdm1pT1MxaG1MSmNUViszVU13WCttOE9DRzRQSTd0?=
 =?utf-8?B?N01qMk8zVTVSd1JvSHBNWGp2Vzl2M040N1Zvdm1zZDB3MUd3ZzZHZz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38df724-fc48-42e0-e0b6-08dee3a1be02
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 01:21:35.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4DJbe2Ln9F3uOK/PvxcRRuH0cIGjfCoIjO5J6vj0rbJ5oH1IJKUSfUMNvw6628I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR18MB445268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_182140_694324_5E446331 
X-CRM114-Status: GOOD (  21.22  )
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

On 7/13/2026 2:08 PM, Babanpreet Singh wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> The else-if arm taken for RX-only and full-duplex transfers and the
> trailing else arm in the RX bookkeeping setup of ax_transfer_one()
> have identical bodies, so the second condition has no effect:
> 
>   drivers/spi/spi-axiado.c:433:8-10: WARNING: possible condition with
>   no effect (if == else)
> 
> The trailing else arm (neither TX nor RX buffer) is also unreachable:
> the SPI core only calls the ->transfer_one() callback for transfers
> that carry at least one buffer, see spi_transfer_one_message().
> 
> Merge the two arms into a single else branch and fold their comments.
> No functional change. The redundant condition has been present since
> the driver was added in commit e75a6b00ad79 ("spi: axiado: Add driver
> for Axiado SPI DB controller").
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202607121827.djB0zLAj-lkp@intel.com/
> Assisted-by: Claude:claude-fable-5 [coccinelle]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
>  drivers/spi/spi-axiado.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
> index 649f149617ce..c4bc7a50d6c9 100644
> --- a/drivers/spi/spi-axiado.c
> +++ b/drivers/spi/spi-axiado.c
> @@ -430,15 +430,11 @@ static int ax_transfer_one(struct spi_controller *ctlr,
>                 /* TX mode: discard all received data */
>                 xspi->rx_discard = transfer->len;
>                 xspi->rx_copy_remaining = 0;
> -       } else if ((!transfer->tx_buf && transfer->rx_buf) ||
> -                  (transfer->tx_buf && transfer->rx_buf)) {
> -               /* RX mode: generate clock by filling TX FIFO with dummy bytes
> -                * Full-duplex mode: generate clock by filling TX FIFO
> -                */
> -               xspi->rx_discard = 0;
> -               xspi->rx_copy_remaining = transfer->len;
>         } else {
> -               /* No TX and RX */
> +               /* RX-only or full-duplex mode: copy received data, with the
> +                * clock generated by filling the TX FIFO (with dummy bytes
> +                * in RX-only mode)
> +                */
>                 xspi->rx_discard = 0;
>                 xspi->rx_copy_remaining = transfer->len;
>         }
> 
> base-commit: 5f1b513690edf51727e6928b97705b6437f9a98e
> --
> 2.43.0
> 
Hi Babanpreet,

Thanks for your contribution. It looks good to me.

Acked-By: Tzu-Hao Wei <twei@axiado.com>

Best regards,
TH

