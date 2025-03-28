Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C10AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2fyyslEH42du+dba92RsnS5u2wD2cNErCJYqvVHUdY=; b=UMI5isJqAN2DfnctYFhoMyQOJl
	tHMdOZYeWpAxwVAER06Q4eyp9J9ogVgVepts8OVBQdyYrIYiqYxKHA1OTc5m8Hv6Dlvw8gXvXj/p/
	k6our9x3JBmmu0c/8+Fs+cw2Tr0bee3V+jRMKLMXL34IUTmBruQj5YOOiTj9re7rUVlsJpIg4J2nV
	C8Luw2909+IsrnThJ+CI8gtpAblKBJHtXg2xTrvMWKMcVvBZLUCJiKRAidPDI+/asTV+i2cet1crR
	3OG1S7KSqULqPs6bGWuDjceu8hP8sH1PMvPkX5xO1h18CnRdJBDn0zM/X/kG1NH8yAdghxFcRfLg3
	P5ikxrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty70N-0000000D8uO-3xVj;
	Fri, 28 Mar 2025 10:32:03 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6tO-0000000D7Uh-2zpw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:24:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52SAOE3g2096882
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 28 Mar 2025 05:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743157454;
	bh=/2fyyslEH42du+dba92RsnS5u2wD2cNErCJYqvVHUdY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CTqGd2zy5ZqBynCWQyzVJo1o/DmKcCtjbnX3UT7Qz6vX3aqUY+Mk9eNc6IOxo/JD4
	 ZWm0GpkBv65zGg8+mylN/PuSxope1AoQsBreMyr9X5YogCzdPtuhMgLMF9MVOLWKOC
	 ywva6nKg62zgYGMyTARjUO8BwBYXpQWjt7HYdVM0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SAOESF079362;
	Fri, 28 Mar 2025 05:24:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 05:24:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 05:24:13 -0500
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52SAODhZ101879;
	Fri, 28 Mar 2025 05:24:13 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 52SAOCgn024937;
	Fri, 28 Mar 2025 05:24:13 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <dan.carpenter@linaro.org>, <pabeni@redhat.com>, <kuba@kernel.org>,
        <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <namcao@linutronix.de>, <javier.carrasco.cruz@gmail.com>,
        <diogo.ivo@siemens.com>, <horms@kernel.org>,
        <jacob.e.keller@intel.com>, <m-malladi@ti.com>,
        <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
        <ast@kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v3 2/3] net: ti: icssg-prueth: Fix possible NULL pointer dereference inside emac_xmit_xdp_frame()
Date: Fri, 28 Mar 2025 15:54:02 +0530
Message-ID: <20250328102403.2626974-3-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328102403.2626974-1-m-malladi@ti.com>
References: <20250328102403.2626974-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032450_850858_D49B8A8C 
X-CRM114-Status: GOOD (  15.63  )
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

There is an error check inside emac_xmit_xdp_frame() function which
is called when the driver wants to transmit XDP frame, to check if
the allocated tx descriptor is NULL, if true to exit and return
ICSSG_XDP_CONSUMED implying failure in transmission.

In this case trying to free a descriptor which is NULL will result
in kernel crash due to NULL pointer dereference. Fix this error handling
and increase netdev tx_dropped stats in the caller of this function
if the function returns ICSSG_XDP_CONSUMED.

Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/70d8dd76-0c76-42fc-8611-9884937c82f5@stanley.mountain/
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---

Changes from v2(v3-v2):
- Add Reported-by tag and link to the bug reported by Dan Carpenter <dan.carpenter@linaro.org>

 drivers/net/ethernet/ti/icssg/icssg_common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 3c0ea9044e18..15c092a923d7 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -583,7 +583,7 @@ u32 emac_xmit_xdp_frame(struct prueth_emac *emac,
 	first_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
 	if (!first_desc) {
 		netdev_dbg(ndev, "xdp tx: failed to allocate descriptor\n");
-		goto drop_free_descs;	/* drop */
+		return ICSSG_XDP_CONSUMED;	/* drop */
 	}
 
 	if (page) { /* already DMA mapped by page_pool */
@@ -671,8 +671,10 @@ static u32 emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
 
 		q_idx = smp_processor_id() % emac->tx_ch_num;
 		result = emac_xmit_xdp_frame(emac, xdpf, page, q_idx);
-		if (result == ICSSG_XDP_CONSUMED)
+		if (result == ICSSG_XDP_CONSUMED) {
+			ndev->stats.tx_dropped++;
 			goto drop;
+		}
 
 		dev_sw_netstats_rx_add(ndev, xdpf->len);
 		return result;
-- 
2.43.0


