Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E578CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJeXC01ZX0Kv+gxjFzn/K1eK83NitK/Fkiq1I+/HdHM=; b=MSbOcD0Nswq5/VETEVZ01k2pck
	cJtQW5VwOzFvxH0zlU7CGVxIxyTuk72wRSXeTeCxBnIQWCtjMDFodpZkoQV7hC3HyDH6VxB26EjXr
	6tkNXOwGAVWL1yMnKCV0Y75A+wvyFlHpa2nyv4TIBs+NINka6706HA756CIuwcQW7eUUMm20ZWBvt
	A9dgY4GcRuJPDSxVs3zXTJ/099B8FhQpkqHA0BRbE1BPkEsBf69DAyjEddxJFRvgRiufEAvjQEIOZ
	CQbWLMgy1Fw5j8GUOuDr379rgy2keXsYT3U1wkJrK5menVd3ROyTjqVEEAaKosCMAFuhxiTWrWpQK
	ZqjM/r3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYQ3n-0000000CNXw-1myv;
	Sat, 13 Jun 2026 15:14:11 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYQ3j-0000000CNXZ-46rw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 15:14:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEsbPnj4CMp9LtX9+Lnc5s8fG600WiO/4NIfpWp7o4LgUPeM6aNUGsvi3CVLxqVvites4ykc+fnVQFmjuk1GIR5bM7Rg1tsgXMag9ZhdHItScIf51Rsv1vCNGsVtwuPt05RK41JWT7VkgzJZEBmCs0W+jj/qpJZdY4cEYqBzcRdOM+nn0CfbvWobVCSVt8R/CRUfd16ewuvqmMu2hEazgeOlUdlb9Onbjm8VGsd/3wFItVSivPyTNBf/Roq2sTIGJuFUIKjSU0+TN/NLUbyTcovCKuykRSWxF9b1/CbwMjiATaQiMlQ9bDfzrmA2/ciZyjNxYm/vW+34jKy+F4VS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJeXC01ZX0Kv+gxjFzn/K1eK83NitK/Fkiq1I+/HdHM=;
 b=xqK1SB5oYyXTE0jddLOshQi3yWe8zdu9mvt5r9BTFV+3XISEFBilqNzevBWYzDgWnewRzMl/O/zFdpg7rRJ5kaSSfy3244/TTjXkYZkDsy0htMYP+zA0dSZodShmEXvvpPhhiB/vZ7Q7xG9KqNJ/not6AxKd0OdyQyzExjiAdzAYOEaFyStRKJbWdivGsLayVZ91KZPnMoN9FFD1PrmmeHGDZ+NzmQgYO9Db08yIDQfvfFwDAuxj9oYr5gwzmhTVaTOmHi3Y3AeDDIBgHaCp6D5s+2IcV8OYXa9zGm3vwN8CT+5joholVuz4yFQY1ZSEqPbxfNVl4x97NpLvvTAtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJeXC01ZX0Kv+gxjFzn/K1eK83NitK/Fkiq1I+/HdHM=;
 b=CL/vAmrZ5rasZM9ozLPDCV0zxOLzMGWpGo8G/2h7XAKU0za7FE1VmofU/W9OvYDLx79Xuy6ympagqMjd0OytUDGMtfYjJIhZFO67H7pa20VbNWwJ9iib/w2JfxvR1PZFM+mmFcwGsb45ak+p1R9oKhBWJesVmiwSSrPUQvHSpnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8)
 by CH0PR12MB8462.namprd12.prod.outlook.com (2603:10b6:610:190::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sat, 13 Jun
 2026 15:13:59 +0000
Received: from CH1PR12MB9717.namprd12.prod.outlook.com
 ([fe80::b26:bd7c:5076:9cd4]) by CH1PR12MB9717.namprd12.prod.outlook.com
 ([fe80::b26:bd7c:5076:9cd4%6]) with mapi id 15.21.0113.013; Sat, 13 Jun 2026
 15:13:59 +0000
Message-ID: <419770c4-a536-4702-99c0-76f641f43cdb@amd.com>
Date: Sat, 13 Jun 2026 20:43:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx: Treat "xlnx,flush-fsync" as a flag
To: "Rob Herring (Arm)" <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com, Suraj.Gupta2@amd.com
References: <20260612215233.1887921-1-robh@kernel.org>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260612215233.1887921-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9717:EE_|CH0PR12MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c81bb0-2ffc-4289-5e68-08dec95e6497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|9063799003|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: CzpF+Ydw4C1d5hROFfDq+AogfI0Z1k7vGwcQijqZG9nuNBTBqPwVsL7Qjxs1ZkGZx4v6ILrm5+isntcona71ayUSqK0c1d6AHCcfzlzxotlgTAVqTchyVJgm0wbfhp+0fLiq/Il/2HMcusUDnDcKLmMo6g65SYIjw7OceWttYwMsUWBk+Uv/zLmKKdNwyBO2QHz8Nu3vdiPJeXi90m/ozSfytzpPiuXqeCAadxq5EMSyh9NIyC83rzbZHt7j5IWBqClBUwEWEljiv6XuGpTVfMEqqs7Uw90iuDX5CuY60D2DrHzpp4QZPCijJHPsGPAn1TV4c+TNVDT3N/YRDK8RPpIkzwXn0SB7mCDzYctY5WRKz3b+2LL8870HRW7EsKbFtRG3AdiygTl4l363EvVWAg8BmYrNYxOyxCAAJ2NSA0Cre/37XcE90srhN3Z6xFsaaXOpr2O1oP/sUVofhNE0GVuHw4B17saSz/yOAFOFd87zR/Q9cRU5SWtOOpWH1SRIyJ+9MLP1sjz4ndMSLBoNvKf/pP7aNu/zCgOeyPiumQnRcZewQp/UmQ34u5/kItiw3XDQvb5GORUYPLpikG2VE8/Dl9G0tBUUlyS+C1/2UGxKQ/LCMqtBka2W/KqUet8JkpIVMBbyEBEfb+3tvxt0gVXjvO/MC48jsBYBhQV5V+ougIqXuAuecFATiw/DfTWM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9717.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(9063799003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xETytoNy9WM3lpUS94WmJZQThmeTVFelc3L1RJRWlJbUlGWjNHdzArbUVX?=
 =?utf-8?B?SzBuT05BRk80THdiRnI5L3M3Zjdvd3BSdnB2Vi95WnBJcEQrV25saUF6VC9H?=
 =?utf-8?B?ZFdxdlhnVU9UbVBRVGtLZEJzWWczRENpZEw5dGNldndULzF2djhQT2phaVov?=
 =?utf-8?B?U3g3RmJjemxKckx4VHRPWUZWQzBWa2c4Qk12UG5qMWJMV242NW1IZFR2aUJ6?=
 =?utf-8?B?cjdDS0dXVlMxKzFQUmVFVzNPVENCaEhOT002eng1WFNpY2RERC9nanRKaFNa?=
 =?utf-8?B?eERTbEo1eGxncUhSc0s1OHRLRktHaHRtNmpzbzUwcW5QaVhtY211c1FPN2ly?=
 =?utf-8?B?TzRTWFA1SlozWElFQUl1aHNHcEMxMHFKY2ZyRWRyRDBPZE1MUkdjdnFvcUdX?=
 =?utf-8?B?SEdNKzNCak1kYWJDTjE5NnZEaFcwK0NHT2tHU205QVpzR2FKMlgwUC9QcGlY?=
 =?utf-8?B?YjAvV2ZmTCtVL0dLMnlvbWFXaDFkcHNWU2FWUjVQd09ZZzVLekZYbjlZOHVi?=
 =?utf-8?B?NElFYjQ4bDc1MkhBSnZ3WjNJSWJKbDVGY0pZcjkydTJjRnExZjlJUVFGS3FK?=
 =?utf-8?B?M0lpcnZxK0cyNGNJR0xKanhWdzMzQ1ZpTHJYUzNJenV1TmZjT2QydnFXcWZw?=
 =?utf-8?B?UVNZQlovN2FmMGZ1anZWOFZQcGduZkpDVHpFTng3MkRBeWV1YWhwWmlocVF0?=
 =?utf-8?B?aVFnNjMzM0xXMktkcW94WW5janNjQ05URTE2RUhzb3lGZDlCSDZ6ZGlVY2c3?=
 =?utf-8?B?aFhKdlJxMC96SnRuUlVjMEpjdm1IM2VndGw3NWdaZEFkcythSytFWkNHSWlC?=
 =?utf-8?B?cWdoaTJUQmRtL3IweWJNTGJHQnJzeHk4UmQ3a1o3RkxTby9PekhVQ3BCTS9Q?=
 =?utf-8?B?OVJzT2VtQTJieW5QVytUWUJNV3ZuUWY2eWY2VDcvZ2RIU2RCclhPZjZjQXJs?=
 =?utf-8?B?aXBabUxoMzA1WnR0MVVjN1lTcmVZZjhNRTdpRTNsRStZOURXNE43UGY5d1N1?=
 =?utf-8?B?V3plYTZFK0d3QXlyMVlNQkJ1VzYxM2hwbGticjkwODRtVUlyVlNBTHNNUmNC?=
 =?utf-8?B?RTQyNGcxU1lpd1J3QjlZNGUyOGNVclZyVlh4dEtKNzZQQTdURWMrRERuYUtX?=
 =?utf-8?B?QmJXR0lRcUhiTFlVM0lENWhPYVR2SXBHUGZtMk1BekV5MkhGcDRlb1p4NEtZ?=
 =?utf-8?B?TkE5ZVN0MUszbXRWZWo1ZnRKVDBaaWRKNDI0MGZya0k3TUV4eDZCY3lROWxj?=
 =?utf-8?B?M2RMNmh0U0FDU1MweXp3Sy95NllPZDU0Q0VmR0ZFSHRJQi9hRVVTck5hUDda?=
 =?utf-8?B?S29icGFzanlBQStzbitlb0g4ZVFPWUtkQ3lWelpBM0lVTHZ5ay9DaWI3bWVs?=
 =?utf-8?B?TVJ6encxMmlEeXpudGp5L3c3dFpURkpDUWl0ZE1kWlcvS1IwRUxnQ1NWMlJu?=
 =?utf-8?B?WDBWNXFLTVJKeVVIaFdvVWFuNnQ3WFlNeGsyZ09UNTd3dWprd2ZjRWlNMWV4?=
 =?utf-8?B?ZUlOTUtKZlhPNCtGTjRyditZL3dLcmZpMXhGOW01VE1adjkvOVN2SmhyWmRx?=
 =?utf-8?B?eUpuMHN5RGxVb2lnNklBNjRLVHZNeTV0bGxWN1htRDluUVFFenlqa1EvblVU?=
 =?utf-8?B?SWtPSzFlTEdQYkR6bXRpRnlyOFBYYk9YLzNkT1hadzBLeEUvRUluL1JMbnRu?=
 =?utf-8?B?bUpZcXlja0dTZEsvL3l6V1ZNVkdOTDFMM2dkOGtETStxK1RhM0VwbnJFLzZQ?=
 =?utf-8?B?azBhZEtXZDNtTGpCVU1vZ0xsbWdzSkZuWEN0S01oQ3ZOL3c2USs1UW54NGhz?=
 =?utf-8?B?MGp6TzlCY1VaNmUrV3VXZUxNL1o5VGpKZUtHSUJ1Wk1Bb25OVWtxdnVZaytl?=
 =?utf-8?B?aG1FbVNQc21pYWl3ZnpkM3BxWGNRcTR1SnNkejZZV3hrNWZHQkx1MUZSVXJ6?=
 =?utf-8?B?VXdnc1lxM09PUUdPUWpXOGxxaE1CRTBOdlVSenlpc3NzaFoybUNBcG9sSE1p?=
 =?utf-8?B?Q3dEOGRNNHVWNGd2UzdjWDhQRDAzZDdZSUduNzQvL2dUT3RuRGo4U09zYnI3?=
 =?utf-8?B?SWpYU0RKaUUxNkdsMmlxSjZvMGJ3Y0lnSXE1Yy83UDNwY1NtMXpUUTBVb2RS?=
 =?utf-8?B?ZEp5dE00NUQwT3B0RWJxaUNIQjZzclBEejZqUC9MUW9xTmV1bDV0LzlJVGsx?=
 =?utf-8?B?WkYveElrcnpnUlJzdmc1TTRNWGVybS9QU0RBZ2JpWE9UYkZiZUZQMGZnTnBp?=
 =?utf-8?B?QmhSRERwYXFxL3c2cS9Hay8xN1NGWWlWMDByclNRMnp1UlNGb1F1dkVWZ01Q?=
 =?utf-8?B?ZkRGeVAxakNiaFZycjZad1VJZ3k0NkRWZDZGZi92N3drV2FLT3BtUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c81bb0-2ffc-4289-5e68-08dec95e6497
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 15:13:59.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj/sAJdcSaIe+si7urkqAEivuQXosuVZwIF5KxGdI44GvTJXCBf3QQYbOhAYRJ34
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_081408_034601_4777BBE7 
X-CRM114-Status: GOOD (  18.12  )
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

> The Xilinx DMA binding documents "xlnx,flush-fsync" as a boolean flag.
> The driver read it as an integer cell and warned when it was absent,
> which does not match the documented property encoding.

The original .txt binding (before schema conversion) was not a boolean:
xlnx,flush-fsync: Tells which channel to Flush on Frame sync.
It takes following values:
{1}, flush both channels
{2}, flush mm2s channel
{3}, flush s2mm channel

xilinx_dma_device struct stored it in u32 flush_on_fsync. However yaml
conversion silently changed this to bool which was incorrect. I think
we should change in YAML to make xlnx,flush-fsync as u32?

> 
> Use the boolean helper so the driver follows the binding. Leave
> "xlnx,irq-delay" as an 8-bit property read because the hardware field
> is 8 bits wide.
We can skip about irq-delay mention here.

Thanks,
Radhey>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   drivers/dma/xilinx/xilinx_dma.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 404235c17353..cbb23fd6e096 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -3262,11 +3262,8 @@ static int xilinx_dma_probe(struct platform_device *pdev)
>   			goto disable_clks;
>   		}
>   
> -		err = of_property_read_u32(node, "xlnx,flush-fsync",
> -					   &xdev->flush_on_fsync);
> -		if (err < 0)
> -			dev_warn(xdev->dev,
> -				 "missing xlnx,flush-fsync property\n");
> +		xdev->flush_on_fsync =
> +			of_property_read_bool(node, "xlnx,flush-fsync");
>   	}
>   
>   	err = of_property_read_u32(node, "xlnx,addrwidth", &addr_width);


