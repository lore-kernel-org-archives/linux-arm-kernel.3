Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AB5CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TQuo39XxHIeRF4aL6UrvJXcE9zZi/9g9aWwNBouqyA=; b=PM6w33F8Kiy2tTxq8TMw4/sf9j
	K1VhOVWsGHkjM3gFNScXEhkgsWU18FYBCccSO9NzADJAHPyyqNDn7FO5Ol55+XMzGJ7gOkgiSq7ra
	34/hhO9yeurwoh1TQXXQvAOjj0grko6LbsgXNpCX3gog+8un6BawY5SbZXmjqKe6SLl8nDsI5NN8p
	Tkrdxl/FKpIkzwr2YdVtKcIIy2zdIHPi27eujdld2gy4otMorjebc50lMVBi02MTzI/xrS5l8HH6D
	Z03tH7dfxEfrT2re2vuwSK9ax8hkW5vp8ApVx4CrslfmHyYQ0d96w5TLnaw1KXiFibmGHGkO0tw6V
	njRUFI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzWV-0000000FfMF-1zb2;
	Wed, 14 Oct 2026 14:00:03 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzWS-0000000FfL7-3hR9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:00:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJmyikkjbejVm2BKDF5yzloK4IcrBGZtsXQBhh1VmtW6DQRKd6mwY/JtPUiKyvROS0699DJqqL3eEP/vml7IlERcX6u7Lxq87ZM/rwNX63ddHsVeCBEaeyMxW+wHcMYS/e4hC+I86z3ji+FYuCyBcqS7ddpQqc10dNhYrPriGGkF0Tl9CgAxI7bh972Nv8KAwR5CGYW8X5Yk8sR/CtF0LPgAqiB/IPSwL5mxhoNV2HE5pNomZOtIaT0OwVhhJOIks8yENnO3VQUeSy+qGJkRXwyei9i50bqohV2acD7bKfzGp8o4kMhlljgagtePP0kq5v/SU/XnmvY6SBvqPN9NrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TQuo39XxHIeRF4aL6UrvJXcE9zZi/9g9aWwNBouqyA=;
 b=kwonHX22d7mhYuQAf1jql5AhUyGurE0Zm18GsK9Ms/ATE3aFWTXRqlQCX7YB9Ix2xtkNtZQh8jgLOutGDVJkGWv2df+9CyTyYpLL1m5SRHiu/P/KJNb8BGwbYL3wVmZrEG5bgXkVLQPhlVTlNcg74II+iVDoB/bYLzValGiOtFjtRy5gv9PFzRdiFnN8R5ZiRDCNnYU6YOxxRx2lS7FCKy+AM5tefHrg/W8OaOcJFNuKLZDF8VG7k4MknzJfVaps7cpkxAFYLJrQJX85Mn/Q+2zrb5XNv0Iejl4wntaUImyQPoRFihLAp6sut/WDAUWL/UBahqtl5uQUoAFqiwGSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TQuo39XxHIeRF4aL6UrvJXcE9zZi/9g9aWwNBouqyA=;
 b=BpKsW/rjmN0xvdZH7G2k3WY6ml2KulMXtj9kiiHqCAa8Vyuc5+1hS1fqA8LRAt8m0s74x4s3Jb/GnN9TWpCBLU2ZVUh7jQ9QDN1d5+IVx3YNmUd9tWODmWdU9zB6bjJZ8nljWYCsGUPtUzYZIjWCSZ4D3T6tq5BJQOGmxrr203K3fvMWv7po+bFwT2PYcb/0oxxTVEVUU2NvJK3xTMuNycL0sQ83RqZnLmM5km+TJn5DZEvTqEwJ5aYDW7b5eFSbngTUIaZAJHWvO3i3cR/hRR4eBy+c4IgWpUPzLd6mwC0YNgptxqcNqqA/16S7QyAZtPNXEW5kV5YOljLqkHvj7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MIYPR04MB12551.eurprd04.prod.outlook.com (2603:10a6:290:78::24)
 by ZR6PR04MB642384.eurprd04.prod.outlook.com (2603:10a6:910:e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:59:55 +0000
Received: from MIYPR04MB12551.eurprd04.prod.outlook.com
 ([fe80::d6bc:8ad8:510:5fd7]) by MIYPR04MB12551.eurprd04.prod.outlook.com
 ([fe80::d6bc:8ad8:510:5fd7%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:59:55 +0000
Message-ID: <12d593d8-3a70-454c-9002-5dd0e35cb137@oss.nxp.com>
Date: Wed, 14 Oct 2026 16:59:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/12] MAINTAINERS: Add NXP S32N7 UFS host controller
 entry
To: Frank Li <Frank.li@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Pedro Sousa <pedrom.sousa@synopsys.com>, Hannes Reinicke <hare@suse.de>,
 Joao Pinto <Joao.Pinto@synopsys.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com,
 eballetb@redhat.com, echanude@redhat.com
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
 <20261013103003.373156-13-larisa.grigore@oss.nxp.com>
 <as5ABOqo2MTgQBs3@SMW015318>
Content-Language: en-US
From: Larisa Ileana Grigore <larisa.grigore@oss.nxp.com>
In-Reply-To: <as5ABOqo2MTgQBs3@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::8) To MIYPR04MB12551.eurprd04.prod.outlook.com
 (2603:10a6:290:78::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MIYPR04MB12551:EE_|ZR6PR04MB642384:EE_
X-MS-Office365-Filtering-Correlation-Id: 55872ce5-b399-4e03-e3f6-08df29fb6d16
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|18002099003|22082099003|10067099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 5tS9FcA7uFr4ksnhv5Cdv785AMWe9SSH5RFSWwhcP9JlZnKPWCp7r/QLWGBILYPSClBHvEAynKShCuaxDZxQ6RCZHc6Df7rccLnyAfq3ok1knD/PtCJnb2F1erbrT2eng5EBw+ALIc1jCuPXjngKMfpG2eV7U0AMtr9pvoKOjZi+LIo60iN816L6XE1kEjTf/9Iqg8bGifGVN1qcaTPaUqGlQXcXrWLZOaJGHc+A7GqZdyiSXLrMFJuS1izfOcndwkQGOG3HmY72vQmbrLn87WGqOdHXdE4+UwnLB1s3zsqk1ehct202Xux7se9beFk67T9wN+psrBea1VGUqcVdAy6IR0mYek5/DOZWJaiVAq8ohNqpAQ+E09se9780BEYL5t3z/sOKvRt6If7GsH+NitRA7T5fmpP1whKAqdkawYbFm4fxSR9sscE6XhnunYqWY80RWSxDfXQeFs+d6BfVHy+sancXC642B35ynCXjmEMRz3RqkdAuoL5OEFdw7DAEATb0mp8FN3rOrJFX8FvK/VCBXk6CAhepUj619jcczea44K8F3997dDo/WuZWizlRNoCo37uowht52QDRWu/ZTITBN8V4+AYAjelFcw3G8mw2HrDCP8XXTsnryoxtmdkFm5QBZX/m6sqlj0U7Dq8lqkkT/BEQOQhGPLfQ5B5EoTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MIYPR04MB12551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdIYkU4K2RKQmFFbitsb2Ewa3BzeWpmamI1ZjFRY3crTFVDTXFuWUtXY3Fk?=
 =?utf-8?B?aGQ1anR3UzZzMU5GdUJpUk55RnRrQTNZNWw3V1NmU2dIclJiOTEzc2tZMDdR?=
 =?utf-8?B?c2gyQUtNcGNUKzl4OFhVeFNBQlJqTEJqSkN2VkFvbHNQcEdSc3QyVFhacUpM?=
 =?utf-8?B?MUF3WGtnQzJwYkVHRmhEWGJtd3RsTjhEVi8yeUxmdzd3c2NBbytmK1QzUktk?=
 =?utf-8?B?NUJLTTByQzhodW1EZ1JHeWxLOVJDTUNTRTBQaHhhd0JuOFplemNKMEtaVC84?=
 =?utf-8?B?RVprTGZsa2FDM004M3ZSV2Q1dGJjb3hUWHlZdjc2dmlHejhxdVF4K0FOb0Ez?=
 =?utf-8?B?U1RWVGgycFpzVEo2TzVtOGQxQ2lLa2NseXVGZXBGZWhIVVBMOTdOKzNsVkl3?=
 =?utf-8?B?RXJkU3VkUkxJUCtFMGJGSG13YlZ1akkvSzJyN3l5ZUFSbENKSXRaMmIrU0Qr?=
 =?utf-8?B?V09ZdjZDUXJ0UUxCQm9UbmU5cHQvcWk4RVJaQ3dyRi9jcjdJU2xrZHhabS9G?=
 =?utf-8?B?TEROVThCNnB0cnhBbkJzK2VHYzN3ankxWi91OXV5cHQwVUp1M0oyVTFiaElw?=
 =?utf-8?B?b01HTmtnWEJEcmxsMEZaV1VSZnlFaTY0aGxVcUYwS2IxWFR2Rm8rWXZxaVAz?=
 =?utf-8?B?REFlK1RRWW1CZ1gxbCtPZEhXakxHMkliYi83MkErMmFPR3FvczJ2bU5qelAv?=
 =?utf-8?B?VnpYWVdZa20vYW5hcHdOR1pZVDVVZEJoblBCRFAxK0J2VFBVdjhMWHdlRWlt?=
 =?utf-8?B?aDdTMmFoMlFYWTgzaWh5NlBLYUI5ajVhdUxZYXU3dWtsOVJLajFRSWU1Z1c2?=
 =?utf-8?B?anp5UVhLWUR2cFMrQzR3YzlKZFY4VVNjRUN2Yzd2Y1ppN1J2R1d3UTY1WGZP?=
 =?utf-8?B?VjZxRUFTcjRHQ0xpbFRVdzNWSFZTRnZxVndDWElWclQ2K1l4UysrWFhHYWtx?=
 =?utf-8?B?VnhIMko3UnEya3crS0NGTzNGNm9aOFpubThuUnkzYWU1K085ZTA5bnp4R0w3?=
 =?utf-8?B?S2ROZlNORTBHdnlFVDltK3k4ai9BdUhRTVJXVUZhaDlrNS8rWlBYM09KbmdO?=
 =?utf-8?B?cHlYVDJ0TUFQQnlkSUdyYXdNY3NrQjZqc0lQSmFTb1FxazBhdUZ1bk4wZDdY?=
 =?utf-8?B?RUg2NVF3bjg4N05HVFFzc2gzM1Zsb1IzUlRia3l0YW5IUmo3S2xsTTF3ZzBG?=
 =?utf-8?B?UnEzaDVsUWk0RDVrVVprMitBcVUxSVNhYmxMUzRkRnZLNFFXZG9HemNRcU9v?=
 =?utf-8?B?YWRYY1hNcjRvYXQ1b1hRUnNEbkZORCs4ZzdUdTBsRXBRZlpIUW5PZCt2VEdw?=
 =?utf-8?B?MGozOThXYjVRem5JMEIvemkvRW45a255MWdoc0ZFYXFmKzhrVWFaa0JTRnM3?=
 =?utf-8?B?QzBCNitHWnF4cm9HaXBzM3NsUm9lanFHaHR2YTZkcVRoOUpVNEk3V1BVTCty?=
 =?utf-8?B?SmxRY05SUk9iZng2Y1JPakkzMmlzYmsrSkZxNlluZTNpRjlzcERNZWZGRTFS?=
 =?utf-8?B?S2h2RjU1WXJxbWo1akVvYW5xRTZvNXRNZDZsUkFMcERkNEgzQVZkRXg0ZmZS?=
 =?utf-8?B?NnJpTXp4TjFiSzJpWmRjd3dSSUtOcU41T1RQaTBYU3NXMVVWWk1oalFBcVpS?=
 =?utf-8?B?L3ZCUXFsYi9DcnAwZDVGc3dDS2dXV093V2M2RVd6RnlXVXdSU01nWG9ranl6?=
 =?utf-8?B?dVNiYUt3YkNFVzlPTWhudjdhV1N6cERhMVlnbE4xL1BnRExhNHhEd3ZNcnVN?=
 =?utf-8?B?SEZUUS9Ba3Q0dFZBUTkxbk1JZnAyVVpmZ0pET0dvYnphRzFhaFEreEdabklV?=
 =?utf-8?B?ai9ySWNUcWtjcjlhaGptbFZyOGRoTGdtR0NOL3NHMUxjTVM5ZDJkUFRMY0VM?=
 =?utf-8?B?b1VUME1Lb3RPZ2thYjE4VWN0K2svWUZOYVI0Q2RadnVqNGR1dmlNL0ZWSHl1?=
 =?utf-8?B?aFNMSUh5WkpMckdwQkNaa3BLdGJpazcvSDJTdzQxS1Z0d0dLYTBGQWtpblJn?=
 =?utf-8?B?THpaRUI5eWhtOFRURUl3ejZZdk5oSmFzdXFYSFVDaGRGQisyc0VINmtXWUI5?=
 =?utf-8?B?QktFdGtEREZpZ2hrbG9qU0hpT1R3dVMzYWgydXNpUTU2KzVWWVJ1VnpyUkVD?=
 =?utf-8?B?WW1qczFmN3Y0QlJ5UldNQ3oydUVsTXRWR3hLWXpHRXhRYmpYZUFtSmJ1N2FW?=
 =?utf-8?B?V1pPR1lxYm1DYWVBMTVEU2hGOUZaS2I5YzFYazJhTzV3c0NsVXpzc1V6V2lH?=
 =?utf-8?B?aG8vREE1a2ErTkNyVFFPbWFJMEpJL3lpZk1IdGZRQnc4ZmptUnBXWUMvYkk5?=
 =?utf-8?B?Q0JmbUhBYVpCbHdsdE1VL1BPOEVyN2NCWEJMV2o5enZKWUZCVFV2dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55872ce5-b399-4e03-e3f6-08df29fb6d16
X-MS-Exchange-CrossTenant-AuthSource: MIYPR04MB12551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:59:55.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVcpNMvGMLRyxLvXiqP4C/LfRGMBBu4vX6m4FhX7c4TDSD2617TPK+NAmXRWjqB77pQyxEceq6yhw+Q/8Z82gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB642384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_070000_944679_CAAA916C 
X-CRM114-Status: GOOD (  11.65  )
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

On 10/13/2026 5:28 PM, Frank Li wrote:
> On Tue, Oct 13, 2026 at 12:30:03PM +0200, Larisa Grigore wrote:
>> Add maintainer for S32N7 UFS host controller driver.
>>
>> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
>> ---
>>   MAINTAINERS | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f53047aa8d3c..16f1dbb763cd 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28119,6 +28119,14 @@ L:	linux-scsi@vger.kernel.org
>>   S:	Maintained
>>   F:	drivers/ufs/host/ufs-renesas.c
>>
>> +UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER S32N7 HOOKS
>> +M:	Larisa Grigore <larisa.grigore@oss.nxp.com>
>> +R:	NXP S32 Linux Team <s32@nxp.com>
>> +L:	linux-scsi@vger.kernel.org
> 
> Please add imx@lists.linux.dev
> 
Sure. Thank you!

> Frank
> 
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/ufs/nxp,s32n79-ufshc.yaml
>> +F:	drivers/ufs/host/ufs-nxp-s32n7.c
>> +
>>   UNIWILL LAPTOP DRIVER
>>   M:	Armin Wolf <W_Armin@gmx.de>
>>   L:	platform-driver-x86@vger.kernel.org
>> --
>> 2.43.0
>>
>>


