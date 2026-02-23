Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4A8EA4FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmzT0TJuI6go/uz1mp4mcN7+aWUujoukEeM4LSA1E5c=; b=hNq5P+DgvNMXg1FW6ncryhuRzl
	Y64Ztboi4C+c29qmxo4apXDIZeLCmcdT7Ga0VwiZuH7ApWtZBhuelmzXeEYHXsknx63MXKXw7i6ut
	srXRwGNFqalSzUARVZtVw7pPSGX+PDuf/NsClBk7c1+E+ev05vySWmOZNv3ggfjCmaG0k1S5o6CP+
	qcLdXxIK2q50wIJZSGMQSBlmSGS1YnEOMveNsJyv+EH0SemyOiy2Hs91OyF0PyjcCThoS2upx5hJI
	IHT5wWyJAAQnAulZTdaGyqgldhk4ViovbFDv9sj6TTj059LCPFCEtYXVZ8nXNHG+31Xflrrn6B9VN
	5FXVS5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwp-000000009Cs-1p5R;
	Mon, 23 Feb 2026 11:17:55 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwm-0000000099e-14Y9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cec9dZSjD6nVVXzg8kB3Pqvifx8bedxRrx65wKec9SzK2KE4NwSPN95nWvHtJfcMJ69PFxY/BZkKoqlL+tBmVJ6jQOewygcp9p08W2KXT47oP8IF54pQnsy46EPEDSJzvlP+0snPY0sRAY+wk9BmjKwFsxmFv1jvuS8XKlUOr242QwJsRK75+XiL/ZvK5eCUhFajhIiXRACelWOtImvht3GOT61bGcCbMJvbv8dDQeJ7OgYI+u6G3/6zyBTpWsigSJ2sSO6yQtAY4bhe8HdCgiHkE/5yGGCl8McuAx1Q+1ltiF0mAW5kG9QxxaQWBIAODhxChaozWVvExWWYDvRWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmzT0TJuI6go/uz1mp4mcN7+aWUujoukEeM4LSA1E5c=;
 b=WR9WRTCud9y2ZxZk1JdsoH24HCy9yLoNoc2wbRmebbWUE4AKoicZF9b9wMk6XryKT5NIZcPqGtK3vd6gyUIy1Omg3d2LI8ynqOsGo6r78G6j5zd4ydUlBhRLxau9J0rP9nERvlMhwafXPnnEZzbs4WqY6iWC8OD9Kq+BrtpUqh8np4ICoc6vWjQZWIDVw5WPyulsWjxzVEetMCkSayOCCr4teiv6s2GSl6U32QgfmX4TZa+lIS7/5jGChPNZGwMNlcqY3c1zJfxynXn2dKwkkgERIjzeni7ocjFU319um7LRhMLRqGG4xpMAVk1CZnzbj06rMddbZfkGi72Br4V48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmzT0TJuI6go/uz1mp4mcN7+aWUujoukEeM4LSA1E5c=;
 b=mrDaNesVTAZ4+uCgXq35JSRjZ0jVenpIMbhRinnR0WYfB4jyHEPrcvAv/G+5KrEX+JVAHTuPcVYBBCUCOKIpO+XR865sG/U9s8pnrfUn5+ZC7QNZUGKx/Mt9EjL8IXIR0imDk2Pok1ZFOQCVbqRZWcD1zoLLT7CZyru53eSkknM=
Received: from BYAPR06CA0013.namprd06.prod.outlook.com (2603:10b6:a03:d4::26)
 by SJ2PR10MB7736.namprd10.prod.outlook.com (2603:10b6:a03:574::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:17:47 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::50) by BYAPR06CA0013.outlook.office365.com
 (2603:10b6:a03:d4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 11:17:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 11:17:45 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 05:17:43 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 05:17:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 05:17:43 -0600
Received: from [172.24.231.225] (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NBHcdc680064;
	Mon, 23 Feb 2026 05:17:39 -0600
Message-ID: <824b8e89-29b5-4313-83dd-141d97451b82@ti.com>
Date: Mon, 23 Feb 2026 16:47:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable the Keystone PCIe host and
 endpoint driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	<geert+renesas@glider.be>, <bjorn.andersson@oss.qualcomm.com>,
	<arnd@arndb.de>, <nm@ti.com>, <ebiggers@kernel.org>, <michal.simek@amd.com>,
	<luca.weiss@fairphone.com>, <sven@kernel.org>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<kuninori.morimoto.gx@renesas.com>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>, <danishanwar@ti.com>
References: <20260223104650.876632-1-a-garg7@ti.com>
 <abcaae3e-c0ec-4e83-9ec1-016f36212084@oss.qualcomm.com>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <abcaae3e-c0ec-4e83-9ec1-016f36212084@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SJ2PR10MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4f06f1-9373-4a3c-706e-08de72cd2bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHNlYnNtcTdDZlpDbjlodFBBb0ZIellnWHdDdjZaYm1WOFA4RnhHOE12RXdR?=
 =?utf-8?B?S3ZCQ054SlZLSmZJRnRYdGZtdnIxK2lYMjJEc0VHSHpRakhNK2oxWGxFMEdx?=
 =?utf-8?B?SjlVSEtDdzVCUWNRSU1pQmJ3NjNhaDlhMXBZV1F5MHROS1BBRzlTamhzaUNq?=
 =?utf-8?B?ZnM1TkRuZjhydlFtZEFlbXRZYmkyTjBJbmUzUDNFaENiZXFpRXNQOHMwNGFp?=
 =?utf-8?B?MSt6MXdCOTI1ZTM4RzRnZ3VFSWk1ZFVJTmNoWDN5WkVhUnAwTEtYR3hxVnlJ?=
 =?utf-8?B?VmYvVEZoSGY4aExHQzJxRXFSV0xHcTFrZUk5ei9FTER1NmJIMjgwZE0xZDRQ?=
 =?utf-8?B?eWM5bytnMFVzMFFtZkl6akpXQUoyTWsrMFdRZG5yYVZndEhpVHVGcDNxYk84?=
 =?utf-8?B?Wis1RW5EVy9EaXkwWDgxS2t3TXBwZHNEMmwzYVYxVFpvRmg3QkRXbUk0UkVo?=
 =?utf-8?B?Z3ErYjhTUTNpYThvYWh6d3RPdEtkK1ZrbzgyUEhOcU9Hcm5YNUJ3MmgzZ2Nk?=
 =?utf-8?B?aEdxMk5GTUJXMUpVNlltckNuVjM3enQrcUdIdXQ4cFBtUkc3MXAyMHV6anpo?=
 =?utf-8?B?Q1F2b09OTFl6TSt5Wjhmc3RURkVTWnlnL2RHRkFwNlRRZ0kvMjhTZG5LZHho?=
 =?utf-8?B?RG5JbDBaSHFtclhaV1dLZ2RrSFlKd3hVSDFpY3ArVjVKM3hIQ2I0QUtZa251?=
 =?utf-8?B?aXViM2h3T2NWZFlPS3BXbXZoYlhmRXVLMjlhWUlqWE9EbmtSSVNGem84eGtB?=
 =?utf-8?B?SnRPSXdxeXphQmhoYlJtQ0hvNG1icTIwMXdzd0F5bnpkdnpLbGd2UmVXL2V0?=
 =?utf-8?B?d0NhMGovT0prWGk2RVA5U1NJMGE2Mjl3dnV2RWJ5Y0dHTWtSakhYTStiR0tm?=
 =?utf-8?B?blNtMDVJL2YwYnkydVAvZVNHSHo3enZZRjdWQVp3WWR0T2dYcjE3WVVLT042?=
 =?utf-8?B?SlUwRVg3VFcwbnRQa29IRllIUWpIVWJEdnQ5dm51ZnRuTlRucGpRNCtNd3lM?=
 =?utf-8?B?SUMrSzhodkwwQVFBNjBLS2JCRnByYmRReUtjU2xtaGRwMUlXU1pPbVhMMEJj?=
 =?utf-8?B?ZWJpbEs5eEU3eGxNbk9MM2lraVdrRXo4WW03WHpTa1Z1SW5ValVTQ05qQ0pq?=
 =?utf-8?B?SWJ3VnJCbFFFSHRZUHU0NDF0NXhxbUQvNzBIWWt6aEY2V05xd1RHc1hPVWhs?=
 =?utf-8?B?VEpxSW5QSit0V2JkTWNjTVdCdEt4OWRBZVdRbFpONk9oTGt2ZTJpRXlkRHcz?=
 =?utf-8?B?RFA0eXNqY0NIME80QVV6dStla1VGb2J4ZVp2L1hwVFRmeWZYL2dHSFJ1cldS?=
 =?utf-8?B?MDFhcWY5Sk5Sdm5ESUpIY1ZIQ0JkeTBCT1VXWVVaZlpoSDVzcDcwVVhXK3hq?=
 =?utf-8?B?UnhqeFRkYlI2bk81eDBSQnZSb3VCaWdaK2lXRWhrbGNldDYzR05SUUYvL3lH?=
 =?utf-8?B?TmNRd0FZZVdsZW5zSGViUSsvUnZYWHplVnI3SGRFMFF0ZjJlOEMzc3E2aEFu?=
 =?utf-8?B?MVRCTEVKb0J1Y0VzY20xQkQ0TlJwbEloOS9scUhyc3RkU2dQczF0dUxlWVQv?=
 =?utf-8?B?dUpOWm5wY2d0Y0tRbjU2LzRXT3ZINm9UQjFTbjJmdlVRa1NzeThrYitaUndx?=
 =?utf-8?B?UVBJb0pwczRibWNNV1NYcCswVGZtaGcyRUFkaW5FVG5rbEpCek0raVNqM1F3?=
 =?utf-8?B?ZzYrL2dqdXFheWJYYS9JbFFpdmd3WTEyU0RHY2FhMS9ETHI5TWtoYmlnd2NX?=
 =?utf-8?B?NUFKSFNkdHdUallkV29xODdrZ0lpY2N6d21PYnpCRGdKaG5VTHU5NnQ1eGND?=
 =?utf-8?B?Yy95VkVkbERuWGQzZnI1OXJVWS9aYzEyck1oZlBLSEVsY3RkUkZ1ZHVnMUdD?=
 =?utf-8?B?ZkdLMUhLLzNETGhoU1ZSNlBDSGp0M0RGeWpWa2RvSlB4VTQyRklaVU9NcnU4?=
 =?utf-8?B?aXVKYWljT2YweXQwS1VzY0U2TDdxOXZuNkRTbVJzSmVSc0NQQjBhMGdMcXM2?=
 =?utf-8?B?VTRkRzN6UnhQZFgzRzljd08xQzBPZi9ZRmRkeWM3cG1LT0QzVml3Qk1kektU?=
 =?utf-8?B?S3QrTUZnMUhzUExJNW5RM29WWUFRdk41NEhjejhPL1FDWjhwSm82VnNpNW1V?=
 =?utf-8?B?aHIwV0JPZUw1cHBaMVdzc2ZpTVVXTU1obzR3R0R4NUJaVVgvaDB2SkJkVDZU?=
 =?utf-8?B?VHFvazRIamFEaGszRzh3bnpRcjBkTTEzV0pvNFhRUStBMnVsVzB5eEEyOFZ1?=
 =?utf-8?Q?ErnsftBlRi1SYke77mggy0PvXmu6RAxBITEUSW35EI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: besaNFZtUxJfewM07Ureo21uYNKUlxu01NtjqNDTOoxCYqVc+CF12lvq4gXcGeN2ONvjsgFDf8AwADsvPIKSAcnZlYp1NlIhhRrWiVuKgq0sasydgaEV8/DoKeXpER2pAyVMOdEOmGfdz2sRBNS3LO0sQdaug2lMQzdzWF/1kUObiczJByuU4s0JbTn0UrdoH/puTM6u/EqAOsPl0oREV/rUk9I2q1GL8w+paHCpIG5LEXdKUPyp6SpXNLOOWjQp2Lrj9GAF0vkRYLmGhPOioQRRjrOwVh1+VdCF6emr/xAfqyRANhF6sqYMvKXwBSOEbsP8Wu2+GUMndyG9+Tj9naliBr9kGwmrAueRxma7ZOHF0FM10LpgVltW6JG3QuG9AXHVBWPzk/rKe5vLHxFDlcfHajj8LqVYUgsbiMt9jFRUiV+lIN9rv5W1/PZHDjTI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:17:45.8806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4f06f1-9373-4a3c-706e-08de72cd2bb2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031752_345152_DED4B965 
X-CRM114-Status: GOOD (  11.28  )
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



On 23/02/26 16:36, Krzysztof Kozlowski wrote:
> On 23/02/2026 11:46, Aksh Garg wrote:
>> Enable the PCIe Glue driver for Host and Endpoint mode of operation of
>> the Designware PCIe controller in the Texas Instruments AM65 SoC.
>>
>> Signed-off-by: Aksh Garg <a-garg7@ti.com>
>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> Why are you sending two separate patches one after another?
> 
> Best regards,
> Krzysztof

As both the patches does not depend on each other, can independently be
reviewed, and address different SoCs with different PCIe controllers, I
thought it would be better to send them as two separate patches.

