Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D57BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 05:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9E2tpm7/0bSZ9LCYAlUmMcxDwQIFpLImzj06+Rt/yk=; b=Jow9r48vXEzsqqBKn6zoT+/MWu
	AihpeRn8K9udtSuuq6OKpdjGLHbdCLMuu5SNqjEQ5lxnIgp0r8DGCqtZAFZGCuqe6qL4i6cqwAl3e
	vRHyFp4v8ax4MRgfP32XAoDaij8WRK6GjJ84DUr0XIS7sqxEsdd/rKa5UL9s3QuCGPyrrq2EdMver
	g8uCZEYq2LgJNpiyTK8KsvS0thBQNccDYJLCq9eNgdcyjVBPEbSJBNan/hElSnUiLzwB8VN+Rwrid
	6mzK1bE4NkTG+5XFh2bU+2FYdn59c8CCQE9OW94gtAln40b/p7QcHlJGoWmRasZEnA8tx8cQGAaFC
	t5WIoG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRGG-00000000ePf-2Zf6;
	Fri, 06 Dec 2024 05:52:20 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRFF-00000000eIh-0Y0C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 05:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKjBMiW/o+NtHIpu7VnonkfDInvGgc1RogANsURKkH9MnkupNIIv4Ppbh/ROW4tZeKXYCG8c/7okZyoVPhoyLxDZ0CtsToqu0kF7LkGnYz9udXom3MG8syEZVVwhfEeAOTMpSONV7vfjcbwqUkrd75d6KEFVp1VpUBEJv8WgoO5O9npFCixrj3Myd2yuPUPp3XzdJUkkvh8dGUD8kp/3koc9gE/DNAop5opT3y4AstVLBd2/4hvzmbN5USHXWruIqDUIrczJqrsfbWVYtHY6t8yDnd38h2lcQtn3B1T8Yywz/fqyBqPakcbc3LRf/zigE/GTIl8BsZl80RffHTnZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9E2tpm7/0bSZ9LCYAlUmMcxDwQIFpLImzj06+Rt/yk=;
 b=d5y30kZi2JkmEhtQ39uevgvL9Wj9vm2cQiGnKeObfKqCTrL3PV/fJflAI+sA8qknYdoZPSqy5auDr+HbGw+Bf8st0BjzbXU+e4zmsQQguNbs44oxmNhpFJ/vnDTrk4UMjQMKnzH/8Hxqo2U5JlZg9AKVSNwUk9C9+3s+QepORrqjPgoplPk803Nq547GlUwjfdZAKzmqXzX3A+53zSf6NspjCUMdOozcnaPRZLt8yoNyJT0Bn8JCxQeYJW1ma8jQgnudbCRMrvjJrn9RrZQAxGGnlR1r1fGg0qDBa+An20SiJ0QSqXkmOQFJW9QEhwuX1cFxjsdWqkt+cPOVuQmGSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9E2tpm7/0bSZ9LCYAlUmMcxDwQIFpLImzj06+Rt/yk=;
 b=lA5UhM8vOrfglIaMSioFdf/uOY9ZoKZV5f3aFw16nSxbJjCcXddYl6LxfyUdg7NF9cOEF62K7SEe6+nrWygaggJNCG/QyOcnNxjJeD3VquPewNU231V5ABqRV4kCIwYSFoBCa/FX/wTCwo5VF3FpHUmQtdY4+8M7j0e7h3tVbAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 CO1PR01MB6614.prod.exchangelabs.com (2603:10b6:303:d9::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.9; Fri, 6 Dec 2024 05:51:08 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%3]) with mapi id 15.20.8251.008; Fri, 6 Dec 2024
 05:51:08 +0000
Message-ID: <31d523f8-9160-44ba-86d9-e7dade2fa622@amperemail.onmicrosoft.com>
Date: Fri, 6 Dec 2024 13:50:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: introduce rodata=noalias
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, ardb@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, mark.rutland@arm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 cl@os.amperecomputing.com
References: <20241126085647.4993-1-shijie@os.amperecomputing.com>
 <20241126085647.4993-4-shijie@os.amperecomputing.com>
 <03245d82-ad68-4ac2-a6f1-d8e4cc5397c3@arm.com>
Content-Language: en-GB
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <03245d82-ad68-4ac2-a6f1-d8e4cc5397c3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|CO1PR01MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0073f5-6483-4f71-f522-08dd15b9fb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWhQZ0NsUkpFcTZLY1BlMDdEVlR3ZjVXeS9XYWdKT1FSQWxZeVJSbXVvUGZM?=
 =?utf-8?B?citRYTBuK0czRlJJdnYvNDc4ZXZyY3VoZ2lpUmlSUkhUNnNQSDJCL1dML05o?=
 =?utf-8?B?VWdPRkl5bTN2WHR1VU9xa3lzV2JmemQxMDRhY2ZxdThpWWtKV2IxZFloMk5v?=
 =?utf-8?B?ZHdoU2VpVXRqQjRqbmVmbXR4ZXZpOHF3bkt3anNiRkpwV2IrZDhUc21TTXEx?=
 =?utf-8?B?SHR3RStvVm9iK1NBVVJEaWVBSHd4N3NYNVZ1ZGlENlIyOE9QajU5aHRWb3FV?=
 =?utf-8?B?VjZiVmZRUWM2VmsvMUx3N2p3dlJQOXlaQjBXMWMwRmN5YUd3YWlCa25UenJ2?=
 =?utf-8?B?TnhxR2JWaHVra2VHeUhSUllhaERiZUZQaWZHN0N2MjBETWlHY3I1U2Q0M1g5?=
 =?utf-8?B?SEJvNUpxZG5FZTVxT2pURmh2NXpZcDFUSXBDYjhEbnlvbHhuZU5qalBjSmxs?=
 =?utf-8?B?SDYrTE5nZzNsZ2NPbGZoUmUrK1pmTUJEMlJqd1ZOblR6M1dvMlFkNkxZV2Uw?=
 =?utf-8?B?aWVhbDk4UXByWkRjWCtsN09mcU9yS09hdThaZCthSkdBSmVjYjMwbmNaSXRk?=
 =?utf-8?B?ZTA3S2ZmSHh3aW81TTQ1eEpsQWlWNGlnQ3AvVW1BcXo3djZmeEtJNFVOcmY5?=
 =?utf-8?B?aUhGZmwxdXhubDcwVCttOVkyQjBvaFJpK0JjTllEK1VCUGdVRHRqWEFFRytS?=
 =?utf-8?B?bmdKM1JESnlZZW1JQkRlZHNRRXNLVnlRMzlHMm9zK1VnN1VFVnZBTzc0Z0th?=
 =?utf-8?B?NE9CVmlKaVNFekVnTUFzMENQc2NkVzVhbXQ0RThpS25QQ2tLVEJBVW8zT3BR?=
 =?utf-8?B?bUNVVS9JLy81WnhIT2lQa3NBNGMydnBIZWxBWE9aSTJtT2piTElyeE03TTBF?=
 =?utf-8?B?WUJRUlFreENxZzlwT3o3ZFR6WFQxcUlCYXBIUG9QZ0VxcGk4SGdQcnBFZW1N?=
 =?utf-8?B?dEs3NCs0WFVNUVFoa1RSQi9ZV3BzdWFacVlLZ2xuNUFSbFMrM2x0alFIaFE5?=
 =?utf-8?B?VFByN05lMGFZbW4rYVBMODVpUGg3Ums4MXRBTEFlRWk0dndFdkxJQXVCOGc2?=
 =?utf-8?B?Tkw2Y2xvc0F4V3NSQ0N0cFY5YU1EMGFtRm1hWkJTNHZkSmlDeHFaTS9HVkpM?=
 =?utf-8?B?YTFUU1lLQ0FwbTBaZXRzMnVvOCtUeWRhcEsxWm1XWVpFck9oaG5zY0VQSGgw?=
 =?utf-8?B?L0lEdzg1cDBVWkcxYkFKdGxJUllNbnd0R2c1ZmNmMmprQ3NEcGR2V1lrdkVI?=
 =?utf-8?B?enNtZFJGY09rT0hDVHVtSmdqM0xSTjBmTFByQW5yZmorM0JKMTVIN25GMEQ3?=
 =?utf-8?B?MWxwclhmTkhtMklld3VLc1FFUnRpOFRHM1BheVg4TE1OVm9ackFzRzB3YXZV?=
 =?utf-8?B?d1dHd2NOSHJ0UE52U1ZkMVRWdVV6Q2dMeFcwWm4zWGJzZTh1WGxKZHc0TWYr?=
 =?utf-8?B?UGdFdkRXcllNUmJJSU1uSGljdk1JYWVkWjAyUm85em5iRE5UR2VHNlBWYThS?=
 =?utf-8?B?eW1NNGtEQ1hCSmhsWUwvenZRS0NWZFFQOTVGWXV6OXVWdVk1amxRRVp5dmZZ?=
 =?utf-8?B?VGxVYWhsaEQrbExJa2hWR21sUkpXS1ZEdHNHTjUwVTJ2OG1JV0FTZ3FzdWRa?=
 =?utf-8?B?SEhtTC9iaVRlMWNQM2ZDd2U5VEpvL1pkZ1BDVkpoajR4RUxWOHlRbWhnQ0Mv?=
 =?utf-8?B?M1FUSzVBeEJXckpCWFR2bWhtRWE4NzhWVUNYLytyYTNpRzVIVURiZGZsSGEz?=
 =?utf-8?B?cXhvdzNRUVVHdmM1Y3pFNk4zMWFuNGd6ZGtaRCt0REhTTllRMzFEV0JnWnBJ?=
 =?utf-8?B?eUhnaEZ0dzVCbkRhVkg5Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUd6R3FsUXA2ZVBQMlZVeUcwNTZxVmpmb2E3czFuZFFEQisrTFkyTGhpMk1n?=
 =?utf-8?B?QTFPbnBScHMzbFVOOHZ3akpuMzgzenlDaUYzNlV4UTJqNW9YYnRyNzFHdU5k?=
 =?utf-8?B?aHhUYjNpWjZxM0d2YXM3TnY4OFZjZ2JoVVQzZDFrTytEWkxkaE9iays5dEFE?=
 =?utf-8?B?K2RsSkhrNlkwRkgwY04yT2pnaEtYblNLM1RrcEIvcHBPY2J4UENnaFgveWZ4?=
 =?utf-8?B?SVR2Mm5YNzI2YTBEV2ZWN1kzUThJTjNtZ3BJcEJHanJCT1lhTHpwVkR2U3pm?=
 =?utf-8?B?WXZqQktjMjQwbm5Id2lFR0pUbnVoMk9CbjM3V2d6QVNhOTM0WWFUK0pNT2lO?=
 =?utf-8?B?V3g1WnRhNUNsdGt1eHF3Nk5TY2ZPb1hYZDVxMGhPekdOcUs4UFlrWS9hVnl4?=
 =?utf-8?B?SmJ4NlJmOG1vVGt5R2h2bHZUYlJEQlFOMTNjaGFoWE5jUFlDN1lKeGhOdG5s?=
 =?utf-8?B?cU53NURqdGNseUk1ZVlPbXlDU3dpeUJrK2QvL0J1elFSMCtHUmlhbGVrVisy?=
 =?utf-8?B?bGhYTVpObUwrY3pwUGtGYS9BNXpWWTdGZ2tlVG0zYmZyMjJJdDhMZzBGbjk4?=
 =?utf-8?B?bWxCdVZNbmZ5bUVFbWJqYXA3MlpVUFhZYTFnOWphWlRYR1JWNzlPZlFIZ2hM?=
 =?utf-8?B?ejVaQU80enArWkd6cDFWQWpQclRid252Zkd3Rm5pQWhqOU9lWlBnZnFHSnE2?=
 =?utf-8?B?a2ZGdTZuNkl1Zjc1SWQrUmt1QWhER2dKSjNoc1BQYXNIWTlmRTRqRlJhbzVN?=
 =?utf-8?B?NUpydVJ6YjI4L1RlK2ZCbDl0dWhWNGJ0d055QjF4SGU1VStzcFhMM3V5UDdq?=
 =?utf-8?B?amJ2VzNsaVVRdUJYemV3bG1CUEdkOGlQY0xQc0p5d1VJREJ5OUxad0hOSStn?=
 =?utf-8?B?QTBaNTUzbDJpeVF3dzl2aHN1a0M2S3h6Z0FLSXhDeEhWRmJjWWxmRjcwdzAx?=
 =?utf-8?B?QTdET1FJdkcwVGxkcldVZ3kzTCtTK1JNZW5hT0xZK1hsTkt6U1dJQWYxL1Ro?=
 =?utf-8?B?WmZTMGJMcGtDUnR2K3VsbEJSZEk2M3pIOUVPNE1oY0lRQlJ6bkRIdm5DNzBB?=
 =?utf-8?B?cFhEK3lUZzlVQnZlZjJDaGNMblpMT3hNS0YxNzZ5ZW1rRTFtUE95RUxJRHVp?=
 =?utf-8?B?b01WYXYyVUFhaUNUSVFpSXFFUXh2MWF5YVN3RmNwQ3VvZjgybWMvRk9QVGhC?=
 =?utf-8?B?Y1g1Vm5KM0ppSFlrTmE2SE9URm1iUUJ2OE0vUW5ZZFdSa2tsWWtVMUZLZFBx?=
 =?utf-8?B?Z2hSUE1hVmx5WG1sQlZZc29vUGlXeThpUXZzbHVsSlhmT0Q0eXR5S1RYOU41?=
 =?utf-8?B?VVl1Q3lFREpqUEhJNngrOXNKK05HNFJ2dHZ3bWw2ek5vQm11eGRzUldKVDcw?=
 =?utf-8?B?QlM3Qmkwczhvb1ZGV01sdkxEKzZxVE9uTVBjZld6eWluM1Y1MC94MUVTWFNU?=
 =?utf-8?B?TnVlako0WHpqQWhhZllaRWtYaDNta3BScUF6UG5NTnNtTlZqTkpUVWpJNzVH?=
 =?utf-8?B?YVdCdnFlU1p3R1ExV0gzQW5EZ0tad2pRdUo5SldsYnMyOUMrZVM5Vkp5YS9m?=
 =?utf-8?B?RTNXM1hLSy9VeEVCYlV5M1g2alpqc1lmRm5sMFBXVTRMZjN5cmN6NjhJQXNE?=
 =?utf-8?B?QUZEUzRnRS9URlFCMHl4WEswOGlPUFRzN3hhVXMyTWY5WWx6M3RTSGtZZXBo?=
 =?utf-8?B?V1JySTNwSGY1Y2lsUGx2RTJ5SU90Y2pic0MyNmNldlBucHNwc1VmRzFSQm1V?=
 =?utf-8?B?R21TaExkdjF1aHRmNnJnQmVXUG9pQk5kQmFORjlVVmtjY210OG10MjVyNng5?=
 =?utf-8?B?TVhONHdYZjFOV0ZrVU5nZE0zL3FZZ3oyRU90cEhmSTdOOFV5bkM5ZmwrWmZS?=
 =?utf-8?B?THkzNHpic2pWajNHVy80ZzNXTnRkM2M5eEt2MFMzNkZrQmFoK3JHM2FSMU1k?=
 =?utf-8?B?MWtkWWR1U1pUNnMzeDI0N2hjbVkxWUFYUEkrSmtLWlIxblhHbnNEV29qZlZV?=
 =?utf-8?B?K1JZOGs1ZG4rc3RJNzJSWkFBM3psdXVlQlFCMzhaRWUzT09KUG5sN0ZHbzlj?=
 =?utf-8?B?Z05xc0trdUVNeGY4UzgzRGF5RUxXd3lIQy9MWFVIVjVpRHdoRngrMjFPQ2VE?=
 =?utf-8?B?S3JXSUkwMWtPaTIwb2RrUGx0SG4vemZkaVFUZkVBWU0yZ2lQSSthL25sSXpL?=
 =?utf-8?Q?OnrMPfeKRFAjquKqcAnukrY=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0073f5-6483-4f71-f522-08dd15b9fb1e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 05:51:08.5446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCK0qYiJyARzYYF6hmdsBaHmXILYFZjqIcAwYKtn6f48/AltBHo9d63vKjvoobKrVgXoJieyMyL3VpwNcFFJ5K5ELRWgQ1UeOL/PQOvmFZ2nUj+/7MOEtHgDGfluIxbr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_215117_193242_A3822B95 
X-CRM114-Status: GOOD (  16.48  )
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


On 2024/12/6 12:29, Anshuman Khandual wrote:
>
> On 11/26/24 14:26, Huang Shijie wrote:
>> The rodata=noalias is the original rodata=on.
>>
>> The rodata=noalias can provide us more block mappings and contiguous hits
>> to map the linear region which minimize the TLB footprint. And the
>> linear aliases of pages belonging to read-only mappings in vmalloc
>> region are also marked as read-only.
>>
>> Also update kernel-parameters.txt for it:
>>     change "full" to "noalias"
>>
>> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 2 +-
>>   arch/arm64/include/asm/setup.h                  | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index dc663c0ca670..54b4df42e631 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -5894,7 +5894,7 @@
>>   	rodata=		[KNL,EARLY]
>>   		on	Mark read-only kernel memory as read-only (default).
>>   		off	Leave read-only kernel memory writable for debugging.
>> -		full	Mark read-only kernel memory and aliases as read-only
>> +		noalias	Use more block mappings,may have better performance.
>>   		        [arm64]
>>   
>>   	rockchip.usb_uart
>> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
>> index 5ded3bd11476..3d96dde4d214 100644
>> --- a/arch/arm64/include/asm/setup.h
>> +++ b/arch/arm64/include/asm/setup.h
>> @@ -31,7 +31,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>>   		return true;
>>   	}
>>   
>> -	if (!strcmp(arg, "full")) {
>> +	if (!strcmp(arg, "noalias")) {
>>   		rodata_enabled = true;
>>   		rodata_full = false;
>>   		return true;
> This patch should be folded back into [PATCH 1/4] ensuring that
Thanks, I will do it in next version.
>
> - "rodata=" processing gets updated completely i.e dropping 'full',
>    adding new 'noalias' and also updating the documentation at once
>
> - Avoids temporary the "full" option breakage as mentioned earlier
>
> Also please do add in code comment above arch_parse_debug_rodata()
> function explaining all the options after these update.

No problem.


Thanks

Huang Shijie


