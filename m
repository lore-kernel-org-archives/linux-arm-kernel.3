Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9BDC2A074
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fea+kQGkvvXPIv49NDxKAAnZ1Rg/TYrLnMgNtwsPdXE=; b=4VPZVVMqCJ0ulQWYVuBA3308KR
	DQiftmPBiu5aG8PxojuXCqZpTPplgMbECUCyfPBqgXmzvRyvUEIWxVutNQ9qnas1Futf0HS8gvwI5
	FKkQ9QOBriNQDMHnoE5c6393MKDBoPiH315CsX/7jh6wklmo/pqI7hZm/qM83uW6AKW2JTOSwmqTs
	29NDQWUxAGL1UFIFqbORIfS1c86C6g7Ok7TtODimWCBSmBSHu1IV5y4JsC+BysbFstK4NmV/XJ461
	WKOIilyyjg2lOO46LUWQSdu2BCN5VhVkpsSoO+2ayhVozPTnjPBlUDxYV51qHKtaAwSWTamFFQt8N
	Qm5IzVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMZR-0000000ACdT-1kBx;
	Sun, 04 Jan 2026 11:46:53 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMZO-0000000ACcz-1bTR;
	Sun, 04 Jan 2026 11:46:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYzv3SADKEWc/vTYrEJpHn/u2TKLIG7l0ehBel73SPbtYzHETHCcVjuoMj7h7EuC9k3GwogteVdEOCqt8h/vZHMsw6sCgIdSVTWSbkW8qpqIW6ZZYWfzwtg3DUR82pBG+5m0g9DbY87tJgY4LKA78M4O1GnaDMjJle6H/nb5B1s/A8kjOQKQH5BVbY91lEDfrVBi4OYISbWbatcbLMQKjxdAUw98zGFxVUfbXllepSTUwaOA4uJ7GDc1nFgPlkjb8iQAx8rpClyiG8IJq74F5rDGUDXf8w1RHlNyvtHm+tz7CpFEkpKQgl/Uya/4I+mCo6S4b8jadbkmekT2GGQ/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fea+kQGkvvXPIv49NDxKAAnZ1Rg/TYrLnMgNtwsPdXE=;
 b=ybnybQXGJV53WN7F21OEWWrZOWZMFUZF3jmKZgokR9TH17q7KGrrHictN1PlI8V7Z1ZZ6XmUJGoysaPrBUhFZYTlt+8K7V9LJln2Gtc1LMS2ZfTTcuDEf3CW8qUFHfPUsIXU3yq4s1/xouHVVFNk0zx1irWkYDpL9ntbLVczJz4YLU1aR6FgxmLce6XNptWYF5wiOHZGpG9PzeveUeaSIE8FT0qTX8/qSUPcP4xIMths9c6JGBV7iBGwkbLZJTiBVFnG8/UekZGrnKti/C0c+1dtMecm+4lveL7FWe0X1nBapqC/iXwEw2VFPGb8lZ4a+ThZ8oOrPBAabTOHS4L4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fea+kQGkvvXPIv49NDxKAAnZ1Rg/TYrLnMgNtwsPdXE=;
 b=ciHXd6JPbkQTSMOeYRpiptKp+kjNNnpEVLb8Qb+KPUlo9CvpHYrnqIWgf60SBuLtOtXM+hop6U6GX8K8HiamzPJmotJQ/YtI6KeyOzOMwZX42uaDeM0/yVMATSZ/w9DoJuRhiL56pp2h3nzoSnSabzpiqo2uHdnIDNSSxqNxglg=
Received: from BY5PR04CA0026.namprd04.prod.outlook.com (2603:10b6:a03:1d0::36)
 by BN0PR10MB4917.namprd10.prod.outlook.com (2603:10b6:408:116::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 11:46:46 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::fc) by BY5PR04CA0026.outlook.office365.com
 (2603:10b6:a03:1d0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 11:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sun, 4 Jan 2026 11:46:45 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:46:43 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:46:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 4 Jan 2026 05:46:43 -0600
Received: from [10.249.139.123] ([10.249.139.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 604BkbYI3541868;
	Sun, 4 Jan 2026 05:46:38 -0600
Message-ID: <34f809e1-4a39-4c8c-bc63-3f66d1ef355b@ti.com>
Date: Sun, 4 Jan 2026 17:16:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add PHY_TYPE_XAUI definition
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
References: <20251224054905.763399-1-s-vadapalli@ti.com>
 <20251224054905.763399-2-s-vadapalli@ti.com>
 <20251227-airborne-energetic-kingfisher-adc4fb@quoll>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20251227-airborne-energetic-kingfisher-adc4fb@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|BN0PR10MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 780a457c-1eae-4f8e-7a6e-08de4b86f008
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjFvbTNPaVlEbEppbS9QQVovdjg3V0tkQ2pBK0hraVdlR3UvNWt2ZVRteW5M?=
 =?utf-8?B?NzkzWkxza3k1Y2dOQ1VZQzVDK3dsUStXUGVNS0IxM2FuTXJic0xBRjF5ZE1v?=
 =?utf-8?B?bTRYZGRneUdYa1dWQ1IrNlQrRUFjY0pEUms4QUtKVGZpTVNqa0h3RXRpNGZU?=
 =?utf-8?B?L3JUUjdFZnFwUkZtVUt1Z0VzTDJ0TUZlMEcwNndpZU9sTlFoY1NCK3IxM1R2?=
 =?utf-8?B?emU2LzBrN0xUTTBaOG1XN1lpRzdWbTU3d2tnZzJEZkZtemRYZkp2ZE5uMFEx?=
 =?utf-8?B?aUFGRndzakNvT3BBUlpXSW03QTdXc1ZNVkFkZ2J2NEs5YmYvZ2RETjVpc1hS?=
 =?utf-8?B?dGM5WWFqdlpDKzFVQ1ZoTzFWVTFqYWN4aWlUTUJyLzl3cGxLMXBBRE9KcnRj?=
 =?utf-8?B?cUVJL0tYeHFhQ09XOVNaa2ZUMFo2cUdrb2ZqVTJqRGJhWWxKSmN1SlBpZGNM?=
 =?utf-8?B?Wmd4andUelkzYnJaYWc2djVJL0RidVhRemRrQ3Y2di9DYWVYU2kwQjZJV01a?=
 =?utf-8?B?aks2bHRkTTJzUkp6SzhGelNZTEcwNnVOMjYwc0RqcTR6bmlXU0tBcm52ZU1s?=
 =?utf-8?B?SlRIaHNDNHpaR2kwZGtBTDNFVjFMMFJyNUU0VG1oVWx5NGJnMFB0MGNMY0lq?=
 =?utf-8?B?L1VTUGdQamUrREZ4M3N3bXNzaDgyZ3ZuRHpvS3VCRGt4Y2lNWUhiTjE0aUtJ?=
 =?utf-8?B?eHlNT01PMzE0ZkQycjhxcUJxMjRNWU9KcUtSNEZYZzBPcThlRG1xRi9Vcm5w?=
 =?utf-8?B?RG5LSlBGc2Q3aUF0cW9qa0xaUHJsYTdON1JsbGJtTnljL0RzcE8zTWZ5K2hw?=
 =?utf-8?B?WHRtTklVamcyNUxwd3Z1S0FTbVBVbFprTHl0V1puOUNOcC9EY3R3azZ6ckky?=
 =?utf-8?B?TmNWVkFzVzlQSzRic0pMbExWV2gwT2FJMjVJTGJWeWVCWklTanBkY1V6VEx1?=
 =?utf-8?B?MU5LRHlNbmw0VG1GbFpTYlA0WXZyQW1MVFBuQW1SNU9vdGlmYXF5dUtBRUM3?=
 =?utf-8?B?VkM4TlZzVnc2Umk3dWFub3lTbHlCSFd2dmxRQlIxUHFWRDVRMVpOZkJvSmQz?=
 =?utf-8?B?dzNLVDBaVVNyeVpLaGVkbDZuMWx3TUpXQVVWM1NlcUVCdHlwK1hHVUorZTc4?=
 =?utf-8?B?T0QwOEFPemFtNmFDLzVOVW9FWHVmbzhOaHNkTlFjUkthTWhnSUdUYUVrRXho?=
 =?utf-8?B?blRmbVdsUmF5QmNrcm1wTFVydHRBK0dqZEh0Q3dQUkNERVdFbkYzMkhjTkRp?=
 =?utf-8?B?TlcxN1dPWlM2aVV0OGU4Zk5UZWZRTE4zYWNZUm9mTlh4RklrdU9WdzdCQmtV?=
 =?utf-8?B?bFdSbjhmejBENWxzYU9rVURoVDhpWkZXOG41alNPdzlDWUlLbnIwUUxaWWVG?=
 =?utf-8?B?azF0a0lwd3YyeUpNWnRya1l5eUwwRU5hdDE0aFdSbEtTQml1eXhZZkFhOVVP?=
 =?utf-8?B?SDMwSFVxOFRhdVJPYm5YaVg1Ukx3NytZSzFkbEN4VzhaaHZ3RzJqa3k2WHFn?=
 =?utf-8?B?U0dGZ3RyKzVydHNJYTJ0YjlET3NNS1pmMTFtQ3V1RVZoSlV6ZmNram9uMGhh?=
 =?utf-8?B?NVdyRmNGR1p3eVRidGQ0anQrZmEvTmtpcWFCdjFROE5UUDViV0lyZmxVQjQz?=
 =?utf-8?B?ZDkyQ1NibWg2VTFacElUcHpTTWgyUThoOXUvK2dudlhtRmIzQ0dyVktkMUpI?=
 =?utf-8?B?K2I4K2FRSVhmVm9ZbldyVXVqK1B5K1ZtTFkzcEQ3bkNtUE1tZ1hwdlFQMmp2?=
 =?utf-8?B?SXExUjNybTVmenJ4a3d6aXVDbmp4Y0hCZzlXTFpLODU0V3NiaWxORElCR1dL?=
 =?utf-8?B?eHFscTlsaXB1UHZtRlBDZldkVWhsUTY0Tk5GWDQ4bC9KSnBoQXBXRXdtSFVn?=
 =?utf-8?B?bHdRNzV4UEZFT3gxZ2JRQ2p5b2R3bHdJNi9xbTZ5TUl3ZUVCaitxdlhNc2dt?=
 =?utf-8?B?SUIzNTQxYVpsTUwvNWNaclc5RmNiVjROR0pTZnFGQmgyTkFlekdOK2J5N01T?=
 =?utf-8?B?aGQzTHhSSGhDeW05d0M4bzRSWVhtZXJ1QXNIV1FMcmkya1FXLzNZSGtWZ1Yx?=
 =?utf-8?B?N1lkRnBrMGNrVCtTdDkyakVQdnBjRjBRNFBXRGR5RnpuVHhaNDZGdHNkY2g1?=
 =?utf-8?Q?9LvY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 11:46:45.6567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780a457c-1eae-4f8e-7a6e-08de4b86f008
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4917
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_034650_455985_ABD8CF38 
X-CRM114-Status: GOOD (  10.63  )
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

On 27/12/25 6:33 PM, Krzysztof Kozlowski wrote:
> On Wed, Dec 24, 2025 at 11:18:58AM +0530, Siddharth Vadapalli wrote:
>> From: Swapnil Jakhade <sjakhade@cadence.com>
>>
>> Add definition for XAUI phy type.
> 
> What is XAUI?
> 
> Your commit msg duplicates subject and is obvious - repeats what is
> in the diff. Pretty pointless.

I have posted the v2 series at:
https://lore.kernel.org/r/20260104114422.2868321-1-s-vadapalli@ti.com/
providing a detailed description of XAUI in the commit message.

Thank you for the feedback.

Regards,
Siddharth.

