Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B635FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SARyRxrKg3qek/4+8wUuOEhGgsOEF3Uaa//5s3TbaH0=; b=KfrszF4C/7FUqGCTZFiFaoRZSF
	3LN66RKRoCIjb0V28VsL7/Y8XDjtrHPidPOVPAtUgkADP6dWbDQBu06DzsKchh+Bf24U+5UuncWwk
	WjvOhht8jCx3SYVLZv7hnQ9kapzbsa7IV/6EF6FiL8VuVz/dMvHyGqz9OYfhPlAOjitW5LnnzDZp1
	FP4H8L/wIVGU277dY0XZpiVJzchENn/Q6Dkc0lmdGZ2KGP5p/UMvDLp7YTOtf9Pq+BNr0RHTVuUjY
	7AjxwQXuASfgva/nRt9MiuuYavBlle7PMMzKDtSyinbE0e1L8P0mD+mRnBRLCIjMR23NTx5ePGvjg
	m7Hj/m2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pzi-0000000DGgw-41Fs;
	Thu, 17 Apr 2025 14:13:35 +0000
Received: from mail-vi1eur03on2071a.outbound.protection.outlook.com ([2a01:111:f403:260c::71a] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Oqv-0000000D46D-2F7G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:00:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXxnCeDKXFYRmEu2l5vNlOYKc9wbRHPogxU0pdw0M6Du78t2Cad+DOAdR/cxXQ0VDG5j3NdM9o6QFe6jCSX590JQq3P7B5ldvKZW4SNS4Zug+uUPi9ZfNc+BwTlcUgQKqYfaME/X7UOrR7fdU3hiccmc5OHKflt6/5Do3lOcLL4b8xWTllWffDAQ1d1fF+oVZjVJEX6dOociopX+LF/BKGiPgZSvV1HKhs3be8QdP3Xm+vFy2F5o8d8bDjpgOhtTmQ4nL85qRUJ0vUQCo1AJE5KAGrvl4dA7KEwgLDIl9YKQATuivkxw2JK1WUOttDXwN18jQmHAocYzrkhcRJy5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SARyRxrKg3qek/4+8wUuOEhGgsOEF3Uaa//5s3TbaH0=;
 b=XVmmBr62jJbpQEOFJX9SjpVpQLUgZHo4pB2MI4Sgh9Bt6mNetoRV3BXCutwK8P5IDNucgsPhBBMFQBhR0cIfu9PU1xBQUJ+cJob9Kfi3+epXbJF6K944H5w9WcgZuiUwUUekdGM/u7ZgcJ5J2HkG0TY8EpQk5bl2Fj12ROo6CpbfB5+PfggOzrUy4LGoj6uvu6ZLBzd+Aa5CoGF0AUM/EzQvbQxjEuR2Bda+m+2NPukjQsDMsgp0DMOxqN7z3dDc2NWtgXM3RYRM5LJCeEcz5drz6yVnnH5nwKzCeSd93XaedWSwO8ZsUzgdI0SlwFZWjF2Z9RtQtrvoZcfAVYyz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SARyRxrKg3qek/4+8wUuOEhGgsOEF3Uaa//5s3TbaH0=;
 b=uLQQOK0iTuW/Dt7D5IxqLKInpw+1ZXzwz2sdu9GEoQPgaiQuw1YfEWIliX2i0M+lWgoaCIfx4biaWfLE4j2PAp9Z2KU5XFLYONcn7haeY/HIP5jOurvYyVlaJF07mTHUjEFYjRl55LOH9QMbaDEtXsgJFlxmnXSk9jPlD9aURkm44Y3hSprIk/9zHGbDG2x4m5gx9xxP7C3wqDzg1IYMunpzrIPbHenxucneMrn8uorZDG/YRr6ZJ3weCbjJOFkJon3HnL38HqSUIqcjjuATbiQHs/f12xZ0VFk/PA6R5+N3jYLew7tOR8Lfy3B5tzxZdNF3M3BRr30WiYsqsHfWKw==
Received: from AS4PR10CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::16)
 by DB9P195MB1354.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 13:00:17 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::62) by AS4PR10CA0003.outlook.office365.com
 (2603:10a6:20b:5dc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 13:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 13:00:17 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 15:00:15 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 17 Apr
 2025 15:00:15 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH v3 3/3] arm64: defconfig: Enable TMP102 as module
Date: Thu, 17 Apr 2025 14:59:21 +0200
Message-ID: <20250417125921.100580-3-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417125921.100580-1-d.haller@phytec.de>
References: <20250417125921.100580-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000197:EE_|DB9P195MB1354:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6be577-f9e7-4716-f7f8-08dd7dafcd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OGCFZdTCgLuZaviXHbX0Cx1F47zGLTvZzErdgTEdo78gU6ijRoOnbv1JNEWY?=
 =?us-ascii?Q?rxpOZo1nZfS3yb2x0yVlxEv9j0wUG/BKm/Q06Om19QV7xoOMKVlsFO9NzjVh?=
 =?us-ascii?Q?XI136tFBvYbYJRzETf4aSUroAed9FYX7eokU+jpw9o/4dJBeE+LJ8uAd2W2n?=
 =?us-ascii?Q?9PvlMVy3fvY6h/ZKN8zyJclQsxIIbu4DDQzNDUab24BUB9Sl9ypeM4U2SM0Y?=
 =?us-ascii?Q?3/ZSVxjjwYNtr29G3LBYdLsSGx7JTEbmUgG9JSc3/drj0gHfBPaIDrryFKEF?=
 =?us-ascii?Q?NR9tYSas3j8//Q3kLF6UvMJw7YJU9fKoE7QQjHMZOQAHXomKpQAoiQyf/KWU?=
 =?us-ascii?Q?2VTjgKSxWPPoMOL4yho6PWmc7hodkHOdEkXutvjGbOI2YUSk6kMEZ2pVjqnI?=
 =?us-ascii?Q?JRHVyoOxWWhbYiGSFWzmhKzryOfTKpAbDRbcYCoE2T9IzlG1gxBH6p/Opc8F?=
 =?us-ascii?Q?Hx8jpEnbiDca7MEC+FUdMkm1oY6V997ky90CeEutd0BjDyUX0UINLoQSZNmM?=
 =?us-ascii?Q?789C9vXb4ugxJQoppluQrOP+65zj1ath6+DI4Ah67DdpXJ84fg5jzR4BDiSZ?=
 =?us-ascii?Q?0JJOuinImmUvYhckLXg6RW1BLYEMSRIHTD4UHk+IFa4wRKuzKjph1lTrHCXc?=
 =?us-ascii?Q?Q/KyOhNvli6M3t3CIyFT32iFe4XI9POyID9V2NKeHrL7JmcizJz7vrW++nt4?=
 =?us-ascii?Q?oNRILqhy/3KOipioY+kGJu/L3XobgDrAO4MmEyfDAKet/q61U1EezD8iPGVG?=
 =?us-ascii?Q?H8LQD4t4YJlFIPKLCe29EBTYTyrEjHSDSc1q5RMUFohPmE54s1YG+zBEcov3?=
 =?us-ascii?Q?pS2gZMr5pb7J2yq8sPAAFtms9Bkqg1mDIjOzX5eaTpOPP3ckdGDiCzQqbXrR?=
 =?us-ascii?Q?M7+GJQfWgZuAtsMS6x+9BS+4cPPduuI3MJ3n8BrvPD6cVGEStrJWPfxOBm9l?=
 =?us-ascii?Q?LJwZLpapoRaRAN8OiaNIupuZCp6xBb/yVMUBniXWL1DAIVaO960CtG+K4Tc4?=
 =?us-ascii?Q?C4LMwQ/6OYM2BQ9VlzI+NRiDU8U3mcZl6dDoia4XJpdcfEL6Pc13AolLb2VC?=
 =?us-ascii?Q?8LaxaNY1lGQ3Q4Z8u7QK7DchIJbsiPgpBYgLGu1eSp8BBYfacOKDIZ5WRoNd?=
 =?us-ascii?Q?Wdr5aes4GkOUevD51cPrCalaxKFwiorebmBuayjvBfpcrHtuK0f8JTumTXJt?=
 =?us-ascii?Q?u0mg3UmGS3q25MTC38PCA8AlDJlAnxe7eH/M5d1bg+FdSASsU63AZb7bBZS9?=
 =?us-ascii?Q?zTZuBvnXN5ML7TtJjJdFdSnTcor7Bmy3TDrVcqrTxzFI4Jw6Ya/Nc25uI1TK?=
 =?us-ascii?Q?G/QDV293lhOZ7+1Os97kx9jEIm/aC6DjU2sp8mltiPxQOlAII6iO8GLgnuTr?=
 =?us-ascii?Q?qn8sA6fwDKWPSNHcnO4/cJttNrE/HL7fHlcQEQtwNZBcxqHX2C6kAZlrfMYO?=
 =?us-ascii?Q?RpcvGL8ZLPJUckMkQErULqhyi7u3WTZfpA62gY/8TqmoontPIPgKnVCuDmK1?=
 =?us-ascii?Q?0QeweSVwEcorVQlqJFfNZESX3pypXqyqYmnQ?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:00:17.0601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6be577-f9e7-4716-f7f8-08dd7dafcd23
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_060025_577389_AF914097 
X-CRM114-Status: UNSURE (   8.62  )
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

Enable the driver for the TI TMP102 temperature sensors used on the Phytec
phyCORE-AM68x/TDA4x and the phyGATE-Tauri-L-iMX8MM.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---

Notes:
    Changes in v3:
    - no changes
    
    Changes in v2:
    - new patch in series

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..54e6705f9752 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -702,6 +702,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_SENSORS_TMP102=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
-- 
2.43.0


