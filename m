Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80413CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhI1dr6jijKSPxyrQzWgADDBwPMWKkN3nQrw+HmubJM=; b=dhz49JYv1pD8gVLiD10mZhkx2V
	IHu49Cagvnz2gX0T+4NfJnRwAI1csb2LViqoXiRoLGsZ941X0Y20Ct+uqTvz0zB8BrvB5rDrDA9/2
	lMqmXegzdjGR8dOmh7ZCWHj28D2uuVXjTTcfpg4qrTJu7lgpqnJIvyRlUwBneiSVZJW3juluIlA5V
	XR9iC2OzrrlDi/vHjS4qIHn3yjNO0snPrBNOgLU0SGZn+zAKYg+sVC43zOFV34nJJQmdH9CA20DaQ
	RfUwRGXtFqXfAUsrnEDalT6h7iL6ikqJo4tnw8kBnGeZL3Hgv0fDOtS+R3flM5NiFlHJMch6h6fN3
	coYFOLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWeA-000000001Fc-29KO;
	Wed, 06 May 2026 07:26:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWe9-000000001Ez-0Cwy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778052376; x=1809588376;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=p4pAZ0/fok0BwxIaJ58/y4fEjxsVXXl/HmXllQWn8+4=;
  b=UB+FesavpPOt5hHbmI8nEsipdsR0MhKN0kDaKEjH6/zWK0QQiVwa9BkY
   Kckr+gPvDc0DBM3JDiVCx+G9mNrd2HwEPH3GP0QFA+xmtTA0SKcz5yiFs
   0xAgGwwVo8QEVLyrNCpMxt9S6BOULWDrGbIg5g7ZgOmWkmbcDswAPQuun
   WaO4eK43AmosSl8PMXMfhWsX0+2vcBrpIKjjWo4WXsywKWxfabfvBV4C8
   AKUZrHBgHWe1a69bnv7GytVTZSsRnR7WMdYF8aTqCnHP8jlTLceORIEdm
   3kXoOc1xEAbyGt8Yzu5wCHv3HdsUhvTod2PgasvcaBiGEdeSVc0wi7UNz
   w==;
X-CSE-ConnectionGUID: aytPD8RyTQSa+hCeH27eTA==
X-CSE-MsgGUID: xUSBkdGQR/+QHPXKO4BH+Q==
X-IronPort-AV: E=Sophos;i="6.23,219,1770620400"; 
   d="scan'208";a="57105539"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 00:26:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 6 May 2026 00:26:15 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 6 May 2026 00:26:11 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 6 May 2026 09:25:37 +0200
Subject: [PATCH net v2 2/4] net: sparx5: fix sleep in atomic context in MAC
 table access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260506-misc-fixes-sparx5-lan969x-v2-2-fb236aa96908@microchip.com>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
In-Reply-To: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_002617_106587_84F7D754 
X-CRM114-Status: GOOD (  13.57  )
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

sparx5_set_rx_mode() runs with netif_addr_lock_bh held and iterates
dev->mc via __dev_mc_sync(), which per address calls sparx5_mc_sync() /
sparx5_mc_unsync() -> sparx5_mact_learn() / sparx5_mact_forget().  These
take sparx5->lock, a mutex, and then poll the MAC access command
register with readx_poll_timeout(). A mutex may block, which is not
allowed from atomic context.

Convert the driver to the new .ndo_set_rx_mode_async callback introduced
in commit 3554b4345d85 ("net: introduce ndo_set_rx_mode_async and
netdev_rx_mode_work"). The async callback is invoked from process
context, so the mutex and sleeping completion poll can remain.

Observed with CONFIG_PROVE_LOCKING, CONFIG_DEBUG_SPINLOCK,
CONFIG_DEBUG_MUTEXES and CONFIG_DEBUG_ATOMIC_SLEEP enabled:

  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 217, name: ip
  preempt_count: 201, expected: 0
  Call trace:
   __might_resched+0x144/0x248
   __might_sleep+0x48/0x7c
   __mutex_lock+0x74/0x850
   mutex_lock_nested+0x24/0x30
   sparx5_mact_learn+0x78/0x100
   sparx5_mc_sync+0x40/0x54
   __hw_addr_sync_dev+0xc4/0x170
   sparx5_set_rx_mode+0x4c/0x58
   __dev_set_rx_mode+0x64/0xa4
   __dev_open+0x1ec/0x26c

Fixes: b37a1bae742f ("net: sparx5: add mactable support")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
index 1d34af78166a..1061874c9edc 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
@@ -162,13 +162,15 @@ static int sparx5_port_stop(struct net_device *ndev)
 	return 0;
 }
 
-static void sparx5_set_rx_mode(struct net_device *dev)
+static void sparx5_set_rx_mode(struct net_device *dev,
+			       struct netdev_hw_addr_list *uc,
+			       struct netdev_hw_addr_list *mc)
 {
 	struct sparx5_port *port = netdev_priv(dev);
 	struct sparx5 *sparx5 = port->sparx5;
 
 	if (!test_bit(port->portno, sparx5->bridge_mask))
-		__dev_mc_sync(dev, sparx5_mc_sync, sparx5_mc_unsync);
+		__hw_addr_sync_dev(mc, dev, sparx5_mc_sync, sparx5_mc_unsync);
 }
 
 static int sparx5_port_get_phys_port_name(struct net_device *dev,
@@ -249,7 +251,7 @@ static const struct net_device_ops sparx5_port_netdev_ops = {
 	.ndo_open               = sparx5_port_open,
 	.ndo_stop               = sparx5_port_stop,
 	.ndo_start_xmit         = sparx5_port_xmit_impl,
-	.ndo_set_rx_mode        = sparx5_set_rx_mode,
+	.ndo_set_rx_mode_async  = sparx5_set_rx_mode,
 	.ndo_get_phys_port_name = sparx5_port_get_phys_port_name,
 	.ndo_set_mac_address    = sparx5_set_mac_address,
 	.ndo_validate_addr      = eth_validate_addr,

-- 
2.34.1


