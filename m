Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC1FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 01:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AL71UfVBYJeQ/KbzMosS/q5tPZ8xfhtvgvWv8aVAED8=; b=qdvvCeRciHjxCoLbNuSrjAnjvW
	tGvlD67XKi8/XYB/Oeyy5wIdSDtHylD0qQxljgTt2ScPgXk2fMZ35JkPARxg110FFb721Q1k82AY2
	Hw0ZFKhMJOPcXvfEOWzSI+oaScqC0g8Qf6XBXgX//7nUjawKH6QAoOef+nX9D78qXfnFpQZoMENHw
	QmePW/XxytFBa7SOGhaAH77r1dz+9e0YcaIwSyphiANjQx1iTP8mgBLYygVnDHO7OS6CZkD6J/90Z
	uE02h4nBD9y7ssaof4MzCHnIqopJagmMxvhE+um79w5wJs5PLsEzse84MhrOe9ue3++PBySINpPLH
	ai5uMqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6Bw-000000020cf-3p2X;
	Wed, 26 Feb 2025 01:26:28 +0000
Received: from mail-sg2apc01on2072d.outbound.protection.outlook.com ([2a01:111:f403:200f::72d] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn67P-00000001zy9-2C42
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 01:21:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxTMz73wbT+m6FIn9iVc3v4ARngLWFSlYYDedPp2ndcVSOKOEpwP57HgpUGo/SXrvsiXAmJM5abKW9pMyyDZIAL67IGZ3IXjHnWk1fV48N1TrsNMPRuGKshY6bL1bOM41y7AIehE2crMcgwJdVnnca8v/mHdCcIfpq3V+O/NkphgNE0Ox+jHwaMXdkGisVUVaNdu5qtdttXTC5HYQnUrvMgfbR7jy3c2WBHkpE1u49DpuozYXZFo/oUk+bcwXWiARnnoEWw0Kcrj/Mm2HvVj4k9gVDL2Ws/qZOYNavD5is6C1bOg3y2YEF0BQa0xvmEnymcVZ+2vuyvNznFWEYJlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AL71UfVBYJeQ/KbzMosS/q5tPZ8xfhtvgvWv8aVAED8=;
 b=X+YfzUtmuLfjg9RaPH8kbZkeOSlb8YnG3dzMgBpLFX2LZWuKFZPZLkIdtzjx6pt1hRZRZhWYJdLD8QXLz8T6FPg6ChTte9QSgKJy37JeBdonQQZk+w5qO67hnlIPsSJ5GDM9TXtLu6B03A+mResMlqC2Az1S/ttGX/cm+t8KwFTHndt6aqa11fuBfavppdIf04GQPTmStgk3EUWpslZzZhkHCZRGiZEaegg1ynWEoJX27OFbCm1VraDZBIcOv5cbFSTZY8hl/4A1vgyJR/y4M+BMSH5Pd2W7wojMLxp5A7VZwIBzo1sXmXS+vtM+0fi1uJLOXv2xX73jKGANdlrHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AL71UfVBYJeQ/KbzMosS/q5tPZ8xfhtvgvWv8aVAED8=;
 b=Z+7jwHWqJDD4NPHc566HRCMWX3ugiDypcqkaaYH8YUH/SGF5av1cf19q/PPMAa+tMRxOaLkhMCbNZ3htkVldF/6DME3IdkbhEEF3+qbUwZqUgylGOeFaPjp9rwGIGOkRr/UBzQvP9RcVWXqQxAu99ddfwjc4gTaLjOmb2ZpdBQTLC80OUxV/rj77ElH5QpFKAQsFxvrurEC6VnoCsxGUnHBpSa+AgKgHmMIoHFpkOcm5/i10rQNCg0cEHvdKDJgwEj99jenRkkmBJNUM1ZiwDVD4hCQ20f+uxCf3CTvwlCN73iG1V4fHpDxxPwQZLviWBFAwDnuJAnq+jiaULPZShA==
Received: from PUZP153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::14)
 by TY0PR06MB5233.apcprd06.prod.outlook.com (2603:1096:400:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:21:40 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::33) by PUZP153CA0018.outlook.office365.com
 (2603:1096:301:c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.13 via Frontend Transport; Wed,
 26 Feb 2025 01:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 01:21:39 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A0400416050A;
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
Subject: [PATCH v2 5/6] arm64: defconfig: Enable CIX SoC
Date: Wed, 26 Feb 2025 09:21:35 +0800
Message-Id: <20250226012136.854614-6-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226012136.854614-1-peter.chen@cixtech.com>
References: <20250226012136.854614-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|TY0PR06MB5233:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 189a7f49-b430-477d-a256-08dd5603ebc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F/PFE/UCWQBMdyjCKFICzBiXvcqY4ff1xAQLqeHmPATYjfVXv0r8nk22+iW3?=
 =?us-ascii?Q?xL+oI9AXg2RPa0gp2muGvtem7SqSyU7psxLOq7sImvAMJP5vLxG6CYTcWTdm?=
 =?us-ascii?Q?O8fO9R9srPaChEsYKP2xgXuLv5BGKGCB7EE/9kdXY0D//fiY18rAYr3MJIzt?=
 =?us-ascii?Q?PCbTGzCaziiC8Ur4tTYGKIBMv583l8GsNg/v6quaws26QRK05fnNPqHSir6Y?=
 =?us-ascii?Q?NTHB++gsxnD1AxlnRXvOWAw+7E7lsi44vBiZbUjWjBz14hRJZ+e1r+Jzg83B?=
 =?us-ascii?Q?cjPNgiBiL686vKgiaSc/3ZMNczI08MvVMrQti95jFZ366gsA2rY9mHVGKmVR?=
 =?us-ascii?Q?70eW0eD0q/9tmHYdc1vlPxAAhiqb1udu+ufb1SFcXV7RTX+adXLKYu1jSsrv?=
 =?us-ascii?Q?CZNso1JUPLq3flYWknozvVnJ8NNN0bYvcOmRJohKDy4CDznHb8+n1NJPKnqi?=
 =?us-ascii?Q?vf+/8z3vSXBo90yxJegafNlHJrzORUNaGTkQcatSBFcKkppL69aAKqPA0b+p?=
 =?us-ascii?Q?dLu9RHO2cByHNe03caObGAuvM6agyqOIAygx19QIbjvGy9hBkmCTBp41ZyGe?=
 =?us-ascii?Q?VWJkzre+OeKkPbgnFT1kR17Mv0Bxw9Dvh7Zlwhekso8FIUYKjKqNiJMSFTdz?=
 =?us-ascii?Q?S0Czqij39tybh6/SM+kLzY+664k6Ez8x9j6k/CTc9gJxJtRJlThivnRb2n0B?=
 =?us-ascii?Q?w/BbYz5iv5y8wiOilsBZuzZ6BRgYS97cBe8/VzaBbXMQvIB89anUqAyS9wpd?=
 =?us-ascii?Q?KZQRjWUpJvuofzMNQjndopo03b0D7CkmFCmW9+lZztoRSW5vSIK7s0uHBrwG?=
 =?us-ascii?Q?RcjsuMyNuUY60X9rw4j+1hUdGrCVccUOJ1Y6E0rh9hFALfmcZbXPEIG5aEK/?=
 =?us-ascii?Q?VsMvVtWz+w5IOjtkYtfIZnii5Z5f7a55oGF0Ldic1XAnAXONCyR/fg9GSwAm?=
 =?us-ascii?Q?pt4ZelC1UyiQiTMPLWGa9cIW8vOg3DPm8UnfC0MCNqD3mWSrNa2/dQgCuV+C?=
 =?us-ascii?Q?u/DbDzr3b2LJ0lOnUNl98cvSVsJ9tECkwUIJg3UaXSG7JR2bx9Wd6ndEq1Q3?=
 =?us-ascii?Q?33vcbXRbpOEAZHelAu2zmVvk77lWcxSXYvMFs4aTcQBPUXy4CdnLsX/yi1qK?=
 =?us-ascii?Q?WPGhwe0MjVH0bCr1Yeds449bB3KotIGOQbXrYFJWvUghmS+qlbuZFO7ragvS?=
 =?us-ascii?Q?nlg+p3Ot081AbijRxr64gzQz9CcAV4EN4Ube1uP8V2VhtKfDM5qEzB0eiAB6?=
 =?us-ascii?Q?U9rHwDVwMMuu9Up+8/M0s1DbSuxNZJiVr2/q7Vg13vBsO9P5KgQn4NXGwtvz?=
 =?us-ascii?Q?eOzMcAb/AlUNezjdSblBvFbHEf97UbZZbSpBGQVj/1tTLIQTMeZIR4gAZVK/?=
 =?us-ascii?Q?uJY2zWmMzc6O71UbPJAyTulvUSEwKr+aqlAaccd5tKQvELfdX7x6fcTFRuB5?=
 =?us-ascii?Q?6vV/0yeVnqhKSCQbrqpQKBHlIF9L/Q8JiamYcVbDNlxYDul987O7C8vv2Chp?=
 =?us-ascii?Q?rd8Fif8lDa8WbWo=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:21:39.4663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 189a7f49-b430-477d-a256-08dd5603ebc8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_172147_559081_F744E1C0 
X-CRM114-Status: UNSURE (   8.23  )
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

Enable CIX SoC support at ARM64 defconfig

Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v2:
- Corrects the Ack tag's name

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1dd46d200401 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
-- 
2.25.1


