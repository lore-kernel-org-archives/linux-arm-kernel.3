Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349ABD3EE8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeePwCzK/dPdZ6+vRrt8I/+j/w5DSfZBVSMbTPS53gg=; b=LEUeKtnU7nJQRoBfchq+dPMoNO
	SPyTuMfejHuVbJUWw2p5rUgN6ku5XwqGzHxRam3y2hrF0sOYFR9Om0v37TbjVQY/UUMBkIsVELSHZ
	1QKC4hgLq4mlhCoWTbKk7OOKbObUXdEsOw2HEDurJkS+6d4eJfipfPSonoQbcVTASP70gq8gFDWG0
	hnZMMZ+7rrerPqYLzU2qMXT9KSZSLGJa5MiCReAFJKbjvccmxsvsq8kOzuxX09Y5dEgaRhjmz6/9X
	Sbvdu4VNSL2p5+oPZWQv8lqGOA1UN4BZ8iYj/qmFfL5asuKLjvYGyCzpZfaGgFqenK84CfpCd8eRo
	MaDTQUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixNT-00000007PFn-1HI9;
	Thu, 22 Jan 2026 16:17:47 +0000
Received: from mail-northcentralusazon11013068.outbound.protection.outlook.com ([40.107.201.68] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixNP-00000007PEA-3ygn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op4ttfDpILJtwuaNl9oqXFyigKMAFi2HMmuNAX76wYemTUSZh8I0mA4hW0nGVWN4W1TfgHqVj4DEbTsm1FEYyae9K/Us90lAcnIdJo2qBQcHofDXEZUwziwbd27KcCr7oQKAABZ7imF/Ze7A4AWcwlYq8VfYzciuJzPJFnjTRSjEQ6/OpN48zARpJhT/nm0MH0q9d5h3TebvnPTLy2v7XaWJnUIUB1/M1xuMxAKeWRvec/FZgKeRfWHeXSSuwOrro1qFMGVb5CjqOHxXqJ1cgfMZbfEexgyzDOE5siMQA7L5StGxRrIsgdU115fPcEX1cgS4BoOtInitLkjw+f87QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeePwCzK/dPdZ6+vRrt8I/+j/w5DSfZBVSMbTPS53gg=;
 b=DQnS3z1lbz1HpqWYU9KQ/sJdOWTg8+ZXu5hm+z5Nq75G35SEUSJnZtzpd55W0FsmGQnn4h73pJeqClWNRsTpxnLrCiae601SSp7MqlLRC8qENz8zmm9gmUHvfwtXg6zYNJeuyRcwj8PQ89SrvDCWRoANEM7qCE2n1N1OzqwTn2Ft55KGZwobwVOoBf4DSFczuqIxSpuX5bAS4CKiVYd/rYK0hIfT4wSz6NFJ7er/kmlPXjnHLxnqzS8JoZ6GL2proso8AxBo+LZFKdtaKxZibizs13yrl74CEavXUOz81prK1KLNy/BibOIzc5dDbB8cheiHNEf465DM3b2UuUYbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeePwCzK/dPdZ6+vRrt8I/+j/w5DSfZBVSMbTPS53gg=;
 b=O2pgEM5VqDU/T2WZqmvvZDrKtnzHAjJgD/U3frpTGYql/T+NaXwUdQhqvmwjwlbL1YyWXx9V68lTVfHENtM6Mw3AwINIzB/hLR3JysEMyC6czfNgJ0T44txD0Rx/AUotvmiBb/fNw4kalMXaWjak4UVtHxmwlzaorCLzO4Mhybs=
Received: from SJ0PR13CA0069.namprd13.prod.outlook.com (2603:10b6:a03:2c4::14)
 by PH5PR10MB997735.namprd10.prod.outlook.com (2603:10b6:510:34d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 16:17:38 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::bf) by SJ0PR13CA0069.outlook.office365.com
 (2603:10b6:a03:2c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 16:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:17:38 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 10:17:37 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 10:17:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 10:17:37 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MGHbhl702694;
	Thu, 22 Jan 2026 10:17:37 -0600
Message-ID: <1878d1e8-df99-445e-82d9-1a76c934fda1@ti.com>
Date: Thu, 22 Jan 2026 10:17:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: support cpufreq
From: Kendall Willis <k-willis@ti.com>
To: Dhruva Gole <d-gole@ti.com>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>, Viresh Kumar
	<viresh.kumar@linaro.org>
References: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
 <77b3b869-558f-4854-95b0-57980be28032@ti.com>
Content-Language: en-US
In-Reply-To: <77b3b869-558f-4854-95b0-57980be28032@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH5PR10MB997735:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c26640-eec6-4e00-db1d-08de59d1c2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RllQYktUOUFuUjBwSzd6YVU2dGlXTEFISkIyOU1KY29VTlZBclRPQnduYk9m?=
 =?utf-8?B?cjhHYVhuem1hdjZMM1Z2VXJpdU5ZMW5CN0lpeW1OU0RyeFlaeG9kS1JhMHl4?=
 =?utf-8?B?RzdsVjFoSlVZYyszOWlqdnArKzUzL2Zhb1dvdkpiY2cxMGxiUjBBbTRFZzR1?=
 =?utf-8?B?cys2eHQrSTA4aEk0V2FsdW5Pc3lUbmc5NllFc1c5cDFHR3hhZVhzeDhCSmY1?=
 =?utf-8?B?VlFZK1lTY2RBMSs2aytldS9tSzNCSnhrTUl2WUpGQVZESUpiTmVUOXE3VHZ6?=
 =?utf-8?B?S0RtSFRlZFhOUElGNDNlUVNWMDRXNHV3Mmp0TnI4MjJkTVZ2UjZWaVF2V2Nt?=
 =?utf-8?B?WmJXRXRNN255NTY5dkV5czRsOHQ1T0lwV3F5QmUrK0MvVlFwOXNCdmxHdEJs?=
 =?utf-8?B?QmZkMW9PZ3lRM2EyYlN5OEt0eEE3cGtMZ3NPUkNNNzByZldwS25uaVQ5NGpi?=
 =?utf-8?B?QUhJajV1YXFERVZTR3ZGNTdId1JNdnZySGtpT25vK2N0NEhPYmcvNHRicGlQ?=
 =?utf-8?B?dzlVM2FOeVdnZUp6VitTN3EyaFRsUWQwSHVvVTk5cDcvNW4zL2lWTUNlbW9V?=
 =?utf-8?B?amtmTHRsSzB2SmI1b09SOVV1N3VzL0I0ekpBYk44K2tPNkhHZ1RYeDFXNDhO?=
 =?utf-8?B?ZjA3ZXppQjV1L0d0S0U3THNmVVdpamIyeEhGTXAxc1owZld4RG94eld3VnZt?=
 =?utf-8?B?emxHQkVQa29scTF6c0hZUHJIVkJQekNwT2VIQUVaV3JjcEUwdGlVc2xldjFV?=
 =?utf-8?B?UFlXdTBuUUVtV0VjdVFjZWFlSTY1ZU1qUFpzTXMvdzlqbzBMNnlvOFI3bTM4?=
 =?utf-8?B?eFoyOTQ4Tm5DTUl3MHlrbGR3dXczZVhGRW1ZcTBUT0FMb3kyWG5TcVNoalBt?=
 =?utf-8?B?RkVXZFZKYlhjRGkyVE83VHU3c0N4bWFFSkpwY1lhMmllVTlka0VQeHRRUmxT?=
 =?utf-8?B?dy80bmdhaUEzMDlwd3NqZVBpNjg1NHNlM1B4TW9seE9XYWgwT0F5d2NRSHNl?=
 =?utf-8?B?MGptTWg4dUE3SDE1eHN6SzNnOUpKa1hMeFFHOGFyUDVIN3h6Z3JjQ09JSGVk?=
 =?utf-8?B?dEFDMFlYc1VZRVZWYXg5MkJ1VWJxSFkxYVE3dW5zMm9Na2g3QU5iT2lXTVRV?=
 =?utf-8?B?SGh2eWZDYy9BekNUM2RsOTRONzZqdmhGZFZoR09PVXMrR0t1RjZYaUlFSWoz?=
 =?utf-8?B?MGdvNlkwdlNGWDJuYkt1Tmd1VFpDdVhjc0o1dlFQaFFJUEt4VjVLYko0RG1M?=
 =?utf-8?B?MGFWQkRSL0ZGcU8zRm9mR2I5ZHNNNDBCNVM4amE0dy93TVFCU0sycEUrWHg5?=
 =?utf-8?B?WkFoZVllRkdTQjlhVUJySlVKUXQxcVlYNW5oRnczamtJLytjNEFiaFB5NTcw?=
 =?utf-8?B?UGJDaWltalpBcDJ4VldDTVl1a25kUXNHcUh2OG8wUWFSd2ZrckZTZjhxYXR0?=
 =?utf-8?B?WFdQbWYwQkJ4MlRSWHIzMmt3OXdDa0JtSmxpZUdOZWZPckNUQjd4SitXeThP?=
 =?utf-8?B?S2kvS1BhcHcrL0tRYUhEK1BjWVRTNExWL2ZFelVtTzBVWkk2ZHFpRHNLcHd0?=
 =?utf-8?B?UUJwOXREd0hjM3ZMU0hOZXQzNzVXa2FRcVJ1OHM2Q0ludVV0QnFTVzUrMWwv?=
 =?utf-8?B?QW5oZ2hHenB4ODRyNGVZWGUzazhGNHBKYkM4VGp3MkcyRDM2clNva2dNS0Mw?=
 =?utf-8?B?Ukc3Q2RoOHpOeXRsVmJKS1RaSURBamEzdVdncGpOcDdqTXRPRkYxOTc0K21i?=
 =?utf-8?B?cXpnTzAxU0xvWTlueXErR0xSSDNaWmMzVXVRL0pSOWdtbjY5cXBnQ1k1bFZt?=
 =?utf-8?B?Zlg3clNSSWlpbWw2M0ZlR1M3cGRSaXhZV2Z6WXc3TzRIclpnYUtRRzU1Tzkv?=
 =?utf-8?B?V0hHdTBxOHJRc2RCYTREd29yNEcwbVU0UnNRNXJMNnl0TS9CeVRZb2JQTFRn?=
 =?utf-8?B?SjNraTh0bHdaQm5YOTd0MFNwMmtJNXB6NHJSTGErVEVrNnR6RW82QVVRM05U?=
 =?utf-8?B?YjU1THlrZTFRNFE0M0JYNVNiaHBYbGpDY2xBbm1ZYTA5ZE1ZVjV6OXFEdHF6?=
 =?utf-8?B?VFJSV1UvdEthUGcxVnZuZWx4TG53dnlwNXY3ZGt3cHNRZExIQjh0Z083NlRD?=
 =?utf-8?B?Q1NsKysxY2xONGpaTXJIWXkxdzh3NGcwbGxKWVNQVCsxTWR6cVY2djg0RnZ4?=
 =?utf-8?B?aDh5ZzlWbHRPZnBTNjZpUmhRdCtqOEgyYXAyWTJmVTJ4SVNwSjFpWGFPcW1n?=
 =?utf-8?B?MjVxekhuTE8zR0lWTndYYksxR0NRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:17:38.2370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c26640-eec6-4e00-db1d-08de59d1c2c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_081743_992002_5507B912 
X-CRM114-Status: UNSURE (   8.42  )
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

On 1/22/26 10:14, Kendall Willis wrote:
> On 1/22/26 04:49, Dhruva Gole wrote:
>> Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse 
>> table
>> syscon to k3-am62l-wakeup.dtsi for speed grade detection.
>>
>> Add the operating-points-v2 table with CPU frequency steps from 200MHz to
>> 1.25GHz to k3-am62l3.dtsi
>>
>> Configure CPU clocks to reference the SCMI clock controller for frequency
>> scaling
>>
>> This enables proper CPU frequency scaling capabilities for the AM62L SoC
>> using the ARM SCMI protocol to interact with the power management 
>> firmware.
>>
>> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> 
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> 
> Best,
> Kendall Willis <k-willis@ti.com>

Oops sent my reviewed by on the wrong revision.

Best,
Kendall Willis

