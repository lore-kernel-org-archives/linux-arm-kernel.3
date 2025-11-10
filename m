Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69358CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 04:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rtp6TL4YV59rPrdbT+UHFSLGDxgKU2NJsr4b6l7uUL8=; b=0WElbGT/BlUT0ytS0XcaIpMU8I
	svYSSjrQFosvrzxd9ub8J20V+I6sLF5MVcbLe/lBVjwAWpPb95WXNsuW6HZGKgCIsM+Mc12q4OM0M
	DxKbrBVxby7xwNeeKBdQjbEA766IoJemNPgpwvn2ehT7j7r0ojmzYNTBZAEByeyvO9Y5gPNZw6zIH
	SQ9GefVMkzO7V7zBSR/5Mh1IS05B+AUIyiptt/mohLWNGxX5OLLytUd0IRYRRNAoNwEWNkzPSJBt1
	CzzPbGU9NVHpjQcGusadqlkhdJGfVCCZ/aoIIIUJa8rxSQbm7Pjh6PzFWUF6RJ5z+4FypH47spMmp
	3kYF3MPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJgF-00000004jF0-1d9X;
	Mon, 10 Nov 2025 04:39:03 +0000
Received: from mail-northcentralusazon11013048.outbound.protection.outlook.com ([40.107.201.48] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJgA-00000004jEO-3xbM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 04:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTahG+D6R4Ohp4lQgDGUGo4Zhr86AhAlYFlPjeeCR+0BulWw8Fk8tPtoQZF0HnRp4u+0f9FJJpXBYqoN/ltYh8VptDIckMXl5+9oyjI+4UJo6e4FApSNq3n3awMPqe/n3ax4EugYLWE0O7zc2kb7N4jZhRp9P6WYoJPatjvGdr3H3ny3ed+MROI2uSbdMSwtOu/Z0fu8estUGKkgNhrwsbi1RnPTOV4XljcYoY4KO+7DHQKeQMtg3m3fiReo4PE8nfbcfZctvvSKxm/Um5PZgKtuSDLqdtOXzjb4GeEWbdeHX0aVvwR4ySvFW95GY2jHB98cEm89L7noZzlXAB0G9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rtp6TL4YV59rPrdbT+UHFSLGDxgKU2NJsr4b6l7uUL8=;
 b=rVQ5Oc2L5YGrvpwmn8Mo/vTQEqxUveRqYTdQ20DoHo9vzKINaC2s6rPvzSAM+NzEtOJNjVu2dQaw5ZAa7fgJDxLQKFD4IDKqb8SCtB9d+jcxU341FeqKjLKGVxeul5MQ6GKrmgGkiOAbN7AnVHjCQN55WU1TvLMZAszmgCqBv7KJRJ2DOt6jni5zcelaA/gCHg7iBlVMzmAhXWYlKvcXBMfuVdpt/Scb3dnlBBzJpr/iW7GCBcfMlggXVe1m5WfIrqz4KMSdmYwKoF/ysCGqBE/m8A/mEO93SciEKeqOuGCLE5662q3752m7t91j1YnJgZMUROaExJq4/X1a0Qm2Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtp6TL4YV59rPrdbT+UHFSLGDxgKU2NJsr4b6l7uUL8=;
 b=O1sWrtc1+YkZhLZ7ewhSQxo8UmiIxtR8HKjM642P4JsjXDIlMzaL3CRh22UGJr8NvUFDm2s1DYTYi7aoA2xbxNyDjrRXQ9CGOc+w2o20Lq4WjcK3x9UuGDBxuy7t3EPbRHHzQfxFWJMqHCPmR4xVQOUAFhPcwar1MXs2zpND07E=
Received: from SN7PR04CA0018.namprd04.prod.outlook.com (2603:10b6:806:f2::23)
 by DM4PR10MB7427.namprd10.prod.outlook.com (2603:10b6:8:181::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 04:38:49 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::df) by SN7PR04CA0018.outlook.office365.com
 (2603:10b6:806:f2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 04:38:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 04:38:47 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 9 Nov
 2025 22:38:36 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 9 Nov
 2025 22:38:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 9 Nov 2025 22:38:36 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AA4cWPY2804238;
	Sun, 9 Nov 2025 22:38:32 -0600
Message-ID: <e1b2a13d-fab0-47f1-aae3-f2661c94d54a@ti.com>
Date: Mon, 10 Nov 2025 10:06:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm64: dts: ti: Add Aquila AM69 Support
To: Francesco Dolcini <francesco@dolcini.it>, Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Parth Pancholi <parth.pancholi@toradex.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>, Ernest Van Hoecke
	<ernest.vanhoecke@toradex.com>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
	<joao.goncalves@toradex.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>
References: <20251104144915.60445-1-francesco@dolcini.it>
 <20251104145240.61219-1-francesco@dolcini.it>
 <20251104145240.61219-2-francesco@dolcini.it>
 <d77bf3dd-4501-4f17-a776-3353f96f4fb1@ti.com>
 <20251105115335.GA14157@francesco-nb>
 <7024f4b3-00a0-4618-8bf9-53e305fcc982@ti.com>
 <20251106101932.GA5975@francesco-nb>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20251106101932.GA5975@francesco-nb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DM4PR10MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: d56f5dcd-3c80-4400-0f7b-08de201309fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nzh3OVl2b0RNVFJtbXp3ODR4MTMyd1BmKzlQUlpjTllFWUZadmgrWlFPZExW?=
 =?utf-8?B?L25WVkZMREVNZVdpUy9nTEppQXM4UUpiZnFaUUtRWHZUN0Vqa0pTK3d5RmZn?=
 =?utf-8?B?VGlqbUdRNGkrOUtnSmMvaXltZGJlN3RLY3J3M2VaejhrZ283bXVQd3ZuZGJz?=
 =?utf-8?B?eXEzL2FiOHlBYTNlTlNtSTQwZXBmMzlyN0xIRzZLU3NJTlVqQ3c2Uk15YnE4?=
 =?utf-8?B?Um8zMTJCbERkSTF0VkY3cGJqNTYvTDY0OCtzYm5qeTlzMXhWZlN2Z2pTYi9R?=
 =?utf-8?B?VGJvU2sxYXgwOTJIWXh0TVI3elV4Ty9rU2FZREFsM2g3aWQwME1nNGRXblQ3?=
 =?utf-8?B?eGY1ajFtN1lLMDdWQmNhczU2aHRQOHlXd1dtaGRnWUZoYk9teGhTZmVoa29a?=
 =?utf-8?B?alAxYngwbk5SaG1nZVpxUXgyQURtUmJKZHBHQVUzKzM4clNvK2ZoNkRpbFp4?=
 =?utf-8?B?N21hOEw5TkkvbDZ3Q1dwUW5raGsrc2lJWUtxQzRFTm0yUGU0SVc2SjZFWXNm?=
 =?utf-8?B?bWZnMXFQUEJrMmtlWm9FR0U2aGhIVTJLam02bUprck93Y2dpSmVtVncvL0pw?=
 =?utf-8?B?bEZoVUliTUI4VW9Zd0ZZeEVSNnVkSU5MNzN4NUtJTVovUGpSdDUrM3E4WEhK?=
 =?utf-8?B?aHBqYVpUSWtKWHJZbDNrZUgwTWhDd0tCRExMMXUvL1JKWDRYeUtNQ0UzRnJI?=
 =?utf-8?B?VE90MUlacWdDRFhmdkQ4N1EzdWhUYm5sb2JaSTlyOWxoSS81cGdKK2pCelhV?=
 =?utf-8?B?WUJTcWJCWTJUQlZUNGhUd2txbWs0Q25zaXR5UDR4bUMzWVpZcUJRY1NjQmFV?=
 =?utf-8?B?QThYK0xSUG1hNVJyZVk4dEdPY1VSalpaR1lLS25BMTZUUkd0MzlpR2hnOGJC?=
 =?utf-8?B?OVZQSHBwbkhkNDZFclBPMnExVm1hYmljVFBFRlNnVHpjTVNzbVVZUExHWXBa?=
 =?utf-8?B?TVlCMHlPejcyUDhTYXJMcDUrbVJZY0JxdGF5VUlLOE1DM29Kb2k3Tnc0eGRI?=
 =?utf-8?B?eTN1M0tRaDlHSjRybTRCbWZ2bHhyQmNLRXFvVlV6N3J0NTd1aDRMZlE1dkZB?=
 =?utf-8?B?NFd2Q2FsaHU2TVNBcGsxQ0VYaUNaMjRHOFFTTW91djRaRU91ay9aS1lrZ0V0?=
 =?utf-8?B?VnlzY2I4TU9EU09pQUc5b2xRTmZXVlBhY2t3Y1JMZDR2eXVzcjV4U2lnWmJp?=
 =?utf-8?B?Y1dEUXZoTlFLdDdMbHk0Z01MMHpFcGVhSFFER2pUcGd4RXc3aStiTmdLR1lO?=
 =?utf-8?B?a055aGVubGJDemFmRFpJR2REdW1xc21KNmNJNjlnTmVLODRpejhzdWV5M1Vv?=
 =?utf-8?B?NzZ5bHFSOTRtSnVNaUVLRFIwZ043blJSSnI0ZUs4WWR4YVVPblhrcDNPYk84?=
 =?utf-8?B?dDMwb3UvdmJwZUxwcHBPeEozbHdKQlRBTVBHNW1KcndUcUdoTXhZVmlxVXlD?=
 =?utf-8?B?dW5pUldaMHJMS3huWFByOThxK2U4S2RWVTZUUEliR3RWUEpxVThjaTNjbzY1?=
 =?utf-8?B?dEppcElBU1o4ai9LRXltaXlieVZRazdDRy9NWWNlMUVQNGV6V0hOeXJHWU0y?=
 =?utf-8?B?SVpxTDlMY2loUERkcUd6V0tRN2NPNVRnUXltNEhPdkxES2R4dlNNQXJsU1dp?=
 =?utf-8?B?MlJlTFRqc0pYMDRIUG5aeTl4MDhjR1ppVnpxZWZKNXdIQ2FoeGUzNDBVSVU5?=
 =?utf-8?B?dytkOGp4SzE5aytIN3V5TGp6K2pXc0RhM3FuRjdHYzhjOTM2Q0pDSEd4aEsw?=
 =?utf-8?B?Z2w5Q3YwVEw0a240UWVMOEMrSmlJZDRac2FmUlpXT0JqMnZ1UGVhdFlQUGlM?=
 =?utf-8?B?MytNV2FsSGppWFRmUmhYMFRXT2RCQmtFTGlLcGVrVERwaEFtSktNOE80WlJH?=
 =?utf-8?B?QmJDNGZ0NHJIWlJBWHYvWFlmTWdESEZ1KzZYNzJQZzlsS21XUklDVjdyUit5?=
 =?utf-8?B?NHJ6ZFhud0R3OHNQNUtpMFN5NmhqeEVPa0U2ejBFdkhWWEt6bzJHWXNCS1R1?=
 =?utf-8?B?aVZaN0tma1JvQmxQbWxCSGpPdkFzREc1QmE0VFNJc0NobE9iZTFnU2ZzSXEv?=
 =?utf-8?B?YUtWeXErdWlNay9HQ2FTTGZ6YjRUVXQ2aUV2bEVVemVaR2o4NmVXT0xaUytG?=
 =?utf-8?Q?+J6w=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 04:38:47.6750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d56f5dcd-3c80-4400-0f7b-08de201309fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7427
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_203859_124824_59E9ED3D 
X-CRM114-Status: GOOD (  22.28  )
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

Hi Francesco,

On 06/11/25 15:49, Francesco Dolcini wrote:
>>> Yes, known. Is this an issue?
>>>
>>> This node must be disabled, no matter what is present in any included
>>> dtsi file, it's a deliberate decision.
>>>
>>> This dtsi file describes a SoM, the used pins/functions are defined on
>>> the pinout, but this node cannot be enabled unless the SoM is mated with
>>> a carrier board that is exposing it.
>> Same as my point above, you shouldn't enable nodes that are not used
>> or have anything attached. The SoM only has some edge connectors so
>> it should not be enabled at the SoM level, that we seem to agree, but
>> the carrier board doesn't connect those lines to anything either. They
>> just run to a pin header with nothing attached, how is that header
>> any different than the pins on the edge of the SoM?
> You are commenting something unrelated here, or I am not understanding
> you.
> 
> You commented that the status = "disabled" is redundant. We both agree
> that this node needs to be disabled in the SoM dtsi, and it is already
> like that.
> 
> I would prefer to keep the redundant "disabled", because I see value on
> not having to rely on what is done on any included dtsi, where the
> original node is defined. 


One can always reverse compile the DTB to see if a node is enabled or not.

> I see this as a common pattern in multiple
> dts/dtsi file and is what I would prefer to have (and I do not see any
> kind of maintenance  overhead on having it nor this being in conflict
> with dts-coding-style.rst).

I cannot seem to find any precedence to such a pattern (adding status =
"disabled" for nodes that are already disabled at SoC level dtsi.) Could
you point me to some?

> 
> Vignesh, Nishanth, what is your expectation on this redundant
> `status = "disabled"` property?
> 	

Assuming such pattern exists, please add a note in the commit message in
the next version.

> Francesco
> 

-- 
Regards
Vignesh
https://ti.com/opensource


