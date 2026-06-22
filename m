Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B05CCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAph1O3z9xAfjyT+g8aJSecL/XoSiDHgNv3rjIwaIK0=; b=Jj1z58YkDo7mwiERybN7Ch0knO
	EK997vcdbX4Y0Ikaaz1DsCW/DfNbpbReGuexlvO43lY3r273j4RRqEKtLY5Wz3GTyCGXVEydyq4ik
	2S60tq0Eo9nduMVOKaGFZ8PqaouSZAaHXsiucXd9DGWui+rlySLXOtNSrWqqlnztys/btyrDW8ove
	ntXO1+yeTVhguRIrejro1lG5mDbvZJchJCrxUrS/SSrFi2Zf0XblIc2hwdRIln3wSIoqZwj/7GrXG
	yyuwgX5uR4vdggsXlMdhGpl1rLlFag7sZSePbKrgu5vnfsBgKeAylInfSgf0STvxMkvFDoGTNA3g2
	Wtr6V+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeVV-000000050g3-3Rzy;
	Mon, 22 Jun 2026 13:16:09 +0000
Received: from mail-southcentralusazon11012033.outbound.protection.outlook.com ([40.93.195.33] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeVR-000000050fV-1J45
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 13:16:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seu9/xfEyBH4AHZQzHlsyi2Ib2EH0eM0B65FHlPFQyqNV//DB7KfeRvxMXC8eUkCenh0kom+QzDKqp94dOx9B6i22Kfjn1aCZMlFvzkNt4bkVST3ToYLxCYQpB6fNRW8MNp+RpPYVcbr7Gpw0J3udPXbfcoIVOPw4NR4IhGJEt6AuBbQAY5U6Auq4iW8I6uW3V2Y2lrwWlQ9RJVcgW84qq6cJID16DFFflnUiY+KfnlX+frIzsr9FcFHfhvZKNyn6WtLeTtt4x6LXS3mUGL5ybzsbAS/AHintn8FRa00T8WwLavpWDwiVG7rEpx3f0i2rHw1gyPkPB5yZJ39SgrqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAph1O3z9xAfjyT+g8aJSecL/XoSiDHgNv3rjIwaIK0=;
 b=mqyB4Ddv3uIaW6MO3ZDtU2kLS6ly1AxZ3T6C5jMy7alskGzt3RfGxENxxKqwkeB6fPEsDfMFLRjhnZzxVhavVlcc/r4uLYlFYoA3vepCeYR/NO9pFwYpXnl0TkAQEy/Y3OKYFbwRU9/Yz4E5wypfgiv6YAAcAaxlJO0rdXJvZ6xyiVroVrgOV1EWY0qgM4AIk0c84VWtkW5Wc0qEPqV0bvZ9pHzq1wcWQBgo55sU1OmJghTpegQfWGiJVHmuh58nrwvQzhCVM/9pRj71PYNbDI/mrZ8HNPwnbbMh3wh5DU5Pjfq7ZR640E5FqW3HbU4waqZdvlsyHgEpw/XuHQirBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAph1O3z9xAfjyT+g8aJSecL/XoSiDHgNv3rjIwaIK0=;
 b=j6hE6QVM24SWlfyNXt1JoP8jUGJCHc4G2lPqvvUuDix7E2oZuNpUl23SWZ8e9QK7j16HpoZNxq3XqUJMTrcbjEHdUtyjrCNH90RyG6DTTFrl5I22nYq9qlAvnNR0yn4KCTENt4bIrq7uTok54vQQxUrCP62TmqjxJTXZgvs23Lk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 13:16:00 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:15:58 +0000
Message-ID: <7a21e206-c9c3-4299-a26d-f23abcf38b6b@amd.com>
Date: Mon, 22 Jun 2026 15:15:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm: dts: xilinx: Add support for MYIR
 MYS-7Z020-V2 board
To: Liu Yu <f78fk@live.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260619102214.223121-1-f78fk@live.com>
 <20260619132355.1776-1-f78fk@live.com>
 <SY3PPF19552C60735AFA1041A0183DCA07CC7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <SY3PPF19552C60735AFA1041A0183DCA07CC7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0023.eurprd02.prod.outlook.com
 (2603:10a6:803:14::36) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5aa7d3-9c73-4524-bf9c-08ded0606607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: f+DNEgXZeQjOvThVaFmrqmv607ihlXIFa76nIU3YSw0W+3difHJLizwaOLAbFC9gR/usuQ9GEJ/PWG7KIGfDWdZ/HhtZv8G57+6XXLWG52AzEFgiJns+a+HQL+11Kz0sOaxH6A2wLOMt/IkttYr15r4uiRv8JxBeDPfWK4eFr1OEoCy/ePNgxqPsV/BHFHTXkjn5qMUbhvLgcj3bSfG0eBn2odSNL4eeK4aKwz836yFbEx7YaqWXnt97nuy/eipYdkrw0tL2Nxvtmi9ld3dYMgtHYbkgOJ2WdI/u94vcGYb54MZ9HlGHO7p7qGFTsNHzHGI67VSLb1PauwHyEGvzUZxyyNkbNjd8WvAjgsuM5CcXV9eYKpa611gkPeKYLmsQ8b7sW/AfPHsLqi5v+/G0DmbtXu7524oInxd86dMae2BrMMhkm8fDrvuwlZU1jL4/aGnB5uJX8jDjcOyhwAKRQNni4Fkevn8xyxsAwwTTvJXAD/ZD/6dIrEPzwWxwewlFQpaOWyUyozekRf41ZfSzT5fL2J6VXWd1ykonuUS2BdwNNGxwV2dqOemn6e2xPzc2eqsfhBBx0VSRLL3JcQHiwc3Elh2bP5cVEqlZ0DQiwEmccvjfojreEu3oRgYdYMoZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0JiSklobXVaSkxwSU14WCtqS2I3RXBBaHFOYzRDK3ltYWhPcDVDaDBjNVlu?=
 =?utf-8?B?Y2VXRUU3TXRmUFFOemRXSGl6YVBGMStuTGpLd1lwdXVmeUliNU9vN1dxVnpG?=
 =?utf-8?B?T2VCbC9ELzdHT2hvWlZpaFhHaUN5cUYzSnRaYjdkRDNrRXphVmRrOW5FUXY3?=
 =?utf-8?B?Yk9OempPU0NoMG5RR045M0hrOW13ZmZSeGhiZkhTTXhtdisycmhyajZpaDdO?=
 =?utf-8?B?dXlPQ1E5SlBWOFE0MnZVQ1hUZU1OZ3VRVFZrZ3lNcFNyL2Z0Q1lIZklXQWF6?=
 =?utf-8?B?WTNtcWF0dXFZVDBoc1FOdk16ZFZmMktBcHdxRDBIbVp6WTRkZyt6SEdjS2JI?=
 =?utf-8?B?SXkybUcrVDlWRjI0cVZRQWhuNWJwK3RkYlRqaWdyT0FnRHcwYWJTbHRTWkVY?=
 =?utf-8?B?NTlrek9DOWdPVkRhTGVETC9XOWtFcVhLRXJ0aTFpSDFvdW4zR01wcGpMNjM5?=
 =?utf-8?B?SnZ0R2s3WitCWUdSY2pZMnVYN2QzWU9HWk1iVmxPS2JFWWtKUXJpRTZYZUFk?=
 =?utf-8?B?ZzFGSXNwdVoySWgxLzhFK1o2eFN1ck5ucm04YklDdzlsdmRCNEorNnBDSkhO?=
 =?utf-8?B?SHBmRWRYR1hHakgwbDUxSnRBVWUveFZBdnM2MDRZVFI3eG1TSjN1UmV2WFRP?=
 =?utf-8?B?b3liV1pXWEpyTVZBUG9KSUxmODBwdjJPMDZlY2pFSkcvTGdlNVVpU1labWhm?=
 =?utf-8?B?MERrTldINXdTSG11NXp0REIvSTAxcEtDbzJtMFRzcGxXZmRaVkdJMHpOOGta?=
 =?utf-8?B?M0MwSXJ5MkliUzY0SE05blBBOUx0bzIxd295ZmhPaEY2ZVU5QSthOW00ZDhC?=
 =?utf-8?B?VlJpbGlXRUNqNHR5YXk3eWVuVGVZOWhKa1hoSHU3S3VWRWUvYzZGdDJId1pp?=
 =?utf-8?B?dWhzS0IvVnRjc2NOR0tzdGxoa1J5Rk1mZFRFUnJqRFVYN0dwRSt0WUJLTHpV?=
 =?utf-8?B?cllwOTJtNnNFY2RmUlU3d2RyMWdTVlZhYkJzcHZTWGNTdXZldEM2MFV1dURt?=
 =?utf-8?B?cTlPZUV4N015ZWVIQStlMDJVQVFjTE0yVEhMdTNXUlNCdTlyK3N0QSt0eDRp?=
 =?utf-8?B?RlJNaWRnNjhEM0w5ZGVjeWNhRXZNQXhnd1AyMFM4UEd0MkpGbThqR3ViZURr?=
 =?utf-8?B?UmNscWFYTFFQaUloc0NiVUd5K0lTbWppV05uS3pqZFV5bVJVMjh1dFkrMnFm?=
 =?utf-8?B?aE5kbVNqK1pPdW1DWXNLbHlmNU5JMHZndEM0eCtDaU9xWEcrU1R6Zm5wQ3A0?=
 =?utf-8?B?dHcxTUJlQVJsZGRQeldMaFdhejZJc2l5VWw1bkxaaHRIQmVzelVRUjBhYlM2?=
 =?utf-8?B?RFhPcVdsQ1RmQVN3VCtVTmF2dHRpdU8yNGlYOTVZZGlWN2h2Mk9KQmtCcGpm?=
 =?utf-8?B?b0RnUk1NcldRanIrYzNzOU1ZLytVSHU4cVpRMFNwczFQejA4MGNlZDRKdkc3?=
 =?utf-8?B?bkIxNHhkdmFGSXBNbGdoQmdLL2NNTDFpRTNKTHhHay9PU2NWUy9qZDRDT3Z5?=
 =?utf-8?B?UENOU1JJd3NWTDNkR1lreXpRK1F6UjhML2JlTitGU1hSRG03UTJsdTgxRmRu?=
 =?utf-8?B?eHJoOVM1WmpsMmQzZGM2TEZqVjg2bXVaZ0g2UWpYdExwQVBHSDRxdGFKc3hh?=
 =?utf-8?B?MVNOMUlqV1hDa2VHNHJjTlloTVBnT2NMWEhybXBMWW0yeFZEK1VIb2VIZUwr?=
 =?utf-8?B?bG53Nm5Yb1JOUW13VWFsSzdTa1ZramowdE01dmRFMzI4WFN3L2tDR2RkdlhW?=
 =?utf-8?B?MWpqNEZXeW9oejdjQVkraHdCNmIySktLTjZOd0hpREQ2TThZbDMvTGNudUlo?=
 =?utf-8?B?Tk1IamdkMzF4S2VDUGx5LzBQcFpSNTlPSHdCZm9FZnV2a1VKcVRsZi9IVyt1?=
 =?utf-8?B?RzFxbU91Rk00WGo4SHhmeWViQzY4aG5xR0x1aDZNU0JiUE83QnJHQ2l0TWJk?=
 =?utf-8?B?L09ueTVReGxxcnZsbG1ScXdZeHJRWFMraVRBUDlMZDE4a3lhYk16TWFldENH?=
 =?utf-8?B?a1ZlcC9QZU9OTzY1U1J2Tk0ycHRVU2hZbGowUkcyWG1MQ21TTWJrRjBJVWNm?=
 =?utf-8?B?QTJHNFc0cVBpUlYvdEIwK1VPQTVKNW84SnJjYXVxd2VmazloV05uWWZEZDcx?=
 =?utf-8?B?ZGRGdGNJNnZrQU5KNWNJR1VYbEdUSm9UdWxKUXpaS3FpU2Z6S2YxeTBaWW1s?=
 =?utf-8?B?T2paUndYUzdRdWEvOGlUd3BsaTU2dlRGckFBSlU1TEpQeTYxRFZ3SmNpVm9q?=
 =?utf-8?B?Z1NKZjczQWtybTUxMUpEbEFRVGNsYTVwdVNWYnZOakhrbm5kWVFDYksyWkI2?=
 =?utf-8?B?RCtaN3FiN0ZobElMZnF3ODVJSHdkNE9OODVYTjJKUDQwejJVVzR1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5aa7d3-9c73-4524-bf9c-08ded0606607
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:15:58.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZdcLgxcw+A4loXLh9EN0gJgsDJlhMFhxwk+cjiuOXGBv+MQs+zfj2CSh9CUlPpB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_061605_386085_2FECD7F5 
X-CRM114-Status: GOOD (  10.88  )
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



On 6/19/26 15:23, Liu Yu wrote:
> Add device tree support for the MYIR MYS-7Z020-V2 board based on
> the Xilinx Zynq-7000 XC7Z020 SoC.
> 
> The board supports:
> - UART serial console
> - MicroSD card interface
> - Gigabit Ethernet
> - QSPI NOR flash
> - GPIO-based user LEDs and push-button
> 
> Link: https://www.myirtech.com/list.asp?id=708


this is pointing to Z-turn Board V2 and above you are using MYS-7Z020-V2
which is not available on this link.

Why should this be merged? What's so special about this board?

Zynq went to production in 2013. Why should we merge description for "unknown" 
board using 13 years old chip?

Thanks,
Michal

