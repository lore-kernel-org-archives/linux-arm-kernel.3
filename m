Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8DAE7491A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gH8LmJoteiaUZxJqoEwUuE4+1g3h/SxdE5LVkkwvZHs=; b=nBGil7eUuKlgkWK6Qb+QCvOkEE
	tGMvhzc9PfnAFqNFmZIJyz+fvYY3O3ErstrCb+M4Wd5BWv8yxX4F2SeqNAM2bT7WCNYelWxx1Cjkg
	D2X2FvCBNzrymt0rBVzvFRr4mo3B0c7KMYZel+4afEPZbripQK/wtf49DkXJ0Wq8EOWbEWgQDJ0Oy
	5wzvsstlxLywM+i9NL58msVwHYri0B4hk8PWbbf/eeC0cHfdeIYjCheLij/oZjYD1CVZhXsObWV9K
	dmApmAfhAQEvK0E5csrMKmasAB3n/EqInk6qDbb6MSxKzmeB8xPGbejWuJOXrKR0JXrCoRuxbnNuv
	I9coBNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHjd-0000000GSZv-3WpP;
	Wed, 24 Dec 2025 05:48:33 +0000
Received: from mail-northcentralusazon11010036.outbound.protection.outlook.com ([52.101.193.36] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHja-0000000GSZC-33gA;
	Wed, 24 Dec 2025 05:48:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yCqXd0G3L/jodQ8MynkRloTwGqmgE92JONgGM2L3FuBntegCmoQDYCbWPBvqviv7NxNfW8dL8ArZvgPsnVRzz4K1fyVYr1EJN3BTQRmKIJZSG7MyGoAZzLV9JBV3UtOwCgkDXwhIwKO4pD+HE+rbKYHW5P0YuRIzZ0iQZOwVbWiInUPvZOKBFIfpvSYXWLklPpvWUgjrvUUtc5YDHII51Pn8p6KEJBLbs8w96v7qWLTOf84KPvy9Ki3eJhE8b0C9jvyvxa+jFouCwu6uOjgvW/yF9HV7saNEYc3cPXTXfoJOadjjMbiw/+IGuTIOFJP8vEW6sZijquD6rjct1PK4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH8LmJoteiaUZxJqoEwUuE4+1g3h/SxdE5LVkkwvZHs=;
 b=VL/nFVJznZ6BpywU4DUzk8M0n2oDicwZTlItWZ8xZ1wJwTFYjGvcw2OYx/4UuoioYnqPPfis9mYPn8LkjR3sRf+J7XKjwZ9Ww3zyZ7DCB6meph7kgYbzM0G6yuZts5oVfW7RZHgRFtcH34Za8aurtuWlQ7y0M10JpInlz9mvgDazTpsm7ZIQI66IGnOVFW0BQ9eJomU7iDDT9ToxnloWOtF/YtY/lGFDqRSAAQd59FB2U1RCYq9y4B4/jhVvQ5h62Oj1lAf9XBgSkvdbtBbnxlM2Rx3E+mZJFTV+JoetLnoBBV62TJxzWE+ZdoGQ74xrq4yVjp7JtK955CDRwPalBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH8LmJoteiaUZxJqoEwUuE4+1g3h/SxdE5LVkkwvZHs=;
 b=cTI2gmIaaBTzGw616G+42zK2PHRyGG6q3V5TbHJosKwe8dCkCDD3XYwYRVcTUBKlO1BJWsrjhN/2mQciC1ZRJNVMt75yn+Cpc62/uHuOjKeoW1mkXw039gTO9U/sEa6R+mtHyJsxi/cxt04P/84WtX1B4s4RkWiydqwCzmEvu5k=
Received: from CH5P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::26)
 by DS7PR10MB5902.namprd10.prod.outlook.com (2603:10b6:8:86::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.11; Wed, 24 Dec 2025 05:48:25 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::81) by CH5P221CA0019.outlook.office365.com
 (2603:10b6:610:1f2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 05:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 05:48:24 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 23:48:19 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 23:48:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 23:48:19 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BO5mFtC079101;
	Tue, 23 Dec 2025 23:48:15 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 0/2] Cadence: Torrent: Enable PCIe + XAUI multilink configuration
Date: Wed, 24 Dec 2025 11:18:57 +0530
Message-ID: <20251224054905.763399-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DS7PR10MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcc8e44-0ead-4eb8-2639-08de42b00d83
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qJ2BCxk0ykhOS1fi1yOyB8bL+ST8WHcBsTNZwF0uODUs5WUyj722bHLuBGKu?=
 =?us-ascii?Q?8TzrTP3w4Ah8BAsHNB6tgdIJDquBekoEJqVVLGRQ/PCENutB8m+2XxulhQVy?=
 =?us-ascii?Q?sVS6rMRmbdLRri9pYm/AX9kkupwP1Kxuc0GqnvrWKm/tdgntF/J7ECMBCGWb?=
 =?us-ascii?Q?bEO0+rY+HDCqZMBP0p2hapf9fI90YUuM/tXyhVz9tMK6cNpGKSG+TKgVXX4x?=
 =?us-ascii?Q?JR+6FSKXtWEJyfD0sjlJ7snsEjJeOjvckjGnYo9S8hhgyIMERrZZl8yaU692?=
 =?us-ascii?Q?3W2QoUhair7NnRpACR+I66L4zGMvS8i/cuRyjwEmtMeusXM1hJiKw2B8tOff?=
 =?us-ascii?Q?zqaa9O6JHL/xfEXMC1PiFKg207YSS97LS0yJv2MEaMXoBVp9hjH0tM/j3kfj?=
 =?us-ascii?Q?cbQNBGecPIaYW8FuFKwtJ0NNqUe+UI+uL4dN6RtOA32Mj8aloEEGz3Vu+APp?=
 =?us-ascii?Q?r34jdzkQqknHVJ9oMZq7uBJqfaKLyMFkOM4pWe9XE09pIOV2Njikqyj2ySAx?=
 =?us-ascii?Q?Sou35tC04dArdIUuYfJWgc0oT7dw5GBLMAX1yFyUMN1wfZ6BtSCfTnY8PeCI?=
 =?us-ascii?Q?nFwP34I6V2FPjSW7YAJmZ4JkKtO/fyHAp+LMl/7ONvGiNm5kzy6/PzuoJR+b?=
 =?us-ascii?Q?I+IPs39G4tL3/2zTNBXLnfZG9A68ejqCcph0O39Yp9XliBnTwbfkrdjS3eor?=
 =?us-ascii?Q?XZVBNXqwXccSEZZTmsgLbbc+tOXP+WcbY0i+MrHmw+Iqldggng6joo9IsxKc?=
 =?us-ascii?Q?xfJcDMR3Bt2SoFyLzOnNjHH2ExgjFWjyVctV80yXkOmz8VHgbT+6fViSk3wU?=
 =?us-ascii?Q?/NMNfrRZN4ubQOjmnTQoOl14WVSbxBCxkAEKhv7sl1pt08t6j3EDwgYS3pRL?=
 =?us-ascii?Q?IaZuJy8tPnYuHlT3WZZEKMeKgdl8i4pyXnrP/rfuhfbZC+fGomSN3/jEZehu?=
 =?us-ascii?Q?86Ow7qvsn7pA3mG9otjzkQKNa1ei8cDqE9mSWH4AjxP2tfQObneZSLmpZGLu?=
 =?us-ascii?Q?sZcPBqj2mRTz4bmp7xeENNkZ2MQhogxniq/5WDtA2tD4RI9MVbsobsnexjKb?=
 =?us-ascii?Q?LFu5I7K/N2jeMqr3Q/aYCzK39h5/+kEN/k/G9DqNAXbQT+147CHcO0GMCCRl?=
 =?us-ascii?Q?PA3vc+XH5vVb8s/dp98U1f26JgIWfeeMKKB8KAzD8gjC9ZTZvpHwJOr0bkJC?=
 =?us-ascii?Q?b7e+Ug0TsuBSzZb66RGXVLdY6SlYSbTfr8uQVpzJiQQ1CakEtuGMRHRxO1IF?=
 =?us-ascii?Q?kCoWgSOSlgLFB2w7xLnvteTXzYHnXIlWPo/YOorxQwI/Qv3iX4/ggEmrfrJb?=
 =?us-ascii?Q?XWkaPC5KPNpy0HL8iVwry+Yy3wdLJlom2URS1dqGfhqUa7xYxKG0Eo/9R8eN?=
 =?us-ascii?Q?vFIY2dcka9nwWJDP2DrXJjgx4LMgZIQ1xyS3wu0Qa1Ts65JaZbCrzJdBuzrE?=
 =?us-ascii?Q?DViI4wpQLWGE0/CTw0oUMoKz7SvxW/9z9a5yPkJHrq+8IgEWruq4sWqPda+1?=
 =?us-ascii?Q?k/WI2SgmUwtf3HrllFwTFqwlBE64HsXXTcB8qJ0ChAcfS4AsKwkWgE/MHZDG?=
 =?us-ascii?Q?7bL2zLEtZTEc41GEYvA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 05:48:24.0854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcc8e44-0ead-4eb8-2639-08de42b00d83
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_214830_881181_55085440 
X-CRM114-Status: UNSURE (   7.28  )
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

Hello,

This patch series adds the dt-binding for PHY_TYPE_XAUI and adds the
driver support for enabling PCIe + XAUI multilink configuration.

Patch series is based on linux-next tagged next-20251219.

Regards,
Siddharth.

Swapnil Jakhade (2):
  dt-bindings: phy: Add PHY_TYPE_XAUI definition
  phy: cadence-torrent: Add PCIe + XAUI multilink configuration for
    100MHz refclk

 drivers/phy/cadence/phy-cadence-torrent.c | 143 ++++++++++++++++++++--
 include/dt-bindings/phy/phy.h             |   1 +
 2 files changed, 137 insertions(+), 7 deletions(-)

-- 
2.51.1


