Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EA5CF34B5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVF/3JAr3mXIRlPXVGbJIU9vlWsKW8XAH22PPo5V9R4=; b=qrNnohiD6DFJhPrkHdxDLML7HV
	jgwuOYRKKn5sNqbUt1jX72LooYFjbW0hpJ5++ziaTcdxke+YQNYgo4LyY9RJKvvkaw36DrgaxmnVT
	UhHxBDlhJtLC2xIWHR1axK6R1VZEEzAkUdqIGmemlIg62PPDGmhHCtiUU2YOVBqGy8Te/zwEql/AD
	fQjwT7embsJV7dTVvthTijMkAdf8t5sBEQ75pumrAueiPYQH8+LOv2BaGKPyjCDAkN/YnPj4GEuAQ
	McyGtCc7fKuKXoCjwUZ3mqWSKck9OXUe46NNKQcblnTfhfKIzDLKWMDY6lVMMjKJ3cFXSl+fb7N5J
	VVmrt1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjAP-00000003NBw-1Ibl;
	Wed, 19 Nov 2025 14:28:17 +0000
Received: from mail-westusazon11012063.outbound.protection.outlook.com ([52.101.43.63] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjAM-00000003NBW-14tc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQdr91BObDA/9QpXG3eEoJw17n8cwTxUO8KD88GkfklpkNH9QIzvw7ffj5FGviTYf3/ITLTCKzVGWrbTLIHXu70Gx6y9zxuNtDAL4rz1HVo/zrttTCfU/kqM4pMtsXzNt6dQ49k70BQaVQ1mWNbNpMa8FAj7nkjWUhbUz1jhkctijFmtoISBsCv9fnWxcposJgE/g/56vLC+aqPHMKRsMxa125r0xb3+VtNCV8l743nXJDq3N6ZQPIqQyuePkZjsgS5MSFrT6p5NBRYzlE1RvIcjtPMSQqScVAHy01w+MEixCSbwaeUcUGt7mgZWesHFCwQyIkzEY0cBf6Uxok1/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVF/3JAr3mXIRlPXVGbJIU9vlWsKW8XAH22PPo5V9R4=;
 b=sErHteO2wgmcIFSQgGf2j98EM5W2yzqO3Az7oCtwPgmWLFc7kLMI8ORQ9eOhy9XMsh7w83rCgGHuJWEqLMCy6vAXt7vbNZ1DZOWV+gdB3qtkJ2HBvBIaKWcrU/C76Owc4PSTahnMtcaYmuSZ7vlKMBBqxXPN8xXQTYgGEhpg/p2TMW1kR/gehEA3zArhmdDr5ERpnk2IfI+ElnNrpMGx1neo2WkFoSON1CS9HN8u5HAc0H5j3ipjGRnq6UZk1HUW8P+/9SrfLYjvGnKfT08tUlMpNp9WiJEO88L+cAhKH9fhKmXAuLLPxxhycytGewIrRxbGhWsnbKwbDB3UErpKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVF/3JAr3mXIRlPXVGbJIU9vlWsKW8XAH22PPo5V9R4=;
 b=GK3WbGM4hG5MJvFkkcyR793F3HAYdr88yYbA8yjFp6ChW6ynJTMKjKjxgBFNGf1esDIigsrZpwjJ4kB8mk7aUp23d2GZPJp5esd90s8/FwAMGL7qzDvU+mDUzv1ZoA6i3A/weqCLrB5yFGEuU3BMY6REpN6lxWWYIGn/BMnNGk4=
Received: from BY3PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:39a::27)
 by SA6PR10MB8135.namprd10.prod.outlook.com (2603:10b6:806:440::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Wed, 19 Nov
 2025 14:28:07 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::77) by BY3PR03CA0022.outlook.office365.com
 (2603:10b6:a03:39a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.23 via Frontend Transport; Wed,
 19 Nov 2025 14:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 14:28:06 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 08:28:03 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 08:28:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 08:28:03 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJERx6r1974380;
	Wed, 19 Nov 2025 08:27:59 -0600
Message-ID: <6d6a1eeb-503d-48be-81bb-df53942b321c@ti.com>
Date: Wed, 19 Nov 2025 19:57:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-sk: Fix pinmux for power
 regulator
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <y-abhilashchandra@ti.com>, <u-kumar1@ti.com>,
	<stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>
References: <20251118114954.1838514-1-s-vadapalli@ti.com>
 <f4d38392-a019-4061-9ef0-d95506766027@ti.com>
 <371e6a49846f910e9a747d4185471806cc719138.camel@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <371e6a49846f910e9a747d4185471806cc719138.camel@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SA6PR10MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: aab619c1-8b13-42b2-8f85-08de2777db4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2g2M2NtallGRFhWS3ZIZFg4NDJiZ2dub2RCWEZjVExwc2M2WUkwdTd6cjF1?=
 =?utf-8?B?WUhma05pWXpUZ2VYYm1pN2xHZU5tOVhzWjdOVlFvVjBQdjlqSURaWThNeUlH?=
 =?utf-8?B?NnREMmdLdkV0UVZsTjd4aUF0MnNXWDcyN2lVaGthMWxMbDVuNDZycGdmeUpw?=
 =?utf-8?B?NjN4b0JTcExzU2d3bElZVzZKUVBWTCtjeldpZklJZGFOWjZwQ21zWUhhRFNn?=
 =?utf-8?B?ejVqV01obm52TkZ4K1UrTjZPdG5nS2NxV25mdTNBRUlLalc5K3Q2Zkw1UmJs?=
 =?utf-8?B?NUVETUpVYkdiOFQyV0gzaDVpU2ZuSEhxL1pyNVRsZ3BZbnJwOEZTbDZ2dERL?=
 =?utf-8?B?eGRnckQxMVdMcHpWS0V0SXg4eDlwTTNxU1FjWXFKTlZIa0xDQmJmVTg3bnlI?=
 =?utf-8?B?T09WMEhZOGtJa1RabExoKys0R1hHaTZoYUtsVVJ2MVJWRGw3U2pqb3lYaFd1?=
 =?utf-8?B?N1RjazN6VVkwRS9Tc2lxeG9QQ3VpY3AwdWJyY0JSRTVXQkVnNExvekx0d2o3?=
 =?utf-8?B?K3NyVjlUenl6YkZ5WldlcjZJUktDMmxocDlJbGo2aG4rRXZqSTYwQzlwRGNa?=
 =?utf-8?B?Yncxb3dwWnpQaFNnZFBkWXlvTWEybFFEcnQ3eWY5bXhDbVV1ckgzMHQzQ2FO?=
 =?utf-8?B?K0hZTy9qT25xdUpvcXBJc0QwclhabmVjWG51dmlYMTVQTkRGVkxXLy9NaXFN?=
 =?utf-8?B?UlBUZEU2eEpOakI1WStQTUthUGJ1NWs1Y0ZWN2FiQzRpMGhtaDlrRzdUNjYw?=
 =?utf-8?B?d1crUm02Q0ZQY1dzYldJTUR1QjFYY0M2bjkramNvUzh5YkF1bU93UkUxWVNl?=
 =?utf-8?B?T3hFRTZiRTFEOTFCVFliUnROdkM4bXdCendtZnJ4V0UrN2JJU1dtYkI0dHA5?=
 =?utf-8?B?V2ZwOE13dUkxYitUVzl0aWYvOGxQdFp6R3FpRWx0L0pab2dHblJnb3lqRlRo?=
 =?utf-8?B?WFVKdnFnOUVxWHRIQVE1bjNlZjNxUzh4Z1ZLMG9OZkNwRUoxZWJsOVBYR1ZX?=
 =?utf-8?B?UnhVQmd4MU93QjF5dzJwV2FiZGpxQjExYk1tWnJIdythMXBpRHo1NE05VGND?=
 =?utf-8?B?bkhieW51TjZxQzE1UTdqZGlUUnJ5enhObHo1MGpuYlgwK2RWeWJKZ0R1QXFt?=
 =?utf-8?B?Mk53Y2VjME9MdXpQVE1XOWlGS3JjZWw5ZUNhRHl2SytMamFqLzl6ZEtsYmNu?=
 =?utf-8?B?TldkRzF5WDJneTRvMlU3bWFIVWxLWXBkdEVicVZHL1NEbll4eGtpNlJhN1hm?=
 =?utf-8?B?N241R3pURGE2ZHFVT2VybU1IMWU1Y2ZqOTdvb0lrOGpqeitURm1VOE4wKy9l?=
 =?utf-8?B?MDFqK2NaUFpyWWdrTFBFTC93ZWorMnF4ZWxQelk4SlIya252NlkxQ1V1V2Rq?=
 =?utf-8?B?cjRFYys4ZXFiYzdmZ3RUNXRPRkxOa3ZvUUFoeS9VTFRac21qRStSSkRHYm9w?=
 =?utf-8?B?SXNJNTZXWFh4WWt2VlVVUkRRVDlEMnRVNkNhZ2EwSWh0U29PbkhWRy8zaEkw?=
 =?utf-8?B?YXJFWmtOMWV6YW90S3BYSjVWM3dSWWY1MC9tQ3c1WWQ1K3RXSlY4VHp2VEtu?=
 =?utf-8?B?T2pCNzBIVUlCeFNtTVpDdEpmdjJDalM2Wkh1a1VvR0hCeUczMFR2dzNzalRn?=
 =?utf-8?B?bnVpeml4elYzWFdXY3J4blFXVlVOUHR2dVJpdHNOYzd3VzVqaVR2b01uOVV5?=
 =?utf-8?B?RHNCMHE0UUhmNkg2TGVndnprTW15dXhlL01Od1FpcmdIUFNxRmVmQ1ZiaEhm?=
 =?utf-8?B?ajhIOEJ2RFpDRmdLZHc3YW92MzhBNkFHNHczU3RFOFJoRTZRTW5aUEVFbTBE?=
 =?utf-8?B?aGFPZkk3L3pBOENJRnYzbFNhMEU5VW1MVGsvd1lqRnF3Z1NCQjRrMmdvbmlx?=
 =?utf-8?B?US9CVmpVZzBoN2hsaEg2b2R3S2xiMHZCNkxvZkNuMWlMQ01yZkt1TnlaNDNx?=
 =?utf-8?B?eHNtMXJPNDEvUDFvNkRyMWdScU9IeHVEbHBzUkZDSG5DdWx0TTdTUHMyUXZP?=
 =?utf-8?B?b1RIWXVoY01hVU14OFUwYldvUTVzejJPYnpKOTk2b2gzdUZGL2dIU1krZGdx?=
 =?utf-8?B?Ujk0OEM4b0pDVGtWdFBuMDJ1ZDBpU2xoWXIyVk1oQ2YzUWxOczVJbW94Mk1Z?=
 =?utf-8?Q?oPHE=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:28:06.5725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab619c1-8b13-42b2-8f85-08de2777db4c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_062814_384532_5E69C9BF 
X-CRM114-Status: GOOD (  22.38  )
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



On 19/11/25 14:13, Siddharth Vadapalli wrote:
> On Wed, 2025-11-19 at 13:38 +0530, Vignesh Raghavendra wrote:
> 
> Hello Vignesh,
> 
>>
>> On 18/11/25 17:19, Siddharth Vadapalli wrote:
>>> Commit under Fixes added support for power regulators on the J721E SK
>>
>> ^^^ not the right way to quote a commit. Should follow commit SHA
> 
> I started following this format after I noticed that an earlier patch of
> mine at [0]
> was merged to the Networking Tree with the commit message updated to follow
> this format [1]. I acknowledge that the expected format might be different
> across subsystems, but I used this format since it seemed concise to me and
> I believe that it makes it easier for the reader.
> 

Ok,  seems common in netdev but not outside of that tree.

> However, if the format should be:
> commit SHA ("$subject")
> for the TI-K3-DTS Tree as a policy, I will fix the format and post the v2
> patch.
> 
> [0]: https://lore.kernel.org/r/20241220075618.228202-1-s-vadapalli@ti.com/
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=4a4d38ace1fb
> 
>> ("$subject") format. Moreover this paragraph can be simply be stated as
>> node is under wrong pmx region (wakeup) and instead should be moved to main
> 
> Please let me know if I should post a v2 for this or if you plan to correct
> it locally
> (in case the 'commit SHA ("$subject") format doesn't require a v2).

There really is no need to quote the offending commit as part of the
text as Fixes Tag makes it obvious. You would just have to describe that
node is in the wrong parent node and needs to be moved under main pmx
node with appropriate reference to TRM/Doc

> 
> Regards,
> Siddharth.

-- 
Regards
Vignesh
https://ti.com/opensource


