Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF1FC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktE8EaTjeeXeT5OC+o77/4I/+X3y3qH0GDWwXwhM2EI=; b=krccBL0uJBPcUh2FjnbNFyWJPe
	3uIxcrcj9JFzyuz9S2dJu5CmEHZYN4ahejDwuVMYdWlFL9ekgimqJeArrepEHi+dTsFBbN+KZQWKk
	VMgUNEnvyOfrOjT6aLia76Fdfnqe2F9lwOGU18BTuyDsbbV9B19oSgIqEbffadsr8oLzttqqNwLbh
	SEt+0ue3iMD7Ilbz3l/XGboSr3CACzqvcd8QIL7kfSrYp9zPdrj/CvBTrHqsTPZ1wS46DS3Gd0CKJ
	6wTIK1FerWxfxFSppQ0jbd0QYz2X6UfUkTZJoaZmssx7Ovwg3vTZCPLzsM1teONOXgxGTYF21rQay
	hDbgaZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIWb-0000000CO3M-2KFD;
	Tue, 02 Jun 2026 06:22:53 +0000
Received: from mail-westusazon11010033.outbound.protection.outlook.com ([52.101.85.33] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIWX-0000000CO2j-3lr1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 06:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBxqzs+Sc+IHKdG3RKe4BORmv4AKRKenU//3FENL2ErHIvhyXdOtK7FeUTmuiJ+2XmJ0o99aPINVTbtTaCjj9URlgyfzi2cpfjYwb2RR9Li4C0kxMs+NP7T+L2G8n+r4ehKGCmLgkU710sb18mDrDmG1rJV0LEDuteDIBnKbTXyOe7JUI1vDFFIp/twz0iNX+GpMHNTkazaRbFspx4I3HR2Z/mBFcXxuCfOMwcBy22N3qhwz5jKc4Z4C3ePTsO6J4kU3PgduD2/1RKy5QkHjAUIZFuaRvS+6avZm7N8G2JQcTJNgneuZpv+qkg3BXANHmVBlHJJQ8gF4dNIb11UZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktE8EaTjeeXeT5OC+o77/4I/+X3y3qH0GDWwXwhM2EI=;
 b=ZGtrR5EbR01fcYaxlxOMfycXVyazIk7OIHQ8CvR6Zq1pNpi7MTs5g8fLUjFK1Ic73HEmZ3Ak3Z8qgE8FHI9qdHDZnqCJzx6ZnAMCNLb83KpWxvazyciTCEpD55sMFNNL97TFK+r7wOCTkCE43+2IF1oamVJhPKGiDyWmATve3JJNoo/AWjNvLSsy6pa9EySS4C28zkupxqR9/ASGx+b6jrO6x1czMXaSb5Grbt2TeItkPGqWMU2H574HpbcxXpQZMweqUpzPEZ0dWVkId3i47jo6VSVWkirxvf5vYjspeKjqzWh9gF3aJS/DBTz4GVtWWjkzydNSVM8H1ZpjcLoZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktE8EaTjeeXeT5OC+o77/4I/+X3y3qH0GDWwXwhM2EI=;
 b=sOAohF3zyEUR/k4Ih/T+rCAaMapE6X2XY4d+xXBLuTMYVQQATYkkLE9loNfRcyIyoHtoNn5x8wUT3DH6VR1JAo4BkgbJwjhkCZFVOiAhECq0dfF9qPZIj4EyWMiz/gkfA9oiT7UQQSNN0fYZrbSFjB013FU/MQqY+5g55+dfSVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS7PR12MB6093.namprd12.prod.outlook.com (2603:10b6:8:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 06:22:43 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 06:22:42 +0000
Message-ID: <878fd338-b4d0-4e46-987c-5a0ee52989dc@amd.com>
Date: Tue, 2 Jun 2026 08:22:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] char: xilinx_hwicap: replace in_be32/out_be32 with
 ioread32be/iowrite32be
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, chleroy@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20260602035717.623208-1-rosenp@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260602035717.623208-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::16) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS7PR12MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d276425-a17f-4b15-be16-08dec06f5a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RKzpEZGdFriOS8PidcnM4OV2Y+OZqvvWkqD7rNhMkdKLSbU0Ys73/7Ze+BRAYdVMBdoag8glsMzSmLi6s6XMXAJWtyAhnwWgQpX+DgF7wEE3UzfHw6pLHZGUomghvOru6UFjscATq/eosQsOu+yG/X8nxW5uD3tlFul8XMEHungCBcJ/LpyITCDGDKy6XEmnHEjiELbHUmkrHuuhAhAsAuO0GKGTPFc7pT9FsUkjcrJqvc6LSJBHP0wqBJrc7GXQ40ZcaxNhMUvH1Eju/s9y4bBp/5I2ZwnDSu/KgyYZGNmERqpvZ2RTJTfacuU6qrn1wOU831pWxnN7sCT1geV9rhGFnHt2ipHKe5HVJ1bSjuKEDk828cLH96l2PHVLKgEw9GaYb5dEczAZpeK6wUaQZcPi76JLJvZHRNLxSoAvOSOWXZYz5XRyl193RC4biNfe5EZIHsw4A+zjTUDHwxpx94tVcaegrfaxiWAG6zrcP0nxWDf+zZoLo5EAjwnQT3DT1p62CCNpQISyPOAoEA79JQ77lJr3Bx0fte+v41KUn5l4djm4vqc/cZvQFOxJ8E+/1F4747S+bG2an4ycrbbMg4MO0vsb6IJL+Ctly0gBQunFxzFMHPKl8+F1Y87R3oaKSwUlqaRXr/uTjUfR0THDVniBzHKOPVS31dQEYvz0JhnxXM31DwjK1FILP65MYb9K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em93Mng5cWt6SWRBRXhDY0xGTmhOeHBCRVVyazdWSEZlUXJOak14VDl1TkNj?=
 =?utf-8?B?QUFreFFKb3JMdEprUjZWK1gvZXk4cDJUT2hxR0hBMTZrdjR0R3BlWmNiRTBR?=
 =?utf-8?B?RDJaZFAzNXY4dHBmMTdSdXN5bEFhdG1oRnp3L0hEVHFtZmhjUExtN2F3cW5p?=
 =?utf-8?B?R1R0T1ZObVFxbExkZGdSSFZkNXdPV0U1cUxZYkhGOE1yaDhmamxoRFpwaERn?=
 =?utf-8?B?ekpJZ0dBK0pYUlpML29Qam1zcE40OHJteUNYTGdicnJUaHk5SEgycTcwbnZl?=
 =?utf-8?B?VmNtc3BzUjN1bHFTeG0raURVaTZucDh6UlY4bFAvU1FzdktmTUg3SDc3N0c4?=
 =?utf-8?B?aE5ZdEsvdU9JeXF6NmpiNCtkdnd1a1pDTU41L0t5MFIyMFowQVF1SzBMclpX?=
 =?utf-8?B?MVZPNTB6dWlTK1Z0MTRDbEp2akhsRHZFcDBzNUJMczJVNEZQK1NSYmx4Q0RT?=
 =?utf-8?B?ZTJiNDVwcUVUZTdWUUZrT3F1TW92ZkdSUXhiTHlEZlR6cWtCaHdXbURTN2tr?=
 =?utf-8?B?VWVKcGQyN25meSt6Z1NiU2VZclpDNk5Mbng0MUhTTi9YNjVxMEYrVTRnYzVC?=
 =?utf-8?B?WDRtd21XQlJpOTUwUGNyd1hXQlJSZ3pPZmNhZkdaZlFUeWxaV2MybEZWaVd4?=
 =?utf-8?B?S3NxWmVpbjhiZFhYUE8vMUFZNnJBeHAxY01yWSt2UnQxekFaNUpDaXBINWln?=
 =?utf-8?B?QmVMRE5ybUJ3U3NMNTZYSVM4dEZSODluSnpHQmxTVnIwSGw1Mks3NnpiZTJP?=
 =?utf-8?B?dkk2cVlIRU9Rc2Jod2lSMm9KbzBmYmpoM2hlZWZZdElsSFlmMkxkbk5XS1FP?=
 =?utf-8?B?Mll6bkQzR2VnTDFmSnJLdlN0d3orTFp2K0VIU3c3ZmZiZEhSRUpYZEs4TmE3?=
 =?utf-8?B?ck1CZC9ZM09pVjZ6OXBmMXd3YTJUdmFVVGJHSTNTazdoeG9YNUZiVW82TEpV?=
 =?utf-8?B?S25CZlJOc2NIa2lQaHhvMG9QeVpQOXFxMXlEbkxVeXcxUUJWMHRyLytxbDZp?=
 =?utf-8?B?aXl5ZmFicW44MGtVUE9qT2gzakpoSU1ZSkkrNHZoaUhGSmVKTXJHQzZhcmVG?=
 =?utf-8?B?VFFFNUVEUkpIczI2T1BLOEI2TnhoUmU2TFVFeWpReTdpWHpKU3dHanorNm1Q?=
 =?utf-8?B?WTF5c3RPdEhKbjZDcDF1KzgwVC9jMm1MMG0yTVg5TExjOWlKa0lkT0NjdFQ2?=
 =?utf-8?B?ZDBpOGw2WkJBVkVEVkNIUzg0S0VTcTBrWFpibkhuM002V1AyZU9vVHF4VkxT?=
 =?utf-8?B?SjdrR0l2bjhnM0ZVTjlwcUwyZHdNdEt4YjNyUXkwK1A5eHZJNW5lTE13Y0Vh?=
 =?utf-8?B?bmVxQVVIQ0ZWdmlFQVJiSU43bzg0dVZxZzJZc0dYcis2cWs3YnhKV0RRcjQz?=
 =?utf-8?B?dzhaY2Rvcjc3RG1RODZMVUJ2bDNKc2FkRTllTW1BbktmbXY5MkhTSEpHY2Y2?=
 =?utf-8?B?R3VrbjNTTTNRdVR5M2pIMXNURGFuQkw2YkZ6TjhySThObE5iR0tveXRnb2hY?=
 =?utf-8?B?UXVaUFBoYmg0RmdYeU5vS2dBT3FkR2doTTJlQTFqem9FaHBFcTN4R0cwSTlX?=
 =?utf-8?B?dGZzVmZjSUhJV25BZXEzQ1dHZ3M2Z2dqUTJpcHRtNjFvb2RqdGFjcHRuN1BW?=
 =?utf-8?B?K1E0VElnRFp0T0FHNXpuMFBEM1ZaTU1FT2U1bmlmT01YSHBHY0oxenk3Tk5j?=
 =?utf-8?B?Q2ExSW9BTHB4Z3lqKzhOZGlicHVVSUU2dmlMbklUTENLbHN2dlFrU3JWTWsy?=
 =?utf-8?B?YU1YN3A4eWdYQ1FHcnJtSTJWVUEzNWpvRGtXQ0FFZGhDSXpnVzdYc0NBd1dP?=
 =?utf-8?B?Qk9WOFEwVVV0NGVvVlJPRlFwWWpLUnQ3eTlrb2l2ZXEyQkM2R2kreWdpa1ZP?=
 =?utf-8?B?QTdwcmFUamcwbGtDaklqRnE2b3BmM1JaMUZ0MGFtOEZtQVFQSExrK0VIQ29a?=
 =?utf-8?B?VVZIbmRzMHdzSU5YR0h4aWJoVDBPdHYzUkRPVnFkL3d2WVc5RlFFZFZ1Z2Uw?=
 =?utf-8?B?aWRLSThwQjU0cWI5a0taLzFwbStpN1M2NGthMU0rblZldUREQUpGa0E4KzZv?=
 =?utf-8?B?ZjV1MDE2aTdrVTUrKzE2VDR3OW1NSTAyaUpJV05pNmwxTFVxdkVHd0ZVS1hH?=
 =?utf-8?B?bDZQaWluL3MzS29BdzZKKzZxV1d2Y1ZXZjd6bUtiU2V6WmpRRlF5MkhNSGh2?=
 =?utf-8?B?ckoyeW5sYlpmY01ZNlB5RTB5WGJRYm8zRVVkZmtCNTRuNVIycjVTbmx4d2VJ?=
 =?utf-8?B?SEcvR3k3QXE4Qnp5NTZINjBtclVpeThCZnh5UzVUMUFqcUpVRlVyZ1FLMS92?=
 =?utf-8?Q?XS+nC0YMPLpoH5Y5GB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d276425-a17f-4b15-be16-08dec06f5a7d
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:22:42.7210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLEtfmIYQBEUAH/iqrIbWXZ0ZgiU/YshNr/1zqu4XMUZRvi4dSRZ0B7DAV3m222P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_232249_952551_7549C29D 
X-CRM114-Status: GOOD (  10.42  )
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



On 6/2/26 05:57, Rosen Penev wrote:
> Mechanical conversion of the ppc4xx-specific accessors to the generic
> portable helpers.
> 
> As a result, COMPILE_TEST is added for extra compile coverage.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/char/Kconfig                     |  2 +-
>   drivers/char/xilinx_hwicap/buffer_icap.c | 16 +++++------
>   drivers/char/xilinx_hwicap/fifo_icap.c   | 34 +++++++++++-------------
>   3 files changed, 24 insertions(+), 28 deletions(-)

I don't really mind about this because I think that we can also remove the whole 
driver.

Thanks,
Michal

