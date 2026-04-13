Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB35EBFD04
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o8vi2XvuWsUXS14e2c2BRo4eE23R7SK/MQ3LDkwDdCI=; b=ji2IZSVFVXms/tZ9ck4IWfU/+c
	lf+7BxFVnapzkDVPzkI1mVypqnJpbMp9KRUY9eWNDZULq+cflN1+8aEBcGWL84wrri5Kro0jWS0dE
	T1a83zQZBB8R8xb3ueWura1g52U1ky24BQbgzNAkym54JWRIm332KmEB3T73gnyWOOFfpst1otCnE
	kXmRKjLeiVq37o/t4KaEzUjdAij9u+f74OHWS97AlLHSWl7xHvUNBGAwa0vDMpa9af/0PZwvIw+Ly
	N8nyOrxkvT1VKM/QchNqsWIjbiV22doekfi4cDaaXy7asVr/qGTcJH48D1NEyWvWwS2KRxQi8YL3E
	AjFUiRrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB6u-0000000F5xt-0OGU;
	Mon, 13 Apr 2026 06:49:28 +0000
Received: from mail-northcentralusazon11010016.outbound.protection.outlook.com ([52.101.193.16] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB6r-0000000F5ws-0zuI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 06:49:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgAgCzAs46xgL//oylh5s8nf1fymP5Cr+FY7xrdMrQNeg5L71dLxU5OXshpuPcnuHIdZKpO7Q8hUg+V/c65WJtPRze+TsHNgRg+r9ryYRmuxqmTF16oPcmBStw8sYqcQIZoMJeo3tD8rMuP1qtiwLStYDZP/WZVcucKX/2eXM+bYokCbd35n0TI8b6DMYuesMCG9qGSbD11/BV1pEqeYKkhWUgbdhXBvUnVbDwhX2FeQ4e0Jkd1kxKr2uIuw/PVFm6bIokZipJDiaixk4h1xwn3xdPI9VKKNlBmOtzvZjHOoHvk0GkpwJP2+DyOjiGDaQAsHVqGODQpDFbrIIoOyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8vi2XvuWsUXS14e2c2BRo4eE23R7SK/MQ3LDkwDdCI=;
 b=L27LeY/G2w4KSuTBDi3K/Dymvq6HbijMERReUC/NoeP+QGthlJyUggMKP4pZ82HObPclyFhGzJsBSGZ+1s0z7DC75LClcj1ab75ukNjVww+2DMQOQaMZYOCS79xPWJ5gWiSTElTpuQ/jmPXu9ZSaLsAEHlRAZqBoP4Ki0aF2AvewN3sOa8LesEJJl9cPiBQs5E/t+9kOgzvDRcjbt3OwLQ9nTJJfYAuVmGK+c+dqFkzOdBwuxKgDACGZ74nnRfBxmPNYkMcYo5+41l1rvB+Ux/ElvhQFsWdLuiISNfCZ+EvWEbJiXODh3IMEnjGynGS1SMqXH3Y2UlCexArhl/eOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8vi2XvuWsUXS14e2c2BRo4eE23R7SK/MQ3LDkwDdCI=;
 b=aK6RbiWl08D2cWcF8WtXvQBMYem5YgYxKC3OMSP4/MXEHMgzwl4D+2ifOucO1tSpE3d0e6OYC4dQYlyLYNW+x9X0h0A0T9EbgKe43KtcRdVv0/XA6j8F0u9x3OCZ4Z6FQfJTjoDKpz4dO1uQq3rOiZT5Cgc/h5L3WhZ7fzMN5/I=
Received: from PH8PR02CA0009.namprd02.prod.outlook.com (2603:10b6:510:2d0::22)
 by CO1PR10MB4403.namprd10.prod.outlook.com (2603:10b6:303:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 06:49:17 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:2d0:cafe::67) by PH8PR02CA0009.outlook.office365.com
 (2603:10b6:510:2d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 06:49:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.0 via Frontend Transport; Mon, 13 Apr 2026 06:49:16 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 01:49:13 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 01:49:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Apr 2026 01:49:12 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63D6nALO1598785;
	Mon, 13 Apr 2026 01:49:11 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <ssantosh@kernel.org>
CC: <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] soc: ti: k3-ringacc: Fix access mode for k3_ringacc_ring_pop_tail_io()
Date: Mon, 13 Apr 2026 12:21:14 +0530
Message-ID: <20260413065125.627180-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|CO1PR10MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e7ddf2-3c37-453f-9286-08de9928c803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ijL/G6eOfrJOCKV6A/Lc0wOcEHrHrLEIryXR3+fwDEOBp5zJdMcNoufUp+DWus/GJloXNeIgpVivgrO/4ppnUxwZjlR992DURjedk5qoboAY60A7d2ciHJQclEgd9k4YYRrlxM8x4NM2LNjQkL/7UYiE7uzlSuKepMtBrakZ+z9WQf3ZmqyOCQbzCZr8vfKCUylrfPPkGfowYeVoMJhgifOvs/3n4hMQDcQ9mUVmYjQbMrmCnIUhcU5t8hyzTHW/KP+RiU1yk8yANCgAufhahxC0Rwt+Ae2Y7yGnhNv+fsdAv80E/UvH4H5hJjTQiQs5bVUViR0bP3adXtTHJcQqVZn4v6WhAt0Yb+S5JZ/7ZguUi4zhXapFrOnav+ds6RjQje36bG7UAeHDXclV44M08mmZ2Sw1yVSgh2fuqZWSPxUj25wr8ypXbyIlQ5/Wjo5pdOe+TsLzE50iwHeUtefco5BAGssINmYPq8Yjx5ka/C1g9a+yUXtEy2Kz99f8tMTbKGw0zO6Mwp4O0ksC+7Z47YGnJKNrsPRItv0Tblwz5ymatUyZ3MDEKEG59PNBmf3LwVt77E857CeMvNIc4dhby6bDiajmpCIW+Rqm38tWl3x9tGG0WgXY9MB68Vka7cZtazt2tdDwWyah1qP4JlMeF6j/DjMZzk/LhHfo+E5/mtu9lSDv7YWbvlC8PluQCigWz8Muzs35/NM+iclXLD89l+HN9iO2zydk5/vOXiHBALa47nkFl1jc19aKG8eMlSlO03JJqTo6iYyv8mr9KbzW7Q==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ECAE6eN75HzoZwo9g5tx69qalM/9rRhegknDxga3LcUxkihaLCKXcSzcAgQGV9HFR0CvEwIBg8v77xaHfr3mPo9iedJ4c/FEkTvcZxBOFbtP1sHY8qtUiE1YXwh1S7zMJKN7+btHIlCIAZZCFvExthNkf95wdNc0gXvqeS/izAdaRL75YFejQenOL9gbDjlmR/UaQcDe5fviZy7/OiIcrjrRlhBYKSQZd7kxQSuVsrcYVjMUE2lnDGmsZqJgLSjQqL96gNLntExSZEpxGg8sQSGGCfn/iq1A26+RiX3LYqP3wkUIdWBxlzl1pRgJ9KS7DzWkvZ+8n1aVgQ0CvpeUD3jl2RrSjVBeHp8HEzVROcz6QXLjyVcfBkbWuJppXx8LJjV6Re/LOMSJWomPBTBzMi3nyA4MH4cO5t1VvFZOnKqgJNNSSF+c+dkYDDAPxDeZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 06:49:16.5324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e7ddf2-3c37-453f-9286-08de9928c803
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_234925_439071_17E48BF7 
X-CRM114-Status: UNSURE (   9.81  )
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

k3_ringacc_ring_pop_tail_io() invokes k3_ringacc_ring_access_io() with the
access mode incorrectly set to K3_RINGACC_ACCESS_MODE_POP_HEAD instead of
K3_RINGACC_ACCESS_MODE_POP_TAIL. Fix this.

Fixes: 3277e8aa2504 ("soc: ti: k3: add navss ringacc driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
028ef9c96e96 Linux 7.0
of Mainline Linux.

I noticed (visually) the incorrect access mode while working on:
https://lore.kernel.org/r/20260325123850.638748-1-s-vadapalli@ti.com/

Regards,
Siddharth.

 drivers/soc/ti/k3-ringacc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 7602b8a909b0..24f658e8c1dc 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -1083,7 +1083,7 @@ static int k3_ringacc_ring_pop_io(struct k3_ring *ring, void *elem)
 static int k3_ringacc_ring_pop_tail_io(struct k3_ring *ring, void *elem)
 {
 	return k3_ringacc_ring_access_io(ring, elem,
-					 K3_RINGACC_ACCESS_MODE_POP_HEAD);
+					 K3_RINGACC_ACCESS_MODE_POP_TAIL);
 }
 
 /*
-- 
2.51.1


