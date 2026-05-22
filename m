Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB11CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iULhw6Rghh0I1Y+RP20ZhreEpFsJq7SpQwB3ahPKclU=; b=MWjYIo09NGXyxd6ncB1BOUQ1JV
	ZVBJHH4FVhpUuNBCa1Q8EIy+0aVJN8CUfIzXBhLmu92+VzgFbcKZ0zsEqLTEEg0ORk8TFbd2qGifF
	MaYjxG3SadsKULuVSVP1FTT/pbV1NbNzt8/Gq7VnL7KPk7qAPzzgNFzPbPCHCUI443srox7PeoFcp
	/SEy2Wy+4OG94Viy8f6Yavr6FLgMN89tbOX71xoZCxf/I/5/qtuFUdFUiDp8BeqfV3xXJWO84DtaB
	nbIs08NNDhG2lXE6NJVeYFIKdAgYjm1G1+of/3/rgNc9rnfni/9hd/MXys4RN4C1uX8+8DJL/n89M
	ntgZ6U6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQT70-0000000BTN7-1iCe;
	Fri, 22 May 2026 16:52:38 +0000
Received: from mail-northcentralusazon11023076.outbound.protection.outlook.com ([40.107.201.76] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQT6x-0000000BTM2-3Vfl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTZ89ajXictXQPzWWHuIVMuJy5v0togTN48G5R/3ZnqLDUikFUPCnHQHbbPhquauOTrkT8GjX0CYqXgNzjE9xcnceHqnpDljfxrhg5PmG0GtUzmG/iE3jEuRck3hCMDyJzE9Zw7kaJMXEHmjygMQJiFCYreHQb+jeQ7oNJgzQ5qgtHQeftqcRcwQGPYJv+nzno+061vr21tkm31hHFQWf3d4FlbePwiqiYDO0g5lSpDq3L/WoWnF4G8YqTUXvlnc3x00eDhBTDmS7LsvE41RYRJZG1Sz8xoC3MOazMTTdhP5MvybX01rdTWAAl3hlERsrV57W2+s+1pu7ziFMkgrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iULhw6Rghh0I1Y+RP20ZhreEpFsJq7SpQwB3ahPKclU=;
 b=KtEmhKfCmRwYIxhjuhOTJGNrGAhWXebB/5rvUomKDP+dLvFi5D6hF2bpeqY9utLcuNHxNz69PXCCr4unOIgYjIeKN137AOQF7sH4Sl2QL+SE1ZwzlBuol4wVgcjjQTAmqYs3wYWVcR3Uy1QbiD0aET4w8f1RYZUxAmEuPQFddKLHm8Re2ynYks/I0VeIMjv8EQ6Lme9RWpbz3l1Sh51HhgQBK+EeDIuYsyCCWwLC6A6chgYJlJ37CtqXGfaDtaw5ER+bF7GpjMeZO5kI9EGhd1RdZrmN6wLSgaoYneNgxu7i1o7xowiKpPRFrwUTHJzhRWl+MWuouRfSnSErtV11BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iULhw6Rghh0I1Y+RP20ZhreEpFsJq7SpQwB3ahPKclU=;
 b=HuhIBM9UF3itxFnUH5f9JkbbEzcqhLcewq/aEm5aurDAUnN1z6lzfo5HiAxnPYzifsjDNJ6JtJpdRIRVcGXFDsIwrCaQdnIHyD4ZWZqZUa7tifnIm46XN4II9dFXeiKn+uzcG8bF62tzojLXR+psE7DNfu1GiwIVwuiuA97eEm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 DSVPR01MB994685.prod.exchangelabs.com (2603:10b6:8:45b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 16:52:23 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 16:52:22 +0000
Message-ID: <68f838b9-f3ae-41e4-96a4-667361bdc65e@amperemail.onmicrosoft.com>
Date: Fri, 22 May 2026 12:52:18 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
To: Sudeep Holla <sudeep.holla@kernel.org>,
 "lihuisong (C)" <lihuisong@huawei.com>
Cc: Adam Young <admiyo@os.amperecomputing.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
 <20260519-outgoing-rough-fox-04daab@sudeepholla>
 <d719462f-3430-47c1-9b9d-1068b3c4e429@huawei.com>
 <20260520-optimal-nightingale-of-champagne-0bbdfe@sudeepholla>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260520-optimal-nightingale-of-champagne-0bbdfe@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:930:5::13) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|DSVPR01MB994685:EE_
X-MS-Office365-Filtering-Correlation-Id: 752f2c20-dd5c-4796-3668-08deb8227eb4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|10070799003|376014|1800799024|18002099003|56012099003|22082099003|55112099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Gzy7bAhqJffysc1S/lIHDpRHqan+2ip9KcsSHQ16qmhy9CwrB8BQuE8q2U5JMIIj2QqJgUGpyI5fyG/w2Bh8tq9rDjapwwYLHww0WgvHm75XOdp4ddTGlQl69xBLzcTYKLDEyEAU9o4O87/hTZnI9Of59uh8/SxPAUWV7cvcRQ2Sflt8dINwYkfnbMphZBXi8zEmjGrIiXSBr3aLFpbJsVma2RVW41zX4Lo6xZB1W0ZCat1cCRdpAJHxQo8Uk1lwZJLMQRIsqiLOvVP/BKC0djXHozP800QiHxhBF/6iuo6483WMS7l2Zx+mbc1RaQp9/qmYZ9hVw4t4a3bXzMcFSYUUzfYdrBuAa3TCp6YBxh5fJbGNiTpNw533srHdktVudzfDrf6fNAg0Jx4EO+PboF/3MgSOEkbcfuyA1RtO3KWBuXQT+kfT73QGVyPAWYn5k5w7nmpB7AFJIKxbCGt/7gn51r0aQ4ymZQLZTsbgqC04bR2A0tMJAJUVE8V2w9kj/Uxgqvj2RhJdY2gPvhRs1zSIpXSowF9GVofa3wPnK8W4FG9KInfqk3T6HcVaK598iM+dsk+mMxbdzltr0uNaCKe3yaJVxMM/i2hJig45B+KIKPxpjoCM+G61DFiiDZqsoIzQxAp/g9SqgsG+NRCb4tQOnnbT90AoepLyO0hI1Nn5txgWeSqqHQRPURMrqoMP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(10070799003)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(55112099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNYelQ2cU5aUzBXeDU3SExvTzJLYTJZaktzZTloZUorZU5KeTdJSzFlY1oy?=
 =?utf-8?B?WkgzY3FnUW03ZEJZUUY1UExIZ05hTXVDaW8vdU1yOEptREswa3lhS1JWQUxS?=
 =?utf-8?B?Mzk0QTBEd2hKUnp1WFRkbE1SSk9nK01ZeW0rUXp0OE0welY5aGlZcEZySVhv?=
 =?utf-8?B?aU9NVEg4UTAzSlFXbnkzTHdFZlVKdXBTYmZWWUJDamZnY3phaXd2YlN5Q3J5?=
 =?utf-8?B?YTR4ZGVZZFJQdFd2eUV4VnF3SmI1R0w0VWI3cWVJMkx4Tjczb3BmL1hwNUlr?=
 =?utf-8?B?c1hsb1p5QS9ObUZwMGVRV0NGNmVCYVZpRWdjRlJwR1FXT3UxOUtZODJTNjZY?=
 =?utf-8?B?THRMTXhNTXJYUE04MVFrcEtqSGwzcVE1YXBXMTdUUEJlRnR4OWJvaldsM1NN?=
 =?utf-8?B?dHVWUGpwSUdrMDlLZUg4Zi90ZmpTKzZMRVVkbU1JNkZqbzEvdFk1NXlkbS8z?=
 =?utf-8?B?V1l4NXdkUk8zQXl6U25BKzFxd093UmNhc2psRE51YWhtQ1Z3THN1MUI4dzY5?=
 =?utf-8?B?RzFpcW1aT1NuQytJdC8rVzNraEZYdXVlTGNzQ29LL2hrd2JKSDU4enN6TTRG?=
 =?utf-8?B?Z05YSnV2dHRkTmdEbDV4YW1HbmVqcndBcUZBa2ZTN2Mxc3gxQjF5Q3VEU0dy?=
 =?utf-8?B?OVJ0L1QyRlZ5RXRSNGloMnVGUnBtcHZZcFM3QkVOZDUvUzc2V3RXNU5ZVlVN?=
 =?utf-8?B?Z1RCUGxCQWNTbitmMGlOdlNyQzU5S2RicWtsZklGVVNwRUVnVFdiR2x5UFF4?=
 =?utf-8?B?RThhaDdwUmhuajNjNGhmam9jMnQwMnRud0htbVM3Y014QzBtVlpSUy9iR2Qv?=
 =?utf-8?B?Z0tuWE5QeXJUSC9mK0k2amdDRnJ2OEJVb0srY0V6T3ZXeWZOcTBtR0VkSGJD?=
 =?utf-8?B?cGUxR3p4NWNWUVFwL2FQVWJSd1pTYWFveHhwT0xWclI2WkdUQ3pEcDVhek1j?=
 =?utf-8?B?T0hyb2hvNEtMaStUNEtESW8wdXpGSXhOTEFTTXZ3Yzk4NmNJa29jNU9qY1gx?=
 =?utf-8?B?TGhuMGhpMmZGRnVTVDNNcGFGYkM5U2djU01xNGlkQkhmVEtUdTRYUG53eEVq?=
 =?utf-8?B?SEJocTVYWXRkQW84MitnTDVvZ1Qzb1FOOFFhRjhlcHc1blR5aDRUMWtSZkdh?=
 =?utf-8?B?dzJOU0FmYWFVY0pTMXJDMXVWQldZd3hNZVU3NnA3MFM2b29hNE9jSWQyakNJ?=
 =?utf-8?B?ZGI1MzFxc1FnOHFKMm10VzlXbWdtckF0ZE83RlY3VzJsWkFCOHRqaHFsZmZI?=
 =?utf-8?B?eXIzK3o3UTFDdjdDUjU0QVFyZ29scFdBY1RQVUhlWE8vMURvbUowZkZycFhZ?=
 =?utf-8?B?Z3hOVThaT2cxYnVYQ3BVUmxSb3BuOHBENk84c3JnWk1seWV1cmVGdWNaMEI2?=
 =?utf-8?B?ZlVPRmN5SVhkY1VBbDVPZ0tmSXJQTlhsa2dCcjRHMTZ5SkVVUXJYQU1TaWpo?=
 =?utf-8?B?WUNpYVJHNGN2TS9YNmZIN3RIWmQwa2QrVUp5bHhBNlpUVDN6TWhuZzlqeFdq?=
 =?utf-8?B?SUxVZHNNNGtBM1RjWU90RUFKaTEzaGJkZGpBejRlcThBTER5ZU9lOHdyR1Fy?=
 =?utf-8?B?czBZOGZuYS9ranF2aXdtcWFNVUZ5d2E1b0pydi9NbkljejFDOVRqYS9LalNo?=
 =?utf-8?B?REpoTnBtWVhuWHFzNmsyZW5GTHBiSURsZVp4Vk00cWVlRUlzVFhRK0l6NUNO?=
 =?utf-8?B?dG1IOFAxTlVMeWRzVUF0MGQyc3dIRVJoLzZQZmVWVWpRd0IyYW1UZHpCSXJV?=
 =?utf-8?B?Qk5KdTNDUGZKbjI0WUdKMk54Zkx2NHBsamdTakpCNWdPT2FraVBLT21WS01N?=
 =?utf-8?B?WVJXemVZaDV6SUNPaVpTWTdheUUzVTUrdkJJK21NU2ZmTVhrd3RhSTFxd2o2?=
 =?utf-8?B?N3VOTnUxd3crYkM2azkvL09FbE5ERjRGUHgwa05kODdnSER4M1c2M3gwbmJM?=
 =?utf-8?B?M1RzVEd4Y2xYaDNGQzVtbXAvSHZxUTlzYXpyc2t5bmlYcTEvc0JJRVpSNllC?=
 =?utf-8?B?UGg2NjRPTjFwQzB0WDBLeTdZRUdYeVNuM3U1NE81cm1XMThMcnFYcjB5Rjcz?=
 =?utf-8?B?eFNld1FLS0h2NXd3RFF0cjZneEFkQkw5NzJnaEpzb3J0OFVsS0JFWE5ENUdE?=
 =?utf-8?B?emR4dzZITld6VDhtOTZlb0F2TFBzSkpreHMwenlHcTZ2QkJFOE9wNlVMazVG?=
 =?utf-8?B?NE84TmU2NEgvRDB5djlPVkhRWjczRWhtTStWZHY2d1JtcnNBNE5DM2JBTzIz?=
 =?utf-8?B?OFFDSzkwcklVTzlZWkRXdUhJME5MUHZBQXZ6OGp0bXQwQjJvYWlLOXNkd2lE?=
 =?utf-8?B?OTlUSzBIR2F6UWhEMzNiWFFRKzJ2TDZDU2ZXMHM5Yy9kLzBydUsvZ3J5VzR4?=
 =?utf-8?Q?CbSQ5Y1ZTrPZtRbtOCS72M5RYK5U43h62BdaXJlGD2ZLp?=
X-MS-Exchange-AntiSpam-MessageData-1: MOpN0rHOnZJw8g==
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752f2c20-dd5c-4796-3668-08deb8227eb4
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 16:52:22.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24ne4EyZrbTEne73Dock05TaE1KENioO7SYABqPtrMwlJHBK4mi7TZ5Nvp+DLRXEbJGGCM9YBIlOFtH7tldFUcyLUiN5I/7NaX38+1cFj/i5EGuPx3sbMMi1VGDLAACR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR01MB994685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_095235_887507_B2A2E7B2 
X-CRM114-Status: GOOD (  32.39  )
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

I am not getting li hui song's messages, only your (Sudeep's) responses.

On 5/20/26 09:32, Sudeep Holla wrote:
> On Wed, May 20, 2026 at 07:53:45PM +0800, lihuisong (C) wrote:
>> On 5/20/2026 12:25 AM, Sudeep Holla wrote:
>>> On Tue, May 19, 2026 at 09:54:47PM +0800, lihuisong (C) wrote:
> [...]
>
>>>> @Sudeep, I have always had doubts about the addition of this line of code in
>>>> the
>>>>    commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler).
>>>> The patch seems to avoid the timeouts in the mailbox core according to its
>>>> commit log.
>>>> Regardless of whether the command succeeds or fails, each mbox client
>>>> driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is responsible to
>>>> call mbox_chan_txdone() to tell mailbox core.
>>> Few controller drivers do have mbox_chan_txdone(), so Tx complete is detected
>> Which controller driver?
> git grep mbox_chan_txdone drivers/mailbox/


These are the only drivers that have a callback defined so far. IN all 
cases, they are only doing error reporting, but no change of behavior.


     drivers/acpi/cppc_acpi.c
     drivers/i2c/busses/i2c-xgene-slimpro.c
     drivers/hwmon/xgene-hwmon.c
     drivers/soc/hisilicon/kunpeng_hccs.c
     drivers/devfreq/hisi_uncore_freq.c


>
>>> by PCC, so not sure why you think this is not the right place to do. The irq
>> Because many mbox client drivers call mbox_chan_txdone() after running
>> rx_callback() in mbox_chan_received_data().
> OK, but why can't the controller hide that for the clients ? What am I missing?
>
>> These drivers doesn't set chan->cl->tx_block to true.
>> It seems that the client driver having tx_block need to set
>> chan->tx_complete in tx_tick().
>> Do you add this code for them?
> I don't quite follow you.
>
>>> is to indicate the completion. I am confused as why you think otherwise.
>>> It is defined in include/linux/mailbox_controller.h for the same reason.
>>>
>>> The client drivers can you mbox_client_txdone() if they wish to as defined
>>> in include/linux/mailbox_client.h
>> mbox_client_txdone() is used in the case that txdone_method is
>> MBOX_TXDONE_BY_ACK.
> Yes and agreed.

I could make this path conditional on that being set.  Something like:

rc = pcc_mbox_error_check_and_clear(pchan);

       if (rc  &&   chan->txdone_method & MBOX_TXDONE_BY_POLL)
-               return IRQ_NONE;

Which lets the ACK and IRQ paths continue.




>
>> And mbox clinte driver using IRQ method need to use mbox_chan_txdone().
> Client doesn't handle IRQ its always controller driver and client must have
> no business to do that IMO.

IN the PCC case, an error in handling a packet (PCC message) is returned 
in the error register and read during the IRQ response. That error 
message needs to propagate to the MCTP network driver so it can free up 
the SKB and not leak memory. We cannot free it before that point as it 
is still in the rbuf/active_request pointer.

>
>> It seems that all the current client drivers are used in this way.
>> These interface internal would verify chan->txdone_method.
>>
> Yes, sounds wrong to me.
>
> drivers/acpi/acpi_pcc.c
> drivers/acpi/cppc_acpi.c
> drivers/hwmon/xgene-hwmon.c
> drivers/i2c/busses/i2c-xgene-slimpro.c
> drivers/soc/hisilicon/kunpeng_hccs.c
>
> It is very clear from the code in mailbox.c, mbox_client_txdone() is for
> the client drivers and mbox_chan_txdone() is for the controller. We need
> to fix the above list but I need to check if there is anything I am missing
> to understand first. Please let me know.
>
>> In addition, I find that you also modify the txdone_irq/poll in the commit
>> 3349f800609e (mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT flags).
>> The txdone_method will change from MBOX_TXDONE_BY_ACK to MBOX_TXDONE_BY_POLL
>> on the platform using poll mode.
>> This may lead to the original mbox client driver printing exceptions in
>> mbox_client_txdone.
>> I haven't observed it based on the latest code yet, it's just code analysis.
> Right, I do remember seeing something and wonder if I moved to
> mbox_chan_txdone() in drivers/acpi/acpi_pcc.c for that reason. But if the
> expectations I have mentioned are correct, then we need to fix the framework
> to avoid throwing that warnings.
>

