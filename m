Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA81CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihIATp5UQQL9Dp0VU4sU+GurghNXmufV7YQeudo0EmY=; b=W79vj1Bdp1bzjBo/IzbX+XL1/c
	00jSrpCjKIAZjBW1IEokqKAW5EYat3Gu0JH663+7jS4SJnW9AKFvregMY6bI3oUY16dW3kJvjZeSC
	TnxE77k03g+7dcS3AlbcKmXyrNNYxq4bT8ghRNQc65mFqdT7ODJ2uacQzcVtcWHpPezga4UPBjtuG
	tEDScdWnGBgYr02HY3oQY8+sYObC2CFQGD68utfMbWZfjtd8oCJ435lZXuJoVR2FdhqoWaOSu+ep6
	oe8Wl0Mumvx8p+m157QI5YEANH0k16MWHAfGH1IQSwDrRGiTnCx8qeJzqG9tYP4K95HOXwgyQn1a5
	HeC6x4Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNhL-00000000bs0-2G3H;
	Thu, 15 Oct 2026 15:48:51 +0000
Received: from mail-westeuropeazhn15013013.outbound.protection.outlook.com ([52.102.161.13] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNhA-00000000boW-06Fd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QODkoOmaxR4FS9w6YyKjnt/goLxF1UiDyBzS+xoMilJxK0YHIoG3if8wvLwPlsWvPoVqNxE5lzhPfqnVOQxf/qnrt6g13RnadaEkjwJBWnLYSBtGFJqFSCIC/PZFW77kgLzhDEuyB5um9hMR1V4LEnQb/g/hOhBgtuVWpGNPBTPL5l5nIXydAY/XQsqE272gSt2FqUkGbtzHN7aAR1yKMOzyqN6wcUh2o5QMxGuR4sHclgcwTAFpKn16P2mru0vXHXTn9D9tnT6REIF7ncR9ate92bMxE3t3VzcRWD2xC08Bw3Mtw4fQGSoJQNIFZYbvcISWCOSZ617SZMuTMvyAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihIATp5UQQL9Dp0VU4sU+GurghNXmufV7YQeudo0EmY=;
 b=uj2ePcszUopAgMp4dCmghqPhO1rSRUqn2KrjHU+Zdh6A3Zho7tGnVOLMAHflRtPNBn0ueu8CYiJ199VHSDBxU5+k3nW/OinbHmBREQ1mE7gkzSNFts7cbb/jEaRRRJrKfS4Gofc45QZJ6TCF9cyWxMkC+5RMVLxG1z9QHK5XIpr3or0oKxa0bVA5TEZHQucHa2CJedtjtNiwQwiIJpF6HD93hePQol0eayYKkMnHxFz5ghc6ppQoh1plUoa9oKglwzkqn0s3xp7T+H4oji9hVZb5mGX5qSVb1gjLGPcomtcEowpUAO0lbeACZHnzlVWrZZ2p8CGWKvzKgJNd+rg7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihIATp5UQQL9Dp0VU4sU+GurghNXmufV7YQeudo0EmY=;
 b=oqcYgt2hDAuyd1qM6y4l5Tcg4Q8BxkmhPwS9mEeyYGVjR7urBvGtrK2w7YHE8SjF8WXe6PKc1DbvOtUoErSYvLU4Vcom6lKFH1ofif/F/HrnZYjHNtPPNGOeUrryGh+ERSmFxCypFU5XON8KKnVZxeeKeiRvTyHbKmEvpPnmp4jRrplXX9kiwkWalRK/o8jYutf0Ei3gYtJCTGOHh4ooOJb74S7MgoKrVH3kEc50FNeujKkb7zvRBB8zZiIpsbHEgT1B6QRDGZlvUg3zasH++9P1jmgx5en9g/7/8Llt0hbVl0W0c9NIfZFORchP0oEU/c/NrlxjK0ghraBh6lvQBg==
Received: from AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24)
 by GV1PR10MB6658.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:83::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 15:48:31 +0000
Received: from AM2PEPF00070CF4.eurprd02.prod.outlook.com
 (2603:10a6:208:17c:cafe::72) by AM0PR10CA0014.outlook.office365.com
 (2603:10a6:208:17c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 15
 Oct 2026 15:48:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF00070CF4.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 15:48:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:57 +0200
Received: from localhost (10.48.86.45) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 17:48:30 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>, Amelie Delaunay
	<amelie.delaunay@foss.st.com>
Subject: [PATCH v2 RESEND 3/3] ARM: stm32: enable arm-smc watchdog on STM32MP1
Date: Thu, 15 Oct 2026 17:48:26 +0200
Message-ID: <20261015154826.1947492-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
References: <20261015154826.1947492-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.45]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF4:EE_|GV1PR10MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: ce978ded-e9c4-4d66-8ba9-08df2ad3c31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|34020700016|1800799024|82310400026|23010399003|10067099003|261009223027099003|11063799006|56012099006|22082099003|18002099003|921020|12100799066;
X-Microsoft-Antispam-Message-Info: nC/UJDOcbBXJupBvK7RRPmiGG5OUdvVBt7P1Nf332mQceCPoSLK79XYAJAZ75J7ooFALGOgl1i48RCoXAUVaZ37LKCmASm6shcYGv7ba59X+oCvtQuQZoGjmV0pmhHOu7CMiI9MtIBHol/kY7vpirgo78xx6miY9AInQOO/XnBFaDpbOpvTwqDuM4V7o/ffiUx7XLs/l4ZKU+g5NLWwKzl/mKqaIrwhU+vhzNimxSrU/9dZOAGVXe+Tj/XbmO7fhC4r7bW7waoWXJ5wBBCBsnqCfbhgsV8pJnW3rjtAnnWGxhzwnVLgLqU38dA02SVDfr3joAgDrzRllX/nNqnSIcWdC0kqC8Gy2/O2SWxcD6q4KMkNYTpskKIaXVbWf30nIw6qpzFu3jZvHEkIS3T2xDCZnmNRL8MLNjS5SjNx7bx0zXh6jw7cdD+Es4aJbm2QsQTsk8DSLiBU+uShOgQVAtjKnVj4LL5cfKXlstLKACiZn+pnwKMD2Tf/+cflL7HkDB+msy87sn4shP0QJCF0vwZOCOHyTWqDkZ+C36xz6DbKXkjq+G4NYF4pu5cT0DiB7UGFHLYYfDDgqy5Fm0KNsh0TEdea2caQuAnkTq3TLUpVuFwblARhwfbRBLCEZ8RfUlNvb61PRHiuFaifZyvKbsuR0A1bHqGbn3f+n4OJnuic7EA1pKm2ESr6eC/NF32duY8JDRWKjZGea/UIjZrgE6UGOUWKvvd83BfLTGnI6V2X2tFX8hcE+5jrOzpROUsF4
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(34020700016)(1800799024)(82310400026)(23010399003)(10067099003)(261009223027099003)(11063799006)(56012099006)(22082099003)(18002099003)(921020)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DY5H8AFjQpqESTxiFcE3eRM8eA84MyWAGznVfHRd0lx/pKYQ+N3kITU/inQL8fYI6Z9Xt7lEFc2AMBAL3U02WQ6U2MWC//v1cr9rg5krqSF0ngdGeKFUAH804X3NcKXbLzlHbGEzaJyz6ET6P9nLrRD/6kF0KHIKMtq0Tj83jzJ4VCRbsi6DGEUY4c4OGlX78ku9JJKkg7Y9J45ghioxdlLYjI/asO3wnLZUxTKYr/ZC1fJLKRu7pfQuEcDrrNmPd0jdUTJn1O1Q9VIUwQ+Xcfhw1t7KqO1pzm5R4CyaMHra9jXguXH8SnAqjYTmTqusJyzRO+mVl4RaFZfMERk5+OXuWrGs2zeWj1CaSaTwqACurLzV2jQHZL2RMHJObjSXFy9WPyy6jUoT0JWPhGMjNCk9IcpVSu7sNaHemQ37nUK8idnTN05RUM604x4X2geG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:48:30.8984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce978ded-e9c4-4d66-8ba9-08df2ad3c31c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF00070CF4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_084840_068127_AC81343E 
X-CRM114-Status: GOOD (  10.17  )
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

The watchdog IWDG1 is secure by default on STM32MP1 SoCs and has
to be controlled through the arm,smc-wdt driver.

Enable the driver on mach-stm32 when ARCH_MULTI_V7 is enabled.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/mach-stm32/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aa..de09b2afa0f2e 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -13,6 +13,8 @@ menuconfig ARCH_STM32
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M
 	select STM32_FIREWALL
+	select WATCHDOG if ARCH_MULTI_V7
+	select ARM_SMC_WATCHDOG if ARCH_MULTI_V7
 	help
 	  Support for STMicroelectronics STM32MP1 processors using Cortex-A7
 	  cores. Note that support for the earlier Cortex-M based variants
-- 
2.34.1


