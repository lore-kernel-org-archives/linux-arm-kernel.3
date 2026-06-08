Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD3DCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAc1xAuqrqBbaNGTCiUioRckoU10tWBV0WzMjQokYxU=; b=vYWg1KLVH5IKOEuAO6rqt9Kqwj
	q3b2lGXR6O1eBv5SySiKsXObpbXWmoFLVSPX2Mzb7rWBL5AmXDupaP+V26W8yvI2uF8JvkLtGLW9w
	pYa5vB1A+KW//P6q6b2K/1EGDXXNpM/6v5QiDR2o3k6zKk8NwfmdSc28OGxxvcQ6ciptpQoHCmrA8
	7mbXaGbEqoNKKhZHeKNATwkl6fE00UybPu5owWCcuYxkKXi/etNYTMd2rt7r0Kg81NIcZ58LMEtX4
	UWFpYjzRF2fu0l/A6QD5dRI1RGBafBnC8nZ9hDC+wCMn6/DZ8m0tuwKaY0aIaPo7565U5ETbcAZ9x
	y39yoAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvY-00000003Hm5-3vIw;
	Mon, 08 Jun 2026 10:09:52 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvU-00000003HeQ-2nOJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lP0I553QoX9iYlRB+9JOpDW6EPftwRBzpw6crKrwGH3bKUPrdgu9vup+XV+/wge+gyx99/UKex3t76VXHpGsjYOGEgMltYIeFUC5RAACvu/D1pHpFyVpt7GhYVvPO2bRMnqiBCoAPi+io/N6nmP+Xjmxe4/8wS0lBbP3ZpoK/BLPCmZV5Jrl4hBb5aP1thUv6zSg8iOWIftLOC90Q4zN9WYy1lGzEv6isXQ02AumfDpNNc+xogK6RKBmj8cWlsK1oT239y8Cm+5XOVhB5IT99TG6tX7ONaSjp2E0UueDfS/WBCIRKelG0TTAYjk4d+40kaDF3/KCOvb34d548frBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAc1xAuqrqBbaNGTCiUioRckoU10tWBV0WzMjQokYxU=;
 b=qxHsJW5903riVbIg0q6zZAo6dvGxd+V/6olA9XPGAYe8yjJOtlV31qpgQH/hEAybTtSwDuGDxmcrU65q0DMEadUaHHziXiQ9Xs2A04jLAi8SeNUDc5izsDS4KxfzTEZFUnWJGyMBEqoDdJwcQZ3FXcPwUh5meceuT7KHFkmWp1r5b+TBHmEgkPnGSC20Pr0qu+K/+Gwms1+huHjGuYuDinCGStXaOkazxz2Qp/tTjCqNR+rNh6SnCcb/RJbRSqjYybNE6CPPLg4ZQ7vOQwOjcGhRqbp80KA9Kp0jPd3TO7dctJgaQ7X9SbaTZqsFSB0+4QNmQ/Y3GC+cZnWXvvh9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=davemloft.net smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAc1xAuqrqBbaNGTCiUioRckoU10tWBV0WzMjQokYxU=;
 b=BmnD7u0jHmvqBWGjxfHctVIU2TDb7Anq+VdokmtzRIpAc6/S5wodF98WNhcg69Mg/r2tA3OidBx1K7rvjHWYd4e1UUNwA+tjowCr8H09s4a5hXLW9ZzPk1/0OFKCMASCZuq7DuKrWXwOK3z+B032yF2tqWVTnqCaI/EGFpuju1M=
Received: from SA9PR13CA0093.namprd13.prod.outlook.com (2603:10b6:806:24::8)
 by PH7PR10MB7765.namprd10.prod.outlook.com (2603:10b6:510:308::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:09:43 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:24:cafe::74) by SA9PR13CA0093.outlook.office365.com
 (2603:10b6:806:24::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7 via Frontend Transport; Mon, 8
 Jun 2026 10:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 10:09:41 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 05:09:39 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 05:09:38 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 05:09:38 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658A9cEn3995727;
	Mon, 8 Jun 2026 05:09:38 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 658A9b1v015195;
	Mon, 8 Jun 2026 05:09:38 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, MD Danish Anwar
	<danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>, "Meghana
 Malladi" <m-malladi@ti.com>, David Carlier <devnexen@gmail.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
	Himanshu Mittal <h-mittal1@ti.com>, Hangbin Liu <liuhangbin@gmail.com>,
	Markus Elfring <elfring@users.sourceforge.net>, Fernando Fernandez Mancera
	<fmancera@suse.de>, Jan Vaclav <jvaclav@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH net-next v3 2/3] net: ti: icssg: Add static_assert to guard stat array counts
Date: Mon, 8 Jun 2026 15:39:29 +0530
Message-ID: <20260608100930.210149-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608100930.210149-1-danishanwar@ti.com>
References: <20260608100930.210149-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|PH7PR10MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: a26eec06-01ee-44fd-06b1-08dec5460ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|18002099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info: fo/6OvJnmCOP/s5YB5rQZ6aPY+TlAzmpYzo0nZemT/5SlpTTDxrwAgjq4D5IS3lzKKzV4glQ8QX8pRAGGn5VXida8V7y2vfOqbMLpAed7de1xStZV339Hq0Db0WJk8LXyLs9pnMupCQH6JnlfH6Mlx5nyJH16ElL4SiyBQsgaatFBNJXjWnygsOKFqGfXyGrJdd749InOwsOH/7F+M0V/4rWm2tk+R6Xq+yGCcJbNMAQVjJu3vzoFCmqHsLsan1qlx9jaZ5HFzezAoxE3h3gbA1UCdrGlDMOs3r1ZVbmzQBHRfjIQzIGhAcfHUnwAvSNChTeHWSWUn4XnbY3djSpv0X2ve/TUqMryGVz4zsepZ0IQ+1aGjYHYRHTbQz6LlrJltQaRoumUWYlzu/kMMcXkAQZw890fgOrPvY0fCc/zvEF6Gc1OUDQePugU4ddmPl5Bo4xKlDydnisgEGkjXeVstaCMm28kpS32NwedbtsKgCim6JbbmlHh/zECFTrKSfJJjzxqBq9uwzv3tQ7xy3aopA50a6lHYMEbvDnbRlGn/paeChd/6mNMAdgn09Rf4UmxYs4jp4xCLJcKnbrph5ehXGjLhcS/3QOPgPtv+vGEbrh76gwQ8tbXav+bZ2yMdA4fHU7/WtoMB7TGJHjiokA/s8uXORjmngY3uCeM/qVQx0AbL3PU16pmfZIxzoSttbkiJRV5FwkL2P/bxv6Vj2L+CBltDvbbFCaQD2lFHUPmjQ9FOWQv1y4RPkrkIqO0lGnqCmTQUqgNg9No+ba8/nc/w==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(18002099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: id5aPVzBbLHi3KDSA5Klu+LgAX5wdcqa92P+k+ejjnX+ROaTXsT3zJFlfe1D6OCfORFXDIrC0Wn2HfRMQK8hKUhrRe6TmO9zHwoDxipfpcehi2rHTr8hJgIFVmHcnU1e6P4rtdl1YrrZZFBopgvOSq1zDwCYnv/1IlTWZevsLeSfWz2arSL6DCny9E+4D73hDUWuq0Z3XFZQvj+BNWTNw1tcdSnSAuegoE++yx/hJYx/liJF2l1nIgBywIBKvZ3/ZnIy6vJuJ0uPDwxj6O0egRcn80EYAwq8YWJSIMp1n2DepGBD8QrxQzEIas5/jbtV9NJiRu24PZ7rKGwFAf6sy7Ethq6Phd/UW1H6phDMVzqyWJXYm9hGBduba3jotGB1ZxlTW8yQvSgPgiXgWkyLvODbhG6Y9XrlTcOobEdkUMOpV481KWpTqEVTj7qvGvAc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:09:41.6266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a26eec06-01ee-44fd-06b1-08dec5460ea2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030948_726072_D3BAC501 
X-CRM114-Status: GOOD (  10.70  )
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

Place static_assert() immediately after each of icssg_all_miig_stats[]
and icssg_all_pa_stats[] in icssg_stats.h to verify at build time that
ICSSG_NUM_MIIG_STATS and ICSSG_NUM_PA_STATS stay in sync with the
actual array sizes. This turns a silent miscount into a build error
should either the constant or the array be updated independently.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 drivers/net/ethernet/ti/icssg/icssg_stats.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.h b/drivers/net/ethernet/ti/icssg/icssg_stats.h
index 5ec0b38e0c67d..6f4400d8a0f61 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_stats.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_stats.h
@@ -155,6 +155,8 @@ static const struct icssg_miig_stats icssg_all_miig_stats[] = {
 	ICSSG_MIIG_STATS(tx_bytes, true),
 };
 
+static_assert(ARRAY_SIZE(icssg_all_miig_stats) == ICSSG_NUM_MIIG_STATS);
+
 #define ICSSG_PA_STATS(field)	\
 {				\
 	#field,			\
@@ -201,4 +203,6 @@ static const struct icssg_pa_stats icssg_all_pa_stats[] = {
 	ICSSG_PA_STATS(FW_HOST_EGRESS_Q_EXP_OVERFLOW),
 };
 
+static_assert(ARRAY_SIZE(icssg_all_pa_stats) == ICSSG_NUM_PA_STATS);
+
 #endif /* __NET_TI_ICSSG_STATS_H */
-- 
2.34.1


