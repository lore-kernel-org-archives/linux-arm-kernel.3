Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6712CEE369A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7sBo7RJOdU+AXJJYbm+39d2KlhR7fq6bgw3+19Kr0k=; b=A3/OnTJ3CBt6IybrnztnMgnBD8
	PpI0NWk9hXkitUnJJqPGzGQH8qhOvPeBz++MKwjLScd09BkVxBEHoj9PDumieMq0hZoHrx0ARvQyJ
	lrpcSbWVowem5iJio+X/4NKpSGCZEXFg/G+LvdAa3u0OlON8p9M6rXJFvmxHRRXM8OZQr4Dh+l7Td
	9khBy2t9imwUAlS5ut6OrrO2vk1yW6Ib8a+dcYxB68CA1xJZqnfBsND94qy5HHwBhxkW3G75YUKqa
	uObf2tftmvT/sj3L9B2vvj8xACZiFpQyHmPQ46BC3kdGRWKHAJ2NcmCCVFU5wOuzXBJzgXhhgqpm/
	HrSDsNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpQj-00000003E7S-2VhL;
	Fri, 13 Feb 2026 09:25:45 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpQe-00000003E5s-3EXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 09:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5v3vSIoFl9LuQBopfFiuESHrEQoohmiQrzd8NgQC37yAbjQ//Tfp2+sCTl1pF7TGhgVpUYp5DF26Bi861KfLTBYLIx+4sZYzJy38eNvzVRmx8ddwkAEfHJckIy8tVfLFan1wns1yHRo/I2KTXlD1RiR/fqFoB+bCqejQL/ciLZq4OoBHKINSTCdvURuGePNjqZDwfw/igXuQe4W0LnuQGNVgPX2lpga1m3r9brhufTgo+WKA6xz/GzcWxBNavok/1r3I9N9g2N0ZKVBpgy4VxYlfAd1JjEM9Oq7+jfPNEhTXngWxqXufYp2P07EHUqufWvkTGnyDgwi87gONecSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7sBo7RJOdU+AXJJYbm+39d2KlhR7fq6bgw3+19Kr0k=;
 b=p1J6/wET6lYQ7rAx2wifqe3di0yeCtVP+Ip+fShk1/Z4SZ3tJDEb9gx6LSJIlizpFXuaanWfXlq0n1M36iNbcRoSuTKFWKdHHLZsMPR1d/C/FkGXoTe4xqWrISPdbSp3mLiPobNtYwSUwEGPSmjBAKrvpvVhlaamN4mmqZEVIk8SFn24gE3RriNIMZCIci5vOlelwAEWKnDZts7cUD2OcwFQjMWuEslkxtTmEG9d72DIb22elwEKMOCEd2u2xExiPD67ZzvTjoJ6FJGQXvPv3r+jrdzqHn3LtKyXGl/oo+rqRHjCrgtGC8POCnvBJXUV+roxY4tx7TF2QKETh/eL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7sBo7RJOdU+AXJJYbm+39d2KlhR7fq6bgw3+19Kr0k=;
 b=o22SMuu53JcwkAae7yLlT1KuMsigGXh/GKSwJx95sknAKjH/ebBPcWmp4e3A/jBOwWW4ZipWrOUUoEa04Pn2auRPYQrJ+mnVDeNCSy5/8jEJ+80/K9H80TWl+0bBHRC6cvkRSsQdt7hvqo4lz2H1wmZ3EpYDCBe8wOIpeGGR4l4=
Received: from BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::12)
 by CY8PR10MB6490.namprd10.prod.outlook.com (2603:10b6:930:5e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 09:25:33 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::5b) by BY1P220CA0010.outlook.office365.com
 (2603:10b6:a03:59d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.14 via Frontend Transport; Fri,
 13 Feb 2026 09:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 09:25:31 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 03:25:27 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 03:25:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 03:25:26 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D9PPNf960316;
	Fri, 13 Feb 2026 03:25:26 -0600
Date: Fri, 13 Feb 2026 14:55:25 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<msp@baylibre.com>, <sebin.francis@ti.com>, <vishalm@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Set wakeup-source
 system-states
Message-ID: <20260213092525.2y4syuaemkeo5brh@lcpd911>
References: <20260212-am62d-can-wkup-dts-v1-1-d2de17e1f303@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260212-am62d-can-wkup-dts-v1-1-d2de17e1f303@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|CY8PR10MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 7627ff89-8100-42c9-5930-08de6ae1d54a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LiEGWL5bv0HzvPwVf5WcZ4ksbeVAUCzsoiq6C74k3rDY1fchinNrHxiW/pcv?=
 =?us-ascii?Q?bHxuT43N48kPgXntwETbn3P/yf2kXCo/ybPtKnP/6aWS3ukaEZ1GwvG17wBf?=
 =?us-ascii?Q?YGcML8vAQDwWpZqaaXNj5AgwqI30rLsAovZalNKE3d5ErN2gFHQlrTqjr7Pu?=
 =?us-ascii?Q?rlEmUVcaQnx+7jASiXnGccy8sO49F4VZwT6Di++fLqNgCoci3Av75AfxU74s?=
 =?us-ascii?Q?f8mH3HWSku8yx92g0XYptGzOUHR4RdYWeJA6va9c25Tnn5kwRwFs2pJfdvY6?=
 =?us-ascii?Q?pvachrMXeDOan6V0QtdYpMhUl3Yk6VczbHwmOnygXheTe/9gl3s7gqyJNQSl?=
 =?us-ascii?Q?2WSmqNEVWNGfK0Q/bY7ObZwiw3R2hG4km7SuW7NMBSBnB89ZYr7ciNR+rRzf?=
 =?us-ascii?Q?uPAJ6pTtGOD5hykTbPsZPV9oDRS899kWC8LGQeZ94kjSEnrer9bn1uR+LTXG?=
 =?us-ascii?Q?+dt496Msq+wMWUDUV7DfbstY15pSu7bij+OySTUgIltHAZUPWrpbmWCkGgXE?=
 =?us-ascii?Q?gVIw0a09dZ4m/lAynKLL6mvJOheATa782uM4EukV/sS1fJLC/Y2Cvnc/jt1C?=
 =?us-ascii?Q?XzFmdue4lKiUcLOqg/SP8PNxHH9TLgpzvMdW0EsSMRdTNuzto+c4HRvJnDNd?=
 =?us-ascii?Q?9BOA3EyVarquZP4eyCUquyFnDRDeFDwHStagwcpJ+LkZmdIYN6AnPIe9gQoI?=
 =?us-ascii?Q?rklAZFKjxoiXvu+hlhSIlIeA/YtzXb/AkAaMTOgwzbiGh5UolxEI9Q/jM17i?=
 =?us-ascii?Q?3sQLH4wa69PaJChG7UkIQR9X5vo1jw+Uy8BcgGMEKEzxBka6M/zUey5E7iqI?=
 =?us-ascii?Q?C37XFpz8H/gIGexq4cuoR1Z/NitQ74gWgfy9KdeZKZhFeRdLS6xZefS7qSeP?=
 =?us-ascii?Q?RLNx9KfulYhJkjh/CyqTZM6yW7ca9ezUPZYGXBHYkP7ahm0X6FK+bRTx6W3B?=
 =?us-ascii?Q?BeJCI6+wMrYKLLfIYaYYzDzu7OlFWdyayfIyd6OXgEwiW5Qe8H9vn9bks0VJ?=
 =?us-ascii?Q?PV0aTBIai/yrsuZJeQMZkMN+7VbyeS1/GgnlM0eoLfZIbN4M51WERmKGMVe9?=
 =?us-ascii?Q?5Lt8W2cHMHhc+/j1/ywumQ5yVRiWPZWAKPkbMe+Lvo0SX5zscNT0+BJ7sUkq?=
 =?us-ascii?Q?RUjPYzvp/OtZS9Y8Ng9/8l0IiL6Gb9WCGzaXz/+XyIkBvg9wTU86vzPYoHVa?=
 =?us-ascii?Q?MxL8UTl5T8nok2jRiX50BOnWu/jDQ54o4atY+YIuvGwmpqpZG0l52qhlVAfL?=
 =?us-ascii?Q?i/tq6EZD8Ocwqy/m9Ne2iJ0mMmHvQo5cot7HDThi9hR/OSRudH+69WAit6Zl?=
 =?us-ascii?Q?zo/Lckf0T+DLVIlvMkstMbk+zkqxC8oi1hTwtPNfpJhcK+mjP0qRG6maLTKs?=
 =?us-ascii?Q?Ii1kr3yRF4VaNGypCihtFxEioQSmC5G3fi4OpIpryDe7xuTxXM5ErH9bAzQn?=
 =?us-ascii?Q?XsR9eBYG2+o0fghXCWIVW2kzTiAObdO7vs6X6NZeMp6XyysLHfuUMD/pI6Rc?=
 =?us-ascii?Q?mwLsuld7Be7qoEjYSgj7trOwc07AiBLOcdfgVYgO98esUBpkBxklewBqrEhL?=
 =?us-ascii?Q?KUYJq4ip2evPDEEoDJq+rHjxm2EhkC/ElGfstTis5J6yK52wHhy5lAIBwoxx?=
 =?us-ascii?Q?FNy5M7SxluHSIta1U2W8pJ5tKcNf+8/11FN2vavYXTYRlumIanqPYFiCusof?=
 =?us-ascii?Q?HXP7Yg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2QBE9wSLQXi1lEjsgI8OVzArT8bRshP5gMOjPqSQSjotP2C0bX6evcW7T6ZWqXg6JPnX1ieRrK7RCrnISk/Z6QKR1uxeSZIUD3smnktxR3aLzOv3AciH+R+oLL/sJ9FpMwEe86hxi5QLMzIzECHxD4ZAJ035awJ2vEUivmuesLl9h/EtlekhxnpS696ItXlzJsHAmmasgpstVnUDaycbQ4DbbG7fcgtoWid6ZTro9+zDEhaM5J4QXjHkGMxfz6JRRw+tPsIwcW5RvgXj90Yt8vnyoqGXR3krSgc3kvYxmjW+kO5Vcg2ztkDixjibScyYAEAGgOZHiV/6Uml5sFUhxVnM8XndgOcYaTvWIFKFovgSK+rmkliZGVKOVTYFV5yv9eRHmXBBugH2wrcuDsTvEHJDmeI31n6IVheoc1hGrSKODVxtoEz6X/DaTP5e3jcy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:25:31.0481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7627ff89-8100-42c9-5930-08de6ae1d54a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_012536_916465_D16ED6D0 
X-CRM114-Status: GOOD (  12.44  )
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

On Feb 12, 2026 at 14:07:16 -0600, Kendall Willis wrote:
> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
> powered during Partial-IO and I/O Only + DDR and are capable of waking
> up the system in these states. Specify the states in which these units
> can do a wakeup on this board.
> 
> Note that the UARTs are not capable of wakeup in Partial-IO because of
> of a UART mux on the board not being powered during Partial-IO.
> 
> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
> Partial-IO. Add these as wakeup pinctrl entries for both devices.
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> This patch is based on a similar commit afb919a6b36b ("arm64: dts: ti:
> k3-am62a7-sk: Set wakeup-source system-states") Markus made for the AM62A
> SoC.

Reviewed-by: Dhruva Gole <d-gole@ti.com>



-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

