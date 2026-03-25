Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790E2106B522
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaLd3noC1m0odAgHvpZLJsyfA3soJoMeXPEBYzc2PRg=; b=t3HQjqdwOpe3hB1Z0TQ3OuznQY
	TrBh80uU+uTDOpPcno/NdC/tgN1S9mcvqGMJlDEpdt9izJnOjkHihroN4/1C9yTpvu8+FaN0beuE6
	8OlLJtYvUEfFL5Ne1TNLNvRP0KgNCeq+ruho2nQWTXytfki0d/Zrq9oyki3MpJv1c322LIkY8dxaR
	cbZbI+WVeG3CzFtIlDv9YrAF+tWAMNNimmGb5tL+xhGB8z18UpeDOhS0X0rGpiea4ObLa41ruxWpx
	ABPcUDfP4NKAVfuXpZD11b8Pdqx1r/k8IUFOz3U2TyGt8PplJQ4L9aBUuxNYn+2FP34Kz6DwtIfWf
	LTO9xUXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NU0-00000003NYH-0HEd;
	Wed, 25 Mar 2026 12:37:12 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NTx-00000003NWm-2GZc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjzDl/tUNXlt2+5z1Dq6dxHBdhmdcc7JKHGbnFZjzcjS+eRIXSEZCKB770TYruzA3ecapWrMgjmWeTHry1grhqVOSH/3LfOI2UKv+cLM1loDLDA4RZQvG+F4oFwa0qWbUCxQUpog9bshaFSTvPF1oMAWegaZVBYKKWdCVFK8q1/hLlOIryj8lqkLxp1jVku8RVtWWX0IwjCaOsTx1ebT1j3d44rdGATuO/F2Js4uikmL4AqufZk7dGd9SdbdIYr17twGVzMpAa5ultHuXW8NHGYIDimm9ZjAMt93vsknUpcA7XNuesgV/yyhpuPIHILt7lK8G49+Jtwox/sASRWqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaLd3noC1m0odAgHvpZLJsyfA3soJoMeXPEBYzc2PRg=;
 b=mtIWh6WQEY5uH4SLbVFb56WbahBxWkS7fwhSibX/zyyo4VmS+cHbDB95Y19p99x7N1Wvy39VmpAg31O92hD8Gkenggv7+LgdMH3tR6TZxApldU/EIYW3HFs6pU6zhPRcgFuosl3Ub/hM0k51N8jAOS5LI/T4choKJ267Lh6XcBh7+aDBAsL59zNzWZ6lr1Z6cZ7yFRsXi1BRIReqOVZergxDg+5RnbsaseK3B6/PF4Lqz6ThOBIW69Vgm9zgchxILyokIvVTIGADLoj86UexYhHLO6EuIv0fqYaU3DIrPk42RkfqBwO3ab/TZnKAFGrwECatvjvv/uukFY8AXwe+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaLd3noC1m0odAgHvpZLJsyfA3soJoMeXPEBYzc2PRg=;
 b=byigq5vNHnhUUzxMR/EqDQyqc3SbSTjCFTWe/wtf7TrjOANutwS/SWTqHD4Rc/bbqDtqvWaTuiZ/H/JhhqD4JJCWGqiEIqOiO5iO8CQ/Dj8/WNtFfodJgAmTARtlpp++C0kFWFngy2M/6u7a/9rQQ2iy1GWCXfHNGT118klLcx0=
Received: from BL1PR13CA0263.namprd13.prod.outlook.com (2603:10b6:208:2ba::28)
 by SJ2PR10MB6991.namprd10.prod.outlook.com (2603:10b6:a03:4ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Wed, 25 Mar
 2026 12:37:01 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:2ba:cafe::ea) by BL1PR13CA0263.outlook.office365.com
 (2603:10b6:208:2ba::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 12:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 12:36:59 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 07:36:58 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 07:36:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 07:36:57 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PCakEW270453;
	Wed, 25 Mar 2026 07:36:52 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <Frank.Li@kernel.org>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <nm@ti.com>, <ssantosh@kernel.org>,
	<horms@kernel.org>, <c-vankar@ti.com>, <mwalle@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<danishanwar@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [RFC PATCH 1/6] soc: ti: k3-ringacc: Add helper to get realtime count of free elements
Date: Wed, 25 Mar 2026 18:08:37 +0530
Message-ID: <20260325123850.638748-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260325123850.638748-1-s-vadapalli@ti.com>
References: <20260325123850.638748-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|SJ2PR10MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: cea87195-dbd6-48d4-b058-08de8a6b359c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: V4vL4cyySgdTnRucf8UXonUldGqKv44lBtE5vUSxOY2WZsOmgdViulkNXF3traRhmeoR/mLAWNaGltXyf6qhA4t4TNx/Nvw0hJwfNdF052UT2VLA8UX/34l8YW9ia0X1f9r6Gc3CC2GhkMBL5T6/ExzBCABBvYUSKU9+VsF8tkHdyDQG6rjgbTzoGduCg4SgV9S/74zgflJhaQixWhklAgnl8FsWKx7tPta0sebc+/lB0jAOPepHh/YOniV8ng20wEDhX1YZjO7wg8RET5Vbw+t2wjIQ9+972M87DrZ6tTa2DGYk6sJPOqN69SpKZNzfIUIJVCzWteybB1G9ErtwAdKwXpYc+2zdr0UCKSIxp6kjZck+6Wx0tbk/uODU5srGEl+OnaW3hFk/Q3gVDKj+FbdjlLDudGVafeBniK0cJwIyArBkEjNG76fYTMLgRcOdCHugfdlY4E935C7a7sy+/R+xweP35SGuz7DLdoRNryKiwcln4cZ2iMJKw1HFOO/mjsnQQUGEbFSOicvCJTSc5I8eaDRsIxci5NwdieiGmUNrd6yILtTxwXmvbs8gG8BDcz4IdV5CGBnxnFeAT0pxMl3Cm9fgFeQqKL9Yht25kgmxJ0HjLJlXpNyGdLcyXmRjyRmIJwILuAQIWoewCmVdCi+YCh68dV24PekKc8dIJXRzwCwgIVTZw9mWkYrOFDVKJfVCPhONOBqI7m1fRzoNEQXDiFXP4cZkisKOXb7Kkz4nn+sD0vN3n/mqy/3QRSS50TRK0MMjEiqoi8JGQ8HjGE9dx9weJaTkyJuqJ03cAsEArNX0zOxDEh+IIXfSktMj
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: R5syc9Q9G9uGzULv3hWQ/EISBEmR9xxEG8zHiAvuEAiEv38+uAS3r+ErbHklbyPuk3tVCas3hnlMnPxFoOlOuZH+xmljnC8/vp+m7YTu1ECEkrSnoAiFXywft8pwObcLfgRPpbuA8+O3XdRxs+YTrdtjJBsFBG4AYTkttuLr72mc1FZV8VUCXksoPUbx0tSGw3SDlts3HCjLiCdbpdnkkHS3gYmaLLXFpBOiF2MvAL99UGokgHu8aye2lhUuQwotlWRZx3rthY2Nqh6PUYiigPlaxCXxhE4w/DPKlVJAhO+pRvNUM2pJTgiFNA2yhUknLPp8kQEJqqMP8P8Oicn5jm5UZkNgxduwuEfdz46Sk+kzIGXoVUawIaDww21QWa41qBYKCbFAk09LZrUjTR09xrZTS8KjdeaHkQn3JzPlY2KVsYBaNCa39ut8QF5lSqrd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:36:59.7678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea87195-dbd6-48d4-b058-08de8a6b359c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_053709_585741_8608AD72 
X-CRM114-Status: GOOD (  10.56  )
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

The existing helper k3_ringacc_ring_get_free() updates the count of free
elements only when the software maintained counter decrements to zero.
As a result, for batch processing, we may read a lower count of free
elements than the actual count. To address this, introduce a new helper
that provides realtime count of free elements.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 11 +++++++++++
 include/linux/soc/ti/k3-ringacc.h |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 7602b8a909b0..1751d42ee2d3 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -905,6 +905,17 @@ u32 k3_ringacc_ring_get_free(struct k3_ring *ring)
 }
 EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_free);
 
+u32 k3_ringacc_ring_get_rt_free(struct k3_ring *ring)
+{
+	if (!ring || !(ring->flags & K3_RING_FLAG_BUSY))
+		return -EINVAL;
+
+	ring->state.free = ring->size - k3_ringacc_ring_read_occ(ring);
+
+	return ring->state.free;
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_rt_free);
+
 u32 k3_ringacc_ring_get_occ(struct k3_ring *ring)
 {
 	if (!ring || !(ring->flags & K3_RING_FLAG_BUSY))
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b92598..091cf551932d 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -184,6 +184,14 @@ u32 k3_ringacc_ring_get_size(struct k3_ring *ring);
  */
 u32 k3_ringacc_ring_get_free(struct k3_ring *ring);
 
+/**
+ * k3_ringacc_ring_get_rt_free - get realtime value of free elements
+ * @ring: pointer on ring
+ *
+ * Returns realtime count of free elements in the ring.
+ */
+u32 k3_ringacc_ring_get_rt_free(struct k3_ring *ring);
+
 /**
  * k3_ringacc_ring_get_occ - get ring occupancy
  * @ring: pointer on ring
-- 
2.51.1


