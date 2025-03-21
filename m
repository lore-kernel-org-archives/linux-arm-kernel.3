Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637A4C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPcqz3zgaVT4xyh7yJnKcfMahOu64DyRAGZO/Z934DQ=; b=CAa3UJ+8+zGryyhUHSG93n70MD
	t7IXeMMdp5CUqbcNprympQqA6AxknGry73N8ijmgvyGC4CdaY88Wc0PRiqCO241LQBTvNRXmDb6I0
	r2OP6lVpO6JerYvsoMkuQ6JYicPCzejLX1VWpHRTRmpV+Qc82X6Wt3FxST5lwAup3stxlOW6ytGtT
	1lQE/92FO7bgdO4+ZHWHLqLTk46D2BABBlDBVlGlCN6lBt1wHCflKnst9W+RLo6BtS9CiIlDVGH7e
	rarm4XdhRCC/WKVnr9+QIjH3n6vVx3M0Jq6tovzUvEmgn0Y/IS1B0DyUdXth/em7586XrmQVY055B
	EALZMeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXY7-0000000EEFg-407l;
	Fri, 21 Mar 2025 08:16:15 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXVf-0000000EDVa-2hJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 08:13:45 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52L8DMhl262195
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 21 Mar 2025 03:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742544802;
	bh=HPcqz3zgaVT4xyh7yJnKcfMahOu64DyRAGZO/Z934DQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jesHHUWwO0kkYw46DL4xIzHw1Rq0bd1607wbjLnfQUW4iPx4uRbMHsIZrR+o6qMcG
	 nNTzKSQbhcCSSuockmSKqjgC+i7BDsntcM90x/0+9D53OiHYmbLyuXhHhnX1/15qay
	 Ys67aI8lk4Q9cDDElvF39pjasjSMLF73miHdiZ0U=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52L8DMbS127576;
	Fri, 21 Mar 2025 03:13:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Mar 2025 03:13:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Mar 2025 03:13:21 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52L8DL5R130181;
	Fri, 21 Mar 2025 03:13:21 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52L8DKvx032428;
	Fri, 21 Mar 2025 03:13:21 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kory.maincent@bootlin.com>, <dan.carpenter@linaro.org>,
        <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
        <jacob.e.keller@intel.com>, <horms@kernel.org>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger
 Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net-next v2 1/3] net: ti: prueth: Fix kernel warning while bringing down network interface
Date: Fri, 21 Mar 2025 13:43:11 +0530
Message-ID: <20250321081313.37112-2-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321081313.37112-1-m-malladi@ti.com>
References: <20250321081313.37112-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_011343_768941_553E88EF 
X-CRM114-Status: GOOD (  11.60  )
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

During network interface initialization, the NIC driver needs to register
its Rx queue with the XDP, to ensure the incoming XDP buffer carries a
pointer reference to this info and is stored inside xdp_rxq_info.

While this struct isn't tied to XDP prog, if there are any changes in
Rx queue, the NIC driver needs to stop the Rx queue by unregistering
with XDP before purging and reallocating memory. Drop page_pool destroy
during Rx channel reset as this is already handled by XDP during
xdp_rxq_info_unreg (Rx queue unregister), failing to do will cause the
following warning:

warning logs: https://gist.github.com/MeghanaMalladiTI/eb627e5dc8de24e42d7d46572c13e576

Fixes: 46eeb90f03e0 ("net: ti: icssg-prueth: Use page_pool API for RX buffer allocation")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---

Changes from v1(v2-v1):
- Included more trace logs for the warning
- Collected RB tag from Simon Horman <horms@kernel.org>

 drivers/net/ethernet/ti/icssg/icssg_common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index df5da7a98abf..afa01c22dee8 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1216,9 +1216,6 @@ void prueth_reset_rx_chan(struct prueth_rx_chn *chn,
 					  prueth_rx_cleanup, !!i);
 	if (disable)
 		k3_udma_glue_disable_rx_chn(chn->rx_chn);
-
-	page_pool_destroy(chn->pg_pool);
-	chn->pg_pool = NULL;
 }
 EXPORT_SYMBOL_GPL(prueth_reset_rx_chan);
 
-- 
2.43.0


