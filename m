Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61209E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 08:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Bt4m09KXbqu6J6J7KVBHJ7tDcVAz605f/h9bU/fv88=; b=zHqt9pzTTjB+iBnTTWlHkx/4Ta
	+kKTIGagCxES7YvzrtbmK3PCA20lUA5kLGx4B2Qx2KZBkFlAhjoPD6MVTTf9LFD5q9a7YrQGZZXvB
	7BEDfxJpBxSlszVnHC/rRxPB9lIjV925+pMnO7Vm+wQwGJripFZJHpXS38DloxJU/ESO4sN7U1hSm
	iG9AQnlLvdZ7wTypcBiLPKyOWnEWc9F3LaUULSgJKjdXg/dSl/J3lB/Lcn9dAw+dLzAoMa7JZsOIl
	TvkC4aXDgxIpCxYlZzEwHeDbOVIiRqKJFyUS5XOm8RFCtLzgyOTC7ctxCjTrZ8rXbgxWSM9YgZl9U
	vdRkldRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXwq-00000004EGw-2b2Y;
	Fri, 20 Dec 2024 08:01:24 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOXsA-00000004Ddb-2LKM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 07:56:36 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BK7uP75131959
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 20 Dec 2024 01:56:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734681385;
	bh=2Bt4m09KXbqu6J6J7KVBHJ7tDcVAz605f/h9bU/fv88=;
	h=From:To:CC:Subject:Date;
	b=LAoiwnCaRBfMvDjpmf3HwaEo5No+5F+pLKXtPLWbM7B8xG4R7zDYcZvR/ofwC5BMz
	 IMAFle+3HuhYbeQEPAJn8sQG7TLH3hmK7f8b3Et8V0V8tcz7PKegE+aWdgZuTGSjPt
	 MEBSR1kC/5HG2cqYlpCvRUbT367PSyGd6WTWE4ig=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BK7uPa2008642;
	Fri, 20 Dec 2024 01:56:25 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 01:56:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 01:56:24 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BK7uJg3057628;
	Fri, 20 Dec 2024 01:56:20 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <rogerq@kernel.org>,
        <horms@kernel.org>, <dan.carpenter@linaro.org>, <c-vankar@ti.com>,
        <jpanis@baylibre.com>, <npitre@baylibre.com>
CC: <stable@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH net] net: ethernet: ti: am65-cpsw: default to round-robin for host port receive
Date: Fri, 20 Dec 2024 13:26:14 +0530
Message-ID: <20241220075618.228202-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_235634_885391_F37829EA 
X-CRM114-Status: GOOD (  15.03  )
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

The Host Port (i.e. CPU facing port) of CPSW receives traffic from Linux
via TX DMA Channels which are Hardware Queues consisting of traffic
categorized according to their priority. The Host Port is configured to
dequeue traffic from these Hardware Queues on the basis of priority i.e.
as long as traffic exists on a Hardware Queue of a higher priority, the
traffic on Hardware Queues of lower priority isn't dequeued. An alternate
operation is also supported wherein traffic can be dequeued by the Host
Port in a Round-Robin manner.

Until [0], the am65-cpsw driver enabled a single TX DMA Channel, due to
which, unless modified by user via "ethtool", all traffic from Linux is
transmitted on DMA Channel 0. Therefore, configuring the Host Port for
priority based dequeuing or Round-Robin operation is identical since
there is a single DMA Channel.

Since [0], all 8 TX DMA Channels are enabled by default. Additionally,
the default "tc mapping" doesn't take into account the possibility of
different traffic profiles which various users might have. This results
in traffic starvation at the Host Port due to the priority based dequeuing
which has been enabled by default since the inception of the driver. The
traffic starvation triggers NETDEV WATCHDOG timeout for all TX DMA Channels
that haven't been serviced due to the presence of traffic on the higher
priority TX DMA Channels.

Fix this by defaulting to Round-Robin dequeuing at the Host Port, which
shall ensure that traffic is dequeued from all TX DMA Channels irrespective
of the traffic profile. This will address the NETDEV WATCHDOG timeouts.
At the same time, users can still switch from Round-Robin to Priority
based dequeuing at the Host Port with the help of the "p0-rx-ptype-rrobin"
private flag of "ethtool". Users are expected to setup an appropriate
"tc mapping" that suits their traffic profile when switching to priority
based dequeuing at the Host Port.

[0] commit be397ea3473d ("net: ethernet: am65-cpsw: Set default TX channels to maximum")
Fixes: be397ea3473d ("net: ethernet: am65-cpsw: Set default TX channels to maximum")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
8faabc041a00 Merge tag 'net-6.13-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
of Mainline Linux.

Regards,
Siddharth.

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 14e1df721f2e..5465bf872734 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3551,7 +3551,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	init_completion(&common->tdown_complete);
 	common->tx_ch_num = AM65_CPSW_DEFAULT_TX_CHNS;
 	common->rx_ch_num_flows = AM65_CPSW_DEFAULT_RX_CHN_FLOWS;
-	common->pf_p0_rx_ptype_rrobin = false;
+	common->pf_p0_rx_ptype_rrobin = true;
 	common->default_vlan = 1;
 
 	common->ports = devm_kcalloc(dev, common->port_num,
-- 
2.43.0


