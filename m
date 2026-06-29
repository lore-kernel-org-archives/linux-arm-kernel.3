Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA5DC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXMgwSRpRLXCJHz4bHNs7d4/QeN06QlVZalHTYhQ97A=; b=EW/wKdjjT9XRVF45rqBapGeSk7
	FbHUIBYcDyV9jOgf4osNXGIjGNxPoKac8cCiJi7KsdqJ01ZJFxIqYzq1fO9lW/5jPtnae1AkM6870
	LMfVOK/8aSJoS4Fvb2HIXK2wJiNojBI4dKaTbOfl5oURaKEOo1Z7cD6d0WIvFiyoaA/keBJzVIQK2
	XQrTQfePvkd2W9TCLwIsPblwUUHtg6zhnrmvobu3EXBC61DALNNsNYANrhWIxxfMw5y6JuxhrEIp0
	8o+78LYnlMVe3MqA4M/53jtae1Mj1k8oNf9H+CByt8wf3rrWxxvExlAV5+VfEMB3fyvEOQvGlPRIg
	u6S1v4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weChM-0000000EqYz-21ZA;
	Mon, 29 Jun 2026 14:10:56 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weChJ-0000000EqYZ-30R4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQ5u1CRvBTMEqK5Bdb2YHa2avEqFDw6LDTH8oE1e9/9gAK7G9WIjRQ07E3g6M8MaPk8U1DtGNyNlqB39EPCXp5ISYsIybD7XgS6uoeN2l6b12YaAnN8uUGjab/mp+FOGHGU5WBBMEyxbz/w1kiXVFxxAOXad3aSpyJT9non0MUbmkROaM5a+bK2dDtNB1wGOxE/WQWYB670XrbRM3QYts4i9jqL2zK9o5kfWKJ7RECZTJ++RfdTgznkayKTeHllvQFOR3Sqbknrwid2S0GmHENKjejrYQXY6dutFWC2PcRyeDJjgZpZW8nE9Jcna5rixci9AzPfrzxTJA9wDn9G7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXMgwSRpRLXCJHz4bHNs7d4/QeN06QlVZalHTYhQ97A=;
 b=Z0QBOTOGDYj3jjpYUIVmxlOXBWh9s9j62nYreGuhg/42CO48LmlMS63cZWWbpPeedp/92xQvRZdgklJ+z9MHdlLQT53Q9C47+du9T2JONcnGEhRt20wvl+pmjZ4l9QES92JJXDmHVA1GS7hS07fhI4qn6wEqkI1ZOggKc0LxvLO6M408OtyCAlyhiV5dDWPw76c66I/OnvnjvDrNsXFzbY7IaWJ64F0xUMDgb7dO3Snwr8GHyfJHA/xPik2dvK884KutxCua8AVCDFYTCnaeLxZ7TwpylTplXULXZJH2XtCmCSRoLlcs2s8zkZCiYFMruRwOV1bDSUXUILArqzFX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXMgwSRpRLXCJHz4bHNs7d4/QeN06QlVZalHTYhQ97A=;
 b=Sno8Ts2pJexwoTre/2c4I0z5YBe/ejO7aY28IddlLxvHuR/+YLLiPnxMiPJQQJgPMaPz6g9qLlBrRhd9x/ijXGC302eRaWMaBYUhFyRdHdicyVOgNiq6ypwfTSfsP4atl5d3qkSMLuHb4hI+VNYidyk6PnvqUyAWmkS/tyElnas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SN7PR12MB8820.namprd12.prod.outlook.com (2603:10b6:806:341::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 14:10:47 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 14:10:47 +0000
Message-ID: <0e4fc27a-9bef-4a78-9cc8-4d9c69c87773@amd.com>
Date: Mon, 29 Jun 2026 16:10:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Update Xilinx AMS driver maintainers
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260629140615.213750-1-sai.krishna.potthuri@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260629140615.213750-1-sai.krishna.potthuri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SN7PR12MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: e6fba052-f673-485d-6eb3-08ded5e83787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 2eg7PcY7PdZ7qUmPo7Nim8NeRMWxZ0Lg7nkyPYU3dH9C6cmp65gncIyMsQJF0GK4WKAhdCl23QRXWr05ha/fxGnTKDgAC8gUXdfBDF2GViS/DEu43Gr/QC39zouEqYrSDA/yaogoGtaAzdf7C/Ko2XHpdDf2tt/02q/eQufq+y9xh6Vg2e9X1pWkKkdq98yT7q/rSNCIyI+TgFYitiwIte7ZPphV0nMnbQ2HhtRIUsxYQSv+x2s3/7dSEAyZdXGSMFd+DQVKs/m8RoRmI9sSPOgdbgBg+31mRJR3Vhm/UlHonqOSqO6Z5UiooXiTjQ3cQ5fKXNsfm5sj8uT6qV88hVyXNjpb62dJio5XqBZxD0letDdiolYTKoP+dEH8WVc13sOCnFrM1vwU5nMqAigweVsRW9ss+1BR9tLIhbp6f5I5GFgqjpP9RvV2xGiDa+ysstafUn87hfyKy+i/p3BQTmnovBfKt7aqffZgDxm9G3RIuM1v2luVlYDQZd8QD5hkBxRs8gWCAKcjYY+O/6V26N4pSTWpk1A1W0M8ZBNYnlsMiFR3Ny2gzA+epyaCbsUw5r12atIF2RMMWiq9zCpqccGO6nNC4cAZCnxFmZNIMGnTLdr8gvQ6eP+adfRalD6u937Ac+CoVbdPnVdHokQQkdEfYj8Uf3Pipb4Uof5Bk4I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Slh3WUJJK05JdFlnWWc0NU9zYk9vbkV5RUF5Z2lrR2hlbCtRRHZBVzl0NXBs?=
 =?utf-8?B?dng0a2VLd0NqUC8yNEhtTDFlT0RSTm1jWHd3eENMTUtORmhpTjg4dWhFejA0?=
 =?utf-8?B?TGZ5OVNubXZYemk4S1BBeVV3UHJHWDF4eFVLRDBOQnlEWTZjNklncGYxWHNE?=
 =?utf-8?B?dkFOZXU5WlE4ZjU1QmE0YmlpV1RKaWFMQWxTVU8vQ3k4RzVCOFBmZGprVEpr?=
 =?utf-8?B?MTVyN2NMeFoveFl4Y3NkWGhPWXptWmxIQ3dBRjJTZjFtaWh1VmJLZ2hwMFg2?=
 =?utf-8?B?YVhSWGx4YmtDcitiVjlLL0NldHZpL0N6bmVCRXdzeXdBbTVuaHhqcHBWT0sr?=
 =?utf-8?B?WVhUSHFEMXBuZWpjajFPb3ZmMEh3MGlDRlU3VjlndmRYUWJvMGhrWHZ6VXVi?=
 =?utf-8?B?Y2Y3RXMyMXlUWmUvTDRkcGY0QUNaNkliOVdPMGJKSVFZMW03ZUhybG1BcXpX?=
 =?utf-8?B?Wkptak1ZUnlzU0EyWkFEaU9ZbGtEZ0dDOUg4ZXVKUE5mN1ZtS2o0U2xNeVJV?=
 =?utf-8?B?bVQ5em9xQjBILzNTOE9IU21xSHdFS1FuZU5uRU9oQkRQVTRKY0R5WDM2UVRT?=
 =?utf-8?B?M2hFaDdSd2k2aUNkdVZsL1VLVG1qMGRhSjc1dU0wbVFSVDNibjJ6K0Z1OFN2?=
 =?utf-8?B?UUl4WFFTeU5sckFud2RJK0tZSEgrRlhmQ1pCVGo5S1gzRU9yWXRGZEJ4Q0ly?=
 =?utf-8?B?cWZNUmtoVUhVQnp0ZndvMGR3dUFQYTk1ZGZteXRpcFp1ZEpnbGFHb2Z1elFj?=
 =?utf-8?B?NkJrdGZ1VVpsb1F1eUw1RjlnV08xRW5LeUJMZ3h4ZjZoK29hUHZzNWpVWkZC?=
 =?utf-8?B?ZVFuZ3NseFBWNkcwdWNicGdYai9MdjFYeUV5NlhyUm4xZzIxL3lTbGhOQ3gw?=
 =?utf-8?B?ZnFjMHQ2TkdiOGwwcVRWOFlLWmpsN01GU1hFcHhreWtlcGswcllHZ0JvcWxn?=
 =?utf-8?B?K2k2bStTYTFXSTQxaFg5Qzh0aEhSMzZ4cWIxY1pDWlIwRmZDSFVBMXM2Wms1?=
 =?utf-8?B?ckl0NWpDZ3E4eUJHZ1VpYVljaXNXVzYycE51cjhtclNxSVA0YVRBRDRwYVZQ?=
 =?utf-8?B?WmZCcEJQbmdTSGVBcFd0aDdtUTBwWHozUmlyS3NRd3g2WURkSjZML2RCWW00?=
 =?utf-8?B?Zm9Tblg3YUplVVV3ZHBJOXRwbEJaOXZmazR3MHlER1JHS1NPZ0p2eTZyS2tM?=
 =?utf-8?B?ZllaOWgwd2hxUWY1ZkJhSmJBWi9RYzFkbGxrRERYSkJzZ3REUDJETHVPQWNq?=
 =?utf-8?B?WEEvRDVRK1NxbVV5Y21GY3RCYmdHOG5HMWVVRis5ZG90eGdJeFpqejdua0pD?=
 =?utf-8?B?Y2tpTStoMjR2SVAwNDl2TC9LOEl2YXF4aGxGR2NmdHlYcjQ2Z0kyQzhZbFNL?=
 =?utf-8?B?RVltVTRhVk9IenhoRWk1WnpmUEYzaEI3TmFqSDROWCtIaXNYeDRGZlpqUFdV?=
 =?utf-8?B?RmVra1pmd3Fxb01yNk1BYTNZNzEvQzZrcGU4UWhteXhJbWVacm9OUHVJQVRr?=
 =?utf-8?B?TUpxZk1McWZHbVU3TFoxV2tSa203czZmUUxzOEVOZHNZeWFWKzlraUVRL3Vl?=
 =?utf-8?B?eDhLWFU0SC9vSWNNY2J3aitsMkM5MmlGMWJ0M0ZIZkdNajc5eDliVmlJOVQ3?=
 =?utf-8?B?MjlhN2RsNWNRU09US0Y2cWZBYTkyTFR4MHJhbXdCb3JHMnVKNGJsN3o0SDMz?=
 =?utf-8?B?OXpYMDJmYlJOR3BQN2c4Snd0Q0NpWWVDSVpyMzdRcmR3cUJDLzErY3pHc2I5?=
 =?utf-8?B?QmhZSHlEWWVyUnhGcUdnWkZKU010S1NkUExWbnVteFRhWkZNL043VU1ZWTBy?=
 =?utf-8?B?Nzdyd3Y1Y2UwczNzRFZyY3U5QVpuc3ovckRRaU94MmRMNzFpb3UxbkhuNXNR?=
 =?utf-8?B?ZlRzQ0FpRjVzSE5FbXp0NWhzZmxiVkJCNlp0a1ZyaHlDSG9jbjE1WTlNc0My?=
 =?utf-8?B?bnp4MWtBNW9MZVRjRGgzbWtGeEFzN28yVVIvT1l3a25Da1JCN0pXRGRreENB?=
 =?utf-8?B?RFhESXowNmhJSTVjdnZSalpiNmFnK2xIQUM5eitQWm1zTVNTaytqa3RCa05L?=
 =?utf-8?B?QU9IUnM0WjZFeW5BbmM2bTd1VStvekgxdWZBRGtYZllDcExaSUoyR01wMXJv?=
 =?utf-8?B?cmxmZllGdEl1U3hodGlMSWJaZUNic1BqRHNmbVB5UXZ4VnV0M0F0Rzczcjl4?=
 =?utf-8?B?cDcwZjgvcTY4Z2gzdHVITFdmamI5aTlJYTVJKzZIdnEvcUFYWGRFVWFZcjlG?=
 =?utf-8?B?ZVlBc2hNa2pkUzdJM1doZHU1dmhkOVUzWTRSa1FaK0tSVE1RalZpUWdRZDdZ?=
 =?utf-8?B?UCs0TkdtWllyNndLTU85cDZlQUdIeVc1WGlZWitGVGVjNTNta0UrZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fba052-f673-485d-6eb3-08ded5e83787
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 14:10:47.5424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6p9mphB4jgID+BDAyF6Wr4bKmawL15VSHx+TMTngFUv4mLlgke4uE71F3wH92wm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8820
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_071053_783494_01D4E29B 
X-CRM114-Status: GOOD (  14.62  )
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



On 6/29/26 16:06, Sai Krishna Potthuri wrote:
> Salih Erim is no longer with AMD to maintain the Xilinx AMS driver.
> Replace Salih Erim with Sai Krishna Potthuri in the Xilinx AMS driver
> MAINTAINERS entry for continued development and maintenance of the driver.
> 
> Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> ---
> v2:
> - Replaced Salih Erim with Sai Krishna Potthuri.
> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6b4560681b51..d8591066f182 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29458,7 +29458,7 @@ F:	include/uapi/linux/dqblk_xfs.h
>   F:	include/uapi/linux/fsmap.h
>   
>   XILINX AMS DRIVER
> -M:	Salih Erim <salih.erim@amd.com>
> +M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
>   M:	Conall O'Griofa <conall.ogriofa@amd.com>
>   L:	linux-iio@vger.kernel.org
>   S:	Maintained

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

