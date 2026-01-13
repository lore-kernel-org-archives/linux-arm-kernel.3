Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F60CF45D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 00:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+YSsskUSCSkNgixQf36GBvSiojfqlShzYpzLFsn79Y=; b=kdVMpNWOxd0iKacLg0kILnBLMs
	0K0ukMIgb9CEZ7+6PY+KeC8Zf71AYH8DPgJ6oCHw49la2jbGIeJ9Pu66YH6FOqUKfNwx5XoayNIqM
	oXn65/VznacBqYCbglAIU1dWnoek0oQR3dqbW7njlz9wWxHqi4NbDU/4ADoX/rTdFyjI7rqzMWLs1
	cmRQ43D2UCfegXtn7Hb4ponSQvtJLYCVGG0Hy+GHsZ3A9Qvpj2z5ZxaYWPtkW8umE4cDoEcD8q2pw
	o0nhOjWbr+9G4GhRKiBs3pX2xPOVi+Vp1xxgMNywM+Ef9ynaqh25S+0ZCG6IYdhrzV/y7xbdQxtBX
	Ji4bYTRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfSIP-00000006LfV-2DAC;
	Tue, 13 Jan 2026 00:30:05 +0000
Received: from mail-southcentralusazhn15011020.outbound.protection.outlook.com ([52.102.140.20] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfSIM-00000006Lf0-3i9W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 00:30:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmC+wn2RrdQM6r1zshsT+MCQ31NqEZHC/XqvGVD0vV5O6Zx9Wz/0F8kzHNFB4eiKoXGODtmqBahNQfEhg18qRqMGAdAJT9F/N0lwNJlKVIhvRFiNMaK5ZCqFK9xXo7uApe7x+HjzuamJ4Z3RfIIzTOEiKbNqhBmfaUTdiORYoh/GWe+SXFuJez4QG5GGpJvEpuQld1vT1DT/3Yg+I3Dmc7V/JMDXzSSlJJcAnDnK3p+492atDI3hFCN4daLR+x2K5FTHxyfvj+7bIUeF957KkYbb6vqL/Mc63l9+zCKDfBDHQdQ6n1YhMiU3IbHgIl9XRgXYQhEp+cNovJ6228XFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+YSsskUSCSkNgixQf36GBvSiojfqlShzYpzLFsn79Y=;
 b=HfEqoCdyKWCdwf351Opqc3M46CTe4+V6/N/1X015RH6SWilvj0FWvGi1OXpHLIuplXjuDMG0dNuRVZxFhKNHvxge2V1Wn7wwWsNwr2gRIOUcqXxSxerBhq/Jc7/yJIPb6VjK5CPXiNwtKs7k1bMcz9obXqQj9RGFS4zeq9K/jbsqAWjjtZkZyyx0ae5bLYcTT6EQjq5JiDJlJgl1ZJE5GtMGQlJhiseXlUZ4VkKSOfz9xgW3iJ0UenFi7zggNQ27zYLxweFYEYV6mFfFtQtzl+qJ1D9UxP32zyHQh14O1kt0MckVnIEeXV4KdtRuO6BWppWVP859MptUga66a/F4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+YSsskUSCSkNgixQf36GBvSiojfqlShzYpzLFsn79Y=;
 b=O8jNKH5NqD64J3oJHPGkGnzrqLpXfWy6klTame6Fs87en7pHjYFVq/f5GpeMJJYcOgD5agrAs8oLlJQ2k5GTo7yL9zld0YnZsVVHPHksU6GFlPFw+Zwo3O3NIO31tftOOtMBfuLBoAb+F3c4uisw95TyZSwd96W2qE8CpJvY1XQ=
Received: from BN9PR03CA0398.namprd03.prod.outlook.com (2603:10b6:408:111::13)
 by CH0PR10MB4971.namprd10.prod.outlook.com (2603:10b6:610:c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Tue, 13 Jan
 2026 00:29:56 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:111:cafe::26) by BN9PR03CA0398.outlook.office365.com
 (2603:10b6:408:111::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 00:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Tue, 13 Jan 2026 00:29:55 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 18:29:54 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 18:29:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 18:29:54 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60D0TseS1367042;
	Mon, 12 Jan 2026 18:29:54 -0600
Message-ID: <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
Date: Mon, 12 Jan 2026 18:29:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Sverdlin
	<alexander.sverdlin@gmail.com>
CC: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
	Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|CH0PR10MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ff3681-0657-4077-415d-08de523ae027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|34020700016|82310400026|7416014|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW5YYzFkVE14RDM5YndLMlcySGp2ZVk4djlza0FRbHNleFR0dzU1TVBSanIw?=
 =?utf-8?B?R3dyRUhwUmtIOURxUTNYVDVzem4zNWZmNjM1bjZhU0MzOHBJTlBwcTMveC80?=
 =?utf-8?B?NWhvbzlOanI2aDdkc3RYWk40eWt1d1hLSzM1TGtVclRTMXMwcmhKeURwQ29D?=
 =?utf-8?B?cnR5VGpZOURnVjRMWndGNTcrRk05SzJ2VTFYWDFrMll6ZldTMnRTVkpCYjgr?=
 =?utf-8?B?eWtnRCs0SDRlTGxacmpCTW1HZzBTaUdyS1NSZEVuOTlOR1ZKZmlvUkwyeXZ0?=
 =?utf-8?B?VDJtaTRIMXpwWnJ5MmM3NG9SSXZhcnJCNnRTd3BhdmxBb2VPYUJEcGQyOWJQ?=
 =?utf-8?B?S0g4OHJtQ2hKNmZaV3AwTGRlU3R5SzExS1F2cWJGa1dNRUl5dDkwakxDamhM?=
 =?utf-8?B?Z2UzdWxSS29LU3NMRkdra01yUlZzMWZFQXFQT0gzeXEvZ0hHQkZ6a3hndzA2?=
 =?utf-8?B?eDY0ZWYxVFRzLzFFUTdUdUFzNDZqbTNVTE8zbXlBUG0vT21tMXlnR05oSlU0?=
 =?utf-8?B?NFI0OS9ld3h5SW01UERjZldEb3dkWTJtTGQzc0w5ZmJjY0k0RnpnQVpmdVZs?=
 =?utf-8?B?OHUvS0lQSmRkZktOd0VkQk1PYjk2K1RPY3VFaHRVb2hyTWl1OGJXcmlVdkdH?=
 =?utf-8?B?VWtqVE1abGdhenJKZ0tsb0o2alU4SFNjVS9CZUJQdFlwc005cGRoNWkrZ1Q4?=
 =?utf-8?B?TTZNMVhHY1RYNUtpVmNzZ3dUQy9xM2pVTHlicmhjbzZBWjlaZ1dRVVRWTC8z?=
 =?utf-8?B?VUI2OVVFL0pralJaVVFSak1MbHhTRk5OaXhmc21VbHE5L05wdW1GakpWMzY0?=
 =?utf-8?B?S2cyeXBETjU4eGQyRlBJa2RKL1FpL2xZT3lUVFZ4ZkVBQWZUZFBNT1JRWlBV?=
 =?utf-8?B?Q1MzR01iaVJ3VXo5bXo3UXVoc0NaUCt3MU44dDk0R3plTXlZVDVQSldoQUwx?=
 =?utf-8?B?UGFteDRVWkQvWk1xMjc5aVQ2UjR6anJVOTJDd2lmNW10L1Eva2tyN045SnBW?=
 =?utf-8?B?bGwxT00rMXZYM0RQdTU2RXlKRUtkUG84bmJyTGtuUHhPTVYzNDVLVUIrNHJv?=
 =?utf-8?B?K2o2QnZnWFNkZmN4WjdpQ2FqOWlwazBTd1RvVURYU1Q3N21aRy9OaTR6cUFK?=
 =?utf-8?B?ZlFWbW1yNDZkUDk1UHUwR3hyckRLb09Qa0lZcWNoanZGbHQ2VWdrbk9neXZx?=
 =?utf-8?B?VEJTY0dPN25GamVnandzdkdMRnpQdkFEYmZ0d3A3MkplRmphdjc5ZitLMTlj?=
 =?utf-8?B?VVZIV1o4aXpad0pjS0VSaXkrTEV5NDJ2anI0dUFpNWVKL2FWL2JqZFcxR0w4?=
 =?utf-8?B?SWl3NXMza3BiZUZKdFd6YUVDYWVRQVFkbS9oN0FaVGVYS1NMMFJPUlc0ejd3?=
 =?utf-8?B?QmRVM2VtaTduOW54eFJ3RnlzV3JXY2VLdmlNay9HLzFINDl2S1R0NzZ5RUJH?=
 =?utf-8?B?WXJZTUtnWHNBeXAzZmJRL3FDdi80eHBjL3JScEszNUJTa1lXMXpYREpOMlpB?=
 =?utf-8?B?U3I5eHRIU1lzb2xmZkFKNmtvQndnN1AvNDBUd3h2TDhRN1FPWDhWR3BjNDVk?=
 =?utf-8?B?dEtoc1oyQlJPQXJjUVZWU1RudTRINlVjSEx1a2ErSmw2SXBBbmVEYzQyUms1?=
 =?utf-8?B?bjdpMkVHWWVQd2FISWoxWm5oZm04QXYvZEhucHY5U0xoeCtLdzltTmlpeW1G?=
 =?utf-8?B?T0FqV3NRQzg3c3lRNTE1RVRVMVdQWUN3ZEhQVUVzdEdFV0M1ZHJKMko5UDFZ?=
 =?utf-8?B?alR1M09NWC83d0gyNXk0Z1FpQ0YwZk9ySUV3ajEyd3lWeG1WaGZ0K3B6dDFr?=
 =?utf-8?B?QUFoTUxERGI2cDFhdE12a0x3Rk9BK084YWkvbmxqTUhuM1hkSlViOW50dndK?=
 =?utf-8?B?Z1N5bXYvU3JGaXlUU2xPNml2azZCSUkvRjRHazJhcTFWNVI0TWFsQXdsRDln?=
 =?utf-8?B?cm1zN2FQbEpwVGhKVnNhQjY3NEcybEtUamZ1UUJ6a1Vnd1d0ZGdWNkNBbU5i?=
 =?utf-8?B?bFpFZUNZK21ObFJRWGJPWm1Vc2ZxYXhLaEJRaWRTdnE2bE0rb3V6L052ekxQ?=
 =?utf-8?B?M3Z1YkVuMTFLTk9ZRjQ2N0E4QWJiTXhJM1JlUkVMZ29rbXYzZEhISEl5aEVK?=
 =?utf-8?Q?NlLA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(34020700016)(82310400026)(7416014)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 00:29:55.4216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ff3681-0657-4077-415d-08de523ae027
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_163003_048325_44201402 
X-CRM114-Status: GOOD (  13.16  )
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

On 1/6/26 10:22 AM, Markus Schneider-Pargmann (TI.com) wrote:
> Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
> u-boot SPL is not able to read u-boot from mmc:
> 
>      Trying to boot from MMC2
>      Error reading cluster
>      spl_load_image_fat: error reading image u-boot.img, err - -22
>      Error: -22
>      SPL: Unsupported Boot Device!
>      SPL: failed to boot from all boot devices
>      ### ERROR ### Please RESET the board ###
> 
> I bisected this issue between u-boot v2025.10 and v2026.01 and found the
> devicetree merge to be the problem. At a closer look I found the
> k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SPL
> failure to read from mmc.

I have tested 4 AM62A SK boards and I cannot replicate the issue
you are seeing. I do not see an issue with Schmitt Trigger in U-boot
nor Linux /:

Can you please run a quick tap sweep on MMC1 and MMC0 interfaces like
so? https://gist.github.com/jmenti/f4a73a8323e44bf717c6d2c528c499ca

This will give me an idea if whether we should be talking about
revisiting characterization with ST_ENA=1.

Also, are you able to replicate the issue on more than one board? Or is
this the only board you see the issue on?

~ Judith

