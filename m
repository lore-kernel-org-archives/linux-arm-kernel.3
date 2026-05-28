Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CF3CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARpKZrYXmTFsOnM7JxHpKmreJeHryubba/2L7K3DvVQ=; b=xCXu976+zsO1BQ3bnq9cGpplX8
	+VVYvb1NR+9MerCpt5kgW50R1isKd/dYv92PkaRejv3BGLQeIDRKidb51+PiY2fJc67lgTvaBEQPg
	IAoUapEje71wrBfX567mBt+m0SJOd89Quv2XddaZTt+yxuhVyQptiD0BlYjNyt6KG3e5/PkIsPblB
	0P9IH2EUv35ruh32oM8WCOeLJJRKLRPPIUWyX2PlWek0QgbhupXXNUP7ErjW9v7Ep3uKbG1A6acFm
	BSHiBm8i6HD4gJhoaGbma21LYbBhH9D7OE8YSjpUfJyGQFQGj8hV9nA4o2mLUmRhzo5f0FkaEWLsi
	XLU4dpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYLZ-00000005cC1-1mWz;
	Thu, 28 May 2026 10:52:17 +0000
Received: from mail-westus3azon11011024.outbound.protection.outlook.com ([40.107.208.24] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYLV-00000005cBT-3tI4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:52:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5eEuIgX0JPaf8W+S4lHC7MLAkJwRUh4bb73biEajKfvlWf7d+y2zU2xZRP+hcZqNgwEdli7DUB7hYEB2XDtW/6d9if0k3WlipVX9Hk3Ss/w+JW/f8+uLlz+5HRs5BeGietfpQqGSnfnlVH999JBlMErC4qCfIpq/AvpPpaf5r5zwKqB5qmAwYschI04+UPtzSSWB4VJpq9G8t9RJWNE2nSsmJc/HRzf4AkuYrHz0bRToFvgse4SPqGsvfyx1EghWaRHLh2D47/RVTWj3oG3+pY2k4cctrHCufOsPmUFCDzULkawlRSXNDCowKqg91wXUL98YqU7IvkIRFXBJFSTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARpKZrYXmTFsOnM7JxHpKmreJeHryubba/2L7K3DvVQ=;
 b=Njc34OY+564hnk6zDqZ6+ULgaU3wTDyboz+hhCacb33OiDd0F+Ha/fFRzWRhgbR2CR14T8dLVaFlYOC/TYMxf2iKcOqDB49PtXNKblO21jJOswxr1FXAiVwoo0JED9RsVGrGXvLM/J5aBNwgqMyqw5mrSsZE1JokGGCfJlA2HCEq2bJCpEgzVs7/ROgB0Ehxv7H6efZMl8aSA1WB/e/aKJ+85fk+3Yl7maoX5FcVWNlBJnPzgLnT/AnPgoaZBfxgSaEY3zm36c1WQzRU+EuVOSdbb+VQiCOgEA7Q47YE0YZ82S3x9mmfwv3XbpGn2gfBGDu4geiPBcHQFslwZPJf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARpKZrYXmTFsOnM7JxHpKmreJeHryubba/2L7K3DvVQ=;
 b=nyNhVKOm72Firtr8TQeJsnGDB0qLctgrc5EmTfQrRY6qlK1XbknOaXlTxYOxvDYtA/Gas2Rd8wp/ZoUxroHrLIM1LxBm1RFZpQzYr3sNblXh4keo2UEjnUMYcMZRiXWzFSUkn3eeTGMUVUZ1XdEP5+9S6ZkvIcTBTZXl9JSHCbg=
Received: from SA0PR11CA0114.namprd11.prod.outlook.com (2603:10b6:806:d1::29)
 by DM4PR10MB7403.namprd10.prod.outlook.com (2603:10b6:8:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 10:52:07 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::46) by SA0PR11CA0114.outlook.office365.com
 (2603:10b6:806:d1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 10:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 10:52:07 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 05:52:06 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 05:52:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 05:52:06 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64SAq1Jt1901707;
	Thu, 28 May 2026 05:52:02 -0500
Message-ID: <26a43b26-b7d4-4c5d-a286-4ac1869e2d42@ti.com>
Date: Thu, 28 May 2026 16:22:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
References: <20260526235417.1326187-1-jm@ti.com>
 <20260526235417.1326187-3-jm@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260526235417.1326187-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DM4PR10MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 9132ebc8-756c-4329-5c86-08debca72953
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|22082099003|18002099003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: lck/sJ5e7+WeVVA+H7SWCFphx7UzOA4Wqwomu4dglF46ULWyFEDwOBGLjw72OPMP4c4nMDha3yVdWbw76R4GdWpMbkTwekFUbWSbLtLVYJNVCyzeBWVDCT5Q0FDPgkW3gnGYRxMZW9CG6VAJcnb9NuwZME/0uaXYktQySw8Oj3TPlnK/KUuzOPmpJ4cGCysVHSXNViNNyk9e6Oc4E3ICk1x9FE0pThjAJZnMqsSGGRK5X9DvPai0GTLV8BOjI5Np5AdzvD+d1XnS1nz7pWjetkkCb2LEOyVFieLlr8shDQDfHRRKgvXbWnMZjqn2MaWc3XJ1sfxC8bTxCf/+rnXOjxlRtDwsQm9Dns0iPcwIBWZJ1FvAGmqupupOkUIs7yfmWcWH6rHh5fVcrfQi1v7/00AHgZ9aZ6Vt5hly5Ri59uULc045dfyXpOGdzbZBgbxRF9ar1+IhNVEVyqVljOx/kjt1hncQvo/ep1I80bkHq8wmtFn/VTPFG9VvGYg7iBA9WMo8N3vGJAHbTMDAvDJqEnFNtF0rTT/p9tKOaljQ0Hc/DowUJX65+qKIhNted5vKhjdliIM/Gu9khc4GxYJ6ce70LFg1G/x99od7s7luAE1svClszixADHUoqTaZUAUetuPVgJ5efHYNAYqn145/yiM+OBZmRnddY0roBzDWn3gsQ9Y4H+HFFCZSipTMGO34
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kyzPudUcjqH3kOg+/iatP6EECwAAL5s7KcYi82n1lvsVuIaAEDjxot6b0DKp3WJfHdlBOFAu7/g1Sf7NZxLDjkC1t5xjrgHWF6Ib4v9fucXA3iPI5X4FrQOtxmf4hVPra9ybYMxOw3+xRlGvFgj5Q3uDNLgdQIVROuz7rfEcAIiA3+nv5Whcui1+ZwM6Xq1ZdpW8pSbBavK/5iFeQSaf6idFLEUSqnjyG8BzwKx3+aB+794V0fEFgHFXS3oB6vULvMjt5jIqe9FxQn/w16PJ/4QbIuSLx5q3sB8jJpscLy/uw8SpJ7G/GC0YleTET1OcdHJt22GJC79bFxdZf5DfRfQGyrfNX7/q5RNONBeROIBdrLN+GyyGbpxDCROAe7vi6TkOG4cyYF5ImeXU/4YnNgchG1zzpzcqldosLJYpHfITX9GI6fwbsE5SFksE8121
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 10:52:07.1736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9132ebc8-756c-4329-5c86-08debca72953
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_035214_065912_9B3E8BCE 
X-CRM114-Status: GOOD (  14.41  )
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



On 27/05/26 05:24, Judith Mendez wrote:
> BeagleBoard.org BeagleBadge is a compact, affordable open source
> hardware single board computer based on the Texas Instruments AM62L3
> SoC designed for IoT and embedded applications with low power
> consumption. Expansion is provided over open standards based headers
> including QWIIC and GPIO interfaces.
> 
> https://www.beagleboard.org/boards/beaglebadge
> 
> Co-developed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changelog since v4:
> - Canonical URL fixed
> - Switch gpio -> gpios in voltage regulator nodes
> - Regulator-always-on removed in sensor_3v3
> - Add bootph-all on pinmux nodes
> - Fix gpio-line-names formatting
> - Nodes: sdhci2, wlan_en regulator, & pinmux removed
> - USB aliases removed
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am62l3-beaglebadge.dts     | 658 ++++++++++++++++++
>  2 files changed, 659 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 5269c9619b65c..4e377ca011cd8 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62d2-evm.dtb
>  
>  # Boards with AM62Lx SoCs
>  dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb

Sort this alphabetically please

>  
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> new file mode 100644
> index 0000000000000..8e816d21a586f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts
> @@ -0,0 +1,658 @@
> +// SPDX-License-Identifier: GPL-2.0

Dual license this like other files

// SPDX-License-Identifier: GPL-2.0-only or MIT

[...]

-- 
Regards
Vignesh
https://ti.com/opensource


