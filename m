Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA33C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3ZGbyZVf8U8NF5zpidvHSh4SyBhksY05yS3zxJ5faA=; b=IviFna+1PC2g4liDopzp+eCdYU
	XDq6kAYvTcqsdrJ4nlBmdP2G1D50iHDhscIyXKBrvvwAU7K4F/U/6/Oh4GZRoNt/sMqBxSZsxF0ct
	Z9jY4uujmzefxgKeSwFsa4TGNRF3tyHRf515L/yz9x6L2XD4gWQ7SBb7tkXGu1wtNG6lKOEBH6+bH
	HZ7VWq4SUeaONt8t1dhmA/8WrllakUWtuHEfLs8FEXXDZm2ppH55E7b3n/oaA9ZJS5G69vrncjXV1
	gPDqlxibQorUJtBOshzOmIWRwCB3+xy3Vhlah/krXlYmoa0jYJwo3yee1pnVvS++BMSBaOGNRjF12
	Z4uPLzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcf0n-0000000AuuH-1ZH3;
	Mon, 05 Jan 2026 07:28:21 +0000
Received: from mail-southcentralusazon11011050.outbound.protection.outlook.com ([40.93.194.50] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcf0k-0000000Autt-0DWv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 07:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYU0YhII1/3cgUtF1d+kUL3tP2hMkIA2Lf1/GXpoR71ZJ759iPbnSywdNTOCoVosfERxVMV2wW504m+gnwsv2JOS3yUqlpxARiQ6vth212K8TRp8ovmYq3eHChE2HnrNz8mxeKJUe4o9rAdIqJzt2g6cZHuDIMVvrHjUGKHpG9Qljp3dP8E0qoVOyVZ9EpusoeriG16MOV9m5wj9c3Zq12+gP8velzZndCID+5MKsfK20lVrcN1CA6MML0HUCeJP9aA1ENWSfX7Nfu8Vo88c9bg+Ic9voTH5j2iEc25ib6M8+62p/7gEF24nMPYYLuHy7Y6SF54R7qOq+xxw0uTudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3ZGbyZVf8U8NF5zpidvHSh4SyBhksY05yS3zxJ5faA=;
 b=ce/gO9TzhotA55N7ifo7fEecA7NKBcaOHablgr8wl5v3gJfiAEeSVHBMp66gBjgm/oRBfzML2RliXJCSWNeiKAgO+yfPIlycr5IdaKm5M/zUzTxkEtFdT4xk+mCk7lKJVayl9zIK0nrsp5eIeEI3aDbAT7fyFNmfpdLXsKX0UG8KsJyRSAtXKdLfFcZWSPf0/sFY9wDw96LJ69jTOrSH3OAQwoe0yTUtUe3AznC3mBcK2nka0HO82XSD9JQmyCetsXf41tMjfxk1uWk1Y+DQGv0rPKZE+OeELFkTqI5gWiEtBRyJQrwBlpOrD7QGGREy4WuK5sO6nS9Gg9lVJrQV4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3ZGbyZVf8U8NF5zpidvHSh4SyBhksY05yS3zxJ5faA=;
 b=Wu8n0CU2fGOYGMLgcftl5Z9zN+dFqhnrnPlFfsDrZElIlQVl3TwQwoK4xb50E/ghe1wKPQ5I376Z8PmRxU0xP9sbGxccTOup0Xu5wt1UK9Oa2zv9/mYeBIiFUXnzNJGElQL6mLzVntgpiaFPYLLsrBVBoDnOLLPNMNwDMESdvyU=
Received: from MW4PR03CA0234.namprd03.prod.outlook.com (2603:10b6:303:b9::29)
 by MW4PR10MB6297.namprd10.prod.outlook.com (2603:10b6:303:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:28:13 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::29) by MW4PR03CA0234.outlook.office365.com
 (2603:10b6:303:b9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 07:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 07:28:12 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 01:28:09 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 01:28:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 01:28:08 -0600
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6057S3Z7890380;
	Mon, 5 Jan 2026 01:28:04 -0600
Message-ID: <8c25aeb1-fd5a-4b49-86cd-03324dc14633@ti.com>
Date: Mon, 5 Jan 2026 12:58:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: Add bindings for HSM core on
 TI K3 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20251231165102.950644-1-b-padhi@ti.com>
 <20251231165102.950644-2-b-padhi@ti.com>
 <20260102-shrewd-unnatural-lynx-b7d214@quoll>
 <3ac93229-3c37-4800-8e56-cbab13d4299d@ti.com>
 <18a350ed-bf1d-4700-81b0-02e1c2b85493@kernel.org>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <18a350ed-bf1d-4700-81b0-02e1c2b85493@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|MW4PR10MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee2ee6e-9e2f-4bb9-39ae-08de4c2bfc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTQvZG13aTR6Z2RCUXRVWnJCQ1FJOVBOc0dTRk82bUNlendpbW1xRElPWWp1?=
 =?utf-8?B?cWtHOElzeE5vUThkV1RNMTFvRktiOCtrVzNlWGNSZEZ5TkMrVmlkU0Jmd2VN?=
 =?utf-8?B?ODZPbnZSWXdITElVZ2tBa3JxTzJ6dDNCU0RDNFdqNTk1aXRHeFNyTWZEb2Rm?=
 =?utf-8?B?S25taTJSNkNJK3hkNyt5eTdUUWMrcUZScnJvUHFITWg2SUNUczFta2JaU1lL?=
 =?utf-8?B?ZUd4QUpVeWJ6cy9KMnBOU0ZGOU02Y1RHN1lwMlFoQlRKcG1hOTRrdXVKUDFP?=
 =?utf-8?B?RHU5dnpPTWY3Rld5M09JOXBsWDBadUkwTzNBS28wSEcxR2VvYTBFZkJJTkpL?=
 =?utf-8?B?cEc3cTVyT0dmN0ZaaDRFWnVKRU1qT0REREFFcnN0Zlg0MHptazJCVkt2MC8v?=
 =?utf-8?B?S3Rlby83ZldhL3VkREZzejBqQkZPbDh0MHZ1M0w0ckpQOEtUQmJJbkxOMFBM?=
 =?utf-8?B?dDRFMUlDeTl6VTBiaVh0LzZOdXFDNnIyYmhqSjlCNDlVSmNmWlRtbDlzZEJo?=
 =?utf-8?B?dWVGSmVldHVsdy9PWStTc1gwa3pqQis0NndyREt3Y0V3cVBmQTEyaERWQlcr?=
 =?utf-8?B?REZzODAyTGZkdHFjbm5wdTMwV0tNamdCekdPU0ZObFBuWGtHZVlwNEJnSTA3?=
 =?utf-8?B?Y1hGUWJwRU0zeHUxUklPcG9raHZGVG9oSkNTVDZFRXJYR3krRVBnM2lid2lt?=
 =?utf-8?B?TTlMV3VXV3luN3ErRmdoa2lSUjdmT1dZd0Fwa1pBMVJveWRkUzFRNUI1TVJF?=
 =?utf-8?B?d1pnNnFrVTNEOFhlelV5aTgrOU9XdmpucU9TZk9OZjNiM3RoYTV3Y0VDS25S?=
 =?utf-8?B?YVBiV0tiSWtnaGZvdm02aXVwNVpQa0s1UzFSTjdYbGROYjN2MEZNbW92WHVU?=
 =?utf-8?B?R3pteFpxOW50SWtNeTF2bDhtNkxRMzFCSjhHaCt6OG0vWm9GYnkwOG11TTFN?=
 =?utf-8?B?dWloTDB6WWF4WVpESmkySmdNSWNBUlZydGE3clExdnlJRFY0Si9CUWFkK25F?=
 =?utf-8?B?OFJ4aHIrSTRlRVJQYlQvajhOb0lYSXcxZCt2NlZWQkl0SFZWYXhuZHhXOHUy?=
 =?utf-8?B?RHpBOGQ0N09VMU1CeXBzRndiczBuSng2a0Z2eVlaczlySndTRlJmVHhQSnhm?=
 =?utf-8?B?RGZWWG0zV3o0bGtVYm9VUDB6VVFOOHdPWkpEenZoVWlpdCs5REtRa21SRDRZ?=
 =?utf-8?B?ck1KTmtHV0Y5QmhSaWtsRDVWeHNpUHI5WGNkRFpraDhIYnlTakJrNGY1eXdr?=
 =?utf-8?B?a0N3RzBDYmZGcWc5MkJYeXdjbWVRTnNDbmM4dUxMVkMvVkpoblBYanVSSHBH?=
 =?utf-8?B?TTBqSWpyMEZRMkpWdmtqeDhCbnMwakd6OU5yRE1wbUNxOERTL2JEU044UzJX?=
 =?utf-8?B?Wm5oSHY1Ylp1NGtKQXhrYTZLeVEvMXlaQXVmekpUZVBES1NqREJwMFBYTXFq?=
 =?utf-8?B?b2Q4NVl6S3ZqZ2N2S1FkdmZyTkRTSlNJNnhGMTVQWVp3b3NFbGFhSlIrV2Jy?=
 =?utf-8?B?WGJjc1VNZkZ5dEEzOEFCZXBHcy81YzBpMXBCV1BMUnZHN2RIK1ZCL0tFT3hz?=
 =?utf-8?B?ME5UdHcvUXZkNVA5OTNKWGlXOVBzalVSTjYvQ1JZbU9EbnVWMDIyeXdBYW5J?=
 =?utf-8?B?YytRaWwzaFpTMEpOV0xXWHptQTY0cVp4dXlzWTROUElWV0kzMW12c2Z4cVFX?=
 =?utf-8?B?bmpJN1RVK1dKQm4wUGJuMXFrY0lmYTBydm5Ec1hFbEhWekFiMllOVHUwMnRM?=
 =?utf-8?B?bWc4OUNKQllCOXVNNWdBRU43T2lSNDFlQzJLcm9VbmJ3QzRYeEtzdWJGdDBR?=
 =?utf-8?B?Y2ZiYnZNSGZWYUlqZ2ExT0hXVGpUNmY0ZWxHQklzTGk5U21OOVB6OFZiZXJ5?=
 =?utf-8?B?KzhPQkJkWVdKd0c5MmkzWlNZWTBwWHJFUnhyb3VoOXhyR20xUG1ycjhpdnRo?=
 =?utf-8?B?cHJQUjE5UUowdy85OUFXaXJKSGp4V0ZlV3VLdkFJaHF4TmZPYm01ZVFDYWov?=
 =?utf-8?B?MTJMTkJzM0FUcnRJQmR1QTdRM2hJOUJSbXRCTGptbDVNM0FyY0lUTFhncXl0?=
 =?utf-8?B?cTFQY25DSlZIYVZyQVNZMFAwOFRNUHhpSU9UVTd0T2pkZWpBbjdtY05mcTJZ?=
 =?utf-8?Q?RuFk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 07:28:12.7346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee2ee6e-9e2f-4bb9-39ae-08de4c2bfc05
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_232818_202608_333A752E 
X-CRM114-Status: GOOD (  12.77  )
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


On 1/5/2026 12:40 PM, Krzysztof Kozlowski wrote:
> On 05/01/2026 06:56, Padhi, Beleswar wrote:
>> On 1/2/2026 6:00 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Dec 31, 2025 at 10:21:00PM +0530, Beleswar Padhi wrote:
>>>> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
>>>> core in the Wakeup Voltage Domain which could be used to run secure
>>>> services like Authentication. Add the device tree bindings document for
>>>> this HSM M4F core.
>>>>
>>>> The added example illustrates the DT node for the HSM core present on K3
>>>> J722S SoC.
>>> A nit, subject: drop second/last, redundant "bindings for". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>>> See also:
>>> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>>
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> ---
>>>>    .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
>>>>    1 file changed, 79 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>>>> new file mode 100644
>>>> index 0000000000000..f61e4046843af
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
>>> Filename must match the compatible. Are you sure you are following
>>> internal TI guidelines? Did you read them?
>>
>> Will address all comments in v2. Most of these issues exist with other
>> upstreamed TI dt-bindings as well, will send out a separate cleanup
>> series for those too.
> This was not my question. Are you following carefully internal TI
> guidelines to avoid common mistakes?


Yes I did. All of the internal guidelines & tests passed with my patches
and only then I submitted this series. That guideline does not have
this check which is why it didn't complain for the older bindings too,
which don't follow this rule:

https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/remoteproc/ti%2Ck3-m4f-rproc.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/remoteproc/ti%2Ck3-dsp-rproc.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/remoteproc/ti%2Ck3-r5f-rproc.yaml


