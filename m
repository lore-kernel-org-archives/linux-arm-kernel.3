Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC85ED1CDBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMQI6nuWwJtal/SRRV15Vez8hio8iq4H7nkRnnH/D7M=; b=ghc1YiRMxjvyzD61OmFK7fWDpn
	XDI6u1fbSsrtUI5leeTaxHhKvJQTO4/Ry80MQnTvPVQNUDYYKgupt5Jc3cXmhkMmvVw6Ww9bGCVSz
	q51t+8vTHN/0qI6sHH1+HkDhb/S2cNfNdZFvhs7JQ50u23v7YfKy1o80wexlpI+X/15bNxoacqckz
	JUzJuj/8jZ1BeLCOac8WZTZohzL4AjVuBKf4ryZVX2C9yvumfNqMihdQHf2o4KxK7HPe8LJlYUyLJ
	i2F6abuQGG8ohF4yCEqrDkZDAAVu7LoDDWE+mG8GGhgEowoRhiWHe9hvVgSjrPGAPLr/8sQA4zcnB
	Vh67Z8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4zg-00000007idI-23Lo;
	Thu, 04 Dec 2025 08:47:20 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4zc-00000007icd-3bZW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 08:47:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIpX5g3juQ27lBsrsraapj4LWOGuvKm6FISToQm0jVa6Schvt4xDE50o/KXEqhHrsVHQx0alLbPuPR1lcc9bMIZoZwCwm5jEJwTis6+ZYan90jeRSyCGiaOgcWdIJhKz7VAQARZR/vZ6WGJQNrGazh/AssJp7mhCQiFzFeSOa+ooKu019BqC2X2CncGll/Y9uLtdg1Bo3Xru3TKR/hfsmdgHOxgC9H6dX+X/1GNYCxhrF2Z4D/gAZf2jB+Xkif88J4D0Y/splpn2XBSFe9IHz01C1Lq8INHGYc4Fq6N1n1TXWP0pu5CUdDGuGCEExSngd+b06JnpoRvNK0+S2F2LIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMQI6nuWwJtal/SRRV15Vez8hio8iq4H7nkRnnH/D7M=;
 b=BYfzEVAe2a3pvOahiM9ajoWFHXjlKjkC6/oR9U9irYQ3NkdTmj8PqIjSuVlP6A2HOetB98Anl/WsLIQbrfkvWfQl35/zWqoL79uUA+QHKhvA8mwUP6S/LeyPrImWAlLA3YVlLdz8N/j0awBEhQ6/P0Ja8YEXKIUaQmlO1IrSQeCXD814TFkSCAUEHlna9jDkpQUEIV8qavxei6XatAexY2aLkUWKPdF9MJhZT94MjoeKgOUCv+JC1WEeD8yhD5nlSdNMHZB74prpUuH9Dy9H+HaP3Bn2GNxRVNNXjzFzF9pKEFgXp67Ftas4f6W9KCjMx1FnmU06FAgtNenuWiioAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMQI6nuWwJtal/SRRV15Vez8hio8iq4H7nkRnnH/D7M=;
 b=eyRYGy+RJD49Y48MHoFHRjvHtAwqeiakmFPvao3K6X+VEKnrEC0QyxAhL4OIKPtceE5eDTeg06NuGkNBvfgDLAQrFVENa/7r9Hn6qK9/nqrzY4TAnSWIUeayxzg+dXoUo7TbDrGYfLOzDo0tn/lNl/cLqYZrO70dwMbAwV0m6Ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DM4PR12MB6495.namprd12.prod.outlook.com (2603:10b6:8:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 08:47:10 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 08:47:10 +0000
Message-ID: <f2913b37-d259-406d-9f17-b1b5028cce6d@amd.com>
Date: Thu, 4 Dec 2025 09:47:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-xiic driver changes from Cisco
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>,
 Michal Simek <michal.simek@xilinx.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Gopal Saha (gopasaha)" <gopasaha@cisco.com>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
References: <aS8cG4Otywg1kIcr@goliath>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <aS8cG4Otywg1kIcr@goliath>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::44) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DM4PR12MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 082e954a-0a06-45f0-482b-08de3311b6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk40WG1ySWRrYy8zczBoVFN1TTdxY2ppZ3ZVTjhTZG5SS3EzU0FjbmI2WUlw?=
 =?utf-8?B?L01KN1d2QnZxMjdmemdGQ092cFdaRnZaZG0yTk9nY28waUdZZXppdmdQMnlH?=
 =?utf-8?B?cWpoekNCMU1FTldEd3doUElXeTlzKy9uR0FweHBlSEpiMDduMU1lRnNnL3Bo?=
 =?utf-8?B?aVFqWEc1RlUyZy9mZWNwU1lMRGFxcFhIVkVTUnJaRDlYUnhpL2czUC9qWGpy?=
 =?utf-8?B?Qm5YY1BqMWNNaFVGbjZPY2FFN09tMFEvSFZIY2JhT1h3b3ZxOTJYM3FiUzMr?=
 =?utf-8?B?Tzkwa2xpcFJTcFVjdlAzRElUTUkzbThqMU1Pc3ltMnE1YzFNQTV1L0t3UVMw?=
 =?utf-8?B?RHNwZXYxTkVEUlhGTEVCNER0SkEwcG1RN3JRM0FWd0hlYkhodUpoYlUzV1Jx?=
 =?utf-8?B?MGtzNkxmbTJkanUvOGw3Q3FRaXl3d1YrTzZGMTRHZW9xQ0FldW96SFhCeU0r?=
 =?utf-8?B?WDE3SHJya0pLbVBCSkVMcktyNUZ1WEtnZXZRMnhEZEtWVXlrV0wvYkk2Yk5M?=
 =?utf-8?B?N0lrdjlJNHZwM1BISmpKNmR5ZFpUaWFySXZkRmdQMHhDRURwTVBnR0RydUZF?=
 =?utf-8?B?ZjZYeERia2RZWWx0RHJ5RmlKZDhKdXkvcnlHejc1L1NiOWIxZzQ0ZExScVp6?=
 =?utf-8?B?S3JKcW1xOGU3WU9kRndsMzRSaDVRbm1COVFLOUtpeFZ3Y2tUdkxFTkVJLzNP?=
 =?utf-8?B?aXFTWVJkTW1IY1krY1hGUGIrVWN2V2J0Q2Jrd2hQUm5uQ3owTFpUV3dUSUto?=
 =?utf-8?B?L2hHSUU2MWo3TnFMYy9WOERWVEd5dndaaTNPcVpIZUhRZjlDRkJOZkxNZHY1?=
 =?utf-8?B?WFRISXNSQlFaU0N4aWprdi9TYUMwdW5NUks1Q05kcmlxQ2JPcDVMbkI3bXl0?=
 =?utf-8?B?ZDFCNm4rNjJFODkzQ3ZOc3Qva1UrakVvQWw2WUpIeVdFWk80Qi9sK1Ixa2lL?=
 =?utf-8?B?MUhSSjFoQTV1TEJLaDlyRzgzQWkyQjM1eU9CNjFncUt4OGt3bzNzR1lncWhG?=
 =?utf-8?B?cEhMSVlNbFIxcWV6M3ZQNWdaSUlJYWZhcnAyV0VaUU4xQlZWOWVuWkw5Tm1R?=
 =?utf-8?B?RWpuTzhZNStjZjVodnh5UitRUGFLR0wvQWJQam1WN3NvanRKZlh2YmI2LytF?=
 =?utf-8?B?QlRMQWdIUHZSck1xaWRXclFmOHJZSkZ0VHpoN2JXTG01VVFSaHdGT3NZdUN3?=
 =?utf-8?B?aWZRckVncjJuOTNWU01vczIwRnhJTUF2VXNNWnBnVHgyZlhzdVErSHpvUE5N?=
 =?utf-8?B?SVRiUWt0REtvNWhObTJzY1RHM1RTR1p1NU9ESWVNSFVodlJ4ME9ZVkwvK0FT?=
 =?utf-8?B?WDBTOTRDcTI2Y2NsYzMwb2FzUThZZ0dmUlhPUTB4ek9OcjQ2VURZNVR4Rytr?=
 =?utf-8?B?bmN2aHlNdjI0VEQ0VnpId3lNQTVRNGk0QUJCWjJYU29aZzhwQzdVWXdvazhu?=
 =?utf-8?B?bW1xZHhKS2I5dHBxSVd4UnZaREg4RlBYdFNFUHc3eVZ0TXhDSy92eWQrNHVC?=
 =?utf-8?B?UEYyd2FySjViYndjSnlZM3Bxa29Ubm54amVMVy92cmtGTEZqSEdvbkVoWHYx?=
 =?utf-8?B?SkRaODJmZVFJZ0thaW53T2VuWVRMbFVYZTQ4QmpyTFh3eVBOSjFMdFF2a3Zm?=
 =?utf-8?B?emxVbjZLT0prUHcrTjNKSk1tcUtPMHlvTGdwdytTQnJIRkozVzNyVWVGZ3dl?=
 =?utf-8?B?MDVjb3RtY2ZqTVE4cUpLNjRibDlWOFUrUTBIUklFTUhNREhMREhib3lYcDQz?=
 =?utf-8?B?a2c5NmU2REFaOTkrVEVmMUtFbjlxbENmbTVHTWR1K00zdUEzRXZqczlqY0lv?=
 =?utf-8?B?bk1WSWNpVVcwaGdqVDB3RTBNckN5WkNlSktobHVXUVd6SWhvRVdvVzg2TURt?=
 =?utf-8?B?QVlDaUR4a1VONjFKd1lPYm5GZ1RQK0F5T3VEblRISlhpUDEwUGhVMUFtSStH?=
 =?utf-8?Q?USEpwPtfbTQmcC/nEqROfnHOLOpGg7FQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWdpalhrOTg0ODgyNGVibVZRZUdnb1h3b3ZKWGlCeGtoTGdkUGE2bHoySWJq?=
 =?utf-8?B?R2VjYkw4YW8wT0x3ZzUxVEczem40UUl2Q1hVY2kvUlB2bEVGVWpva1FyKzNC?=
 =?utf-8?B?Qm1obVZ1VThFRStNcGt3WXQzczB0OVhhMExrcXU1VitiMEtwNFc0eHIycmxZ?=
 =?utf-8?B?Z09IVkdDT1BjYUhnODhRaGJQWFJzVjB2TXpneHE0OStERUE4N2l0bFNRaEdK?=
 =?utf-8?B?OFoxV1ZBWmhWZmx4QnRGQUdPcEpDeDg0RDFERUo0S1RaU1dSQWg0VVF1SFY0?=
 =?utf-8?B?ZVZJMUIyd0V4a2xLamFxaml3emJ2V25xWWxzRXEwZytsTUtPU09hWkNKTm00?=
 =?utf-8?B?YnM2aGlqSmxuZDJ0b1ZEMCs4NjBlRWJtS092d2d1b0Zia0NvUEJDLy9scnI4?=
 =?utf-8?B?bG1YMktpTzhaMFVlMmxSWUZTUVZKN21KdlpIbzV4U3N3MmFNU0lIUWJHVFdF?=
 =?utf-8?B?czlXMnBCTkFSWGc1cEJFR0JhdWgzVkZPY0poSUUvZ1lCWFM3aXhpK2txdi8w?=
 =?utf-8?B?VGVpODZjaVlKZXV2NTdEbGhBK2RDTG9xK2E4L3NTMmZ1N1ZuaGp2dWw2cVV2?=
 =?utf-8?B?NkxHS25GeHpNVGJqUEVuSEZ2TUY5SGRhRUhvOVh5M2FCTlBQK0xVeEFQQVJu?=
 =?utf-8?B?SklPZzZvMC9nZFBTdG1QVUN5WjJ0VVJrbnFtelRoZlhzWXdWVkpHRkwwa1hL?=
 =?utf-8?B?MHk2Q3ZvNnB5YlpOSUUybFIxVGt5alpqYndtSXRhNzNpSGZMa0toS3lIR2Y5?=
 =?utf-8?B?aFRqWkQ1WW02anAyLzlXWTRqWk80aHlJMmQzR0F3cHBWbVNkQmF6MnNoSWxu?=
 =?utf-8?B?QjNYd3NLVGJKNS90a1hBNEtpY0pudTNNd0VZYWFTOWNkWDR1bmJLbG5KQkRt?=
 =?utf-8?B?UWZaZW05bk1GSXhBRHMzMzNubXhMRGh1UmRwMXNPZUoxbHVWRUQrakhxY21a?=
 =?utf-8?B?U0hJTGhvd0ZyWjQ3ZFBhT01jT1cyRm9iaGI1RkFXSjgxWGkwS2VXWldib3pL?=
 =?utf-8?B?ZjlORnRoVG94b1htcVl4bGdKTzczMnBFNEltelpZRi9zS2pKRUFTS3g0ZUZy?=
 =?utf-8?B?QVYxNXNFVERGUkdLT0o5Qk03Y0hpQmk1ck5XT1BIR3AwNFg0V1EyRERjWXpR?=
 =?utf-8?B?amJVWVJCYUJTclpQeG5xMHFDZmZrMEw1ajVIdUthOVRwclpVM1Y2S0NGZWtO?=
 =?utf-8?B?VW9ycHhWMFlXblJ4aFBtbC9VV2RJNnBscXZ0SjVXT3dNUHYzVnNHWDZ5ZTFY?=
 =?utf-8?B?eVpOQ2tiSU1FbFI4T2pLSnJHSzZSay9QL2ZkY2NiYzZSYStsWHRYNXp2REdR?=
 =?utf-8?B?dFpXT3JwTEpCQjErcEs3Z0RHdmlTbHorRTYrRWl0dWNlUVR1dE01M3c3TzI2?=
 =?utf-8?B?bWVVdkVKQnBFQ0x5bzVKUWRsbjRnRXNzTGEwc3Z0aWFBakFwK0RWU2VvNHR5?=
 =?utf-8?B?ZjRkRVlVNkNUa2F0M2ExOFRjMzFYd3BnWkNCZllyMVQ2d2ZzMlhhOEwxTHJQ?=
 =?utf-8?B?dCtycExHM1dGUFJrTkhMZXVtb2tYNTBjYUtDNU54VTlpZnRaK0M2WkFMTHhE?=
 =?utf-8?B?cG52aFJCRmdLRkQvMERMcHZacFFRZ0hPYk5tY21qRWVIZWRsb2pzalVEaU85?=
 =?utf-8?B?UzdZMWlMN0xOc0lUZ3ZXZXlXaFlhdnh1ODBMSlVvaGhiY3NSemVtb2FjRE5L?=
 =?utf-8?B?aldLaU0zdjUxSlJlSmxMaVMyRUFSWjhTN0VPQy9hdkw2ZEtOckNURkYrUmlw?=
 =?utf-8?B?SXlnQzdyaTdzT2JVV2xWZ0R6aXdodnpVRFRQV0ltdFdNeldMTWNMbEJIYXpH?=
 =?utf-8?B?MW04NG9aWk5PallyVlBTd05sSWptSGo5TUZHemhvY2diOUhadHJad09FUUtU?=
 =?utf-8?B?Tmp1a01DWWxmdFloU1ZuMDQ3SE5tQlhtRmtndWFUVmN6RDc1ZEJ3SlRQUXFW?=
 =?utf-8?B?MHNHdVcxd012SVQ0NlVmZVZCcWFDcFlBYmNOTEt2NnloNHNJeVYzejFMWFVo?=
 =?utf-8?B?YlViN29TQ3hwZnBoTGI1TVpVTDA4SEoxeEVzY3p1T09BM2xQUWtnYkx4VWR2?=
 =?utf-8?B?QUIwZDd4QUQ4SVpCZm5rdkRXWFFrTDNxYkdoYndRN2tycXdUcGppWkN6Rnlq?=
 =?utf-8?Q?+IFHqJQS7UNtwvAEv3F9SAQ+T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082e954a-0a06-45f0-482b-08de3311b6ad
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 08:47:10.7825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI+PLOzTrFkeAREcI1d7QzsrAkGFOIkqxqTdSSGGH15Cr+bMghWBYlYHEEFBK9zy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_004716_964403_8CCF5627 
X-CRM114-Status: GOOD (  18.03  )
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

On 12/2/25 18:04, Daniel Walker (danielwa) wrote:
> Hi,
> 
> We have a slightly modified version of the Xilinx IP which the i2c-xiic.c
> sources seem to support.
> 
> We made one (or at least one) change to the IP were we don't supply it with an
> interrupt line. It doesn't appear the driver supports this configuration.
> Is that accurate to your knowledge ?
> 
> If the drivers doesn't support some type of polling mode, is Xilinx willing to accept
> changes which would make the driver compatible with a polling mode if an
> interrupt is not supplied thru the device tree ?
> 
> It seems like it makes sense the driver should support a polling mode because
> Xilinx customers may make a product where the interrupt line doesn't function
> properly. In that case the customer would need a contingency which could be
> polling for interrupts.

Not sure what that change means but if you don't connect IRQ in design I expect 
vivado removes the whole logic around it at synthesis time.

Anyway using this IP without IRQ is perfectly valid use case and no issue from 
my side to also support it in the kernel.

Thanks,
Michal

