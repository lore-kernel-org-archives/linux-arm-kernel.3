Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC50E7E0C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 10:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erx/ZEjxkO4i0vYuHvnB+2jO+nE+0KIWfrncJXZj4sg=; b=dO05+6/fBSDL85pOaOhjWrbI6e
	vDWL7j89U1+IdCNjTfGYaOCbhx2rJYzAuky6gfGg0gUls4oSnOdYyy+xdEGgCx+afkXl2Tc7fAFOx
	CO/FwmXV51Jv2yfJKmQy19x00Sa/J2rFWTTRM9u/E1hH18sIr2r58NLk0noqothhx3Lmc4OcKJLyq
	KRYLFmoThSyuJV7Hqylcc4ZO8W0E0c9Hpi6xa6BNyRkuaBgjnPxC9kcftIfsd5i6D41mCNtTShNdI
	bB6mJMdOfhun+KpEB/uQkZZ1OeRhRf2fNru0vEI29esP1jB8xpjFd1A7gyEVlKpXnYUfRJ2fbwjcN
	h/8izeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOfo-0000000FFQO-24QR;
	Mon, 09 Feb 2026 10:39:20 +0000
Received: from mail-westusazon11010044.outbound.protection.outlook.com ([52.101.85.44] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpOfl-0000000FFPs-2BGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 10:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLuKL512ImLHNhpl9DpHSrH+4S8+lOQsj/YzZqvbHl8ZbAfGK2g6alHtZBV9WX/2xPFN/9Cx2087n9ukZo/6VW8azGunwqcsc3p5iwqoYTmBDOcHm5wOy7e0pbm7FFWUjVRXZNMViQxpbaH0vJAMct4NvOSU+zhGLvh7//a38zBtWkKda/WiuUfhEOlbd1BUIV8eJxi4rYZEi9jBPfZAV0N+ZzPzWtFiciRVn0VNMMH9FkFOAP5I8tVpJB9fSEvn7qlv2lKOFqwqxtmCs5zOkSsKkDDLzcGbwrqosFVJgTnJyixS7GIgAkJVQ9ideDNZaEKO98DORvr1RqJKFTUKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erx/ZEjxkO4i0vYuHvnB+2jO+nE+0KIWfrncJXZj4sg=;
 b=ZPYykXFeqxbrdNfhCXbED1CajNrM9Nrd3q+sorWVtt57rUp8oEJmcVULsaGqFO1mrO3svHpyVPHQwK/GtLK3KEd9WYJOG6AHBdYEcNmxwZzJfhLISyGESZxiZh6h6yvUk4fSOUdNJDb3tSv7osH9w/AjyA0U3TnB5sa2iXktXr9NdglI9MX4OYf0XYKv0yzsoV32nTtPh4SM3iiGbDAvUYxxb34gglBiVutUc9zhMh2U8V4FduW9ffv2u3mhIgKvIGjg+zOg3ar1Uz5PEehPZmDfNm6pKFkwncMmzMNSEnhIwcEsePzfZPFoJ30WZucBX+VydzuLiE4thF9dK8PFww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erx/ZEjxkO4i0vYuHvnB+2jO+nE+0KIWfrncJXZj4sg=;
 b=je7MhpUPS39M06HcnACFy35RZSOb1GIcBeHTiiHdRxg6YP61MRfS57iPr5EFkuj3yQ8bz/cfaqL9GNYQmyowKPTHPKOIg5z/cNSZ/hp08iyPgqFbmhxCwOMcNSVUIOS/0xZJS7MKg8humgPOBowI9GJ23RDslipawMJe3NsWc2U=
Received: from PH8P221CA0060.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::9)
 by SJ0PR10MB5663.namprd10.prod.outlook.com (2603:10b6:a03:3db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:39:14 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::65) by PH8P221CA0060.outlook.office365.com
 (2603:10b6:510:349::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 10:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 10:39:13 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 04:39:12 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 04:39:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 04:39:12 -0600
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619Ad9NC1850661;
	Mon, 9 Feb 2026 04:39:10 -0600
Message-ID: <f1f27a4f-c8d1-409d-9915-ec7476950bcc@ti.com>
Date: Mon, 9 Feb 2026 16:09:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: multi_v7_defconfig: Enable more OMAP related
 configs
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux@armlinux.org.uk>,
	<arnd@arndb.de>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250616082038.3241346-1-b-padhi@ti.com>
 <e58c3a53-0b46-4478-9f82-389a6332b9de@ti.com>
 <c218f45f-d3cd-4a72-8af5-91ef59ff6936@kernel.org>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <c218f45f-d3cd-4a72-8af5-91ef59ff6936@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|SJ0PR10MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d6bc89-5960-45e2-41d4-08de67c77768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUxFbEkyYzJtS2ViaDNla3FDcml3cnE2bCtIenBlT1daYjV1eUJVT0xUWEI4?=
 =?utf-8?B?SjNWaGZ1a2ZJL2ordXFEbDNlRFZOSytwNkltMHVTRGg4SENiR1c3UjAwNGZa?=
 =?utf-8?B?SXZBNlNTK2tGTHR0OElGWWw1bE5qR2M3MlNxZHBMYVYrWHJPWngxelR5TWdN?=
 =?utf-8?B?QVdjT0t3ZVAzek0ramFEOTdiKzJLWG9NTkpGRE1HNWNPT1Vsbzd2UTJ0M2ll?=
 =?utf-8?B?VGlKaVNGU2tsbnFsdGR0aS9iU3pweTZSOVE3OUpaQUpSN0tDQXBKenlzMHlY?=
 =?utf-8?B?Q0xDcnhneDVUb2pFNWt6UzhFMHlsdjY2Zm85ZXovM3VQMDYvQTY3a09YOEVK?=
 =?utf-8?B?bDFFMXVDZGEwWWVXOUkyaUpPTlg4bjFlQ1JmeW9kWEZBdUQzaGZWWUFYdmZV?=
 =?utf-8?B?amVZOVFYZnorb3FXRUVQK2dxL3NqbVdSWGgva1NqTTJxWHZtUVRmWWpqck9o?=
 =?utf-8?B?TUFMSFlMa2hOc2gwWDU4SVR6UE9jbDZMeSthTkZzZVFRZE9INmJldnBNNTg2?=
 =?utf-8?B?akZEV1Z4bzF1M2V5Z1MzU1ZRcm51STlaTU05T01hdzhOSEVTTjk4MExlSXdR?=
 =?utf-8?B?NjhXSFZpSHV4UFJuVmhQYUtGMWlzbC9JUEl6VE1mejBXZHhFV2tsSzBSbTZw?=
 =?utf-8?B?NVhBNy9ERHN0VUpBUkk0c2EvQWRQWXlCRmcxcWRBeGlIdnNkcTRscVhTayt3?=
 =?utf-8?B?NE5XWHlvd2JTN0VnU0U1QmRleEZhWFNMR2xtQ21aS2NkaFlyOTdPODd2Zm9N?=
 =?utf-8?B?bFdPWVlJVTJJK1ZaaDY3UW96Q09PS2k4a3k0WDF6Ukt0SnhkaHZ0dnZmSVdT?=
 =?utf-8?B?V2pnQWZKaWgzeEE1QmZKa3U3TGNodFF6ZW1vZzcxNXVUZ2ZBNFRsYVVvbGhD?=
 =?utf-8?B?Y0VGczdmUC9acTBucWordmd5RW9hZEtzUzNOekpBei8zWHhXWE1GM1RRNkFO?=
 =?utf-8?B?NUdSa2NnVW9xMXdnQjh0MGdTcGpnNnNPa2RFMFB1djFvanZkTlc1YzhWT2Fk?=
 =?utf-8?B?YmJjOHEyYXZ5MXRaWnZwcVFEUEo2NVFydmJSRWk4THpIUUN5dmZvTEVqenBa?=
 =?utf-8?B?L204eXhLa3VSNG1mVHc5akdkSXZqK0diSjNwbndIWjFEaCs3QUJZQjNmeTJH?=
 =?utf-8?B?SFNYTnR6TlVpc2twa1R2Mkc5NjhzNWxLQnkxSSs2cVJaUUV3Uno5Q1Vna3lF?=
 =?utf-8?B?MVcvVHJRSXQydHhSbm5WVzRXQjhTalVSTmVRdWFVTitEZ1BiVmVRZ2tIRDdV?=
 =?utf-8?B?T3RuVmt2R05WNFhua2JXbGMveUlIMlBDYUxOOHp3RWo3bUFpZ1BOWk9zTmdS?=
 =?utf-8?B?bUVEdDBQc0xrUnRuMHlwMFNka3ZrVWxiVWFQcVBpV2h1ZFplV3pEcTA4TjVx?=
 =?utf-8?B?Ny9RWWxXVzA4RlowR0ZPU1d2OGhKNVEvamVVbWNxRlE1aG5KeFJBWi9GbDJs?=
 =?utf-8?B?Q094ajFnZit0dzY0VEI5UGorRjRnZ0dpQVZSeUI4aytnb2FPaTUvVnVVcVNX?=
 =?utf-8?B?R0tjdWxJaEp0Y2VLUVZLQytZRENIN2l0Zi9ISis0QytiUEdYaWVsOVhocEdi?=
 =?utf-8?B?ZWpHMTBYend5RHRGNHcyR2l0UGNWem1OMm10MjRCcUNUc3NMTzVwQmtVNit1?=
 =?utf-8?B?cGFpSWVWYlBkRVQwY0h6R0JMN2hqUGYvZTRRblNXN2N0WkdpblhQd0Z0NFV2?=
 =?utf-8?B?RUNaU3BwZVd6STJnT0RwYjhXWFhSMXBjUTJFeGhIaW8zK0cwNEd6eHQzS3Bp?=
 =?utf-8?B?VDQxMklJdTZ6SzhVZEN0d2sxSWdvRldia0dtaERhN1hWZkdqc0JEZHVTZTJS?=
 =?utf-8?B?TmwvVjJYblNaSTFWcEQvWlZUblBISVFkdW55bm9PUE1wMk9QQTNOa0d2YXFn?=
 =?utf-8?B?RUZxNU5FY2ZySTB0R0QzdS9VSEZaanc1aGxxc1JSWHRrbDF0Zi9vSzRpTGdN?=
 =?utf-8?B?Mk5VLytpRm9nemFUNkVJY1NUN211V2NTaGpENlNFUHFaMU1HcDZ4SHY1OWZa?=
 =?utf-8?B?Uno1U2xhcWpmVFNFOXZXZnJNdEpoazdEYlhTemh1U1dOZDU1QUI5THo3VWFQ?=
 =?utf-8?B?OVlJbU5LcU9rT0JvYXpveUhGS05jakdTcUhMUmphVDJMR0ltZmY1dGpsYWwr?=
 =?utf-8?B?TFdhS3laV2c3TmhGYjZVNkwxcXBIbUUyWWJqZmQ4ak9YSUdzTENKeG00aHF4?=
 =?utf-8?B?c0lqZXVaQ0V0VUxrbUR2YW5nRllkbUZGOWxKejkxVU8rOUZFZ2xxOXZ5WWdN?=
 =?utf-8?B?TTNDanVGK01xeXRENmNKVmxXbW9RPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RAq4DWchY2m6yeKobh+aqx2LdL6pIg3pWz7kvGfFC+jjPVNluf6B/sz+VeAyHKgbF3q9PQsGEe/ckEsgFu0jl0v5YE+FHjoQWpLiaXLzaEkU5Y/D51FFcoPYnMsOcQu5M/O08leP+w15CZZ/Wi+ZxZXe/Ocdj4O+i89ajy5XTTWmLNw8ZVVPSuLJr/ibRRR4IVUPWqvEg1po5wbs+yLb7Wkt1vGYgt369cueFRTTMzxu+ITCFtP17idJAM+eSHh8N2Ir4tfAQIXMyjZ7buqWZ8RW4rADLQyhQiU2qSoV0ObhFIsjvxZyCaR235P/B1fLTLJIAiSdil/aBqxKSh3sl+pXWvQpLB/C+YhmSk4xmidG+0dFPubTO3dBP/U0JdIYgLsLibVyaOR9xv+9PkzcVYZEo/WnCokiZgMMb1HNYE178AOA/H6Y2zENO9NeBPOE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:39:13.1767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d6bc89-5960-45e2-41d4-08de67c77768
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5663
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_023917_646306_0D32BC3A 
X-CRM114-Status: GOOD (  14.85  )
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


On 09/02/26 15:12, Krzysztof Kozlowski wrote:
> On 09/02/2026 10:39, Beleswar Prasad Padhi wrote:
>> Hi all,
>>
>> On 16/06/25 13:50, Beleswar Padhi wrote:
>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>
>>> This allows us to enable various peripherals in the TI OMAP family
>>> platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
>>> AM57XX-EVM using the multi_v7_defconfig, instead of only with the
>>> OMAP specific defconfigs.
>>
>> [...]
>>
>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> v2: Changelog:
>>> Krzysztof:
>>> 1. Updated commit message to call out which (and why) upstream boards
>>> need these configs to be enabled.
>>> 2. Used savedefconfig to correct the order of configs in the defconfig.
>>
>> A gentle ping on this patch. All of the drivers are enabled as
>> modules in this patch and the existing review comments
>> have been addressed.
>>
>> Please help in a review/merge.
>
> There are no full names next to the emails, so I cannot verify that you
> actually Cc-ed right people, but it just looks like you did not. If you
> do not Cc the intended maintainer, then the maintainer will not pick it
> up. Neither Arnd nor me are OMAP maintainers.


Thanks, you're right.. will resend the patch with OMAP
maintainers.

Thanks,
Beleswar


