Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05B5CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhV5pZU1ZpCho63/VsNyuPlp5eR8q3Qx50F4hklB/Io=; b=Z47PySrNKE1ZluyZ128K39KtES
	aem9LNuw2D+eB4lRfnASDKBg/roSAiHMYsLRv3cFtvFxICM91XIps/a9AoioHJww3314UriDLm1T4
	o5PVpWjxOJygVcTb6toK0NbuH2/uHJGJ/oJSZAVh6Z+9t5cGHGgN3EVx4VkvtlSx87gTiYSBbBD44
	f+pt7vR8n8EAgz91cnxwsz3P92FTmPRRYG6Rq8ZIEsdNTE/vkA/ZysLW9s6REnYQ2RyxCpZwXIu9j
	a+9tCbxKnTcOG/Abd0v/YknmkI06IbOWkr9dhsuv+o/EYwdXwlnAUrFJMiCiLRmby4UeTdncLXYkb
	MmRvkKdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgGV-0000000Fj8B-37Fu;
	Tue, 12 May 2026 06:06:48 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgGR-0000000Fj6o-22PM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FskIoMQ9Ru2wQZS+fQ8OJwejEdkXFd/45naxZ2Q/R6hQ1xjIJQgoV8AEQOYU5hdcXaXYAXWlwNrtDHfCIMu2be5y2Ka8uLj/jOmVkZLMKyqErsw1oXFUQBW5NZNUnlMKhvV7R/WUL1ovyZKlr49QwhGTF4xEC/bzPG5NmUV658JjQznfj0is+wKRbd03JrXzYsy1h8YAkAAMKcNI2lFQDeG3KXz92REjJmBaI1+rphoYYhyVVGBt5otsTgWZVlvWCif2RtM9wmlYSWxPUCLokxHR82CbV1p3G2Wnc3DmIJokZHoqG0Cdd/Bz1FVF3JQD2CgnZXFQYsVSbGp5EWX//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhV5pZU1ZpCho63/VsNyuPlp5eR8q3Qx50F4hklB/Io=;
 b=k5HzFkDmmwmnsmcF/cOFoKHWtBw4gawm+Zwyu6loJdTn9mZTzFHNAEDrT4wxJlHi4nx4UnV8UbthnKJIDTw/uqMGZA0Df8sz0BzySGMlxut5cR3luMKYVzF4RdXON5KA0ZfEsZ9ocwZt49YQUCA6C6fl9GI+y5aQsYOHEIZ6UedBaLZgYJ3bSWX2jXyiKl/tPYEeU/l7O4SjSpySJnlgTT3KnXYjLCS4Udo2saV33qZLqbqunCT7yKWSojkspOy79VQ4rdJrf7riYJMOM0JovvA1Pf5icve8segH9OcxiqXiwJEROkUXs6MfYoZpEH9rzdQE23sf7RoljB/Zj7NH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=davemloft.net smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhV5pZU1ZpCho63/VsNyuPlp5eR8q3Qx50F4hklB/Io=;
 b=pxr9sAKwZA1VGUxSKGpZgjiOHPGieuE1YCwcoSQ8y6BYIJpWlR8CTD9710TMr2grRKx/HeVKJjf0ir06OefUbjAMLP6Ch0hLo2MHLx3aFcA0JXQeXWUbW1ci6lvrNVN07A8Wu/fFzrLyzSShKwxkN5jjICTObrPB+r26bt4qU0c=
Received: from SN7P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::28)
 by CO6PR10MB5635.namprd10.prod.outlook.com (2603:10b6:303:14a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 06:06:39 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::44) by SN7P220CA0023.outlook.office365.com
 (2603:10b6:806:123::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 06:06:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 06:06:37 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 01:06:37 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 01:06:36 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 01:06:36 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64C66aVO2904985;
	Tue, 12 May 2026 01:06:36 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 64C66ZYj031935;
	Tue, 12 May 2026 01:06:36 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, MD Danish Anwar
	<danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>, "Meghana
 Malladi" <m-malladi@ti.com>, David Carlier <devnexen@gmail.com>, Kevin Hao
	<haokexin@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net-next 1/2] net: ti: icssg: Derive stats array lengths from ARRAY_SIZE
Date: Tue, 12 May 2026 11:36:26 +0530
Message-ID: <20260512060627.3781329-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512060627.3781329-1-danishanwar@ti.com>
References: <20260512060627.3781329-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|CO6PR10MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e1e2ce6-9e52-476f-4a67-08deafeca095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|22082099003|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info: kL0mPGLxqAAMOxULR5TTfnztJGNYRVEjVVAlGLaDiJfpo+ZUDyGk8LX9OFSLRUyM8TESFrfgOuhGdXj7ozQgJw1RDPRh7WIbf1fT7Xjext3+kcK47/hkq497oOS08bIV6gxGLMeaOopfrYjjarmBzMPTwMQQGvTlLHV11lvzJWZo+dMrX73kmzKa+y3qGumtPsg6egnIHwwpzlWZKm05NDvaqgMa85fif+e94s6qs41viHLvkRgA2enbgPC05+VxLRJona+f/t5FGLPl3ZaYCsK7CkS51aEqwQa+hTOQKgCHnKnYSNTMpAeyAjt/VHIvK0esaXFZZy81RPExpSMHWltLmLCC+q0SCepx7T7ahAxgp6etlqkfxylq954iPoeyzrgd88TB6CiaNVonAAD3AaKb3HBQiqkVD6UfJRXs0T67qFVlXJtYebky+PRqS6g+QeBbdVLL7Gw8NX5Gu/6Y60c/wKWYJ4lm8BOMKGLlFeRIXSocgardXuf7ywdDlvph5c8V0SevfE2HolYUmP9AGLxoIkENWNiHAXHjyMmPFt1JMUdYEIcFHwfJ6YUv3T7T4LiNieziQ5OK4B4VECQDDlYYw86mqHO2E8nGpK4EGu1DjcUFgeyty2ij7fCvoM4c62d2m/tlupf4MykUdrO/9Ipahqg6u6OaA+o/mkaNIsiOTcfge7AUbU15gB7CNOLtQZleRrknZb7Udex514HxhJ73uQuBT1jHVZBqM0gvLzyP0XiRulLS/J1Lx2UNGOmYSfgMrES0ILOx+s5WC1KNew==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: djaagVge4xpEjQCHjLm9PurYKU/Aiad61asaSu/cAVgta0rz9GOFCZU67G6j7STX83g6thehFpZjtN4IjTa9Tul7/bcLKGAIX9ekg82wKVSfdA92DRGcUQi+YCq6n7CbkuLuO4Mw3XQes29VDu4+60vzEwGt8plyZSlZYyl4+wJgQOxK0IHgAEQa3gykThhQ6r8IQrnBRFCpLAJSwNmHVVzWlZujj0F+SdmKFC+1ss3ovDwI3CBMc7mduzhsxj8fA4YCAxpHoQx4/suarrx668qN2OeJeSf77i6dMS0mEaHpoVGhKdrb596qUg6FIIVj8rV0YKDFDooQeRFjv7sJgAEMth1Xhu2vidoo5kJ5ZesFCOh1FNiMU5+t/lmLVoZ4s4xm8DjkFjaPSLZDCfMAUQF8Vg31vh1p15dNOZzvPm+UXp7/ywSbRwMaGAkEWyab
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:06:37.3736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e1e2ce6-9e52-476f-4a67-08deafeca095
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_230643_529962_165E4ED5 
X-CRM114-Status: GOOD (  13.86  )
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

Replace the manually maintained ICSSG_NUM_MIIG_STATS and
ICSSG_NUM_PA_STATS constants with ARRAY_SIZE() expressions derived
directly from the corresponding stat descriptor arrays, so that adding
new entries to icssg_all_miig_stats[] or icssg_all_pa_stats[] no longer
requires a separate update to a numeric constant.

To make this self-contained, break the circular include dependency
between icssg_stats.h and icssg_prueth.h:

  - icssg_stats.h previously included icssg_prueth.h (transitively
    pulling in icssg_switch_map.h and ETH_GSTRING_LEN).  Replace that
    with direct includes of <linux/ethtool.h>, <linux/kernel.h> and
    "icssg_switch_map.h".

  - icssg_prueth.h now includes icssg_stats.h, giving it access to
    the ARRAY_SIZE-based ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS
    before they are used in the prueth_emac struct and ICSSG_NUM_STATS.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth.h | 3 +--
 drivers/net/ethernet/ti/icssg/icssg_stats.h  | 7 ++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index df93d15c5b78..e2ccecb0a0dd 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -43,6 +43,7 @@
 
 #include "icssg_config.h"
 #include "icss_iep.h"
+#include "icssg_stats.h"
 #include "icssg_switch_map.h"
 
 #define PRUETH_MAX_MTU          (2000 - ETH_HLEN - ETH_FCS_LEN)
@@ -57,8 +58,6 @@
 
 #define ICSSG_MAX_RFLOWS	8	/* per slice */
 
-#define ICSSG_NUM_PA_STATS	32
-#define ICSSG_NUM_MIIG_STATS	60
 /* Number of ICSSG related stats */
 #define ICSSG_NUM_STATS (ICSSG_NUM_MIIG_STATS + ICSSG_NUM_PA_STATS)
 #define ICSSG_NUM_STANDARD_STATS 31
diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
index 5ec0b38e0c67..b854eb587c1e 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
@@ -8,10 +8,15 @@
 #ifndef __NET_TI_ICSSG_STATS_H
 #define __NET_TI_ICSSG_STATS_H
 
-#include "icssg_prueth.h"
+#include <linux/ethtool.h>
+#include <linux/kernel.h>
+#include "icssg_switch_map.h"
 
 #define STATS_TIME_LIMIT_1G_MS    25000    /* 25 seconds @ 1G */
 
+#define ICSSG_NUM_MIIG_STATS	ARRAY_SIZE(icssg_all_miig_stats)
+#define ICSSG_NUM_PA_STATS	ARRAY_SIZE(icssg_all_pa_stats)
+
 struct miig_stats_regs {
 	/* Rx */
 	u32 rx_packets;
-- 
2.34.1


