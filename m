Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E7C02188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 11:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRQnj/lHBFrmYuuU3eby7P399YaM59MHNc6+oTkKOUw=; b=LltYxiBlTApttOTsb0FtK8n3S2
	rWBFvjax4P8yvlEeqTaCQvjZgO/FPHw8sKSVuuTEdo12dZBtpHLux/z5+xjGHCqE70ialEwB75KaB
	iRRZ+5OcMB9dkRbszCE9Mqd3P0rJGGzvrIjTYoGa1/YmYKBW1MjwlBbZV5qWixGBTOF8NlJCrjm4r
	15zwN5GsKaCGd/ekxnJnwqQRap6MMEINMQWCA2UISrdFLNx22b5d8cw6vJy5GavxXbnDzBsUThlvo
	OGTQLWuTK+u6oTHVZCajfkCxxdoR+1OfLpccMqOh3i/J+qDeCSunCI5HBwiJhNuP9Z7J4Jrq/5AlD
	vsi8CMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYkuP-00000000Bce-16rf;
	Fri, 17 Jan 2025 11:53:05 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYksQ-00000000BLj-3skX;
	Fri, 17 Jan 2025 11:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4FG/P+OKrETInCvthRFOS8N5d0HbSppN91p+SThc1j4sVXeZqPoiXgFYGupxzzfNQ48Yhnu3vewrDgy8cifxcwGai5t5sTbEYLdO9sxhp7Afb3L2bD/V5ORfn4nlN9T4WWvRa7TJadOq7LiYZCAYrlfAEZn1Q99UfMW5eWJS3h4UE4jp4V7Wh42BqNPl3CC0lXvXRY/i2SnqghkyMFG9dcHpB3k4dTXBpwGMxhd/+TUsQsTwUhfeJXdTMOAregr+I1wUoYg5sZSzS0jWyDuOoCcJMMcRQsMyPacaXF8m0rMMZScpduyCTl+pdTV71/rgu6nalYq9oohedYo6CwpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRQnj/lHBFrmYuuU3eby7P399YaM59MHNc6+oTkKOUw=;
 b=I4G8m265EtBc0j37EiH7IxSFTn3YeRemU16nRaxBNqjR2rzpY/Abe7jwE2cyBw0zotOZbFbOHhDURysEPcspD5A475VyEgtoEzKBOnV8s077kju6zoKFAzDYNL3V5oP9k1R9i2CSBjKOTq6mUcOrzCPC5VUZjx5l87UlQUZntyBQHgraOuzK0qotecbuVJH+wvjTqUR6FewIqu46sdwqfZd35Lqo5ngfHobOUrZPskQ7nmkVnCXuivY1MTZ5yH/atJzWiQkzLG91e9IeaaRLif7nGKVTeKloMvu+V2HjrXa1SHBeC95lOmFQ+sAuMcpsLN/kh/gu737/UcEgLiQWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRQnj/lHBFrmYuuU3eby7P399YaM59MHNc6+oTkKOUw=;
 b=UGOFSElyh95w4jL1kZhnJAZMk24f4Tn7PFg9yVBlfPV4GIeNt6rkvI77ruE9ptboLcuSxYKJD5Gm7QEAcPTp2AG7Nio2l1PfxSdrWA+JAbFXjI1lZ6foOUBduOkUVtXrJW+PRAGC2dpLj/Axv8H+639lnjf32k91IUqJq3d2B/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 11:50:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Fri, 17 Jan 2025
 11:50:53 +0000
Message-ID: <4985c21b-56b8-45b3-a96d-1427ca905c6c@cherry.de>
Date: Fri, 17 Jan 2025 12:50:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
To: Niklas Cassel <cassel@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Michael Riesch
 <michael.riesch@wolfvision.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <20250116-pre-ict-jaguar-v2-2-157d319004fc@cherry.de>
 <Z4o2_0yX-hq-DfCs@ryzen>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <Z4o2_0yX-hq-DfCs@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc65bf6-3936-4f31-9647-08dd36ed31ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2RQdHQwZjdSTTBhM0lDSFJBVXE1UFNTVnZZZkNNVmtwb0JOaVdTZzNmTlZU?=
 =?utf-8?B?WDRpU1dhakd5Mzg3alJnR3dGWDBBa1FNVCtCd01ud0VpLzJ6bkkwaDlNTkQ2?=
 =?utf-8?B?Z3F2ZGRONUhlZ0NVYTBlV3h4Ync5TjI2aUpkd2pZVlpvd3pDSlhRekpBT09q?=
 =?utf-8?B?elhVMXJjZlZwWFFwd2lYUEtYZW4veEhWMlVVbTNtOGRQd2JobWFLZFI0aFF1?=
 =?utf-8?B?ank3dUQvN1d4NVJ0ZkZRSVZhY2ZIM3ZwQVFzNCtZKytldWxubFhlcWNJMHVk?=
 =?utf-8?B?S3YyUXBKa3h5cHZpeS81NmkzSzl6cyswNFl0WEdkWHc4ZDliQnBDMThFTWF4?=
 =?utf-8?B?bVJIOG9NWXFjeE5PSHVwYlozMFFCbk5tcUg5REJNTE1MS0lDa1hiZWp0Zmxr?=
 =?utf-8?B?YjhDbDR1Mm1qZjZoWktNVStoNStsdUJObng1VUVPaEtBeDkwa1JDWTVQQUc2?=
 =?utf-8?B?bks0M1FYUTlacnJlcGIyZWVaL0t1QUJwb3J5eHlDWjUySkk3dnkySjZ3eDB5?=
 =?utf-8?B?QXZCdnV2T0FIaGRhL3lRMFpLcFlhU3BxZGViRkRSL01yU2RReU5aeXQvNXNZ?=
 =?utf-8?B?TkRNRzhzUERrMDRVYnpmdjV2dVFSd0JuVVl3Q1g2NktWbGlhSVdreTM2UjhC?=
 =?utf-8?B?Y2Y2YnpBUWZQNUJuQ0dCQWtsSDR4ZXozNXk3Q0dSbWZhVjVBLzFOa21jWDUz?=
 =?utf-8?B?UTVXL2lwSmlLdCtDR0t0eEtzU2JuMFNKZGlQa3gvS3NQZmFwVDV5clZWV05k?=
 =?utf-8?B?SXRqMmZ3aEFZZ0loR1hHcVdTdEIxbFFPenEyV0hlUTh3Vy9raEV6enA3cmtV?=
 =?utf-8?B?L0lNejBxYytBVHVJdWthK2NzU1BZdmo1TUN4dk5pbUVzSDVJNmVMWTlTUEE4?=
 =?utf-8?B?bTBxS242TkRZVVovUTFtSTFvNE1nWjhTQ1RnZzkxWXA1MXJHaXgycWs3TE44?=
 =?utf-8?B?WlV1bm9vQk02aVBpZUVEZTNSOFhKaTErOGNjWDBkRENUcmxvQlVvMktRdDJa?=
 =?utf-8?B?ZHRrNlR0aUFmUGlDVmZQSytmcTdObG1md0NtUUtza0E0TE9sVG9ESStDanEy?=
 =?utf-8?B?K1UxaStRRVpTTkd6MytkRXlGSW14eFpxaXFFb2NmUEE3eFNYNnlIMmNWTmJS?=
 =?utf-8?B?L2ZHTUFka1hWbjQ0d2grQStUWGUwZEpkaVZuWGRITGVzVkhZS1hqd2hDYWxo?=
 =?utf-8?B?bDdUclVPajZLVG5WdXNVMERUN3J4UUxyb0p6VGFsbmtKTkNXOWVNNlRSbE1P?=
 =?utf-8?B?ZkNJR3pJZmIzVHBHRldxOVdTUi9rSGh3UmhVMHBreDlIWWNzMVhsRGYyTlgx?=
 =?utf-8?B?ZUhaeVFKS1E2a3MzZ29LTnpwd0VURUVGUmVCd09KZG5vZDI3RVVRM3hVam9o?=
 =?utf-8?B?NFBSM3kxQS9hOVRHRWJhZjdWdWpQVkZJQnRoMndQZ25oZ29wZnoydEIxZXZY?=
 =?utf-8?B?Z2F2QStUblM3dXdtUXB4TzA5bUgvWVRjRE8xUEdYRjR5RHMrMkVHVDdXQm1Q?=
 =?utf-8?B?ekdMeWJXbldFMmRUY1FVNjZNbzdpS1dkbU5DdXJXRHR3TEFiRWtSdzA3Tk1w?=
 =?utf-8?B?NDFQYms2cEJwZlNKTXNKYTZUYVRETjVjeEdWdVlEZ2ZsZzZzdzJvS1BIVHJW?=
 =?utf-8?B?S2lZT095YkVYOXZLV0RreW9kRWEzOUJPVUxTWWhPayswVHJGWVBXbHVudlVx?=
 =?utf-8?B?QVh0R0tHVEtVVldXa3ZKZ2hSeEVqZ2c0azc2emlXN3ZLcGFPNGMrM1VRa3oz?=
 =?utf-8?B?bzlHZ0NMMlNDTmcyT1hxdVlYdFFxU21jNlpkY3BvYzl0MmhLMGpmNlErMlpx?=
 =?utf-8?B?REY3eFpzRDBQZUs5aFkwTlNDU0N3aktFb3d5RFN2OWJXZnVyZGc1K25KSzly?=
 =?utf-8?Q?xdZ6dnVyxRIwP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9PSFhXUGdsc0dTdDVQWnFFdDJJbFU5NXB0SUhaS1lHYTJjbmpFZXkwRjcx?=
 =?utf-8?B?YnNNY0p4eE9MSk1FM0hiZ1luaTNUOVNCSlJNdWdFTlYvTU1SVjBGRDltbWRx?=
 =?utf-8?B?cVhsVDZVZ0RUOUU1bUlKcmZaNGdNQTFQVjljTVpPalNWVDhXaHR5OVFXSnBQ?=
 =?utf-8?B?OENiWnpuOFg2c3pjWmw2SlkrME1STlp3WUZrYUxVUEVGQ3ZzdWlxT0JJeVlP?=
 =?utf-8?B?bHNQZ01Tb1FxYXpMbEwvVUZTT2wwS0ZMRmdzUWZFVFMxWDFvQVRHYmNaanJ3?=
 =?utf-8?B?aTN3MjU3ZzBrL2FlNW5tNUFRRm9JODlhckRIY1dSbDFWSmFQL3JDbFpRYkdq?=
 =?utf-8?B?RVM2SGdyb3VSM2JKMlhCajBYMXZ4MzZhRUlVRzM1UVVGblhPbXB0dWhvanc4?=
 =?utf-8?B?UGROQzZWOEFtVHk3VEhobkxNYWZPYWxEMDVkbUp1TFdWVzNXNXVSY1NJcU10?=
 =?utf-8?B?c2VJUUg5Z0ttRGhSbGVubXhQYlpaelVpWUFJeW1ibFNyWS80ZXZQZXludXFS?=
 =?utf-8?B?M24xbnBVaUlxVk1GRkY2M2R6TkhEQ3FBZGpNQ2x4aG83S2FWQ0w4RzNnYnZL?=
 =?utf-8?B?T3lWTDYzODVTcDNxRHVGVXJKNG84UXJnQ0cvYkJOZlZEWVhHd1cwUFY1SS80?=
 =?utf-8?B?T3duOU1GaVllNU5rWXR1QVZuZlR0VURuNytLaml3R1JBRDUzc1ZLRmhtYllI?=
 =?utf-8?B?N1cramV3bk80MnJTdkprRTBNWTJ0a2l5L3BleVZLQllWNmdJYVIrZkZ4TjhK?=
 =?utf-8?B?bXludkhjM3hRUUlCU29ocUpjNmJydDZxbFl5THFIeXdQTU00RC9LVTAveHlD?=
 =?utf-8?B?d3lZTlliaVd4bjQyOS92TDk2ZTRCVG1lcFRHd1g3MVBTVWpQbkpHanZFQnJ6?=
 =?utf-8?B?SzdvVXNWRFdpY2JteVJ4YktQRTVORTNsQ0F3OHlYbEs1SU1Vd3RWdFZGcUxD?=
 =?utf-8?B?VHRFZjhYaHFnakJVNldjYXVkWmRWUWVtYTlhdFFLZjBId1hnVmZzaXlWV2Uz?=
 =?utf-8?B?Vmd4OHJSVjVySzFzcjAraUdQaU1YS1ZlWkcybXJ1N2pMVGkvRDVnWkYvb1Ux?=
 =?utf-8?B?K2JSWmdYT2M0ekc5SlhiVEJtQ3BGSnVUSm9pdjFXTjcwblBFVGhsck9KaUJC?=
 =?utf-8?B?TXIxMHRKMjl6WjlXblpKVWJ1SVVFeUhqMXpvUERPT1BVSENrVlhDWDJyamVQ?=
 =?utf-8?B?S05ZVExPckY0WjVYYkFlSVkxZmVEU2RuaWFKbnlDUmpWUWRpR1VlbXpDUDRy?=
 =?utf-8?B?cmxFUEJxL2hmMHh2NE8rQnRObmhtTUFjL0RjS0Z4YW5DK205ZHlXZEJjb1lE?=
 =?utf-8?B?c3NJdnoyVjFJa2NreUVmeWRoWEVIcWd3clNidjZaaEhCVVVZcEw1M05pcTM1?=
 =?utf-8?B?YmVObWxpK0laUmZJUGJLV0M0R1U4VmxvV0orRFp2NW9mbmdFZ2xCMUZJRG5v?=
 =?utf-8?B?WjJKZ0RRUXF6amorazhVZnJVWUZCUEVVTVVzd3JUQmU4YTh5Q2psMlJTWXU4?=
 =?utf-8?B?V3ZFWDVjMUxhWWdwY2kxbjhUWi9mNUFYaGpLZFRET0lVK0lqRmc1NXJDSjJa?=
 =?utf-8?B?bUp5NmU1dDRVT3VJWTBQZk5BcW9mbHhKRm9BTk9WVUtwWnJPWTdueFFzU2xU?=
 =?utf-8?B?ZlhpcG9hNlMxdzE3Y3NybDZwM1RJcE1TQVkrWmFZR0JCNGNKaHVxakZYbUx2?=
 =?utf-8?B?d0lwYmUyc25CSXlnb2NQZkh1ZU1HUzlMSG14Tng1KzVzQkdyWXJReWZqUEo1?=
 =?utf-8?B?NFhvWUxQelpmYU45WjU4dDFvMUs4bFdNb1RCUGtsWVByUWpSTjkvQW1scmlM?=
 =?utf-8?B?NkFXMXQ5N2tFZ25DZkRPK1hHTDJGMEdjZFM4S0V6VlIyZCtXVFhIWkx5VXR4?=
 =?utf-8?B?a1RIVDVONFpmbCt1N0xSV00zczFuZFBUZjN2eUpYdm5XVlIrWjBDWjhydTFT?=
 =?utf-8?B?QktJRnN0S2RHUlN1ejRHOC9ENWVRMitvVEhmVDl3Mlg2d3dkRTNZb251OG1h?=
 =?utf-8?B?YnA2SStXUnhHdkxTeW5IZ09YbWVGa21oeExpeldqNDVFM2pnY25DWm9zcjFK?=
 =?utf-8?B?MWtLUmRGL2wxS3d0M0FGZnRYc09ucndtcXZNSm1ubGpmMXF0Qlk2dWNlcUpp?=
 =?utf-8?B?TUsxNWkzTmFjQ01ORHR3dWZoS083MzhWb0R5NWQyZkpYM2pvYUR1dHdEL0Nr?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc65bf6-3936-4f31-9647-08dd36ed31ee
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 11:50:53.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7511EWJw8GnG1923s917IVcvJyPygfija0ehFVddcY6wZAg0Sf1rRMur9sLKwMV/GKkzWesssQSfDP2GYYrgLWGp7X8tpk2I2cU4zbCqPUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_035103_116595_BFDFBBA0 
X-CRM114-Status: GOOD (  25.31  )
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

Hi Niklas,

On 1/17/25 11:54 AM, Niklas Cassel wrote:
> On Thu, Jan 16, 2025 at 03:47:11PM +0100, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
>> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
>> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs to
>> be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
>> another Rock 5B, the latter needs to apply the
>> rk3588-rock-5b-pcie-srns.dtbo overlay.
>>
>> In order to make sure the overlays are still valid in the future, let's
>> add a validation test by applying the overlays on top of the main base
>> at build time.
>>
>> Fixes: 40658534756f ("arm64: dts: rockchip: Add rock5b overlays for PCIe endpoint mode")
> 
> Not sure if I agree with the Fixes-tag.
> I don't think there is anything broken with that commit, but I definitely
> think that it is a good idea make sure that they don't break in the future.
> 

That's fair. I actually think it'd be a good idea to backport this to 
stable releases. It could be possible for stable right now to somehow 
only backport changes to the base DT without modifying the DTO (or 
vice-versa) and then break the overlay unknowingly.

I added the Fixes to make it a bit simpler to know up to when to 
backport it, though I still haven't decided if I should have added Cc: 
stable there.

So 1) what's your opinion on backporting this to stable
2) if backporting, shouldn't I still remove the Fixes?

> 
>> @@ -145,8 +145,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
>> @@ -165,5 +163,9 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
>>   
>>   # Overlays
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
> 
> You moved these lines further down, but you changed the suffix from
> .dtbo to .dtb, why? It seems a little confusing, is that really needed?
> 

That was also confusing to me, but that's actually how it works.

rk3588-rock-5b-pcie-ep.dtb somehow points at rk3588-rock-5b-pcie-ep-dtbs 
which is the overlay application test of rk3588-rock-5b-pcie-ep.dtbo 
onto rk3588-rock-5b.dtb. For that to work, the .dtbo needs to be 
compiled. The target must be auto-generated somewhere because that still 
works. You can remove all *.dtb* from the tree, apply this patch and 
compile with make dtbs and you'll see that the DTBO is generated and the 
build time test of overlay application done as well (the log line starts 
with OVL).

Not sure exactly how to make this a bit less confusing in the commit 
log, as I myself do not really know why that is necessary or how it is 
working. But "it works" (tm).

This matches what was done for ti/ as well.

Cheers,
Quentin

