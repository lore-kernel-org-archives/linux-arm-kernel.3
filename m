Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCADCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 02:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TggMnJyHanfPPPYN6ORRUJG14uBOwwxDnCH93qE5lQM=; b=agz4FA2+SsVsw5/pD8TxK0tXvY
	wN99qq/sgAVaf909jY8geyGnEsAvL4hUY4XPrMRrlNFD5I9eTOk9DN4bhQox+XYRld34qo0q9sl7n
	vR+LVC4b7M+oh5+2IO9U97IN991a+ukZCTK2qOiMRxXKOp15L/6V0F1Y11VpOy5NSLYaOI1UCC1TI
	H7aTG3B0fwUtUnrNI1seE0wSfvwGtkt2uLhFyOUmwGSWWjVZY5PDdXTUNGtbLO4C6jpTZVVmJJ3Mo
	djZi+vrFW7NOFbICSw6iMVOx4rht0qg9a/1GeUxiFwVYwJqkIlZHO/FYRrQgK/KIyzr7JgvDutYJy
	BKckK3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJNMD-00000009oS9-03lq;
	Thu, 13 Nov 2025 02:46:45 +0000
Received: from mail-westusazon11012070.outbound.protection.outlook.com ([52.101.43.70] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJNMA-00000009oRo-2P9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 02:46:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkBnXH8g7XbhqpOMk/DXXOFMSwrf5OMZGEOqdK8lS9X6i3zhLw9qgZa9/gmgz5tq5n9xPWnxPg2De4yctfEOtei6UpCJ1PP5KU9Q1wCwvYfeEKtH30Yhele6p49lAkkMheGgurpzuX2H/7UV975A3VsIREKv3lzFCOh0phkQbig0ig/EhE5rp9DZlgpGGmydcpxE7Gp0RFgIvM0M6K3xDeuquhQjoeQP1eOKxpjAJsmduw/PwSpVGnegNUDiZE+BZOE5+K/vcWUhALs02Y+qDPgKW7ACJYutGLjsAynn/uaIiVUiNXiaTnNKkICRP4sxjHauAJA65t1RKRxK+amj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TggMnJyHanfPPPYN6ORRUJG14uBOwwxDnCH93qE5lQM=;
 b=xsISM10FYXNcXdJYLORCp2g7Su1PBwpHtl+jxBFfh+I6uUBznQ2EIrQv7kjKoew//gtoAcDb3yb8GQ0Rhf3QrjHJFj2xiNMGhgUtDhhDCViEOeFlQYFVdYE1CQW+4iLtUgB14BNspItUI6GOS4LfGqjmCvr4Or3vTpR/BRowK+LoNy5xuRgOdMHcP2e95JH5zBn0N3eLVRVCy2cf2SWa86v0PeXWfTN8vYOf1ccjW/v9g2NDaHzLVWj/cBk7rveB3W+k2q+AUzFblnbjUgerwfeO1cICKdCjEtG/fULC8gfAKw/PAaihBth/5A5Uu+edqW55BpSEaXNK08hemNo2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TggMnJyHanfPPPYN6ORRUJG14uBOwwxDnCH93qE5lQM=;
 b=LRHNqPZ9dRfxWak8HJUFZLRJ7EhNor3CI6tbrYD5YozslxdNzYzdPsYyCbaf5afYD88ikx4BpSM7HUVYZvX/VshR1A9jioPDxRtOdcu4MbUUWaECyWfAlnrMeaJEYmZn6CrS35WPFN+U1h9g+Ftv7ZQJuX7Feu2ndOGlgu/rfmlgz+x7gkQt1mUDc6z+axvEKUrASTHBvtMfsV+XcWGVoyZS2et7eh/GfgSgD1CYXllth5dRqNxJGjck3OpHOlsWNEXPP9E2kZlEu/jxk2EWN2FXg1GL0/kAe+//+Rb+vG9gHniYkYZoVIjobJSTEqhaZ082h4+D/wnfOgLoeYckug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DS0PR12MB999079.namprd12.prod.outlook.com (2603:10b6:8:302::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 02:46:31 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%6]) with mapi id 15.20.9275.015; Thu, 13 Nov 2025
 02:46:31 +0000
Message-ID: <02baf595-e428-436c-89e1-add97adbcd26@nvidia.com>
Date: Wed, 12 Nov 2025 18:46:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-11-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20251107123450.664001-11-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DS0PR12MB999079:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d550b87-b917-4cda-3b40-08de225ed9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW5HdnRsQi9hTEp6TnJreUVxU0tEYmJ1Q2pPYlQ0cXIzQ0hVZ2UwZURGMlVw?=
 =?utf-8?B?MUhObkpyOS9mUzAreU9MeWZHSEUzMkw0QlRQQjBmcXY0S3ZETDZTdWVjL2Nh?=
 =?utf-8?B?L1lEZHBrSkpqSmdrc1FVeXd5TnRMQkFnQ1BoRzFxYllKOTRPMUEzTmlieDdH?=
 =?utf-8?B?OTU4VzJrWEJ0bEdHQk1HYVlKQTFRVGRPMmhlUTA5SmY2Q251N1RhZEdmRkpZ?=
 =?utf-8?B?WFd5VGtGazdXYnNJVzJZeGhPa2lPbml3YVd0NnljdU9JejR4b3NwNlE1UEw5?=
 =?utf-8?B?TmFqeU5jMmhaME1ORURtNHNnRkN3ZkQ0bFNxaUh5NmtPTXlEeWtlMkFPSWZQ?=
 =?utf-8?B?RmxYYmt2dnZ1NlFXcDRyeFpOTUFaL2szcnNjVWV3OGw5V0FxTnd6R0hNVVlD?=
 =?utf-8?B?cG5jNzRYTThzdFpaY3RodXdZRmozbkpobFVXRnJwTGFWMmVyV1FKcW1LZi9w?=
 =?utf-8?B?czFwTTN5UWhnR3NFOHdkbWMyRHc0YkRoZ2x0dFJmNmZZOG5wZlJ4QW55emVW?=
 =?utf-8?B?dDN1K0M3OHBSK1crMU5tTTMyTEsxbFlyY0ZaZ3o2UFplbHJ1SmNtV2MrZFo5?=
 =?utf-8?B?YlE5SHBLTVA4MVl1VFZTa3BvaU5KMDZIQkh0RGxGUVM1U1VXanU5Wm1PYVRp?=
 =?utf-8?B?a1hzRUdRem1tQklJL2RrMW1hM2ZTSFFpSFZmSlZ6VzMzQkVrUmNsMzg5UE8w?=
 =?utf-8?B?Z05rN29nVldYM0cyRWIyTGpQWFFYNFBiY2tRZng2RGl4MzZuNDFyMVNxZVJW?=
 =?utf-8?B?UXBYeDd0SCtIL1VtYnZhTFF2WmRrcTRDaGxPM1RjaXphcStxSFkrMDE2RS8y?=
 =?utf-8?B?ZW4vaW5sSWdsd0hIa05yR0gremVOblFvYldFVnUyYlhFREdVUWY4c0JlbDF1?=
 =?utf-8?B?endKS1BMVjMxclhsaEk1bmZ5SG1JcVRoUTk3S2s4L200ODBhNzVERXlwVnRh?=
 =?utf-8?B?cnBRVUN5Snpaejl0czUxQWdMeXFFRStJQnNvVytpbkpoREVyNGxmR3VSbCtY?=
 =?utf-8?B?YjIyZ3llSC9MUFhWbjNsRTZiamxsSXcvbXpVcFZnY2hQUkJZVlBncktHUTVV?=
 =?utf-8?B?UWRKb2dwN2IxdVNNRGZRNGJYcVZhU2V2ZFFGMXVVRXEvU092bkpWMnk5Qkhy?=
 =?utf-8?B?R3QrQThBZEZzV3hvTjd5NXVhK1lTUFI0a1FGdFNqR0lkQnN2eW90MEIyNHFj?=
 =?utf-8?B?U2FuRTBpSlFvR0FsNUhRbnVheHl1RVNMaENMS1l2Q3U4eEN2Skt1elFzQUk0?=
 =?utf-8?B?b2ZLbmlhYnRBdmdmVmhyOGlVYThMUkJodHFTeDFTdklCaDFvalFFVU5QS2xk?=
 =?utf-8?B?dElUTjNDeW1IUU5INkNBN1oxeGo4dHZkSlRVREt5OXNuSDRXQXJoTFpySk5D?=
 =?utf-8?B?cmZpVHcwTk95YkdOT0lPNGRLTk9CU2VGU09wVW5GUlBIbmVDTUFKT0JOdlFl?=
 =?utf-8?B?bW5vaXhvTlVxOWtoV0o0cmVBcnc5dUZBOHdCcGFQYlM1VjJOOE5HZ3RxWHcv?=
 =?utf-8?B?MmtMMmVVQWdDWmRWaVVNdCs0Z0dMdVhsRlhWN3RyL1NEcXlhTlpjR004Zjds?=
 =?utf-8?B?T05Ic0hDajJtTFlKeFpZbUY1T2VuVkR3cEY3OWV1VG1Qak9OR2h5by9zaVZH?=
 =?utf-8?B?VVRBNXRGUHJtNlRUbjlNUzg1WnZrdWpXck1vekxWR3BXK1R5dDJlN01EY1Fj?=
 =?utf-8?B?MnhCeXdCdlFLZWFXVkVPMEhxY3RsSGZoUklvQ2tSM0Y3VUdOTkxCNGM0RnNm?=
 =?utf-8?B?NjF4R1dTVmE0RnBwaG5sMldJTFlucks3djJ2MjlDNjZEdE1vQ3VraGRKTGlG?=
 =?utf-8?B?bk5Sc0dTUVltR3l1akd3NmdtcXFMekltcFpSRnhzbFZXTHE4c1BVTk9Cbnd5?=
 =?utf-8?B?ajMray9ESzREb0ZySTB1ZjNhSEMwRGRPeUJKM3kwbDA0WDlSNHo2WDBjLzdS?=
 =?utf-8?Q?u88u4f6lwndsIO9LDjjX+7Hd3EbL9YRJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmJXMmtjMlNEZkpGTk9BMDhkK1B1clgzMDBjTndFQ0xEcFBlRHc1Vk80ZVg0?=
 =?utf-8?B?cnpNZUVWRFdnc0Jxd3ViMXpub1puMG1rQVBaUTVvcUFMcWZ3V28rc0RZQ3RP?=
 =?utf-8?B?bG80K2p4bGFLL09uTVlWY25tUGtiNkI4dndQWWU0ekNrdGp2L1JURkRkUFBK?=
 =?utf-8?B?L1JjYzRMYTArSWkzYWhVY29yTHNKRnVzWGdJMUt6L25RTmdjdW8wZEZtMVNC?=
 =?utf-8?B?bnVIaE1XZnhoQ1pvNXZ3VHdMd0FwYy84SmNRcGJNNzQya3Naa3NWeWlobC9t?=
 =?utf-8?B?VFVMWE1DZHM2N1ZpSEQ4a1FkYWREZlpycWNtWFhERTd3SXI3N3hXOFpvRGEw?=
 =?utf-8?B?NVgzQ3ZPYmFtSlhqcGdHWU5yUFd6RU1jQUk0cTg0OW1PZGNsczM3MStWWmto?=
 =?utf-8?B?MSsrT3JzZW1jRlRudG9COUswa05IcC9TTGVCRit2ZTR5UDVFYVdKQVBrOFgx?=
 =?utf-8?B?WXJqNUc5RzdEZzZYVkIzWFFKaFc1bTQ3Vk5tdGlXcGZBMmp1WnJERlBVOXQv?=
 =?utf-8?B?VFo4OUZURE5ILzFYejBYNENwcjJHUUFjQ3FiZlJzeEd6ZnpFanpaUU5jRFN0?=
 =?utf-8?B?ZWd5WGJFQ041YjluVmZuRG1FVEIvQjhGYU1uUmhjMVJVYkJTNjJCREplMlhz?=
 =?utf-8?B?NmI0bEZVNFRQQ3BjMm1rbFZENklKSTFsRkVyaklycHFuQ2IxRHBidXphVUlC?=
 =?utf-8?B?eVFuYjRKQmtDL1NsZjZ6ZlIvUjVYOXhMeUtEOVFJT0xhTDdaU25UVGhaN0JN?=
 =?utf-8?B?NUNNSUJJV3FwMWt5d3ZJVHBrWEh0Q0tKNmUyMERNQ3lnT1hCQ3Z6T3htbklU?=
 =?utf-8?B?dFplSk1zV1lBSmxEL1BLbktGSndQOWcyekRxMDFyZGFrNlNtQ0dwSTVuNmRX?=
 =?utf-8?B?V1I2eEZoU0g1T0UyVEtZSjF3Sm9LNVZlNFdpTmt6NEZmL1BHWVAwUDFxL3o5?=
 =?utf-8?B?UmhERWlsdkgxYlRrV3J1VkJlRkNHUTVjTUNXenZRQldYYkRxbFZ4dVlnTFRT?=
 =?utf-8?B?bEl4QTdTR2o2STJWS0NCK2RQNmtkcm9Wd3JyVXdhb1M0dG5nZU5pWWFzYUhG?=
 =?utf-8?B?UXNWeUR6ZmpCTW5IVktRcHFnd2g1cjdDOWlDVzhtbnFGSlRDVDN5bFBCdjY2?=
 =?utf-8?B?OEtPbDgwa3FNWFo5dVpXRnBTQ1R4Wnkxd1VBaFdQOXFIa2ZVN1VTWXZvK2oz?=
 =?utf-8?B?Y2ZCZE00QXZtREFxdkY2dnlGdWJCS1Y0T1A0aU5tM0dNZDRPVVgreEdibHc2?=
 =?utf-8?B?WHhpa0M3S0RCaDhtWHE4RVBnaFk1ZzFzbjhNTGxWVUVwdGUwTDJLMUUyWTVZ?=
 =?utf-8?B?eit2MHZiSytnQm01UTd4bFlVWWxIQ05mRHpobGZvYTZFUlZXaU1nR2ZPem80?=
 =?utf-8?B?VjdacU5ORW9kRHA0Rkl0VzZYT1pYbEVJeTVwSjJpSStJaHVTbUV4U1JWVG96?=
 =?utf-8?B?WGpLd0ptNlVOMXVKWWk5WGFiOER0VGYwYm44aFRTRzd3cXF0RDRIT09GWDQy?=
 =?utf-8?B?RUc1bURRcHhJRnNWU1hVaDVtV010bTZCa2NJZGkvRUYxd1pWM1BaMXE1eHVZ?=
 =?utf-8?B?VS9yajVVMlNONHluWlc3N2VDQmt6cE9qbmxrYkRIVXQ0NFJVTjFVeUV4cjRK?=
 =?utf-8?B?d21kYlFFVUtReEpWLzNUbERMWDlYYVJBREJBdGtLVHB6QzNEeDJFeThFUTd1?=
 =?utf-8?B?S2xVMkU4bklPbGx2R3pBNkpVMnpRSlJERDNuZWI2T3M3OURsMFBiRzlCbnlG?=
 =?utf-8?B?UWo5YTFCZVdkT0Zqb0s5Ty9yOEJBMGViYVYwNUlNWXI0N1p6dFZlbkRxby9v?=
 =?utf-8?B?aUNHM0NjejJNOEVzd016bHVRT2dQb2xuL2VKYXMvZlFMRERuQ3ZsREtuWC9s?=
 =?utf-8?B?ZHRUb292TkFHTHU0QTFkemFyZEc1a2d5NmdOek9ySHFGckE3QkNSc1QvUWdj?=
 =?utf-8?B?SnQ0TDBndEJ4dEttclRreGMvNHdZeUpiUEJmenp6K2phVVZWQS92QnVxcXNw?=
 =?utf-8?B?dGhJRFV2b1RxZXdHd0FNdXZBVzZiSzRzMHVxeUZSaXpXSWFmaUNTWjVkZnVT?=
 =?utf-8?B?L0E1UXIyNjRZR2txc0UyWittQUNKTndVS0hzaUpEMXlCcC9xWHYzbk9tN1lO?=
 =?utf-8?Q?UrEXoCl5qUWSFqELLGS4epJ9B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d550b87-b917-4cda-3b40-08de225ed9cd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:46:31.1273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8OFkuOWTiWd4qF/qZmwcz6FOx61qfbeSEWnV3gLfQfuGoo6NVEIwH5l/g8LaP8ELdDA1GnAnZJYRmtnTc83uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_184642_626262_F06D54D7 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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



On 11/7/25 04:34, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
> only be accessible from those CPUs, and they may not be online.
> Touching the hardware early is pointless as MPAM can't be used until
> the system-wide common values for num_partid and num_pmg have been
> discovered.
> 
> Start with driver probe/remove and mapping the MSC.
> 
> CC: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

