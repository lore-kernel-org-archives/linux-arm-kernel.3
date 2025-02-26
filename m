Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66486C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 01:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haR5tbnvIj2P2bamJeswnPFGYF5HC2vavkyiI1t+w3o=; b=43ybcDUOGashEGSr6obzPuYtGW
	1qAti9Nwz/2JLSZHJfrfACVyUwTLehSSXuMjAbzXVX1RgrduMia/HLp9nw274+kvHPBWOUHiCorOe
	tVz6y3L+yIYf3XE+Fv8K2ArkoPZqxa1fdwMqkD5mAd5+SFXgTdvsUYEzyiD/FndxhvaNP7evKZjyl
	i2B/sbffPpN4sqB+NR/a3w4dE3YEUz4IDyfv62yiSJUhevrogs5qIDg6dowibcn/Nu8daC6q7f68K
	MHH038W+3QDANl5v1gCjxmDWsJ+E2jFS0T3KE5Mo+tT/hTP8r+fHPtIcRuylzPtXYiD5T/oZL6DDI
	ruaHoq7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn68w-000000020Hq-1y6n;
	Wed, 26 Feb 2025 01:23:22 +0000
Received: from mail-tyzapc01on20728.outbound.protection.outlook.com ([2a01:111:f403:2011::728] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn67O-00000001zy8-3Od5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 01:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdA2WZ7T7S6nAVHhSlUZ+LXpNmXvkiRQzfWhYL85zFvTjHB50YhS0tJokcuzCHvRd/CriUyDtZQ2n5KUOVYoytAjMj2hwt9X1hU1cO1k1Xh61nvHVnMTYq5n5XjjFZqDpzTEd2SMuMJiUnxjXEgp0I6Tlc1sVu5lDqmxVo/M9JPjq6WzMCsD+Fwv8bjpJwfadakAazo61+ifH2a99oufSEC3Wk0mQj5cBRiF7xpAAjaiHQcxRn5kV1Bq165IPx1OH2TI8Ugfd5dpch2otOCcZyGvedEPj5TSvAVTmUHQbv2TkTipv5SYsqcnb+/hPRUOwzQ4fjlqTTyDOgrPGOnrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haR5tbnvIj2P2bamJeswnPFGYF5HC2vavkyiI1t+w3o=;
 b=O8ege4UbBBY8et+PEejj+Y5KtKGey4Z+LQskwJfRN16yQQpbfOPMr8G7WM7pHhtU7PRBL/AzLhdvDuNqB2Njf1mTzpE8GwZFokh3ERyNVfOP9ArwhIV0+0oC+cQ9c+Q8mUCHlpj+vcxd/A2ozfOsAl12YutWUvGuTfjd1TBQenMXw92CWhkW9MIjOwuY/jH7v40dpaOLqaoddnv8lJ+cYjP/PeRjfKzMELLOeGPMXvbsWhsiG+Oy0qXVAIQvjGCpCGHeNBPWFKGTdzyjWd1MqrBc0GFiuWTkVCfGi416+ZTka8dPwoZSjcQ+L1QrfYigUhc13Lr6BaBLUYJ11IqHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haR5tbnvIj2P2bamJeswnPFGYF5HC2vavkyiI1t+w3o=;
 b=Gy9DerkymE3lN4kJ3f0SWLFB7rAKwwt6V5f54onDr/bVOj/IJYjzUm1nCx3RV0WI7wT4Qxc8ZArlLPlnjLy+7ow7eOk5Rd1LHOQw65kzHWP5CWdET9eh2aI4WL9JuLSgprrl4cfOSb+RX9Ugn4aSZh64Lajz2WFx5UxOP2+/1vbvB/ngaq7Omw3dopxipCW2VzylCjbj8Qm8ZYpE0/ddhBEiQ2E34xciKsJ5sLL8JGxsz68nS6HJqoWwVwTqSvQ8w2Jzgw7zmvqKnrBI/+LFDhti6VoMgkzOcyPNzR4HcAXz4yQicqzaiWzHWa3mACPcRExImv8sLIO1yAU+2XLVpA==
Received: from SG2PR02CA0035.apcprd02.prod.outlook.com (2603:1096:3:18::23) by
 SEZPR06MB5199.apcprd06.prod.outlook.com (2603:1096:101:73::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.19; Wed, 26 Feb 2025 01:21:38 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:3:18:cafe::ec) by SG2PR02CA0035.outlook.office365.com
 (2603:1096:3:18::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Wed,
 26 Feb 2025 01:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 01:21:37 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7FAE941604F8;
	Wed, 26 Feb 2025 09:21:36 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v2 3/6] MAINTAINERS: Add CIX SoC maintainer entry
Date: Wed, 26 Feb 2025 09:21:33 +0800
Message-Id: <20250226012136.854614-4-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226012136.854614-1-peter.chen@cixtech.com>
References: <20250226012136.854614-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEZPR06MB5199:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e9a61a1-1968-412d-9bc9-08dd5603ea66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rcPpuw5vv8OcMbDP4hlTBoWvmA8DtMdjHiVIBr5x+I1mh+rPfQXrTNQpZtwZ?=
 =?us-ascii?Q?A8yi+Dbye+oS4z8e0Ca+w2E1RKr5GRWWaDYBxHbyjE8+Rr2OIE90Cn8ThVPL?=
 =?us-ascii?Q?18+4L0qlUrW+BffqBvjyX+tPNcWRrJk3f3y9eVUuRLuIqJIu+EOcFhOCGpnx?=
 =?us-ascii?Q?ztFdD42GAoKacUX+8OEsxH4an4zIJcgbJ5wbx+i5DO3DwDJ9P6sgZf42WMtf?=
 =?us-ascii?Q?8022EZBzqvPxIF2KChZDrY9tIVqbKDUS0sL7BjZUDuAFEuw+FitDfr0tpCZd?=
 =?us-ascii?Q?308ah2y/L0X86ni7US0+oY4cnTCm8ewaEex80y5T9nSOZ/8E6jrPCfYG98IW?=
 =?us-ascii?Q?nIKqvSsxCJZdFK1ClcCp418UvZeSSBahB1eS2JUDw2eYGC+7YIqiT0lvqZEq?=
 =?us-ascii?Q?Qxk2ObcRgySm3/8lJF4b+Fku3fv97ukbzvNhGsuYQlXHmVUsY5pUBRx/iWop?=
 =?us-ascii?Q?u2F76r2kjMLX7GfiNEcl2XeTf4LVewvr4dIvFoodOGsL6+OtaOBDFd4lVSTp?=
 =?us-ascii?Q?ZcYhA5CWcSCJszOEBHlqGOqcYBOC0fwZtUfRW7UxC+lvWcSkOkEtbsTKmPnC?=
 =?us-ascii?Q?nIShQJurzyROpvcAwNwAqXQA74mMACFIkx4AVfz1xPceCPioIWq8dGJE33m+?=
 =?us-ascii?Q?bp3H3WTo2sTVWuhR8Dz6y6hx6PDopHi9KrByOtBSM82NqEju7WcpMfBWXoSP?=
 =?us-ascii?Q?e/sj029/LkbgPAXa8LoIulJo72kj+Fbk9XOrxMefUckNvJ/5PcUrhP115uX+?=
 =?us-ascii?Q?QCVxEJ5DVsPQ4xXamKz2gRBZlKf/hf4Wa6syvoTlZSC6YLcxko1LQuT3hL3Q?=
 =?us-ascii?Q?lVlfIwgaFG7H0FRt0r8geTnYeldWQNWSjDdV107/Ov1tPYUy4NVmE8e6WKjV?=
 =?us-ascii?Q?pztQsViFhfjVCGYgR/ustuAaFW/GR4f7CoZjxkkJIeIXZBecREI+eIT9t5CH?=
 =?us-ascii?Q?RzZKhElLcW50Mxyg5jE94HeGD4ptX4pxhnU4tfEmVnSq3H2A5S2UF+n5gkQ1?=
 =?us-ascii?Q?sTRpFzD7J1wwRwV+sk8wB52g0ujK93UYLSkLANbSjLPhpWxTjcKMow904qct?=
 =?us-ascii?Q?yDClyfgNVKm6kYKtl7yMenXho6ICpXOqp1M/NcngAnuoJdu7EjVy0g+hhxyl?=
 =?us-ascii?Q?KfdlhJ2+Na4lXzKGfO2PrvAaTmUnlh5fSe+1/yHrPU0gbnluxo+aB/tJgZIC?=
 =?us-ascii?Q?VeC3ux4XH69dCjAXfXbuesdRpL78HXUasGz314JiwBcGpIV2Z8ZyvhLgajy5?=
 =?us-ascii?Q?fVZ4nOs+qHCaIz5uNae/r6ve/9IdPur2YtWzBC+pgEaWN1vlwSA0hjccpUkN?=
 =?us-ascii?Q?/cAc1wGKEJJ0nw2Q1/7CS02CtL+YSbirRldiF4vz1SXM8+oUAKaiwja1j8xW?=
 =?us-ascii?Q?jpfvobf3k/J/VY+LNKRNsmCd4S/AtQfvFaNe+el5QY/WyYczBUx9KhmXsKFD?=
 =?us-ascii?Q?exrVzs8wDX9Xm4/dkHEQpcKNT4Br+yi6daPoeyvvcPSEHXp3M8pTIIokq6Xn?=
 =?us-ascii?Q?17ZPopMUuZXs2SA=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:21:37.2243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9a61a1-1968-412d-9bc9-08dd5603ea66
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_172147_119481_CAABCF22 
X-CRM114-Status: UNSURE (   9.07  )
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

Using this entry as the maintainers information for CIX SKY series SoCs.

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..200d2529c8e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2354,6 +2354,14 @@ F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
+ARM/CIX SKY ARM ARCHITECTURE
+M:	Peter Chen <peter.chen@cixtech.com>
+M:	Fugang Duan <fugang.duan@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/cix.yaml
+
 ARM/CLKDEV SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1


